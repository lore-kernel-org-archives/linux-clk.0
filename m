Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC802EDD7D;
	Tue, 28 Apr 2026 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368089; cv=none; b=t8TyeFSUFwTkvKCCLbYO2/ReFyqOSSknKK4iPuHb0AGFUrgSbGEVVkjxfKtN4PUKM7R70M3DQRVTVjUjSDTvR15FC6ajEuHuGMXZF0yYhVJeNOeq44UP6VGtBNPOlBEhZuCOIKTYDILp5elDz58Bml8KWC6qbX8Lyu86bX4fwCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368089; c=relaxed/simple;
	bh=v8LXrQIVoM6DimkApjlfe38xr3LI/bTiCB3B86vSJLE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ETClgs5tY6UmqSIH45F/XwijrqivoBJijHil0+/tZIoCVph/D0zLQEImN/gV3Ip7kq2boppi4BP7UGvWnZjXYEJ7xvx9N6fDeD1xGBwp7ld/9iqYP/JdeqcNxCAicL1pKwMmhUJ6Co33Q/Q5lcUW7UserHK39ltEIPDUauwEZlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Tue, 28 Apr 2026 17:21:03 +0800 (GMT+08:00)
Date: Tue, 28 Apr 2026 17:21:03 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xuyang Dong" <dongxuyang@eswincomputing.com>
To: "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, huangyifeng@eswincomputing.com,
	benoit.monin@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: Re: [PATCH v3 2/3] clk: eswin: Add eic7700 HSP clock driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <177733570840.5403.12558106273673899411@lazor>
