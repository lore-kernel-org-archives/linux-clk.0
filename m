Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203588;
	b=j9nP/BKk/sswNtBhXeosWxkRxJTVqyQ9cCyVsPjbt83Madi9VyECjed2bjlQerlXSaum
	 3MFUYOfXmlb4bgh+4PkhW86dAuVAc1Cymm0jOkU/8LVYkXeWr58J+nN5w8/g5W+sZtTM7
	 rz3xQ42sdnGFk6xEP7yvAIjnTJQQdZxuvcLItycyZpd1JxHgrXC7SmmO5uC8LAyB+ly1X
	 pteYVcAHsPgZblu0B2Z2nyfaWxjwW91o+lIes+i0tJqdT6ZXQIFiyASMEu8u7lw4c63Ui
	 pLJ35qTPAj1pfkVvgy+0d2sv2hnLcAgFsQ7E/Rok8245p+myH8267fPgs2SpU9TMioA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203588;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mk4IOK3mDEaUBMf/sbWMrGVY3R+pVJvMNGzDj06Xmws=;
	b=14330oWkvxXb4LywsZuWPLMLHzu464w3c9f0fO+xtKSKMcdMUp8nGM0cXWCxJqa76DYW
	 Qk/GyrYdTE/+Ru+pfwEMQUPKqYHF9l9kZLpGrJhpRLeDyyFs+EuhvXSOwAP49Zn5A6oHA
	 85sHQ4Z9GMs6ofpb81uy5S4mt2YXrpiOnqTbRcRh2w/mKs6KqBBPrAbq1KrxHd7jrGCu6
	 SLEIsMQHeJbFV1tgQvZA0IcZCFdVPU9sdCacCLSKacydwMsFp4ztS3NMxnl8oL6l+ZXCG
	 pXwaEdNOt460HagH2EYP8vLCNj4ka8EImxpPNR4fFEqCEXpd+bacEkhabQ7NEh1tmyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+yGSx+X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B47606B24F
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 16:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+yGSx+X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851051F01828;
	Wed, 28 Oct 2026 16:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793203587;
	bh=mk4IOK3mDEaUBMf/sbWMrGVY3R+pVJvMNGzDj06Xmws=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H+yGSx+Xz5Pb0wGvpf92YtYZF6DqjQeb55rGCGfmg14E7yKo5V7A3nMNJULkVoFec
	 kwZSt9q6HKMbyxKTW92lKdd65TH9GHMOsvWQJ3H9VyTr53TxFel3EWXMDKDfPOpoQZ
	 CKryq4ovbOcCriMrSLn72nadqITK0FgRMhA1vxmxTOtUnjiyicr+GORojp4Ya9pvIM
	 Ca/X4FC4bj1SQ68AoG48effetFK+UVyMuMUT83TTJ6S59nqGW/XyDyRFSLLU98ugwH
	 LvJ82cw6qaUVDSfP3+diDLd6npbcII9k9CQm+rAff2uOiRtsLfU3WzmeI2LzK16cnX
	 BT9g2K2ks6PNQ==
Message-ID: <sashiko-outbox-188115@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] clk-816x: add sys_ck clock as sys_clkin_ck alias
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ettore Chimenti" <ettore.chimenti@linaro.org>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261028-patch-ektor5-dm8168-clk-v2-4-dc6bf0fabae4@linaro.org>
References: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
 <20261028-patch-ektor5-dm8168-clk-v2-4-dc6bf0fabae4@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 16:06:27 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: ti: dm816x: adding sys_ck alias triggers invalid OMAP3 VC/V=
P init
--

commit 1a28e92700d48db3c2d33b03820789ccb46fb7f1
Author: Ettore Chimenti <ettore.chimenti@linaro.org>

clk-816x: add sys_ck clock as sys_clkin_ck alias

This commit adds a clock alias mapping sys_ck to sys_clkin_ck in
dm816x_clks[] so that the OMAP voltage management driver can find sys_ck on
DM816x systems.

> diff --git a/drivers/clk/ti/clk-816x.c b/drivers/clk/ti/clk-816x.c
> index 3b8e483aec928..fe6f66fc5a05d 100644
> --- a/drivers/clk/ti/clk-816x.c
> +++ b/drivers/clk/ti/clk-816x.c
> @@ -57,6 +57,7 @@ static struct ti_dt_clk dm816x_clks[] =3D {
>  	DT_CLK(NULL, "timer_sys_ck", "sys_clkin_ck"),
>  	DT_CLK(NULL, "timer_32k_ck", "sysclk18_ck"),
>  	DT_CLK(NULL, "timer_ext_ck", "tclkin_ck"),
> +	DT_CLK(NULL, "sys_ck", "sys_clkin_ck"),

[Severity: Medium]
Does adding the sys_ck alias in dm816x_clks[] cause omap_voltage_late_init()
to run OMAP34xx/36xx voltage controller and voltage processor initialization
on DM816x where that hardware and PMIC data are absent?

On DM816x boot, ti816x_init_early() (as well as ti814x_init_early() on TI81=
4x)
calls omap3xxx_voltagedomains_init() in
arch/arm/mach-omap2/voltagedomains3xxx_data.c:

	if (soc_is_am35xx())
		voltdms =3D voltagedomains_am35xx;
	else
		voltdms =3D voltagedomains_omap3;

Because only soc_is_am35xx() is checked, TI81xx falls back to
voltagedomains_omap3, which registers omap3_voltdm_mpu and omap3_voltdm_core
with .scalable =3D true, .vc, and .vp populated.

Later, omap2_common_pm_late_init() calls omap3_twl_init(), which returns
-ENODEV because cpu_is_omap34xx() is false on DM816x, leaving voltdm->pmic =
as
NULL. It then calls omap_voltage_late_init() in
arch/arm/mach-omap2/voltage.c:

	list_for_each_entry(voltdm, &voltdm_list, node) {
		struct clk *sys_ck;

		if (!voltdm->scalable)
			continue;

		sys_ck =3D clk_get(NULL, voltdm->sys_clk.name);
		if (IS_ERR(sys_ck)) {
			pr_warn("%s: Could not get sys clk.\n", __func__);
			return -EINVAL;
		}
		voltdm->sys_clk.rate =3D clk_get_rate(sys_ck);
		WARN_ON(!voltdm->sys_clk.rate);
		clk_put(sys_ck);

		if (voltdm->vc) {
			voltdm->scale =3D omap_vc_bypass_scale;
			omap_vc_init_channel(voltdm);
		}

		if (voltdm->vp) {
			voltdm->scale =3D omap_vp_forceupdate_scale;
			omap_vp_init(voltdm);
		}
	}

When clk_get(NULL, "sys_ck") succeeds, omap_voltage_late_init() proceeds to
call omap_vc_init_channel() in arch/arm/mach-omap2/vc.c and omap_vp_init() =
in
arch/arm/mach-omap2/vp.c for both mpu_iva and core:

	if (!voltdm->pmic || !voltdm->pmic->uv_to_vsel) {
		pr_err("%s: No PMIC info for vdd_%s\n", __func__, voltdm->name);
		return;
	}

This trades the single pr_warn() in omap_voltage_late_init() for four pr_er=
r()
messages on boot and leaves voltdm->scale set to omap_vp_forceupdate_scale =
on
uninitialized VP instances.

Should TI81xx instead use non-scalable voltage domains in
omap3xxx_voltagedomains_init(), similar to how commit ddf536d0d7e1 ("ARM:
OMAP: AM3517/3505: fix crash on boot due to incorrect voltagedomain data")
handled AM35xx with voltagedomains_am35xx?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-patch-ekto=
r5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org?part=3D4
