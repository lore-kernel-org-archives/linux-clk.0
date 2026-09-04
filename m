Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB104A2A70;
	Fri,  4 Sep 2026 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529420; cv=none; b=ujMMmx4zsSMXwqDsFfr1Fm271oHuh5H89r1v/LlMC0dytkzYO+ONyMq+3+yFwzZJ8FAg5GEP5NtxJg28YCGEUIUfVtl+Fy/C1EtzV+9XicqwwcSFABaTMUlzNLHcytglHQESRKbiOwgX3I987d8Op5PyTWx3iHri1rIuSukobsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529420; c=relaxed/simple;
	bh=1c+KjLMf/Swh0Uhjvshf2CeFq8gY+CxZNv2e7bPgQCM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P3AZ/P5gjZzluFyopgeaiReC1JoCi6VaknJK6tj8smbet4BSQzDmLUolYivtWFNPgA0VqxcTgJ05I61NGaX0TAhr44LhnfJdDvlJdX3iKlxwgN6dWV8MsBYX4YL3rpMQElC97bbRFlHvwoMg56V80HkO/KOHQ9+PR8htsZJmAkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSlKAbu3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSlKAbu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7109A1F00A3E;
	Fri,  4 Sep 2026 13:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529419;
	bh=xy9J5SyzSLbBaq2i0MqF7v9oLGW7UxvK0+0fcU9bazk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZSlKAbu3/+w2XtzlSVGDS1AZlAhLZ46LLab5B4vYpp749PrXLR+AMo/kew8EqpAVs
	 3xzs1cY1UYjYkqSBF6tU61Qtr9ipiOAv6hKLF3i6QN6eY8NCK2C3Y3IV6O/7vUNraY
	 tmnnMwlCEp3OvPyT9gowBhC2JhmnpE1xErIuoKIMQM0kBKcgfKNlsEaPRiq03NQPUX
	 s/4W5pmmy5OuYrtTB1kuJRxWSsi1sLMUDwt+VLymqfOdduHeb/5kFT+htRUkhNsRbW
	 aaO9QLJnW02xfb3tO8DFjz6h5ymTcyDrQPCyRvknGn/KRLXprmQV0KVM+7OahP41OR
	 w3kjnO2dPOX/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/19] drm/bridge: inno-hdmi: Allow the register map
 to come from a parent
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, lee@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org
In-Reply-To: <20260904-jh7110-clean-send-v3-8-484f9ae72715@samsung.com>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132723eucas1p14cdff81f7ccdc02ec811179c5d401d69@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-8-484f9ae72715@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 13:43:37 +0000
Message-Id: <20260904134338.7109A1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Early HPD interrupt can cause a NULL pointer dereference of `hdmi-=
>bridge.dev` if it fires before `drm_bridge_attach` completes.
--

commit 1a1229643b989df67626f64f580add186cebd6ed
Author: Michal Wilczynski <m.wilczynski@samsung.com>

drm/bridge: inno-hdmi: Allow the register map to come from a parent
   =20
On some SoCs the HDMI controller does not own its register window. The
StarFive JH7110 documents one 64 KB block, u0_hdmitx, that holds both
the controller and the PHY, so the parent device maps it and owns the
regmap while the two children share it.

> diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/=
inno-hdmi.c
> index aab474740f7f5..8bd7717611804 100644
> --- a/drivers/gpu/drm/bridge/inno-hdmi.c
> +++ b/drivers/gpu/drm/bridge/inno-hdmi.c
[ ... ]
> @@ -1095,9 +1110,19 @@ struct inno_hdmi *inno_hdmi_probe(struct platform_=
device *pdev,
>  	hdmi->dev =3D dev;
>  	hdmi->plat_data =3D plat_data;
> =20
> -	hdmi->regs =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(hdmi->regs))
> -		return ERR_CAST(hdmi->regs);
> +	/*
> +	 * On platforms where the controller shares a register space with
> +	 * other blocks, the parent owns the regmap. Fall back to mapping
> +	 * our own resource where it does not.
> +	 */
> +	if (dev->parent)
> +		hdmi->regmap =3D dev_get_regmap(dev->parent, NULL);
> +
> +	if (!hdmi->regmap) {
> +		hdmi->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(hdmi->regs))
> +			return ERR_CAST(hdmi->regs);
> +	}
> =20
>  	hdmi->pclk =3D devm_clk_get_enabled(hdmi->dev, "pclk");
>  	if (IS_ERR(hdmi->pclk)) {

[Severity: High]
This is a pre-existing issue, but could this code trigger a NULL pointer
dereference if the hotplug interrupt fires early?

Looking at the rest of inno_hdmi_probe(), the hardware interrupt is unmuted
in inno_hdmi_init_hw(), and then the handler is registered:

    inno_hdmi_init_hw(hdmi);
    ...
    ret =3D devm_request_threaded_irq(dev, irq, inno_hdmi_hardirq,
                                    inno_hdmi_irq, IRQF_SHARED,
                                    dev_name(dev), hdmi);

If a cable is already connected or plugged in at this exact moment, the
interrupt can fire immediately. The threaded handler inno_hdmi_irq() will
then execute:

    drm_helper_hpd_irq_event(hdmi->bridge.dev);

However, hdmi->bridge.dev appears to be NULL at this point, as it is only
populated later when the upstream display controller calls
drm_bridge_attach().

Is there something preventing this race condition, or should the IRQ handler
registration be deferred?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-jh7110-cle=
an-send-v3-0-484f9ae72715@samsung.com?part=3D8
