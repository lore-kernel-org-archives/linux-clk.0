Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Yangbo Lu <yangbo.lu@nxp.com>
To: Scott Wood <scott.wood@nxp.com>, Yang-Leo Li <leoyang.li@nxp.com>
Subject: RE: [v7, 0/5] Fix eSDHC host version register bug
Date: Mon, 11 Apr 2016 02:54:31 +0000
Message-ID: <HE1PR04MB0889938012DBB9B1F91C6C65F8940@HE1PR04MB0889.eurprd04.prod.outlook.com>
References: <1459480051-3701-1-git-send-email-yangbo.lu@nxp.com>
 <CAPDyKFqgMCvbqMYZ-uM-rTnVvfJkCYbhv2kucCRyNyc9FWoR=Q@mail.gmail.com>
 <HE1PR04MB0889D75DC56E180D3508E7A1F89F0@HE1PR04MB0889.eurprd04.prod.outlook.com>
 <CAPDyKFp8GDzSkpbTKoRL=rwiBrsWmsgN95zB-QJwfZTnq4M8BA@mail.gmail.com>
In-Reply-To: <CAPDyKFp8GDzSkpbTKoRL=rwiBrsWmsgN95zB-QJwfZTnq4M8BA@mail.gmail.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Zhao Qiang <qiang.zhao@freescale.com>,
 Russell King <linux@arm.linux.org.uk>,
 Bhupesh Sharma <bhupesh.sharma@freescale.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jochen Friedrich <jochen@scram.de>, Xiaobo Xie <xiaobo.xie@nxp.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Claudiu Manoil <claudiu.manoil@freescale.com>, Kumar
 Gala <galak@codeaurora.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

SGkgTGVvIGFuZCBTY290dCwNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IFVsZiBIYW5zc29uIFttYWlsdG86dWxmLmhhbnNzb25AbGluYXJvLm9yZ10NCj4gU2VudDog
V2VkbmVzZGF5LCBBcHJpbCAwNiwgMjAxNiA0OjE1IFBNDQo+IFRvOiBZYW5nYm8gTHU7IFNjb3R0
IFdvb2QNCj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnOyBsaW51eC0NCj4gY2xrQHZnZXIua2VybmVsLm9y
ZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgaW9tbXVAbGlzdHMubGludXgtDQo+IGZvdW5k
YXRpb24ub3JnOyBuZXRkZXZAdmdlci5rZXJuZWwub3JnOyBsaW51eC1tbWM7IFJvYiBIZXJyaW5n
OyBSdXNzZWxsDQo+IEtpbmc7IEpvY2hlbiBGcmllZHJpY2g7IEpvZXJnIFJvZWRlbDsgQ2xhdWRp
dSBNYW5vaWw7IEJodXBlc2ggU2hhcm1hOw0KPiBaaGFvIFFpYW5nOyBLdW1hciBHYWxhOyBTYW50
b3NoIFNoaWxpbWthcjsgWWFuZy1MZW8gTGk7IFhpYW9ibyBYaWUNCj4gU3ViamVjdDogUmU6IFt2
NywgMC81XSBGaXggZVNESEMgaG9zdCB2ZXJzaW9uIHJlZ2lzdGVyIGJ1Zw0KPiANCj4gPj4NCj4g
Pj4gSSB3YXMgYWJvdXQgdG8gcXVldWUgdGhpcyBmb3IgbmV4dCwgd2hlbiBJIG5vdGljZWQgdGhh
dCBjaGVja3BhdGNoIGlzDQo+ID4+IGNvbXBsYWluaW5nL3dhcm5pbmcgbG90cyBhYm91dCB0aGVz
ZSBwYXRjaGVzLiBDYW4geW91IHBsZWFzZSBhIHJvdW5kDQo+ID4+IG9mIGNoZWNrcGF0Y2ggYW5k
IGZpeCB3aGF0IG1ha2VzIHNlbnNlLg0KPiA+Pg0KPiA+PiBLaW5kIHJlZ2FyZHMNCj4gPj4gVWZm
ZQ0KPiA+DQo+ID4gW0x1IFlhbmdiby1CNDcwOTNdIFNvcnJ5IGFib3V0IHRoaXMsIFVmZmUuLi4N
Cj4gDQo+IE5vIHdvcnJpZXMhDQo+IA0KPiA+IFNob3VsZCBJIGlnbm9yZSB0aGUgd2FybmluZ3Mg
dGhhdCB1cGRhdGUgTUFJTlRBSU5FUlM/DQo+IA0KPiBkcml2ZXJzL3NvYy9mc2wvZ3V0cy5jIGlz
bid0IHBhcnQgb2YgdGhlIE1BSU5UQUlORVJTIGZpbGUsIGl0IHNob3VsZCBiZS4NCj4gDQo+IEkg
YWxzbyByZWFsaXplIHRoYXQgdGhlIEZSRUVTQ0FMRSBRVUlDQyBFTkdJTkUgTElCUkFSWSBzZWN0
aW9uDQo+IGRyaXZlcnMvc29jL2ZzbC9xZS8qIGFsc28gbmVlZCBhbiBhY3RpdmUgbWFpbnRhaW5l
ciwgYXMgaXQncyBjdXJyZW50bHkNCj4gb3JwaGFuLg0KPiANCj4gUGVyaGFwcyB3ZSBzaG91bGQg
aGF2ZSBjcmVhdGUgYSBuZXcgc2VjdGlvbiBmb3IgZHJpdmVycy9zb2MvZnNsLyogaW5zdGVhZA0K
PiB0aGF0IGNvdmVycyBhbGwgb2YgdGhlIGFib3ZlPyBNYXliZSB5b3Ugb3IgU2NvdHQgYXJlIGlu
dGVyZXN0ZWQgdG8gcGljaw0KPiBpdCB1cD8NCj4gDQo+IEkgYWxzbyBub3RlZCB0aGF0LCAiaW5j
bHVkZS9saW51eC9mc2wvIiBpc24ndCBwcmVzZW50IGluIE1BSU5UQUlORVJTLA0KPiBwbGVhc2Ug
YWRkIHRoYXQgYXMgd2VsbC4NCg0KW0x1IFlhbmdiby1CNDcwOTNdIENvdWxkIGdpdmUgc29tZSBh
ZHZpY2Ugb24gdGhlIE1BSU5UQUlORVJTIGZvciB0aGVzZSAnZnNsJyBmaWxlcw0Kc2luY2UgSSBy
ZWFsbHkgZG9u4oCZdCBrbm93IHdobyBzaG91bGQgYmUgdGhlIHJpZ2h0IHBlcnNvbj8NCkkgd2ls
bCBhcHByZWNpYXRlIHRoYXQhDQoNClRoYW5rcyBhIGxvdC4NCg0KPiANCj4gPiBSZWdhcmRpbmcg
dGhlICd1bmRvY3VtZW50ZWQnIHdhcm5pbmcsIEkgd2lsbCBhZGRlZCBhIHBhdGNoIHVwZGF0ZXMg
ZG9jDQo+IGJlZm9yZSBhbGwgdGhlIHBhdGNoZXMsIE9rPw0KPiANCj4gWWVzLCBnb29kIQ0KPiAN
Cj4gPg0KPiA+IFRoYW5rcyBhIGxvdCA6KQ0KPiA+DQo+IA0KPiBLaW5kIHJlZ2FyZHMNCj4gVWZm
ZQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJt
LWtlcm5lbAo=
