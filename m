Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542031;
	b=fljn0wu1Qv4OxSkwAbV8KFr4zf2uBdagEa8HtzbhszvORUN4r2PRViKZ+22I00TZXB4C
	 oHGVGBhcvNR4TmGMdB7Ocs5DW++txfGR8H2jSAxmK1nPOLcbLZgQzq3AzI+/RWS7MCwVw
	 kgT99xVkopyKWsVW1yJpPOUenxP6ip5WxhLpBgeJgnzj3YZlT3kBnRZUPd0aykbOkH/Bo
	 T3vZVvY/98SQzc3ZcHMDQw1WoVCaYtp5meFcpSi02o0CCut6Bb8U6SHrgFaQO+ouka1IV
	 vNqs0hmkyAPKdpGHRWvqCi3wKGzqfY5k31Ai9Jdap9XVE6FDsyr0toFqD9Tbb+70DcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542031;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PuzZMqpxFhcQuLotlpSoOV/ohZvOUOio5AHasllr4fM=;
	b=dPYDrpLXRXs04r14OFKSDn6GFWR6/44izstEMhhyRKxEJP1MxLFAzZue8WF0g/Ri22YX
	 ZWIXLKhHZV6+FuTDTxk40PLGAMWc/g9c5qN5+KMLNdlYQZnPH49fXWtsh9cBTyn88JijZ
	 HEXX+ovdgpy0TLpD5hK3muOHEIN+nEFAoXHcuS0QXH/aioj5+Wxyirl0vt/ZDyKATBoeq
	 QJtqTjgLcDY/cHa3Sg4ToMva0O5SfITs41JGydrsp9d7Gi5kqgj2YvU0OyMXE7RZdIusj
	 QYir6EVUsO1m3tC+U9m144pDsvHyGZFgHRvf3vm3QI+Ui8y8wXZSDTjRILTJhvLXIYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="c/YaJX87";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D439606A321;
	Tue, 24 Nov 2026 17:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c/YaJX87
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8921F000D1;
	Tue, 24 Nov 2026 17:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542030;
	bh=PuzZMqpxFhcQuLotlpSoOV/ohZvOUOio5AHasllr4fM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c/YaJX87TwWU9f5J+3EQbhfrW0zTUomjJHpst+LwV+2eaKqi/BIDF/5H62kUnd7cC
	 2MIRgwlb1UUbauYe/WlYLGShIATgnsFoDalFadlZ8498Croyvmfq5yvdbVgsHbMzIS
	 xZ0Sg/EpT9h6YaMnyRUV6soBSiv4tvBUxd9YSYYGdaqW87WHm9Cett1S4JkRmceM8C
	 qLtI3maWSrSavey/aCtAqyuuqkviJ3d67N3ijreWoyQ2p93zlhibeM7v6VWBc3o2dL
	 RTkRQ0bSfGdaFgtnv5Ayki15eYTIvCx62Vp5wPFltczspsHEsyWP5K58zInJ+fjVo7
	 O/UhXDB5gwimw==
Message-ID: <sashiko-outbox-231728@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: add SM8650 LPASS core & audio clock
 controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-topic-sm8650-el2-clks-v2-2-8086440e2c09@linaro.org>
References: <20261124-topic-sm8650-el2-clks-v2-0-8086440e2c09@linaro.org>
 <20261124-topic-sm8650-el2-clks-v2-2-8086440e2c09@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:40:29 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] clk: qcom: unclocked GDSC MMIO access in lpass_aon_cc on SM8650
- [Medium] clk: qcom: MND freq_tbl used on non-MND
  lpass_aon_cc_main_rcg_clk_src
- [Medium] clk: qcom: MCLK branches parented to 2X RCGs instead of CDIV
  dividers
- [Low] clk: qcom: stale LPASS HM iface clock description in commit
  message
--

commit 5b9d49ed39635aa6cd0df792f0d843cc860ce478
Author: Neil Armstrong <neil.armstrong@linaro.org>

clk: qcom: add SM8650 LPASS core & audio clock controllers

This commit adds drivers for the SM8650 LPASS HM, core, audio, and AON
clock controllers so Linux can manage LPASS clocks and GDSCs without ADSP
firmware.

> Add drivers for the SM8650 LPASS HM, core, audio and AON clock
> controllers, the HM, audio and AON controllers keeping their iface clock
> enabled while in use, LPASS HM's being the GCC LPASS config NoC clock.

