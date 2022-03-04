import React from "react";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import { Login } from "../screens";
const NativeStack = createNativeStackNavigator();

function StackNavigator() {
  return (
    <NativeStack.Navigator screenOptions={{headerShown:false}}>
      <NativeStack.Screen name="Login" component={Login} />
    </NativeStack.Navigator>
  );
}

export default StackNavigator;
