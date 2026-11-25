Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.101.248.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594351;
	b=cspqDmoDx8CholEi6NJiLvc/FjkKXEnE9TmfiwwOLQ5xduyBsjR1SgHjnTU/8xHlTG38
	 tlcrgA9I/QcutFOXMtOXWCtJKfgMcW2qrMo+GFXp9dFfI9fKoWriN1oqMNxNOzSGF1Qsl
	 rqKZ1Jcn1UG/63ihsm5KmKHdal8OJbYIoK2768rDCvwHasHaXZyS1Mp7Rt+t8oGFT+g5b
	 NGa0FrTkXoOOprUcXVDcSCw1hU5A3nl7D2djmC1C2Sjz+vbQtfB/94Hp7WGgWt/AXZDHb
	 fdTj8Jf0uWtksvDTkVo5VYsdBhS/NqFrd8ab6sICQLVvIeooA+LIPcLTQQ16ewtuBJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594351;
	h=DMARC-Filter:DKIM-Signature:Received:X-Originating-IP:Date:
	 X-CM-HeaderCharset:From:To:Cc:Subject:X-Priority:X-Mailer:In-Reply-To:
	 References:Content-Transfer-Encoding:Content-Type:MIME-Version:
	 Message-ID:X-Coremail-Locale:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=IxROUrbj2OyIQYAaLZPndigxH7uRMlpWXYDafZ0UHHY=;
	b=T40/Y67WXcwl64QUsl65fysl4rn3uFoFh0LAoZDUDInaYpJhpvNceQ+ZqloEzVG5rl2u
	 5fQttCSe8+RELArSfJQhuUcePzWGT0oTgnzija5B4vGHkRApuJAtAgswx1GyFFmbfQTn4
	 eYRM283QJqbtAWUzQYM8WYMfX4b91rOeewf615gNASCVEhFdxPKUx94k9OPCfW+99DWiM
	 BpTB9B3bofLktUbUx/O5p5IMXBhSaH9Rjm3uG96eqwuxflfvSJF5pc2IDTDnWGAJLD6ys
	 WD4NfMwKBPdPEZ0wxZbaJYefizAoGdbWUPXXqgOhUqpJ8hH297ZR6LH5OEubZwxx0TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=eswincomputing.com;
	spf=pass smtp.mailfrom=eswincomputing.com;
	dkim=fail reason="signature verification failed" header.d=eswincomputing.com header.i=@eswincomputing.com header.a=rsa-sha256 header.s=dkim header.b=kIN+RTLh;
	arc=none smtp.remote-ip=46.101.248.176
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net (zg8tndyumtaxlji0oc4xnzya.icoremail.net [46.101.248.176])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EF4606A31E
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 08:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70EF4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=eswincomputing.com header.i=@eswincomputing.com header.a=rsa-sha256 header.s=dkim header.b=kIN+RTLh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=eswincomputing.com; s=dkim; h=Received:Date:From:To:Cc:Subject:
	In-Reply-To:References:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID; bh=nIba6LE2LAbyqhcAe1PunXg44U++N/4rdw1w
	V79HaJQ=; b=kIN+RTLhwVQQhqKOUtW7207jMiqgiE/VZEagAD+p5MQ2mg7tpxZb
	mHKidEHvvZ15+xNqrIUDUZDA9TpoBYkPAFXoS0cQNasm+u+QNJfB6h4OvgilHdV/
	U1tussO/U8IUTp5AzpeQ409cecW8xS71LplzRuk0u26RnG5KrxK6E5I=
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Wed, 25 Nov 2026 16:12:08 +0800 (GMT+08:00)
Date: Wed, 25 Nov 2026 16:12:08 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xuyang Dong" <dongxuyang@eswincomputing.com>
To: gaohan@iscas.ac.cn, "Stephen Boyd" <sboyd@kernel.org>,
	"Brian Masney" <bmasney+clk@redhat.com>,
	"Jerome Brunet" <jbrunet+clk@baylibre.com>
