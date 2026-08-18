Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5299218C02E;
	Tue, 18 Aug 2026 10:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050120; cv=none; b=ICM1IUP4+Fc+24//Lzy8Pi/nijtSEDZRWZs0WITMI9gosiZ7C1OnuI080ZtZd/JcY/CESnQ9pSWh/FnNaflxFgHf3ehKSEPK2KJVrcy5EjjNwMcyLZfbVf3IGaZtgKV6kPNwHQ7r6Dzc+OZs+TQAj9vUxNSIH1DgJv/wWoo3Quc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050120; c=relaxed/simple;
	bh=3TE8nzzKCPycJutg5FCq+aIvNJNCO162UVE7y8tI+Rg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A08E9Ur9JoVquww9mchMtV+tHXcgUiutblhJaAkYYq4rCQoA9ywlOvRDYfhVY4aRKohHiBg4DqA8PApJxxHxIn632QVpH9C9ASv3EI8lC/7BGtzI8aB89LSr19MjbrVN4w9xtbih9wlRw2ISQHyXek4G/fkXtUnWNBufxI7T3mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atzX3Ryx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atzX3Ryx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD6D1F000E9;
	Tue, 18 Aug 2026 10:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787050118;
	bh=j6Qc2KAs50uEUmKyGTGvtvhI5HwdxClML5zFTdImmyY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=atzX3RyxDu/Xkv9dGX2avJB++G6+LWkV5A0qUuOOR+dJAhhokIPIZA0QQ+gaQdq3I
	 Jy7blp92qaEpK+zQR4lmXluJacIkIlX3VTXvfujr8edv4ut0dYicRhjVsdbU7stVv7
	 gB0RSkcxbsgO3A3iJkDnKCvf3se4rmyGoKckRCj/4PTO6fQPrhVm3ov/GjBLI2/ipn
	 XWb2xYBzWhf58nOs6MQwUnNDaQ2iCc3bK/03dx7WXBqGmmBu6ceFxb1TdQ4K3HBzJw
	 HqOf4gE7qq+nCFw98fo6jWRpJUMQJBT2a1/+exQtIja2SUvaDFG26OKnfwvkCFX//j
	 F5KQ292oqGkag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/12] pinctrl: ambarella: add CV75 pin controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260818-cv75-v5-v5-9-7bbb12f0360f@ambarella.com>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-9-7bbb12f0360f@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:48:38 +0000
Message-Id: <20260818104838.7BD6D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Race condition between PM suspend/resume callbacks and concurrent =
pinmux hardware accesses.
--

--- Patch [9]: [PATCH v5 09/12] pinctrl: ambarella: add CV75 pin controller=
 ---
commit d6bbc0d8c89a402f676e8c68b67c6a6866af650a
Author: Long Zhao <longzhao@ambarella.com>

pinctrl: ambarella: add CV75 pin controller
   =20
Add an Ambarella pinmux-only pinctrl driver with CV75 function/group
tables. GPIO is handled by the PL061 driver.

> diff --git a/drivers/pinctrl/pinctrl-ambarella.c b/drivers/pinctrl/pinctr=
l-ambarella.c
> new file mode 100644
> index 0000000000000..f9146d365c3c5
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-ambarella.c

[ ... ]

> +static int amb_pinctrl_suspend(struct device *dev)
> +{
> +	struct amb_pinctrl_soc_data *soc =3D dev_get_drvdata(dev);
> +	u32 bank, dedicated =3D soc->data->clk_au_dedicated_pin;
> +
> +	for (bank =3D 0; bank < soc->data->nr_banks; bank++) {

[ ... ]

> +		if (soc->data->have_ds2)
> +			regmap_read(soc->ds_regmap, soc->data->ds2[bank],
> +				    &soc->pm[bank].ds[2]);
> +
> +		amb_iomux_save_bank(soc, bank);

[Severity: High]
Does this read the IOMUX hardware state into PM structures without holding
soc->lock?

If another CPU is modifying the pins concurrently, could this result in a
torn read?

> +	}
> +
> +	if (dedicated >=3D soc->data->nr_banks * 32)
> +		amb_iomux_save_bank(soc, PINID_TO_BANK(dedicated));
> +
> +	return 0;
> +}
> +
> +static int amb_pinctrl_resume(struct device *dev)
> +{
> +	struct amb_pinctrl_soc_data *soc =3D dev_get_drvdata(dev);
> +	u32 bank, dedicated =3D soc->data->clk_au_dedicated_pin;
> +
> +	for (bank =3D 0; bank < soc->data->nr_banks; bank++)
> +		amb_iomux_restore_bank(soc, bank);
> +
> +	if (dedicated >=3D soc->data->nr_banks * 32)
> +		amb_iomux_restore_bank(soc, PINID_TO_BANK(dedicated));
> +
> +	/* Ensure restored IOMUX writes land before the commit strobe. */
> +	wmb();
> +	amb_iomux_commit(soc);

[Severity: High]
Does this write directly to shared IOMUX hardware registers without holding
soc->lock?

If a concurrent pinmux or GPIO configuration request executes while the sys=
tem
is resuming, the pinctrl core will invoke amb_pinmux_set_mux() and acquire
soc->lock.

However, since amb_pinctrl_resume() does not hold the lock here, could it
silently overwrite the concurrent pinmux updates with stale suspended state?

> +
> +	for (bank =3D 0; bank < soc->data->nr_banks; bank++) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-cv75-v5-v5=
-0-7bbb12f0360f@ambarella.com?part=3D9
