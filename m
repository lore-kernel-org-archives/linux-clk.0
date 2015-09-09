Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-bl2on0144.outbound.protection.outlook.com ([65.55.169.144]:28800
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752829AbbIIDyP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Tue, 8 Sep 2015 23:54:15 -0400
From: Sharma Bhupesh <bhupesh.sharma@freescale.com>
To: Stuart Yoder <b08248@gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	Catalin marinas <Catalin.Marinas@arm.com>,
	"bhupesh.linux@gmail.com" <bhupesh.linux@gmail.com>,
	Will Deacon <will.deacon@arm.com>,
	"olof@lixom.net" <olof@lixom.net>
Subject: RE: [PATCH v2 01/10] arm64: Use generic Layerscape SoC family naming
 & rename LS2085A to LS2080A
Date: Wed, 9 Sep 2015 03:54:12 +0000
Message-ID: <BY1PR0301MB130356EF4A122A23A370611E82520@BY1PR0301MB1303.namprd03.prod.outlook.com>
References: <1441349872-4560-1-git-send-email-bhupesh.sharma@freescale.com>
	<1441349872-4560-2-git-send-email-bhupesh.sharma@freescale.com>
 <CALRxmdA=TF=N=6qELR78yhvt_uwEKyHih_08toD9oqCWYtsi0g@mail.gmail.com>
In-Reply-To: <CALRxmdA=TF=N=6qELR78yhvt_uwEKyHih_08toD9oqCWYtsi0g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

PiBGcm9tOiBTdHVhcnQgWW9kZXIgW21haWx0bzpiMDgyNDhAZ21haWwuY29tXQ0KPiBTZW50OiBX
ZWRuZXNkYXksIFNlcHRlbWJlciAwOSwgMjAxNSAxOjU1IEFNDQo+IE9uIEZyaSwgU2VwIDQsIDIw
MTUgYXQgMTo1NyBBTSwgQmh1cGVzaCBTaGFybWENCj4gPGJodXBlc2guc2hhcm1hQGZyZWVzY2Fs
ZS5jb20+IHdyb3RlOg0KPiA+IEZyZWVzY2FsZSB3aWxsIGJlIGEgY2h1cm5pbmcgb3V0IGEgaG9z
dCBvZiBBUk12OCBiYXNlZCBTb0NzIHdoaWNoIHdpbGwNCj4gPiBiZSBiYXNlZCBvbiBhIHNpbWls
YXIgb3ZlcmFsbCBTb0MgYXJjaGl0ZWN0dXJlLiBTbywgdGhpcyBwYXRjaA0KPiA+IGNvbnZlcnRz
IHRoZSBleGlzdGluZyBpbmZyYXN0cnVjdHVyZSBpbiB0aGUgYXJtNjQvZHRzLCBhcm02NC9LY29u
ZmlnDQo+ID4gYW5kIGFybTY0L2NvbmZpZ3MgdG8gdXNlIHRoZSBnZW5lcmljIGNvbnZlbnRpb24g
QVJDSF9MQVlFUlNDQVBFIGluDQo+ID4gcGxhY2Ugb2YgdGhlIG1vcmUgc3BlY2lmaWMgRlNMX0xT
MjA4NUEsIHRvIHNhdmUgY29kZSBkdXBsaWNhdGlvbg0KPiA+IGxhdGVyLW9uLg0KPiA+DQo+ID4g
QWxzbyBGcmVlc2NhbGUgaXMgcmVuYW1pbmcgTFMyMDg1QSB0byBMUzIwODBBLg0KPiA+DQo+ID4g
VGhpcyBwYXRjaCBhZGRyZXNzZXMgdGhlIGFib3ZlIHR3byBwb2ludHMuDQo+IA0KPiBTdWdnZXN0
IHNwbGl0dGluZyB0aGlzIGludG8gMiBwYXRjaGVzIGJlY2F1c2UgdGhlc2UgMiBjaGFuZ2VzIGFy
ZSByZWFsbHkNCj4gb3J0aG9nb25hbC0tIG9uZSBwYXRjaCBmb3IgdGhlIEFSQ0ggY29uZmlnIG5h
bWUgY2hhbmdlLCBvbmUgZm9yIHRoZQ0KPiByZW5hbWUgbHMyMDg1YSB0byBsczIwODBhIHJlbmFt
ZS4NCg0KSSB3YXMgc2VlaW5nIHRoZSBjb21waWxhdGlvbiBicmVha2luZyB1cCBhdCBwYXRjaCBs
ZXZlbCBpZiBJIGRpZCBzby4NCldpbGwgdHJ5IHRvIHNlZSBpZiB0aGlzIGNhbiBiZSBhY2hpZXZl
ZCB3aXRob3V0IGJyZWFraW5nIHVwIHRoZSBjb21waWxhdGlvbg0KZm9yIGluZGl2aWR1YWwgcGF0
Y2hlcyBpbiB2My4NCiANCj4gTm90IHN1cmUgd2h5IHlvdSdyZSBkZXNjcmliaW5nIGl0IGFzICJj
aHVybmluZyBvdXQgYSBob3N0IG9mIEFSTXY4IGJhc2VkDQo+IFNvQ3MiLg0KPiBKdXN0IGdldCB0
byB0aGUgcG9pbnQtLSAgTGF5ZXJzY2FwZSBpcyBhbiBTb0MgZmFtaWx5IHNvIHdlJ3JlIGNoYW5n
aW5nDQo+IGZyb20gdGhlIFNvQyBzcGVjaWZpYyBBUkNIIGtjb25maWcgb3B0aW9uIHRvIGEgbW9y
ZSBnZW5lcmFsIFNvQyBmYW1pbHkNCj4gb3B0aW9uLg0KDQpUaGUgcHJvbG9ndWUgaXMgdG8gZGVz
Y3JpYmUgdGhhdCBvdGhlciBBUk12OCBTb0NzIHdpdGggc2ltaWxhciBhcmNoaXRlY3R1cmUNCndp
bGwgYmUgcHV0LW91dCwgd2hpY2ggd2lsbCBiZSBwYXJ0IG9mIHRoZSBvdmVyYWxsIExheWVyc2Nh
cGUgZmFtaWx5LiANCg0KUmVnYXJkcywNCkJodXBlc2gNCg==
