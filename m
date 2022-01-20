Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9E3C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jan 2022 12:31:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242487AbiATMb5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jan 2022 07:31:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242545AbiATMbn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jan 2022 07:31:43 -0500
X-Greylist: delayed 502 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 20 Jan 2022 04:31:42 PST
Received: from mx2.securetransport.de (mx2.securetransport.de [IPv6:2a03:4000:13:6c7::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF1E2C061574
        for <linux-clk@vger.kernel.org>; Thu, 20 Jan 2022 04:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
        s=dhelectronicscom; t=1642681412;
        bh=cjP1hY/gV6YI+gSva1g8dPyS/nmv5JYe3LAPaeC17Hk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=OP3b4icjGxSyzvXTdlJniHzinTA1Gf42AT0/x/Es7MDpZ0PHzqCPPfOO3naV9YDMw
         T/EzdPiIu8fsHUbINNqoqowyaIWlXd9sRFulcP/EACUpChSg6sC6gtO19CN6MzFUBz
         Ce/jgR2JA2n6or0kWVmNNI8iucWKRWhDvefNYMLVNW4c+X3x/K6KOoOJNxld6LUyHW
         F2c4FLNzVQvT/gRqre81jTOcfwWVso6pHJ0S/1ekvrnEeCaY2S2UtKwJso16VlrdTx
         yJj4LURKjbm7vl7rUkxKlXEg7gZSzkRv8l0/hCHlW012SpSYmFQcu/XXWi8XgLMnZJ
         p0j32DBc5T6cA==
X-secureTransport-forwarded: yes
From:   Johann Neuhauser <jneuhauser@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To:     "Marek MV. Vasut" <marex@denx.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     "Marek MV. Vasut" <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: RE: [PATCH 5/5] ARM: dts: stm32: Switch DWMAC RMII clock to MCO2 on
 DHCOM
Thread-Topic: [PATCH 5/5] ARM: dts: stm32: Switch DWMAC RMII clock to MCO2 on
 DHCOM
Thread-Index: AQHYDKoxtzPgICVgbEyNJNP9H9TX9Kxr02Ow
Date:   Thu, 20 Jan 2022 12:08:13 +0000
Message-ID: <5dde4cf58557485790bb7c14497e8cd1@dh-electronics.com>
References: <20220118202958.1840431-1-marex@denx.de>
 <20220118202958.1840431-5-marex@denx.de>
In-Reply-To: <20220118202958.1840431-5-marex@denx.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBNYXJlayBWYXN1dCBbbWFpbHRvOm1hcmV4QGRlbnguZGVdDQo+IFNlbnQ6IFR1ZXNk
YXksIEphbnVhcnkgMTgsIDIwMjIgOTozMCBQTQ0KPiANCj4gVGhlIERIQ09NIFNvTSBoYXMgdHdv
IG9wdGlvbnMgZm9yIHN1cHBseWluZyBFVEhSWCBjbG9jayB0byB0aGUgRFdNQUMNCj4gYmxvY2sg
YW5kIFBIWS4gRWl0aGVyICgxKSBFVEhDS19LIGdlbmVyYXRlcyA1MCBNSHogY2xvY2sgb24gRVRI
X0NMSw0KPiBwYWQgZm9yIHRoZSBQSFkgYW5kIHRoZSBzYW1lIDUwIE1IeiBjbG9jayBhcmUgZmVk
IGJhY2sgdG8gRVRIUlggdmlhDQo+IGludGVybmFsIGV0aF9jbGtfZmIgY2xvY2sgY29ubmVjdGlv
biBPUiAoMikgRVRIX0NMSyBpcyBub3QgdXNlZCBhdA0KPiBhbGwsIE1DTzIgZ2VuZXJhdGVzIDUw
IE1IeiBjbG9jayBvbiBNQ08yIG91dHB1dCBwYWQgZm9yIHRoZSBQSFkgYW5kDQo+IHRoZSBzYW1l
IE1DTzIgY2xvY2sgYXJlIGZlZCBiYWNrIGludG8gRVRIUlggdmlhIEVUSF9SWF9DTEsgaW5wdXQg
cGFkDQo+IHVzaW5nIGV4dGVybmFsIHBhZC10by1wYWQgY29ubmVjdGlvbi4NCj4gDQo+IE9wdGlv
biAoMSkgaGFzIHR3byBkb3duc2lkZXMuIEVUSENLX0sgaXMgc3VwcGxpZWQgZGlyZWN0bHkgZnJv
bSBlaXRoZXINCj4gUExMM19RIG9yIFBMTDRfUCwgaGVuY2UgdGhlIFBMTCBvdXRwdXQgaXMgbGlt
aXRlZCB0byBleGFjdGx5IDUwIE1IeiBhbmQNCj4gc2luY2UgdGhlIHNhbWUgUExMIG91dHB1dCBp
cyBhbHNvIHVzZWQgdG8gc3VwcGx5IFNETU1DIGJsb2NrcywgdGhlDQo+IHBlcmZvcm1hbmNlIG9m
IFNEIGFuZCBlTU1DIGFjY2VzcyBpcyBhZmZlY3RlZC4gVGhlIHNlY29uZCBkb3duc2lkZSBpcw0K
PiB0aGF0IHVzaW5nIHRoaXMgb3B0aW9uLCB0aGUgRU1JIG9mIHRoZSBTb00gaXMgaGlnaGVyLg0K
PiANCj4gT3B0aW9uICgyKSBzb2x2ZXMgYm90aCBvZiB0aG9zZSBwcm9ibGVtcywgc28gaW1wbGVt
ZW50IGl0IGhlcmUuIEluIHRoaXMNCj4gY2FzZSwgdGhlIFBMTDRfUCBpcyBubyBsb25nZXIgbGlt
aXRlZCBhbmQgY2FuIGJlIG9wZXJhdGVkIGZhc3RlciwgYXQNCj4gMTAwIE1Ieiwgd2hpY2ggaW1w
cm92ZXMgU0RNTUMgcGVyZm9ybWFuY2UgKHJlYWQgcGVyZm9ybWFuY2UgaXMgaW1wcm92ZWQNCj4g
ZnJvbSB+NDEgTWlCL3MgdG8gfjU3IE1pQi9zIHdpdGggZGQgaWY9L2Rldi9tbWNibGsxIG9mPS9k
ZXYvbnVsbCBicz02NE0NCj4gY291bnQ9MSkuIFRoZSBFTUkgaW50ZXJmZXJlbmNlIGFsc28gZGVj
cmVhc2VzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+
DQo+IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPg0K
PiBDYzogQ2hyaXN0b3BoZSBSb3VsbGllciA8Y2hyaXN0b3BoZS5yb3VsbGllckBmb3NzLnN0LmNv
bT4NCj4gQ2M6IEdhYnJpZWwgRmVybmFuZGV6IDxnYWJyaWVsLmZlcm5hbmRlekBmb3NzLnN0LmNv
bT4NCj4gQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPg0K
PiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4NCj4g
Q2M6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4NCj4gQ2M6IGxpbnV4LWNsa0B2Z2Vy
Lmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20NCj4gVG86IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiAtLS0NCj4g
IGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29tLXNvbS5kdHNpIHwgMjIgKysrKysr
KysrKysrKysrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAx
NXh4LWRoY29tLXNvbS5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb20t
c29tLmR0c2kNCj4gaW5kZXggOGM0MWY4MTlmNzc2OS4uYjA5MWQ5OTAxZTk3NiAxMDA2NDQNCj4g
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb20tc29tLmR0c2kNCj4gKysr
IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb20tc29tLmR0c2kNCj4gQEAgLTEx
NiwxNSArMTE2LDI5IEBAICZkdHMgew0KPiAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gIH07
DQo+IA0KPiArJnJjYyB7DQo+ICsgICAgICAgLyogQ29ubmVjdCBNQ08yIG91dHB1dCB0byBFVEhf
UlhfQ0xLIGlucHV0IHZpYSBwYWQtcGFkIGNvbm5lY3Rpb24gKi8NCj4gKyAgICAgICBjbG9ja3Mg
PSA8JnJjYyBDS19NQ08yPjsNCj4gKyAgICAgICBjbG9jay1uYW1lcyA9ICJFVEhfUlhfQ0xLL0VU
SF9SRUZfQ0xLIjsNCj4gKw0KPiArICAgICAgIC8qDQo+ICsgICAgICAgICogU2V0IFBMTDRQIG91
dHB1dCB0byAxMDAgTUh6IHRvIHN1cHBseSBTRE1NQyB3aXRoIGZhc3RlciBjbG9jaywNCj4gKyAg
ICAgICAgKiBzZXQgTUNPMiBvdXRwdXQgdG8gNTAgTUh6IHRvIHN1cHBseSBFVEhSWCBjbG9jayB3
aXRoIFBMTDRQLzIsDQo+ICsgICAgICAgICogc28gdGhhdCBNQ08yIGJlaGF2ZXMgYXMgYSBkaXZp
ZGVyIGZvciB0aGUgRVRIUlggY2xvY2sgaGVyZS4NCj4gKyAgICAgICAgKi8NCj4gKyAgICAgICBh
c3NpZ25lZC1jbG9ja3MgPSA8JnJjYyBDS19NQ08yPiwgPCZyY2MgUExMNF9QPjsNCj4gKyAgICAg
ICBhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZyY2MgUExMNF9QPjsNCj4gKyAgICAgICBhc3Np
Z25lZC1jbG9jay1yYXRlcyA9IDw1MDAwMDAwMD4sIDwxMDAwMDAwMDA+Ow0KPiArfTsNCj4gKw0K
PiAgJmV0aGVybmV0MCB7DQo+ICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiAtICAgICAgIHBp
bmN0cmwtMCA9IDwmZXRoZXJuZXQwX3JtaWlfcGluc19hPjsNCj4gLSAgICAgICBwaW5jdHJsLTEg
PSA8JmV0aGVybmV0MF9ybWlpX3NsZWVwX3BpbnNfYT47DQo+ICsgICAgICAgcGluY3RybC0wID0g
PCZldGhlcm5ldDBfcm1paV9waW5zX2IgJm1jbzJfcGluc19hPjsNCj4gKyAgICAgICBwaW5jdHJs
LTEgPSA8JmV0aGVybmV0MF9ybWlpX3NsZWVwX3BpbnNfYiAmbWNvMl9zbGVlcF9waW5zX2E+Ow0K
PiAgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzbGVlcCI7DQo+ICAgICAgICAg
cGh5LW1vZGUgPSAicm1paSI7DQo+ICAgICAgICAgbWF4LXNwZWVkID0gPDEwMD47DQo+ICAgICAg
ICAgcGh5LWhhbmRsZSA9IDwmcGh5MD47DQo+IC0gICAgICAgc3QsZXRoLXJlZi1jbGstc2VsOw0K
PiANCj4gICAgICAgICBtZGlvMCB7DQo+ICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9
IDwxPjsNCj4gQEAgLTEzNiw3ICsxNTAsNyBAQCBwaHkwOiBldGhlcm5ldC1waHlAMSB7DQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIC8qIExBTjg3MTBBaSAqLw0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gImV0aGVybmV0LXBoeS1pZDAwMDcuYzBmMCIsDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1j
MjIiOw0KPiAtICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JnJjYyBFVEhDS19LPjsN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZyY2MgQ0tfTUNPMj47DQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlc2V0LWdwaW9zID0gPCZncGlvaCAzIEdQSU9fQUNUSVZF
X0xPVz47DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlc2V0LWFzc2VydC11cyA9IDw1MDA+
Ow0KPiAgICAgICAgICAgICAgICAgICAgICAgICByZXNldC1kZWFzc2VydC11cyA9IDw1MDA+Ow0K
PiAtLQ0KPiAyLjM0LjENClRlc3RlZC1ieTogSm9oYW5uIE5ldWhhdXNlciA8am5ldWhhdXNlckBk
aC1lbGVjdHJvbmljcy5jb20+DQo=
