Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2FC3BCD37;
	Thu, 15 Oct 2026 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067686; cv=none; b=oUuoD/H//Lh44e87fUEHAH8BPLILHkYQrksLiQP5ezYiB3hrlcbHi1o70lGthxY3mYnNNvXd64IOTLsXkHzNRr7qHVvZcezqPcqAdHmbU/nCTXWMj6XzLlevT8bgX5/dqaD9vFC0AbPaupp2L8tWzdBTaS6QCcs1NipTq3BYA6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067686; c=relaxed/simple;
	bh=PKYzlO5CwkWCo62CCEXO6UBShPbzkm7XCNkd0yD+MOg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SITq5VEZFA4DHqDx2MWkoARLnhQTXKqlav9Jw2S7MQe1hzSAOVp9NsrK83lwpWXRfUbrVxG0wQVTurrK2rZFm8TZjw67bTKvZu+VPY79CRglR73JKhkuGZthlRLQ3p0Jqj32cKBed2aG4MhY3oVqzTKFcBcfRiE5jvnkKDbLZLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0r5zhr1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0r5zhr1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A54B1F000C4;
	Thu, 15 Oct 2026 12:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792067684;
	bh=j/r4I4o9nEdVSuT6EOpxaiItEFAQBHvxFwBPttgm+g4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W0r5zhr1mjAUIJE0h6/OLvKHyjwobmoySy9HgXt/LZj1NoOMCq1hyTy/y3ss6ig8s
	 iq05XxW5HLh2ICcWt8gpf4599HVYU2tgLkqdx+0ZDoAxYiJHwOXxqI968N2pJcBapD
	 lvExrw7A/SVRA8swGO1OVgntI4WCcIn00QOUgUz7QQMb0NWs3IwdTs2T+KiLZsEE9F
	 jJplc6ebtA2wg16vYFBzJECS6t4CeLgebKsOs1O62BRpdC4+QHdRNJPe0rlO4+4RO4
	 tfTNqT7V1uX/hTcRjA5fsXWmZrnWjDB6D1BDvJ6BXncnJi1KLYCb4WMOLtNAOCX7sa
	 n9Bb8kRFUlhIA==
Message-ID: <sashiko-outbox-172810@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 01/10] clk: nuvoton: ma35d1: Use clk_hw pointers as
 mux parents
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-perso-ma35d1-upstream-clk-v9-1-1f548fa2002e@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v9-0-1f548fa2002e@bootlin.com>
 <20261015-perso-ma35d1-upstream-clk-v9-1-1f548fa2002e@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 12:34:43 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: ma35d1: unmanaged mux clocks leak and cause UAF on probe fail=
ure
--

commit ccf1a8c0da3e763270d5ce7fb63fab6388c0c310
Author: Miquel Raynal <miquel.raynal@bootlin.com>

clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents

This commit updates the MA35D1 clock provider to use actual hardware clocks
as mux parents rather than relying on parent data structures. This resolves
an issue where parent lookups failed, leading to an incorrect, flat clock
tree and missing rate assignments.

> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-m=
a35d1.c
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
[ ... ]
>  static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *nam=
e,
>  				     void __iomem *reg, u8 shift, u8 width,
> -				     const struct clk_parent_data *pdata,
> -				     int num_pdata)
> +				     struct clk_hw **hws,
> +				     const int *parent_idx, int num_parents)
>  {
> -	return clk_hw_register_mux_parent_data(dev, name, pdata, num_pdata,
> -					       CLK_SET_RATE_NO_REPARENT, reg, shift,
> -					       width, 0, &ma35d1_lock);
> +	const struct clk_hw *parent_hws[MA35D1_MUX_MAX_PARENTS] =3D {};
> +	int i;
> +
> +	for (i =3D 0; i < num_parents; i++)
> +		parent_hws[i] =3D (parent_idx[i] >=3D 0) ? hws[parent_idx[i]] : NULL;
> +
> +	return clk_hw_register_mux_hws(dev, name, parent_hws, num_parents,
> +				       CLK_SET_RATE_NO_REPARENT, reg, shift,
> +				       width, 0, &ma35d1_lock);
>  }

[Severity: High]
If device probe fails after these muxes are registered (for example, if
devm_of_clk_add_hw_provider() returns -ENOMEM near the end of
ma35d1_clocks_probe()), the devres subsystem will unwind managed allocation=
s,
unmap clk_base, and free ma35d1_hw_data.

Since the mux clocks registered here using clk_hw_register_mux_hws() are
unmanaged, won't they remain registered in the clock core and permanently
leak their internal struct clk_mux allocations?

Furthermore, because they remain registered, could subsequent clock
interactions dereference the now-unmapped clk_base register pointers,
causing a use-after-free or unmapped memory access?

While a later patch in this series addresses a similar issue for fixed cloc=
ks
by switching to a devm_ variant, ma35d1_clk_mux() still uses the unmanaged
clk_hw_register_mux_hws(). Should this be updated to use the appropriate
managed devm_ variant to prevent this regression?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-perso-ma35=
d1-upstream-clk-v9-0-1f548fa2002e@bootlin.com?part=3D1
