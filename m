Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3693148B7
	for <linux-clk@vger.kernel.org>; Wed, 10 Sep 2025 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757497321; cv=none; b=uZY3I5sXPnv07UQ5araH+udY1KU/hg+B2UjaGc3t5ZzzfhIXo1dSsngLoJdS64lI6tf8/vRIIs9DMjwmL7RBcYRwbgfdTKVjIECSARemroe7mCDUEvlcW49ctLkmkmeyFW/YyHUT3IJ02bls33DIbBVzoboQibXlNTkgl2yuWvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757497321; c=relaxed/simple;
	bh=TBOyz5XF2Xafm9XcIDOjhJZALVaCDkLt8Lqpf+qFVvQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uhlne8AfmNH5NIzosYgNNEJoV4GQCblt31MWYup/CSlg6drpfzLmHil0Xy817KVq7a1AFb7xrsaQiayAHBdeF248WdqUJjG09qg9CArCmSskEHBDj7HWabSl6eiL8gNDr+QDO1Ed74ftPwvJuTT51F6bX0aM7GSo1+7fN6N1/mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OuRMaL9S; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OuRMaL9S"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45dde353b47so19406095e9.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Sep 2025 02:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757497317; x=1758102117; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0OBSNMCSZFkYoD+gDD6u3qKCw6C8XYzkirO4cLs6lbo=;
        b=OuRMaL9Ss7DmGq7Fi3lxLmbR0YOoaPzATo+OhzBAWM3GaF4Xptx443uaeIHllmFTI7
         rVNFWkkdgTq79C829ISDxVDigjpkQep5ep/hxCbAm3KhyMyoNGw5yGPcaPSy3xPcCPaV
         iGUfhq3t+YWzvFSUFwvK7P/nGhOPoOwqyRBR7mjHVkJQh/B85KB/VB3U/4jCKY+qW5KJ
         RjMKyWQcvfaNA8k+NEiMMfucfKLkpbSlsmOxhqmjfB5EbCSVQwvCytLEvxHuPq8v2nU4
         EArvSiCf9FEi48EhaZ8iZwEEJzQBlP+s+iEIQgvy1YddLar5npn7Vt0+8p5LwCmYnFIA
         6TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497317; x=1758102117;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OBSNMCSZFkYoD+gDD6u3qKCw6C8XYzkirO4cLs6lbo=;
        b=D7oZaA/pLud6yoOunlceEYzg4y7/d3xskPXBTp8dYkRc4bR0D5dxadzuYvaizmyh1w
         +tFxwtyX84qkhX6w5ZGKHdPJ7m8jF+m2X+Bb3ohYwJOIyGCHgCOrmCQrB1EYGENpDXcV
         jqbqdYLrzOsP9sbHWqk+mk/oitz5TVbfE4iUl5mDPpyDUWZktORpffIRaFV3y/xsZseP
         O0/6qGjWvl5WAz/Ikt5hbs6mLiIg0ng3qA/AhpqUNu6vu9AYB7IsF9z/rSRdCttUoCFw
         FjEA1bk0L2WMDrBLgDfvbPK0WxioKMEHZkKtHuoQ03vGgr5BlBFbV3tyagH8yh+OiBPk
         3xxw==
X-Forwarded-Encrypted: i=1; AJvYcCW5KQwikmxnEfM+odX6A0ehs3FqCM4+1QcmEgaEJUXM5b0emJ0qDxGYh6VarxwZALkifOVik7Zs04o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxikgytv9J+N9jwPsw6ECyiP3N+EwdXqxtLPSmTHy3i9JeTDOUC
	8eT/yObhE9P2mOcIIfGq671/CFFcLRMegNoSYt8j8sv8nbvR/Qi3m4Q0UT2sX6kgyKk=
X-Gm-Gg: ASbGnctp3N/lRv33Jn92QHxe/MZUebVRpU/dm26kHQZJFuGL9pFt4qACbWRTfa52ZvG
	0bY5+y0ZfCsZcEKNzrX1bpOQL9covPW8nSOmV8puHv5G7Pyv9q3rl/C97d1IYmVgu5/S8DjMm7x
	6/5Tal1zvn+D+8O2PHy1PHKyGiqVVTKULZ8Qbk0ysjUKqUxg8JwAEEy7aknrASw0AysFoFddQFN
	t5HGn4ZGLT5oegjYJFCq7CNUfVPtN78oDklYkT5g8xnNKSR0h+ShPqAR06HPB5OzNvCiQQGHQSz
	vtOh7FS1s9viIJRy+gN2xjt9fP1RNq0k4NJyhVtsKeGlcjc+kEqEYcnBaoRsxuktoZ+Anj98KAV
	hGx5DsyQndDAfk602bWzLn6YunGdUs3g9
