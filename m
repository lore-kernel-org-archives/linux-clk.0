Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442169;
	b=t3NOqI1BNUejcZ5IVTGGV4YgCEW+PnHiIf8HyNz2PlmkO8gV8GGJ2yK/ERMvzwy8MpIe
	 sdqqAhxgUnTZk3yAljiqXPjGXf+pYRyuC5ecVyOroTwEJjm04dW/1ly8RmY8s6kmYWeP0
	 HLocKCPf1nsOMg5Jn1WPoLVxnSvX0+SvJGxQWn+eFTPEUlgdcH6E4/rvPpI5JsB+RceGY
	 b4ZGVz7xgk3kZez6Zy+nuF0G3vFc+8eaNOJdX05T7c5w8K9DrCusuqMjYGjsXIuQ1D1qp
	 Qy+u6wejnAJyv42ynVO25yF4XTRqePxTcHsA0PlI7KAMPPv6gehjDEbDHj1+j6f6lrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Ij5ZTrPk8G8iXLI9NSBhyUCOZ2xz7zXjgCAz0t859Wg=;
	b=NSIJUteRM4SvLvt9IpY+3GiGZ2b7lZ9b3lGilBycsEW1QaTo27ORWnT9NYSI6urR8C8A
	 8v2uOYD+qd0woWuj2KXkWc1rQwAGmlPcY/2aX5DJgUFgsr6OQmamedDXtfqGP+6HPF0HH
	 XayArAJfv+8won2aS8IzIfpsML6Xc7MYaxYddzv6JtOlRhainHE94x4VqKxzkRnMSNTFv
	 uZ8z0KfWRB+lYxIHDzCvcK+SsExVo+wPxQUuZmTT8xVzssXOnBU1mmSZ1pDF/VfuurTmy
	 8gySxXWARCh7vAwQLsbmOZNth176bkJY3IUIhZMwk28EOyHHYNb26xE650pD6XcDyyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jxO2EUN9;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1013606A33E
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 13:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1013606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jxO2EUN9
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so4259255e9.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 05:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795442167; x=1796046967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ij5ZTrPk8G8iXLI9NSBhyUCOZ2xz7zXjgCAz0t859Wg=;
        b=jxO2EUN9OlTiPBr7yHwhvyHwCmIlMfdEtJqtweAuIfcLjVEqm5h5PUf5S0ooYCmHR0
         bhUn+pza0dw0vNqR8tkR9+Py+hHTYvWS2fcw+VNRhLvyWYJcRS+Sgp1AiFLt1tMfu/8v
         dBsGkuTJA4x5M/DshYTETzQXlhQXwjAw4NgS+zcs1pW/3SoLssuI8qsKAMBRMy54uHJ9
         bbVM5B18Bjv8S98i9w0YFMGnAfCz+CbhFbOQqizkdKzcccybXYD7qczOAyA6Vs+Qiatr
         B95SuXoQOIbrBCVEydoO9x7gBBHARAN2EDyviNymcAF8r28I8FoirOZxliq5cGKQ0lGy
         BmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442167; x=1796046967;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ij5ZTrPk8G8iXLI9NSBhyUCOZ2xz7zXjgCAz0t859Wg=;
        b=mXSfm3XQfJgsCB84UJxwThr4umnGB1uMlEpuYkAMgCmi9n4fLHGzhO127tNWyi1r5m
         4Dwg6qjoFr2Qt+XsDALj9FFHHW7LMvzlNOBJLosqvUv19TMjjHGtG7/gG5uGQTlLi3bF
         QqDGHiKPGEGle0dh+Aywm1IqZPKLEbxv2dzieUtoYxAB9ydbj48EpfmNagL+F7+SZE51
         7hYw0fXvCxMLJF1UU0ElZK7wl9ILYG5xuXAcKx8hPDf3BYSzcsRP0Tq6sHtLGWcRHeS+
         6BIXop5SGt0ODQxMu6j1b64M9UNJ24/WXcBR46dCCP25LnS/WxV1z9AgEt/DOGvM/zB6
         Kgog==
