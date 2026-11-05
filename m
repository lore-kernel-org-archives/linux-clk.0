Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894816;
	b=huao1KWYyUh8HRmqr4HOMRPv6xsXcPEQW8IHuBslYrwBXkiuz65BocrsMCHzxzihrxTj
	 PMR18ju3U2i4cugVdYGmzVBvt0v3CR1OQupZa25QelXyVmu+ELHf61iZ3Rm4q59RiCKWc
	 v3VQXXz1OkzxJDz3/05qPAWGk8+u67W4PKVHy2rCLGvZkheZxt2EgdDrkondJM9YHmRUB
	 XHSBFg5lT2xkNvmF6VATbdIq1HW+vjDl6p/lmbFZpNw2fu28Z5mF+DbPMh0v5i3JdabNL
	 T6sfcripUJN+JryT/tXfHhCnJbIWYegpGs1IOCsW8DXJSkdfoYaDmiKaF+vjOpmpvOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894816;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EU4SxsXxaVG7qSm0wPoh4WNMODlWwS1C6Trkd7TcE/M=;
	b=nGxtUz9SXP5FgYDIqdmZDCdO3e5QWs8y+PfbZlUQf+vlZZ+u4aWnqSZW/T3v1Et9u/7U
	 ng86aYYRTYTnNWIX74yUMJRTBdRh6zJUrSlE4buDBjrnX+V8YB5JOmVHAarDHwjo8lm4c
	 ZYWdmn26AlOLaWw0UVUxgicIWc060s9lNTQuZIcranajefHeQWsyMC/RtMmzHk91mVeJS
	 Kzbq6hCn3KOU2FEqxP/LfEMfeuIRmJklmvT0WxSBNK8wv2smEAYtTwhkZBEwCuNW+AoVy
	 5ciCmokFXFo3vIthkDQIFcyENj6oxp2hwm2Kd4+2lJvgzxcK9h6XSWBX8BynRY80OmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jC4PeWlB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19520606A339;
	Thu,  5 Nov 2026 16:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jC4PeWlB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DD41F000C1;
	Thu,  5 Nov 2026 16:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793894815;
	bh=EU4SxsXxaVG7qSm0wPoh4WNMODlWwS1C6Trkd7TcE/M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jC4PeWlB21jheO4p8k1zcJra1LnFGreP/ikSjtt/Znh6FwauB1fA09RL2f/V5EOBg
	 1pY2uduIzC8+PvzGyR45SX7gdF/mZtY63pXso884bEHkI17Q+V5Vb75e6qsaUIS9Ft
	 4oCiQlqy3r61JrDs6dtnsFSpUz+Z1Zi3SrUqL+up+epvRTvXMhIC2T7gxGlIJ6n9Jg
	 /CxOsrvhAGaR44aq5yKo7B6QTgmjd5c6FDlCRbw3I0QIwdMjwdkV8hUUCXHj5muIDe
	 X9Vob11cEhgBrQyzdJqhQj4qT17/fZ043S9ZKux4ZE6+HZq3v/sqnINyjLriUUTzu8
	 iigrrI+OjkntA==
Message-ID: <sashiko-outbox-199410@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: Add SM8350 camera clock controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Zapolskiy" <vz@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104001704.2744766-3-vz@kernel.org>
References: <20261104001704.2744766-1-vz@kernel.org>
 <20261104001704.2744766-3-vz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:06:55 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] clk: qcom: Lucid 5LPE PLLs in camcc-sm8350 use clk_trion_pll_con=
figure()
- [Medium] clk: qcom: camcc-sm8350: duplicate cam_cc_pll2 parent in cam_cc_=
parent_data_1
--

commit 0c4b57cb98acf493d0d1fffca035f3d8996aea87
Author: Vladimir Zapolskiy <vz@kernel.org>

clk: qcom: Add SM8350 camera clock controller driver

This commit adds the camera clock controller (CAMCC) driver for the
Qualcomm SM8350 SoC, including six Lucid 5LPE PLLs, one Zonda 5LPE PLL,
clocks, resets, and GDSCs.

> diff --git a/drivers/clk/qcom/camcc-sm8350.c b/drivers/clk/qcom/camcc-sm8=
350.c
> new file mode 100644
> index 0000000000000..7881f1d2ab09e
> --- /dev/null
> +++ b/drivers/clk/qcom/camcc-sm8350.c
> @@ -0,0 +1,2650 @@

[ ... ]

> +static struct clk_alpha_pll cam_cc_pll0 =3D {
> +	.offset =3D 0x0,
> +	.config =3D &cam_cc_pll0_config,
> +	.vco_table =3D lucid_5lpe_vco,
> +	.num_vco =3D ARRAY_SIZE(lucid_5lpe_vco),
> +	.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +	.clkr =3D {
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "cam_cc_pll0",
> +			.parent_data =3D &pll_parent_data_tcxo,
> +			.num_parents =3D 1,
> +			.ops =3D &clk_alpha_pll_lucid_5lpe_ops,
> +		},
> +	},
> +};

[ ... ]

