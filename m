Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792991065;
	b=bGXvbI9kFJOe9+173mQRcdgrfHClqGjJZccqRqZKyH9wFzL3W9FqJTtmn2v4MhSEhR3E
	 yDWrgIcWt3EAJIf7XrwNo9YprhMCA4zUXX8w6AUE+jiHp9I3pb6KW/dfqePw+OSp/usQu
	 moqQN9xxpmoBOsvVpf9E9JOKSlC/Dr3JF9zc3YE9qIwu4EstEza0waJ/X5zpbEy0oi9Yf
	 Zgn8GQ8B7xEtk7GJri9TdcZVhbBgMGgBR0jse0L5phhLQMRqLJL7BE3V1GGHZPi2jrJLW
	 1jxXgbDFPklKJg7kzIhYX6e8eHT2f4GwnWh6f2sKehTGsSYn/QeG3i5jnpIHe8lY6FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792991065;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=yZJaU1OcxLRCU4fu7eWUXBH5CKQ0LM8TN889bthhLLM=;
	b=PpI93d4kcf5pGMi+PEyWrkWFeffo5Fk7G86xZaOHhhQSPz7mAb2AEAVD5F3kktRC6WB8
	 fyWbFlSEAdmoHwQl6HZtdrqGBrd2VED6elGiPJK3KH/V2G96KmfUc8wm0A2ky2TTA4VqQ
	 QZXj4RPVuHf8pxwa05xPHEhu+qnp2oUPBBlpOst5smz9BbAyxTWf2cThR/2Dc0slO0BR3
	 dfvAmK5Po+i8JLAbMjSnf9pu32FFLK1M+M7qB+feBZPThmky40Y8owb51sBo3ySOF/09N
	 SYGDEJOjOU8nqZxrOzQmBfizZSuh9h/r8COdB9O2N8FlEYXStTIA51yMPxuGbrIML4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="Xubo/w6Y";
	arc=none smtp.remote-ip=162.62.57.210
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02EA606A31A;
	Mon, 26 Oct 2026 05:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E02EA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Xubo/w6Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792991059; bh=yZJaU1OcxLRCU4fu7eWUXBH5CKQ0LM8TN889bthhLLM=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=Xubo/w6YzA9MRRNbyMANJ3qmnMI7kgy6nwalptpbMiC2uuV2048NAX9kYJLgGCKd4
	 NdeIv3kfMq39y6camhGhM9ApACax1cglIVyYYlxP18YLKq8kqlvCM+IFlury2M88ks
	 JnheJlt6QJA51A9ru8clUU+F7Acz3d7lzawR91WM=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-XMAILINFO: N2nZekq4carkL2/CzPWlL2tGscRH9qxY1jsbZj6+0eUY8UYcvOPyiL6wER2v9U
	 03mQ5UI1Hi6xdACXMQbGDhhBFSkEIPSgkgjyp/wKqiLin86b01LrTc88ZlPA+J3A6+enNsuwc9W0j
	 J+oEhe3r64QoP6JLEOH+UopZ6GBVILGV/2j/Vtt8z0MQBi+Flx12gEtFnUR7i+bNECKG1yIkfGfWs
	 hUrTc9XdHAm0SP+SYXzwkgmD0psc3qigD/hhJRbvOanqRSK6BLv5FpgV39WisF/iSm18lqMYBqE1u
	 5t7Vy4VVIdEztdo1XchpETrgoPeaRAJ3Q3pao13N4dOKRQJu2gMFvhTj1ZBKKTo5vl5VjngSZVXqq
	 nRa48pMA5tdmbQW7c8SDjUbDZnuCCg54eHAy3mo8HlPDvCzCvINRNgHpMpKJFsyDtO7R0X9z9CXUL
	 piyi78MfjQYXDwFocezb6FNmJYpx1TFeVh80fDl8FeSzR+TT4yn8pACRNlvC3S5AM9O7xjXJNrxvY
	 Bgtc0kRaV5LFevR2nSgBL652qxBJlvByp974ynBlZRikUNqn90cMhBycs2g08gq3zTyhFL/xXl6sb
	 xZEVRu+UtoUywAFOhxNiymtxX2d9CjePsTP0YY2Maqz/Ev52N0OrrJOYVMmVwjDeRgjVfbGkMXeRD
	 6DkrwyO4luSvCAsqWbeB2Vs51EHKpGCLZf58qB6MrQypdKYEon8OyaoE0L7GtlnGXKnkAbVynzt7r
	 tA7rS3AXzZRQyCsKhEWKmyVo5jiB3MYK4dJY54DQ35hJTMfnMqj0dlu1ryblW8qkPg/ch912HPioB
	 Hyife78Y4xu/UNyEPT8HlNSqH8xD9LjZ3n+AWiiUag8uCeBq4aBEPa0qPiGVe7wLuqF6D8awK0jeW
	 0SVguQamyMuJFu4a9a5hO0sWDQT4kCWKc2CYTWZ+yXWZQn+9kliEqc4Nh6gAEfq8VjHIWWYFxsg7r
	 UM05oQUtc7RZmNJgqo9gqkYbf5u+cRoXBRU/wERXx2h7eSnMF5Zxla713LjFKoI63IBiUhjrHZmid
	 mOYEDOy8h7Q7Q9YDXysV68oBVX1VGecSXMcDfI/nnCSWgOLsCevyPJOtfpxfJSMC53TU9
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?c2FzaGlrby1yZXZpZXdz?=" <sashiko-reviews@lists.linux.dev>
Cc: "=?utf-8?B?bGludXgtY2xr?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?cm9iaA==?=" <robh@kernel.org>, "=?utf-8?B?Y29ub3IrZHQ=?=" <conor+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] clk: rockchip: Add internal support for 24-bit fractional dividers
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Mon, 26 Oct 2026 13:04:18 +0800
X-Priority: 3
Message-ID: <tencent_72A6661A5419B984EB11DB006CC4133FC907@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261023-add-board-ok3572-c-clk-v2-0-90b98836be6e@qq.com>
 <20261023-add-board-ok3572-c-clk-v2-2-90b98836be6e@qq.com>
	<sashiko-outbox-183649@kernel.org>
