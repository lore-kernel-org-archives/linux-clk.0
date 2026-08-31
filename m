Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529AC3B5302
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 03:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788147336; cv=none; b=Fw8yZPP/Vf8NksR8sm60463Py81S2Od6YVOYfrYenxT9MqpVeE4a/fSyB/BAN2dGOo9+AROC+hLFih0pgZBefpRo3b0dQQ4/k0CL9bIDlDhRRfNjIfNY6tbWzPofpET21GjwnHaI79MuRKJcnWdIjweO34J5OI7bdC5uH7PI5gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788147336; c=relaxed/simple;
	bh=/hlG6PQtgJAI+VzCwWx283vr638+UDMgqfVTN9wdZdY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UlSxlD/lKszjwxMhohUsgXIvIvsU9caoRvQl6hL28ikMZSGQus4f3HtAkOXQ/lkMq9LdLhTP42NiLEu6gp6UtKtfNwkMy12E/YuFmj8VjFLY4C3GZ1o/e7Iw6fzKidTgRU1fVtvHoz+9sUzRQCHcvFYxb0uziOgVmSESQznTvj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUhM0FCp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUhM0FCp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6551F000E9;
	Mon, 31 Aug 2026 03:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788147305;
	bh=f8YZR+Z0IcmQ+4H7+hYqIHieGRECWJu4nEzN07VOvbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XUhM0FCpTOSyZcvcoI8Leo8h30oD8ZTRWC6isWyc1D94Xez/gz37RjbLQ6XqLXd5M
	 Pg7+TwR4qgsFzmg/0XTdsc2rbibJHAsLgVtrelSR42gR/EFUiA5Uguumf9l6McYbaA
	 PBJil1gngNrGWd/ClBq+UOHEl9xfaxj18TjMyXF8HiXb55Xt8rHuxU/cNUkPnnBNkD
	 i979PGjNeOeDHS5mLyJyrinqSfEwR6nho7gRm84HuM0Es5iNWd6ayEPo1KKMSkWwkx
	 V+O80jjqeKjJOa2TO0JdixxE+fPqz4UczDw1WlUZlI0db2LczCgGWKAoyxlV6sD54t
	 wZQ2K7LuCEX8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] clk: spacemit: k3: add 1.8 GHz PLL5 and PLL8 rates
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260831-k3-pll5-pll8-1800mhz-v3-1-530ed0978615@linux.spacemit.com>
References: <20260831-k3-pll5-pll8-1800mhz-v3-1-530ed0978615@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 03:35:04 +0000
Message-Id: <20260831033505.2A6551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but `ccu_plla_init()=
` and `ccu_pll_init()` unconditionally disable the PLL without re-enabling =
it if the bootloader-configured hardware state is not found in the rate tab=
le. If this PLL feeds a critical component (e.g., CPU C2/C3 cores via PLL5/=
PLL8), disabling it during clock registration will instantly lock up the sy=
stem.
--

commit 6e193fb72f81d59157c0ebe259d1101a840915f0
Author: Troy Mitchell <troy.mitchell@linux.spacemit.com>

clk: spacemit: k3: add 1.8 GHz PLL5 and PLL8 rates

K3 boot firmware configures the C2 and C3 CPU clock domains at
1.8 GHz. PLL5 feeds C2 and PLL8 feeds C3, but their rate tables
currently contain only the 2 GHz overclocking operating point.

> diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
> index 92b930d5ff305..1796236d8dc55 100644
> --- a/drivers/clk/spacemit/ccu-k3.c
> +++ b/drivers/clk/spacemit/ccu-k3.c
> @@ -38,6 +38,7 @@ static const struct ccu_pll_rate_tbl pll4_rate_tbl[] =
=3D {
>  };
> =20
>  static const struct ccu_pll_rate_tbl pll5_rate_tbl[] =3D {
> +	CCU_PLLA_RATE(1800000000UL, 0x0b4b0000, 0x00000000, 0xa0458585),

[Severity: High]
This isn't a bug introduced by this patch, but ccu_plla_init() and
ccu_pll_init() unconditionally disable the PLL without re-enabling it if the
bootloader-configured hardware state is not found in the rate table.

If the bootloader configures a clock rate that is not present in the driver=
's
rate table, the clock initialization callback will disable it abruptly:

drivers/clk/spacemit/ccu_pll.c:ccu_plla_init() {
    ...
	if (ccu_plla_lookup_matched_entry(pll))
		return 0;

	ccu_plla_disable(hw);
	ccu_plla_update_param(pll, &pll->config.rate_tbl[0]);

	return 0;
}

The same pattern occurs in ccu_pll_init():

drivers/clk/spacemit/ccu_pll.c:ccu_pll_init() {
    ...
	if (ccu_pll_lookup_matched_entry(pll))
		return 0;

	ccu_pll_disable(hw);
	ccu_pll_update_param(pll, &pll->config.rate_tbl[0]);

	return 0;
}

Since these PLLs (such as PLL5 and PLL8) feed vital components like the CPU
C2/C3 cores, disabling them during clock registration instantly locks up the
system.

Can this be addressed to prevent a system hang if a custom firmware sets an
unlisted clock rate?

While the patch notes mention leaving the PLL init regression for a separate
series, does it make sense to fix the structural problem before adding new
rates?

>  	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
>  };
> =20

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-k3-pll5-pl=
l8-1800mhz-v3-1-530ed0978615@linux.spacemit.com?part=3D1
