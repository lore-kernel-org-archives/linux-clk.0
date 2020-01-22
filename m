Return-Path: <SRS0=3pyO=3L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4423AC32771
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 06:44:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D82C2465A
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 06:44:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgAVGoP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Jan 2020 01:44:15 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:64732 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbgAVGoP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Jan 2020 01:44:15 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-4c-5e27ef3d4744
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 33.38.08102.D3FE72E5; Wed, 22 Jan 2020 07:44:13 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Wed, 22 Jan 2020 07:44:09 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-gpio@ger.kernel.org" <linux-gpio@ger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v13 00/11] Support ROHM BD71828 PMIC
Thread-Topic: [PATCH v13 00/11] Support ROHM BD71828 PMIC
Thread-Index: AQHVz5cqdcXL24/7G02IFCD76W21L6fzgmcAgAAHbgCAAX6sAIABJjkA
Date:   Wed, 22 Jan 2020 06:44:06 +0000
Message-ID: <9609ad80c432360a5b6dd41c32ac2a249973863b.camel@fi.rohmeurope.com>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
         <20200120135446.GD6852@sirena.org.uk>
         <70ac7b71d5d54d4b90ded032214c473569b9fae1.camel@fi.rohmeurope.com>
         <20200121131100.GB4656@sirena.org.uk>
In-Reply-To: <20200121131100.GB4656@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A00D6CF821472246A702C0A57C10946F@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SW0gUURjmzMzuHi8Tx/WyJ7tAA2Y3tU2DLTR8iNh6KLNeDHIdc3Ild1dm
        V0uhsNLSzcIiqZak8FpS2HrBC0oqlpuBReRGatamVlpqYWVWWDM73p7mm+/yfz+cH5LKs/JA
        mGK0cLyRTWXknlTbnT/2kKjJ4PjNFa9CNEWuYbnm7Y9HQHP1byWh+VYwKNMUFnTKNDfLHZRm
        1mmnohXayj47oW2yvVFoa6ry5doBZ4tcO1WzOkZ2yCsykbVkHEhJNobtSPDSdzVmk2mPVSe+
        5A2DbPArwAo8IEYReNBZIbMCT6hEvQC3FQ3P/TgAbhq5SFgBhHIUia2vFWLAD4Xgot+lctFD
        ojYCv/x63e3xRRr8uSBD8mzDxbN1MgnvwhV5LW5MoSA8lFspFzGN9uK6nmo3r0QDALdep0Ts
        gbbgptpbbh6gVTg/e4IQMYlUuObDtExaGuGylmekhP3x6NDsHM/g1hkXJa5DovW4ujlMikbj
        yskWSsJr8NULLoW0gg9+cmOYKgQBtiUNtsW0bUnatiRtW5K+DWRVABvYlNRk1sKpQ3kuPZQ3
        6Q3C54jJUAOkR/3eCP517O4ABAQdYDkkGH+6whEcr1yWaErK1LNmvY5PT+XMHQBDkvGjb58J
        ilfSSWxmFseb5qUVkGJUdLDr8mElEruOcVwax8+rKyFkMJ0wLgz14blk7sTRlFTLokxAD3G4
        Z6CfmTMmcTybbtHrxPPQmYX7ECVvoTdiQojT5jTWILBStBtshIWjxSUk7CwuLyGVlNFk5AJV
        dLJoRaJVn25cKBoDKggYX/qBqHoLl70wZ0yoIISK45vWihUWdlEKzAZbQ58X5lyaaP90sj9O
        EXsmLkql693tnOl6WnJtqEd9LqvTfj8nxpGhizgfdba9eOpn2Z7+9zvrS9s+ejH+5SPvYvpg
        fT4ZUnul4VSnNxfwMHd6++cydc/PiHvh43ft6hcNzafWzbRzhCucq57+EXt628FBNNLF090m
        7b79qvIkB0OZ9ax6A8mb2f/8fO7llgMAAA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DQpPbiBUdWUsIDIwMjAtMDEtMjEgYXQgMTM6MTEgKzAwMDAsIE1hcmsgQnJvd24gd3JvdGU6DQo+
