Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E4D2C0299;
	Sun,  4 Jan 2026 03:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.78.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767497029; cv=none; b=RzG1NP1cGybki1300UQsq9fDVSgjnbEMKU9rQUr4xOAMVuSlvls8/f7VTJoMEG5MmkCjOPZC4CuMc59g6NZgaOOsTvskO6dmNMKBEyzUgYhV29fNDG8yNPt/aIwsLOt4VlwfL7U/zBhHS/1jpLQy89vol4L6Q332vusATDbO12U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767497029; c=relaxed/simple;
	bh=Ri0yn1kHs7I1qeTNJLplp3x7lLC7KDEsmIJ1wVIweH8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=j0B2TdEeXnqO6tUF7nLZ3TK5apOs3RabCHg1bcsDFHgL6tOKE+u1IOWZ4aMJyk5vc+ynkqxbeHHECPLD9DFnRXI9csLEBR2f8rCQOKvIdEAyKjKrY6ugUQ2N5zn+nPwolKTIBABhSAUmub/BsDO5gYCjOkljuLfMIHlHM7NYmHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=13.76.78.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Sun, 4 Jan 2026 11:23:21 +0800 (GMT+08:00)
Date: Sun, 4 Jan 2026 11:23:21 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xuyang Dong" <dongxuyang@eswincomputing.com>
To: "Marcel Ziswiler" <marcel@ziswiler.com>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	troy.mitchell@linux.dev, bmasney@redhat.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	ganboing@gmail.com
Subject: Re: Re: [PATCH v9 2/3] clock: eswin: Add eic7700 clock driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <a7f4cf00b396096512d6947612031207c4d4459b.camel@ziswiler.com>
References: <20251229105844.1089-1-dongxuyang@eswincomputing.com>
 <20251229105949.1202-1-dongxuyang@eswincomputing.com>
 <a7f4cf00b396096512d6947612031207c4d4459b.camel@ziswiler.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <480d671d.1db1.19b8707eb98.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgDnK68p3Vlp4x+PAA--.5798W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAgERAmlZRP4dS
	QABsP
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiA+ICsKPiA+ICsvKiBkaXZpZGVyIGNsb2NrcyAqLwo+ID4gK3N0YXRpYyBzdHJ1Y3QgZXN3aW5f
ZGl2aWRlcl9jbG9jayBlaWM3NzAwX2Rpdl9jbGtzW10gPSB7Cj4gPiArCUVJQzc3MDBfRElWKEVJ
Qzc3MDBfQ0xLX0RJVl9TWVNfQ0ZHX0RZTk0sICJkaXZpZGVyX3N5c19jZmdfZGl2X2R5bm0iLAo+
ID4gKwkJwqDCoMKgICJmaXhlZF9yYXRlX2Nsa19zcGxsMF9mb3V0MyIsIDAsCj4gPiArCQnCoMKg
wqAgRUlDNzcwMF9SRUdfT0ZGU0VUX1NZU0NGR19DVFJMLCA0LCAzLAo+ID4gKwkJwqDCoMKgIENM
S19ESVZJREVSX09ORV9CQVNFRCksCj4gPiArCUVJQzc3MDBfRElWKEVJQzc3MDBfQ0xLX0RJVl9O
T0NfTlNQX0RZTk0sICJkaXZpZGVyX25vY19uc3BfZGl2X2R5bm0iLAo+ID4gKwkJwqDCoMKgICJm
aXhlZF9yYXRlX2Nsa19zcGxsMl9mb3V0MSIsIDAsCj4gPiArCQnCoMKgwqAgRUlDNzcwMF9SRUdf
T0ZGU0VUX05PQ19DVFJMLCAwLCAzLCBDTEtfRElWSURFUl9PTkVfQkFTRUQpLAo+ID4gKwlFSUM3
NzAwX0RJVihFSUM3NzAwX0NMS19ESVZfQk9PVFNQSV9EWU5NLCAiZGl2aWRlcl9ib290c3BpX2Rp
dl9keW5tIiwKPiA+ICsJCcKgwqDCoCAiZ2F0ZV9jbGtfc3BsbDBfZm91dDIiLCAwLCBFSUM3NzAw
X1JFR19PRkZTRVRfQk9PVFNQSV9DVFJMLAo+ID4gKwkJwqDCoMKgIDQsIDYsIENMS19ESVZJREVS
X09ORV9CQVNFRCksCj4gPiArCUVJQzc3MDBfRElWKEVJQzc3MDBfQ0xLX0RJVl9TQ1BVX0NPUkVf
RFlOTSwKPiA+ICsJCcKgwqDCoCAiZGl2aWRlcl9zY3B1X2NvcmVfZGl2X2R5bm0iLCAiZml4ZWRf
cmF0ZV9jbGtfc3BsbDBfZm91dDEiLAo+ID4gKwkJwqDCoMKgIDAsIEVJQzc3MDBfUkVHX09GRlNF
VF9TQ1BVX0NPUkVfQ1RSTCwgNCwgNCwKPiA+ICsJCcKgwqDCoCBDTEtfRElWSURFUl9PTkVfQkFT
RUQpLAo+ID4gKwlFSUM3NzAwX0RJVihFSUM3NzAwX0NMS19ESVZfTFBDUFVfQ09SRV9EWU5NLAo+
ID4gKwkJwqDCoMKgICJkaXZpZGVyX2xwY3B1X2NvcmVfZGl2X2R5bm0iLCAiZml4ZWRfcmF0ZV9j
bGtfc3BsbDBfZm91dDEiLAo+ID4gKwkJwqDCoMKgIDAsIEVJQzc3MDBfUkVHX09GRlNFVF9MUENQ
VV9DT1JFX0NUUkwsIDQsIDQsCj4gPiArCQnCoMKgwqAgQ0xLX0RJVklERVJfT05FX0JBU0VEKSwK
PiAKPiBEdXJpbmcgdGVzdGluZyBvbiB0b3Agb2YgbmV4dC0yMDI1MTIxOSBJIGdvdCB0aGUgZm9s
bG93aW5nOgo+IAo+IFsgICAgMC4xMjYxMDJdIGRpdmlkZXJfbHBjcHVfY29yZV9kaXZfZHlubTog
WmVybyBkaXZpc29yIGFuZCBDTEtfRElWSURFUl9BTExPV19aRVJPIG5vdCBzZXQKPiBbICAgIDAu
MTI2MTk0XSBXQVJOSU5HOiBkcml2ZXJzL2Nsay9jbGstZGl2aWRlci5jOjE0NSBhdCBkaXZpZGVy
X3JlY2FsY19yYXRlKzB4OGEvMHg5YywgQ1BVIzA6IHN3YXBwZXIvMC8xCj4gCj4gVGhlcmVmb3Jl
IEkgc3VnZ2VzdCBmb3IgYWJvdmUgbGluZSBuZWVkaW5nIHRvIGJlOgo+IAo+ICsgICAgICAgICAg
ICAgICAgICAgQ0xLX0RJVklERVJfT05FX0JBU0VEIHwgQ0xLX0RJVklERVJfQUxMT1dfWkVSTyks
CgpIaSBNYXJjZWwsCgpUaGFuayB5b3UhIFRoaXMgaXMgaW5kZWVkIGEgYnVnIGFuZCB3aWxsIGJl
IGZpeGVkIGluIHRoZSBuZXh0IHZlcnNpb24uwqAKQ291bGQgeW91IHBsZWFzZSBzaGFyZSB0aGUg
ZGV0YWlsZWQgdGVzdGluZyBtZXRob2RzIHdpdGggbWUgc28gdGhhdCBJwqAKY2FuIHJlcHJvZHVj
ZSB0aGlzIGlzc3VlIG9uIG15IHNpZGU/CgpCZXN0IHJlZ2FyZHMsClh1eWFuZyBEb25nCg==
