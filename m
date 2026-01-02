Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498A91D5151;
	Fri,  2 Jan 2026 05:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767333377; cv=none; b=rEJ3JVBwF+WGpP2jFpIrsmWfSH6i6/VX3udeC0YJyLLH+DeI16kjWRVy5Qnz1xZuAxmpf/XUd0M9jihAw9rncSbX3XywGhENsioIMi+KvdYxWP+tsaYd3InL2xH0hx1uC4I/XC6o8RogAsbPr6rSqy4OeohwJ72J23OpfJNQu8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767333377; c=relaxed/simple;
	bh=nA6PGmigAPbGVKKLm/HMfzwnFxHn5yXESTtLv9G3P7Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ckgvrCyoSdWzoKc/5DPsaC+1bGnVTroIVjfT4auzCgBjfOvtPz+UeuLMlRvSRM5CtHuLnyF6Aypy9gdgKL0HcJUXVLIeEYOQ0osgRvm2bGpZ75xneIegzIjNf253WVudMNujJUCm7F3K1Cco/BfpHYTiT3q6vBQOKMsO3Fp8PBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=REGjHIWi; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="REGjHIWi"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6025u1GK1390066, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1767333362; bh=nA6PGmigAPbGVKKLm/HMfzwnFxHn5yXESTtLv9G3P7Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=REGjHIWi5J01ErrmgPrStw+UcZrUuDcmQz4D0TferXroPFG0TjaIU5JTVHMROQbZM
	 ylft83EtvcJtYuMFXxn0VWjSYteVNNwhixyVMjCGPs/3p5w1dBaeVZ9mPNuHixskR9
	 7Yyj4vhl7owQ99pEuATQ+Nmjg2APx3qYw3LWF2mzRwpJIg/f8SgowsEQdzVZEy8wly
	 H9aWTH47l+3c1F5U25fp+5DwqxhletV3s+d821JIlkSaUiPHucVDC/8HMaL8QtteGu
	 8HDEJO3PhBsbTv0/KSo4E6NECQB+QmUtVcoAPtqU+MdPVRZDZmwqBmfVJ1G+49bJdL
	 rzk4nWrQdUmIg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6025u1GK1390066
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Jan 2026 13:56:01 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 2 Jan 2026 13:56:02 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Fri, 2 Jan 2026 13:56:02 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org"
	<sboyd@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        =?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
        =?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
Subject: RE: [PATCH 2/9] clk: realtek: Add basic reset support
Thread-Topic: [PATCH 2/9] clk: realtek: Add basic reset support
Thread-Index: AQHceJgv88dAdSPz/EqPk0F3y7OVFrU5lfYAgATRsHA=
Date: Fri, 2 Jan 2026 05:56:02 +0000
Message-ID: <44e84af7d4564cebab1ff285b74faf53@realtek.com>
References: <20251229075313.27254-1-eleanor.lin@realtek.com>
 <20251229075313.27254-3-eleanor.lin@realtek.com>
 <20251230-impetuous-quizzical-locust-daffda@quoll>
In-Reply-To: <20251230-impetuous-quizzical-locust-daffda@quoll>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

