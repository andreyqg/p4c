control p(inout bit<1> bt) {
    @name("y0_0") bit<1> y0;
    @name("tmp") bit<1> tmp_0;
    @name("y0_1") bit<1> y0_2;
    @name("b") action b_0() {
        @name("a") {
            y0 = bt;
            tmp_0 = y0 | 1w1;
            y0 = tmp_0;
            bt = y0;
        }
        @name("a") {
            y0_2 = bt;
            tmp_0 = y0_2 | 1w1;
            y0_2 = tmp_0;
            bt = y0_2;
        }
    }
    @name("t") table t() {
        actions = {
            b_0();
        }
        default_action = b_0();
    }
    apply {
        t.apply();
    }
}

control simple<T>(inout T arg);
package m<T>(simple<T> pipe);
m<bit<1>>(p()) main;