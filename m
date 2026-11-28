Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859592;
	b=jWm3Uh1GhPVYSM+g6XH+1dTz8W3+gZQ6nReC0mhJGzLVWHwXq8EKnWTmYRctmfxRzRil
	 zZ06kwCFdUTpK8QKyVyI67lToGxn5yN6nb1wXLX9jdb9AqkrzTu81hpsRCbMhDq4CbYuE
	 RHZrUXET36v/X7GTTt7LJonvey9Hfr5mfFkxOteffx2TSkdxsaD4uZbkA39t2cdMCTs/n
	 oniw1lNb67G715EYRLlBJYgZ/0aQMu/NgKB6nbLmD660W4s6q5pzC7EpriMx+lpnzQ9FK
	 q7DtEl88TelN67ty/qGZehzXafsf3UeDCBrEgHiFRI0MhyNQeg73KOxigRkLXppSihw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859592;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RuhyUWdx1l0hj6Yk3xPrC58yJZ3OIgifOEmTro975q4=;
	b=5PdMbVmgj9jXOm5J9OIAg0TOBjw+2DWZK5rxtOXpgYMGbX7eoNnZk5eXoOi5IlLPVzLP
	 lktcGEE55ran1p5YZtp0TOOeH7+0hq4x2q2IqIkUdR74lKmztHA58YtBitDWxkb+VrlCw
	 L4pMRc8USRl0uPPVtRrdPIIPRUbc4nwCBewkYrW6x7wg7NcJ/bWEDGnME+H6Ro0NCgdf2
	 9vUh3SYnNYmG5u1ssIlhLJDX+AgbhypFp354x1gZ+mFeDxvt3GghfXlTt6ctrrBbe9PW0
	 LZxjN4Fttv5wBwx6VVLQvEMeQ4gTKdcoNUAZam+q4pTzcp3vtOxr/uYoUCrHKATY81w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Scbd2a7x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BEE606A680
	for <linux-clk@vger.kernel.org>; Sat, 28 Nov 2026 09:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Scbd2a7x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1A61F0089C;
	Sat, 28 Nov 2026 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795859592;
	bh=RuhyUWdx1l0hj6Yk3xPrC58yJZ3OIgifOEmTro975q4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Scbd2a7xXaOhv3eGkscYvpQw++iaSEA86Xfpj1yyzi9E4WQ5BPMLKX5J6Lv7vcPBn
	 TbQHCdvmonYbc9GTDe5TThGZYMIQUyEbg0jiXqIUzTSzsUYCBZUAySVm9kt9rRgOJw
	 jGzofvSkv0tHmY/pGHAbIBBGXs3QjWZ5D36BbobnHrKCfkuYVHGhfk2QauV7J5daIB
	 xZ+xJeHRZo3pv3hfa+Yf00JtsKuyCGW8EAV7GwbxIFgsDfEku2rcvc82vbdAsspdFV
	 JFiuRoqaXTJhQpTf6hLjVCMMitlGZla+akf+lq8Pkta1AnYQb3jsfn4xaav3EEA+tl
	 GodAmDvRhoueA==
Message-ID: <sashiko-outbox-238613@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: microchip: Unregister the PIC32MZDA OF clock
 provider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261128-f81b700d6c-u16-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u16-0@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 09:53:11 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] clk: microchip: UAF and incomplete teardown in
  pic32mzda_clk_remove()
- [Medium] clk: microchip: incomplete error unwind in
  pic32mzda_clk_probe()
--

commit 6d31002c60a71977bbe0f0b53f73dd0c80ec6ed3
Author: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

clk: microchip: Unregister the PIC32MZDA OF clock provider

This commit removes the OF clock provider when register_nmi_notifier()
fails during probe and adds a platform driver remove callback to delete the
provider on unbind.