PiBPbiBNb24sIERlYyAyOSwgMjAyNSBhdCAwMzo1MzowNlBNICswODAwLCBZdS1DaHVuIExpbiB3
cm90ZToNCj4gPiArDQo+ID4gK2ludCBydGtfcmVzZXRfY29udHJvbGxlcl9hZGQoc3RydWN0IGRl
dmljZSAqZGV2LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBydGtfcmVz
ZXRfaW5pdGRhdGEgKmluaXRkYXRhKSB7DQo+ID4gKyAgICAgc3RydWN0IHJ0a19yZXNldF9kYXRh
ICpkYXRhOw0KPiA+ICsNCj4gPiArICAgICBkYXRhID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9m
KCpkYXRhKSwgR0ZQX0tFUk5FTCk7DQo+ID4gKw0KPiANCj4gV2hhdCBzb3J0IG9mIGNvZGluZyBz
dHlsZSBkbyB5b3UgdXNlPyBUaGVyZSBpcyBhYnNvbHV0ZWx5IG5ldmVyIGEgYmxhbmsgbGluZQ0K
PiBiZXR3ZWVuIGt6YWxsb2MgYW5kIHRoZSBpZigpLg0KPiANCg0KV2lsbCByZW1vdmUgdGhlIGJs
YW5rIGxpbmUuDQoNCj4gPiArICAgICBpZiAoIWRhdGEpDQo+ID4gKyAgICAgICAgICAgICByZXR1
cm4gLUVOT01FTTsNCj4gPiArDQo+ID4gKyAgICAgZGF0YS0+ZGV2ID0gZGV2Ow0KPiA+ICsgICAg
IGRhdGEtPm51bV9iYW5rcyA9IGluaXRkYXRhLT5udW1fYmFua3M7DQo+ID4gKyAgICAgZGF0YS0+
YmFua3MgPSBpbml0ZGF0YS0+YmFua3M7DQo+ID4gKyAgICAgZGF0YS0+cmVnbWFwID0gaW5pdGRh
dGEtPnJlZ21hcDsNCj4gPiArICAgICBkYXRhLT5yY2Rldi5vd25lciA9IFRISVNfTU9EVUxFOw0K
PiANCj4gVEhJU19NT0RVTEU/IHNvIHdoaWNoIG1vZHVsZSBpcyBleGFjdGx5IHRoZSBvd25lciAt
IGNsay1ydGsua28gb3IgYWN0dWFsDQo+IGRyaXZlcj8NCj4gDQo+IFRoaXMgZmVlbHMgYnVnZ3ks
IGJ1dCBJIGRpZCBub3QgY2hlY2sgeW91ciBNYWtlZmlsZS4NCj4gDQoNClRoZSByZXNldCBzdXBw
b3J0IGFuZCB0aGUgY2xvY2sgZHJpdmVyIGFyZSBkZXNpZ25lZCB0byBiZSBsaW5rZWQgdG9nZXRo
ZXIgaW50bw0KYSBzaW5nbGUga2VybmVsIG1vZHVsZSAoY2xrLXJ0ay5rbykuIFRoZXJlZm9yZSwg
VEhJU19NT0RVTEUgaXMgdGhlIGNvcnJlY3Qgb3duZXIuDQoNCj4gPiArICAgICBkYXRhLT5yY2Rl
di5vcHMgPSAmcnRrX3Jlc2V0X29wczsNCj4gPiArICAgICBkYXRhLT5yY2Rldi5kZXYgPSBkZXY7
DQo+ID4gKyAgICAgZGF0YS0+cmNkZXYub2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsNCj4gPiArICAg
ICBkYXRhLT5yY2Rldi5ucl9yZXNldHMgPSBpbml0ZGF0YS0+bnVtX2JhbmtzICogMHgxMDA7DQo+
ID4gKyAgICAgZGF0YS0+cmNkZXYub2ZfeGxhdGUgPSBydGtfb2ZfcmVzZXRfeGxhdGU7DQo+ID4g
KyAgICAgZGF0YS0+cmNkZXYub2ZfcmVzZXRfbl9jZWxscyA9IDE7DQo+ID4gKw0KPiA+ICsgICAg
IHJldHVybiBkZXZtX3Jlc2V0X2NvbnRyb2xsZXJfcmVnaXN0ZXIoZGV2LCAmZGF0YS0+cmNkZXYp
OyB9DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKHJ0a19yZXNldF9jb250cm9sbGVyX2FkZCk7DQo+
ID4gKw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9yZWFsdGVrL3Jlc2V0LmggYi9kcml2
ZXJzL2Nsay9yZWFsdGVrL3Jlc2V0LmgNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NCBpbmRleCAw
MDAwMDAwMDAwMDAuLmNkNDQ2YjA5ODQyOQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9k
cml2ZXJzL2Nsay9yZWFsdGVrL3Jlc2V0LmgNCj4gPiBAQCAtMCwwICsxLDM2IEBADQo+ID4gKy8q
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8NCj4gPiArLyoNCj4gPiAr
ICogQ29weXJpZ2h0IChDKSAyMDE5IFJlYWx0ZWsgU2VtaWNvbmR1Y3RvciBDb3Jwb3JhdGlvbg0K
PiANCj4gQWgsIHNvIHRoYXQncyB3aHkgeW91IHNlbnQgcHJvYmUoKSBmcm9tIH4xMCB5ZWFycyBh
Z28uLi4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg==
