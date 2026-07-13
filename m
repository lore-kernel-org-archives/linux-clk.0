Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A38353A7C;
	Mon, 13 Jul 2026 02:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783910034; cv=none; b=bClxNf5IuPMoG+FhxUfxknDfaoX3iubrNJyhr3qxwlYJAhyjN40TqHBgIaxYj1hLN0OPgnfl32ZwhQBBlCwS6pgNaZPPE+MXttHt8v6ewiPuBryMnbhuIWcBWGyvSo16D4wQ3o2ex9wufErKvXLGz8IwNI2HWCOKVWQ1h0S51CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783910034; c=relaxed/simple;
	bh=LemyGesQmMr3daBTCnLNdOLunBZS+rVMJdzXZ5z2N/c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=dSZJfJaQBpxNadiyG4X0j1scKd2/eudKudDuz80FDebllgp6+Sh31Gl7pohVZ5zhJGl9qil3tqCFfaDKJqJjdyj0TUf79QuR5zJgJ3bQSk/abCG9/ZRUz37TS0FQ/LGesISK/eoFEvgadTKH1RHF5Z/59Jr1ukXhjWdxf0FlbI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from dongxuyang$eswincomputing.com ( [10.10.112.210] ) by
 ajax-webmail-app2 (Coremail) ; Mon, 13 Jul 2026 10:33:15 +0800 (GMT+08:00)
Date: Mon, 13 Jul 2026 10:33:15 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xuyang Dong" <dongxuyang@eswincomputing.com>
To: "Kostas Damaskinakis" <kostas.damaskinakis@gmail.com>
Cc: "Yifeng Huang" <huangyifeng@eswincomputing.com>,
	"Michael Turquette" <mturquette@baylibre.com>,
	"Stephen Boyd" <sboyd@kernel.org>,
	"Brian Masney" <bmasney@redhat.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: eswin: Zero-initialize stack-allocated
 clk_init_data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260710141520.285132-1-kostas.damaskinakis@gmail.com>
