Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC61A41D20D
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278218; cv=none; b=OfUR1AZdfKx3R4NrhuHTLNp925qTpXCDdYGTTBqgQKodkqiy0YGeH/WUH19bs7eZnyB+lvowPDwUVW/LLWbYfPX/XVdOx4lsPVvqOmcrnt2rZlVizcp2M+THdZ9G3vQbzJeCwyblukkjWOChLZcUzOYK7dlypThH2zMaKqOrdWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278218; c=relaxed/simple;
	bh=43wR8fGrwWjLGrW0W8zNyyVrIshWVwbGY8gkIKOCiH4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D2UurH0RczQ2DSxEmdqfPXHrEdpVE4hI0/6JqXYX5O0U96dwQNskptBERVpzQG1gJ89wprx/E0/FblJVWpdNhOO2yhpWa9jBTh7yRaCXt4QyiJIpCFZhOZFOtEB9uok20QoslDJQKI/5BVT+Z/Fmag/q5USbX7wmrS0pW2ueTWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTrL7gse; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTrL7gse"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5981F00A3A;
	Tue,  1 Sep 2026 15:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788278217;
	bh=d2iH+G3faiL6W/iYME6Y0zakNJHSWBIyNbYnCQ/nL68=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bTrL7gseHwU4d73fmnrl+t9iSDJXplWMUL2rdq+upHnN/m4S0czYCVRd00yBqyva+
	 diBT27i4LlLNQvtWzw15VcTudBjpDQNHtAg8BUS+XNtYA1ljh288OPLxp7phdEDLiP
	 xnDQLt0md3IWRHu7HJg8iq2teVf2R6Chlxv27WIC5czoTjQtQ0iK/DoCq2Go8WZPhj
	 ovFOV7sOfPwnpgK3vyx6UoDUcswsgapip/pxxwqx4hBJMlwgQLS0E3mYXTR0kzoP1J
	 VaNLLXCRS00f9tRACcVwVZbkzK7rDraw/tVpxicYnFXq9nvwk7n7TAQPfrRwO1YP7e
	 lGsqP2ycnNz8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/2] clk: validate spread spectrum configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260901090912.585681-2-dario.binacchi@amarulasolutions.com>
References: <20260901090912.585681-1-dario.binacchi@amarulasolutions.com>
 <20260901090912.585681-2-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 15:56:56 +0000
Message-Id: <20260901155657.6A5981F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Integer division truncates valid spread spectrum configurations to=
 zero, silently disabling the feature.
--

commit f9da34cc1be223c5bb63d6e1c7898cf344a88cfe
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>
clk: validate spread spectrum configuration

This commit adds validation to the clk_hw_set_spread_spectrum function to
ensure that the modulation frequency is non-zero and the spread ratio does
not exceed 10000 basis points (100%). This prevents invalid device tree
configurations from passing incorrect values to clock providers.

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2851,6 +2851,20 @@ int clk_hw_set_spread_spectrum(struct clk_hw *hw, =
const struct clk_spread_spectr
>  	if (!hw)
>  		return 0;
> =20
> +	switch (ss_conf->method) {
> +	case CLK_SPREAD_NO:
> +		break;
> +	case CLK_SPREAD_CENTER:
> +	case CLK_SPREAD_UP:
> +	case CLK_SPREAD_DOWN:
> +		if (!ss_conf->modfreq_hz || !ss_conf->spread_bp ||
> +		    ss_conf->spread_bp > 10000)

[Severity: High]
This isn't a bug introduced by this patch, but looking at
scmi_clk_imx_set_spread_spectrum() in drivers/clk/clk-scmi-oem.c:

scmi_clk_imx_set_spread_spectrum() {
    ...
    val =3D FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_b=
p / 10000);
    ...
}

Does this integer division incorrectly assume spread_bp is a direct percent=
age
multiplier rather than basis points? For standard device tree configuration=
s,
it seems this would truncate valid permyriad percentages (e.g., 100 for 1%)
to 0. Would this result in the hardware being programmed with a 0% spread
instead of the configured value, effectively disabling the feature silently?

> +			return -EINVAL;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
>  	core =3D hw->core;
> =20
>  	clk_prepare_lock();

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901090912.5856=
81-1-dario.binacchi@amarulasolutions.com?part=3D1
