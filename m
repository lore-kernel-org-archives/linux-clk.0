Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347146;
	b=mSqaeK+XC1KCvIsbFqRtJnAduUhceQea9070DjNRMRVpIIzlpXSjeiHMICJwS84fhmpg
	 NDpmaVqGmTm9N4Z6OFRjs1kaLwwZFcjmEINzz2zcGFjMRdqm7bJIb4nKUB9xmIJWetKCn
	 8no840PBkz1jm8Zw43UC51CpdT5GBwcKbq0MYEqeQBIHCbUBM/bcXA9/d8Yv8DkYCsvik
	 fsvgEMrmX20KAAsT99K/wPxnI73wmaaSFCW2KF3zHAoRWXn9Fo/h1WM69IFLlEXqn3K6Q
	 gNoLUqX/oVKXA6WnCxP+VzotGEmgSGOceFMCHPdPZFGq2CyFkgUraewvZyZpeZIcz7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347146;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=ugmaNHkzXqjffwqWJMbkStyKbwBlOMxhDSODodBITtU=;
	b=lK8M++Umj2mv8pOjv3YnOVal+tkCxme3cYNkMNerDnPjUiYKEAyttZ3WtwYXeGRk9Bbu
	 A6uP3YwiXhsC9qoFNY607myUUKX0jQ9Htqx9y5QzhDnIq8SGUgYwYaKZifK9jBcjpR5LH
	 E+wKfWfUONCxFyO7/KT6fmAujNz97CRTWdoBSLo2VCRD5K6eS84j/NBn/AwZSnfwzD5NJ
	 lU09rmeP9tLu57mD4qoQpUFuBvqBP7WbWiy9DqCE8S4s2XLoAskfcOPEUhaOaHMZPQGYY
	 ARfVqBg1plmuDzeI1cZ7NyvKzLI6boIYHQ8lRYlurVieANLG9FlaOnqUjsir7p0iMCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=x+bPWfVY;
	arc=none smtp.remote-ip=162.62.57.87
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FCF606A31A;
	Fri, 30 Oct 2026 07:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21FCF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=x+bPWfVY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793347135; bh=ugmaNHkzXqjffwqWJMbkStyKbwBlOMxhDSODodBITtU=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=x+bPWfVY/B3LExMR6gKNC7MU2jggnDoYnNjp0PFuXjyxNaI8fCVDkr1nA3mccOKvV
	 K05WZWzN2B28Eqhzj4/f/SEJZ5XxfBRk7eOt7c09G+5Df5s1gXmQw+ns2PdAbrw/m9
	 EVRk5JAJX4cf425KOYHE5Msg5DL75rnCN4sK8P08=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-XMAILINFO: NX3IH4pixvQA4mfUOj4AZVUZBUHvLdXeyBx1a5kj1f4Xdb10nf7zOHlOO6mGO2
	 nXQ+z7wBN+jTe8ECozfLmisXmNN/VcY0TUS3wp6B7/Q1N3ccu82JhylB82r3mL9fhoDsKDYs8zsLk
	 1ZBDX6Pd3kVdbLgALrqTuP5k89VwnSfBT/a6Z0qhJ2i+6FyQ53EdabGjTb1USSoyT+LdZXmHk5C76
	 6ImM/2fz3qIonBy+lVUHSEx6aaforNjOWkSgHks7+yn6z/T3dyIDb+rwI8nZ0PeMOYqWUQ7mg44Qu
	 0XbWOMfhKTqP7FPZSXSsja/C5ofd+2O7dvpQbutdTw/AG3KsEYOh+dDPChg1hTpQLq6Xccq9jHAaM
	 019dqWh3v2YqbXD/1AlQ8IgxW7bHXzuRIHlYr0VaDeBCLdbdUz9WpVYfCKTe2XrYQJ1Jk9+3SSuv7
	 pphBiHsFr4kfXJRN4A1lH0pCG5Vn+6WA9cEmxxTffvv9cFTiyo5uejV7rZIjiGb8lNbKI5FMKg+ER
	 7LeL0GEzC7GYkLSWWK25X9/ipJYBDdFc0ZMepwNynx6uf/4ysZIyTXVwLDFDfPdG7nr+6GWNF4H2K
	 XnHz5+RSOKHTDh9buAEtaB3Poi8yFoubeJwBV4oGdFqOSt9g9fNv6wpzBgFJGqhu6HHEPkVB3sNZ3
	 iJwt9257Xt0qBnyKEKSJitSMwF5hqaFY2G6i/B2JWxH3kHJY9KTF5c5bGCWih4MlM5XrcVkinJloM
	 QePqWIgAqhCX6v9+TdSnBwg0pgEJzMQlihuIpL878gEN31b9Mnw4v9B0RsRaG52VFhQvNWH+j4iNL
	 JGxM0WD7t/e9Q/aUm8yfqTxy27Nb8IMCOyIVBY3b3CZzfq+wS/iRqmtviz8c+ASFREGm7jDk6+WB6
	 lVXnfdVlhgmHDebxl7HEVLtKltFCWkPUT+qXjpOOMWqHwzkdNNjaBm5eyijAMxwfZbI874I7kpiWE
	 +ko0OBNu1j0Qw6vQujtYmatVXFVhFz6YS+aGDbiZNJrKiIpPML3BaUB602U8xQG055b0j75INAaIt
	 SZ5h66sbnShrByhGXFcKsKLPHG+bBq8R4/vIqaxG12+8zwyvevS2FwtZjcQ==
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?c2FzaGlrby1yZXZpZXdz?=" <sashiko-reviews@lists.linux.dev>
Cc: "=?utf-8?B?bGludXgtY2xr?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?cm9iaA==?=" <robh@kernel.org>, "=?utf-8?B?Y29ub3IrZHQ=?=" <conor+dt@kernel.org>
Subject: Re: [PATCH v4 2/4] clk: rockchip: Add internal support for 24-bit fractional dividers
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
Date: Fri, 30 Oct 2026 15:58:53 +0800
X-Priority: 3
Message-ID: <tencent_923409D2D4C84024208CA405582382F9E10A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261027-add-board-ok3572-c-clk-v4-0-d4152b4fedaa@qq.com>
 <20261027-add-board-ok3572-c-clk-v4-2-d4152b4fedaa@qq.com>
	<sashiko-outbox-187717@kernel.org>