X-Google-Smtp-Source: AGHT+IFhJUYuLbSMnUTSqjS1CD9WH9ciAuMmnQkgVDBas13o9m9uUxWF1IbevCk3GCBXb/HsRxReFw==
X-Received: by 2002:a05:6000:18a4:b0:3cc:8d94:1108 with SMTP id ffacd0b85a97d-3e641e3cffemr11252957f8f.22.1757497316478;
        Wed, 10 Sep 2025 02:41:56 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c75e:f70c:b449:e087])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e7521bf85esm6365253f8f.1.2025.09.10.02.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 02:41:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] clk: amlogic: add video-related clocks for S4 SoC
In-Reply-To: <20250909-add_video_clk-v4-2-5e0c01d47aa8@amlogic.com> (Chuan Liu
	via's message of "Tue, 09 Sep 2025 15:29:12 +0800")
References: <20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com>
	<20250909-add_video_clk-v4-2-5e0c01d47aa8@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 10 Sep 2025 11:41:55 +0200
Message-ID: <1jv7lqiqzg.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 09 Sep 2025 at 15:29, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> Add video encoder, demodulator and CVBS clocks.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/s4-peripherals.c | 203 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 203 insertions(+)
>
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index 6d69b132d1e1..b855e8f1fc04 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -44,6 +44,7 @@
>  #define CLKCTRL_VDIN_MEAS_CLK_CTRL                 0x0f8
>  #define CLKCTRL_VAPBCLK_CTRL                       0x0fc
>  #define CLKCTRL_HDCP22_CTRL                        0x100
> +#define CLKCTRL_CDAC_CLK_CTRL                      0x108
>  #define CLKCTRL_VDEC_CLK_CTRL                      0x140
>  #define CLKCTRL_VDEC2_CLK_CTRL                     0x144
>  #define CLKCTRL_VDEC3_CLK_CTRL                     0x148
> @@ -1126,6 +1127,22 @@ static struct clk_regmap s4_cts_encp_sel = {
>  	},
>  };
>  
> +static struct clk_regmap s4_cts_encl_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = CLKCTRL_VIID_CLK_DIV,
> +		.mask = 0xf,
> +		.shift = 12,
> +		.table = s4_cts_parents_val_table,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cts_encl_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = s4_cts_parents,
> +		.num_parents = ARRAY_SIZE(s4_cts_parents),
> +		.flags = CLK_SET_RATE_PARENT,

Do you really expect the rate of the parents to be adjusted when calling
set_rate() on this clock ?

It all trickle down to vclks which are shared with enci encp and vdac
clocks, so maybe not such a good idea, don't you think ?

