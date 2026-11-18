Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=165.173.180.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795017805;
	b=tPZqG+lrB2JYK5yHzKCjqvyZevoZ9BcATtevAEiEJH2iEKT5SqY4KpebDcp3tUY3L5Z4
	 b/soa03Nd5HwJOO2biBIAL/F5Zss5YtyMqQxmzTCxEiT1xgd83KWVWdZZdc+0bv564xDm
	 QKI13xqzQkRqKcNHFhQHTTHWX7V7Hkb+8aSAf5LQuhphMVf6Zi74+1jErnOuY3G9os5hr
	 YR5zFZ0GXIHYddmpdRO7eeDgWMSZO8oeMlLRvHs4cwGVDXkBOH7T4u2hfS3prdl4EVLCj
	 DhQP9YnI952dCIq94ZivrDqJx03u31a2qY1fiTU54Uhk4xQnfk6xpJVfcRJK3AIgjqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017805;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Zoho-Virus-Status:
	 X-Zoho-AV-Stamp:X-ZohoMailClient;
	bh=lvK9tuIpxKgDgpYO7x8VbuolpPM0n5OGltXSZRjUgJ8=;
	b=YyXvpVCwbOrBNUrw/YtuQt68trZ8tDofpNqSOlHoU5pa0exGljU/fjPq7Ri9MtQkCgXy
	 QmRa4lb/SuZSyCiusEFwgue52p3dy+wk3n7eCQ3t+5gmKNGmVA785ePzLQNbgOxniOLiV
	 9LHlJQi/JVPbBqJoV7+L4TZl0xfoBbfvdNvSSOfwMd9C919nmNR3og5QaBBLFuzX5DzOX
	 1yMwNAtdh8gaNDLuOBV4c/jahEetVnMJFdayYWWBgYj3jlsrMLQ3zyg18AdtigKle2Mow
	 GG1uAqBncaZ2+jDywvnLidv3BWGFTLfdnsNst5xO9jfT2BWlFp2fjvLt6U7WsP+lHGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ziyao.cc;
	spf=pass smtp.mailfrom=ziyao.cc;
	dkim=pass header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=cBzRIq3k;
	arc=fail smtp.remote-ip=165.173.180.15
Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F411F606A334;
	Wed, 18 Nov 2026 16:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F411F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=cBzRIq3k
ARC-Seal: i=1; a=rsa-sha256; t=1795017777; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DSGObvRuVfYHe9SPWi3DqDIgiYIldCXNqh1t+Zl00inX7x7i4f+eV1cq4wzsvlo86V17Dn23wGvSW1t07EXrholfCFxxPKGaij/5zbn70TAJEb0LBkpdLmQiXDDKQgFHprfMLaziAnTTKCZVVASEMI7uO4iuJvVIVSlFkGWx/h0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795017777; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SwGyqM8fKkj7sRpo7lsvMTTp7Ch2ClbA8Qn5X5Zgelw=; 
	b=ZYWXKgyx53JzR0+YODEWbeooFlcwA6c/+xMowA+BxuljXu5YPCzBy6l0pF1y+zb8kI7UTln+6jbKfSEWLrJcAzQYZuQHc3tngfPr6j18V8KfaXfQlLCiYjqqC6f4EAMuw548RDPc36yF3DBDCnKW5ifBohM7I1mjvuSLNdIDkf8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=cBzRIq3kEbo4izYjricXxCxci6PaCtbycrEGqIvCAEKBY0o6AKexzsYMH6bqRdVYgmH6sSUxhWB9tVf5agQD9OynAuwPmFKzxrcP1TcpFUrlEsg2aQsfOczSvBqk1zepyamp4NpdJ7Yl7Eh368529V7T2mO4VzWMvM0oLcZYZIg=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=lvK9tuIpxKgDgpYO7x8VbuolpPM0n5OGltXSZRjUgJ8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795017774093467.4763197419518;
	Wed, 18 Nov 2026 08:02:54 -0800 (PST)
Date: Wed, 18 Nov 2026 16:02:43 +0000
From: Yao Zi <me@ziyao.cc>
To: =?iso-8859-1?Q?Fr=E9d=E9ric_Mah=E9?= <frederic.mahe@cirad.fr>,
	Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.co>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH 0/6] riscv: spacemit: k1: RCPU2 PWM clocks and the BPI-F3
 fan
Message-ID: <av3MI0wgou3pbab8@pie>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.994.34
X-ZohoMailClient: External

On Tue, Nov 17, 2026 at 09:59:45PM +0100, Frédéric Mahé wrote:
> The BPI-F3 fan header (J27) has a PWM line driven by an RCPU2 PWM
> (GPIO 79). This series adds the RCPU2 PWM clocks and DT nodes and
> enables the fan on the BPI-F3.
> 
> Patch 2 keeps pll1_aud_245p7 enabled: once clk_disable_unused() gates
> it, accesses to the RCPU2 block hang the CPU (the vendor kernel keeps
> it on through its RCPU firmware). It may be better tied to a power
> domain once the K1 power domain driver lands; comments welcome.
> 
> Tested on a BPI-F3 on v7.4-rc1 (no fan with a PWM input at hand, so
> with a multimeter on J27 pin 3): 0.86, 1.76, 2.74 and 4.66 V at 25,
> 50, 75 and 100% duty (0.04 V off), as with the vendor kernel, and
> the fan goes to level 1 when the package reaches 40 C under load.
> 
> Trees: 1-3 clk, 4-5 SpacemiT DT (4 needs the IDs from 1), 6 riscv
> defconfig. Depends on "reset: spacemit: Fix the RCPU2 PWM reset
> registers" (reset/fixes).
> 
> Written with help from Claude (Anthropic); reviewed and tested on
> hardware.
> 
> Signed-off-by: Frédéric Mahé <frederic.mahe@cirad.fr>
> 
> 
> Frédéric Mahé (6):
>   dt-bindings: clock: spacemit: k1: Add RCPU2 PWM clocks
>   clk: spacemit: k1: Keep pll1_aud_245p7 enabled
>   clk: spacemit: k1: Add RCPU2 PWM clocks
>   riscv: dts: spacemit: k1: Add RCPU2 PWM nodes
>   riscv: dts: spacemit: k1-bananapi-f3: Add PWM fan
>   riscv: defconfig: Enable PWM fan support
> 
>  .../boot/dts/spacemit/k1-bananapi-f3.dts      | 63 +++++++++++++
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  7 ++
>  arch/riscv/boot/dts/spacemit/k1.dtsi          | 91 +++++++++++++++++++
>  arch/riscv/configs/defconfig                  |  1 +
>  drivers/clk/spacemit/ccu-k1.c                 | 45 ++++++++-
>  .../dt-bindings/clock/spacemit,k1-syscon.h    | 12 +++
>  6 files changed, 218 insertions(+), 1 deletion(-)

I think spacemit,k1-syscon.yaml should probably be updated to make
'#clock-cells' property mandatory for rcpu2 node? And probably also
the other blocks capable of clock stuff as fix...

-- 
Thanks,
Yao Zi

Meow-mrrp-mrow, I'm a cat.
