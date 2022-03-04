import React from "react";
import { ImageBackground, Text, View, StyleSheet } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import {
  Button,
  TextInput,
  HelperText,
  Caption,
  Headline,
} from "react-native-paper";

function Login() {
  return (
    // <SafeAreaView style={{ flex: 1 }}>
    <ImageBackground
      imageStyle={{ width: "100%", aspectRatio: 1 }}
      style={styles.container}
      source={require("../assets/images/background.png")}
    >
      <View style={styles.form}>
        <Headline style={{ color: "#2F80ED" }}>Login</Headline>
        <Caption style={styles.text}>Email</Caption>
        <TextInput
          outlineColor="#2F80ED"
          activeOutlineColor="#2F80ED"
          style={{ height: 40, borderColor: "#2F80ED" }}
          mode="outlined"
        />
        <Caption>Password</Caption>
        <TextInput
          outlineColor="#2F80ED"
          activeOutlineColor="#2F80ED"
          style={{ height: 40, borderColor: "#2F80ED" }}
          mode="outlined"
        />
        <Caption style={{ color: "#fff", alignSelf: "flex-end" }}>
          Forgot Password?
        </Caption>
        <View style={styles.row}>
          <Button icon="google"></Button>
          <Button icon="facebook"></Button>
          <Button icon="apple"></Button>
        </View>
        <View
          style={[
            styles.row,
            { justifyContent: "space-between", marginBottom: 10 },
          ]}
        >
          <Caption style={{ color: "#fff" }}>New here? Register</Caption>
          <Button mode="outlined" style={{ borderColor: "#fff" }} color="#fff">
            Login
          </Button>
        </View>
      </View>
    </ImageBackground>
    // </SafeAreaView>
  );
}

export default Login;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "flex-end",
  },
  form: {
    width: "90%",
    backgroundColor: "transparent",
    // marginBottom:'40%',
  },
  row: {
    flexDirection: "row",
    // marginBottom: 10,
    alignItems: "flex-end",
  },
  text: {
    color: "#2F80ED",
  },
});