> +	},
> +};
> +
>  static struct clk_regmap s4_cts_vdac_sel = {
>  	.data = &(struct clk_regmap_mux_data){
>  		.offset = CLKCTRL_VIID_CLK_DIV,
> @@ -1205,6 +1222,22 @@ static struct clk_regmap s4_cts_encp = {
>  	},
>  };
>  
> +static struct clk_regmap s4_cts_encl = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = CLKCTRL_VID_CLK_CTRL2,
> +		.bit_idx = 3,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "cts_encl",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_cts_encl_sel.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
>  static struct clk_regmap s4_cts_vdac = {
>  	.data = &(struct clk_regmap_gate_data){
>  		.offset = CLKCTRL_VID_CLK_CTRL2,
> @@ -2735,6 +2768,165 @@ static struct clk_regmap s4_gen_clk = {
>  	},
>  };
>  
> +/* CVBS DAC */
> +static struct clk_regmap s4_cdac_sel = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = CLKCTRL_CDAC_CLK_CTRL,
> +		.mask = 0x3,
> +		.shift = 16,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cdac_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = (const struct clk_parent_data []) {
> +			{ .fw_name = "xtal", },
> +			{ .fw_name = "fclk_div5" },
> +		},
> +		.num_parents = 2,
> +	},
> +};
> +
> +static struct clk_regmap s4_cdac_div = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = CLKCTRL_CDAC_CLK_CTRL,
> +		.shift = 0,
> +		.width = 16,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cdac_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_cdac_sel.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap s4_cdac = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = CLKCTRL_CDAC_CLK_CTRL,
> +		.bit_idx = 20,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cdac",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_cdac_div.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap s4_demod_core_sel = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = CLKCTRL_DEMOD_CLK_CTRL,
> +		.mask = 0x3,
> +		.shift = 9,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "demod_core_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = (const struct clk_parent_data []) {
> +			{ .fw_name = "xtal" },
> +			{ .fw_name = "fclk_div7" },
> +			{ .fw_name = "fclk_div4" }
> +		},
> +		.num_parents = 3,
> +	},
> +};
> +
> +static struct clk_regmap s4_demod_core_div = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = CLKCTRL_DEMOD_CLK_CTRL,
> +		.shift = 0,
> +		.width = 7,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "demod_core_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_demod_core_sel.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap s4_demod_core = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = CLKCTRL_DEMOD_CLK_CTRL,
> +		.bit_idx = 8
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "demod_core",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_demod_core_div.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +/* CVBS ADC */
> +static struct clk_regmap s4_adc_extclk_in_sel = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = CLKCTRL_DEMOD_CLK_CTRL,
> +		.mask = 0x7,
> +		.shift = 25,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "adc_extclk_in_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = (const struct clk_parent_data []) {
> +			{ .fw_name = "xtal" },
> +			{ .fw_name = "fclk_div4" },
> +			{ .fw_name = "fclk_div3" },
> +			{ .fw_name = "fclk_div5" },
> +			{ .fw_name = "fclk_div7" },
> +			{ .fw_name = "mpll2" },
> +			{ .fw_name = "gp0_pll" },
> +			{ .fw_name = "hifi_pll" }
> +		},
> +		.num_parents = 8,
> +	},
> +};
> +
> +static struct clk_regmap s4_adc_extclk_in_div = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = CLKCTRL_DEMOD_CLK_CTRL,
> +		.shift = 16,
> +		.width = 7,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "adc_extclk_in_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_adc_extclk_in_sel.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap s4_adc_extclk_in = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = CLKCTRL_DEMOD_CLK_CTRL,
> +		.bit_idx = 24
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "adc_extclk_in",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_adc_extclk_in_div.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
>  static const struct clk_parent_data s4_pclk_parents = { .hw = &s4_sys_clk.hw };
>  
>  #define S4_PCLK(_name, _reg, _bit, _flags) \
> @@ -3028,6 +3220,17 @@ static struct clk_hw *s4_peripherals_hw_clks[] = {
>  	[CLKID_HDCP22_SKPCLK_SEL]	= &s4_hdcp22_skpclk_sel.hw,
>  	[CLKID_HDCP22_SKPCLK_DIV]	= &s4_hdcp22_skpclk_div.hw,
>  	[CLKID_HDCP22_SKPCLK]		= &s4_hdcp22_skpclk.hw,
> +	[CLKID_CTS_ENCL_SEL]		= &s4_cts_encl_sel.hw,
> +	[CLKID_CTS_ENCL]		= &s4_cts_encl.hw,
> +	[CLKID_CDAC_SEL]		= &s4_cdac_sel.hw,
> +	[CLKID_CDAC_DIV]		= &s4_cdac_div.hw,
> +	[CLKID_CDAC]			= &s4_cdac.hw,
> +	[CLKID_DEMOD_CORE_SEL]		= &s4_demod_core_sel.hw,
> +	[CLKID_DEMOD_CORE_DIV]		= &s4_demod_core_div.hw,
> +	[CLKID_DEMOD_CORE]		= &s4_demod_core.hw,
> +	[CLKID_ADC_EXTCLK_IN_SEL]	= &s4_adc_extclk_in_sel.hw,
> +	[CLKID_ADC_EXTCLK_IN_DIV]	= &s4_adc_extclk_in_div.hw,
> +	[CLKID_ADC_EXTCLK_IN]		= &s4_adc_extclk_in.hw,
>  };
>  
>  static const struct meson_clkc_data s4_peripherals_clkc_data = {

-- 
Jerome
