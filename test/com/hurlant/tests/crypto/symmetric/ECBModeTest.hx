/**
 * ECBModeTest
 *
 * A test class for ECBMode
 * Copyright (c) 2007 Henri Torgemane
 *
 * See LICENSE.txt for full license information.
 */
package com.hurlant.tests.crypto.symmetric;


import com.hurlant.tests.*;

import com.hurlant.crypto.symmetric.AESKey;
import com.hurlant.crypto.symmetric.mode.ECBMode;
import com.hurlant.crypto.pad.NullPad;
import com.hurlant.crypto.symmetric.XTeaKey;
import com.hurlant.util.Hex;

import com.hurlant.util.ByteArray;

class ECBModeTest extends BaseTestCase {
    /**
     * For now the main goal is to show we can decrypt what we encrypt in this mode.
     * Eventually, this should get correlated with some well known vectors.
     * yay. found hawt test vectors: http://csrc.nist.gov/publications/nistpubs/800-38a/sp800-38a.pdf
     */
    public function test_aes128() {
        var key:ByteArray = Hex.toArray("2b7e151628aed2a6abf7158809cf4f3c");
        var pt:ByteArray = Hex.toArray(
            "6bc1bee22e409f96e93d7e117393172a" +
            "ae2d8a571e03ac9c9eb76fac45af8e51" +
            "30c81c46a35ce411e5fbc1191a0a52ef" +
            "f69f2445df4f9b17ad2b417be66c3710"
        );
        var ct:ByteArray = Hex.toArray(
            "3ad77bb40d7a3660a89ecaf32466ef97" +
            "f5d3d58503b9699de785895a96fdbaaf" +
            "43b1cd7f598ece23881b00e3ed030688" +
            "7b0c785e27e8ad3f8223207104725dd4"
        );
        var ecb = new ECBMode(new AESKey(key), new NullPad());
        var src = pt.clone();
        ecb.encrypt(src);
        assert(Hex.fromArray(src), Hex.fromArray(ct));
        ecb.decrypt(src);
        assert(Hex.fromArray(src), Hex.fromArray(pt));
    }


    public function test_aes192() {
        var key = Hex.toArray("8e73b0f7da0e6452c810f32b809079e562f8ead2522c6b7b");
        var pt = Hex.toArray(
            "6bc1bee22e409f96e93d7e117393172a" +
            "ae2d8a571e03ac9c9eb76fac45af8e51" +
            "30c81c46a35ce411e5fbc1191a0a52ef" +
            "f69f2445df4f9b17ad2b417be66c3710"
        );
        var ct = Hex.toArray(
            "bd334f1d6e45f25ff712a214571fa5cc" +
            "974104846d0ad3ad7734ecb3ecee4eef" +
            "ef7afd2270e2e60adce0ba2face6444e" +
            "9a4b41ba738d6c72fb16691603c18e0e"
        );
        var ecb = new ECBMode(new AESKey(key), new NullPad());
        var src = new ByteArray();
        src.writeBytes(pt);
        ecb.encrypt(src);
        assert(Hex.fromArray(src), Hex.fromArray(ct));
        ecb.decrypt(src);
        assert(Hex.fromArray(src), Hex.fromArray(pt));
    }

    public function test_aes256() {
        var key = Hex.toArray("603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4");
        var pt = Hex.toArray(
            "6bc1bee22e409f96e93d7e117393172a" +
            "ae2d8a571e03ac9c9eb76fac45af8e51" +
            "30c81c46a35ce411e5fbc1191a0a52ef" +
            "f69f2445df4f9b17ad2b417be66c3710"
        );
        var ct = Hex.toArray(
            "f3eed1bdb5d2a03c064b5a7e3db181f8" +
            "591ccb10d410ed26dc5ba74a31362870" +
            "b6ed21b99ca6f4f9f153e7b1beafed1d" +
            "23304b7a39f9f3ff067d8d8f9e24ecc7"
        );
        var ecb = new ECBMode(new AESKey(key), new NullPad());
        var src = new ByteArray();
        src.writeBytes(pt);
        ecb.encrypt(src);
        assert(Hex.fromArray(src), Hex.fromArray(ct));
        ecb.decrypt(src);
        assert(Hex.fromArray(src), Hex.fromArray(pt));
    }

    // crappier, older testing. keeping around for no good reason.

    public function test_aes() {
        var keys = [
            "00010203050607080A0B0C0D0F101112",
            "14151617191A1B1C1E1F202123242526"
        ];
        var pts = [
            "506812A45F08C889B97F5980038B8359506812A45F08C889B97F5980038B8359506812A45F08C889B97F5980038B8359",
            "5C6D71CA30DE8B8B00549984D2EC7D4B5C6D71CA30DE8B8B00549984D2EC7D4B5C6D71CA30DE8B8B00549984D2EC7D4B"
        ];
        var cts = [
            "D8F532538289EF7D06B506A4FD5BE9C9D8F532538289EF7D06B506A4FD5BE9C9D8F532538289EF7D06B506A4FD5BE9C96DE5F607AB7EB8202F3957703B04E8B5",
            "59AB30F4D4EE6E4FF9907EF65B1FB68C59AB30F4D4EE6E4FF9907EF65B1FB68C59AB30F4D4EE6E4FF9907EF65B1FB68C2993487785CB1CFDA6BB4F0F345F76C7"
        ];

        for (i in 0...keys.length) {
            var key = Hex.toArray(keys[i]);
            var pt = Hex.toArray(pts[i]);
            var aes = new AESKey(key);
            var ecb = new ECBMode(aes);
            ecb.encrypt(pt);
            var str = Hex.fromArray(pt).toUpperCase();
            assert(cts[i], str);
            // back to pt
            ecb.decrypt(pt);
            str = Hex.fromArray(pt).toUpperCase();
            assert(pts[i], str);
        }
    }

    public function test_xtea() {
        var keys = [
            "00000000000000000000000000000000",
            "2b02056806144976775d0e266c287843"
        ];
        var pts = [
            "0000000000000000000000000000000000000000000000000000000000000000",
            "74657374206d652e74657374206d652e74657374206d652e74657374206d652e"
        ];
        var cts = [
            "2dc7e8d3695b05382dc7e8d3695b05382dc7e8d3695b05382dc7e8d3695b053820578a874233632d",
            "79095821381987837909582138198783790958213819878379095821381987830e4dc3c48b2edf32"
        ];

        // self-fullfilling vectors.
        // oh well, at least I can decrypt what I produce. :(

        for (i in 0...keys.length) {
            var key = Hex.toArray(keys[i]);
            var pt = Hex.toArray(pts[i]);
            var tea = new XTeaKey(key);
            var ecb = new ECBMode(tea);
            ecb.encrypt(pt);
            var str = Hex.fromArray(pt);
            assert(cts[i], str);
            // now go back to plaintext.
            ecb.decrypt(pt);
            str = Hex.fromArray(pt);
            assert(pts[i], str);
        }
    }
}


