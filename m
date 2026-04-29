Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.175.55.52])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7203BC668;
	Wed, 29 Apr 2026 09:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.175.55.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455554; cv=none; b=G51pS35FfZijaSVTwbUj3gJvSGe1JXlTOlxyv+xIdaYBvIa9ZT5PB4qw2Oh3qItIA3H00JiT4RpzIwJ0SDe/i9UajjNSt8fe/Xk/CSGd9Ugp08rueCH9J19rdi2COZ45Zmtot7SARyqXPQJ65YrdBJ0HJFPfH49oha3/bZi/P0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455554; c=relaxed/simple;
	bh=CsXoKp3QU4hX0jOGETgiJGVyBgiXEmemloORdgsX8ag=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=mwai0VG+8c0+/2hoZQFv8onqkl8AmGtBq128mjihad4wcF4kOYpPNmUf/4VT6sQiG1hAE9YjzOpGf/TwSHh7aZYDZvT+K1jlsPc59nMOOdod5jgWysAV6VX95KHtki/yhYfFrlLsRukSWsIw6tpJ9PsOSEfv/pXqPiWcpsVOXig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=52.175.55.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Wed, 29 Apr 2026 17:38:51 +0800 (GMT+08:00)
Date: Wed, 29 Apr 2026 17:38:51 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xuyang Dong" <dongxuyang@eswincomputing.com>
To: "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, huangyifeng@eswincomputing.com,
	benoit.monin@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: Re: Re: [PATCH v3 2/3] clk: eswin: Add eic7700 HSP clock
 driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <177742748214.5403.15526965667317467444@localhost.localdomain>
