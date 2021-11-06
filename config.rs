extern crate capnp;

pub mod config_model_capnp {
  include!("config_model_capnp.rs");
}

pub mod config {
    use crate::config_model_capnp::config;
    use capnp::serialize_packed;

    pub fn save() -> Result<(), std::io::Error> {
        let mut message = ::capnp::message::Builder::new_default();
        {
            let config = message.init_root::<config::Builder>();
            let mut items = config.init_items(1);
            items.set(0, "purpose");
        }
        serialize_packed::write_message(&mut ::std::io::stdout(), &message)
    }

    pub fn load() -> ::capnp::Result<()> {
        let stdin = ::std::io::stdin();
        let message_reader = serialize_packed::read_message(&mut stdin.lock(),
                                                            ::capnp::message::ReaderOptions::new())?;
        let config = message_reader.get_root::<config::Reader>()?;
        for item in config.get_items()?.iter() {
            println!("{}", item?);
        }
        Ok(())
    }
}

pub fn main() {
    let args : Vec<String> = ::std::env::args().collect();
    if args.len() < 2 {
        println!(
          "usage: $ {} [save | load]", args[0]);
    } else {
        match &*args[1] {
            "save" => config::save().unwrap(),
            "load" =>  config::load().unwrap(),
            _ => {println!("unrecognized argument") }
        }
    }
} 
