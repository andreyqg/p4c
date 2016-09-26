control p() {
    @name("z") bit<1> z;
    @name("x_0") bit<1> x_0;
    @name("x_1") bit<1> x_1;
    @name("y_0") bit<1> y_0;
    @name("tmp") bit<1> tmp_2;
    @name("tmp_0") bit<1> tmp_3;
    @name("tmp_1") bit<1> tmp_4;
    @name("x") bit<1> x_2;
    @name("y") bit<1> y_1;
    @name("b") action b_0() {
        x_2 = tmp_3;
        x_0 = x_2;
        tmp_2 = x_2 & x_0;
        z = tmp_2;
        tmp_4 = y_1;
    }
    action act() {
        tmp_3 = x_1;
    }
    action act_0() {
        y_0 = tmp_4;
    }
    table tbl_act() {
        actions = {
            act();
        }
        const default_action = act();
    }
    table tbl_b() {
        actions = {
            b_0();
        }
        const default_action = b_0();
    }
    table tbl_act_0() {
        actions = {
            act_0();
        }
        const default_action = act_0();
    }
    apply {
        tbl_act.apply();
        tbl_b.apply();
        tbl_act_0.apply();
    }
}

control simple();
package m(simple pipe);
.m(.p()) main;