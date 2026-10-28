Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184259;
	b=s6XViTNP7QGZ9Zg7Nofp0luu/WO8XTlNvIkAQp2FXlkSCNYfRO8+30eKazFMMsGsHUZV
	 THtG0ZWy8b0kixa/Us90BQPTUUrKpri+P00UdseyzB7EFsXLOCXV7qaNyWKCG9A88iK74
	 0A1p7nQ7NDjeFayzDULuRLtkzG5uAhZc/odd/8EgzNJeKNIBY2JqHaqqc8qS2PcvvlyLl
	 mieJF6F9aiQNHNNruS3PtwyTb5/Xksu0UAhfnCTP0+jfxWDLnne8dWXHagvd7fjrl+jnc
	 Urh7Oto2/XdYCwefsVLYmSz/3B6cxW36b4s0X1rMB48OSOdCoWpW0LHolWeTVRX3LSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184259;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=M67wrz53SfHkqS8Y1pIIgTT3MsqlSimzGQVprBn+9IU=;
	b=FHVArsy98b4D30dws/h0d+ogdF191MMqYSh54xiBiBBJWCbZu9XlswH1qwxjvQ/+BCRB
	 Y+sp5Z9dPDX+K0gZQtGuxdOb9HLz9la1unFDhxWuyB38yMdhAHX+amdNWQyvBjNqcec4P
	 M0AHZSKSzjURRcKFAiHwvIcFSxX8jYqnk0YQ/9vS0ItepCcphANNXgM7azdUf5I5eGx69
	 1K0hTk8R2LSf3lhYGFO3OS2CkKJj7UVqqvGdmJl7SvVhxq50iqAkGYDkE+/K93zlNJut5
	 U73IbOdP+UnT8nj+ZpH2wrXVD5dFgsULzNDacn+Z643KHLHi0Jqdak68PIJe1EKnbdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TKKxaIHI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E68606A31A
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TKKxaIHI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2541F01825;
	Wed, 28 Oct 2026 10:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793184259;
	bh=M67wrz53SfHkqS8Y1pIIgTT3MsqlSimzGQVprBn+9IU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TKKxaIHIGxj5DLo3jlKPVENhTk6BglFGhOsJMMWBlgidCcECLw/Y/+F+6NFF639qh
	 7rg5y509fQkDwrybhtElssHwApjXVtDESwoJVEUAJipJPX03ZWT8u+hLX2wmmVgXH9
	 eN/YhXSl8tOV56OwVQC4yAo4wlLTaI/ALh/pxRN9iDH/Cvs6f10c7xJI9X0PVFQzVS
	 oXVigs4paRkdKeCcuIBVB5f0bzPurJ5ScF1jOnrLPtYP3X2B7hBOdN/txEdHqUpye8
	 i3YuC5Fd8+OABMCyLUKdflpDzntiaZjvIqXpu0SKGtHWyg1urwqePUvZMmOZ0la7xY
	 k4WUpPnpkd8CQ==
Message-ID: <sashiko-outbox-187761@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/3] clk: qcom: common: Restore the clock controller
 after hibernation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261028-b4-clk-restore-after-hibernation-v1-2-86cf62747a7f@oss.qualcomm.com>
References: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
 <20261028-b4-clk-restore-after-hibernation-v1-2-86cf62747a7f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 10:44:18 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: qcom: common: dangling stack pointer in cc->desc after probe
- [High] clk: qcom: common: qcom_cc_restore() corrupts clk_rcg2_shared_ops =
state
--

commit a92f46011ef8a0320b3784fea1ac76fde1a0f05f
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: common: Restore the clock controller after hibernation

This commit adds a hibernation restore callback to qcom_cc_pm_ops that
redoes probe-time PLL and register configuration and calls
clk_restore_context_dev() to restore cached clock state after hibernation.

> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 08fd62ac780d3..ff243fc781887 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c

[ ... ]

> @@ -333,9 +340,13 @@ int qcom_cc_really_probe(struct device *dev,
>  	size_t num_clk_hws =3D desc->num_clk_hws;
>  	struct clk_hw **clk_hws =3D desc->clk_hws;
> =20
> -	cc =3D devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
> +	cc =3D devres_alloc(qcom_cc_release, sizeof(*cc), GFP_KERNEL);
>  	if (!cc)
>  		return -ENOMEM;
> +	devres_add(dev, cc);
> +
> +	cc->desc =3D desc;
> +	cc->regmap =3D regmap;

[Severity: High]
Can storing the desc pointer in cc->desc leave a dangling stack pointer aft=
er
probe returns?

Several Qualcomm clock controller drivers allocate a local struct qcom_cc_d=
esc
on the stack in their probe functions to customize fields per SoC variant a=
nd
pass &desc to qcom_cc_really_probe():

drivers/clk/qcom/camcc-sa8775p.c:cam_cc_sa8775p_probe() {
	struct qcom_cc_desc desc =3D cam_cc_sa8775p_desc;
	...
		desc.driver_data =3D &cam_cc_qcs8300_driver_data;
	}

	ret =3D qcom_cc_really_probe(&pdev->dev, &desc, regmap);
}

