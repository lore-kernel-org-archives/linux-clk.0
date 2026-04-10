Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F7B3AA4E9;
	Fri, 10 Apr 2026 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809521; cv=none; b=J1UM10LyIvqAXkir8Z6fuytzK0NgLzp/Tm0PPNUnyldImfrOyzYh97qm6awcanDLpr44wP5K4ex83U0grmH4ZTsKGhPA1Zj8A/Cgw3F4O+ep6HSplmK0jLhs2FCXJZsdmmUnzvu7cTFxAc9kEyMwU+Nq3nXWT4rk1sqHU4AGPVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809521; c=relaxed/simple;
	bh=T1L02dg6RFoVGQ/FlKFkoyuOT9BMekcepcLQCo7lU0s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZFPGk4LxffT5XTUg27V2X8gX/Get9jaPA5KR2ycRN1L7JHh5B7CPASidnJxHeBQMhlyo/CWqQ0CI6doHXdhkNcfbGusxjtiaKLoAJW9/kxkER299f6RFdijPLlaDHHlhQNgR2XHd5MKXYPTAjor/Q53pgpf9YbzqHQBSIW2cdNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=dX7mU6hM; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="dX7mU6hM"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63A8OtG022684423, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775809496; bh=T1L02dg6RFoVGQ/FlKFkoyuOT9BMekcepcLQCo7lU0s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=dX7mU6hMx7fHwoB6gnF4ogNRjbZpMuQdusgt1SJVYLg6pxmLuFsykZvk9a5ywBncc
	 ldEyaO5MrSe3ECtX14tY75fbIBXDflKZgl5xToL4g8WTBffZOWaFlf2mmgtTQ/HEvL
	 YiCq2J5KFm7LMYnwIlGa2bO3aUHPItObAXdJ7FxV+k0UUzwKP7SDSxgksT3rPGmJYc
	 6pseC9IeZC3Uti3Wk/6czSumGGSVB6hATcFY4GJvvMaOnKITPZ0ASaxbZFFW08wX/K
	 TVO+VmXOOm6M8Vu4m/UWrCWHrbf9RZ7CZA5R/IlrEf36o8bxehJCAE4RnfRctUA1/A
	 xyqD8zo5Z8dHw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63A8OtG022684423
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Apr 2026 16:24:55 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 10 Apr 2026 16:24:55 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458%10]) with mapi id
 15.02.1748.010; Fri, 10 Apr 2026 16:24:55 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Brian Masney <bmasney@redhat.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org"
	<sboyd@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        =?big5?B?RWRnYXIgTGVlIFun9anTv9ld?= <cylee12@realtek.com>,
        "afaerber@suse.com" <afaerber@suse.com>,
        =?big5?B?SnlhbiBDaG91IFupUKrppndd?=
	<jyanchou@realtek.com>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>,
        =?big5?B?Q1lfSHVhbmdbtsDgsq7LXQ==?=
	<cy.huang@realtek.com>,
        =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?=
	<stanley_chang@realtek.com>
Subject: RE: [PATCH v6 06/10] clk: realtek: Add support for mux clock
Thread-Topic: [PATCH v6 06/10] clk: realtek: Add support for mux clock
Thread-Index: AQHcwnPq8HmZxIkpqUqMP4W7CMRK7rXM6G+AgAsZZvA=
Date: Fri, 10 Apr 2026 08:24:55 +0000
Message-ID: <603e602b8a294e0ea26e818226087bb7@realtek.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-7-eleanor.lin@realtek.com>
 <ac_UkRiqWb6fSc1I@redhat.com>
