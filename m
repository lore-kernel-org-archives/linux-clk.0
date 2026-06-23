Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59CB175A74;
	Tue, 23 Jun 2026 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782197940; cv=none; b=iqIZF3T7hxJZI5LIDbPth/xaVp8F52j6orfuSuxnCRtcICMuakrR0fdO82Q+0EoI1JR5QBHhTAh/rTSG9PHb04+mDFEqInM5u5n/yB5voVZu7zaV3+U7tTZXtdj0DDyXmfiG1d2krgaxUynW5vCMej0It+rPcm3m+XEq61MzEUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782197940; c=relaxed/simple;
	bh=1SUpf1Rv4Ul/BLfsa6iNoxj2OUIf3xcqZpUbx6ihP1w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=snuwSUQ7KcGhxTypHpQdUOUPON4fLzWL7i/BqUgEBwtgN06sBkaEXxQUX4mX3XVQKO5n1JW3VqvenyctdqouWnjQjoiu7iawPJsx9HXixmBSki1SNuTjQa7uDvPhppHfTTJ2vDsE87BX/2a8s3qOoccxqR529Y2bz6oYYs6X/OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Tue, 23 Jun 2026 14:58:47 +0800 (GMT+08:00)
Date: Tue, 23 Jun 2026 14:58:47 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xuyang Dong" <dongxuyang@eswincomputing.com>
To: "Brian Masney" <bmasney@redhat.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, huangyifeng@eswincomputing.com,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: Re: Re: [PATCH] clk: eswin: Add CLK_IGNORE_UNUSED to NoC clock
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <ajAnepoevsCEHdqg@redhat.com>
References: <20260605092118.1945-1-dongxuyang@eswincomputing.com>
 <ajAnepoevsCEHdqg@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <15b38ccf.7988.19ef3463cc9.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgDH3aCnLjpqbXgtAA--.8134W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAQEHAmo5Y6Mt0
	AAAsr
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiAKPiBPbiBGcmksIEp1biAwNSwgMjAyNiBhdCAwNToyMToxOFBNICswODAwLCBkb25neHV5YW5n
QGVzd2luY29tcHV0aW5nLmNvbSB3cm90ZToKPiA+IEZyb206IFh1eWFuZyBEb25nIDxkb25neHV5
YW5nQGVzd2luY29tcHV0aW5nLmNvbT4KPiA+IAo+ID4gVGhlIGdhdGVfbm9jX25zcF9jbGsgcHJv
dmlkZXMgdGhlIGVzc2VudGlhbCBjbG9jayBzb3VyY2UgZm9yIE5QVSwKPiA+IERTUCwgYW5kIFBD
SWUgc3Vic3lzdGVtcy4gRHVyaW5nIGtlcm5lbCBpbml0LCB0aGUgY2xvY2sgZnJhbWV3b3JrCj4g
PiBhdHRlbXB0cyB0byBkaXNhYmxlIHVudXNlZCBjbG9ja3Mgd2hlbiBjbGtfaWdub3JlX3VudXNl
ZCBrZXJuZWwKPiA+IHBhcmFtZXRlciBpcyBub3Qgc2V0Lgo+ID4gSG93ZXZlciwgZ2F0ZV9ub2Nf
bnNwX2NsayBpcyByZXF1aXJlZCB0byByZW1haW4gZW5hYmxlZCBmb3IgdGhlc2UKPiA+IGNyaXRp
Y2FsIHN1YnN5c3RlbXMgdG8gZnVuY3Rpb24gcHJvcGVybHksIGNhdXNpbmcgUENJZSBib290IGZh
aWx1cmVzCj4gPiB3aGVuIGF1dG8tZGlzYWJsZWQuCj4gPiAKPiA+IEFkZCBDTEtfSUdOT1JFX1VO
VVNFRCBmbGFnIHRvIGdhdGVfbm9jX25zcF9jbGsgdG8gZW5zdXJlIGl0IHN0YXlzCj4gPiBlbmFi
bGVkIGV2ZW4gd2hlbiBjbGtfaWdub3JlX3VudXNlZCBpcyBub3Qgc3BlY2lmaWVkIGluIGtlcm5l
bAo+ID4gY29tbWFuZCBsaW5lLgo+ID4gCj4gPiBGaXhlczogY2Q0NGYxMjdjMWQ0ICgiY2xrOiBl
c3dpbjogQWRkIGVpYzc3MDAgY2xvY2sgZHJpdmVyIikKPiA+IFNpZ25lZC1vZmYtYnk6IFh1eWFu
ZyBEb25nIDxkb25neHV5YW5nQGVzd2luY29tcHV0aW5nLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTog
QnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhhdC5jb20+Cj4gCj4gRllJLCBJIHBvc3RlZCBhIHNl
cmllcyB0byBpbXBsZW1lbnQgc3luY19zdGF0ZSBzdXBwb3J0IGZvciB0aGUgY2xrCj4gc3Vic3lz
dGVtLCB3aGljaCBzaG91bGQgZml4IHRoZXNlIHR5cGUgb2YgaXNzdWVzIGZvciB0aGUgbG9uZyB0
ZXJtLiBJZgo+IHlvdSBoYXBwZW4gdG8gaGF2ZSB0aW1lLCBJIHdvdWxkIGFwcHJlY2lhdGUgaXQg
aWYgeW91IGhhdmUgdGltZSB0byB0ZXN0Cj4gdGhpcyBzZXJpZXMgb24geW91ciBoYXJkd2FyZSwg
YW5kIGRyb3AgYSBUZXN0ZWQtYnkuCj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
Y2xrLzIwMjYwNjAzLWNsay1zeW5jLXN0YXRlLXYxLTAtNDU3MTIwZWVkMjAwQHJlZGhhdC5jb20v
Cj4gCj4gSSBoYXZlIGEgbmV3IHNlcmllcyByZWFkeSB0aGF0IEknbSBwbGFubmluZyB0byBwb3N0
IHRvbW9ycm93LiBJJ20KPiB3YWl0aW5nIHRvIGhlYXIgYmFjayBhYm91dCB0aGUgb25nb2luZyBj
b252ZXJzYXRpb24gb24gdGhhdCB0aHJlYWQuCj4gCj4gT25jZSB0aGlzIGxhbmRzLCB0aGVyZSBz
aG91bGRuJ3QgYmUgbXVjaCBuZWVkIGZvciB0aGUgQ0xLX0lHTk9SRV9VTlVTRUQKPiBmbGFnLiBJ
J20gY3VyaW91cyBpZiB5b3UgcmV2ZXJ0IHRoaXMgcGF0Y2ggaW4geW91ciB0cmVlIGlmIHRoZSBu
ZWVkIGZvciB0aGUKPiBmbGFnIGdvZXMgYXdheSB3aXRoIHRoZSBzeW5jX3N0YXRlIGNoYW5nZXMg
YXBwbGllZC4KPiAKPiBMZXQncyBnZXQgeW91ciBjaGFuZ2UgaW4gdGhlIHRyZWUgdGhvdWdoLiBJ
ZiB3ZSBtZXJnZWQgc3luY19zdGF0ZSB0b2RheSwKPiBpdCB3b24ndCBiZSBlbGlnaWJsZSB0byBi
ZSBiYWNrcG9ydGVkIHRvIHRoZSBzdGFibGUga2VybmVscywgYW5kIHRoZQo+IENMS19JR05PUkVf
VU5VU0VEIGZsYWcgaXMgYW4gZWFzaWVyIGJhY2twb3J0Lgo+IAoKSGkgQnJpYW4sCgpUaGFuayB5
b3UgZm9yIHlvdXIgcGF0Y2ggc2V0IGFib3ZlLiBIb3dldmVyLCB3ZSBzdGlsbCBuZWVkIHRoaXMg
Zml4IHBhdGNowqAKYXQgdGhlIG1vbWVudCwgYmVjYXVzZSBnYXRlX25vY19uc3BfY2xrIHN0aWxs
IG5lZWRzIHRvIGJlIGVuYWJsZWQgd2hlbsKgCmFjY2Vzc2luZyBQQ0llLgoKQmVzdCByZWdhcmRz
LApYdXlhbmcgRG9uZwo=
