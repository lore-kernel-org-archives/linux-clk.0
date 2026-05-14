Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C77314B66
	for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 16:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778776076; cv=none; b=FTC5Q5j0Ksx6p7EILZ3uCepH6KMa9TEI5eexZ6bAM4mRnwH9UF8ynfx83gsyNjfAMxEFqiStDOPfXN1409+HfTTW12GdEFZIwMW0WQYmX4tlhkW3TnUqT1Cto74rlxdkOlLhpaD3XJzbloVz967Vlv1Ml+d/beM95soJwweRWaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778776076; c=relaxed/simple;
	bh=gQFaIMS3bwYFa6yRvvWUaGjjfa/W13F1VRwQvRsnf3I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gh/qTa5cRbfQiSCodpGaaYkAXu8cLcCsDU5DID3SzWyx467tVZ4Ldm8y41cCEbpbf++C4DoFFNTWqsLgCGKoU8ctlxNWi2X/mowLz5+frnomUkjnztSQdOINpaTYslW/mkEtVQoo3nyIK/buVwheFd8W3Yr3qGbfQdebUDHYOho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=LwofsbGa; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="LwofsbGa"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso4630535e9.1
        for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 09:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778776064; x=1779380864; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LhH0JEjl/o5WVfg5yQmTjjb3Q7eOlu7i/UoVw2wy4NY=;
        b=LwofsbGaqhiuK2vNWzUuGZAju0jiyNZVtNUb7B8/3EykghQMm5LF1q12f4ei36oLJb
         YzCUQ4AG3b+604I/bYqR8o2KOcOhCGRb0vgy8SdPLf09O1zxV7Sm3zZX0kcoKkjPeCQy
         ZUL80z16xxVTyVNX4mMzCTdWB8/FwXoTsZpXxN31qhNHkJYa4yHseAefbhQ1YXuDVbDg
         Bg68jI8/XTNF+lcigGfUhkHw3PkqXqDc73niG8QFUM04rGwDupADosJBW/Cad6ctl+0D
         uWF5tOmGwwp+UdwjHlYguaATzcEMwhcQeLMedzs21VvZaM7wtRfFNBXr5pqFDSu5u31B
         KbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778776064; x=1779380864;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LhH0JEjl/o5WVfg5yQmTjjb3Q7eOlu7i/UoVw2wy4NY=;
        b=VQkqcbZ6g0aCWco/hrNXYhWXnH46cpb6vqE5DRJhe2bmmGkh3QfDx6lQ0FkkObwTCQ
         pC/fLekIMSeGarEcMB+/R7H7QKemQneG9y/0Z5mQ5dNTgTSPfg2Z8CsKQV3IRExqVZmv
         aoyckWGXUPQHVlp4yRandLNKGQfv9hJUltYgjWYPYYsX5unfnVaPIh3USYrTDQ/FQN4H
         j6QfYDvGfAir4YoX11SxlpQDuFGUt/JSoMf44OBjFbxS3m+Ck+rW/eK3s7G5XVLetJRk
         tRMHczhOHmNHiwlXkovf8vhjaSzR5MWidt8ygVtXXhOi8w/bc4NSSRQOPR2dzQc8gZEj
         HjGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UG1niInvAb0mkCBFyYvPd2TvCkCnzn+yagdBPZu4mruyQXM2SPGg764vX9g2HFnY5dQWa0K0xu5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YweTyOkSvBoiHgL7ChbnxbGDoZB/29iDhgc2roa46aPwoEQN+F0
	R59/oGWUBPfX2qjTDZSuuZ5trIUS+FgYGvU4o9k0J2lnaCS5YvukBtE0yMvnLgaOZfQ=
