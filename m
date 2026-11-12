Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794477675;
	b=iUwFLO6a4/gfv9tRT3s6LOdVL0Jc1gSmtzQun8gg0UfiY7arQ3ZmN/4CPTpXtrZ8obHC
	 VpQbEyzay/mLyp6Sx8nIQ5YZDeS2a9V4ZTajJNjcbMi3xzPSc/WegY7rk+MDk9Wbq2Kc6
	 UJP7ZSH9F2Ycxv1UiRYvhu/HjLDFu4J3/ksGGtIGQjs9qUB/PGpllZoV8lkRLeNCdQplV
	 2eawQ/lSE69+cfP8CWKgwfsZJBDjy6H+s8F+YK2/2NH8MfPoQ2CofsGBW/GjbQXueivQ8
	 KzhUCv0dN5h8baZ6pTOI7nsfXHhHVWM8ztXJTDtEmxHDQ/W1SKCTGoO+tBl2LTVVsrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477675;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VMlOl837uqKQtppBwv9KRWnMoG9E9SFyzKVLYp9RwEM=;
	b=CC2imLSJgeks6HfkHO1QbiXkLiD1TNtGZnt8Lha0lkfVxNkE5xwm10OArLrrWHWb7796
	 hkVB8j/skC/PPaCU3eHFK/AAjMREIFnMD52TuYzWEkSiNz6ZeRwG+4oS4o4TJ67tbZlIe
	 Elw+G1jFEyApsyUIehy7sGC9cZNNzqPlMmEyj8jOx3Hdx66tMlzcImLyREr6CZQmltsUr
	 ChUI6DFzFleeVf3mRx0Lo5XRRVIyb8c0hFEnQY518qaQhMDAOYVB8+fjVRp2BsvFLpcG1
	 9wAYfdfcY/3s8M98187CYH/c3ySnpGdFtC8Z7HAUTWUxdsNDi5hJeMZcvPoAXi7HhAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TF4HbZR7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9ED606A321;
	Thu, 12 Nov 2026 10:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TF4HbZR7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024A81F00A05;
	Thu, 12 Nov 2026 10:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794477675;
	bh=VMlOl837uqKQtppBwv9KRWnMoG9E9SFyzKVLYp9RwEM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TF4HbZR70c5bl/jRfcrHBJmvmOIpk/iOqynSXjXUrMWpCk7GIjEkL0mKzxrE5aWTI
	 +JqzeFr0n57Gt3GD0IJy26nVtq6x19ie2UDx1q2ZtkOZFK1s3/VqHnDH2/ojfA1dqa
	 Hea5go25Car81wAks7UywHFwl1oqCmXRGTaphGj7WSQocqZjGi6UC13jlBOzY5vyaM
	 ODRhB4/6uUrFRweFFuOrN2FEL7l6qHGkr5lU7UIxdE5J41TblAd+6g92sVVs8qEiDm
	 Eh1hSd/2MDtrmOuTDi/3/R9Z6Of9D5FJEvfqO0iC7VaHe9gk7fsMb2i/czWc3ZcBYB
	 NodMZOgMVew4w==
Message-ID: <sashiko-outbox-210917@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] clk: qcom: Add NSS clock controller driver for
 IPQ5210 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111-qcom_ipq5210_nsscc-v2-2-7e2c1dda3ed2@oss.qualcomm.com>
References: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
 <20261111-qcom_ipq5210_nsscc-v2-2-7e2c1dda3ed2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 10:01:14 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] clk: qcom: nsscc-ipq5210: CLK_SET_RATE_PARENT on XGMAC PTP
  dividers
--

commit ba0d35b1d755dedd51b7ae9f8752c3443ce8f41c
Author: Luo Jie <jie.luo@oss.qualcomm.com>

clk: qcom: Add NSS clock controller driver for IPQ5210 SoC

This commit adds the NSS clock controller driver for IPQ5210, providing
clocks, resets, and interconnect clock paths for the networking subsystem.

