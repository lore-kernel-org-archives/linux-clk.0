Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799601;
	b=KZUl97xN5hy4DwTOiJD20qCFc36fHtWVadsgLpEDEAYUOdJ8fZXXxMtmZvTaBAMUMUii
	 lOWbMfMLWQKBkgyAjgd12KlKQ1bBR4hnoBGixvMdPVccN/bxWgxNkZlB5hviwPVb8GrRM
	 vFG/Opn6XZPjQAjbqrmbzBZmIvTDesVaLci8gQ62yqXHcJpJcE9aSjX94p3rpwXJg5LCn
	 9rKpGIcgqRUzfTm5hlUPjlyZMqS4ZLfLJcyyrx0+lq+3rq01ImDzW+/bNXw8mNwRNArXh
	 YkndrD676JQ4Gyt24keL9NbVdhkqPeTK81S43+exiqWYFdLaX96jmEdZqHqn2BT8kHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=j+q9Pl+HbS/InTwJthHaenRguBaH+pMfXVenIDo/BDc=;
	b=4isrt1tr0DLdE60PuZldYRelfTPSUeJATy80awxsE3yYfYaVyQQE2vvNIHpxxcoXsXin
	 qtTWk0+1v1mmQJEF6ZRnmL+90XlZTf6V+f0izAO5FUOx86YvC5Rejc1qudaGzFXuzFkkZ
	 AmxoBrnlL4BQ1xli1UBY1L6mTy6Jxq6xbNtkWyV9ALxzGqSYlv84cOv4Kret1Xmg1a3In
	 OahKjjqaRSFtFwHVUS8yLIv0vl8kz1X//e3XB1t8tairk2tlk60yhimhAJu46UWeSnKZ6
	 TsX+EoWHpLEyEsYysUzzJbsijKHAy/vBXRTrlSjLJfVQs4wLv2+8i6fzKmSxaM+dGPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ATise0C2;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E59606A323
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 17:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E59606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ATise0C2
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab1bb9666aso5647261fa.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 09:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795799598; x=1796404398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j+q9Pl+HbS/InTwJthHaenRguBaH+pMfXVenIDo/BDc=;
        b=ATise0C2zygRkVnxpn+1Gi+wvzEDgRrpYlXsPMFVnxfwFb0qY49ChyMhFagedwTd7C
         jjSKjOm248dCpVusUvOYfdFzbr78C0kpyq2Pp8/1bAM2zRTuxlneQ3ujKVqKpxBMQrvh
         GkXqsFZbRJoIIshL3ynznuBArbx99GiXKbAG+y09VMweTymBKGAEPh+hf5kOtdh76tSQ
         evsiB1kTOgSdcu8JdO4giOZDLdscI8A1y+vRaCfQk2i6k9sZXWdeEanPeJLpvickPIJx
         gTmyNu+sLjEEgHosT7/77fiOtjFIYCItYX+0Q2lLzeKwS5iZMCJM1uYPoAfx+9cAnnoD
         FidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799598; x=1796404398;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+q9Pl+HbS/InTwJthHaenRguBaH+pMfXVenIDo/BDc=;
        b=pzKVuUlvveMJ1bsRA3FQ4CU8KkMmMgqskGra3iiM70bIlD/psTCTcR52Mm+ZZAMhGv
         iONpvcQ1XTFUDMtaoQzGY5/dicyHa795Sd21Cf07rHPlnNI6wNGjOgKrfaB9JVObByMu
         cy3XsTODEhv01GOTVB41GwAwyblTuJmagkw0jL+A5LLy3QFd/b4xDmKbqx3aiB8r5sqa
         UeZRQpLtQSo+wGUlVmedbgztvKtziZLHJ9Wrm9tnstWGPnN4dWB1cfO8S7+8VIUiAAvb
         +q0a1uMTWm7O6uhEbSXP8uaI1v2bsQoHpzy6fNl6ZA0y6HvhQU3aWW2IAmYgbTIIj9TD
         n3uw==
X-Forwarded-Encrypted: i=1; AL+hErGHGRWQWia+m/ShS93CFio78ysWqugz1HJ+3a9TdvR1m2/xW6onkuPQnLSjyxlzz7W6QsxFd7oNTWs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9i4XtxsyXx58MO83ZseQFh7eatjO316+2EwrkOh8fxOI7Vy2u
	AR8r/8JEap5BJOXfD4Y6+zGGNEeN7HswstGG+rEY9ClehHf1AbCTvprSBHchC0esdy4=
