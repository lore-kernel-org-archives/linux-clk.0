Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-by2on0110.outbound.protection.outlook.com ([207.46.100.110]:27168
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753707AbbIDUJa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 4 Sep 2015 16:09:30 -0400
From: Sharma Bhupesh <bhupesh.sharma@freescale.com>
To: Li Leo <LeoLi@freescale.com>
CC: Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"Catalin.Marinas@arm.com" <Catalin.Marinas@arm.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"Scott Wood" <scottwood@freescale.com>,
	"olof@lixom.net" <olof@lixom.net>,
	"Bhupesh SHARMA" <bhupesh.linux@gmail.com>
Subject: RE: [PATCH v2 06/10] clk: qoriq: Add ls2080a support.
Date: Fri, 4 Sep 2015 20:09:25 +0000
Message-ID: <BY1PR0301MB1303A3BD91F3E65853CC3F2E82570@BY1PR0301MB1303.namprd03.prod.outlook.com>
References: <1441349872-4560-1-git-send-email-bhupesh.sharma@freescale.com>
	<1441349872-4560-7-git-send-email-bhupesh.sharma@freescale.com>
 <CADRPPNQsemXa2HgYZAcm+GurhimHbYVM5CL5ReDsyuzfAO=kSQ@mail.gmail.com>
In-Reply-To: <CADRPPNQsemXa2HgYZAcm+GurhimHbYVM5CL5ReDsyuzfAO=kSQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

PiBGcm9tOiBwa3UubGVvQGdtYWlsLmNvbSBbbWFpbHRvOnBrdS5sZW9AZ21haWwuY29tXQ0KPiBT
ZW50OiBTYXR1cmRheSwgU2VwdGVtYmVyIDA1LCAyMDE1IDE6MzIgQU0NCj4gT24gRnJpLCBTZXAg
NCwgMjAxNSBhdCAxOjU3IEFNLCBCaHVwZXNoIFNoYXJtYQ0KPiA8Ymh1cGVzaC5zaGFybWFAZnJl
ZXNjYWxlLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogU2NvdHQgV29vZCA8c2NvdHR3b29kQGZyZWVz
Y2FsZS5jb20+DQo+ID4NCj4gPiBMUzIwODBBIGlzIHRoZSBmaXJzdCBpbXBsZW1lbnRhdGlvbiBv
ZiB0aGUgY2hhc3NpcyAzIGNsb2NrZ2VuLCB3aGljaA0KPiA+IGhhcyBhIGRpZmZlcmVudCByZWdp
c3RlciBsYXlvdXQgdGhhbiBwcmV2aW91cyBjaGlwcy4gIEl0IGlzIGFsc28NCj4gPiBsaXR0bGUg
ZW5kaWFuLCB1bmxpa2UgcHJldmlvdXMgY2hpcHMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBT
Y290dCBXb29kIDxzY290dHdvb2RAZnJlZXNjYWxlLmNvbT4NCj4gPiAtLS0NCj4gDQo+IFlvdSBz
aG91bGQgcHJvYmFibHkgbWVudGlvbiBoZXJlIHRoYXQgdGhlIHBhdGNoIGlzIGRlcGVuZGluZyBv
biBhbm90aGVyDQo+IHBlbmRpbmcgcGF0Y2ggdG8gYXBwbHkuICBBbmQgdGhpcyBwYXRjaCBzaG91
bGQgYmUgZ29pbmcgdGhyb3VnaCB0aGUgc2FtZQ0KPiBzdWItc3lzdGVtIHRyZWUgYXMgdGhlIGRl
cGVuZGVuY3kgcGF0Y2guICBPdGhlcndpc2UsIHRoZXJlIGlzIG5vIHdheSBpdA0KPiBjYW4gYmUg
YXBwbGllZC4NCj4gDQoNCkNvdmVyLWxldHRlciBhbHJlYWR5IGNhcHR1cmVzIHRoaXM6IA0KaHR0
cDovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9hcm0ta2VybmVsL21zZzQ0MjkxMC5odG1sDQoNClNl
ZSB0aGUgc2VjdGlvbiAnUmViYXNpbmcgZGV0YWlscycuIGxpbnV4LWNsayBpcyBhbHJlYWR5IGNv
cGllZC4NCg0KUmVnYXJkcywNCkJodXBlc2gNCg0K
