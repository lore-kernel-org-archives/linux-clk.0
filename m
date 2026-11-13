Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596428;
	b=uuBdr6OBPjIHATu7IpWhtLohpOTUS72lUySS/z3M9drXO6lLZDxyBIaCY+KttUBgjzSA
	 3WnHvZKZXWDYuD1WOsOAmKGfesJh5/e4OEcKpguGRP0R1fGQGQ8cQ+0b8HQRnRAyST+Pn
	 UjVbnjziZOHITYCIBANLNMyhzwcYMYdzcL9jomj8DrWsdv2GbSn4CA9TiolMO7oScdNjX
	 N8+uW/3gGaVbjwmjnQsD9fadAFFhJy82MyTLpe8sK9tc9StXKIzXAr968xxASgJbvbG01
	 4Bfk3rQeYgg1b3upgnY2FXEAtTVO0ri0/+2IlRTklwdHa6J4Mw+IM8eMdNqCHSNlKvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596428;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ynbg6nfUslyqGDYJlvaL2G08wK+UayKB+2/ag4qkm8E=;
	b=IK0uaKBB/IQAtYy4fFMFgQW5zNMRSuSsZTr4rvJTdBVaJn/ISk1qb9rUdKDEdLrUfFrp
	 EYjfSWNfJtvixWJgmmNCM/ZwgNOIDNc6cUR1E3tDvqmxmTn17wPqa8t4vmWGeYNp4U+Po
	 HwpQ7N+UXDzLkXxPu+QCF4VxpPvP6KKN2N87x4onOAo4kBpm1BPTsLSFoTGv9QIk427TO
	 hDROZlsq9va7gvs+3O7HEjbpmqzd6Wh52gNFxEWrC5FpPdD3fstw2Mn1SvSA2PEm1rKof
	 /HfDVp31WC86dxR4IWGHg0acdXdhMVa4TbuBM4vSp4xfLUmLciC4IAaEpWogZJmXD2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RffMxjtK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D69B606B604
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 19:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RffMxjtK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFCA1F000C5;
	Fri, 13 Nov 2026 19:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596427;
	bh=ynbg6nfUslyqGDYJlvaL2G08wK+UayKB+2/ag4qkm8E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RffMxjtKNTK0VIrX3SV3klO3KsX6D+iI+RvQ/VHpELViYqke+eO3BauiQNClE0djw
	 l6Oo0wpET96Ft2b0RCGqgu0TQwPyRWz6JtvtRd6AAl1meHucroEwK2C/PICvMwZs00
	 a/ouBW3AOPmaEcP+k6Rs2491KXcOZ7HO4mXmxO802jxZucPE8Kiwko1dLJfi0NzLXY
	 Q5BrsrV06GUhQKF7bTgtykjunHNxf1Btt9cbdF6Tu/j+aDCANeUx0UJM1keB9qXxto
	 gCoxxqXMXNDt5GVjDssqay9m/SM+16HXqAJndxI+3B56x+XYSLkOzNSvxnckck+7p1
	 rHsUtn2LVQZ/w==
Message-ID: <sashiko-outbox-213490@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] MIPS: Skip generic IPI setup for
 platform-specific callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Florian Fainelli" <f.fainelli@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261113184210.470320-3-f.fainelli@gmail.com>
References: <20261113184210.470320-1-f.fainelli@gmail.com>
 <20261113184210.470320-3-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:00:27 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] MIPS: smp: missing Signed-off-by trailer in commit message
--

commit c5c283e69afb709a8e47e1279441d01d98c9d98c
Author: Florian Fainelli <f.fainelli@gmail.com>

> MIPS: Skip generic IPI setup for platform-specific callbacks
>
> A generic MIPS kernel can select a platform SMP backend with direct IPI
> callbacks instead of an IPI IRQ domain. The XBurst backend uses CP0
> mailboxes, so generic IPI allocation would find no domain and BUG when
> more than one CPU is present.
>
> Skip generic IPI initialization when neither selected send callback uses
> the generic implementation. Keep initialization when either callback
> uses generic IRQ IPIs, and retain the existing single-CPU shortcut.
>
> Sashiko AI reported the XBurst integration issue; Codex assisted with
> the change and extracted-function/build checks.

[Severity: High]
The commit message is missing a Signed-off-by trailer, which is required
under the Developer's Certificate of Origin before the patch can be
applied.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113184210.4703=
20-1-f.fainelli@gmail.com?part=3D2