X-Forwarded-Encrypted: i=1; AL+hErEbmTkkKg9xTGpM1xRx73w19Y8+NBllI2MMEYwsr6pW8/bizr0x7uLr/MGQq31C8aLvk/yWYOgaTOY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1CEey1J/MW0GXBN8P+VCw/OreQeTioVWFRd+VyN4XmM9jW4q5
	820VtNbgjFa10ecK8/TJHraamzJkjnQlVRtFvAD5lSVrK15sJ2V4yn7bcmUxZIjk/7E=
X-Gm-Gg: AZFdTZfmRba3lx9u/FG2eRWXK3S5WbpK6NdVn/FO6Abp/QNd/CNtUqgB4LxNE0jht+H
	+t2n1R6DSvzMBz+27dQtFB656yAxsDLOm9nbdILhBD/Ui9tneFDFQjKkLjne4mV4ysOZDUWO35o
	AgeGkxH4JI+eWdXZlmSkOmTqyz+BJSkMv3ckJKAk2ZXcXqjgjVEiAQoS8z3ICNoi12H05aQVtW9
	dOVvkWDNxDDHwkkBcWDhPEdpnhaWWsfSAr8ntrXZzOSiRKr56Rech2CchNeLZQ1vE/HA3Wmt0F+
	5Wj7x9PLimaGpt6ECI3SWYPUN8Uwkp+C+s5t9YeDZkwHTwsa6xzt40wnrm4++x1AJk303BCxa5C
	UcaslAgJ/4MDbPBeDLmB95yG/8ZS8Fh5aphY/JP/R3q8xB92ghLuYAY3p4fu63VIHrjD1A0bPHO
	dmkDf04lZkJC7kRF9lT7N7uYJtnMSbGU6LHrA5LONxlY7hq3v4dVqVuiGdtODifMUoNjDWhrnjB
	2QK4Jepefk26Ii42InIE0mMQS/L4aBiigVpJmmxrQoNtlJlsBkf/c2Y/ZGPziY9F66qN6tfaQG6
	7QnHDwzhYN+oT87MEX5goUphuYsA1h9hG+g=
X-Received: by 2002:a05:600c:3ba3:b0:4bb:7571:5743 with SMTP id 5b1f17b1804b1-4bb88813444mr267490555e9.27.1795442167038;
        Mon, 23 Nov 2026 05:56:07 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884a3a3dsm336572585e9.10.2026.11.23.05.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:56:06 -0800 (PST)
Date: Mon, 23 Nov 2026 14:56:04 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hikmah Gumelar <hikmahgumelar@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 3/7] media: i2c: add s5k5e8 image sensor driver
Message-ID: <awRDMjtMC74v5zQq@monoceros>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-4-hikmahgumelar@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="od2jan737ze6e64n"
Content-Disposition: inline
In-Reply-To: <20261123123546.152162-4-hikmahgumelar@gmail.com>


--od2jan737ze6e64n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/7] media: i2c: add s5k5e8 image sensor driver
MIME-Version: 1.0

Hello,

On Mon, Nov 23, 2026 at 07:35:42PM +0700, Hikmah Gumelar wrote:
> diff --git a/drivers/media/i2c/s5k5e8.c b/drivers/media/i2c/s5k5e8.c
> new file mode 100644
> index 000000000000..80931e5a1c6b
> --- /dev/null
> +++ b/drivers/media/i2c/s5k5e8.c
> @@ -0,0 +1,500 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>