References: <20260423090904.2108-1-dongxuyang@eswincomputing.com>
 <20260423091114.2326-1-dongxuyang@eswincomputing.com>
 <aeo8nn-eigzlojWx@redhat.com>
 <4e5c887.5a31.19dbf179fb6.Coremail.dongxuyang@eswincomputing.com>
 <CABx5tqK7p_XJHfXZ70gXhR88PzAteV7cVSFPoRzccgmjanADMw@mail.gmail.com>
 <177733570840.5403.12558106273673899411@lazor>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7a76d8cb.5bab.19dd3645d4e.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgAnPJ__e_BpqlUVAA--.2984W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAQELAmnvj5ohs
	QABsL
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW3Jw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiAKPiBRdW90aW5nIEJyaWFuIE1hc25leSAoMjAyNi0wNC0yNCAwNDoxNTo0NikKPiA+IE9uIEZy
aSwgQXByIDI0LCAyMDI2IGF0IDY6NDXigK9BTSBYdXlhbmcgRG9uZwo+ID4gPGRvbmd4dXlhbmdA
ZXN3aW5jb21wdXRpbmcuY29tPiB3cm90ZToKPiA+ID4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2su
IEkgZGlkIHNvbWUgcmVzZWFyY2ggYmFzZWQgb24geW91ciBjb21tZW50cy4KPiA+ID4KPiA+ID4g
bG9ja19jdHggaXMgYSBsb2NhbCB2YXJpYWJsZSBkZWNsYXJlZCBpbnNpZGUgdGhlIGZ1bmN0aW9u
IGJvZHkuIEl0IGlzIG5vdAo+ID4gPiBpbiBzY29wZSBhdCB0aGUgYXR0cmlidXRlIHNpdGUuIFRo
ZSBhdHRyaWJ1dGUgZXhwYW5kcyB0bwo+ID4gPiBfX2F0dHJpYnV0ZV9fKChhY3F1aXJlX2NhcGFi
aWxpdHkobG9ja19jdHgtPmxvY2spKSksIGFuZCBzaW5jZSBsb2NrX2N0eAo+ID4gPiBkb2Vzbid0
IGV4aXN0IGF0IHRoZSBkZWNsYXJhdGlvbiBwb2ludCwgY2xhbmcncyBhbmFseXNpcyBjYW5ub3Qg
cmVzb2x2ZSBpdAo+ID4gPiBhbmQgc2lsZW50bHkgZHJvcHMgdGhlIGFubm90YXRpb24uIFRoYXQn
cyB3aHkgeW91IHNlZSBubyB3YXJuaW5ncyBmcm9tCj4gPiA+IG1ha2UgQz0yIG9yIC1XdGhyZWFk
LXNhZmV0eS4KPiA+ID4KPiA+ID4gV2h5IC1XdGhyZWFkLXNhZmV0eSBwcm9kdWNlcyBubyBvdXRw
dXQKPiA+ID4gVHdvIHJlYXNvbnM6Cj4gPiA+ICAgMS4gVGhlIGxvY2tfY3R4LT5sb2NrIGV4cHJl
c3Npb24gaXMgdW5yZXNvbHZhYmxlIGF0IHRoZSBhdHRyaWJ1dGUgc2l0ZSwKPiA+ID4gICBzbyBj
bGFuZyBkcm9wcyB0aGUgYW5ub3RhdGlvbiBzaWxlbnRseSDigJQgbm8gYWNxdWlyZS9yZWxlYXNl
IHRyYWNraW5nLAo+ID4gPiAgIG5vIHdhcm5pbmdzLgo+ID4gPiAgIDIuIEV2ZW4gaWYgdGhlIGV4
cHJlc3Npb24gd2VyZSByZXNvbHZhYmxlLCBzcGlubG9ja190IGluIHRoaXMgZHJpdmVyIGlzCj4g
PiA+ICAgYSBwbGFpbiBwb2ludGVyIGZpZWxkIChzcGlubG9ja190ICpsb2NrKSBhY2Nlc3NlZCB0
aHJvdWdoIGEgdm9pZCAqCj4gPiA+ICAgY2FsbGJhY2sg4oCUIHRoZSBhbmFseXNpcyBjYW4ndCB0
cmFjayBsb2NrIHN0YXRlIHRocm91Z2ggdGhhdCBpbmRpcmVjdGlvbi4KPiA+ID4KPiA+ID4gVGhl
IGNsb3Nlc3QgY29ycmVjdCBleHByZXNzaW9uIHdvdWxkIGJlOgo+ID4gPiBfX2FjcXVpcmVzKCgo
c3RydWN0IGVpYzc3MDBfaHNwX3JlZ21hcF9sb2NrICopYXJnKS0+bG9jaykKPiA+ID4gQnV0IHRo
YXQgYWxzbyB3b24ndCB3b3JrOiBhcmcgaXMgdm9pZCAqLCBhbmQgY2xhbmcncyB0aHJlYWQtc2Fm
ZXR5Cj4gPiA+IGFuYWx5c2lzIGlzIHR5cGUtYmFzZWQuIEl0IGNhbid0IHRyYWNlIHRocm91Z2gg
YSB2b2lkIHBvaW50ZXIgY2FzdCB0bwo+ID4gPiBkZXRlcm1pbmUgd2hpY2ggc3BpbmxvY2tfdCBp
bnN0YW5jZSBpcyBiZWluZyBhY3F1aXJlZC4gVGhlIGFuYWx5c2lzCj4gPiA+IHdvdWxkIHN0aWxs
IHNpbGVudGx5IGlnbm9yZSBpdC4KPiA+ID4KPiA+ID4gRm9yIHZvaWQgKiByZWdtYXAgY2FsbGJh
Y2tzLCB0aGVyZSBpcyBubyBjbGVhbiB3YXkgdG8gbWFrZSBfX2FjcXVpcmVzKCkKPiA+ID4gd29y
aywgYmVjYXVzZSB0aGUgbG9jayBpcyBhbHdheXMgaGlkZGVuIGJlaGluZCB0aGUgb3BhcXVlIHBv
aW50ZXIuCj4gPiA+IFRoZSBhbm5vdGF0aW9ucyBzaG91bGQgYmUgZHJvcHBlZC4KPiA+ID4KPiA+
ID4gQmFzZWQgb24gdGhlIGFib3ZlIGFuYWx5c2lzLCBJIHN1Z2dlc3QgcmVtb3ZpbmcgdGhlIGFu
bm90YXRpb25zIGVudGlyZWx5Lgo+ID4gPiBIb3dldmVyLCBJJ2QgbGlrZSB0byBoZWFyIHlvdXIg
dGhvdWdodHMgb24gdGhpcyBhcHByb2FjaC4KPiA+IAo+ID4gSSBhZ3JlZSB0byByZW1vdmUgdGhl
IGFubm90YXRpb25zLiBCZWZvcmUgeW91IHBvc3QgYSBuZXcgdmVyc2lvbiwKPiA+IGxldCdzIGxl
dCB0aGlzIHNlcmllcyBzaXQgb3V0IG9uIHRoZSBsaXN0IGZvciBhIHdlZWsgb3IgdHdvLCBhbmQg
c2VlCj4gPiBpZiBhbnlvbmUgZWxzZSByZXBsaWVzIHdpdGggdGhlIHByb3BlciB3YXkgdG8gZG8g
dGhpcy4KPiA+IAo+IAo+IFdoeSBub3QgdXNlIGEgcmVnbWFwIGluc3RlYWQ/IFRoYXQgd291bGQg
ZW5mb3JjZSBsb2NraW5nIG9uIHJlZ2lzdGVycwo+IGFuZCB0aGVuIHlvdSB1c2UgdGhlIHJpZ2h0
IHJlZ21hcCBBUElzIHRvIHVwZGF0ZSB0aGUgcmVnaXN0ZXIgdW5kZXIgdGhlCj4gbG9jayAobGlr
ZSByZWdtYXBfdXBkYXRlX2JpdHMoKSBvciBzb21ldGhpbmcpLgoKSGkgU3RlcGhlbiwKClRoZSBj
b21tb24gZ2F0ZSBBUEksIHRoZSBIU1AgcHJpdmF0ZSBBUEksIGFuZCB0aGUgcmVzZXQgZHJpdmVy
IGFsbCBhY2Nlc3PCoAp0aGUgc2FtZSByZWdpc3RlciBzcGFjZS4KVGhlcmVmb3JlLCB0aGV5IG5l
ZWQgdG8gYmUgcHJvdGVjdGVkIGJ5IHRoZSBzYW1lIGRhdGEtPmxvY2suCgpCZXN0IHJlZ2FyZHMs
Clh1eWFuZyBEb25nCg==
