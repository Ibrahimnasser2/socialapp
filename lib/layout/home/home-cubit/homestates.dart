


abstract class home_states {}

class home_intial_state extends home_states{}

class getusers_loading_data_state extends home_states{}
class  getusers_success_data_state extends home_states{

}

class getusers_fail_data_state extends home_states{
  final String error;

  getusers_fail_data_state(this.error);
}

class  newpostpage_success_data_state extends home_states{

}


class  getprofileimage_success_data_state extends home_states{

}
class  getprofileimage_fail_data_state extends home_states{

}
class  getcoverimage_success_data_state extends home_states{

}
class  getcoverimage_fail_data_state extends home_states{

}




class changehome_state extends home_states {}




