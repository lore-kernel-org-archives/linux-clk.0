Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [4.193.249.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6553D9DC3;
	Mon, 18 May 2026 06:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.193.249.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779084965; cv=none; b=mLY8mhD0WwusFd/u4X9PQZR1nI9tXHtkN43ktXA070JpHAMYFt0M7TPVcZFrW55sE5DSw/ljNIgin1c0NgbJVloUfoZeR4aULTQgG4qR1f+bZcReN3dm1o9Lucl4AqRijdalK3H7607agaR4PYDRtMCJ0Gr4sHITNN+v+Rb/+EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779084965; c=relaxed/simple;
	bh=attnInHP7M2QikeQ33hIVmkhpcTpP2HXxNPUM8PpmPE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=UYKHJZLIhuX14xw4TzJwGFCZae0m0FP9fbTH1bXM/QVHb/r8yEvGEqcC465GNmPmMZVBGGGvqNBfTSTD3zHGDgRKwBL/VYiwWgHU3lGy9D67up/0SYb7A/fyJx2sO+VPpHbby/S/hl1l1Ni2ef8r24x78aj691YGZMyDUe4XK9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=4.193.249.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Mon, 18 May 2026 14:15:22 +0800 (GMT+08:00)
Date: Mon, 18 May 2026 14:15:22 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xuyang Dong" <dongxuyang@eswincomputing.com>
To: sashiko-reviews@lists.linux.dev
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, huangyifeng@eswincomputing.com,
	dongxuyang@eswincomputing.com, benoit.monin@bootlin.com,
	bmasney@redhat.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: [PATCH v5 2/3] clk: eswin: Add eic7700 HSP clock driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260514191921.C57AEC2BCB3@smtp.kernel.org>
References: <20260514114533.1376-1-dongxuyang@eswincomputing.com>
 <20260514191921.C57AEC2BCB3@smtp.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <21bf5be7.64a3.19e39b98f34.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgA3TJ96rgpqiFcaAA--.4293W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAgELAmoJ7hIZz
	QAAsB
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiAKPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBm
b3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoKPiAtIFtIaWdoXSBUaGUgS2Nv
bmZpZyBlbnRyeSBgQ09NTU9OX0NMS19FSUM3NzAwX0hTUGAgaXMgbWlzc2luZyBhIGBzZWxlY3Qg
UkVHTUFQX01NSU9gIGRlcGVuZGVuY3ksIGNhdXNpbmcgbGlua2VyIGVycm9ycyB1bmRlciBgQ09N
UElMRV9URVNUYC4KPiAtLQo+IAo+IGNvbW1pdCAxYTNjNWUwZWExNGQ2MjFkMzA3NzJhYzk5Y2I1
MzcyZmU2N2M1ZDZmCj4gQXV0aG9yOiBYdXlhbmcgRG9uZyA8ZG9uZ3h1eWFuZ0Blc3dpbmNvbXB1
dGluZy5jb20+Cj4gCj4gY2xrOiBlc3dpbjogQWRkIGVpYzc3MDAgSFNQIGNsb2NrIGRyaXZlcgo+
IAo+IFRoaXMgY29tbWl0IGFkZHMgdGhlIEVTV0lOIEVJQzc3MDAgaGlnaC1zcGVlZCBwZXJpcGhl
cmFscyBzeXN0ZW0gY2xvY2sKPiBjb250cm9sbGVyIGRyaXZlciBhbmQgcmVnaXN0ZXJzIGFuIGF1
eGlsaWFyeSBkZXZpY2UgbmFtZWQgaHNwLXJlc2V0Lgo+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvY2xrL2Vzd2luL0tjb25maWcgYi9kcml2ZXJzL2Nsay9lc3dpbi9LY29uZmlnCj4gPiBpbmRl
eCAwNDA2ZWM0OTllYzljLi5lNmNjMmE0MDdiYWM4IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9j
bGsvZXN3aW4vS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9jbGsvZXN3aW4vS2NvbmZpZwo+ID4g
QEAgLTEzLDMgKzEzLDE1IEBAIGNvbmZpZyBDT01NT05fQ0xLX0VJQzc3MDAKPiA+ICAJICBTb0Mu
IFRoZSBjbG9jayBjb250cm9sbGVyIGdlbmVyYXRlcyBhbmQgc3VwcGxpZXMgY2xvY2tzIHRvIHZh
cmlvdXMKPiA+ICAJICBwZXJpcGhlcmFscyB3aXRoaW4gdGhlIFNvQy4KPiA+ICAJICBTYXkgeWVz
IGhlcmUgdG8gc3VwcG9ydCB0aGUgY2xvY2sgY29udHJvbGxlciBvbiB0aGUgRUlDNzcwMCBTb0Mu
Cj4gPiArCj4gPiArY29uZmlnIENPTU1PTl9DTEtfRUlDNzcwMF9IU1AKPiA+ICsJdHJpc3RhdGUg
IkVJQzc3MDAgSFNQIENsb2NrIERyaXZlciIKPiA+ICsJZGVwZW5kcyBvbiBBUkNIX0VTV0lOIHx8
IENPTVBJTEVfVEVTVAo+ID4gKwlzZWxlY3QgQVVYSUxJQVJZX0JVUwo+ID4gKwlzZWxlY3QgQ09N
TU9OX0NMS19FSUM3NzAwCj4gPiArCXNlbGVjdCBSRVNFVF9FSUM3NzAwX0hTUCBpZiBSRVNFVF9D
T05UUk9MTEVSCj4gCj4gRG9lcyB0aGlzIEtjb25maWcgZW50cnkgbmVlZCB0byBzZWxlY3QgUkVH
TUFQX01NSU8/Cj4gCgpIaSBTYXNoaWtvLAoKVGhlIG5leHQgdmVyc2lvbiB3aWxsIGFkZCAnc2Vs
ZWN0IFJFR01BUF9NTUlPJyBpbiB0aGUgS2NvbmZpZyBlbnRyeS4KCkJlc3QgcmVnYXJkcywKWHV5
YW5nIERvbmcKCj4gVGhlIGRyaXZlciBjYWxscyBkZXZtX3JlZ21hcF9pbml0X21taW8oKSBpbiBl
aWM3NzAwX2hzcF9jbGtfcHJvYmUoKS4gV2hlbgo+IGJ1aWxkaW5nIHVuZGVyIENPTVBJTEVfVEVT
VCBvbiBjb25maWd1cmF0aW9ucyB3aGVyZSBubyBvdGhlciBjb21wb25lbnQKPiBjb2luY2lkZW50
YWxseSBzZWxlY3RzIFJFR01BUF9NTUlPLCB0aGlzIGNhbiByZXN1bHQgaW4gYW4gdW5kZWZpbmVk
Cj4gcmVmZXJlbmNlIHRvIF9fZGV2bV9yZWdtYXBfaW5pdF9tbWlvX2NsayBsaW5rZXIgZXJyb3Iu
Cj4gCj4gPiArCWhlbHAKPiA+ICsJICBUaGlzIGRyaXZlciBwcm92aWRlcyBzdXBwb3J0IGZvciBj
bG9jayBjb250cm9sbGVyIG9uIEVTV0lOIEVJQzc3MDAKPiA+ICsJICBIU1AuIFRoZSBjbG9jayBj
b250cm9sbGVyIGdlbmVyYXRlcyBhbmQgc3VwcGxpZXMgY2xvY2tzIHRvIGhpZ2gKPiA+ICsJICBz
cGVlZCBwZXJpcGhlcmFscyB3aXRoaW4gdGhlIFNvQy4KPiA+ICsJICBTYXkgeWVzIGhlcmUgdG8g
c3VwcG9ydCB0aGUgY2xvY2sgY29udHJvbGxlciBvbiB0aGUgRUlDNzcwMCBIU1AuCj4gCj4gLS0g
Cj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIw
MjYwNTE0MTE0MjEyLjkwMy0xLWRvbmd4dXlhbmdAZXN3aW5jb21wdXRpbmcuY29tP3BhcnQ9Mgo=

