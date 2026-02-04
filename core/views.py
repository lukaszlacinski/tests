from django.shortcuts import render


def home(request):
    token_data = None
    if request.user.is_authenticated:
        try:
            social_auth = request.user.social_auth.get(provider="globus")
            extra_data = social_auth.extra_data or {}
            token_data = {
                "access_token": extra_data.get("access_token"),
                "expires_in": extra_data.get("expires_in"),
                "token_type": extra_data.get("token_type"),
                "scope": extra_data.get("scope"),
            }
        except request.user.social_auth.model.DoesNotExist:
            token_data = None

    return render(request, "home.html", {"token_data": token_data})