Cc: "Brian Masney" <bmasney@redhat.com>, "Han Gao" <rabenda.cn@gmail.com>,
	linux-clk@vger.kernel.org,
	"Jingkun Zheng" <zhengjingkun@iscas.ac.cn>,
	"Yifeng Huang" <huangyifeng@eswincomputing.com>,
	"Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>,
	"Min Lin" <linmin@eswincomputing.com>
Subject: Re: [PATCH 1/2] clk: eswin: Fix the EIC7700 PLL post-divider
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20261125-eic7700-cpu-pll-postdiv-v1-1-b1ccd6339a20@iscas.ac.cn>
References: <20261125-eic7700-cpu-pll-postdiv-v1-0-b1ccd6339a20@iscas.ac.cn>
 <20261125-eic7700-cpu-pll-postdiv-v1-1-b1ccd6339a20@iscas.ac.cn>
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
Message-ID: <34f87a48.d67.1a211c31945.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgA38xxYmAZr4OsAAA--.611W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAgECAmsFvK8Wx
	QAAst
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiAKPiBCb3RoIFBMTCBjbG9ja3MgYXJlIEZPVVQxIG9mIHRoZWlyIFBMTC4gUGVyIHRoZSBUUk06
Cj4gCj4gICBGT1VUMSA9IEZSRUYgKiAoRkJESVYgKyBGUkFDIC8gMl4yNCkgLwo+ICAgICAgICAg
ICAoNCAqIFJFRkRJViAqIChQT1NURElWMV9BICsgMSkgKiAoUE9TVERJVjFfQiArIDEpKQo+IAo+
IFRoZSBkcml2ZXIgbGVhdmVzIHRoZSBwb3N0LWRpdmlkZXJzIG91dCBvZiBpdHMgcmF0ZSBtYXRo
LCBidXQKPiBjbGtfcGxsX3NldF9yYXRlKCkgc2V0cyBQT1NURElWMV9BIChiaXRzIDEwOjgpIHRv
IDEsIHdoaWNoIGhhbHZlcyB0aGUKPiBvdXRwdXQuIEl0IGFsc28gd3JpdGVzIGJpdHMgMTg6MTYg
YXMgIlBPU1RESVYyIiwgd2hpY2ggaXMgcmVhbGx5Cj4gUE9TVERJVjJfQSBmb3IgRk9VVDIuCj4g
Cj4gT24gdGhlIEhpRml2ZSBQcmVtaWVyIFA1NTAgdGhlIENQVSByYW4gYXQgNjk5IE1IeiB3aGVu
IENQVUZyZXEgc2V0Cj4gMS40IEdIei4KPiAKPiBDbGVhciBQT1NURElWMV9BIGFuZCBQT1NURElW
MV9CIChiaXRzIDE0OjEyKSBpbnN0ZWFkLCBhbmQgbGVhdmUgRk9VVDIKPiBhbG9uZS4KPiAKPiBG
aXhlczogY2Q0NGYxMjdjMWQ0ICgiY2xrOiBlc3dpbjogQWRkIGVpYzc3MDAgY2xvY2sgZHJpdmVy
IikKPiBSZXBvcnRlZC1ieTogSmluZ2t1biBaaGVuZyA8emhlbmdqaW5na3VuQGlzY2FzLmFjLmNu
Pgo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9lc3dpbmNvbXB1dGluZy9FSUM3NzAwWC1Tb0Mt
VGVjaG5pY2FsLVJlZmVyZW5jZS1NYW51YWwvcmVsZWFzZXMvZG93bmxvYWQvdjEuMC4wLTIwMjUw
MTAzL0VJQzc3MDBYX1NvQ19UZWNobmljYWxfUmVmZXJlbmNlX01hbnVhbF9QYXJ0MS5wZGYKPiBT
aWduZWQtb2ZmLWJ5OiBIYW4gR2FvIDxnYW9oYW5AaXNjYXMuYWMuY24+Cj4gLS0tCj4gIGRyaXZl
cnMvY2xrL2Vzd2luL2Nsay5jIHwgOSArKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsv
ZXN3aW4vY2xrLmMgYi9kcml2ZXJzL2Nsay9lc3dpbi9jbGsuYwo+IGluZGV4IGU4ODUxMjgzY2Nk
YmYwZWE1NzAwMjUxMWY5OTFjOWQ2OGE3ZjQ3ODguLjdkNTFkM2E4ZmMwNmQ3YjRhMGQ3NDM1YWVi
MGNiMGU1OGUxNjcwOGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvZXN3aW4vY2xrLmMKPiAr
KysgYi9kcml2ZXJzL2Nsay9lc3dpbi9jbGsuYwo+IEBAIC0yMSw4ICsyMSw4IEBACj4gICNkZWZp
bmUgUExMX1JFRkRJVl9NQVNLCQlHRU5NQVNLKDE3LCAxMikKPiAgI2RlZmluZSBQTExfRkJESVZf
TUFTSwkJR0VOTUFTSygzMSwgMjApCj4gICNkZWZpbmUgUExMX0ZSQUNfTUFTSwkJR0VOTUFTSygy
NywgNCkKPiAtI2RlZmluZSBQTExfUE9TVERJVjFfTUFTSwlHRU5NQVNLKDEwLCA4KQo+IC0jZGVm
aW5lIFBMTF9QT1NURElWMl9NQVNLCUdFTk1BU0soMTgsIDE2KQo+ICsjZGVmaW5lIFBMTF9QT1NU
RElWMV9BX01BU0sJR0VOTUFTSygxMCwgOCkKPiArI2RlZmluZSBQTExfUE9TVERJVjFfQl9NQVNL
CUdFTk1BU0soMTQsIDEyKQo+ICAKPiAgc3RydWN0IGVzd2luX2Nsb2NrX2RhdGEgKmVzd2luX2Ns
a19pbml0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCj4gIAkJCQkJc2l6ZV90IG5yX2Ns
a3MpCj4gQEAgLTExMCwxMCArMTEwLDkgQEAgc3RhdGljIGludCBjbGtfcGxsX3NldF9yYXRlKHN0
cnVjdCBjbGtfaHcgKmh3LCB1bnNpZ25lZCBsb25nIHJhdGUsCj4gIAl2YWwgfD0gRklFTERfUFJF
UChQTExfRlJBQ19NQVNLLCBmcmFjX3ZhbCk7Cj4gIAl3cml0ZWxfcmVsYXhlZCh2YWwsIGNsay0+
Y3RybF9yZWcxKTsKPiAgCj4gKwkvKiBlc3dpbl9jYWxjX3BsbCgpIGFzc3VtZXMgRk9VVDEgaXMg
bm90IHBvc3QtZGl2aWRlZCAqLwo+ICAJdmFsID0gcmVhZGxfcmVsYXhlZChjbGstPmN0cmxfcmVn
Mik7Cj4gLQl2YWwgJj0gfihQTExfUE9TVERJVjFfTUFTSyB8IFBMTF9QT1NURElWMl9NQVNLKTsK
PiAtCXZhbCB8PSBGSUVMRF9QUkVQKFBMTF9QT1NURElWMV9NQVNLLCAxKTsKPiAtCXZhbCB8PSBG
SUVMRF9QUkVQKFBMTF9QT1NURElWMl9NQVNLLCAxKTsKPiArCXZhbCAmPSB+KFBMTF9QT1NURElW
MV9BX01BU0sgfCBQTExfUE9TVERJVjFfQl9NQVNLKTsKPiAgCXdyaXRlbF9yZWxheGVkKHZhbCwg
Y2xrLT5jdHJsX3JlZzIpOwo+ICAKPiAgCS8qIExhc3QsIGVuYWJsZSBwbGwgKi8KPiAKClRoYW5r
cyBmb3IgY2F0Y2hpbmcgdGhpcy4gWW91J3JlIHJpZ2h0IC0gdGhlIHJlZ2lzdGVyIHVzYWdlIGFu
ZMKgCmNvbmZpZ3VyYXRpb24gaGVyZSBhcmUgaW5jb3JyZWN0LsKgCgpUaGUgZml4IGFzIGRlc2Ny
aWJlZCBsb29rcyBnb29kIHRvIG1lLgoKQWNrZWQtYnk6IFh1eWFuZyBEb25nIDxkb25neHV5YW5n
QGVzd2luY29tcHV0aW5nLmNvbT4KClRoYW5rcywKWHV5YW5nIERvbmcK