> diff --git a/drivers/clk/qcom/nsscc-ipq5210.c b/drivers/clk/qcom/nsscc-ip=
q5210.c
> new file mode 100644
> index 0000000000000..97673d01c9569
> --- /dev/null
> +++ b/drivers/clk/qcom/nsscc-ipq5210.c
> @@ -0,0 +1,2202 @@

[ ... ]

> +static const struct freq_tbl ftbl_nss_cc_ppe_clk_src[] =3D {
> +	F(24000000, P_XO, 1, 0, 0),
> +	F(429000000, P_CMN_PLL_NSS_CLK_429M, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 nss_cc_ppe_clk_src =3D {
> +	.cmd_rcgr =3D 0x3ec,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D nss_cc_parent_map_ppe,
> +	.freq_tbl =3D ftbl_nss_cc_ppe_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data){
> +		.name =3D "nss_cc_ppe_clk_src",
> +		.parent_data =3D nss_cc_ppe_parent_data_ppe,
> +		.num_parents =3D ARRAY_SIZE(nss_cc_ppe_parent_data_ppe),
> +		.ops =3D &clk_rcg2_ops,
> +	},
> +};
> +
> +/*
> + * The XGMAC PTP reference clock rate needs to be configurable, so the
> + * PTP reference dividers use the writable divider ops.
> + */
> +static struct clk_regmap_div nss_cc_xgmac0_ptp_ref_div_clk_src =3D {
> +	.reg =3D 0x3f4,
> +	.shift =3D 0,
> +	.width =3D 4,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "nss_cc_xgmac0_ptp_ref_div_clk_src",
> +		.parent_hws =3D (const struct clk_hw*[]){
> +			&nss_cc_ppe_clk_src.clkr.hw,
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.ops =3D &clk_regmap_div_ops,
> +	},
> +};
> +
> +static struct clk_regmap_div nss_cc_xgmac1_ptp_ref_div_clk_src =3D {
> +	.reg =3D 0x3f8,
> +	.shift =3D 0,
> +	.width =3D 4,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "nss_cc_xgmac1_ptp_ref_div_clk_src",
> +		.parent_hws =3D (const struct clk_hw*[]){
> +			&nss_cc_ppe_clk_src.clkr.hw,
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.ops =3D &clk_regmap_div_ops,
> +	},
> +};
> +
> +static struct clk_regmap_div nss_cc_xgmac2_ptp_ref_div_clk_src =3D {
> +	.reg =3D 0x3fc,
> +	.shift =3D 0,
> +	.width =3D 4,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "nss_cc_xgmac2_ptp_ref_div_clk_src",
> +		.parent_hws =3D (const struct clk_hw*[]){
> +			&nss_cc_ppe_clk_src.clkr.hw,
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.ops =3D &clk_regmap_div_ops,
> +	},
> +};

[Severity: Medium]
Should nss_cc_xgmac0_ptp_ref_div_clk_src,
nss_cc_xgmac1_ptp_ref_div_clk_src, and nss_cc_xgmac2_ptp_ref_div_clk_src
omit CLK_SET_RATE_PARENT now that they use writable clk_regmap_div_ops
(like nss_cc_uniphy_port1_rx_div4_clk_src)?

Because these 4-bit dividers can only divide the 429 MHz parent down to
429000000 / 16 =3D 26812500 Hz, requesting a PTP reference rate of 25 MHz or
24 MHz causes clk_divider_bestdiv() (with CLK_DIVIDER_ROUND_CLOSEST) to
select F(24000000, P_XO, 1, 0, 0) on nss_cc_ppe_clk_src.  That reparents
the shared nss_cc_ppe_clk_src root clock from 429 MHz to the 24 MHz XO,
throttling the PPE switch, EDMA, MACs, PON, and NSSNOC PPE.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-qcom_ipq52=
10_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com?part=3D2