[Severity: Low]
Is the commit message description of LPASS HM's iface clock still
accurate?  Only the audio and AON drivers acquire and manage an "iface"
clock via pm_clk_add(); lpass_hm_core_probe() calls qcom_cc_probe()
directly without setting up pm_clk.

> diff --git a/drivers/clk/qcom/lpassaudiocc-sm8650.c b/drivers/clk/qcom/lp=
assaudiocc-sm8650.c
> new file mode 100644
> index 0000000000000..abd0258d9e72f
> --- /dev/null
> +++ b/drivers/clk/qcom/lpassaudiocc-sm8650.c
[ ... ]
> +/* XO only for now: the ADSP plan feeds these from the audio CC DIG PLL =
*/
> +static const struct freq_tbl ftbl_lpass_cc_ext_clk_src[] =3D {
> +	F(1536000, P_BI_TCXO, 1, 2, 25),
> +	F(2304000, P_BI_TCXO, 1, 3, 25),
> +	F(3072000, P_BI_TCXO, 1, 4, 25),
> +	F(9600000, P_BI_TCXO, 2, 0, 0),
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	{ }
> +};
[ ... ]
> +static struct clk_rcg2 lpass_aon_cc_main_rcg_clk_src =3D {
> +	.cmd_rcgr =3D 0x19000,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D lpass_aon_cc_parent_map_0,
> +	.freq_tbl =3D ftbl_lpass_cc_ext_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data){
> +		.name =3D "lpass_aon_cc_main_rcg_clk_src",
> +		.parent_data =3D lpass_aon_cc_parent_data_0,
> +		.num_parents =3D ARRAY_SIZE(lpass_aon_cc_parent_data_0),
> +		.ops =3D &clk_rcg2_ops,
> +	},
> +};

[Severity: Medium]
Should lpass_aon_cc_main_rcg_clk_src use a frequency table without MND
entries (such as ftbl_lpass_mclk_clk_src) since its .mnd_width is 0?

Because __clk_rcg2_configure_mnd() only programs M, N, and D when
rcg->mnd_width is non-zero, requesting 1.536 MHz, 2.304 MHz, or 3.072 MHz
on lpass_aon_cc_main_rcg_clk_src (or via its CLK_SET_RATE_PARENT child
branches) matches the fractional M/N entries in ftbl_lpass_cc_ext_clk_src
during rate determination, but programs only pre_div =3D 1 in hardware,
leaving the clock running at 19.2 MHz.

[ ... ]

> +/* MCLK =3D RCG / CDIV (reset value: divide by 2), the 2X clocks are the=
 RCG */
