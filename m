Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11D016F288;
	Tue, 24 Feb 2026 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.182.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771924203; cv=none; b=ep7putv1zRfR0qWDzmMMbsrjk1TpcIRQLoPCuF43pekDeIQOqhslHFBe6N8A2l3hOmuktmMn+nILJ+H1SQlYkZJeZEsrGlEmsLHva5VgfLbvvHLt/1bcvIwoPAPl+9BU2+lvaj/bPPa+sQPKXn7GPEh7skN6/PfGnah2eFejUSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771924203; c=relaxed/simple;
	bh=yAOslJ+pC7VyRRx+a0peLrlTHeTl+nRsCm84jAs6dJY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=qqjJmpwPVkdiFM/RzA97S+MqQsrfKVrUYN4Lv66wTJjngaevsV2uILb1rilBZK4RiNxVYoxIaqoSDL2PW5GyfqQrdsFJRGMVQ6nSQjn9e1x1dBCAtvYuVWxfp98/sn1lDkJBYPJTE4dgErVjwsxWv5qO7FjzGMP91i1RRkLetK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=209.97.182.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Tue, 24 Feb 2026 17:09:42 +0800 (GMT+08:00)
Date: Tue, 24 Feb 2026 17:09:42 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xuyang Dong" <dongxuyang@eswincomputing.com>
To: "Bo Gan" <ganboing@gmail.com>, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, troy.mitchell@linux.dev,
	bmasney@redhat.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	marcel@ziswiler.com
Subject: Re: Re: [PATCH v13 0/3] Add driver support for ESWIN eic700 SoC
 clock controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <ae2358d7-7e82-49fe-8a03-195487a7b010@gmail.com>
References: <20260214101421.228-1-dongxuyang@eswincomputing.com>
 <ae2358d7-7e82-49fe-8a03-195487a7b010@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <41d3bf12.387f.19c8ee9570e.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgAHHaDWap1pHxkDAA--.36W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAQEIAmmcgREbn
	gAEsu
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiBIaSBFU1dJTiBmb2xrcywKPiAKPiBJJ20gdGVzdGluZyB5b3VyIHBhdGNoc2V0IG9uCj4gaHR0
cHM6Ly9naXRodWIuY29tL2dhbmJvaW5nL2xpbnV4LWVpYzc3L3RyZWUvZWljNzctaW50ZWdyYXRp
b24tdGVzdC1jbGstdjEzCj4gCj4gSXQncyBhcHBsaWVkIG9uIHRvcCBvZiBTYW11ZWwncyBQTUEg
djMgcGF0c2hzZXQsIHBsdXMgZGV2aWNlLXRyZWUgcGF0Y2hlcwo+IGZyb20geW91ciBpbnRlZ3Jh
dGlvbiB0ZXN0IGJyYW5jaC4gSXQncyBwcmV0dHkgc2ltaWxhciB0byB3aGF0IE1hcmNlbCBkaWQs
Cj4gYnV0IEkganVzdCB3YW50IHRvIGhhdmUgYSBzZXBhcmF0ZSB2ZXJpZmljYXRpb24uIFdoYXQg
SSBmb3VuZCBpcyB0aGF0IHRoZQo+IGtlcm5lbCBjYW4gc3VjY2Vzc2Z1bGx5IGJvb3Qgd2l0aCBj
bGtfaWdub3JlX3VudXNlZCAoZU1NQy9ldGggd29ya2luZyksCj4gYnV0IGhhbmdzIHdpdGhvdXQu
IEl0IHN0dWNrIGF0Cj4gCj4gWyAgICAzLjI1NzE0MV0gY2xrOiBEaXNhYmxpbmcgdW51c2VkIGNs
b2Nrcwo+IAo+IEknbSBwcmV0dHkgc3VyZSB0aGF0IHNvbWUgY2xvY2tzIHRoYXQgd2VyZW4ndCBz
dXBwb3NlZCB0byBnZXQgZGlzYWJsZWQgZ290Cj4gdHVybmVkIG9mZi4gQ2FuIHlvdSB2YWxpZGF0
ZSBpZiB0aGF0J3MgYSBidWcgaW4gdGhlIGNsb2NrIGRyaXZlciwgb3IgbXkKPiBkZXZpY2UtdHJl
ZSBqdXN0IGRpZG4ndCBsaW5rIGFsbCBjbG9ja3MuIE9uZSB0aGluZyBJIG5vdGljZWQgaXMgdGhh
dCB0aGVyZQo+IGlzIG5vIENMS19JU19DUklUSUNBTCBpbiB5b3VyIGNvZGUsIHNvIGl0J3MgaGln
aGx5IGxpa2VseSB0aGF0IEREUiBQTEwgb3IKPiBvdGhlcnMgd2VyZSB0dXJuZWQgb2ZmIHVuaW50
ZW50aW9uYWxseS4gTm90IGEgY2xvY2sgZHJpdmVyIGV4cGVydCwgYnV0IEknZAo+IGV4cGVjdCB0
aGUga2VybmVsIHNob3VsZCB3b3JrIGZpbmUgd2l0aG91dCBjbGtfaWdub3JlX3VudXNlZC4KPiAK
CkhpIEJvLAoKVGhhbmtzIGZvciB5b3VyIHJlcGx5LiBJIGFsc28gZ290IHRoZSBzYW1lIHJlc3Vs
dCB3aXRob3V0IGNsa19pZ25vcmVfdW51c2VkLsKgClRoaXMgaXMgYSBidWcsIGFuZCBJIHdpbGwg
YWRkcmVzcyBpdCBpbiB2MTQuCgpSZWdhcmRzLApYdXlhbmcgRG9uZwo=
