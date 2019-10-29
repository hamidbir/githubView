class DUser {
  final String name;
  final String avatarurl;
  final String htmlurl;
  final String company;
  final String blog;
  final String email;
  final String bio;
  final String location;
  final int repos;
  final int followers;
  final int following;
  DUser(
      {this.name,
      this.avatarurl,
      this.htmlurl,
      this.company,
      this.blog,
      this.email,
      this.bio,
      this.location,
      this.repos,
      this.followers,
      this.following});
      factory DUser.fromJson(Map<String,dynamic> json){
        return DUser(
          name: json['login'],
          avatarurl: json['avatar_url'],
          htmlurl: json['html_url'],
          company: json['company'],
          blog: json['blog'],
          email: json['email'],
          bio: json['bio'],
          repos: json['public_repos'],
          followers: json['followers'],
          following: json['following'],
        );



      }
}