> diff --git a/drivers/clk/microchip/clk-pic32mzda.c b/drivers/clk/microchi=
p/clk-pic32mzda.c
> index fc4357ec7103d..e889cb8130169 100644
> --- a/drivers/clk/microchip/clk-pic32mzda.c
> +++ b/drivers/clk/microchip/clk-pic32mzda.c
> @@ -241,7 +241,16 @@ static int pic32mzda_clk_probe(struct platform_devic=
e *pdev)
> =20
>  	/* register NMI for failsafe clock monitor */
>  	cd->failsafe_notifier.notifier_call =3D pic32_fscm_nmi;
> -	return register_nmi_notifier(&cd->failsafe_notifier);
> +	ret =3D register_nmi_notifier(&cd->failsafe_notifier);
> +	if (ret)
> +		of_clk_del_provider(np);
> +
> +	return ret;
> +}

[Severity: Medium]
Does returning an error here leave non-devm resources and dangling
references behind when devres frees cd and the devm-registered clocks?

pic32mzda_clk_probe() allocates cd with devm_kzalloc_obj() and registers
most clocks via devm_clk_register(), but also performs several non-devm
registrations:

drivers/clk/microchip/clk-pic32mzda.c:pic32mzda_clk_probe() {
	...
	core->iobase =3D of_io_request_and_map(np, 0, of_node_full_name(np));
	...
	clks[FRCDIVCLK] =3D clk_register_divider(&pdev->dev, "frcdiv_clk",
					       "frc_clk", 0,
					       core->iobase,
					       OSC_FRCDIV_SHIFT,
					       OSC_FRCDIV_MASK,
					       CLK_DIVIDER_POWER_OF_TWO,
					       &core->reg_lock);
	/* PLL ICLK mux */
	pll_mux_clk =3D clk_register_mux(&pdev->dev, "spll_mux_clk",
				       pll_mux_parents, 2, 0,
				       core->iobase + 0x020,
				       PLL_ICLK_SHIFT, 1, 0, &core->reg_lock);
	...
	for (i =3D 0; i < MAXCLKS; i++) {
		if (IS_ERR(clks[i]))
			continue;
		clk_register_clkdev(clks[i], NULL, __clk_get_name(clks[i]));
	}
}

If register_nmi_notifier() fails, devres frees cd and the devm-allocated
clk_hw objects while the clk_lookup entries registered with
clk_register_clkdev() remain on the global clkdev list pointing to freed
clk_hw memory (causing a use-after-free on clk_get()), and frcdiv_clk and
spll_mux_clk remain registered with spinlock pointers to &cd->core.reg_lock
in freed cd.  In addition, the critical clocks enabled just above are not
disabled/unprepared, the fixed-rate clocks are not unregistered, and
core->iobase from of_io_request_and_map() is neither unmapped nor released.

> +
> +static void pic32mzda_clk_remove(struct platform_device *pdev)
> +{
> +	of_clk_del_provider(pdev->dev.of_node);
>  }

[Severity: High]
Can unbinding this driver corrupt the global MIPS nmi_chain and cause a
use-after-free?

pic32mzda_clk_probe() registers &cd->failsafe_notifier with
register_nmi_notifier(), which links the embedded notifier_block into the
global nmi_chain in arch/mips/kernel/traps.c (and MIPS provides no
unregister_nmi_notifier() helper).  When pic32mzda_clk_remove() returns,
devres frees cd while &cd->failsafe_notifier is still linked in nmi_chain,
so a subsequent NMI or register_nmi_notifier() call walks freed memory.

Unbinding also suffers from the same incomplete teardown as the probe error
path above: the non-devm clkdev lookup entries, non-devm clocks referencing
&cd->core.reg_lock, enabled critical clocks, and the of_io_request_and_map()
mapping and memory region are all left behind.  Since this is a core SoC
clock controller, should pic32mzda_clk_driver set .suppress_bind_attrs =3D
true instead of providing an incomplete .remove callback?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128-f81b700d6c=
-u16-0@mail.sdu.edu.cn?part=3D1
