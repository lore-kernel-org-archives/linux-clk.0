Return-Path: <gabriel.fernandez@st.com>
From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
To: Vladimir Zapolskiy <vz@mleia.com>,
        Alexandre TORGUE
	<alexandre.torgue@st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
CC: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Nicolas Pitre <nico@linaro.org>, Arnd Bergmann
	<arnd@arndb.de>,
        "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
        "andrea.merello@gmail.com" <andrea.merello@gmail.com>,
        "radoslaw.pietrzyk@gmail.com" <radoslaw.pietrzyk@gmail.com>,
        Lee Jones
	<lee.jones@linaro.org>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>,
        Ludovic BARRE <ludovic.barre@st.com>,
        "Olivier
 BIDEAU" <olivier.bideau@st.com>,
        Amelie DELAUNAY <amelie.delaunay@st.com>,
        "gabriel.fernandez.st@gmail.com" <gabriel.fernandez.st@gmail.com>,
        "Arvind
 Yadav" <arvind.yadav.cs@gmail.com>
Subject: Re: [PATCH v6 1/3] clk: nxp: clk-lpc32xx: rename
 clk_gate_is_enabled()
Date: Wed, 19 Jul 2017 12:50:01 +0000
Message-ID: <63be565e-4f3c-725c-c31b-a333b9bde89d@st.com>
References: <1500364414-10021-1-git-send-email-gabriel.fernandez@st.com>
 <1500364414-10021-2-git-send-email-gabriel.fernandez@st.com>
 <20f6a994-26b4-578c-d641-395639ebac0f@mleia.com>
In-Reply-To: <20f6a994-26b4-578c-d641-395639ebac0f@mleia.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

SGkgVmxhZGltaXIsDQoNCk1hbnkgdGhhbmtzIGZvciB0aGUgY29kZSByZXZpZXcuDQoNCg0KT24g
MDcvMTgvMjAxNyAwOTo0OCBQTSwgVmxhZGltaXIgWmFwb2xza2l5IHdyb3RlOg0KPiBIZWxsbyBH
YWJyaWVsLA0KPg0KPiBPbiAwNy8xOC8yMDE3IDEwOjUzIEFNLCBnYWJyaWVsLmZlcm5hbmRlekBz
dC5jb20gd3JvdGU6DQo+PiBGcm9tOiBHYWJyaWVsIEZlcm5hbmRleiA8Z2FicmllbC5mZXJuYW5k
ZXpAc3QuY29tPg0KPj4NCj4+IFdlIG5lZWQgdG8gZXhwb3J0IGNsa19nYXRlX2lzX2VuYWJsZWQo
KSBmcm9tIGNsayBmcmFtZXdvcmssIHRoZW4NCj4gZmlyc3Qgb2YgYWxsIGxldCdzIGNsYXJpZnkg
aWYgeW91IHJlYWxseSBuZWVkIHRvIGV4cG9ydCBjbGtfZ2F0ZV9pc19lbmFibGVkKCkNCj4gZnJv
bSB0aGUgQ0NGLg0KWWVzIGkgcmVhbGx5IG5lZWQgdG8gZXhwb3J0IGNsa19nYXRlX2lzX2VuYWJs
ZWQoKQ0KDQo+PiB0byBhdm9pZCBjb21waWxhdGlvbiBpc3N1ZSB3ZSBoYXZlIHRvIHJlbmFtZSBj
bGtfZ2F0ZV9pc19lbmFibGVkKCkNCj4+IGluIE5YUCBMUEMzMnh4IGNsb2NrIGRyaXZlci4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBHYWJyaWVsIEZlcm5hbmRleiA8Z2FicmllbC5mZXJuYW5kZXpA
c3QuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvY2xrL254cC9jbGstbHBjMzJ4eC5jIHwgNCAr
Ky0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL254cC9jbGstbHBjMzJ4eC5jIGIvZHJp
dmVycy9jbGsvbnhwL2Nsay1scGMzMnh4LmMNCj4+IGluZGV4IDViOThmZjkuLjFjYzcxYWQgMTAw
NjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2Nsay9ueHAvY2xrLWxwYzMyeHguYw0KPj4gKysrIGIvZHJp
dmVycy9jbGsvbnhwL2Nsay1scGMzMnh4LmMNCj4+IEBAIC05MDMsNyArOTAzLDcgQEAgc3RhdGlj
IHZvaWQgY2xrX2dhdGVfZGlzYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykNCj4+ICAgCXJlZ21hcF91
cGRhdGVfYml0cyhjbGtfcmVnbWFwLCBjbGstPnJlZywgbWFzaywgdmFsKTsNCj4+ICAgfQ0KPj4g
ICANCj4+IC1zdGF0aWMgaW50IGNsa19nYXRlX2lzX2VuYWJsZWQoc3RydWN0IGNsa19odyAqaHcp
DQo+PiArc3RhdGljIGludCBfX2Nsa19nYXRlX2lzX2VuYWJsZWQoc3RydWN0IGNsa19odyAqaHcp
DQo+PiAgIHsNCj4+ICAgCXN0cnVjdCBscGMzMnh4X2Nsa19nYXRlICpjbGsgPSB0b19scGMzMnh4
X2dhdGUoaHcpOw0KPj4gICAJdTMyIHZhbDsNCj4+IEBAIC05MTgsNyArOTE4LDcgQEAgc3RhdGlj
IGludCBjbGtfZ2F0ZV9pc19lbmFibGVkKHN0cnVjdCBjbGtfaHcgKmh3KQ0KPj4gICBzdGF0aWMg
Y29uc3Qgc3RydWN0IGNsa19vcHMgbHBjMzJ4eF9jbGtfZ2F0ZV9vcHMgPSB7DQo+PiAgIAkuZW5h
YmxlID0gY2xrX2dhdGVfZW5hYmxlLA0KPj4gICAJLmRpc2FibGUgPSBjbGtfZ2F0ZV9kaXNhYmxl
LA0KPj4gLQkuaXNfZW5hYmxlZCA9IGNsa19nYXRlX2lzX2VuYWJsZWQsDQo+PiArCS5pc19lbmFi
bGVkID0gX19jbGtfZ2F0ZV9pc19lbmFibGVkLA0KPiBJbiBjYXNlIGlmIHRoaXMgY2hhbmdlIGdl
dHMgY29udGludWF0aW9uLCBoZXJlIEkgd2FudCB0byBzZWUgdGhlIHNhbWUNCj4gcHJlZml4ZXMg
Zm9yIGFsbCBmdW5jdGlvbnMgYW5kIG5vIHVuZGVyc2NvcmVzLCBuYW1lbHkgaXQgc2hhbGwgYmUN
Cj4gKiBscGMzMnh4X2Nsa19nYXRlX2VuYWJsZSgpLA0KPiAqIGxwYzMyeHhfY2xrX2dhdGVfZGlz
YWJsZSgpLA0KPiAqIGxwYzMyeHhfY2xrX2dhdGVfaXNfZW5hYmxlZCgpLg0Kb2sgaWwgd2lsbCB1
c2Ugc2FtZSBwcmVmaXhlcyBmb3IgYWxsIGZ1bmN0aW9ucw0KDQpCZXN0IHJlZ2FyZHMNCg0KR2Fi
cmllbC4NCg0KPj4gICB9Ow0KPj4gICANCj4+ICAgI2RlZmluZSBkaXZfbWFzayh3aWR0aCkJKCgx
IDw8ICh3aWR0aCkpIC0gMSkNCj4+DQo+IC0tDQo+IFdpdGggYmVzdCB3aXNoZXMsDQo+IFZsYWRp
bWlyDQo=