> +static const struct parent_map cam_cc_parent_map_1[] =3D {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL2_OUT_AUX2, 3 },
> +	{ P_CAM_CC_PLL2_OUT_EARLY, 5 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_1[] =3D {
> +	{ .index =3D DT_BI_TCXO },
> +	{ .hw =3D &cam_cc_pll2.clkr.hw },
> +	{ .hw =3D &cam_cc_pll2.clkr.hw },
> +};

[Severity: Medium]
Does having two entries in cam_cc_parent_data_1 point to the same
&cam_cc_pll2.clkr.hw cause clk_fetch_parent_index() to select the wrong
parent index for cam_cc_mclk0_clk_src through cam_cc_mclk5_clk_src?

In cam_cc_parent_map_1, index 1 is P_CAM_CC_PLL2_OUT_AUX2 (cfg =3D 3) and
index 2 is P_CAM_CC_PLL2_OUT_EARLY (cfg =3D 5), while ftbl_cam_cc_mclk0_clk=
_src
only uses P_BI_TCXO and P_CAM_CC_PLL2_OUT_EARLY:

static const struct freq_tbl ftbl_cam_cc_mclk0_clk_src[] =3D {
	F(19200000, P_BI_TCXO, 1, 0, 0),
	F(24000000, P_CAM_CC_PLL2_OUT_EARLY, 10, 1, 4),
	F(68571429, P_CAM_CC_PLL2_OUT_EARLY, 14, 0, 0),
	{ }
};

When clk_fetch_parent_index() in drivers/clk/clk.c looks up cam_cc_pll2, it
scans linearly from index 0:

drivers/clk/clk.c:clk_fetch_parent_index() {
	for (i =3D 0; i < core->num_parents; i++) {
		/* Found it first try! */
		if (core->parents[i].core =3D=3D parent)
			return i;

		/* Something else is here, so keep looking */
		if (core->parents[i].core)
			continue;

		/* Maybe core hasn't been cached but the hw is all we know? */
		if (core->parents[i].hw) {
			if (core->parents[i].hw =3D=3D parent->hw)
				break;

Even after _freq_tbl_determine_rate() populates core->parents[2].core via
clk_hw_get_parent_by_index(hw, 2), core->parents[1].core remains NULL and
core->parents[1].hw =3D=3D parent->hw matches at index 1, caching
core->parents[1].core =3D parent and returning index 1 instead of index 2.

If clk_set_parent() is called on cam_cc_mclk0_clk_src..cam_cc_mclk5_clk_src
with cam_cc_pll2 (for example via assigned-clock-parents),
clk_rcg2_shared_set_parent() receives index 1 and programs
rcg->parent_map[1].cfg (3, P_CAM_CC_PLL2_OUT_AUX2) into CFG_SRC_SEL instead
of rcg->parent_map[2].cfg (5, P_CAM_CC_PLL2_OUT_EARLY).

Should P_CAM_CC_PLL2_OUT_AUX2 and the duplicate &cam_cc_pll2.clkr.hw entry
be removed from cam_cc_parent_map_1 and cam_cc_parent_data_1, as in
camcc-sm8150.c and camcc-sm8250.c?

[ ... ]

> +static struct clk_alpha_pll *cam_cc_sm8350_plls[] =3D {
> +	&cam_cc_pll0,
> +	&cam_cc_pll1,
> +	&cam_cc_pll2,
> +	&cam_cc_pll3,
> +	&cam_cc_pll4,
> +	&cam_cc_pll5,
> +	&cam_cc_pll6,
> +};
> +
> +static const u32 cam_cc_sm8350_critical_cbcrs[] =3D {
> +	0xc148, /* CAM_CC_GDSC_CLK */
> +};
> +
> +static const struct regmap_config cam_cc_sm8350_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.val_bits =3D 32,
> +	.max_register =3D 0xf008,
> +	.fast_io =3D true,
> +};
> +
> +static const struct qcom_cc_driver_data cam_cc_sm8350_driver_data =3D {
> +	.alpha_plls =3D cam_cc_sm8350_plls,
> +	.num_alpha_plls =3D ARRAY_SIZE(cam_cc_sm8350_plls),
> +	.clk_cbcrs =3D cam_cc_sm8350_critical_cbcrs,
> +	.num_clk_cbcrs =3D ARRAY_SIZE(cam_cc_sm8350_critical_cbcrs),
> +};

[Severity: Medium]
Will passing cam_cc_sm8350_plls via cam_cc_sm8350_driver_data.alpha_plls
configure the six Lucid 5LPE PLLs (cam_cc_pll0, cam_cc_pll1, cam_cc_pll3,
cam_cc_pll4, cam_cc_pll5, and cam_cc_pll6) with clk_trion_pll_configure()
instead of clk_lucid_5lpe_pll_configure()?

During probe, the call chain is:

cam_cc_sm8350_probe()
  -> qcom_cc_probe()
    -> qcom_cc_really_probe()
      -> qcom_cc_clk_pll_configure()
        -> qcom_clk_alpha_pll_configure()

Those six PLLs use clk_alpha_pll_lucid_5lpe_ops and
clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID]. Because
CLK_ALPHA_PLL_TYPE_LUCID is aliased to CLK_ALPHA_PLL_TYPE_TRION in
drivers/clk/qcom/clk-alpha-pll.h, GET_PLL_TYPE(pll) in
qcom_clk_alpha_pll_configure() matches CLK_ALPHA_PLL_TYPE_TRION:

drivers/clk/qcom/clk-alpha-pll.c:qcom_clk_alpha_pll_configure() {
	...
	case CLK_ALPHA_PLL_TYPE_TRION:
		clk_trion_pll_configure(pll, regmap, pll->config);
		break;

clk_trion_pll_configure() sets PLL_UPDATE_BYPASS in PLL_MODE:

drivers/clk/qcom/clk-alpha-pll.c:clk_trion_pll_configure() {
	...
	regmap_update_bits(regmap, PLL_MODE(pll), PLL_UPDATE_BYPASS,
			   PLL_UPDATE_BYPASS);

As noted in commit 362be5cbaec2a6 ("clk: qcom: dispcc-sm8250: use special
function for Lucid 5LPE PLL"), Lucid 5LPE PLLs require
clk_lucid_5lpe_pll_configure(), which omits setting PLL_UPDATE_BYPASS.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104001704.2744=
766-1-vz@kernel.org?part=3D2
