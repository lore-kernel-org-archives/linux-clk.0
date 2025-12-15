Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.142.27])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F9A13AA2F;
	Mon, 15 Dec 2025 02:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.142.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765766712; cv=none; b=TlwMzJak3tkdvjT2e9D8KMjTWPs906R2P5Jd0GBsVsOVL/QB0rsx2soxjvE6H2Ad7YMby0M8duEnxJm3YDgd4xVVd2eNWWiUXW/Eh4Kmpf4fhOZdI5hm67z3AOaVKsvytY4zUJl8MvBNQKhTrdkochAnwvZsrZfDN6/KnYzKz00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765766712; c=relaxed/simple;
	bh=ZYUznRoQ/BQaWVdEd0r5IfdBT7VvE7fmUzVULM+NNYE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=sbPP7mA21ZNdfyQeW41FVf4XGdEfxuHDcYUKBeA1eZThOhLjgAXLiBZLjJfE6epiX4FAxqCQOEqImWSkpFWHhsj7jiWoILQyxIaHVrhbDbfgSNrUwEDgE3JcD0uu2hm/7BkMaQeb/FVszy7WJ+MTh+AXGuPk2Hd7owYa1xAJORc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=13.76.142.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Mon, 15 Dec 2025 10:44:42 +0800 (GMT+08:00)
Date: Mon, 15 Dec 2025 10:44:42 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xuyang Dong" <dongxuyang@eswincomputing.com>
To: troy.mitchell@linux.dev, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, bmasney@redhat.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: [PATCH v8 0/3] Add driver support for ESWIN eic700 SoC
 clock controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <3d4f4964.979.19abf2828cd.Coremail.dongxuyang@eswincomputing.com>
References: <20251113013637.1109-1-dongxuyang@eswincomputing.com>
 <3d4f4964.979.19abf2828cd.Coremail.dongxuyang@eswincomputing.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <53513f6a.139a.19b1fe55864.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgBnq64adj9pxGyFAA--.4152W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAQERAmk+5oYSy
	QAAs-
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiA+IAo+ID4gVGhlIGxpbmsgWzFdIHByb3ZpZGVzIHRoZSBvZmZpY2lhbCBkb2N1bWVudGF0aW9u
IGZvciB0aGUgRUlDNzcwMC4gU2VjdGlvbiAzLjIKPiA+IGNvdmVycyB0aGUgY2xvY2sgc3Vic3lz
dGVtLgo+ID4gCj4gPiBbMV0gaHR0cHM6Ly93d3cuc2lmaXZlLmNvbS9kb2N1bWVudC1maWxlL2Vp
Yzc3MDB4LWRhdGFzaGVldAo+ID4gCj4gPiBVcGRhdGVzOgo+ID4gICBDaGFuZ2VzIGluIHY4Ogo+
ID4gICAtIEFkZGVkIGNsb2NrLXRyZWUgbGluayBpbiBjb3Zlci1sZXR0ZXIuCj4gPiAgIC0gVXBk
YXRlZCBZQU1MIGZpbGUKPiA+ICAgICAtIEFkZGVkICJBY2tlZC1ieTogVHJveSBNaXRjaGVsbCA8
dHJveS5taXRjaGVsbEBsaW51eC5kZXY+IiBmb3IgYmluZGluZ3MuCj4gPiAgIC0gVXBkYXRlZCBk
cml2ZXIgZmlsZQo+ID4gICAgIC0gQ2hhbmdlZCBLY29uZmlnIHN5bWJvbCB0eXBlIGZyb20gYm9v
bCB0byB0cmlzdGF0ZSB0byBidWlsZCB0aGlzIGRyaXZlciBhcwo+ID4gICAgICAgbW9kdWxlLgo+
ID4gICAtIFVwZGF0ZWQgTUFJTlRBSU5FUlMgZmlsZQo+ID4gICAgIC0gQWRkZWQgZW50cnkgIkVT
V0lOIEVJQzc3MDAgQ0xPQ0sgRFJJVkVSIi4KPiA+IAo+IAo+IEhpIFRyb3kgYW5kIGFsbCwKPiAK
PiBKdXN0IGEgZ2VudGxlIHJlbWluZGVyIGFib3V0IHRoaXMgcGF0Y2ggc2VyaWVzLsKgCj4gQ291
bGQgeW91IHBsZWFzZSByZXZpZXcgdGhlIGNsb2NrIGRyaXZlciBpbiBwYXRjaCB2OCAyLzM/Cj4g
VGhhbmtzIGZvciB5b3VyIHRpbWUgYW5kIGNvbnNpZGVyYXRpb24hCj4gCgpIaSBUcm95IGFuZCBh
bGwsCgpJIGhvcGUgdGhpcyBtZXNzYWdlIGZpbmRzIHlvdSB3ZWxsLgpUaGlzIGlzIGEgZ2VudGxl
IHJlbWluZGVyIHJlZ2FyZGluZyB0aGUgY2xvY2sgZHJpdmVyIHBhdGNoIGluIHY4LCBwYXRjaCAy
LzMgb2YgdGhlIHNlcmllcy4KSWYgeW91IGhhdmUgc29tZSB0aW1lLCB3ZeKAmWQgZ3JlYXRseSBh
cHByZWNpYXRlIHlvdXIgcmV2aWV3IGFuZCBmZWVkYmFjay4KVGhhbmtzIGZvciB5b3VyIHRpbWUg
YW5kIHN1cHBvcnQhCgpCZXN0IHJlZ2FyZHMsClh1eWFuZyBEb25nCg==
