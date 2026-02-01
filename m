Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D132E54BD
	for <linux-clk@vger.kernel.org>; Sun,  1 Feb 2026 23:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769990084; cv=none; b=jnW6gpn91s3GxHXtgML1z/649atlQodumGQVYeosJAuz6Sbrmmj04lCDyWVUIxUzsFLzyL6VQ4cftTHBBWmxY4hgM10g5BpSSyEU1FcXPKh7dQMyVeaGBhwgsb1CBsH94Rb2gafjhAt7uj6+Jf/BoYq7idQ+sl27DoeTEJsjXr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769990084; c=relaxed/simple;
	bh=OIm5GFY+aMO/k5SQw53Ra2/7sK3N9Ozh0hu0iyzZ3tA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ou6xd7J/fZhp37K9HmfBzAjmUetMhMHluY5ZLRU/Y3yxJ9DWFbseXjc5BHFBh/X4z4EcILJbGuK4dZG3MOsGJLEI09ip8KjgTOeMNYW6pH9CG/v9mTERDfHIPiSSuGmEhkgVEYoQf5bvwIPiX6YjlEdnbDGbGTAEyryU6MBUwrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=2KY/6iTL; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="2KY/6iTL"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 905922C0362;
	Mon,  2 Feb 2026 12:54:34 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1769990074;
	bh=OIm5GFY+aMO/k5SQw53Ra2/7sK3N9Ozh0hu0iyzZ3tA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=2KY/6iTLP5vBzX+fJQ5MHU+5JG58XbzdwBNs++YK7bg6p14O8VR1XXSqW1L1QuKn3
	 d49MxiSTTDFu7heUTpeqUd9LLx5G5Wb5mvLVzmpzICP0Cu+YWrMHbB/MVnTfMqyZ1P
	 W8xOAE3LEPRJ9/PAOpuEy6nf68kUPqv55p2Imq80ivWYbABJJ/0u510LaY4Sz1r3S2
	 8OkrxOB4CWG5iYb79Cx1LSAjjis10/NpyMCiimfq6Xmwr1X/cPFHkk8WOs1wT8vga5
	 EoY4WsTLjXnrFhPD05kHVrmYbpYG/nkXP9M+3NYdy3UewRPn29k5TXeR5VgmLyNY3C
	 1y+9ke4aMG/cg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B697fe7ba0001>; Mon, 02 Feb 2026 12:54:34 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 2 Feb 2026 12:54:34 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.010; Mon, 2 Feb 2026 12:54:34 +1300
From: Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>
To: "ray.jui@broadcom.com" <ray.jui@broadcom.com>
CC: "bcm-kernel-feedback-list@broadcom.com"
	<bcm-kernel-feedback-list@broadcom.com>, "rjui@broadcom.com"
	<rjui@broadcom.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"sboyd@kernel.org" <sboyd@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: bcm: iproc: Fix overflow in clock calculation
Thread-Topic: [PATCH] clk: bcm: iproc: Fix overflow in clock calculation
Thread-Index: AQHckLfusENRyejlvEi4lKwCq3XxnrVqFliAgAOag4A=
Date: Sun, 1 Feb 2026 23:54:34 +0000
Message-ID: <771696afba71e2f2c059e6690d5ba63fdfd8fcaf.camel@alliedtelesis.co.nz>
References: <20260129003958.1410626-1-mark.tomlinson@alliedtelesis.co.nz>
	 <CAJ8Y1dTNM-oXVK4bm0hCQf6Vb+QGUA_YL5T-L89Dv3HZYPzsFw@mail.gmail.com>
In-Reply-To: <CAJ8Y1dTNM-oXVK4bm0hCQf6Vb+QGUA_YL5T-L89Dv3HZYPzsFw@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <9EF8D4A7D88FA34A92556430040DF101@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=b/UR4cGx c=1 sm=1 tr=0 ts=697fe7ba a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=3pNRdvVr4ggA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=8K59GfP8uRbbDIp6V3EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

