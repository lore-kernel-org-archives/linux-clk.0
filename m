Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331FA456E11;
	Fri, 25 Sep 2026 14:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348235; cv=none; b=iO9qacrDqa/gIdEwicq3QR1IzpubMSEfqNv9zikwAxkhWfMH+cB/Y1mXeC251lqZvzF4xcgbR+wWdeSpmx/1kLV8dosSwr0x5O3vouTPzF66c1BRW5BEiPaqRJkbguL2yYhiaz0W9C9y7W3JHbsaVPTIjt21OENBfK+Bz547Y6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348235; c=relaxed/simple;
	bh=mIcFpe9JE2OceWDeNTZaCq5DbJs5iye2rs2gSvw2I9E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iCvQIJK8l8fIps98pgxxrvQeuyKmC2N52+Sd7IlXqZjXbH0mIocVypKQ0LBaC21xxjW2bY9rFZ0LEQH0AwKzppVPZ5f1OWqiesauPEGKgfF+KmlDNpiZkOOmmA7vOVqLjGHxllYscdJtaxwxFyrkwoTpsWOp8aElZhVj47hzgCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfw9TVG/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfw9TVG/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACF51F00893;
	Fri, 25 Sep 2026 14:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790348221;
	bh=EovV/FWgCvrsFXbNM5d6Zx+yf0Rq+JBC0XZHrnCASJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lfw9TVG/7Ghsx4RL3MR/IdF+iPYAAtlEyrKuTZZsG14ec5MOYtvAv9MnAIKu9wS+b
	 JgmChhSHR2l73Y7x29gaUtnTRcLwInqp1mG2nCMz1GXIoqWlj8wx8/SvCNlzncaNVr
	 Dx6Ek6R4l/zVOzzQ0Br76+QlhSAjjYSSelmgcb90v3c4lGqug4iL8UO3a/v4mXZcnC
	 RwCsKFFrLn2uRir99lfwkQTEoIc4Nvb/uteAKsFmgt5EaS1xMMpQuHKx+tleCYYp/v
	 QcAVwFfJVigcb+FXfmXLhDesUoQZi1u4FdO0UHOFmS1RMuKRjhbqL3K+DjjydVkdG7
	 D7PSuubLy4jsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] clk: nuvoton: ma35d1: Add missing WDT/WWDT
 parent clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260925-perso-ma35d1-upstream-clk-v3-4-ffbae7e020a8@bootlin.com>
References: <20260925-perso-ma35d1-upstream-clk-v3-0-ffbae7e020a8@bootlin.com>
 <20260925-perso-ma35d1-upstream-clk-v3-4-ffbae7e020a8@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 14:57:01 +0000
Message-Id: <20260925145701.6ACF51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: nuvoton: ma35d1: heap buffer overflow when assigning WDT/WWDT=
 parent clocks
--

commit c77078104be2c7bd11ad595fff116aca53714922
Author: Miquel Raynal <miquel.raynal@bootlin.com>

clk: nuvoton: ma35d1: Add missing WDT/WWDT parent clocks

This commit adds missing WDT and WWDT parent clocks for the Nuvoton MA35D1
clock controller. It registers pclk3_div4096 and pclk4_div4096 as fixed
factor children of pclk3 and pclk4 to expose them through the provider.

Link: https://lore.kernel.org/linux-clk/b8a8a65b-e302-4747-bc90-4920fc48795=
a@gmail.com/

> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-m=
a35d1.c
> index 6aa42a3e1be3b..5d706f5c30a59 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> @@ -544,6 +544,8 @@ static int ma35d1_clocks_probe(struct platform_device=
 *pdev)
>  	hws[HCLK3] =3D ma35d1_clk_fixed_factor(dev, "hclk3", "sysclk1_mux", 1, =
2);
>  	hws[PCLK3] =3D ma35d1_clk_fixed_factor(dev, "pclk3", "sysclk1_mux", 1, =
2);
>  	hws[PCLK4] =3D ma35d1_clk_fixed_factor(dev, "pclk4", "sysclk1_mux", 1, =
2);
> +	hws[PCLK3_DIV4096] =3D ma35d1_clk_fixed_factor(dev, "pclk3_div4096", "p=
clk3", 1, 4096);
> +	hws[PCLK4_DIV4096] =3D ma35d1_clk_fixed_factor(dev, "pclk4_div4096", "p=
clk4", 1, 4096);

[Severity: High]
Does this code overflow the hws[] array?

Looking at the definitions in drivers/clk/nuvoton/clk-ma35d1.c,
MA35D1_CLK_COUNT is defined as 236:

#define MA35D1_CLK_COUNT 236

And in ma35d1_clocks_probe(), the array is allocated using this count:

	ma35d1_hw_data =3D devm_kzalloc(dev,
				      struct_size(ma35d1_hw_data, hws, MA35D1_CLK_COUNT),
				      GFP_KERNEL);
	if (!ma35d1_hw_data)
		return -ENOMEM;

	ma35d1_hw_data->num =3D MA35D1_CLK_COUNT;
	hws =3D ma35d1_hw_data->hws;

Since the hardcoded MA35D1_CLK_COUNT was not increased to accommodate the
two newly added clocks, will writing to PCLK3_DIV4096 (236) and
PCLK4_DIV4096 (237) cause an out-of-bounds heap write?

Additionally, because ma35d1_hw_data->num remains capped at
MA35D1_CLK_COUNT, does this leave the new clocks unregistered to external
dt-binding consumers?

> =20
>  	hws[USBPHY0] =3D ma35d1_clk_fixed("usbphy0", 480000000);
>  	hws[USBPHY1] =3D ma35d1_clk_fixed("usbphy1", 480000000);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-perso-ma35=
d1-upstream-clk-v3-0-ffbae7e020a8@bootlin.com?part=3D4
