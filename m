Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69914DF4D0
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450718; cv=none; b=HxRVYE4rQIEBLEIUiQf+VOsQGFc4l6qjA2qUPCR6zXB66ycW86DyuwucoArijua66sgm+aK68JBsZTeYUf3NvtTiIoTnlJcg2TFgNgp2pDTQtJKI5Y7BHsN+WKMZ6sU+tRvmTSiKtrymYdvVLIRREONpnsMEvBSDrwowK+lDBEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450718; c=relaxed/simple;
	bh=L+cXZycWoCrjgpdTkYmGwpI9LVlJwHX8aBjPv9+ft1s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ms/tAEtVrH8vRXIWoJBJXn8mtdQy2ski03QlONyCcne34FO4ss9fzb+P2iLpzbRusHafHrFxFAEIESc3hT+qvgHyyf60nErjSVZSLgAE2McRjzWdGZ+Wt254CYRk/BlNbqoaDsBotWH48HoKqmInX05TYHciLzUh+TNSmCNhkEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcyDcNwM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcyDcNwM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AD21F000E9;
	Thu,  3 Sep 2026 15:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788450716;
	bh=QNwWKrf6/eLKslPvo3opu6P/FHG4C0LR/M15jNOIISc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YcyDcNwMQF3+LyLXynMoRD02jMsNcgHrrb2grRYiDX3tQ/LamrS2AVgg9S+37wbW0
	 mnJVjjEw6bb20JQzVSG3dEPJddWdapYbuQo+V94S+60IFg0Z5HupJQF4CTn93O6QVe
	 kdU7/RyequxPJZtqNp9EECqFyyEZnXkeq8oacE3tz+UUdYuCYxqn4R8wOyCf3Bcun0
	 fky6WPM7qk8TQVynTYloF0S5xY4DUFZxoZbRXP8zkLROu4BRCR9+xIpjN3cfB874eC
	 5SgcpDlTCWL47Fdf0rymXwBA2mqhI8helzeCPRDnbKYID3JcYF4RptgJqaEd63j259
	 MxuAe9lH71dzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/4] clk: scmi: reject SSC configuration out of the
 OEM field range
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260903153836.373267-3-dario.binacchi@amarulasolutions.com>
References: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
 <20260903153836.373267-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:51:56 +0000
Message-Id: <20260903155156.92AD21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional rejection of `spread_pm =3D=3D 0` breaks the ability=
 to disable Spread Spectrum Clocking (SSC).
--

commit bf8cfe80822f02414072ae479a6270e985c74e54
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

clk: scmi: reject SSC configuration out of the OEM field range

This commit adds validation to reject spread spectrum configurations that
exceed the 8-bit OEM field range or the 16-bit modulation frequency field.
It aims to prevent silent truncation and incorrect programming of the
firmware.

> diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
> index c1ebbdc6bbc5f..4dac608edd4ce 100644
> --- a/drivers/clk/clk-scmi-oem.c
> +++ b/drivers/clk/clk-scmi-oem.c
> @@ -35,6 +35,7 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
>  				 const struct clk_spread_spectrum *ss_conf)
>  {
>  	struct scmi_clk *clk =3D to_scmi_clk(hw);
> +	u32 spread_pm =3D ss_conf->spread_bp / 10;
>  	int ret;
>  	u32 val;
> =20
> @@ -44,7 +45,19 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
>  	 * extConfigValue[24]    - Enable/Disable
>  	 * extConfigValue[31:25] - Reserved
>  	 */
> -	val =3D FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_b=
p / 10);
> +	if (!spread_pm || spread_pm > FIELD_MAX(SCMI_CLOCK_IMX_SS_PERCENTAGE_MA=
SK)) {
> +		dev_warn(clk->dev, "%s: spread (%u permyriad) out of range\n",
> +			 clk_hw_get_name(hw), ss_conf->spread_bp);
> +		return -EINVAL;
> +	}

[Severity: High]
Does this unconditional rejection of spread_pm =3D=3D 0 break the ability to
disable Spread Spectrum Clocking (SSC)?

When a caller (or device tree via assigned-clock-sscs) requests to disable
SSC, it generally sets method =3D CLK_SPREAD_NO and spread_bp =3D 0. Because
spread_pm is calculated as ss_conf->spread_bp / 10, a 0 spread results in
spread_pm =3D=3D 0, triggering this -EINVAL return.

Since the driver contains logic to handle method =3D=3D CLK_SPREAD_NO by om=
itting
the SCMI_CLOCK_IMX_SS_ENABLE_MASK bit, it appears designed to support disab=
ling
SSC. This new check prevents that valid path from executing and could abort
device probing if triggered during initialization.

Should the !spread_pm check be restricted to cases where
ss_conf->method !=3D CLK_SPREAD_NO?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903153836.3732=
67-1-dario.binacchi@amarulasolutions.com?part=3D2
