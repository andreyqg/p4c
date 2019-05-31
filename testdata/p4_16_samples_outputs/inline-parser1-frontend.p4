#include <core.p4>
#include <v1model.p4>

header data_t {
    bit<8> f;
}

struct headers_t {
    data_t data1;
    data_t data2;
}

struct user_metadata_t {
}

parser MyParser(packet_in pkt, out headers_t hdr, inout user_metadata_t md, inout standard_metadata_t smd) {
    state start {
        transition SubParser_start;
    }
    state SubParser_start {
        transition start_0;
    }
    state start_0 {
        transition accept;
    }
}

control MyIngress(inout headers_t hdr, inout user_metadata_t md, inout standard_metadata_t smd) {
    apply {
    }
}

control MyEgress(inout headers_t hdr, inout user_metadata_t md, inout standard_metadata_t smd) {
    apply {
    }
}

control MyDeparser(packet_out pkt, in headers_t hdr) {
    apply {
    }
}

control MyVerifyChecksum(inout headers_t hdr, inout user_metadata_t md) {
    apply {
    }
}

control MyComputeChecksum(inout headers_t hdr, inout user_metadata_t md) {
    apply {
    }
}

V1Switch<headers_t, user_metadata_t>(MyParser(), MyVerifyChecksum(), MyIngress(), MyEgress(), MyComputeChecksum(), MyDeparser()) main;

