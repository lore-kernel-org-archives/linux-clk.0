Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9723BADAA;
	Sun,  6 Sep 2026 14:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704937; cv=none; b=s9NVLC88C3o7rJlM1j67DJIrBSCZNPGBgwar9Ub3p9pgnasDeLcDL//K7UttJgIJqAFijnEbfc76l59oK1FEedgkVAGTVsiKtsfIEhapXngm+RacEOxQU1er3aymAR2tb4NJRslxqGAh5fh7CfkcdzS/PtUphC0PkvRhptbi/i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704937; c=relaxed/simple;
	bh=D5b64OwYPO+3Mjfcxr9zUcKTr4BiNDNsLTRNxesbAN4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bRBvgnc/kvAiyFHFsDQWSanJYdjFuVghA3OJQtR3qLs+Xil+b+ghS0Ml9Sl36JomFewS3HSdVho4NTVKRpYiC+SyJpmRVUm3LbKCzOFBjl+MD+2P1csaArQjFcnk95ix88maUykD/uVpBBCVjFSv6J5ZlWX9Xocm+RwY54Vsf6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Av2oOkHD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Av2oOkHD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65671F00A3A;
	Sun,  6 Sep 2026 14:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788704936;
	bh=w/ZmBhLbd2wbuX5jnD+b2+29r0xl5zGiTs7r+EGjcVs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Av2oOkHD0y7WI3GuA9nfTGwMJ/ZFwFqVdCLe8fSU81xS2nN1HGulpySA8nH9McoaZ
	 J0IIF1BEP84c95SeXSe7wg3WxXmQJrbeepXkdWyQWnImcSsRaHE40COv/Mx7zGx8A6
	 mAUd23FMlp1QZuiHp/tXoHoP0aRNrs/CC9JW9VpS4BquAqmYyQVGncbrduu+MzciR+
	 gwLpzlkWffJS4VnTsGJA341b1+C1rdHeF0uhBvcrdqFqpRo2O9iKrvJ3XAuGcT+k4V
	 JrAuQI7j7FU7JymAzK40+lXOYnJQK1Z7ChurSQn0cRUtF8EzBw4zSv01tvLR54taol
	 n7bQarMmjcrBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 5/5] media: qcom: camss: Use data-lanes starting at
 1 for new CSIPHY mode
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: linux-clk@vger.kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 14:28:55 +0000
Message-Id: <20260906142855.A65671F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect bounds check for physical lane index against the active =
lane count breaks sparse lane configurations.
- [Medium] Missing `phy_exit()` calls for successfully initialized PHYs on =
error paths.
--

commit 9ffe4c10c666d01e0522334082dfc8cfc1e9b25b
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

media: qcom: camss: Use data-lanes starting at 1 for new CSIPHY mode

This patch updates the camss driver to support indexing data-lanes starting=
 at
1 for the new CSIPHY mode. It introduces a flag to differentiate between the
legacy 0-based indexing and the new 1-based indexing, normalizing the inputs
for the CSID decoder.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 84097d82d99c9..07b3cddca5840 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device=
 *dev,
>  		return -ENOMEM;
> =20
>  	for (i =3D 0; i < lncfg->num_data; i++) {
> -		lncfg->data[i].pos =3D mipi_csi2->data_lanes[i];
> +		u8 lane =3D mipi_csi2->data_lanes[i];
> +
> +		if (lane < lane_base || lane - lane_base >=3D lncfg->num_data) {
[Severity: High]
Does this bounds check erroneously reject valid sparse data-lane
configurations?

If a device tree specifies non-contiguous lanes, the physical lane index
can be greater than or equal to the total count of active lanes. For exampl=
e,
if data-lanes =3D <0 2>, num_data is 2, but the lane index is 2, which trig=
gers
the 2 >=3D 2 condition.

Will this unconditionally return -EINVAL and break the device probe for val=
id
sparse configurations?

> +			dev_err(dev, "invalid data-lane %u\n", lane);
> +			return -EINVAL;
> +		}
> +
> +		lncfg->data[i].pos =3D mipi_csi2->data_lanes[i] - lane_base;
>  		lncfg->data[i].pol =3D mipi_csi2->lane_polarities[i + 1];
>  	}

[ ... ]

Can initialized PHY clocks and regulators leak on error paths?

Looking at camss_init_subdevices():

drivers/media/platform/qcom/camss/camss.c:camss_init_subdevices() {
    ...
	for (i =3D 0; i < camss->res->csiphy_num; i++) {
        ...
		if (ret < 0) {
			dev_err(camss->dev, "csiphy %d init fail\n",
				res->csiphy_res[i].csiphy.id);
			return ret;
		}
	}
    ...
}

[Severity: Medium]
If msm_csiphy_subdev_init() fails for a CSIPHY instance after the first, do=
es
this error path return immediately without calling phy_exit() to clean up t=
he
clocks and regulators for PHYs that were successfully initialized (from ind=
ex
0 to i-1)?

This also appears to happen during registration fallback:

drivers/media/platform/qcom/camss/camss.c:camss_register_entities() {
    ...
err_reg_csiphy:
	for (i--; i >=3D 0; i--) {
		if (csiphy_enabled(camss, &camss->csiphy[i]))
			msm_csiphy_unregister_entity(&camss->csiphy[i]);
	}
    ...
}

[Severity: Medium]
When CSIPHY registration fails, this rollback loop only cleans up the PHYs
that were successfully registered to V4L2.=20

Because all PHYs were previously initialized by camss_init_subdevices(), do
the PHYs from the failing index onwards leak their clocks and regulators si=
nce
their phy_exit() is never called?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org?part=3D5