X-Gm-Gg: Acq92OF0YhIA7iTUL5q350auymUUSQ38gDxa4zqnC0YITw1GvWFGnIDlH45hqnGbKq2
	5EvwhfTqimjPMxiV/NXuSR7QmYy7I37wXZFk2q4OG06hevecU2CiisBB9ZXMpEX8pgm8zV53DVZ
	IcKy+l5UFacICIHD4Ihhx1SruS8jiyR9hEI/0EsBtoYdBy8N/pn/FFDxOERo8u2WQXT0wcfT5kA
	GckTyjYZP7zDtvVEHISrXUonPL9EuTDQjixvHqdyoR4rHOZG4cT+k1yu/WMzF9Y38cEWSjYCDui
	WOFJPfLSv29gDyYs9oVnYLB2DC8Ij4uChM1SBdDmyShY/edBrX71G9XQnPvmjCj0GcQXH+eADOc
	+ssa8w4t47AFoO8FM+k6Cr8ZaFeoJO4XxWpSs8oS36MZdCvYVeIOvjGYNTa58BTbwB+gNkCs8i5
	E7k3bYLSHrO/CgXfOFr+JfbqQFpijjMA==
X-Received: by 2002:a05:600c:3b0f:b0:48f:e230:72fb with SMTP id 5b1f17b1804b1-48fe6631512mr881995e9.32.1778776064522;
        Thu, 14 May 2026 09:27:44 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8f63:bf1e:b5:28d8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fd72984f5sm22510545e9.15.2026.05.14.09.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 09:27:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  jian.hu@amlogic.com,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 10/10] clk: amlogic: Add A9 AO clock controller driver