T24gRnJpLCAyMDI2LTAxLTMwIGF0IDA4OjUyIC0wODAwLCBSYXkgSnVpIHdyb3RlOg0KPiANCj4g
DQo+IE9uIFdlZCwgSmFuIDI4LCAyMDI2IGF0IDQ6NDHigK9QTSBNYXJrIFRvbWxpbnNvbg0KPiA8
bWFyay50b21saW5zb25AYWxsaWVkdGVsZXNpcy5jby5uej4gd3JvdGU6DQo+ID4gU29tZSBCQ00g
aXByb2MgZGV2aWNlcyBydW4gYXQgMS4yNUdIei4gVGhpcyBjb21lcyBmcm9tIGEgNTBNSFogY3J5
c3RhbA0KPiA+IHdpdGggYSBwcmUtZGl2aWRlciBvZiB0d28sIGEgcG9zdC1kaXZpZGVyIG9mIHR3
byBhbmQgYSBQTEwgbXVsdGlwbGllcg0KPiA+IG9mDQo+ID4gMTAwLiBBcyB0aGUgbXVsdGlwbHkg
aXMgZG9uZSBmaXJzdCAoNTBNICogMTAwKSB0aGlzIG92ZXJmbG93cyBhIDMyLWJpdA0KPiA+IHZh
bHVlLiBUaGUgbXVsdGlwbGljYXRpb24gd2FzIGRvbmUgYXMgYSA2NC1iaXQgbXVsdGlwbHksIGJ1
dCB0aGUgcmVzdWx0DQo+ID4gYXNzaWduZWQgdG8gYSAzMi1iaXQgdmFyaWFibGUgYmVmb3JlIHRo
ZSBkaXZpc2lvbiB3YXMgZG9uZS4gVG8gZml4DQo+ID4gdGhpcywNCj4gPiB1c2UgYSA2NC1iaXQg
dGVtcG9yYXJ5IHZhcmlhYmxlIGFuZCB1c2UgdGhlIGRvX2RpdigpIG1hY3JvIHRvIHBlcmZvcm0g
YQ0KPiA+IDY0LWJpdC8zMi1iaXQgZGl2aXNpb24uDQo+ID4gDQo+ID4gRml4ZXM6IDVmZTIyNWMx
MDVmZCAoImNsazogaXByb2M6IGFkZCBpbml0aWFsIGNvbW1vbiBjbG9jayBzdXBwb3J0IikNCj4g
PiBTaWduZWQtb2ZmLWJ5OiBNYXJrIFRvbWxpbnNvbiA8bWFyay50b21saW5zb25AYWxsaWVkdGVs
ZXNpcy5jby5uej4NCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvY2xrL2JjbS9jbGstaXByb2MtYXJt
cGxsLmMgfCA4ICsrKysrLS0tDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9iY20v
Y2xrLWlwcm9jLWFybXBsbC5jIGIvZHJpdmVycy9jbGsvYmNtL2Nsay0NCj4gPiBpcHJvYy1hcm1w
bGwuYw0KPiA+IGluZGV4IDllODZjMGMxMGI1Ny4uNjY1ZjFjNTMxYzRmIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvY2xrL2JjbS9jbGstaXByb2MtYXJtcGxsLmMNCj4gPiArKysgYi9kcml2ZXJz
L2Nsay9iY20vY2xrLWlwcm9jLWFybXBsbC5jDQo+ID4gQEAgLTE4MCw3ICsxODAsNyBAQCBzdGF0
aWMgdW5zaWduZWQgaW50IF9fZ2V0X25kaXYoc3RydWN0IGlwcm9jX2FybV9wbGwNCj4gPiAqcGxs
KQ0KPiA+IMKgICrCoCDCoG1kaXYgPSBBUk0gUExMIHBvc3QgZGl2aWRlcg0KPiA+IMKgICoNCj4g
PiDCoCAqIFRoZSBmcmVxdWVuY3kgaXMgY2FsY3VsYXRlZCBieToNCj4gPiAtICrCoCDCoCgobmRp
diAqIHBhcmVudCBjbG9jayByYXRlKSAvIHBkaXYpIC8gbWRpdg0KPiA+ICsgKsKgIMKgKG5kaXYg
KiBwYXJlbnQgY2xvY2sgcmF0ZSkgLyAocGRpdiAqIG1kaXYpDQo+ID4gwqAgKi8NCj4gPiDCoHN0
YXRpYyB1bnNpZ25lZCBsb25nIGlwcm9jX2FybV9wbGxfcmVjYWxjX3JhdGUoc3RydWN0IGNsa19o
dyAqaHcsDQo+ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdW5zaWduZWQgbG9uZyBwYXJlbnRf
cmF0ZSkNCj4gPiBAQCAtMTg5LDYgKzE4OSw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nDQo+ID4g
aXByb2NfYXJtX3BsbF9yZWNhbGNfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywNCj4gPiDCoCDCoCDC
oCDCoCB1MzIgdmFsOw0KPiA+IMKgIMKgIMKgIMKgIGludCBtZGl2Ow0KPiA+IMKgIMKgIMKgIMKg
IHU2NCBuZGl2Ow0KPiA+ICvCoCDCoCDCoCDCoHU2NCByYXRlOw0KPiA+IMKgIMKgIMKgIMKgIHVu
c2lnbmVkIGludCBwZGl2Ow0KPiA+IA0KPiA+IMKgIMKgIMKgIMKgIC8qIGluIGJ5cGFzcyBtb2Rl
LCB1c2UgcGFyZW50IHJhdGUgKi8NCj4gPiBAQCAtMjE2LDggKzIxNyw5IEBAIHN0YXRpYyB1bnNp
Z25lZCBsb25nDQo+ID4gaXByb2NfYXJtX3BsbF9yZWNhbGNfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpo
dywNCj4gPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwbGwtPnJhdGUgPSAwOw0KPiA+IMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiAwOw0KPiA+IMKgIMKgIMKgIMKgIH0NCj4gPiAtwqAg
wqAgwqAgwqBwbGwtPnJhdGUgPSAobmRpdiAqIHBhcmVudF9yYXRlKSA+PiAyMDsNCj4gPiANCj4g
DQo+IA0KPiA1MCBNSHogY3J5c3RhbCAqIG5kaXYgb2YgMTAwIGluZGVlZCA+IDMyLWJpdCwgYnV0
IHRoZSByaWdodCBzaGlmdCBieSAyMA0KPiB3b3VsZCBoYXZlIGVuc3VyZWQgdGhlIHJlc3VsdCBp
cyB3YXkgbGVzcyB0aGFuIDMyLWJpdC4NCj4gSSBndWVzcyB0aGlzIGlzIG5vdCBhIHJlYWwgd29y
bGQgcHJvYmxlbSAoeW91IHdvbid0IGhhdmUgYSBjcnlzdGFsIGFzDQo+IHJlZmVyZW5jZSBjbG9j
ayBvZiBhIFBMTCBydW5uaW5nIGF0IGEgZnJlcXVlbmN5IG11Y2ggaGlnaGVyIHRoYW4gNTAgTUh6
KS4NCj4gQnV0IGp1c3QgdG8gYmUgc2FmZSwgdXNpbmcgYSA2NC1iaXQgdGVtcG9yYXJ5IHZhcmlh
YmxlIGZvciAncmF0ZScgYmVmb3JlDQo+IGZ1cnRoZXIgZGl2aXNpb24gYmVsb3cgZG9lcyBub3Qg
aHVydC4NCg0KTXkgZGVzY3JpcHRpb24gd2FzIGEgYml0IHNpbXBsaWZpZWQuIG5kaXYgYXQgdGhp
cyBwb2ludCBpcyBzaGlmdGVkIGxlZnQgYnkNCjIwIGJpdHMsIHNvIGlzIDEwMCA8PCAyMCwgbm90
IGp1c3QgMTAwLiBTbyB0aGUgY2FsY3VsYXRpb24gYWZ0ZXIgdGhlID4+IDIwDQp3YXMgc3RpbGwg
NSBiaWxsaW9uLiBUaGlzIGlzIGEgcmVhbCBwcm9ibGVtIG9uIHRoZSBCQ001NjE2MCwgd2hpY2gg
dXNlcw0KdGhlc2UgdmFsdWVzLg0KDQpUaGFua3MgZm9yIHRoZSBBY2suDQoNCg0K
