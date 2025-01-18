from django.urls import re_path
from . import views

from django.conf import settings
from django.conf.urls.static import static

urlpatterns=[
    re_path(r'^$', views.home, name='home'),
    re_path(r'^home/$',views.index,name='index'),
    re_path(r'^new/image$', views.new_image, name='new-image'),
    re_path(r'^profile/$',views.profile,name='profile'),
    re_path(r'^search/', views.search_results, name='search_results'),
    re_path(r'^comment/(?P<image_id>\d+)', views.comment, name='comment'),
    re_path(r'^profiles/(\d+)',views.profiles,name='profiles'),
    re_path(r'^signup/$', views.signup, name='signup'),
    re_path(r'activate/<uidb64>/<token>/', views.activate, name='activate'),

]
if settings.DEBUG:
    urlpatterns+= static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)