Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279984;
	b=gnRovlHfur+rRxxpfwlS8VsHWHPfUDFupeC7yr/klqLNmWm/KbMBN/GQUpnzjdmFUOx5
	 HTgl/+qzAnFhT54AVUpt+QyXw9peXhLJqcEUuKP3Ve2h66Ttq/YQuzxn7VxPq8sHJ01Hm
	 TFCr2Vs0mxISFDSnjmt7Fr/qPxmOg+RqnvYAU2MNxMm89YjLvAizmHvJNq2bDLojifOVp
	 UyAA5PIlI/6jPoOX2cKSjwgxAH9ColxQfOieBd2gujJYUWWZoqlRjcxwal344nkPYi3vq
	 8tDqeVBObdGhFl1n7OIpAVMVNM5F9vpPANfVPAqpxrxhf+RHABFxhXPP++966b0OT3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279984;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9q34c/krI5dpPFr8XLaGK+ZFv2bFeg/RdWIdq1xUvgw=;
	b=1YcXCUHQe6AEvD6MUSCPFvWyN5p7nMl+F5IHJfwa78oEj2Of2/cPlhI+5RZR7P/OJMdb
	 sTJuqpMX87oKN0VzilyzpLcKLUGsHZSnoQjdOh5oRE0GKpjJsSQLji1JNBPVPjSnHkR3f
	 ALmd0Bjf28/9mVPYanFYJQ79eTCa77bOzrnzihwvS/RbTwRmNj9Uh/2xvntTUlC3v0mYG
	 fj/L5K2wHipUTCq8nOpvkOWleNMGambUdgHmLRauw8nFjAndLVQzdh8kTAM1+SuXqfQUk
	 qQS1ThdPHot8pbjoa07sIeDIA/rqApwkOsf/jHbdrFqvLayEO2OaWCXH6UTy0Ku3fhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oAKuHRkl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29B0606A320
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 16:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oAKuHRkl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D541F000C6;
	Sat, 21 Nov 2026 16:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795279984;
	bh=9q34c/krI5dpPFr8XLaGK+ZFv2bFeg/RdWIdq1xUvgw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oAKuHRklc5nEIukcJYQ76Y45SfRaLHtFWazwg2pkZWOmlIYX3Ieb84T+WC3ZbcbsP
	 BFclqISgCYhXjyN8SX1+sJKaQnRXwDX+z9+AeMPOpxHEB7k9KX63KZTnfpdGlybMZz
	 N4sCCTkKsHnEfTDeMf3xmK6NSXorDGYo4kSMhvqz5lYE8HxYhGzEBFXibN82EL7Bdr
	 xTO5RBkfzqYFQBkpFoPGKYk+K/NjHHTd8aIoXWHj1o44M4GqhrJXaJo50KToB8yz+V
	 45+0+XBRArypDdd6TlLGkfZpHzCH6k4YTr5ABgPOojt2ZmJlplk7J5qXTGBbD/+LDp
	 iZIF1OOFPIDJw==
Message-ID: <sashiko-outbox-227181@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: rp1: allow the clock provider to be probed again
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Covington" <joshuacov@gmail.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261121163915.86681-1-joshuacov@gmail.com>
References: <20261121163915.86681-1-joshuacov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 16:53:03 +0000
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
- [High] clk: rp1: use-after-free in rp1_clk_probe() from stale hw.core
  on re-probe
--

commit 0c4e0577acfd5e28d80d2ef3e1cc9693b2d23c01
Author: Joshua Covington <joshuacov@gmail.com>

clk: rp1: allow the clock provider to be probed again

This commit saves and restores the clk_init_data pointer on each static
rp1_clk_desc descriptor in rp1_clk_probe() so the driver can register its
clocks again after an unbind and rebind.

> diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
> index 1dd276dd2bb3e..5c3929e935fce 100644
> --- a/drivers/clk/clk-rp1.c
> +++ b/drivers/clk/clk-rp1.c
> @@ -363,6 +363,7 @@ struct rp1_clk_desc {
>  				       struct rp1_clk_desc *desc);
>  	const void *data;
>  	struct clk_hw hw;
> +	const struct clk_init_data *init;
>  	struct rp1_clockman *clockman;
>  	unsigned long cached_rate;
>  	struct clk_divider div;
> @@ -2418,8 +2419,15 @@ static int rp1_clk_probe(struct platform_device *p=
dev)
> =20
>  	for (i =3D 0; i < asize; i++) {
>  		desc =3D clk_desc_array[i];
> -		if (desc && desc->clk_register && desc->data)
> -			hws[i] =3D desc->clk_register(clockman, desc);
> +		if (!desc || !desc->clk_register || !desc->data)
> +			continue;
> +
> +		/* The clock core clears hw.init of these static descriptors */
> +		if (!desc->init)
> +			desc->init =3D desc->hw.init;
> +		desc->hw.init =3D desc->init;
> +
> +		hws[i] =3D desc->clk_register(clockman, desc);
>  	}

[Severity: High]
Can re-probing cause a use-after-free on a freed struct clk_core when a
clock references a parent at a higher index in clk_desc_array?

When the device is unbound, clk_unregister() frees each clock's struct
clk_core without clearing hw->core on the static descriptors.  In
clk_core_fill_parent_index(), the clock core checks entry->hw->core and
assumes a non-NULL pointer is an already-registered parent.

Several descriptors in clk_desc_array reference parents via .hw that sit
at higher array indices, such as clk_mipi0_dpi_desc (RP1_CLK_MIPI0_DPI)
referencing clksrc_mipi0_dsi_byteclk_desc (RP1_CLK_MIPI0_DSI_BYTECLOCK).
Because rp1_clk_probe() registers clocks in a single pass without first
clearing desc->hw.core (and desc->div.hw.core) across clk_desc_array, if
the hardware mux selects one of those higher-indexed parents during
re-probe, __clk_init_parent() -> clk_core_fill_parent_index() returns the
dangling clk_core pointer from the previous bind and __clk_core_init()
links into parent->children on freed memory.

Clearing desc->hw.core and desc->div.hw.core for all descriptors before
the registration loop would avoid this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121163915.8668=
1-1-joshuacov@gmail.com?part=3D1