X-Gm-Gg: AZFdTZdZ8zIVh1YO3kEMWezm55iW0YiVIhAqpqfJ9ceBkpYKydqV/CFxV5U1q3zfL0h
	2ZR8ISj1vreZ4eCZ539emr9Hfgm/jZjpRb+6H92X9pgFs1aK9vh2pc8jWfLFJfRWBCo0YRX1uoC
	rP1YxWrtJ3i4P8fMTeRCBRmO4HFKXK5WaI8wZN8x/PZhp3ldBMVfRa8+3tQLNHzfBMkbwA74i23
	RIgHstX1IH6uqj2MdGi9HiBo9Ja2ee2jhlxWTl4yO211Dqrp8P7GhzuelKeaDSKvIZIaXQDYVUg
	Fjp29MYDsuhl9B7+GLqSXze9Tj521XFEvLx53VyBxil0bZqK0f1WoQh6Q3WFO1CfvEp65emIlKB
	DoN5pKhDrMvMAzuEloyx/L2pbGyciNT/e57p9oXGhw1GRefbe+PTgMyKlBo1/+DrPYpT3lKE/NS
	b4/GqUyrMoT5PM7YVaUPuH2n1GTPm8PoFppptEpx8zLRCyB3HhcLLBZPt/RPeiW8sEw1q+h7QQT
	78wZE35sZXsOMXl0o/IU7PFSsMPgjTnoZ5k5ef4WOQTgA/6d77DOZsl9Y9gBVxYxoNVI0WayukT
	ppLow2cKt8njLhVmDNfM40aCKWiaRAGduabduSMDxt1xKq0kSO+fFgZPz1Sh5hvWrNFcQGCKmed
	w2dX1lIY=
X-Received: by 2002:a05:6512:1394:b0:5c0:da9:407b with SMTP id 2adb3069b0e04-5c1bc8722ffmr9342169e87.5.1795799598378;
        Fri, 27 Nov 2026 09:13:18 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0419c2sm5950133e87.52.2026.11.27.09.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 09:13:18 -0800 (PST)
Message-ID: <2ed19776-e8ed-438e-b946-7a83d9c318f0@linaro.org>
Date: Fri, 27 Nov 2026 19:13:17 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] media: i2c: add s5k5e8 image sensor driver
To: Hikmah Gumelar <hikmahgumelar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
 <20261127134507.125513-4-hikmahgumelar@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261127134507.125513-4-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/26 15:45, Hikmah Gumelar wrote:
> Add V4L2 subdev driver for the Samsung S5K5E8 5-megapixel MIPI CSI-2
> 
> CMOS image sensor supporting 2592x1944 10-bit Bayer output.
> 
> Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
> ---
>   MAINTAINERS                |   7 +
>   drivers/media/i2c/Kconfig  |  10 +
>   drivers/media/i2c/Makefile |   1 +
>   drivers/media/i2c/s5k5e8.c | 567 +++++++++++++++++++++++++++++++++++++
>   4 files changed, 585 insertions(+)
>   create mode 100644 drivers/media/i2c/s5k5e8.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f72ce07a4e38..2ac245d4ad7c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25007,6 +25007,13 @@ T:	git git://linuxtv.org/media_tree.git
>   F:	Documentation/devicetree/bindings/media/i2c/samsung,s5k3m5.yaml
>   F:	drivers/media/i2c/s5k3m5.c
>   
> +SAMSUNG S5K5E8 CAMERA SENSOR DRIVER
> +M:	Hikmah Gumelar <hikmahgumelar@gmail.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
> +F:	drivers/media/i2c/s5k5e8.c
> +
>   SAMSUNG S5K5BAF CAMERA DRIVER
>   M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
>   M:	Andrzej Hajda <andrzej.hajda@intel.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 162b8ea02601..4c622e5eef73 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -879,6 +879,16 @@ config VIDEO_S5K3M5
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called s5k3m5.
>   
> +config VIDEO_S5K5E8
> +	tristate "Samsung S5K5E8 sensor support"
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a Video4Linux2 sensor-level driver for the Samsung
> +	  S5K5E8 5MP camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called s5k5e8.
> +
>   config VIDEO_S5K5BAF
>   	tristate "Samsung S5K5BAF sensor support"
>   	help
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index a750942e9c62..bdcb8f34aca3 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -136,6 +136,7 @@ obj-$(CONFIG_VIDEO_RDACM21) += rdacm21.o
>   obj-$(CONFIG_VIDEO_RJ54N1) += rj54n1cb0c.o
>   obj-$(CONFIG_VIDEO_S5C73M3) += s5c73m3/
>   obj-$(CONFIG_VIDEO_S5K3M5) += s5k3m5.o
> +obj-$(CONFIG_VIDEO_S5K5E8) += s5k5e8.o
>   obj-$(CONFIG_VIDEO_S5K5BAF) += s5k5baf.o
>   obj-$(CONFIG_VIDEO_S5K6A3) += s5k6a3.o
>   obj-$(CONFIG_VIDEO_S5KJN1) += s5kjn1.o
> diff --git a/drivers/media/i2c/s5k5e8.c b/drivers/media/i2c/s5k5e8.c
> new file mode 100644
> index 000000000000..d25b978d7eda
> --- /dev/null
> +++ b/drivers/media/i2c/s5k5e8.c
> @@ -0,0 +1,567 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/unaligned.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +
> +#define S5K5E8_CHIP_ID_REG		0x0000
> +#define S5K5E8_CHIP_ID			0x5e80
> +#define S5K5E8_REG_MODE_SELECT		0x0100
> +#define S5K5E8_MODE_STANDBY		0x00
> +#define S5K5E8_REG_VTS			0x0340
> +#define S5K5E8_REG_EXPOSURE		0x0202
> +#define S5K5E8_REG_ANALOG_GAIN		0x0204
> +#define S5K5E8_REG_TEST_PATTERN		0x0600
> +#define S5K5E8_XVCLK_FREQ		24000000
> +#define S5K5E8_LINK_FREQ_418MHZ		418000000ULL
> +#define S5K5E8_PIXEL_RATE		167200000ULL
> +
> +struct s5k5e8_reg {
> +	u16 address;
> +	u8 val;
> +};
> +
> +struct s5k5e8_mode {
> +	u32 width, height, hts_def, num_regs;
> +	const struct s5k5e8_reg *regs;
> +};
> +
> +static const char * const s5k5e8_supply_names[] = { "avdd", "dvdd", "dovdd" };
> +#define S5K5E8_NUM_SUPPLIES ARRAY_SIZE(s5k5e8_supply_names)
> +
> +/* Register initialization tables derived from Xiaomi Mi A1 vendor configuration */
> +static const struct s5k5e8_reg s5k5e8_common_regs[] = {
> +	{ 0x0100, 0x00 }, { 0x3906, 0x7e }, { 0x3c01, 0x0f }, { 0x3c14, 0x00 },

You should use CCI interfaces.

Overall perphaps it might be a long and tedious review process for the changes,
and I would recommend to send and get accepted two sensor drivers only, then
do other work.

> +	{ 0x3235, 0x08 }, { 0x3063, 0x2e }, { 0x307a, 0x10 }, { 0x307b, 0x0e },
> +	{ 0x3079, 0x20 }, { 0x3070, 0x05 }, { 0x3067, 0x06 }, { 0x3071, 0x62 },
> +	{ 0x3072, 0x16 }, { 0x3203, 0x43 }, { 0x3205, 0x43 }, { 0x320b, 0x42 },
> +	{ 0x3007, 0x00 }, { 0x3008, 0x14 }, { 0x3020, 0x58 }, { 0x300d, 0x34 },
> +	{ 0x300e, 0x17 }, { 0x3021, 0x02 }, { 0x3010, 0x59 }, { 0x3002, 0x01 },
> +	{ 0x3005, 0x01 }, { 0x3008, 0x04 }, { 0x300f, 0x70 }, { 0x3010, 0x69 },
> +	{ 0x3017, 0x10 }, { 0x3019, 0x19 }, { 0x300c, 0x62 }, { 0x3064, 0x10 },
> +	{ 0x3c08, 0x0e }, { 0x3c09, 0x10 }, { 0x3c31, 0x0d }, { 0x3c32, 0xac },
> +};
> +
> +static const struct s5k5e8_reg s5k5e8_2592x1944_regs[] = {
> +	{ 0x0100, 0x00 }, { 0x0136, 0x18 }, { 0x0137, 0x00 }, { 0x0305, 0x06 },
> +	{ 0x0306, 0x18 }, { 0x0307, 0xa8 }, { 0x0308, 0x34 }, { 0x0309, 0x42 },
> +	{ 0x3c1f, 0x00 }, { 0x3c17, 0x00 }, { 0x3c0b, 0x04 }, { 0x3c1c, 0x47 },
> +	{ 0x3c1d, 0x15 }, { 0x3c14, 0x04 }, { 0x3c16, 0x00 }, { 0x0820, 0x03 },
> +	{ 0x0821, 0x44 }, { 0x0114, 0x01 }, { 0x0344, 0x00 }, { 0x0345, 0x08 },
> +	{ 0x0346, 0x00 }, { 0x0347, 0x08 }, { 0x0348, 0x0a }, { 0x0349, 0x27 },
> +	{ 0x034a, 0x07 }, { 0x034b, 0x9f }, { 0x034c, 0x0a }, { 0x034d, 0x20 },
> +	{ 0x034e, 0x07 }, { 0x034f, 0x98 }, { 0x0900, 0x00 }, { 0x0901, 0x00 },
> +	{ 0x0381, 0x01 }, { 0x0383, 0x01 }, { 0x0385, 0x01 }, { 0x0387, 0x01 },
> +	{ 0x0340, 0x07 }, { 0x0341, 0xb0 }, { 0x0342, 0x0b }, { 0x0343, 0x28 },
> +	{ 0x0200, 0x00 }, { 0x0201, 0x00 }, { 0x0202, 0x03 }, { 0x0203, 0xde },
> +	{ 0x3303, 0x02 }, { 0x3400, 0x00 }, { 0x323b, 0x02 }, { 0x3301, 0x00 },
> +	{ 0x3321, 0x04 }, { 0x3306, 0x00 }, { 0x3307, 0x08 }, { 0x3308, 0x0a },
> +	{ 0x3309, 0x27 }, { 0x330a, 0x01 }, { 0x330b, 0x01 }, { 0x330e, 0x00 },
> +	{ 0x330f, 0x08 }, { 0x3310, 0x07 }, { 0x3311, 0x9f }, { 0x3312, 0x01 },
> +	{ 0x3313, 0x01 },
> +};
> +
> +static const struct s5k5e8_mode default_mode = {
> +		.width = 2592, .height = 1944, .hts_def = 2856,
> +			.num_regs = ARRAY_SIZE(s5k5e8_2592x1944_regs),
> +		.regs = s5k5e8_2592x1944_regs,

There should be an endline after comma.

> +	};
> +
> +static const s64 link_freq_menu_items[] = { S5K5E8_LINK_FREQ_418MHZ };
> +
> +struct s5k5e8 {
> +	struct device *dev;
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +	struct clk *xvclk;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[S5K5E8_NUM_SUPPLIES];
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_ctrl *link_freq, *hblank, *exposure;
> +	const struct s5k5e8_mode *cur_mode;
> +	/* Serialize access to sensor registers and streaming state */
> +	struct mutex mutex;
> +	bool streaming;
> +};
> +
> +static inline struct s5k5e8 *to_s5k5e8(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct s5k5e8, sd);
> +}
> +
> +static int s5k5e8_read_reg(struct s5k5e8 *s5k5e8, u16 reg, u32 len, u32 *val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&s5k5e8->sd);
> +	struct i2c_msg msgs[2];
> +	u8 addr_buf[2], data_buf[4] = { 0 };
> +	int ret;
> +
> +	put_unaligned_be16(reg, addr_buf);
> +	msgs[0].addr = client->addr;
> +	msgs[0].flags = 0;
> +	msgs[0].len = 2;
> +	msgs[0].buf = addr_buf;
> +	msgs[1].addr = client->addr;
> +	msgs[1].flags = I2C_M_RD;
> +	msgs[1].len = len;
> +	msgs[1].buf = &data_buf[4 - len];
> +	ret = i2c_transfer(client->adapter, msgs, 2);
> +	if (ret != 2)
> +		return ret < 0 ? ret : -EIO;
> +	*val = get_unaligned_be32(data_buf);
> +	return 0;
> +}

Remove it, and use CCI interfaces.

-- 
Best wishes,
Vladimir
