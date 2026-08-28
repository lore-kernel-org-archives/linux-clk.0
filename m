Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4BE46D544;
	Fri, 28 Aug 2026 14:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925698; cv=none; b=cPcikE0jlYrhTaq/hudCoNTqZmq/ndsGsEpgK9VUFGl2KdYRsVei/XOyiuEojvgfCNftmzH7jO6vKsTecjGh7boaixxdT+F46uoOxhUD4wXecsHv3Na02ziJqpetBUyrX2dDDZckSi5CBiNDgGELK2eIeCZFC37xaQjI4XpdX5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925698; c=relaxed/simple;
	bh=lWNsberH33bUrWdLxTIxxzbC0e9dWOp9reONsXLk4qY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F7fasdfRys+ULe2U7nafRhip9gxHFyaKa4y6Wsn+Et66n8Ejvhak7n2lurJKLBUv4Jh4D2Vewk+r4F2SL+MLfp0/jUyms/9V2SMQLxFAaGPMTSWTq1YDRnSuPzJm+HEQnDBF22cfUjRYDypBdbtQVJKQcS69plPb9O9caQ3u/P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsAOb+Fn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsAOb+Fn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977481F000E9;
	Fri, 28 Aug 2026 14:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787925694;
	bh=yQd6qsG83TrABDNJhnMxz4ZOai3+liNS/8tuJVDfUkk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GsAOb+Fn7op6wFEOlD3sNtVrsQ/rKtwUm10Xy3L7xcHO752Uar0bNGbAYgzqrYdRS
	 fh4t7hXWmD/2yoBDCCdg1FPxQoxcvmo6rarWs9Cy10SBmfa6tgnWWitprAMfHmcEjp
	 x+L45W/ykzQDpGTCqk5aGDJEEVtZjFvuS3sVwPANx2Drhgj7VyHNvXbeZrKUBdLKkX
	 1tlLho6167nfyzGwV8BMNfd7g2+Ga/ZXraw9BFRK2dAuPkuHCfHJgwHfAOMdI1MFhA
	 sX4Xj3EUyeNr+fQ213EcCHZD1GpIJlTID9Y7pOJScVLIGR9PZaUom/ZtmG1zGd8uiL
	 3UjEvZbYEVO4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/15] clk: starfive: jh7110-vout: Allow pixel clock
 rate propagation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: lee@kernel.org, linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, robh@kernel.org
In-Reply-To: <20260828-jh7110-clean-send-v2-9-331680c8b9d1@samsung.com>
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
 <CGME20260828134830eucas1p1188cde4642239a10afedf46b415dfde4@eucas1p1.samsung.com>
 <20260828-jh7110-clean-send-v2-9-331680c8b9d1@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 14:01:33 +0000
Message-Id: <20260828140133.977481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding CLK_SET_RATE_PARENT without CLK_SET_RATE_NO_REPARENT on har=
dware signal-routing muxes allows clk_set_rate() to dynamically hijack the =
active clock parent.
--

commit 09b0c9046fefb467ad795def912713bba900bd11
Author: Michal Wilczynski <m.wilczynski@samsung.com>

clk: starfive: jh7110-vout: Allow pixel clock rate propagation

This commit adds CLK_SET_RATE_PARENT to the dc8200_pix0 and dc8200_pix1
MUXes, allowing display controller rate requests to propagate to the
parent clock.

> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c b/drivers/cl=
k/starfive/clk-starfive-jh7110-vout.c
> index bad20d5d794a7..b608fe3580311 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> @@ -40,10 +40,10 @@ static const struct jh71x0_clk_data jh7110_voutclk_da=
ta[] =3D {
>  	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AXI, "dc8200_axi", 0, JH7110_VOUTCLK_=
VOUT_TOP_AXI),
>  	JH71X0_GATE(JH7110_VOUTCLK_DC8200_CORE, "dc8200_core", 0, JH7110_VOUTCL=
K_VOUT_TOP_AXI),
>  	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AHB, "dc8200_ahb", 0, JH7110_VOUTCLK_=
VOUT_TOP_AHB),
> -	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0", 0, 2,
> +	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0", CLK_SET_RATE_PAR=
ENT, 2,
>  		    JH7110_VOUTCLK_DC8200_PIX,
>  		    JH7110_VOUTCLK_HDMITX0_PIXELCLK),
> -	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1", 0, 2,
> +	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1", CLK_SET_RATE_PAR=
ENT, 2,
>  		    JH7110_VOUTCLK_DC8200_PIX,
>  		    JH7110_VOUTCLK_HDMITX0_PIXELCLK),

[Severity: High]
Does adding CLK_SET_RATE_PARENT without CLK_SET_RATE_NO_REPARENT on these
hardware signal-routing muxes allow CCF to unexpectedly reparent the active
clock parent?

When the display driver calls clk_set_rate() on the dc8200_pix0 or
dc8200_pix1 clock, __clk_mux_determine_rate() will evaluate all parents
because CLK_SET_RATE_NO_REPARENT is not set.

Because the HDMI PHY PLL is highly adjustable, it will likely offer a
mathematically closer rate than the generic DC8200_PIX divider. CCF will
then select the HDMI PHY as the best parent and dynamically reparent the
clock by calling clk_core_reparent().

Could this silently override the display driver's physical routing
configuration and sever the physical routing, breaking the display output?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-jh7110-cle=
an-send-v2-0-331680c8b9d1@samsung.com?part=3D9