In-Reply-To: <20260511-b4-a9_clk-v1-10-41cb4071b7c9@amlogic.com> (Jian Hu
	via's message of "Mon, 11 May 2026 20:47:32 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-10-41cb4071b7c9@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 14 May 2026 18:27:42 +0200
Message-ID: <1j33zu6jnl.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> From: Jian Hu <jian.hu@amlogic.com>
>
> Add the Always-on clock controller driver for the Amlogic A9 SoC family.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/Makefile   |   2 +-
>  drivers/clk/meson/a9-aoclk.c | 494 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 495 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index 2b5b67b14efc..91af609ce815 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -20,7 +20,7 @@ obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>  obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>  obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
>  obj-$(CONFIG_COMMON_CLK_A9_PLL) += a9-pll.o
> -obj-$(CONFIG_COMMON_CLK_A9_PERIPHERALS) += a9-peripherals.o
> +obj-$(CONFIG_COMMON_CLK_A9_PERIPHERALS) += a9-peripherals.o a9-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_C3_PLL) += c3-pll.o
>  obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) += c3-peripherals.o
>  obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
> diff --git a/drivers/clk/meson/a9-aoclk.c b/drivers/clk/meson/a9-aoclk.c
> new file mode 100644
> index 000000000000..3c42eaf585d2
> --- /dev/null
> +++ b/drivers/clk/meson/a9-aoclk.c
> @@ -0,0 +1,494 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/amlogic,a9-aoclkc.h>
> +#include "clk-regmap.h"
> +#include "clk-dualdiv.h"
> +#include "meson-clkc-utils.h"
> +
> +#define AO_OSCIN_CTRL			0x00
> +#define AO_SYS_CLK0			0x04
> +#define AO_PWM_CLK_A_CTRL		0x1c
> +#define AO_PWM_CLK_B_CTRL		0x20
> +#define AO_PWM_CLK_C_CTRL		0x24
> +#define AO_PWM_CLK_D_CTRL		0x28
> +#define AO_PWM_CLK_E_CTRL		0x2c
> +#define AO_PWM_CLK_F_CTRL		0x30
> +#define AO_PWM_CLK_G_CTRL		0x34
> +#define AO_CEC_CTRL0			0x38
> +#define AO_CEC_CTRL1			0x3c
> +#define AO_RTC_BY_OSCIN_CTRL0		0x50
> +#define AO_RTC_BY_OSCIN_CTRL1		0x54
> +
> +#define A9_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
> +	MESON_COMP_SEL(a9_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
                       a9_ao_ ?


> +
> +#define A9_COMP_DIV(_name, _reg, _shift, _width) \
> +	MESON_COMP_DIV(a9_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
> +
> +#define A9_COMP_GATE(_name, _reg, _bit) \
> +	MESON_COMP_GATE(a9_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
> +
> +static struct clk_regmap a9_ao_xtal_in = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = AO_OSCIN_CTRL,
> +		.bit_idx = 3,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "ao_xtal_in",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "xtal",
> +		},
> +		.num_parents = 1,
> +		/*
> +		 * It may be ao_sys's parent clock, its child clocks mark
> +		 * CLK_IS_CRITICAL, So mark CLK_IS_CRITICAL for it.
> +		 */
> +		.flags = CLK_IS_CRITICAL,
> +	},
> +};
> +
> +static struct clk_regmap a9_ao_xtal = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = AO_OSCIN_CTRL,
> +		.mask = 0x1,
> +		.shift = 0,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "ao_xtal",
> +		.ops = &clk_regmap_mux_ops,
> +		/* ext_32k is from external PAD, do not automatically reparent */
> +		.parent_data = (const struct clk_parent_data []) {
> +			{ .hw = &a9_ao_xtal_in.hw },
> +			{ .fw_name = "ext_32k", },
> +		},
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_NO_REPARENT,
> +	},
> +};
> +
> +static struct clk_regmap a9_ao_sys = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = AO_OSCIN_CTRL,
> +		.mask = 0x1,
> +		.shift = 1,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "ao_sys",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = (const struct clk_parent_data []) {
> +			{ .hw = &a9_ao_xtal.hw },
> +			{ .fw_name = "sys", },
> +		},
> +		.num_parents = 2,
> +		.flags = CLK_SET_PARENT_GATE,
> +	},
> +};
> +
> +static const struct clk_parent_data a9_ao_pclk_parents = { .hw = &a9_ao_sys.hw };
> +
> +#define A9_AO_PCLK(_name, _bit, _flags)		       \
> +	MESON_PCLK(a9_ao_sys_##_name, AO_SYS_CLK0, _bit, \
> +		   &a9_ao_pclk_parents, _flags)
> +
> +/*
> + * A9 integrates a low-power microprocessor (Always-on CPU: AOCPU). Some AO sys
> + * clocks control the AOCPU modules. Mark the AOCPU-related clocks with
> + * CLK_IS_CRITICAL to avoid them being disabled and impacting AOCPU functionality.
> + * AOCPU-related clocks list:
> + * - clktree
> + * - rst_ctrl
> + * - pad
> + * - irq
> + * - pwrctrl
> + * - aocpu
> + * - sram
> + */
> +static A9_AO_PCLK(i2c3,		0,	0);
> +static A9_AO_PCLK(rtc_reg,	1,	0);
> +static A9_AO_PCLK(clktree,	2,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(rst_ctrl,	3,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(pad,		4,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(rtc_dig,	5,	0);
> +static A9_AO_PCLK(irq,		6,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(pwrctrl,	7,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(pwm_a,	8,	0);
> +static A9_AO_PCLK(pwm_b,	9,	0);
> +static A9_AO_PCLK(pwm_c,	10,	0);
> +static A9_AO_PCLK(pwm_d,	11,	0);
> +static A9_AO_PCLK(pwm_e,	12,	0);
> +static A9_AO_PCLK(pwm_f,	13,	0);
> +static A9_AO_PCLK(pwm_g,	14,	0);
> +static A9_AO_PCLK(i2c_a,	15,	0);
> +static A9_AO_PCLK(i2c_b,	16,	0);
> +static A9_AO_PCLK(i2c_c,	17,	0);
> +static A9_AO_PCLK(i2c_d,	18,	0);
> +static A9_AO_PCLK(sed,		19,	0);
> +static A9_AO_PCLK(ir_ctrl,	20,	0);
> +static A9_AO_PCLK(uart_b,	21,	0);
> +static A9_AO_PCLK(uart_c,	22,	0);
> +static A9_AO_PCLK(uart_d,	23,	0);
> +static A9_AO_PCLK(uart_e,	24,	0);
> +static A9_AO_PCLK(spisg_0,	25,	0);
> +static A9_AO_PCLK(rtc_secure,	26,	0);
> +static A9_AO_PCLK(cec,		27,	0);
> +static A9_AO_PCLK(aocpu,	28,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(sram,		29,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(spisg_1,	30,	0);
> +static A9_AO_PCLK(spisg_2,	31,	0);
> +
> +static const struct clk_parent_data a9_ao_pwm_parents[] = {
> +	{ .hw = &a9_ao_xtal.hw },
> +	{ .fw_name = "fdiv5", },
> +	{ .fw_name = "fdiv4", },
> +	{ .fw_name = "fdiv3", }
> +};
> +
> +static A9_COMP_SEL(ao_pwm_a, AO_PWM_CLK_A_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(ao_pwm_a, AO_PWM_CLK_A_CTRL, 0, 8);
> +static A9_COMP_GATE(ao_pwm_a, AO_PWM_CLK_A_CTRL, 8);
> +
> +static A9_COMP_SEL(ao_pwm_b, AO_PWM_CLK_B_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(ao_pwm_b, AO_PWM_CLK_B_CTRL, 0, 8);
> +static A9_COMP_GATE(ao_pwm_b, AO_PWM_CLK_A_CTRL, 8);
> +
> +static A9_COMP_SEL(ao_pwm_c, AO_PWM_CLK_C_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(ao_pwm_c, AO_PWM_CLK_C_CTRL, 0, 8);
> +static A9_COMP_GATE(ao_pwm_c, AO_PWM_CLK_C_CTRL, 8);
> +
> +static A9_COMP_SEL(ao_pwm_d, AO_PWM_CLK_D_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(ao_pwm_d, AO_PWM_CLK_D_CTRL, 0, 8);
> +static A9_COMP_GATE(ao_pwm_d, AO_PWM_CLK_D_CTRL, 8);
> +
> +static A9_COMP_SEL(ao_pwm_e, AO_PWM_CLK_E_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(ao_pwm_e, AO_PWM_CLK_E_CTRL, 0, 8);
> +static A9_COMP_GATE(ao_pwm_e, AO_PWM_CLK_E_CTRL, 8);
> +
> +static A9_COMP_SEL(ao_pwm_f, AO_PWM_CLK_F_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(ao_pwm_f, AO_PWM_CLK_F_CTRL, 0, 8);
> +static A9_COMP_GATE(ao_pwm_f, AO_PWM_CLK_F_CTRL, 8);
> +
> +static A9_COMP_SEL(ao_pwm_g, AO_PWM_CLK_G_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(ao_pwm_g, AO_PWM_CLK_G_CTRL, 0, 8);
> +static A9_COMP_GATE(ao_pwm_g, AO_PWM_CLK_G_CTRL, 8);
> +
> +static struct clk_regmap a9_ao_rtc_dualdiv_in = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = AO_RTC_BY_OSCIN_CTRL0,
> +		.bit_idx = 31,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "ao_rtc_duandiv_in",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_ao_xtal.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static const struct meson_clk_dualdiv_param a9_ao_dualdiv_table[] = {
> +	{ 733, 732, 8, 11, 1 },
> +	{ /* sentinel */ }
> +};
> +
> +static struct clk_regmap a9_ao_rtc_dualdiv_div = {
> +	.data = &(struct meson_clk_dualdiv_data){
> +		.n1 = {
> +			.reg_off = AO_RTC_BY_OSCIN_CTRL0,
> +			.shift   = 0,
> +			.width   = 12,
> +		},
> +		.n2 = {
> +			.reg_off = AO_RTC_BY_OSCIN_CTRL0,
> +			.shift   = 12,
> +			.width   = 12,
> +		},
> +		.m1 = {
> +			.reg_off = AO_RTC_BY_OSCIN_CTRL1,
> +			.shift   = 0,
> +			.width   = 12,
> +		},
> +		.m2 = {
> +			.reg_off = AO_RTC_BY_OSCIN_CTRL1,
> +			.shift   = 12,
> +			.width   = 12,
> +		},
> +		.dual = {
> +			.reg_off = AO_RTC_BY_OSCIN_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.table = a9_ao_dualdiv_table,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "a9_ao_rtc_dualdiv_div",
> +		.ops = &meson_clk_dualdiv_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_ao_rtc_dualdiv_in.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_ao_rtc_dualdiv_sel = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = AO_RTC_BY_OSCIN_CTRL1,
> +		.mask = 0x1,
> +		.shift = 24,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "ao_rtc_dualdiv_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_ao_rtc_dualdiv_div.hw,
> +			&a9_ao_rtc_dualdiv_in.hw,
> +		},
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap a9_ao_rtc_dualdiv = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = AO_RTC_BY_OSCIN_CTRL0,
> +		.bit_idx = 30,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "ao_rtc_dualdiv",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_ao_rtc_dualdiv_sel.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap a9_ao_rtc = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = AO_RTC_BY_OSCIN_CTRL1,
> +		.mask = 0x1,
> +		.shift = 30,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "ao_rtc",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_ao_xtal.hw,
> +			&a9_ao_rtc_dualdiv.hw,
> +		},
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap a9_ao_cec_dualdiv_in = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = AO_CEC_CTRL0,
> +		.bit_idx = 31,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "ao_cec_dualdiv_in",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_ao_xtal.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_ao_cec_dualdiv_div = {
> +	.data = &(struct meson_clk_dualdiv_data){
> +		.n1 = {
> +			.reg_off = AO_CEC_CTRL0,
> +			.shift   = 0,
> +			.width   = 12,
> +		},
> +		.n2 = {
> +			.reg_off = AO_CEC_CTRL0,
> +			.shift   = 12,
> +			.width   = 12,
> +		},
> +		.m1 = {
> +			.reg_off = AO_CEC_CTRL1,
> +			.shift   = 0,
> +			.width   = 12,
> +		},
> +		.m2 = {
> +			.reg_off = AO_CEC_CTRL1,
> +			.shift   = 12,
> +			.width   = 12,
> +		},
> +		.dual = {
> +			.reg_off = AO_CEC_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.table = a9_ao_dualdiv_table,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "ao_cec_dualdiv_div",
> +		.ops = &meson_clk_dualdiv_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_ao_cec_dualdiv_in.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_ao_cec_dualdiv_sel = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = AO_CEC_CTRL1,
> +		.mask = 0x1,
> +		.shift = 24,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "ao_cec_dualdiv_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_ao_cec_dualdiv_div.hw,
> +			&a9_ao_cec_dualdiv_in.hw,
> +		},
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap a9_ao_cec_dualdiv = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = AO_CEC_CTRL0,
> +		.bit_idx = 30,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "ao_cec_dualdiv",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_ao_cec_dualdiv_sel.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap a9_ao_cec = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = AO_CEC_CTRL1,
> +		.mask = 0x1,
> +		.shift = 30,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "ao_cec",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_ao_cec_dualdiv.hw,
> +			&a9_ao_rtc.hw,
> +		},
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_hw *a9_ao_hw_clks[] = {
> +	[CLKID_AO_XTAL_IN]		= &a9_ao_xtal_in.hw,
> +	[CLKID_AO_XTAL]			= &a9_ao_xtal.hw,
> +	[CLKID_AO_SYS]			= &a9_ao_sys.hw,
> +	[CLKID_AO_SYS_I3C]		= &a9_ao_sys_i2c3.hw,
> +	[CLKID_AO_SYS_RTC_REG]		= &a9_ao_sys_rtc_reg.hw,
> +	[CLKID_AO_SYS_CLKTREE]		= &a9_ao_sys_clktree.hw,
> +	[CLKID_AO_SYS_RST_CTRL]		= &a9_ao_sys_rst_ctrl.hw,
> +	[CLKID_AO_SYS_PAD]		= &a9_ao_sys_pad.hw,
> +	[CLKID_AO_SYS_RTC_DIG]		= &a9_ao_sys_rtc_dig.hw,
> +	[CLKID_AO_SYS_IRQ]		= &a9_ao_sys_irq.hw,
> +	[CLKID_AO_SYS_PWRCTRL]		= &a9_ao_sys_pwrctrl.hw,
> +	[CLKID_AO_SYS_PWM_A]		= &a9_ao_sys_pwm_a.hw,
> +	[CLKID_AO_SYS_PWM_B]		= &a9_ao_sys_pwm_b.hw,
> +	[CLKID_AO_SYS_PWM_C]		= &a9_ao_sys_pwm_c.hw,
> +	[CLKID_AO_SYS_PWM_D]		= &a9_ao_sys_pwm_d.hw,
> +	[CLKID_AO_SYS_PWM_E]		= &a9_ao_sys_pwm_e.hw,
> +	[CLKID_AO_SYS_PWM_F]		= &a9_ao_sys_pwm_f.hw,
> +	[CLKID_AO_SYS_PWM_G]		= &a9_ao_sys_pwm_g.hw,
> +	[CLKID_AO_SYS_I2C_A]		= &a9_ao_sys_i2c_a.hw,
> +	[CLKID_AO_SYS_I2C_B]		= &a9_ao_sys_i2c_b.hw,
> +	[CLKID_AO_SYS_I2C_C]		= &a9_ao_sys_i2c_c.hw,
> +	[CLKID_AO_SYS_I2C_D]		= &a9_ao_sys_i2c_d.hw,
> +	[CLKID_AO_SYS_SED]		= &a9_ao_sys_sed.hw,
> +	[CLKID_AO_SYS_IR_CTRL]		= &a9_ao_sys_ir_ctrl.hw,
> +	[CLKID_AO_SYS_UART_B]		= &a9_ao_sys_uart_b.hw,
> +	[CLKID_AO_SYS_UART_C]		= &a9_ao_sys_uart_c.hw,
> +	[CLKID_AO_SYS_UART_D]		= &a9_ao_sys_uart_d.hw,
> +	[CLKID_AO_SYS_UART_E]		= &a9_ao_sys_uart_e.hw,
> +	[CLKID_AO_SYS_SPISG_0]		= &a9_ao_sys_spisg_0.hw,
> +	[CLKID_AO_SYS_RTC_SECURE]	= &a9_ao_sys_rtc_secure.hw,
> +	[CLKID_AO_SYS_CEC]		= &a9_ao_sys_cec.hw,
> +	[CLKID_AO_SYS_AOCPU]		= &a9_ao_sys_aocpu.hw,
> +	[CLKID_AO_SYS_SRAM]		= &a9_ao_sys_sram.hw,
> +	[CLKID_AO_SYS_SPISG_1]		= &a9_ao_sys_spisg_1.hw,
> +	[CLKID_AO_SYS_SPISG_2]		= &a9_ao_sys_spisg_2.hw,
> +	[CLKID_AO_PWM_A_SEL]		= &a9_ao_pwm_a_sel.hw,
> +	[CLKID_AO_PWM_A_DIV]		= &a9_ao_pwm_a_div.hw,
> +	[CLKID_AO_PWM_A]		= &a9_ao_pwm_a.hw,
> +	[CLKID_AO_PWM_B_SEL]		= &a9_ao_pwm_b_sel.hw,
> +	[CLKID_AO_PWM_B_DIV]		= &a9_ao_pwm_b_div.hw,
> +	[CLKID_AO_PWM_B]		= &a9_ao_pwm_b.hw,
> +	[CLKID_AO_PWM_C_SEL]		= &a9_ao_pwm_c_sel.hw,
> +	[CLKID_AO_PWM_C_DIV]		= &a9_ao_pwm_c_div.hw,
> +	[CLKID_AO_PWM_C]		= &a9_ao_pwm_c.hw,
> +	[CLKID_AO_PWM_D_SEL]		= &a9_ao_pwm_d_sel.hw,
> +	[CLKID_AO_PWM_D_DIV]		= &a9_ao_pwm_d_div.hw,
> +	[CLKID_AO_PWM_D]		= &a9_ao_pwm_d.hw,
> +	[CLKID_AO_PWM_E_SEL]		= &a9_ao_pwm_e_sel.hw,
> +	[CLKID_AO_PWM_E_DIV]		= &a9_ao_pwm_e_div.hw,
> +	[CLKID_AO_PWM_E]		= &a9_ao_pwm_e.hw,
> +	[CLKID_AO_PWM_F_SEL]		= &a9_ao_pwm_f_sel.hw,
> +	[CLKID_AO_PWM_F_DIV]		= &a9_ao_pwm_f_div.hw,
> +	[CLKID_AO_PWM_F]		= &a9_ao_pwm_f.hw,
> +	[CLKID_AO_PWM_G_SEL]		= &a9_ao_pwm_g_sel.hw,
> +	[CLKID_AO_PWM_G_DIV]		= &a9_ao_pwm_g_div.hw,
> +	[CLKID_AO_PWM_G]		= &a9_ao_pwm_g.hw,
> +	[CLKID_AO_RTC_DUALDIV_IN]	= &a9_ao_rtc_dualdiv_in.hw,
> +	[CLKID_AO_RTC_DUALDIV_DIV]	= &a9_ao_rtc_dualdiv_div.hw,
> +	[CLKID_AO_RTC_DUALDIV_SEL]	= &a9_ao_rtc_dualdiv_sel.hw,
> +	[CLKID_AO_RTC_DUALDIV]		= &a9_ao_rtc_dualdiv.hw,
> +	[CLKID_AO_RTC]			= &a9_ao_rtc.hw,
> +	[CLKID_AO_CEC_DUALDIV_IN]	= &a9_ao_cec_dualdiv_in.hw,
> +	[CLKID_AO_CEC_DUALDIV_DIV]	= &a9_ao_cec_dualdiv_div.hw,
> +	[CLKID_AO_CEC_DUALDIV_SEL]	= &a9_ao_cec_dualdiv_sel.hw,
> +	[CLKID_AO_CEC_DUALDIV]		= &a9_ao_cec_dualdiv.hw,
> +	[CLKID_AO_CEC]			= &a9_ao_cec.hw,
> +};
> +
> +static const struct meson_clkc_data a9_ao_clkc_data = {
> +	.hw_clks = {
> +		.hws = a9_ao_hw_clks,
> +		.num = ARRAY_SIZE(a9_ao_hw_clks),
> +	},
> +};
> +
> +static const struct of_device_id a9_ao_clkc_match_table[] = {
> +	{
> +		.compatible	= "amlogic,a9-aoclkc",
> +		.data		= &a9_ao_clkc_data,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, a9_ao_clkc_match_table);
> +
> +static struct platform_driver a9_ao_clkc_driver = {
> +	.probe		= meson_clkc_mmio_probe,
> +	.driver		= {
> +		.name	= "a9-aoclkc",
> +		.of_match_table = a9_ao_clkc_match_table,
> +	},
> +};
> +module_platform_driver(a9_ao_clkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic A9 Always-ON Clock Controller driver");
> +MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("CLK_MESON");

-- 
Jerome
