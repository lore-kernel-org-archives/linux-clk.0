Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EFD51D524;
	Thu, 15 Oct 2026 12:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067535; cv=none; b=Z3/7VowbRmssISNYdYMcH9ZoH1dXdORjRfkGO8bDzsX2y5LvrnYNxVzlNG8/pdJx/u602OL1+C+cr0jtFcCRe1HBoOuIZDxhKJtMU87CtztThW2/rY30qE+YgpC4vjBH1kYC1X2arTHeZAq5UaY91wkgeFfDHBD1x5XvcYz59Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067535; c=relaxed/simple;
	bh=8WD1KJEKyLO9GG7VlKQaADfeScVI9vidkvvaM8Bb0dA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SAaXR/YtZJdbMKhkYJxwBedgtlyP6jCgtQ4aaseeV6g8p/ujTa95/Bp/36SpexzjZcMZUdYD2EsAgBxS+NOZ7CA/R0+7X+dtkmlWVKOzsOBN9XYCoBxhuS9GDaqinEa5ad99nSJ2V7sabVBWxjFmehrLNGEMMS0OznYM3raJe4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhrFfNdb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhrFfNdb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62B01F000C4;
	Thu, 15 Oct 2026 12:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792067534;
	bh=X8FOmBSXX+HUNGHXxMp3OHiT/S2NzydEE8rbyj6LL5Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FhrFfNdbHiOJlh2XuFB/qa9tJidlObqnBnsGkalNKNkjy0i5o9XE6MEniJsDPOR0Y
	 zVCo2WURfbfEH3FRqUEzKVl2+gnEm/dvbVPCcl9XQowbTql68NyCKfSHZyALUIZpJ7
	 RPLpoQ7IAZQvO7V3pjJj5yJ7xzCHzPZV/GrgEMvZhqpe9XUyummirJiIbC4CdHbLVX
	 WQTFLzcjYIhhi5VlUsM6wmI56q5OfD1Tbi4PxLZslDyIH5GoZFb07omu9vO9t5p2uj
	 FpGYCvOkd2Gbgz/1M0/LxqhCW2YNkfQQMj5Gom1XC5SdiimZ4yPPKZxm45U+GnTUUW
	 D2DWM9cTE/f7Q==
Message-ID: <sashiko-outbox-172803@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 05/10] clk: nuvoton: ma35d1: Use device managed
 helpers for fixed rate clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-perso-ma35d1-upstream-clk-v9-5-1f548fa2002e@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v9-0-1f548fa2002e@bootlin.com>
 <20261015-perso-ma35d1-upstream-clk-v9-5-1f548fa2002e@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 12:32:13 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: nuvoton: UAF on unbind due to unmanaged mux clocks holding de=
vm-managed parents
--

commit cdff8376e12bb7360642c4498d1f771077f9d948
Author: Miquel Raynal <miquel.raynal@bootlin.com>

clk: nuvoton: ma35d1: Use device managed helpers for fixed rate clocks

Most of the clocks are already registered with device managed helpers,
except the fixed clocks. Harmonize the driver by using the already
available managed helper for that.

> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-m=
a35d1.c
> index 75b7e2a84bfd9..4a745b169778d 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> @@ -139,9 +139,9 @@ static const struct clk_div_table eadc_div_table[] =
=3D {
>  	{13, 28}, {14, 30}, {15, 32}, {0, 0},
>  };
> =20
> -static struct clk_hw *ma35d1_clk_fixed(const char *name, int rate)
> +static struct clk_hw *ma35d1_clk_fixed(struct device *dev, const char *n=
ame, int rate)
>  {
> -	return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
> +	return devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);

[Severity: High]
Does this change introduce a use-after-free on driver unbind?

Mux clocks in this driver are registered using clk_hw_register_mux_hws() in
ma35d1_clk_mux(), which is not devm-managed:

drivers/clk/nuvoton/clk-ma35d1.c:ma35d1_clk_mux() {
...
	return clk_hw_register_mux_hws(dev, name, parent_hws, num_parents,
				       CLK_SET_RATE_NO_REPARENT, reg, shift,
				       width, 0, &ma35d1_lock);
}

Because these mux clocks are not devm-managed, they will remain in the clock
framework after probe failure or driver unbind. Since this patch makes their
fixed-rate parent clocks devm-managed, those parents will now be freed on
unbind.

Will the orphaned mux clocks retain dangling pointers to the freed fixed-ra=
te
parents, causing a use-after-free if the clock tree is traversed later (e.g=
.,
via /sys/kernel/debug/clk/clk_possible_parents)?

>  }
> =20
>  static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *nam=
e,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-perso-ma35=
d1-upstream-clk-v9-0-1f548fa2002e@bootlin.com?part=3D5
