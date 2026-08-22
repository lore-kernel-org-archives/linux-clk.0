Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29405217723
	for <linux-clk@vger.kernel.org>; Sat, 22 Aug 2026 02:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787366298; cv=none; b=vA8NAx+YU8b/BFaZk/sXNO4t3bviNmJFdQH9M/0bqJbzChBXxk9ArcsbxrXz5/MRMzX6rMes9Cam08S/tt6egykFPohafM/4IgD+mtpVnWVA2PrpAEvuJvUvQ4tY7REPmc7x+G4kWpktvjahE4klotU+FpoKjJ5j1tIczPM0gw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787366298; c=relaxed/simple;
	bh=mLICaOx1k5VMMmVk4ww+kSihKSqBJRn3qzQf1h6Kz/g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WVVZpaz6LFFxlRyqcOmM/hfyK1cTk05e0E2VTHruS8ruhP56DVyhqkdEXNipNogoE3A7alSme+u38XtmdMI//+aIM6EO/5fAYs4kKkGY9Q0EcMq4361Y6Z2JmzAS+YQZ/R7CHv/rKzGMLF7C7m9DGfXP5RkbQk4//xYgX1zHsHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2uQd784; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2uQd784"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80571F000E9;
	Sat, 22 Aug 2026 02:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787366297;
	bh=WLhvQjq+p+7Bt79U46GNZVbR4UuPiHWUyFTfGwlKMQI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J2uQd784xgfOAxba7dhCivwb63MAUzqG5Jw/k5mgACoexKREavn++CxEbNHZ5ilgt
	 hHsoeyNo1oQpSGwcpmU5RaExfFmzoh8PPFXbu+aYYbpzgZMCTj8IS9CFjH5RbPS5JO
	 cd6ndu3WS7hMBgjeGM52VXgX1cmFwR7DGHmVuKvh33UK8beWcb7ot7oS1No2XSb551
	 mnQZ9OkFMMxiE+R87LKNbr3dorlL71xfN4BZJMG1kxizhqJqdk8Sj2jdpJHHtkM7B0
	 0nq6NJoYXWt8MLlxT3Lp7UL/7iriSbmK0x7g8KMNEWciLzHaRSHichk9afKy64ys+Y
	 Rx6FfQIFW8YeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: qcom: camcc-sdm845/670: Raise CSIPHY timer clock
 limit
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: linux-clk@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260822-csiphy-sdm845-limits-v1-1-d360bf7cd38f@ixit.cz>
References: <20260822-csiphy-sdm845-limits-v1-1-d360bf7cd38f@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 02:38:16 +0000
Message-Id: <20260822023816.C80571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The newly added 288 MHz CSIPHY timer clock entry erroneously uses =
a fixed 808 MHz shared PLL with a divider of 2, configuring the hardware fo=
r 404 MHz while falsely tracking it as 288 MHz, or otherwise forcing an inv=
alid shared PLL rate.
- [High] Adding a dummy 400 MHz entry to the camss clock_rate tables bypass=
es the link frequency safety margin validation, allowing unsupported freque=
ncies to be silently clamped.
--

--- Patch [1]: [PATCH] clk: qcom: camcc-sdm845/670: Raise CSIPHY timer cloc=
k limit ---
commit 376f8b331f3abeb701471cc1ebbcaaf5bbe8d122
Author: David Heidelberg <david@ixit.cz>

clk: qcom: camcc-sdm845/670: Raise CSIPHY timer clock limit

This commit adds a 288 MHz entry to the shared camcc CSIPHY timer frequency
table and adds a 400 MHz entry to the sdm845 and sdm670 CSIPHY timer
clock_rate tables. This aims to allow the Samsung S5K2X7SP camera to run at=
 a
1.15 GHz link frequency.

> diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm=
845.c
> index 534dc56fc13ca..77bb783b4ef0a 100644
> --- a/drivers/clk/qcom/camcc-sdm845.c
> +++ b/drivers/clk/qcom/camcc-sdm845.c
> @@ -255,6 +255,7 @@ static const struct freq_tbl ftbl_cam_cc_csi0phytimer=
_clk_src[] =3D {
>  	F(19200000, P_BI_TCXO, 1, 0, 0),
>  	F(240000000, P_CAM_CC_PLL2_OUT_EVEN, 2, 0, 0),
>  	F(269333333, P_CAM_CC_PLL1_OUT_EVEN, 3, 0, 0),
> +	F(288000000, P_CAM_CC_PLL1_OUT_EVEN, 2, 0, 0),

[Severity: High]
Does this configuration force an invalid rate on the shared PLL1, or
mathematically result in an incorrect output frequency?

When requesting 288 MHz in ftbl_cam_cc_csi0phytimer_clk_src, this table uses
P_CAM_CC_PLL1_OUT_EVEN with a divider of 2. If the parent PLL1 is statically
probed at 808 MHz, a divider of 2 produces 404 MHz instead of 288 MHz, which
could break CSI protocol timing.

Alternatively, since the clock rate request propagates to the parent PLL, d=
oes
this cause the framework to request 576 MHz (288 MHz * 2) from PLL1?

Reconfiguring a shared PLL would disrupt other consumers like BPS, IFE, and
IPE that rely on the original parent rate.

>  	{ }
>  };
> =20
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7..e1bf828cf7af2 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1075,7 +1075,7 @@ static const struct camss_subdev_resources csiphy_r=
es_670[] =3D {
>  		.clock_rate =3D { { 0 },
>  				{ 0 },
>  				{ 0 },
> -				{ 19200000, 240000000, 269333333 } },
> +				{ 19200000, 240000000, 269333333, 400000000 } },

[Severity: High]
Could the addition of this 400 MHz entry bypass the link frequency safety
margin validation in the camss driver?

By adding a dummy 400 MHz entry here in csiphy_res_670 (and similarly in
csiphy_res_845) when the clock controller only provides up to 288 MHz, it
appears any sensor configuration requiring between 288 MHz and 380 MHz will
erroneously pass the margin check.

When the hardware then requests 400 MHz, will clk_round_rate() silently
clamp it down to 288 MHz?

This might cause new sensor configurations requiring a frequency in this gap
to fail at runtime with obscure hardware pipeline failures instead of being
cleanly rejected.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822-csiphy-sdm=
845-limits-v1-1-d360bf7cd38f@ixit.cz?part=3D1
