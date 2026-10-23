Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752905;
	b=WOM6xYgBoKBLFoRFnFyVVrJuIvBsnYzqktxOgMZLYbuhIaDj4Y7hepD/ye55ejtDUBt7
	 WdrtQV8TlWUhaValBr5LwAUp33A8+ZT+iiye2bg+fSsMBe+aAZeYNP+90zY9xRq08RsaG
	 cr5+5gruQqnSFPBZN0aiiXQdOgxP0Dl8/W8wswvH/aFNjI4cg/W4b+lmvpeMHpPfv1Xk9
	 R4fUAXYLXIgZYzxB0wwLwuf8LD/Sk1ykhJokPYNklYFfeSvC3SPTrJCd0fbAmiMRvZDGc
	 ZvjwquFzFOc2pR1wOD9SWq7Nf0/iRrUGAJNQTCwBg9U/VTbLxjk7mgwwD3mWZ2BJ59g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752905;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yLB7/J73OFY67YINZQLNWtUjjssmf4FJGVDOW316A+w=;
	b=hvBkq4HxIwKQbQC4YTmBKBdRMuM1TnSyZbrge7/bTAgk6ia3M2jL+WOIBvmaCrhWTL2f
	 J0CFjf4UQ2VMnyE7MxKog9M0+BZnpgrJdIXRaV35WEyU0vrK69PLZj91+SonYpUcyr7iW
	 KDtRVAbB5yEh870X8M1wmkXRZpKivCqq9KQS2AANCefy+AhQOjwiraBs2bJ5xO34BRaSv
	 xm7nJBmIrWRpJPLW5awyJg8UD90DKhzXSFmWEwZ5Tx2UCsJUqZdYXcNIbQQALUxnFJFVH
	 MLSLnnJc16WotVFzwBsTWyqSkm78VS2WjjtbVosjLpfs12EZDjioliPlMO+oor8siJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a0wlXwBD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804C5606A31D;
	Fri, 23 Oct 2026 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a0wlXwBD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8891F01825;
	Fri, 23 Oct 2026 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792752904;
	bh=yLB7/J73OFY67YINZQLNWtUjjssmf4FJGVDOW316A+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a0wlXwBDOPD6ZhJQr0nxYCEtgbf7Po/qTOSeSmAhc1EBL6pe5pTg5T0AiCAfs8Yrw
	 KkCp5dH0MnD3kzl9ydo1ZT8iFHm0pBeopwM3oJOq79r9we/zYcmDlyi/15WhU4uW9d
	 o6kp9+xyBwwP4fq8zz3cDzV4VodicfO8XQ8zjbNwakmIE9QYKPNM6JEUvqtsRPtFYj
	 H5MgQd3GigaLqfDwIr5amvzpufr8FtMeDdpB2+Dk7VqZu/3TwYezurptHqPw/ZAumI
	 Llx47dqUPvZOfLNZJM0SSiEFM3wJNB58P21MtJlyrTS6uwtEYNMW2/dc5evx8atWgE
	 rylfhT0yiVD6A==
Message-ID: <sashiko-outbox-182711@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: Add SM7250 display clock controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ishu Brar" <patches@brar.si>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023-dispcc-sm7250-v1-2-07bdefb99801@brar.si>
References: <20261023-dispcc-sm7250-v1-0-07bdefb99801@brar.si>
 <20261023-dispcc-sm7250-v1-2-07bdefb99801@brar.si>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 10:55:04 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: qcom: dispcc-sm7250: missing CLK_SET_RATE_PARENT on byte0_i=
ntf_clk
--

commit ab220a77d171c816d3d394b53d2f36fed1ff7979
Author: Ishu Brar <patches@brar.si>

clk: qcom: Add SM7250 display clock controller driver

This commit adds the display clock controller driver for the Qualcomm SM7250
SoC, providing MDSS clocks, the MDSS GDSC, and the core reset.

> diff --git a/drivers/clk/qcom/dispcc-sm7250.c b/drivers/clk/qcom/dispcc-s=
m7250.c
> new file mode 100644
> index 0000000000000..f114a9f5407ef
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc-sm7250.c

[ ... ]

> +static struct clk_regmap_div dispcc_mdss_byte0_div_clk_src =3D {
> +	.reg =3D 0x2128,
> +	.shift =3D 0,
> +	.width =3D 2,
> +	.clkr =3D {
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "dispcc_mdss_byte0_div_clk_src",
> +			.parent_hws =3D (const struct clk_hw*[]) {
> +				&dispcc_mdss_byte0_clk_src.clkr.hw,
> +			},
> +			.num_parents =3D 1,
> +			.ops =3D &clk_regmap_div_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dispcc_mdss_byte0_intf_clk =3D {
> +	.halt_reg =3D 0x202c,
> +	.halt_check =3D BRANCH_HALT,
> +	.clkr =3D {
> +		.enable_reg =3D 0x202c,
> +		.enable_mask =3D BIT(0),
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "dispcc_mdss_byte0_intf_clk",
> +			.parent_hws =3D (const struct clk_hw*[]) {
> +				&dispcc_mdss_byte0_div_clk_src.clkr.hw,
> +			},
> +			.num_parents =3D 1,
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};

[Severity: Medium]
Should dispcc_mdss_byte0_intf_clk in drivers/clk/qcom/dispcc-sm7250.c set
.flags =3D CLK_SET_RATE_PARENT, matching dispcc_mdss_byte1_intf_clk right b=
elow
it?

During DSI0 power-on, msm_dsi_host_power_on() -> dsi_link_clk_set_rate_6g()
in drivers/gpu/drm/msm/dsi/dsi_host.c configures the byte interface clock:

	if (msm_host->byte_intf_clk) {
		ret =3D clk_set_rate(msm_host->byte_intf_clk, msm_host->byte_intf_clk_rat=
e);
		if (ret) {
			pr_err("%s: Failed to set rate byte intf clk, %d\n",
			       __func__, ret);
			return ret;
		}
	}

Because dispcc_mdss_byte0_intf_clk uses clk_branch2_ops and omits
CLK_SET_RATE_PARENT, clk_core_round_rate_nolock() and clk_calc_new_rates() =
in
drivers/clk/clk.c treat it as a pass-through clock without an adjustable
parent and return 0 without forwarding the rate change to
dispcc_mdss_byte0_div_clk_src (register 0x2128), leaving the DSI0 byte
interface divider unconfigured when a non-default divider is needed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-dispcc-sm7=
250-v1-0-07bdefb99801@brar.si?part=3D2