In-Reply-To: <sashiko-outbox-187717@kernel.org>
X-QQ-mid: xmsezb41-0t1793347133t7cmkh8hc

SGksCgo+IGJyb2tlbiByYXRlIGNhbGN1bGF0aW9uIGluIGNsa19mZF92Ml9kZXRlcm1pbmVf
cmF0ZSgpCgpJIHJlcHJvZHVjZWQgdGhlIHJhdGUtc2VsZWN0aW9uIGFuZCByb3VuZGluZyBp
bmNvbnNpc3RlbmNpZXMgd2l0aCB0aGUKY3VycmVudCBmbGFncz0wIGNvbmZpZ3VyYXRpb24u
IEkgd2lsbCBmaXggdGhpcyBpc3N1ZSBpbiB2NS4KCj4gYnJva2VuIHplcm8tYmFzZWQgZGl2
aWRlciBtYXRoIGluIGNsa19mZF92Ml9nZXRfZGl2aWRlcigpCgpUaGUgemVyby1iYXNlZCBj
b21wZW5zYXRpb24gaXMgaW5jb3JyZWN0IGlmIENMS19GUkFDX0RJVklERVJfWkVST19CQVNF
RAppcyBlbmFibGVkLiBBbGwgdGhyZWUgY3VycmVudCB1c2VycyBwYXNzIGRpdmlkZXIgZmxh
Z3Mgb2YgMCwgc28gdGhpcyBwYXRoCmlzIG5vdCBleGVjdXRlZC4KCj4gd3JvbmcgbG93LWJp
dCBtYXNrIGFuZCBzaGlmdCBpbiBjbGtfZmRfdjJfc2V0X3JhdGUoKQoKVGhlIHJlZ2lzdHJh
dGlvbiB3cmFwcGVyIGZpeGVzIG5zaGlmdCB0byAwIGFuZCB1c2VzIGVxdWFsIGxvdy1maWVs
ZAp3aWR0aHMgZm9yIHRoZSBudW1lcmF0b3IgYW5kIGRlbm9taW5hdG9yLiBBbGwgdGhyZWUg
UkszNTcyIHVzZXJzIHNwZWNpZnkKMTYtYml0IGxvdyBmaWVsZHMgYW5kIDgtYml0IGhpZ2gg
ZmllbGRzLiBUaHVzLCBmZC0+bm1hc2sgaXMgdGhlIGNvcnJlY3QKbG93LXZhbHVlIG1hc2sg
Zm9yIGJvdGggZmllbGRzLCBhbmQgdGhlIGZpeGVkIHNoaWZ0IG9mIDE2IGluIHJlY2FsY19y
YXRlKCkKbWF0Y2hlcyB0aGUgY3VycmVudCBsYXlvdXQuCgpCZXN0IHJlZ2FyZHMsCkN1bmhh
byBMdQ==

