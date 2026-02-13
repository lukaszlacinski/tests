from django.contrib import admin
from django.urls import include, path

from core.views import logout_view


urlpatterns = [
    path("admin/", admin.site.urls),
    path("", include("core.urls")),
    path("auth/", include("social_django.urls", namespace="social")),
    path("logout/", logout_view, name="logout"),
    path("logout", logout_view),
]
