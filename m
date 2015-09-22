Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
From: Hou Zhiqiang <B48286@freescale.com>
To: Scott Wood <scottwood@freescale.com>
Subject: RE: [PATCH 6/6] dts/ls1043a: add LS1043ARDB board support
Date: Tue, 22 Sep 2015 09:51:57 +0000
Message-ID: <CY1PR0301MB0780643BCCE3A5C6BAEA22218B450@CY1PR0301MB0780.namprd03.prod.outlook.com>
References: <1442838158-2964-1-git-send-email-B48286@freescale.com>
 <1442838158-2964-7-git-send-email-B48286@freescale.com>
 <1442877225.19102.207.camel@freescale.com>
In-Reply-To: <1442877225.19102.207.camel@freescale.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "corbet@lwn.net" <corbet@lwn.net>,
 "sboyd@codeaurora.org" <sboyd@codeaurora.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Sharma Bhupesh <bhupesh.sharma@freescale.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "wsa@the-dreams.de" <wsa@the-dreams.de>,
 "will.deacon@arm.com" <will.deacon@arm.com>, "wim@iguana.be" <wim@iguana.be>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Wenbin
 Song <Wenbin.Song@freescale.com>, Hu Vincent <Mingkai.Hu@freescale.com>,
 Li Leo <LeoLi@freescale.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Shaohui Xie <Shaohui.Xie@freescale.com>
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

SGkgU2NvdHQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV29vZCBT
Y290dC1CMDc0MjENCj4gU2VudDogMjAxNeW5tDnmnIgyMuaXpSA3OjE0DQo+IFRvOiBIb3UgWmhp
cWlhbmctQjQ4Mjg2DQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7
IGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tOw0KPiB3aWxsLmRlYWNvbkBhcm0uY29tOyBsaW51eC1p
MmNAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gd2F0Y2hkb2dAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1kb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gY2xrQHZnZXIua2VybmVsLm9yZzsg
d3NhQHRoZS1kcmVhbXMuZGU7IHdpbUBpZ3VhbmEuYmU7IGNvcmJldEBsd24ubmV0Ow0KPiBtdHVy
cXVldHRlQGJheWxpYnJlLmNvbTsgc2JveWRAY29kZWF1cm9yYS5vcmc7IEh1IE1pbmdrYWktQjIx
Mjg0OyBYaWUNCj4gU2hhb2h1aS1CMjE5ODk7IFNvbmcgV2VuYmluLUI1Mzc0NzsgU2hhcm1hIEJo
dXBlc2gtQjQ1MzcwOyBMaSBZYW5nLUxlby0NCj4gUjU4NDcyDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggNi82XSBkdHMvbHMxMDQzYTogYWRkIExTMTA0M0FSREIgYm9hcmQgc3VwcG9ydA0KPiANCj4g
T24gTW9uLCAyMDE1LTA5LTIxIGF0IDIwOjIyICswODAwLCBaaGlxaWFuZyBIb3Ugd3JvdGU6DQo+
IA0KPiA+ICsgICAgICAgICAgICAgY3BsZDogYm9hcmQtY29udHJvbEAyLDAgew0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZzbCxsczEwNDNhcmRiLWNwbGQiLCAic2lt
cGxlLWJ1cyI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDIgMHgwIDB4MDAw
MDEwMD47DQo+ID4gKyAgICAgICAgICAgICB9Ow0KPiANCj4gQWdhaW4sIHdoeSAic2ltcGxlLWJ1
cyI/DQoNClRoYW5rcyBhbmQgd2lsbCByZW1vdmUgaXQgaW4gdjIuDQoNClRoYW5rcywNClpoaXFp
YW5nDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
cm0ta2VybmVsCg==