References: <20260423090904.2108-1-dongxuyang@eswincomputing.com>
 <20260423091114.2326-1-dongxuyang@eswincomputing.com>
 <aeo8nn-eigzlojWx@redhat.com>
 <4e5c887.5a31.19dbf179fb6.Coremail.dongxuyang@eswincomputing.com>
 <CABx5tqK7p_XJHfXZ70gXhR88PzAteV7cVSFPoRzccgmjanADMw@mail.gmail.com>
 <177733570840.5403.12558106273673899411@lazor>
 <7a76d8cb.5bab.19dd3645d4e.Coremail.dongxuyang@eswincomputing.com>
 <177742748214.5403.15526965667317467444@localhost.localdomain>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4257942f.5c6d.19dd89b06f8.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgAnPJ+r0fFpY68VAA--.3070W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAQEMAmnw4RseG
	QACso
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiA+IAo+ID4gVGhlIGNvbW1vbiBnYXRlIEFQSSwgdGhlIEhTUCBwcml2YXRlIEFQSSwgYW5kIHRo
ZSByZXNldCBkcml2ZXIgYWxsIGFjY2Vzc8KgCj4gPiB0aGUgc2FtZSByZWdpc3RlciBzcGFjZS4K
PiA+IFRoZXJlZm9yZSwgdGhleSBuZWVkIHRvIGJlIHByb3RlY3RlZCBieSB0aGUgc2FtZSBkYXRh
LT5sb2NrLgo+ID4gCj4gCj4gSWYgZXZlcnl0aGluZyBpcyBhY2Nlc3NpbmcgcmVnaXN0ZXJzIHRo
cm91Z2ggcmVnbWFwIHdoeSBhcmVuJ3Qgd2UgdXNpbmcKPiB0aGUgYnVpbHRpbiBsb2NrIHdpdGgg
c3RydWN0IHJlZ21hcF9jb25maWc6OnVzZV9yYXdfc3BpbmxvY2s/IEkgZG9uJ3QKPiB1bmRlcnN0
YW5kIHdoeSB3ZSdyZSByb2xsaW5nIG91ciBvd24gaGVyZS4KCkhpIFN0ZXBoZW4sCgpJbiB0aGUg
SFNQIGNsb2NrIGRyaXZlciBhbmQgcmVzZXQgZHJpdmVyLCB0aGVyZSBhcmUgdGhyZWUgY29tcG9u
ZW50cyB0aGF0CmFjY2VzcyB0aGUgSFNQIHJlZ2lzdGVyIHNwYWNlOiBhIGNvbW1vbiBnYXRlIGNs
b2NrLCBhIGN1c3RvbSBnYXRlIGNsb2NrwqAKKGkuZS4sIDB4ODAwKSwgYW5kIGEgcmVzZXQuCgox
LiBUaGUgY29tbW9uIGdhdGUgdXNlcyBlc3dpbl9jbGtfcmVnaXN0ZXJfZ2F0ZSgpIHRvIHJlZ2lz
dGVyIGEgZ2F0ZSBjbG9ja8KgCnZpYSBkZXZtX2Nsa19od19yZWdpc3Rlcl9nYXRlX3BhcmVudF9k
YXRhKCkuIEl0IGFjY2Vzc2VzIHRoZSByZWdpc3RlcsKgCnVzaW5nIGNsa19nYXRlX2VuZGlzYWJs
ZSgpLgoKc3RhdGljIHZvaWQgY2xrX2dhdGVfZW5kaXNhYmxlKHN0cnVjdCBjbGtfaHcgKmh3LCBp
bnQgZW5hYmxlKQp7CglzdHJ1Y3QgY2xrX2dhdGUgKmdhdGUgPSB0b19jbGtfZ2F0ZShodyk7Cgl1
bnNpZ25lZCBsb25nIGZsYWdzOwoKCWlmIChnYXRlLT5sb2NrKQoJCXNwaW5fbG9ja19pcnFzYXZl
KGdhdGUtPmxvY2ssIGZsYWdzKTsKCWVsc2UKCQlfX2FjcXVpcmUoZ2F0ZS0+bG9jayk7Ci4uLgoJ
aWYgKGdhdGUtPmxvY2spCgkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZShnYXRlLT5sb2NrLCBmbGFn
cyk7CgllbHNlCgkJX19yZWxlYXNlKGdhdGUtPmxvY2spOwp9CgpUaGUgZ2F0ZS0+bG9jayBpbiB1
c2UgaXMgdGhlIGRhdGEtPmxvY2sgcGFzc2VkIGluIGZyb20gdGhlIGNsb2NrIGRyaXZlci4KCjIu
IFRoZSBjdXN0b20gZ2F0ZSB1c2VzIGhzcF9jbGtfcmVnaXN0ZXJfZ2F0ZSgpIHRvIHJlZ2lzdGVy
IGEgZ2F0ZSBjbG9jay4gCkl0IGFjY2Vzc2VzIHRoZSByZWdpc3RlciB1c2luZyBoc3BfY2xrX2dh
dGVfZW5kaXNhYmxlKCkuCgpzdGF0aWMgdm9pZCBoc3BfY2xrX2dhdGVfZW5kaXNhYmxlKHN0cnVj
dCBjbGtfaHcgKmh3LCBpbnQgZW5hYmxlKQp7CglzdHJ1Y3QgZWljNzcwMF9oc3BfY2xrX2dhdGUg
KmdhdGUgPSB0b19nYXRlX2Nsayhodyk7CgoJZ3VhcmQoc3BpbmxvY2tfaXJxc2F2ZSkoZ2F0ZS0+
bG9jayk7Ci4uLgp9CgpUaGUgZ2F0ZS0+bG9jayBpbiB1c2UgaXMgdGhlIHNhbWUgZGF0YS0+bG9j
ayBwYXNzZWQgaW4gZnJvbSB0aGUgY2xvY2vCoApkcml2ZXIuCgozLiBUaGUgcmVzZXQgdXNlcyBl
aWM3NzAwX2hzcF9yZXNldF9hc3NlcnQoKSBhbmTCoAplaWM3NzAwX2hzcF9yZXNldF9kZWFzc2Vy
dCgpLCB3aGljaCBjYWxsIHJlZ21hcF9hc3NpZ25fYml0cygpIHRvIGFjY2Vzc8KgCnRoZSByZWdp
c3Rlci4KCkFsbCB0aHJlZSBtZXRob2RzIGFjY2VzcyB0aGUgc2FtZSByZWdpc3RlciBzcGFjZTsg
dGhlcmVmb3JlLCB0aGV5IG11c3QgYmXCoApwcm90ZWN0ZWQgYnkgdGhlIHNhbWUgbG9jayAoZGF0
YS0+bG9jaykuCgpUaGF0J3Mgd2h5IHdlIGludHJvZHVjZWQgZWljNzcwMF9oc3BfcmVnbWFwX2xv
Y2svdW5sb2NrIGZvcsKgCmVpYzc3MDBfaHNwX3JlZ21hcF9jb25maWcuCgllaWM3NzAwX2hzcF9y
ZWdtYXBfY29uZmlnID0gewoJCS5sb2NrID0gZWljNzcwMF9oc3BfcmVnbWFwX2xvY2ssCgkJLnVu
bG9jayA9IGVpYzc3MDBfaHNwX3JlZ21hcF91bmxvY2ssCgkJLmxvY2tfYXJnID0gbG9ja19jdHgs
Cgl9OwoKVGhlICdsb2NrX2N0eC0+bG9jaycgaW4gZWljNzcwMF9oc3BfcmVnbWFwX2xvY2svdW5s
b2NrIGlzIHRoZSAnZGF0YS0+bG9jaycuCglzdGF0aWMgdm9pZCBlaWM3NzAwX2hzcF9yZWdtYXBf
bG9jayh2b2lkICphcmcpCglfX2FjcXVpcmVzKGxvY2tfY3R4LT5sb2NrKQoJewoJCXN0cnVjdCBl
aWM3NzAwX2hzcF9yZWdtYXBfbG9jayAqY29uc3QgbG9ja19jdHggPSBhcmc7CgkJdW5zaWduZWQg
bG9uZyBmbGFnczsKCQoJCXNwaW5fbG9ja19pcnFzYXZlKGxvY2tfY3R4LT5sb2NrLCBmbGFncyk7
CgkJbG9ja19jdHgtPmZsYWdzID0gZmxhZ3M7Cgl9CgpUaGUgc2ltaWxhciBhcHByb2FjaCBjYW4g
YmUgZm91bmQgaW4gY2xrLWlteDh1bHAtc2ltLWxwYXYuYy4KClRoZSBhbm5vdGF0aW9ucyB3aGF0
IHdlIG1lbnRpb25lZCBwcmV2aW91c2x5IGlzIHRoZSBhYm92ZcKgCiJfX2FjcXVpcmVzKGxvY2tf
Y3R4LT5sb2NrKSIuCgpCZXN0IHJlZ2FyZHMsClh1eWFuZyBEb25nCg==
