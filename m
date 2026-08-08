Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD48D285CAA
	for <linux-clk@vger.kernel.org>; Sat,  8 Aug 2026 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786195859; cv=none; b=QSqJl1TpTqK3FFCvSUMFFu1l5V8Seuu6R5OcuU1DDKdyzUl560hyk+tVJW/buAktVFzxpiLynKXoPFwZiXq+A9o7VvwFXMubwepwvpPFfZ9Kw8jDrzflq3luc5WH+Z6N/oYAU2N55o1acA9wMIk2ukZYvAqlzCnZvB+BdG+T9JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786195859; c=relaxed/simple;
	bh=GcFnNVCqGghgN6FJ2JiRi+jSktMU9+DvANABx3igE7g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T/Q8i0vGlBkJUqN7N+uaDnJGtsUbovNJcaSDr3EMo5C08/AbUR+j1MiHw3gC5hSNau0fz+ddV/G3Efzff+XT/VuqSZgSMYMZ7iAX4NXuVeVFIEHWUN6fIkVokiap41aMJvP3xDB3YxF492DJp5CaOw/3cD6QP4vlh6pFrmGrfZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPRZKcz5; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPRZKcz5"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-cb221a59829so30882a12.1
        for <linux-clk@vger.kernel.org>; Sat, 08 Aug 2026 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786195857; x=1786800657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6zYCYgrPHJ1R0IyDM9ZJHQW95fmf52/M7XVvd8snhDU=;
        b=lPRZKcz5DZfPwizcnIy3fTvzqVQabECS5QZMahpWlyQmMtJYCNXXyYYOBSYPxV4FvQ
         KFoYgZHfU+rmu333i8cCD8RBbcNBZ8tu9JYBMLegSs0XQbumoPvMDL68OUS5v12+N5xU
         LJ0Sl6qmf8dBYy46wkjERihiDt6c/YwNHWoFsaCfnHM79wIAQJCr8r0pUnFJwcoqScRt
         AcXB8ecjM3QMjo2mW010L+AZRFF0gOwPa13SMo/9vrrJHnIBM6eShvX3/JmJ7ar4JFX5
         fqXXNcGyV0UF7F6UPX4wiK/q05dOHgEoj0dL6m4rCdcKwRzYv8F8Orv24jw2ZCFGTk2W
         X6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786195857; x=1786800657;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zYCYgrPHJ1R0IyDM9ZJHQW95fmf52/M7XVvd8snhDU=;
        b=d2VcW+EaepvQA4jWigXa0g3X5CfB2Gu5DA1G7Gw4wHQ+SGWd2Oc7vcqhAu0EnF3Kuj
         HC5yio3H4yQSwZo9GLXDCFoWKVIzMceXlS5coOg69vgs2xPLGo3o/r20+NEFNF4BBYRF
         FCmaB/vIcnxyamriazLzQzL9PMFSEsJilVftWlRPIHDowAf0TU9Yo/KdEZYcKvDfew1r
         Y42/bQM4CDkYZ7W0gdPIfsiJagJgtcb2KbAHhxs0kUgl5tpByTLSgKwr5FbtCnX/ljCv
         bfGg43BJdJDFZ7I4B2JQcs2X6/Eshyu1FULPCshJaOERcqxvn2R0dOq8Lgsc8XIxrbO9
         RdOw==
X-Forwarded-Encrypted: i=1; AHgh+Rpz8VCCXky6VP+xtzxDXLxpasnbqMmc/EN1j6nMz9d8UzEcdTBJ8dpCMqOG/xbJrqDHNReAI4mOkD8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0xamKrj/Wi5SRfA1v3iCUcZUp9iDxpb6YtMYB0LvUFDEtdtJN
	5P4o0xwaQCnG8dtyUlW/WN93T5KnHIOWID/qjYW2w8zsmFWQ5LoFRifi
X-Gm-Gg: AR+sD12Pps8bLgWUZb5iwYvK9NuAEBuDFpjNGuXPc3IM+xgvcI/Ih502u0Uatr067UG
	oqBOCk0frMpFFuyVwQ8bB9Ig/xLiHv5+PAsybEHSWPy9Xiy8zdiLCZeDqg4urDILA4ebJFgUZ8N
	tI5q2L4SWqPNdss+LdklHdoRM1f1jzZA/Nn+UgtSeZesLlOt/I7HBb4EMYcuZeD5/tAsCus77vK
	U6ATDuRNfE+pWQJjj8zW2L6GF3YUIyH3KtNXgFL+jOIsNH/jknHlz6Yp/RbY6RjyKmVzvsyFLFw
	Z7kxNbM2alNzMNoOjI/92JkN5IIzFWl2Yoa4i2tLh8o6AagZRZ1EjAEyJWFVQr2GXv/FaO9eXlD
	VUaRH/1/LByIBtEJuHAFIaK1n7g8MO6r6VrrkEZhXf3mwxs4UDot8SbjmqS0lY6aQgllObvIgMu
	sUICe5Kgvm/rT7LXV89YV7Arb/bi6KvydfE58k53Z0hdc3meL/RA==