IE9uIE1vbiwgSmFuIDIwLCAyMDIwIGF0IDAyOjIxOjA5UE0gKzAwMDAsIFZhaXR0aW5lbiwgTWF0
dGkgd3JvdGU6DQo+ID4gT24gTW9uLCAyMDIwLTAxLTIwIGF0IDEzOjU0ICswMDAwLCBNYXJrIEJy
b3duIHdyb3RlOg0KPiA+ID4gc3RvcCBzZW5kaW5nIG1lIHRoaXMgc2VyaWVzIHVudGlsIHRoZSBN
RkQgaGFzIGJlZW4gbWVyZ2VkLA0KPiA+ID4gcGVyaGFwcw0KPiA+ID4ganVzdA0KPiA+ID4gZHJv
cCB0aGUgc3Vic3lzdGVtIHBhdGNoZXMgd2hpbGUgeW91IHJlc29sdmUgd2hhdGV2ZXIgdGhlDQo+
ID4gPiBwcm9ibGVtcw0KPiA+ID4gYXJlDQo+ID4gPiB0aGF0IHJlbWFpbiB3aXRoIHRoZSBNRkQ/
ICBJJ20gcHJldHR5IG11Y2gganVzdCBkZWxldGluZyB0aGVzZQ0KPiA+IEkgd2FzIGhvcGluZyB0
aGUgcmV2aXNpb24gaGlzdG9yeSBpbiBjb3ZlciBsZXR0ZXIgd291bGQgYmUgYSBmYXN0DQo+ID4g
d2F5DQo+ID4gdG8gZGV0ZXJtaW5lIGlmIHNvbWV0aGluZyByZWxldmFudCBoYXMgY2hhbmdlZC4g
QWRkaXRpb25hbGx5LCBJIGRpZA0KPiA+IHRyeQ0KPiANCj4gQWxsIEknbSBsb29raW5nIGF0IG1v
c3RseSBpcyB0byBzZWUgaWYgbXkgQWNrZWQtYnkgdGFnIHdlbnQgYXdheSBkdWUNCj4gdG8NCj4g
Y2hhbmdlcywgSSBtaWdodCBsb29rIGF0IHRoZSByZXN0IG9mIGEgc2VyaWVzIGlmIEkgaGF2ZSB0
aW1lIGJ1dCBpZg0KPiBJJ3ZlDQo+IGNoZWNrZWQgdGhlIGJpdCB0aGF0J3MgcmVsZXZhbnQgdG8g
bWUgSSdtIG5vdCBnb2luZyB0byB3b3JyeSB0b28gbXVjaA0KPiBhYm91dCB0aGUgcmVzdCBvZiBp
dC4NCj4gDQo+ID4gQnV0IHN1cmUsIEkgc2hvdWxkIHRyeSB0byBiZSBtb3JlIGNhcmVmdWwgc28g
dGhhdCBJIGRvbid0IG5lZWQgdG8NCj4gPiBkbyBzbw0KPiA+IG1hbnkgcmVzZW5kcyAtIGFuZCBJ
IHJlYWxseSBjb3VsZCBkcm9wIG1vc3Qgb2YgdGhlIHJlY2lwaWVudHMNCj4gPiBlYXJsaWVyLg0K
PiA+IFRoYW5rcyBmb3IgcG9pbnRpbmcgaXQgb3V0Lg0KPiANCj4gV2hhdCBJIHdhcyBzdWdnZXN0
aW5nIHdhcyBtb3JlIGp1c3QgZHJvcHBpbmcgdGhlIGRyaXZlciBiaXRzIHdoaWxlDQo+IHRoZQ0K
PiBNRkQgZ2V0cyByZXNvbHZlZCwgSSdtIG5ldmVyIDEwMCUgc3VyZSB3aHkgYnV0IHRoZSBjb3Jl
IE1GRCBvZnRlbg0KPiB0YWtlcw0KPiBhIGxvbmcgdGltZSB0byBmaWd1cmUgb3V0IGFzIHNlZW1z
IHRvIGJlIHRoZSBjYXNlIGhlcmUuICBUaGVyZSBtaWdodA0KPiBiZQ0KPiBhcyBtYW55IGluZGl2
aWR1YWwgcmVzZW5kcyBvdmVyYWxsIGJ1dCBlYWNoIG1haW50YWluZXIgd2lsbCBzZWUgZmV3ZXIN
Cj4gb2YNCj4gdGhlbS4NCg0KSG1tLiBJIGNhbiBkbyB0aGF0IGFzIHdlbGwgLSBvciBqdXN0IHJl
c2VuZCB0aGUgY292ZXItbGV0dGVyICsgY2hhbmdlZA0KcGF0Y2hlcyB1bnRpbGwgSSBnZXQgYWxs
IHRoZSBhY2tzIGFuZCB0aGVuIGRvIHNlbmQgdGhlIChob3BlZnVsbHkpDQonZmluYWwnIHZlcnNp
b24gd2l0aCBhbGwgcGF0Y2hlcyBmb3IgbWVyZ2luZy4gQnV0IHRoaXMgbmVlZHMgdG8gd29yaw0K
Zm9yIExlZSB0b28uIEkgY291bGQgYWxzbyBhZGQgcmVjaXBpZW50cyBtYW51YWxseSBwZXIgcGF0
Y2ggc28gdGhhdCB0aGUNCndob2xlIHNlcmllcyB3b3VsZCBub3QgYmUgc2VudCB0byBhbGwgLSBp
bnRlcmVzdGVkIHBlcnNvbnMgY2FuIGFsd2F5cw0KYXNrIG1lIHRvIGluY2x1ZGUgdGhlbSB0byB0
aGUgd2hvbGUgc2VyaWVzIC0gb3IgbG9vayBpdCB1cCBmcm9tDQpsb3JlLmtlcm5lbC5vcmcgLSB3
aGF0IGV2ZXIgd29ya3MgYmVzdCB3aXRoIHlvdSBndXlzLiBCdXQgSSBuZWVkIGNvbW1vbg0KdW5k
ZXJzdGFuZGluZyBmcm9tIHlvdSByZWdhcmRpbmcgd2hhdCBpcyB0aGUgYmVzdCB3YXkuDQoNCkkg
YmVsaWV2ZSBJIHdpbGwgaW5pdGlhdGUgdGhlIG5leHQgbmV3IFJPSE0gUE1JQyBwYXRjaCBzZXJp
ZXMgc29tZXdoZXJlDQpuZWFyIHN1bW1lciAtIGFuZCBwb3NzaWJseSBhIGNoYXJnZXIgY2hpcCBz
ZXJpZXMgYmVmb3JlIHRoYXQuIEkgd2lsbA0KdHJ5IHRvIGNoYW5nZSBteSB3YXlzIGZvciB0aG9z
ZSBpZiB5b3Ugd2lsbCBmaW5kIGEgY29tbW9uIHVuZGVyc3RhbmRpbmcNCnJlZ2FyZGluZyB0aGUg
YmVzdCB3YXkuDQoNCkJlc3QgcmVnYXJkcw0KCU1hdHRpDQo=
