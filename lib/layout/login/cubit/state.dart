

import '../../../models/login model.dart';

abstract class login_states {}

class reg_intial_state extends login_states{}
class reg_loading_state extends login_states{}
class reg_success_state extends login_states{
  // login_model? loginmodel;
  // login_success_state(this.loginmodel);
}

class reg_fail_state extends login_states{
  final String error;

  reg_fail_state(this.error);
}


class login_intial_state extends login_states{}
class login_loading_state extends login_states{}
class login_success_state extends login_states{
  // login_model? loginmodel;
  String? id;
  login_success_state({ this.id});
  // login_success_state(this.loginmodel);
}

class login_fail_state extends login_states{
  final String error;

  login_fail_state(this.error);
}


class create_user_loading_state extends login_states{}
class create_user_success_state extends login_states{
  // login_model? loginmodel;
  // login_success_state(this.loginmodel);
}

class create_user_fail_state extends login_states{
  final String error;

  create_user_fail_state(this.error);
}

class chang_pass_state extends login_states{}


class update_loading_state extends login_states{}
class update_data_success_state extends login_states{
  login_model? updatemodel;
  update_data_success_state(this.updatemodel);
}

class update_data_fail_state extends login_states{
  final String error;

  update_data_fail_state(this.error);
}

