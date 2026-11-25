Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.75.44.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594351;
	b=GLoyHCY2yUiw4cy+FF9ojkqf9M5Wv70EbWF0xqG/zMoCWwWB/bDRozjE0R4JD2Go/tcg
	 hYx9hzaXrChk8g+rDEdrhHd+j20PzVHgiF8sDaGE0b8GQY2jV9XO6LDCro80vFHlt/DaM
	 ZA0MaBPIAx77r/TtxN5+/gbVWq9XIfyuWLmjTyuFhOqp2Qdw827gd8VW2rf4GuxAkD2gc
	 pAe5StTR484AaU7joFHdJsvBqcpiJcqj0/+5Cl5JrMJlFaB9ODe+mmUzil6Xj/X1riiCx
	 p+UGu8mj0bvi9N+vgMrPJTEhAHtLj9k2DHkguDVdUDoIv6xRINRxkNJKCNcPOLM8y0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594351;
	h=DMARC-Filter:DKIM-Signature:Received:X-Originating-IP:Date:
	 X-CM-HeaderCharset:From:To:Cc:Subject:X-Priority:X-Mailer:In-Reply-To:
	 References:Content-Transfer-Encoding:Content-Type:MIME-Version:
	 Message-ID:X-Coremail-Locale:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=KLDHT3mhDgcLFkYjJmk6bA/ObB1vtwIOf6xFXNe/0no=;
	b=0eC6GJZ2AQiyvW3sEDAp5sCTOnZ6pLSBzP6U5BJFMksO6TzAyFgsuR70rYVX1mCbrj17
	 mgy5wJi9C/4D7HMQ6B4icVbFA89JaOta6u8nPiGg5Gk2sIQVqoIQqSa6Q40qLYJ9vsdUI
	 yXUaKDfqHaRCPh4U9GLvFEzbvQoMcBIiX+k630WxXn/BgRFjsTkTI6/BNx8feahNI9Onq
	 k/LbNS5YpgWU1X2abP0A2WG2mKWj/4FKk7VPzzCgRS9xikVXdtL4g+NGX4easO79s1z8z
	 NxKufOdq/+4NHbBEYJ7/6I3beeqcdYu+h5ze4kGDQpOBCGBMgGRGkPFuMIoIZh6a6DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=eswincomputing.com;
	spf=pass smtp.mailfrom=eswincomputing.com;
	dkim=fail reason="signature verification failed" header.d=eswincomputing.com header.i=@eswincomputing.com header.a=rsa-sha256 header.s=dkim header.b=hCpiP8v3;
	arc=none smtp.remote-ip=13.75.44.102
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98782606A321
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 08:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98782606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eswincomputing.com header.i=@eswincomputing.com header.a=rsa-sha256 header.s=dkim header.b=hCpiP8v3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=eswincomputing.com; s=dkim; h=Received:Date:From:To:Cc:Subject:
	In-Reply-To:References:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID; bh=Xx1e4NsuVflPEtaWduYet2H7WSmulX5RUsGq
	ouRg/Rc=; b=hCpiP8v3KwT+/k0v/aqAqEyQ5j1iUuMcizjtNxWPFUhemY6fAqfG
	kAvuNiIxs9Qzaf/0VU4bsRzOG2wooPKJieSQ5O002sT5hcq95Lnx5RQ+/rX9QiH4
	jpvfhm5LRpdUGWUmfo6gak0mowNOnjHkxQc9/3KANBZDCN7vX9Qu+hY=
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Wed, 25 Nov 2026 16:12:18 +0800 (GMT+08:00)
Date: Wed, 25 Nov 2026 16:12:18 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xuyang Dong" <dongxuyang@eswincomputing.com>
To: gaohan@iscas.ac.cn, "Stephen Boyd" <sboyd@kernel.org>,
	"Brian Masney" <bmasney+clk@redhat.com>,
	"Jerome Brunet" <jbrunet+clk@baylibre.com>
Cc: "Brian Masney" <bmasney@redhat.com>, "Han Gao" <rabenda.cn@gmail.com>,
	linux-clk@vger.kernel.org,
	"Yifeng Huang" <huangyifeng@eswincomputing.com>,
	"Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>,
	"Min Lin" <linmin@eswincomputing.com>
