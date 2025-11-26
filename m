Received: from azure-sdnproxy.icoremail.net (l-sdnproxy.icoremail.net [20.188.111.126])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12CF228DF07;
	Wed, 26 Nov 2025 07:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=20.188.111.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764143688; cv=none; b=PO96Z8wJNoaDlt2Hn//j9fSXlfmALgQY/DUxlaDatz/3S2Mt/purCcFS5JV8Wrx4rH7ty8/3gbTb4o4O0RmVo1HemnldjgpZ6JWu5M0WbpCA9RDmTrfRrOUKukDvZJ6egcYhXSBNh06oTDQEHFN0w6LKHHojvq2EHb0VDanJn/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764143688; c=relaxed/simple;
	bh=Z4ovShDR0OU4Qmvsj1oy+wl3q1u04DvCNxeIwXVt5XI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=HzshwdlpsZonUjihvEp2ioY7FlFr7ndnoAjJCZsEXOeequPsYfgPIGlbwbEmY8oyrW+XujZISPwdzbAimEtsoW7xJlCcqpc3o1IyaTzVUasSoB7wG64BkJeDvXcBx4nIv9wmGxleynF8o5h0x69e2nbcORofGAucfE2joBUOjCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=20.188.111.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Wed, 26 Nov 2025 15:54:31 +0800 (GMT+08:00)
Date: Wed, 26 Nov 2025 15:54:31 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xuyang Dong" <dongxuyang@eswincomputing.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	troy.mitchell@linux.dev, bmasney@redhat.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v8 0/3] Add driver support for ESWIN eic700 SoC clock
 controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20251113013637.1109-1-dongxuyang@eswincomputing.com>
References: <20251113013637.1109-1-dongxuyang@eswincomputing.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <3d4f4964.979.19abf2828cd.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgDnK683siZpMoR+AA--.2618W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAQESAmkl2gMXP
	wAAst
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiAKPiBUaGUgbGluayBbMV0gcHJvdmlkZXMgdGhlIG9mZmljaWFsIGRvY3VtZW50YXRpb24gZm9y
IHRoZSBFSUM3NzAwLiBTZWN0aW9uIDMuMgo+IGNvdmVycyB0aGUgY2xvY2sgc3Vic3lzdGVtLgo+
IAo+IFsxXSBodHRwczovL3d3dy5zaWZpdmUuY29tL2RvY3VtZW50LWZpbGUvZWljNzcwMHgtZGF0
YXNoZWV0Cj4gCj4gVXBkYXRlczoKPiAgIENoYW5nZXMgaW4gdjg6Cj4gICAtIEFkZGVkIGNsb2Nr
LXRyZWUgbGluayBpbiBjb3Zlci1sZXR0ZXIuCj4gICAtIFVwZGF0ZWQgWUFNTCBmaWxlCj4gICAg
IC0gQWRkZWQgIkFja2VkLWJ5OiBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LmRl
dj4iIGZvciBiaW5kaW5ncy4KPiAgIC0gVXBkYXRlZCBkcml2ZXIgZmlsZQo+ICAgICAtIENoYW5n
ZWQgS2NvbmZpZyBzeW1ib2wgdHlwZSBmcm9tIGJvb2wgdG8gdHJpc3RhdGUgdG8gYnVpbGQgdGhp
cyBkcml2ZXIgYXMKPiAgICAgICBtb2R1bGUuCj4gICAtIFVwZGF0ZWQgTUFJTlRBSU5FUlMgZmls
ZQo+ICAgICAtIEFkZGVkIGVudHJ5ICJFU1dJTiBFSUM3NzAwIENMT0NLIERSSVZFUiIuCj4gCgpI
aSBUcm95IGFuZCBhbGwsCgpKdXN0IGEgZ2VudGxlIHJlbWluZGVyIGFib3V0IHRoaXMgcGF0Y2gg
c2VyaWVzLsKgCkNvdWxkIHlvdSBwbGVhc2UgcmV2aWV3IHRoZSBjbG9jayBkcml2ZXIgaW4gcGF0
Y2ggdjggMi8zPwpUaGFua3MgZm9yIHlvdXIgdGltZSBhbmQgY29uc2lkZXJhdGlvbiEKCkJlc3Qg
cmVnYXJkcywKWHV5YW5nIERvbmcK