X-Received: by 2002:a05:6a00:240c:b0:842:3838:cb03 with SMTP id d2e1a72fcca58-84f6b778b44mr5395163b3a.11.1786195856790;
        Sat, 08 Aug 2026 06:30:56 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51e9a9sm2125357b3a.37.2026.08.08.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 06:30:56 -0700 (PDT)
Date: Sat, 08 Aug 2026 21:30:52 +0800
Message-ID: <b66d3009f9cf310ca0f068999bd475ac.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 12/17] drm/spacemit: add Innosilicon DP/eDP
 controller bridge driver
In-Reply-To: <5537a40f12e80b89e330f37032016de6f3b9f4c7.camel@pengutronix.de>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-12-6de34d80e86c@gmail.com>
 <5537a40f12e80b89e330f37032016de6f3b9f4c7.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Philipp,

On Mon, 27 Jul 2026 09:49:58 +0200, Philipp Zabel wrote:
> On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
> > From: Cody Kang <codykang.hk@gmail.com>
> >
> > Add the DP/eDP controller that sits downstream of the Saturn DPU. Two
> > identical instances share one compatible; the eDP-vs-DP role is board
> > wiring, so it is taken from the devicetree: an eDP panel always sits
> > under an aux-bus child node, an external DP connector never does.
> >
> > The link is driven through the generic PHY framework, so the controller
> > never touches a PLL register. The controller's HPD interrupt is gated by
> > the DP pixel clock, which can be off exactly when a plug has to be
> > caught, so the connector is also polled and the interrupt path re-reads
> > the live level when it does fire.
> >
> > Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> > ---
> >  drivers/gpu/drm/spacemit/Kconfig            |   19 +
> >  drivers/gpu/drm/spacemit/Makefile           |    3 +
> >  drivers/gpu/drm/spacemit/spacemit_inno_dp.c | 2443 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_inno_dp.h |  328 ++++
> >  4 files changed, 2793 insertions(+)
> >
> [...]
> > diff --git a/drivers/gpu/drm/spacemit/spacemit_inno_dp.c b/drivers/gpu/drm/spacemit/spacemit_inno_dp.c
> > new file mode 100644
> > index 000000000000..e88731d9b18b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/spacemit/spacemit_inno_dp.c
> > @@ -0,0 +1,2443 @@
> [...]
> > +static int inno_dp_probe(struct platform_device *pdev)
> > +{
> [...]
> > +	dp->reset = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
>
> Since this is only asserted in probe and deasserted in remove, you
> could use devm_reset_control_get_optional_exclusive_deasserted() [1].

Thanks for the review. Will do in v2. The binding marks resets as
required, which means I shouldn't use _optional in the first place.
I will use the non-optional devm_reset_control_get_exclusive_deasserted().

> [1] https://docs.kernel.org/driver-api/reset.html#c.devm_reset_control_get_optional_exclusive_deasserted
>
> > +	if (IS_ERR(dp->reset)) {
> > +		ret = dev_err_probe(dev, PTR_ERR(dp->reset),
> > +				    "failed to get reset\n");
> > +		return ret;
> > +	}
> > +
> > +	dp->pxclk = devm_clk_get(dev, "pxclk");
> > +	if (IS_ERR(dp->pxclk)) {
> > +		ret = dev_err_probe(dev, PTR_ERR(dp->pxclk),
> > +				    "failed to get pxclk\n");
> > +		return ret;
> > +	}
> > +
> > +	if (dp->edp_mode) {
> > +		dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
> > +		/*
> > +		 * OP_DETECT is required: without it
> > +		 * drm_bridge_connector_detect() hard-codes CONNECTED for any
> > +		 * eDP connector and fbdev wedges at bind.
> > +		 */
> > +		dp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> > +				 DRM_BRIDGE_OP_HPD;
> > +	} else {
> > +		dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
> > +		/*
> > +		 * No OP_HPD: the HPD interrupt is gated by the DP pixel clock.
> > +		 * Leaving it out marks the connector POLL_CONNECT |
> > +		 * POLL_DISCONNECT instead.
> > +		 */
> > +		dp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> > +				 DRM_BRIDGE_OP_MODES;
> > +	}
> > +
> > +	if (dp->reset) {
>
> This check is not necessary, reset_control_deassert() handles NULL
> pointers.
>
> > +		ret = reset_control_deassert(dp->reset);
>
> If the _deasserted() variant is used above, this can be removed and the
> reset control doesn't need to be stored in dp.
>
> > +		if (ret) {
> > +			dev_err(dev, "failed to deassert reset: %d\n", ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> [...]
> > +	return 0;
> > +
> > +err_clk:
> > +	clk_disable_unprepare(dp->pxclk);
> > +err_reset:
> > +	if (dp->reset)
> > +		reset_control_assert(dp->reset);
>
> Same as above. Remove the unnecessary check or manual assertion
> entirely.

Agree, all of these will be fixed in v2.

Cody