Subject: Re: [PATCH 2/2] clk: eswin: Use REFDIV and the post-dividers in the
 EIC7700 PLL rate
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20261125-eic7700-cpu-pll-postdiv-v1-2-b1ccd6339a20@iscas.ac.cn>
References: <20261125-eic7700-cpu-pll-postdiv-v1-0-b1ccd6339a20@iscas.ac.cn>
 <20261125-eic7700-cpu-pll-postdiv-v1-2-b1ccd6339a20@iscas.ac.cn>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <16529f.d68.1a211c3400b.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgA38xximAZr5OsAAA--.612W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAgECAmsFvK8Wx
	QABss
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiAKPiBjbGtfcGxsX3JlY2FsY19yYXRlKCkgaWdub3JlcyBSRUZESVYgYW5kIHRoZSBGT1VUMSBw
b3N0LWRpdmlkZXJzLCBzbwo+IGl0IHJlcG9ydHMgdGhlIHdyb25nIHJhdGUgaWYgZmlybXdhcmUg
c2V0IHRoZW0uIFVzZSB0aGUgZnVsbCBmb3JtdWxhCj4gZnJvbSB0aGUgVFJNLgo+IAo+IExpbms6
IGh0dHBzOi8vZ2l0aHViLmNvbS9lc3dpbmNvbXB1dGluZy9FSUM3NzAwWC1Tb0MtVGVjaG5pY2Fs
LVJlZmVyZW5jZS1NYW51YWwvcmVsZWFzZXMvZG93bmxvYWQvdjEuMC4wLTIwMjUwMTAzL0VJQzc3
MDBYX1NvQ19UZWNobmljYWxfUmVmZXJlbmNlX01hbnVhbF9QYXJ0MS5wZGYKPiBTaWduZWQtb2Zm
LWJ5OiBIYW4gR2FvIDxnYW9oYW5AaXNjYXMuYWMuY24+Cj4gLS0tCj4gIGRyaXZlcnMvY2xrL2Vz
d2luL2Nsay5jIHwgMTcgKysrKysrKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xr
L2Vzd2luL2Nsay5jIGIvZHJpdmVycy9jbGsvZXN3aW4vY2xrLmMKPiBpbmRleCA3ZDUxZDNhOGZj
MDZkN2I0YTBkNzQzNWFlYjBjYjBlNThlMTY3MDhlLi41MWQ4MTZjNmQxOWI4YTIyMDQ1YjE0N2E4
NjNiMzljOWYzYzlhN2YxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL2Vzd2luL2Nsay5jCj4g
KysrIGIvZHJpdmVycy9jbGsvZXN3aW4vY2xrLmMKPiBAQCAtMTM1LDkgKzEzNSwxMCBAQCBzdGF0
aWMgdW5zaWduZWQgbG9uZyBjbGtfcGxsX3JlY2FsY19yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LAo+
ICB7Cj4gIAlzdHJ1Y3QgZXN3aW5fY2xrX3BsbCAqY2xrID0gdG9fcGxsX2Nsayhodyk7Cj4gIAl1
NjQgZmJkaXZfdmFsLCBmcmFjX3ZhbCwgdG1wOwo+IC0JdTMyIHJlbSwgdmFsOwo+ICsJdTMyIHJl
ZmRpdiwgcG9zdGRpdl9hLCBwb3N0ZGl2X2IsIHJlbSwgdmFsOwo+ICAKPiAgCXZhbCA9IHJlYWRs
X3JlbGF4ZWQoY2xrLT5jdHJsX3JlZzApOwo+ICsJcmVmZGl2ID0gRklFTERfR0VUKFBMTF9SRUZE
SVZfTUFTSywgdmFsKTsKPiAgCXZhbCAmPSBQTExfRkJESVZfTUFTSzsKPiAgCWZiZGl2X3ZhbCA9
ICh2YWwgPj4gY2xrLT5mYmRpdl9zaGlmdCk7Cj4gIAo+IEBAIC0xNDUsNyArMTQ2LDE3IEBAIHN0
YXRpYyB1bnNpZ25lZCBsb25nIGNsa19wbGxfcmVjYWxjX3JhdGUoc3RydWN0IGNsa19odyAqaHcs
Cj4gIAl2YWwgJj0gUExMX0ZSQUNfTUFTSzsKPiAgCWZyYWNfdmFsID0gKHZhbCA+PiBjbGstPmZy
YWNfc2hpZnQpOwo+ICAKPiAtCS8qIHJhdGUgPSAyNDAwMDAwMCAqIChmYmRpdiArIGZyYWMgLyAo
MiBeIDI0KSkgLyA0ICovCj4gKwl2YWwgPSByZWFkbF9yZWxheGVkKGNsay0+Y3RybF9yZWcyKTsK
PiArCXBvc3RkaXZfYSA9IEZJRUxEX0dFVChQTExfUE9TVERJVjFfQV9NQVNLLCB2YWwpOwo+ICsJ
cG9zdGRpdl9iID0gRklFTERfR0VUKFBMTF9QT1NURElWMV9CX01BU0ssIHZhbCk7Cj4gKwo+ICsJ
aWYgKCFyZWZkaXYpCj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICsJLyoKPiArCSAqIHJhdGUgPSBwYXJl
bnRfcmF0ZSAqIChmYmRpdiArIGZyYWMgLyAyXjI0KSAvCj4gKwkgKgkgICg0ICogcmVmZGl2ICog
KHBvc3RkaXZfYSArIDEpICogKHBvc3RkaXZfYiArIDEpKQo+ICsJICovCj4gIAl0bXAgPSBwYXJl
bnRfcmF0ZSAqIGZyYWNfdmFsOwo+ICAJcmVtID0gZG9fZGl2KHRtcCwgQklUKDI0KSk7Cj4gIAlp
ZiAocmVtKQo+IEBAIC0xNTMsNyArMTY0LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgY2xrX3Bs
bF9yZWNhbGNfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywKPiAgCWVsc2UKPiAgCQl0bXAgPSBwYXJl
bnRfcmF0ZSAqIGZiZGl2X3ZhbCArIHRtcDsKPiAgCj4gLQlkb19kaXYodG1wLCA0KTsKPiArCWRv
X2Rpdih0bXAsIDQgKiByZWZkaXYgKiAocG9zdGRpdl9hICsgMSkgKiAocG9zdGRpdl9iICsgMSkp
Owo+ICAKPiAgCXJldHVybiB0bXA7Cj4gIH0KPiAKCkFja2VkLWJ5OiBYdXlhbmcgRG9uZyA8ZG9u
Z3h1eWFuZ0Blc3dpbmNvbXB1dGluZy5jb20+CgpUaGFua3MsClh1eWFuZyBEb25nCg==
