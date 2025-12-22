Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9FB311940;
	Mon, 22 Dec 2025 09:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766395818; cv=none; b=ouIxDig+NbDiQKaYn6UF5yPcZEJmRvCyN0T8GfWdlWtdY4HEwwn+Qis3kvNq8hQsQ8DcYx0ozVZgwL/dG7lxewxKZYq/BCxMcdcxRzGn7x33ns1TSiZSuFQ4xJ9UVxSf9efWeU7pxGaDJMC8V4CjB5knEoUDkSTaccxhLoutVcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766395818; c=relaxed/simple;
	bh=5qsFh65Grpotg1I+ei/8ADeZUlIcWYKpKdLOF83J9zc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=p0AprTptOfaVHl0MBYEJj0K9o/aEvQnXh8/aXH5l5wckFV8IyLGHbZ2wCiBqR0DvtEHyqI8NhMLsPW5rPIbBHuDcWLCmco7BsLLVVpLDXTvhTNFqY0W7B2tHOmYWit+BcCJNYKxbKtugmPU6Lyzd6WrfCoSb/3jf1IhGiGuH6fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Mon, 22 Dec 2025 17:29:48 +0800 (GMT+08:00)
Date: Mon, 22 Dec 2025 17:29:48 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xuyang Dong" <dongxuyang@eswincomputing.com>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Bo Gan" <ganboing@gmail.com>,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	bmasney@redhat.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: [PATCH v8 2/3] clock: eswin: Add eic7700 clock driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <aUYXPBFhqz3Frdmo@troy-wujie14pro-arch>
References: <20251113013637.1109-1-dongxuyang@eswincomputing.com>
 <20251113013846.1222-1-dongxuyang@eswincomputing.com>
 <aUS9bLVLhIPMOcWa@kernel.org>
 <ade7690d-14d1-413a-b4b5-eda91d64207c@gmail.com>
 <aUYXPBFhqz3Frdmo@troy-wujie14pro-arch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <6077b3be.17c4.19b4564be0d.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgC3+q2MD0lp7r6IAA--.4164W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAQEEAmlIIQc4e
	QABsB
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiA+IAo+ID4gLi4uCj4gPiAKPiA+ID4gPiArc3RhdGljIGludCBjbGtfcGxsX3NldF9yYXRlKHN0
cnVjdCBjbGtfaHcgKmh3LCB1bnNpZ25lZCBsb25nIHJhdGUsCj4gPiA+ID4gKwkJCSAgICB1bnNp
Z25lZCBsb25nIHBhcmVudF9yYXRlKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKwlzdHJ1Y3QgZXN3aW5f
Y2xrX3BsbCAqY2xrID0gdG9fcGxsX2Nsayhodyk7Cj4gPiA+ID4gKwlzdHJ1Y3QgY2xrICpjbGtf
Y3B1X2xwX3BsbCA9IE5VTEw7Cj4gPiA+ID4gKwlzdHJ1Y3QgY2xrICpjbGtfY3B1X211eCA9IE5V
TEw7Cj4gPiA+ID4gKwlzdHJ1Y3QgY2xrICpjbGtfY3B1X3BsbCA9IE5VTEw7Cj4gPiA+ID4gKwl1
MzIgcG9zdGRpdjFfdmFsID0gMCwgcmVmZGl2X3ZhbCA9IDE7Cj4gPiA+ID4gKwl1MzIgZnJhY192
YWwsIGZiZGl2X3ZhbCwgdmFsOwo+ID4gPiA+ICsJYm9vbCBsb2NrX2ZsYWcgPSBmYWxzZTsKPiA+
ID4gPiArCWludCB0cnlfY291bnQgPSAwOwo+ID4gPiA+ICsJaW50IHJldDsKPiA+ID4gPiArCj4g
PiA+ID4gKwlyZXQgPSBlc3dpbl9jYWxjX3BsbCgmZnJhY192YWwsICAmZmJkaXZfdmFsLCAodTY0
KXJhdGUsIGNsayk7Cj4gPiA+ID4gKwlpZiAocmV0KQo+ID4gPiA+ICsJCXJldHVybiByZXQ7Cj4g
PiA+ID4gKwo+ID4gPiA+ICsJLyogTXVzdCBzd2l0Y2ggdGhlIENQVSB0byBvdGhlciBDTEsgYmVm
b3JlIHdlIGNoYW5nZSB0aGUgQ1BVIFBMTC4gKi8KPiA+ID4gPiArCWlmIChjbGstPmlkID09IEVJ
Qzc3MDBfQ0xLX1BMTF9DUFUpIHsKPiA+ID4gPiArCQljbGtfY3B1X211eCA9IF9fY2xrX2xvb2t1
cCgibXV4X2NwdV9yb290XzNtdXgxX2dmcmVlIik7Cj4gPiA+IEl0IHNlZW1zIHlvdSB3YW50IHRv
IHN3aXRjaCB0byBhIHNhZmUgY2xvY2sgc291cmNlIGJlZm9yZSBzZXR0aW5nIHVwIHRoZQo+ID4g
PiBQTEwsIHJpZ2h0Pwo+ID4gPiAKPiA+ID4gSSBhbSBub3Qgc3VyZSB3aGV0aGVyIHlvdXIgYXBw
cm9hY2ggaXMgY29ycmVjdCwgYnV0IHRoZSB1c2Ugb2YKPiA+ID4gX19jbGtfbG9va3VwKCkgc2hv
dWxkIGJlIGF2b2lkZWQgd2hlbmV2ZXIgcG9zc2libGUuCj4gPiA+IFdvdWxkIGl0IGJlIGZlYXNp
YmxlIHRvIG9idGFpbiBhIHByb3BlciBjbG9jayBoYW5kbGUgc29tZXdoZXJlIGFuZAo+ID4gPiBw
ZXJmb3JtIHRoZSBuZWNlc3NhcnkgY29uZmlndXJhdGlvbiBmcm9tIHdpdGhpbiBhIGNsa19ub3Rp
ZmllciBpbnN0ZWFkPwo+ID4gPiA+ICsJCWlmICghY2xrX2NwdV9tdXgpIHsKPiA+ID4gPiArCQkJ
cHJfZXJyKCJmYWlsZWQgdG8gZ2V0IGNsazogJXNcbiIsCj4gPiA+ID4gKwkJCSAgICAgICAibXV4
X2NwdV9yb290XzNtdXgxX2dmcmVlIik7Cj4gPiA+ID4gKwkJCXJldHVybiAtRUlOVkFMOwo+ID4g
PiA+ICsJCX0KPiA+IAo+ID4gSSBoYXZlIGEgc3Ryb25nIGZlZWxpbmcgdGhhdCB0aGlzIHN3aXRj
aCB0byBzYWZlIGNsb2NrIGFuZCBiYWNrIHRvIFBMTAo+ID4gY2FuIGJlIGRvbmUgd2l0aCBzb21l
dGhpbmcgdmVyeSBzaW1pbGFyIHRvIHRoaXM6Cj4gPiAKPiA+ICJBZGQgbm90aWZpZXIgZm9yIFBM
TDAgY2xvY2sgYW5kIHNldCBpdCAxLjVHSHogb24gdGhlIEpINzExMCBTb0MiCj4gPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA4MjYwODA0MzAuMTc5Nzg4LTEteGluZ3l1Lnd1QHN0
YXJmaXZldGVjaC5jb20vCj4gPiAKPiBZRVMsIFRoYXQncyB3aGF0IEkgd2FudC4KPiBUaGFua3Mg
Zm9yIHlvdXIgbGluayEKPiAKPiAgICAgICAgICAgICAgICAgICAgIC0gVHJveQo+ID4gUGxlYXNl
IHRha2UgYSBsb29rLiBUaGFua3MhCj4gPiAKPiA+IEJvCgpUaGFua3MuIFRoZSBtZW50aW9uZWQg
cHJvYmxlbXMgd2lsbCBiZSBjb3JyZWN0ZWQgaW4gdGhlIHN1YnNlcXVlbnQgcGF0Y2ggdmVyc2lv
bi4KClJlZ2FyZHMsClh1eWFuZyBEb25nCgo=
