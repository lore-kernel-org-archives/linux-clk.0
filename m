Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CBB425888;
	Mon, 21 Sep 2026 16:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009436; cv=none; b=pNMrwOCpHUR9X/Cnpmw6OMYFhLAWAb2M2abmY7ffsNa1vaMZhlTEtsuJ4Fhs/p3xnNq96po2KG+NsF+QbV56mdVigH3aaFBTPq3If3F6X9B1Jwb4Z+Cx1Ljy2MHHU3gyjGxw6bdc8wNYZ/R8i/k5kv+PU3itd2A3nzTX7d23O4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009436; c=relaxed/simple;
	bh=tzEaQ78haQfPp9bau9Y5NopwAYQx6DU57qk2wbAgzA8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sxOIflp4jqGMzstlRcYT1Wjq5H1elHRHy/Z/NSJ26rQJJz8aJKN+ERk/wb+wmRClzkZK+j9HEbFldpVWZq+v0eN+mMcOTcFKejI0j2kolJ+gSuhex6zj8Ci+az4WPBDjSMeTqDXBlSCk+keQ/WeN9Gv35JtT2tcM1WjWiGVLDqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtuE+kyq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtuE+kyq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B1E1F000FF;
	Mon, 21 Sep 2026 16:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790009432;
	bh=evOcOug5HuQ7QipyqVv2PipPmrWdgiFen7VKh/pTWD8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dtuE+kyqiOpqLHGqXxrbVTuqarr3I0qBmoyMA+GNRHi3elfmPl0pgPFPKTv/r3Xnx
	 c6nPDRYld4u7T6yz1TnHVS9Bh+YltwNZlqpUs3+Wg5OoICCoAa9WI2a4mzSsD8Eqsv
	 JeT7DpqsbzB4X6w6NTii5PHZpd1OCKRv6ZWekjWCc58/rqqe1+7DfTiTV7CCsdLXqX
	 oecV0EPly9JG2ODsebVU7MRu/7gi6UWyQW6XaWYDgunxyZJrFZW3iwMYyPhDXbqhY2
	 izBDfalZ2qHZagqJI9LNvyjrT1GhCrGgy381uSR22QlvDKNoFOh9kQX97BhPSep0w5
	 +NoR5dVnT6JdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] clk: qcom: Add support for camera clock
 controller on Maili
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jagadeesh Kona" <jagadeesh.kona@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260921-maili_camcc-v3-2-2f8d739ac2d4@oss.qualcomm.com>
References: <20260921-maili_camcc-v3-0-2f8d739ac2d4@oss.qualcomm.com>
 <20260921-maili_camcc-v3-2-2f8d739ac2d4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 16:50:31 +0000
Message-Id: <20260921165032.11B1E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: qcom: missing frequency table update for cam_cc_cci_1_clk_s=
rc on Maili
--

commit 9204e9b27b38229aa09fff0dc17f81cd19db9fc2
Author: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

clk: qcom: Add support for camera clock controller on Maili

Maili camcc is mostly identical to Hawi camcc, with a few clocks
removed, frequency table updates for a few other clocks, and PLL
configuration changes. Hence, reuse the Hawi camera clock controller
driver and extend it for the Qualcomm Maili SoC.

> diff --git a/drivers/clk/qcom/camcc-hawi.c b/drivers/clk/qcom/camcc-hawi.c
> index aa52b99aec003..dc5c108ce608c 100644
> --- a/drivers/clk/qcom/camcc-hawi.c
> +++ b/drivers/clk/qcom/camcc-hawi.c

[ ... ]

> @@ -3106,12 +3105,35 @@ static const struct of_device_id cam_cc_hawi_matc=
h_table[] =3D {
> =20
>  static int cam_cc_hawi_probe(struct platform_device *pdev)
>  {
> +	if (device_is_compatible(&pdev->dev, "qcom,maili-camcc")) {
> +		cam_cc_pll0.config =3D &cam_cc_pll0_config_maili;
> +		cam_cc_pll1.config =3D &cam_cc_pll1_config_maili;
> +		cam_cc_pll2.config =3D &cam_cc_pll2_config_maili;
> +		cam_cc_pll3.config =3D &cam_cc_pll3_config_maili;
> +		cam_cc_pll4.config =3D &cam_cc_pll4_config_maili;
> +		cam_cc_pll5.config =3D &cam_cc_pll5_config_maili;
> +		cam_cc_pll6.config =3D &cam_cc_pll6_config_maili;
> +		cam_cc_pll7.config =3D &cam_cc_pll7_config_maili;
> +		cam_cc_pll8.config =3D &cam_cc_pll8_config_maili;
> +
> +		cam_cc_camnoc_rt_axi_clk_src.freq_tbl =3D ftbl_cam_cc_camnoc_rt_axi_cl=
k_src_maili;
> +		cam_cc_cci_0_clk_src.freq_tbl =3D ftbl_cam_cc_cci_0_clk_src_maili;
> +		cam_cc_ofe_clk_src.freq_tbl =3D ftbl_cam_cc_ofe_clk_src_maili;

[Severity: Medium]
Since cam_cc_cci_1_clk_src statically references ftbl_cam_cc_cci_0_clk_src,
should it also be updated to use the new Maili table here?

Without an update for cam_cc_cci_1_clk_src, it will continue using the old
Hawi frequency table (ftbl_cam_cc_cci_0_clk_src). This means cci_0 gets the
new P_CAM_CC_PLL0_OUT_EVEN with a /16 integer divider, while cci_1 remains
on P_CAM_CC_PLL0_OUT_ODD with a 3/32 fractional divider.

Could this mismatch and unintended configuration cause instability or failu=
re
for cameras attached to the second Camera Control Interface (CCI_1) on the
Maili SoC?

> +
> +		cam_cc_hawi_clocks[CAM_CC_CCI_2_CLK_SRC] =3D NULL;
> +		cam_cc_hawi_clocks[CAM_CC_CCI_2_CLK] =3D NULL;
> +		cam_cc_hawi_clocks[CAM_CC_CSI5PHYTIMER_CLK_SRC] =3D NULL;
> +		cam_cc_hawi_clocks[CAM_CC_CSI5PHYTIMER_CLK] =3D NULL;
> +		cam_cc_hawi_clocks[CAM_CC_CSIPHY5_CLK] =3D NULL;
> +	}
> +
>  	return qcom_cc_probe(pdev, &cam_cc_hawi_desc);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-maili_camc=
c-v3-0-2f8d739ac2d4@oss.qualcomm.com?part=3D2