References: <20260710141520.285132-1-kostas.damaskinakis@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <41d68552.840f.19f5952553f.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgAnPJ9sTlRqPK4zAA--.7286W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAgEHAmpTwhsWQ
	AABsx
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiAKPiBlc3dpbl9jbGtfcmVnaXN0ZXJfcGxsKCkgYW5kIGVzd2luX3JlZ2lzdGVyX2Nsa2Rpdigp
IGRlY2xhcmUgYSBzdHJ1Y3QKPiBjbGtfaW5pdF9kYXRhIG9uIHRoZSBzdGFjayBhbmQgb25seSBp
bml0aWFsaXplIHNvbWUgb2YgaXRzIGZpZWxkcwo+IChwYXJlbnRfZGF0YSByZXNwZWN0aXZlbHkg
cGFyZW50X2h3cykuIGNsa19jb3JlX3BvcHVsYXRlX3BhcmVudF9tYXAoKQo+IGNoZWNrcyBwYXJl
bnRfbmFtZXMgZmlyc3QgYW5kIHBhcmVudF9kYXRhIHNlY29uZCBiZWZvcmUgZmFsbGluZyBiYWNr
Cj4gdG8gcGFyZW50X2h3cywgc28gbGVmdG92ZXIgc3RhY2sgZ2FyYmFnZSBpbiB0aGUgdW5pbml0
aWFsaXplZCBmaWVsZHMKPiBoaWphY2tzIHBhcmVudCByZXNvbHV0aW9uIGFuZCB0aGUgY2xrIGNv
cmUgZGVyZWZlcmVuY2VzIGEgYm9ndXMKPiBwb2ludGVyOgo+IAo+ICAgVW5hYmxlIHRvIGhhbmRs
ZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAw
MDAwMDAwMDAwMDBjCj4gICBPb3BzIFsjMV0KPiAgIGVwYyA6IF9fY2xrX3JlZ2lzdGVyKzB4MzFh
LzB4N2YwCj4gICBbPGZmZmZmZmZmODA1ZGM3NzQ+XSBfX2Nsa19yZWdpc3RlcisweDMxYS8weDdm
MAo+ICAgWzxmZmZmZmZmZjgwNWRjZDc2Pl0gZGV2bV9jbGtfaHdfcmVnaXN0ZXIrMHgyYS8weDk0
Cj4gICBbPGZmZmZmZmZmODA1ZTMxOWE+XSBlc3dpbl9yZWdpc3Rlcl9jbGtkaXYrMHg4MC8weGQw
Cj4gICBbPGZmZmZmZmZmODA1ZTM0YTA+XSBlc3dpbl9jbGtfcmVnaXN0ZXJfY2xrcysweDE2Mi8w
eDFhMAo+ICAgWzxmZmZmZmZmZjgwNWUzNzM2Pl0gZWljNzcwMF9jbGtfcHJvYmUrMHgxNDYvMHgx
ODAKPiAgIFs8ZmZmZmZmZmY4MDY1ZDIzYz5dIHBsYXRmb3JtX3Byb2JlKzB4M2MvMHg3YQo+IAo+
IE9ic2VydmVkIG9uIEVJQzc3MDAgaGFyZHdhcmUgKHdpdGggdGhlIGRyaXZlciBiYWNrcG9ydGVk
IHRvIGEgNi4xNwo+IHRyZWUpOyB3aGV0aGVyIHRoZSBidWcgdHJpZ2dlcnMgZGVwZW5kcyBlbnRp
cmVseSBvbiB3aGF0IHRoZSBzdGFjawo+IGhhcHBlbnMgdG8gY29udGFpbiB3aGVuIHRoZSByZWdp
c3RyYXRpb24gaGVscGVycyBydW4uCj4gCj4gWmVyby1pbml0aWFsaXplIGJvdGggc3RydWN0dXJl
cy4KPiAKPiBGaXhlczogY2Q0NGYxMjdjMWQ0ICgiY2xrOiBlc3dpbjogQWRkIGVpYzc3MDAgY2xv
Y2sgZHJpdmVyIikKPiBTaWduZWQtb2ZmLWJ5OiBLb3N0YXMgRGFtYXNraW5ha2lzIDxrb3N0YXMu
ZGFtYXNraW5ha2lzQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9jbGsvZXN3aW4vY2xrLmMg
fCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvZXN3aW4vY2xrLmMgYi9kcml2ZXJzL2Ns
ay9lc3dpbi9jbGsuYwo+IGluZGV4IGUwOWE1MmNjMy4uNzlkMWU0YzVlIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvY2xrL2Vzd2luL2Nsay5jCj4gKysrIGIvZHJpdmVycy9jbGsvZXN3aW4vY2xrLmMK
PiBAQCAtMjA0LDcgKzIwNCw3IEBAIGludCBlc3dpbl9jbGtfcmVnaXN0ZXJfcGxsKHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IGVzd2luX3BsbF9jbG9jayAqY2xrcywKPiAgCQkJICAgaW50IG51
bXMsIHN0cnVjdCBlc3dpbl9jbG9ja19kYXRhICpkYXRhKQo+ICB7Cj4gIAlzdHJ1Y3QgZXN3aW5f
Y2xrX3BsbCAqcF9jbGsgPSBOVUxMOwo+IC0Jc3RydWN0IGNsa19pbml0X2RhdGEgaW5pdDsKPiAr
CXN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQgPSB7fTsKPiAgCXN0cnVjdCBjbGtfaHcgKmNsa19o
dzsKPiAgCWludCBpLCByZXQ7Cj4gIAo+IEBAIC00MTksNyArNDE5LDcgQEAgc3RydWN0IGNsa19o
dyAqZXN3aW5fcmVnaXN0ZXJfY2xrZGl2KHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgaW50
IGlkLAo+ICAJCQkJICAgICB1bnNpZ25lZCBsb25nIHByaXZfZmxhZywgc3BpbmxvY2tfdCAqbG9j
aykKPiAgewo+ICAJc3RydWN0IGVzd2luX2RpdmlkZXJfY2xvY2sgKmRjbGs7Cj4gLQlzdHJ1Y3Qg
Y2xrX2luaXRfZGF0YSBpbml0Owo+ICsJc3RydWN0IGNsa19pbml0X2RhdGEgaW5pdCA9IHt9Owo+
ICAJc3RydWN0IGNsa19odyAqY2xrX2h3Owo+ICAJaW50IHJldDsKPiAgCgpBY2tlZC1ieTogWHV5
YW5nIERvbmcgPGRvbmd4dXlhbmdAZXN3aW5jb21wdXRpbmcuY29tPgoKVGhhbmtzLApYdXlhbmcK