In-Reply-To: <ac_UkRiqWb6fSc1I@redhat.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgQnJpYW4sDQoNCj4gSGkgWXUtQ2h1biBhbmQgQ2hlbmctWXUsDQo+IA0KPiBPbiBUaHUsIEFw
ciAwMiwgMjAyNiBhdCAwMzozOTo1M1BNICswODAwLCBZdS1DaHVuIExpbiB3cm90ZToNCj4gPiBG
cm9tOiBDaGVuZy1ZdSBMZWUgPGN5bGVlMTJAcmVhbHRlay5jb20+DQo+ID4NCj4gPiBBZGQgYSBz
aW1wbGUgcmVnbWFwLWJhc2VkIGNsa19vcHMgaW1wbGVtZW50YXRpb24gZm9yIFJlYWx0ZWsgbXV4
IGNsb2Nrcy4NCj4gPg0KPiA+IFRoZSBpbXBsZW1lbnRhdGlvbiBzdXBwb3J0cyBwYXJlbnQgc2Vs
ZWN0aW9uIGFuZCByYXRlIGRldGVybWluYXRpb24NCj4gPiB0aHJvdWdoIHJlZ21hcC1iYWNrZWQg
cmVnaXN0ZXIgYWNjZXNzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbmctWXUgTGVlIDxj
eWxlZTEyQHJlYWx0ZWsuY29tPg0KPiA+IENvLWRldmVsb3BlZC1ieTogWXUtQ2h1biBMaW4gPGVs
ZWFub3IubGluQHJlYWx0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1LUNodW4gTGluIDxl
bGVhbm9yLmxpbkByZWFsdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIGluIHY2Og0KPiA+
IC0gQWRkIHRoZSBoZWFkZXJzIHVzZWQgaW4gYyBmaWxlIHRvIGZvbGxvdyB0aGUgIkluY2x1ZGUg
V2hhdCBZb3UgVXNlIg0KPiBwcmluY2lwbGUuDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvY2xrL3Jl
YWx0ZWsvTWFrZWZpbGUgICAgICAgICB8ICAxICsNCj4gPiAgZHJpdmVycy9jbGsvcmVhbHRlay9j
bGstcmVnbWFwLW11eC5jIHwgNDgNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrICBk
cml2ZXJzL2Nsay9yZWFsdGVrL2Nsay1yZWdtYXAtbXV4LmggfA0KPiA+IDQzICsrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspDQo+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9yZWFsdGVrL2Nsay1yZWdtYXAtbXV4
LmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL3JlYWx0ZWsvY2xrLXJlZ21h
cC1tdXguaA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3JlYWx0ZWsvTWFrZWZp
bGUNCj4gPiBiL2RyaXZlcnMvY2xrL3JlYWx0ZWsvTWFrZWZpbGUgaW5kZXggNzQzNzVmODEyN2Fj
Li5mOTBkYzU3ZmNmZGIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVhbHRlay9NYWtl
ZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlYWx0ZWsvTWFrZWZpbGUNCj4gPiBAQCAtNSw0
ICs1LDUgQEAgY2xrLXJ0ay15ICs9IGNvbW1vbi5vDQo+ID4NCj4gPiAgY2xrLXJ0ay15ICs9IGNs
ay1wbGwubw0KPiA+ICBjbGstcnRrLXkgKz0gY2xrLXJlZ21hcC1nYXRlLm8NCj4gPiArY2xrLXJ0
ay15ICs9IGNsay1yZWdtYXAtbXV4Lm8NCj4gPiAgY2xrLXJ0ay15ICs9IGZyZXFfdGFibGUubw0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9yZWFsdGVrL2Nsay1yZWdtYXAtbXV4LmMNCj4g
PiBiL2RyaXZlcnMvY2xrL3JlYWx0ZWsvY2xrLXJlZ21hcC1tdXguYw0KPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4wNjhiMDU2ZDYxZjANCj4gPiAtLS0g
L2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVhbHRlay9jbGstcmVnbWFwLW11eC5j
DQo+ID4gQEAgLTAsMCArMSw0OCBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5DQo+ID4gKy8qDQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAxNyBSZWFsdGVr
IFNlbWljb25kdWN0b3IgQ29ycG9yYXRpb24NCj4gPiArICogQXV0aG9yOiBDaGVuZy1ZdSBMZWUg
PGN5bGVlMTJAcmVhbHRlay5jb20+ICAqLw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGxpbnV4L3Jl
Z21hcC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+DQo+IA0KPiBTb3J0
IHRoZSBpbmNsdWRlcy4NCj4gDQoNCkFjay4NCg0KPiA+ICsjaW5jbHVkZSAiY2xrLXJlZ21hcC1t
dXguaCINCj4gPiArDQo+ID4gK3N0YXRpYyB1OCBjbGtfcmVnbWFwX211eF9nZXRfcGFyZW50KHN0
cnVjdCBjbGtfaHcgKmh3KSB7DQo+ID4gKyAgICAgc3RydWN0IGNsa19yZWdtYXBfbXV4ICpjbGtt
ID0gdG9fY2xrX3JlZ21hcF9tdXgoaHcpOw0KPiA+ICsgICAgIGludCBudW1fcGFyZW50cyA9IGNs
a19od19nZXRfbnVtX3BhcmVudHMoaHcpOw0KPiA+ICsgICAgIHUzMiB2YWw7DQo+ID4gKyAgICAg
aW50IHJldDsNCj4gPiArDQo+ID4gKyAgICAgcmV0ID0gcmVnbWFwX3JlYWQoY2xrbS0+Y2xrci5y
ZWdtYXAsIGNsa20tPm11eF9vZnMsICZ2YWwpOw0KPiA+ICsgICAgIGlmIChyZXQpDQo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gMDsNCj4gDQo+IFRoaXMgaXMgYW5vdGhlciBjYXNlIHdoZXJlIGl0
J2QgYmUgbmljZSB0byBnZXQgdGhlIGdldF9wYXJlbnQgZGVjbGFyYXRpb24gZml4ZWQuDQo+IFN0
ZXBoZW4gcmVjZW50bHkgbGlua2VkIHRvIHNvbWUgd29yayBvZiBoaXMgZnJvbSAyMDIyIGhlcmUu
DQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jbGsvMTc3NDMxMzA1NTA5LjU0
MDMuMTUzODYwMjEzMzc1MTc5NzA2NjcNCj4gQGxhem9yLw0KPiANCj4gVGhlcmUncyBub3RoaW5n
IGZvciB5b3UgdG8gZG8gcmlnaHQgbm93Lg0KPiANCj4gPiArDQo+ID4gKyAgICAgdmFsID0gdmFs
ID4+IGNsa20tPnNoaWZ0ICYgY2xrbS0+bWFzazsNCj4gDQo+IEkga25vdyB0aGVyZSdzIHRoZSBv
cmRlciBvZiBvcGVyYXRpb25zLCBob3dldmVyIGZvciBjbGFyaXR5IEkgd291bGQganVzdCBpbmNs
dWRlDQo+IHNvbWUgKCkgaGVyZSB0byBtYWtlIGl0IGNsZWFyIHRoZSBleHBlY3RlZCBvcmRlci4N
Cg0KQWNrLg0KDQo+ID4gKw0KPiA+ICsgICAgIGlmICh2YWwgPj0gbnVtX3BhcmVudHMpDQo+IA0K
PiBSZW1vdmUgbmV3bGluZSBiZWZvcmUgaWYuDQoNCkFjay4NCg0KPiANCj4gPiArICAgICAgICAg
ICAgIHJldHVybiAwOw0KPiA+ICsNCj4gPiArICAgICByZXR1cm4gdmFsOw0KPiANCj4gT3IgeW91
IGNvdWxkIGp1c3QgdXNlIGEgdGVybmFyeSBvcGVyYXRvcjoNCj4gDQo+IHJldHVybiB2YWwgPj0g
bnVtX3BhcmVudHMgPyAwIDogdmFsOw0KPiANCg0KQWNrLg0KDQo+ID4gK30NCj4gPiArDQo+ID4g
K3N0YXRpYyBpbnQgY2xrX3JlZ21hcF9tdXhfc2V0X3BhcmVudChzdHJ1Y3QgY2xrX2h3ICpodywg
dTggaW5kZXgpIHsNCj4gPiArICAgICBzdHJ1Y3QgY2xrX3JlZ21hcF9tdXggKmNsa20gPSB0b19j
bGtfcmVnbWFwX211eChodyk7DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiByZWdtYXBfdXBkYXRl
X2JpdHMoY2xrbS0+Y2xrci5yZWdtYXAsIGNsa20tPm11eF9vZnMsDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjbGttLT5tYXNrIDw8IGNsa20tPnNoaWZ0LCBpbmRleCA8PA0K
PiA+ICtjbGttLT5zaGlmdCk7IH0NCj4gPiArDQo+ID4gK2NvbnN0IHN0cnVjdCBjbGtfb3BzIHJ0
a19jbGtfcmVnbWFwX211eF9vcHMgPSB7DQo+ID4gKyAgICAgLnNldF9wYXJlbnQgPSBjbGtfcmVn
bWFwX211eF9zZXRfcGFyZW50LA0KPiA+ICsgICAgIC5nZXRfcGFyZW50ID0gY2xrX3JlZ21hcF9t
dXhfZ2V0X3BhcmVudCwNCj4gPiArICAgICAuZGV0ZXJtaW5lX3JhdGUgPSBfX2Nsa19tdXhfZGV0
ZXJtaW5lX3JhdGUsIH07DQo+ID4gK0VYUE9SVF9TWU1CT0xfTlNfR1BMKHJ0a19jbGtfcmVnbWFw
X211eF9vcHMsICJSRUFMVEVLX0NMSyIpOw0KPiA+ICsNCj4gPiArY29uc3Qgc3RydWN0IGNsa19v
cHMgcnRrX2Nsa19yZWdtYXBfbXV4X3JvX29wcyA9IHsNCj4gPiArICAgICAuZ2V0X3BhcmVudCA9
IGNsa19yZWdtYXBfbXV4X2dldF9wYXJlbnQsIH07DQo+ID4gK0VYUE9SVF9TWU1CT0xfTlNfR1BM
KHJ0a19jbGtfcmVnbWFwX211eF9yb19vcHMsICJSRUFMVEVLX0NMSyIpOw0KPiANCj4gcnRrX2Ns
a19yZWdtYXBfbXV4X3JvX29wcyBpcyBleHBvcnRlZCwgaG93ZXZlciB0aGUgZGVjbGFyYXRpb24g
aXMgbm90DQo+IGFjdHVhbGx5IGRlY2xhcmVkIGluIGFueSBoZWFkZXIgZmlsZXMuDQo+IA0KPiBC
cmlhbg0KDQpTaW5jZSBpdCBpcyBjdXJyZW50bHkgdW51c2VkLCBJIHdpbGwgZHJvcCB0aGUgJ3J0
a19jbGtfcmVnbWFwX211eF9yb19vcHMnDQppbXBsZW1lbnRhdGlvbi4NCg0KQmVzdCBSZWdhcmRz
LA0KWXUtQ2h1bi4NCg==