> +static struct clk_regmap_div lpass_audio_cc_cdiv_rx_mclk_div_clk_src =3D=
 {
[ ... ]
> +static struct clk_branch lpass_audio_cc_wsa_mclk_clk =3D {
> +	.halt_reg =3D 0x2a0d4,
> +	.halt_check =3D BRANCH_HALT,
> +	.clkr =3D {
> +		.enable_reg =3D 0x2a0d4,
> +		.enable_mask =3D BIT(0),
> +		.hw.init =3D &(const struct clk_init_data){
> +			.name =3D "lpass_audio_cc_wsa_mclk_clk",
> +			.parent_hws =3D (const struct clk_hw*[]){
> +				&lpass_audio_cc_cdiv_wsa_mclk_div_clk_src.clkr.hw,
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT,
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch lpass_audio_cc_wsa2_mclk_clk =3D {
> +	.halt_reg =3D 0x2d004,
> +	.halt_check =3D BRANCH_HALT,
> +	.clkr =3D {
> +		.enable_reg =3D 0x2d004,
> +		.enable_mask =3D BIT(0),
> +		.hw.init =3D &(const struct clk_init_data){
> +			.name =3D "lpass_audio_cc_wsa2_mclk_clk",
> +			.parent_hws =3D (const struct clk_hw*[]){
> +				&lpass_audio_cc_wsa_mclk_clk_src.clkr.hw,
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT,
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch lpass_audio_cc_tx_mclk_wsa_clk =3D {
> +	.halt_reg =3D 0x2a0f4,
> +	.halt_check =3D BRANCH_HALT,
> +	.clkr =3D {
> +		.enable_reg =3D 0x2a0f4,
> +		.enable_mask =3D BIT(0),
> +		.hw.init =3D &(const struct clk_init_data){
> +			.name =3D "lpass_audio_cc_tx_mclk_wsa_clk",
> +			.parent_hws =3D (const struct clk_hw*[]){
> +				&lpass_aon_cc_tx_mclk_clk_src.clkr.hw,
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT,
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch lpass_audio_cc_tx_mclk_rx_clk =3D {
> +	.halt_reg =3D 0x2c0e0,
> +	.halt_check =3D BRANCH_HALT,
> +	.clkr =3D {
> +		.enable_reg =3D 0x2c0e0,
> +		.enable_mask =3D BIT(0),
> +		.hw.init =3D &(const struct clk_init_data){
> +			.name =3D "lpass_audio_cc_tx_mclk_rx_clk",
> +			.parent_hws =3D (const struct clk_hw*[]){
> +				&lpass_aon_cc_tx_mclk_clk_src.clkr.hw,
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT,
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch lpass_audio_cc_tx_mclk_wsa2_clk =3D {
> +	.halt_reg =3D 0x2d00c,
> +	.halt_check =3D BRANCH_HALT,
> +	.clkr =3D {
> +		.enable_reg =3D 0x2d00c,
> +		.enable_mask =3D BIT(0),
> +		.hw.init =3D &(const struct clk_init_data){
> +			.name =3D "lpass_audio_cc_tx_mclk_wsa2_clk",
> +			.parent_hws =3D (const struct clk_hw*[]){
> +				&lpass_aon_cc_tx_mclk_clk_src.clkr.hw,
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT,
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};

[Severity: Medium]
Should lpass_audio_cc_wsa2_mclk_clk and the three lpass_audio_cc_tx_mclk_*
branches be parented to their CDIV divider clocks rather than directly to
the 2X RCG clock sources?

As noted in the CDIV comment above, 1X MCLK branches are divided by CDIV
(divide by 2 at reset), which is how lpass_audio_cc_rx_mclk_clk,
lpass_audio_cc_wsa_mclk_clk, and lpass_aon_cc_tx_mclk_clk are wired.
Parenting lpass_audio_cc_wsa2_mclk_clk directly to
lpass_audio_cc_wsa_mclk_clk_src and lpass_audio_cc_tx_mclk_{wsa,rx,wsa2}_clk
directly to lpass_aon_cc_tx_mclk_clk_src with CLK_SET_RATE_PARENT causes a
2x rate mismatch in clk_get_rate() and conflicts with sibling 1X MCLK
branches sharing those RCGs when clk_set_rate() is called.

[ ... ]

> +static struct gdsc lpass_aon_cc_lpass_audio_hm_gdsc =3D {
> +	.gdscr =3D 0x11090,
> +	.pd =3D {
> +		.name =3D "lpass_aon_cc_lpass_audio_hm_gdsc",
> +	},
> +	.pwrsts =3D PWRSTS_OFF_ON,
> +	.flags =3D RETAIN_FF_ENABLE,
> +};
[ ... ]
> +static int lpass_cc_sm8650_probe(struct platform_device *pdev,
> +				 const struct qcom_cc_desc *desc)
> +{
> +	int ret;
> +
> +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_pm_clk_create(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D pm_clk_add(&pdev->dev, "iface");
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to acquire iface clock\n");
> +		return ret;
> +	}
> +
> +	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D qcom_cc_probe(pdev, desc);
> +
> +	pm_runtime_put_sync(&pdev->dev);
> +
> +	return ret;
> +}

[Severity: High]
Can gdsc_enable() or gdsc_disable() access
lpass_aon_cc_lpass_audio_hm_gdsc (offset 0x11090) while lpass_aon_cc is
runtime-suspended and its iface clock is disabled?

At the end of lpass_cc_sm8650_probe(), pm_runtime_put_sync() suspends
lpass_aon_cc and disables its iface clock (LPASS_CORE_CC_CORE_CLK), which
also allows lpass_core_cc to runtime-suspend and power off
LPASS_CORE_HM_GDSC.  Because gdsc_enable() and gdsc_disable() do not
runtime-resume the GDSC provider device, any genpd power transition that
runs while lpass_aon_cc is suspended performs unclocked MMIO on 0x11090
and triggers a bus hang or SError.  For example, genpd_power_off_unused()
at late_initcall_sync, asynchronous genpd_power_off_work_fn() after a
consumer drops its runtime PM supplier link, or system suspend/resume of a
virtual genpd device attached via dev_pm_domain_attach_by_name() in
lpass_macro_pds_init() can all toggle this GDSC while lpass_aon_cc is
runtime-suspended.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-topic-sm86=
50-el2-clks-v2-0-8086440e2c09@linaro.org?part=3D2