<linux/i2c.h> already provides of_device_id, so please drop
<linux/mod_devicetable.h> (which adds a lot of unneeded dependencies).

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
> +#define S5K5E8_MODE_STREAMING		0x01
> +#define S5K5E8_REG_VTS			0x0340
> +#define S5K5E8_REG_EXPOSURE		0x0202
> +#define S5K5E8_REG_ANALOG_GAIN		0x0204
> +#define S5K5E8_REG_TEST_PATTERN		0x0600
> +#define S5K5E8_XVCLK_FREQ		24000000
> +#define S5K5E8_LINK_FREQ_418MHZ		418000000ULL
> +#define S5K5E8_PIXEL_RATE		167200000ULL
> +
> +struct s5k5e8_reg { u16 address;
> +u8 val;
> +};
> +struct s5k5e8_mode {
> +	u32 width, height, hts_def, vts_def, vts_min, num_regs;
> +	const struct s5k5e8_reg *regs;
> +};
> +
> +static const char * const s5k5e8_supply_names[] = { "avdd", "dvdd", "dovdd" };
> +#define S5K5E8_NUM_SUPPLIES ARRAY_SIZE(s5k5e8_supply_names)
> +
> +static const struct s5k5e8_reg s5k5e8_common_regs[] = {
> +	{ 0x0100, 0x00 }, { 0x3906, 0x7e }, { 0x3c01, 0x0f }, { 0x3c14, 0x00 },
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

Is this a reverse engineered table of initial register values? A comment
would be awesome.

> +static const struct s5k5e8_mode supported_modes[] = {
> +	{
> +		.width = 2592, .height = 1944, .hts_def = 2856,
> +		.vts_def = 1968, .vts_min = 1968,
> +		.num_regs = ARRAY_SIZE(s5k5e8_2592x1944_regs),
> +		.regs = s5k5e8_2592x1944_regs,
> +	},
> +};
> +
> [...]
> +static int s5k5e8_enum_frame_size(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state,
> +		struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	if (fse->index >= ARRAY_SIZE(supported_modes) ||
> +	    fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
> +		return -EINVAL;

ARRAY_SIZE(supported_modes) is one. Does supported_modes really need to
be an array?

> +	fse->min_width = fse->max_width = supported_modes[fse->index].width;
> +	fse->min_height = fse->max_height = supported_modes[fse->index].height;
> +	return 0;
> +}
> +
> [...]
> +static int s5k5e8_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct s5k5e8 *s5k5e8;
> +	u32 val = 0;
> +	unsigned int i;
> +	int ret;
> +
> +	s5k5e8 = devm_kzalloc(dev, sizeof(*s5k5e8), GFP_KERNEL);
> +	if (!s5k5e8)
> +		return -ENOMEM;
> +	s5k5e8->dev = dev;
> +	v4l2_i2c_subdev_init(&s5k5e8->sd, client, &s5k5e8_subdev_ops);
> +	s5k5e8->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
> +	if (IS_ERR(s5k5e8->xvclk))
> +		return dev_err_probe(dev, PTR_ERR(s5k5e8->xvclk), "xvclk\n");
> +	clk_set_rate(s5k5e8->xvclk, S5K5E8_XVCLK_FREQ);
> +	s5k5e8->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(s5k5e8->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(s5k5e8->reset_gpio), "reset\n");
> +	for (i = 0; i < S5K5E8_NUM_SUPPLIES; i++)
> +		s5k5e8->supplies[i].supply = s5k5e8_supply_names[i];
> +	ret = devm_regulator_bulk_get(dev, S5K5E8_NUM_SUPPLIES, s5k5e8->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "regulators\n");
> +	ret = s5k5e8_power_on(dev);
> +	if (ret)
> +		return ret;
> +	ret = s5k5e8_read_reg(s5k5e8, S5K5E8_CHIP_ID_REG, 2, &val);
> +	if (ret || val != S5K5E8_CHIP_ID) {
> +		dev_err(dev, "failed to identify s5k5e8 (ret=%d, id=0x%x)\n", ret, val);

Use dev_err_probe() for error messages in the probe function.

> +		ret = ret ? ret : -ENXIO;
> +		goto err_power;
> +	}
> +	dev_info(dev, "identified Samsung S5K5E8 sensor (0x%04x)\n", val);

Degrade to dev_dbg() or drop. Once the driver is considered ok, messages
of this kind only clutter the kernel log with very little value and add
to the boot time.

> +	mutex_init(&s5k5e8->mutex);
> +	s5k5e8->cur_mode = &supported_modes[0];
> +	ret = s5k5e8_init_controls(s5k5e8);
> +	if (ret)
> +		goto err_mutex;
> +	s5k5e8->sd.internal_ops = &s5k5e8_internal_ops;
> +	s5k5e8->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	s5k5e8->sd.entity.ops = &s5k5e8_entity_ops;
> +	s5k5e8->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	s5k5e8->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&s5k5e8->sd.entity, 1, &s5k5e8->pad);
> +	if (ret)
> +		goto err_ctrl;

Use newlines to separate function call + its error handling from the
other code.

> +	s5k5e8->sd.state_lock = &s5k5e8->mutex;
> +	ret = v4l2_subdev_init_finalize(&s5k5e8->sd);
> +	if (ret)
> +		goto err_media;
> +	ret = v4l2_async_register_subdev_sensor(&s5k5e8->sd);
> +	if (ret)
> +		goto err_media;
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +	return 0;
> +err_media: media_entity_cleanup(&s5k5e8->sd.entity);
> +err_ctrl: v4l2_ctrl_handler_free(s5k5e8->sd.ctrl_handler);
> +err_mutex: mutex_destroy(&s5k5e8->mutex);
> +err_power: s5k5e8_power_off(dev);

A label should be on its own line.

> +	return ret;
> +}
> +
> +static void s5k5e8_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct s5k5e8 *s5k5e8 = to_s5k5e8(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> +	mutex_destroy(&s5k5e8->mutex);
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		s5k5e8_power_off(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +}
> +
> +static const struct dev_pm_ops s5k5e8_pm_ops = { SET_RUNTIME_PM_OPS(s5k5e8_power_off,
> +		s5k5e8_power_on, NULL) };

This looks strange. I'd add a \n before SET_RUNTIME_PM_OPS. In general
align continuation lines to the previous opening brace or parenthesis.

> +static const struct of_device_id s5k5e8_of_match[] = { { .compatible = "samsung,s5k5e8" }, { } };

Please fix the layout of this struct. It should look like:

static const struct of_device_id s5k5e8_of_match[] = {
	{ .compatible = "samsung,s5k5e8" },
	{ }
};


> +MODULE_DEVICE_TABLE(of, s5k5e8_of_match);
> +static struct i2c_driver s5k5e8_i2c_driver = {
> +	.driver = { .name = "s5k5e8", .pm = &s5k5e8_pm_ops, .of_match_table = s5k5e8_of_match },
> +	.probe = s5k5e8_probe, .remove = s5k5e8_remove,

This also lacks newlines.

> +};
> +module_i2c_driver(s5k5e8_i2c_driver);
> +MODULE_DESCRIPTION("Samsung S5K5E8 5MP sensor driver");
> +MODULE_LICENSE("GPL");

The same critics apply to (at least) patch #5, too.

Best regards
Uwe

--od2jan737ze6e64n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsERfIACgkQj4D7WH0S
/k6aQwf+IZj2GNT6Pnyg4+VzCfG5XXa2gKc5nz7HLJKLGnhUebr36dGQdI4je8Ve
aAI99ctvkHP51gYEBv7DMXXsGX0YWQmdSRBqZDtZkqhLb7Ym+9w1i8g5Z7by7d1/
EW3aUs70aoa6iXs7GKdpZXgBVIakHhAeX3y2BLkH/RzeoCB3c/JrA3kWh8/bkSSs
rMdybxyI+GyQ0GMC8EgIusYetPTc4NPDjV6W/l/fBmZzDaREdzwUI0egdTm+O16s
8ZchJXgZeKfx17B9OGZ91y9uXE0kEDmcl/4qIHnDtKigfGP/6z6Fwdc/L8C7AGZI
uBAIXDmF0DomZGuRHBfXOpJxe7hvVA==
=9kNX
-----END PGP SIGNATURE-----

--od2jan737ze6e64n--