drivers/clk/qcom/videocc-sm8350.c:video_cc_sm8350_probe() {
	struct qcom_cc_desc desc =3D video_cc_sm8350_desc;
	...
		desc.driver_data =3D &video_cc_sc8280xp_driver_data;
	...
	ret =3D qcom_cc_really_probe(&pdev->dev, &desc, regmap);
}

drivers/clk/qcom/gcc-ipq5018.c:gcc_ipq5018_probe() {
	struct qcom_cc_desc ipq5018_desc =3D gcc_ipq5018_desc;
	...
	return qcom_cc_really_probe(&pdev->dev, &ipq5018_desc, regmap);
}

When qcom_cc_restore() later dereferences cc->desc (checking desc->use_rpm =
and
desc->driver_data), the probe stack frame has already been reclaimed. Would=
 it
be safer to store desc->use_rpm and desc->driver_data directly in struct
qcom_cc instead of retaining the desc pointer?

> =20
>  	ret =3D devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
>  	if (ret < 0 && ret !=3D -EEXIST)
> @@ -434,6 +445,45 @@ int qcom_cc_really_probe(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
> =20
> +/* Redo the probe time setup and the cached clock state after a power cy=
cle */
> +static int qcom_cc_restore(struct device *dev)
> +{
> +	struct qcom_cc *cc =3D devres_find(dev, qcom_cc_release, NULL, NULL);
> +	const struct qcom_cc_desc *desc;
> +	int ret =3D 0;
> +
> +	if (!cc)
> +		return 0;
> +
> +	desc =3D cc->desc;
> +
> +	if (desc->use_rpm) {
> +		ret =3D pm_runtime_resume_and_get(dev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (desc->driver_data) {
> +		ret =3D qcom_cc_clk_pll_configure(desc->driver_data, cc->regmap);
> +		if (ret)
> +			goto put_rpm;
> +
> +		qcom_cc_clk_regs_configure(dev, desc->driver_data, cc->regmap);
> +	}
> +
> +	clk_restore_context_dev(dev);

[Severity: High]
Does calling clk_restore_context_dev() here corrupt the hardware state of
clocks using clk_rcg2_shared_ops (as well as clk_rcg2_shared_floor_ops and
clk_rcg2_shared_no_init_park_ops)?

In clk_core_restore_state(), the clock framework restores a clock by calling
set_parent(), set_rate(), prepare(), and enable() in sequence:

drivers/clk/clk.c:clk_core_restore_state() {
	if (parent && core->num_parents > 1 && core->ops->set_parent) {
		index =3D clk_fetch_parent_index(core, parent);
		if (index >=3D 0)
			core->ops->set_parent(core->hw, index);
	}

	if (core->rate && core->ops->set_rate)
		core->ops->set_rate(core->hw, core->rate,
				    parent ? parent->rate : 0);

	if (core->prepare_count && core->ops->prepare)
		core->ops->prepare(core->hw);

	if (core->enable_count && core->ops->enable) {
		flags =3D clk_enable_lock();
		core->ops->enable(core->hw);
		clk_enable_unlock(flags);
	}
}

Because clk_rcg2_shared_ops does not implement .is_enabled,
clk_hw_is_enabled(hw) evaluates to (core->enable_count > 0).

When a shared RCG is enabled across hibernation (core->enable_count > 0),
clk_rcg2_shared_set_parent() and __clk_rcg2_shared_set_rate() see
clk_hw_is_enabled(hw) =3D=3D true and write the new configuration directly =
to
hardware CFG_REG without updating rcg->parked_cfg:

drivers/clk/qcom/clk-rcg2.c:__clk_rcg2_shared_set_rate() {
	...
	if (!clk_hw_is_enabled(hw))
		return __clk_rcg2_configure(rcg, f, &rcg->parked_cfg);

	return clk_rcg2_shared_force_enable_clear(hw, f);
}

Immediately afterwards, clk_core_restore_state() invokes core->ops->enable(=
),
which calls clk_rcg2_shared_enable():

drivers/clk/qcom/clk-rcg2.c:clk_rcg2_shared_enable() {
	...
	/* Write back the stored configuration corresponding to current rate */
	ret =3D regmap_write(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, rcg->parke=
d_cfg);
	if (ret)
		return ret;

	ret =3D update_config(rcg);
	...
}

Since runtime rate and parent changes while the clock was enabled never
updated rcg->parked_cfg, won't clk_rcg2_shared_enable() overwrite CFG_REG w=
ith
a stale rcg->parked_cfg and clobber the rate and parent just programmed by
set_parent() and set_rate()?

Conversely, when core->enable_count =3D=3D 0, clk_core_restore_state() does=
 not
call .init (clk_rcg2_shared_init()) or .disable, and set_parent()/set_rate()
only update rcg->parked_cfg in memory without writing to hardware registers,
leaving any RCG enabled by boot firmware unparked in hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-b4-clk-res=
tore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com?part=3D2