In-Reply-To: <sashiko-outbox-183649@kernel.org>
X-QQ-mid: xmsezb41-0t1792991058tp2j4wqmx

SGksCgo+IFtTZXZlcml0eTogSGlnaF0KPiBEb2VzIHRoaXMgb3ZlcmZsb3cgY2hlY2sgZG91
YmxlLWNvdW50IGZkLT5oaWdoX253aWR0aCBhbmQgYWxsb3cgbiB0bwo+IG92ZXJmbG93IHRo
ZSAyNC1iaXQgZGVub21pbmF0b3IgcmVnaXN0ZXI/CgpZZXMuIGZkLT5ud2lkdGggYWxyZWFk
eSBpbmNsdWRlcyB0aGUgaGlnaCBiaXRzLiBJIHJlcHJvZHVjZWQgdGhlIHRydW5jYXRpb24K
d2l0aCB0aGUgb3JpZ2luYWwgY2FsbGJhY2tzIGFuZCBtb2NrZWQgcmVnaXN0ZXJzLCBpbmNs
dWRpbmcgYSBjYXNlIHRoYXQKcGFzc2VzIHRocm91Z2ggZGV0ZXJtaW5lX3JhdGUoKS4KCj4g
QWxzbywgaWYgdGhlIG1hc2sgaXMgY2hhbmdlZCB0byBHRU5NQVNLKGZkLT5ud2lkdGggLSAx
LCAwKSwgd291bGRuJ3QKPiBjbGFtcGluZyBvbmx5IG4gdG8gdGhlIG1heGltdW0gbWFzayBh
ZnRlciBtdWx0aXBseWluZyBib3RoIG0gYW5kIG4gYnkgdmFsCj4gZGlzdG9ydCB0aGUgbSAv
IG4gcmF0aW8gaW5zdGVhZCBvZiBrZWVwaW5nIHRoZSB1bnNjYWxlZCBtIGFuZCBuIHdoZW4K
PiBuICogdmFsIG92ZXJmbG93cz8KCkNsYW1waW5nIG4gYWxvbmUgd291bGQgY2hhbmdlIHRo
ZSByYXRpby4gUmV0YWluaW5nIGEgc21hbGwgbnVtZXJhdG9yIHdpdGgKYW4gb2RkIGRlbm9t
aW5hdG9yIHdvdWxkIGJ5cGFzcyB0aGUgZXhpc3RpbmcgY29tcGVuc2F0aW9uIHdvcmthcm91
bmQsIHNvCkkgd2lsbCByZWplY3QgcmF0aW9zIHRoYXQgY2Fubm90IGJlIHNjYWxlZCB3aXRo
aW4gdGhlIGFjdHVhbCBmaWVsZCB3aWR0aHMuCkkgd2lsbCBmaXggdGhpcyBpc3N1ZSBpbiB2
My4KCkJlc3QgcmVnYXJkcywKQ3VuaGFvCgpwdy1ib3Q6IGNy

