Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449193;
	b=Fkbdb3CERdYsCKSaMahkJjBcdCu0jiW2Hn94vOMhgifd19GXD+U+tPpT71qF+zVYHe9K
	 whcTUnTl/P3V+cHHNd6wR+BAsxoJNCPgtcgLUCK8Ks2TnKHzSywS5XPuTMvDsZydWTvzr
	 Ssf+sHIbHYHRkwJxEZ6/ykrxpA71A+23BgWaB2Co18E5Pv8g4XjdRAWL9nwwpevBIllJa
	 q9vcTvzXSHkeLu/ufaKERwjgpuNZs0yyX3AAzgIPpRncX++b8BZLmekfhElyXoQFvrE/3
	 3UlntVtpm8cDGmIqyNctxo7TuDTgRrqdrMlOJYzBZEOEyCeXW7OD3RoIqhp11mof9qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449193;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=R/1fLmFbgT002PXn1aeMY7Cu0A0+94Cce08S+dlkvJc=;
	b=UjYv4Q1xxOLpd5Lj52NpeMI8eLzi6t71YXMB+FMAJI4AfHSE5fSV4PccV6icVJ9W9JvR
	 1fTfQMTEk/dSZJ4CxAnNufWqI8moUEpS7gleicFpFBWE7xZcj10m66YYVKZ8DYKBVgTZb
	 YoW3uD6l/OqumgFeghjASHg9bI3SFN/3EfgDQ9ackfRYBD7eruygVlhhoNx1d9Vsm3vC2
	 WJaW2Oj7vC+xrLutGIns+Cx26URs11cJVXkkJKkS+XX0Hdz9v5INihM/yQlQqEVN7PF3E
	 VJUI9RcRPacfft4MGKdsRBEZgCrHW4gjA2IebJ/6+aMSw7aqFuvix1rvUceGRNY69lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WOMapCp3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D88606A31E;
	Mon, 23 Nov 2026 15:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WOMapCp3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEC81F000EB;
	Mon, 23 Nov 2026 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449193;
	bh=R/1fLmFbgT002PXn1aeMY7Cu0A0+94Cce08S+dlkvJc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WOMapCp3HloEl1FAo081jHo7o6QZqFTlW5sBEd2VI5+aQ6rAopj+HJQGS+9+Q2K+C
	 N5qs50FzjL21clVyZCn26mKtsN2jUJ0ALGZvJ/hCPQts/Nmqfp3t3ses2V5YJd3R+b
	 ta4I4zQMqNOHovErellbXl6YracOsvSm773Gcto4y02FaZO8QBCiiGoSJX2/qxfh3B
	 J9QHb6NkJshgE/+klSI9gUe2kZy4kQp/b0Li36AtWaUoV1kqEzy02WKzwEyI7OKCBP
	 DXKaxzMrvjftH6LQLXSQktDeJS2c2sPV7LRIUeL4CT0NkwjWED4auZkdzO+ckLWm/b
	 /NXqOhJBZSUGQ==
Message-ID: <sashiko-outbox-229619@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/7] media: i2c: add s5k5e8 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hikmah Gumelar" <hikmahgumelar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261123152722.168879-4-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-4-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:53:12 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 8 potential
issues to consider:
- [Medium] media: i2c: s5k5e8: broken !PM check and unchecked range
  update in s5k5e8_set_ctrl()
- [Medium] media: i2c: s5k5e8: skipped startup delay in
  s5k5e8_power_on() without reset_gpio
- [Medium] media: i2c: s5k5e8: unset colorimetry and missing stream
  check in s5k5e8_set_format()
- [Low] media: i2c: s5k5e8: explicit clk_set_rate() call in
  s5k5e8_probe()
- [Low] media: i2c: s5k5e8: open-coded CCI I2C helpers instead of
  v4l2-cci framework
- [Low] media: i2c: s5k5e8: legacy s_stream and manual mutex/streaming
  state
- [Low] media: i2c: s5k5e8: redundant Kconfig selects, unsorted entries,
  no MAINTAINERS
- [Low] media: i2c: s5k5e8: unused definitions, indentation issues, and
  redundant Kconfig
--

commit 282d70890b56a8ec58d98af6f85d1c752c59afcd
Author: Hikmah Gumelar <hikmahgumelar@gmail.com>

media: i2c: add s5k5e8 image sensor driver

This commit adds a V4L2 subdevice driver for the Samsung S5K5E8 5-megapixel
MIPI CSI-2 CMOS image sensor.

> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 9e42b380e3f20..fb6bb91f897cb 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -881,6 +881,19 @@ config VIDEO_S5K3M5
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called s5k3m5.
> =20
> +config VIDEO_S5K5E8
> +	tristate "Samsung S5K5E8 sensor support"
> +	depends on I2C && VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select V4L2_FWNODE
> +	help
> +	  This is a Video4Linux2 sensor-level driver for the Samsung
> +	  S5K5E8 5-megapixel MIPI CSI-2 CMOS image sensor.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called s5k3m5.
> +
>  config VIDEO_S5K5BAF
>  	tristate "Samsung S5K5BAF sensor support"
>  	help
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 604b19dbc7b75..7be5217889916 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -137,6 +137,7 @@ obj-$(CONFIG_VIDEO_RDACM21) +=3D rdacm21.o
>  obj-$(CONFIG_VIDEO_RJ54N1) +=3D rj54n1cb0c.o
>  obj-$(CONFIG_VIDEO_S5C73M3) +=3D s5c73m3/
>  obj-$(CONFIG_VIDEO_S5K3M5) +=3D s5k3m5.o
> +obj-$(CONFIG_VIDEO_S5K5E8) +=3D s5k5e8.o
>  obj-$(CONFIG_VIDEO_S5K5BAF) +=3D s5k5baf.o
>  obj-$(CONFIG_VIDEO_S5K6A3) +=3D s5k6a3.o
>  obj-$(CONFIG_VIDEO_S5KJN1) +=3D s5kjn1.o

[Severity: Low]
This isn't a bug, but VIDEO_S5K5E8 is inside the if VIDEO_DEV and
if VIDEO_CAMERA_SENSOR blocks in drivers/media/i2c/Kconfig, which already
depend on I2C and select MEDIA_CONTROLLER, VIDEO_V4L2_SUBDEV_API and
V4L2_FWNODE.  Also, VIDEO_S5K5E8 and s5k5e8.o are placed before
VIDEO_S5K5BAF / s5k5baf.o instead of in alphabetical order, and no
MAINTAINERS entry is added for the new driver.

> diff --git a/drivers/media/i2c/s5k5e8.c b/drivers/media/i2c/s5k5e8.c
> new file mode 100644
> index 0000000000000..b4f0783593e93
> --- /dev/null
> +++ b/drivers/media/i2c/s5k5e8.c
> @@ -0,0 +1,555 @@
[ ... ]
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

[Severity: Low]
This isn't a bug, but there are a few unused definitions and indentation
issues in this driver:

- S5K5E8_MODE_STREAMING is unused because stream_on_regs[] hardcodes
  { 0x0100, 0x01 }.
- vts_def and vts_min in struct s5k5e8_mode are never read because
  s5k5e8_init_controls() hardcodes 24 for V4L2_CID_VBLANK, and pixel_rate
  and vblank in struct s5k5e8 are assigned in s5k5e8_init_controls() but
  never read.
- struct s5k5e8_reg and the break statements in s5k5e8_set_ctrl() have
  broken indentation.

[ ... ]

> +static int s5k5e8_read_reg(struct s5k5e8 *s5k5e8, u16 reg, u32 len, u32 =
*val)
> +{
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&s5k5e8->sd);
> +	struct i2c_msg msgs[2];
> +	u8 addr_buf[2], data_buf[4] =3D { 0 };
> +	int ret;
> +
> +	put_unaligned_be16(reg, addr_buf);
> +	msgs[0].addr =3D client->addr;
> +	msgs[0].flags =3D 0;
> +	msgs[0].len =3D 2;
> +	msgs[0].buf =3D addr_buf;
> +	msgs[1].addr =3D client->addr;
> +	msgs[1].flags =3D I2C_M_RD;
> +	msgs[1].len =3D len;
> +	msgs[1].buf =3D &data_buf[4 - len];
> +	ret =3D i2c_transfer(client->adapter, msgs, 2);
> +	if (ret !=3D 2)
> +		return ret < 0 ? ret : -EIO;
> +	*val =3D get_unaligned_be32(data_buf);
> +	return 0;
> +}
> +
> +static int s5k5e8_write_reg(struct s5k5e8 *s5k5e8, u16 reg, u32 len, u32=
 val)
> +{
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&s5k5e8->sd);
> +	u8 buf[6];
> +	int ret;
> +
> +	put_unaligned_be16(reg, buf);
> +	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
> +	ret =3D i2c_master_send(client, buf, len + 2);
> +	return ret =3D=3D len + 2 ? 0 : (ret < 0 ? ret : -EIO);
> +}
> +
> +static int s5k5e8_write_regs(struct s5k5e8 *s5k5e8, const struct s5k5e8_=
reg *regs, u32 len)
> +{
> +	u32 i;
> +	int ret;
> +
> +	for (i =3D 0; i < len; i++) {
> +		ret =3D s5k5e8_write_reg(s5k5e8, regs[i].address, 1, regs[i].val);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}

[Severity: Low]
Could this use the v4l2-cci framework (select V4L2_CCI_I2C in Kconfig,
devm_cci_regmap_init_i2c(), cci_read(), cci_write() and
cci_multi_reg_write()) instead of open-coding 16-bit big-endian I2C register
accessors?  Similarly, s5k5e8_probe() could use v4l2_link_freq_to_bitmap()
to validate link-frequencies.

> +
> +static int s5k5e8_power_on(struct device *dev)
> +{
> +	struct s5k5e8 *s5k5e8 =3D to_s5k5e8(dev_get_drvdata(dev));
> +	int ret =3D regulator_bulk_enable(S5K5E8_NUM_SUPPLIES, s5k5e8->supplies=
);
> +
> +	if (ret)
> +		return ret;
> +	ret =3D clk_prepare_enable(s5k5e8->xvclk);
> +	if (ret) {
> +		regulator_bulk_disable(S5K5E8_NUM_SUPPLIES, s5k5e8->supplies);
> +		return ret;
> +	}
> +	if (s5k5e8->reset_gpio) {
> +		gpiod_set_value_cansleep(s5k5e8->reset_gpio, 1);
> +		usleep_range(1000, 2000);
> +		gpiod_set_value_cansleep(s5k5e8->reset_gpio, 0);
> +		usleep_range(3000, 5000);
> +	}
> +	return 0;
> +}

[Severity: Medium]
Does s5k5e8_power_on() skip the 3-5 ms post-power-on stabilization delay
when the optional reset_gpio is NULL?  On boards without reset-gpios,
s5k5e8_power_on() returns immediately after clk_prepare_enable() and
s5k5e8_probe() issues an I2C read of S5K5E8_CHIP_ID_REG with no startup
delay (and gpiod_set_value_cansleep() already accepts a NULL descriptor).

[ ... ]

> +static int s5k5e8_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct s5k5e8 *s5k5e8 =3D container_of(ctrl->handler, struct s5k5e8, ct=
rl_handler);
> +	int ret =3D 0;
> +
> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +		s64 exp_max =3D s5k5e8->cur_mode->height + ctrl->val - 4;
> +		s64 exp_def =3D min_t(s64, 1960, exp_max);
> +
> +		__v4l2_ctrl_modify_range(s5k5e8->exposure, 4, exp_max, 1, exp_def);
> +	}
> +
> +	if (pm_runtime_get_if_in_use(s5k5e8->dev) <=3D 0)
> +		return 0;

[Severity: Medium]
Does checking pm_runtime_get_if_in_use(s5k5e8->dev) <=3D 0 skip all control
register writes when CONFIG_PM is disabled?

When CONFIG_PM is disabled (or runtime PM is disabled on the device),
pm_runtime_get_if_in_use() returns -EINVAL, so s5k5e8_set_ctrl() returns 0
without writing S5K5E8_REG_ANALOG_GAIN, S5K5E8_REG_EXPOSURE,
S5K5E8_REG_VTS or S5K5E8_REG_TEST_PATTERN even during stream start via
__v4l2_ctrl_handler_setup().  Using pm_runtime_get_if_active() (or checking
pm_runtime_get_if_in_use() =3D=3D 0) allows writes to proceed when runtime =
PM is
disabled.  Also, the return value of __v4l2_ctrl_modify_range() above is
ignored.

[ ... ]

> +static void s5k5e8_update_pad_format(const struct s5k5e8_mode *mode,
> +		struct v4l2_mbus_framefmt *fmt)
> +{
> +	fmt->width =3D mode->width;
> +	fmt->height =3D mode->height;
> +	fmt->code =3D MEDIA_BUS_FMT_SGRBG10_1X10;
> +	fmt->field =3D V4L2_FIELD_NONE;
> +	fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
> +}
> +
> +static int s5k5e8_set_format(struct v4l2_subdev *sd,
> +			     const struct v4l2_subdev_client_info *ci,
> +			     struct v4l2_subdev_state *sd_state,
> +			     struct v4l2_subdev_format *fmt)
> +{
> +	struct s5k5e8 *s5k5e8 =3D to_s5k5e8(sd);
> +
> +	s5k5e8_update_pad_format(&supported_modes[0], &fmt->format);
> +	*v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->format;
> +	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> +		s5k5e8->cur_mode =3D &supported_modes[0];
> +
> +	return 0;
> +}

[Severity: Medium]
Does s5k5e8_update_pad_format() leave fmt->ycbcr_enc, fmt->quantization and
fmt->xfer_func uninitialized?  In VIDIOC_SUBDEV_S_FMT, any arbitrary values
passed by userspace in those fields are copied directly into the subdev pad
state.  Also, when fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE,
s5k5e8_set_format() does not check if the sensor is streaming and return
-EBUSY.

[ ... ]

> +static int s5k5e8_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct s5k5e8 *s5k5e8 =3D to_s5k5e8(sd);
> +	int ret =3D 0;
> +
> +	mutex_lock(&s5k5e8->mutex);
> +	if (s5k5e8->streaming =3D=3D enable) {
> +		mutex_unlock(&s5k5e8->mutex);
> +		return 0;
> +	}
[ ... ]
> +static const struct v4l2_subdev_video_ops s5k5e8_video_ops =3D { .s_stre=
am =3D s5k5e8_set_stream };

[Severity: Low]
Could this driver implement .enable_streams and .disable_streams in
s5k5e8_pad_ops with .s_stream =3D v4l2_subdev_s_stream_helper instead of
open-coding .s_stream and s5k5e8->streaming?  With active subdev state
management, s5k5e8->sd.state_lock can also be aliased directly to
s5k5e8->ctrl_handler.lock, dropping the separate s5k5e8->mutex.

[ ... ]

> +	s5k5e8->xvclk =3D devm_v4l2_sensor_clk_get(dev, NULL);
> +	if (IS_ERR(s5k5e8->xvclk))
> +		return dev_err_probe(dev, PTR_ERR(s5k5e8->xvclk), "failed to get xvclk=
\n");
> +
> +	ret =3D clk_set_rate(s5k5e8->xvclk, S5K5E8_XVCLK_FREQ);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to set xvclk rate\n");
> +
> +	if (clk_get_rate(s5k5e8->xvclk) !=3D S5K5E8_XVCLK_FREQ)
> +		return dev_err_probe(dev, -EINVAL, "unexpected xvclk rate\n");

[Severity: Low]
Should clk_set_rate() be dropped here?  devm_v4l2_sensor_clk_get() already
handles setting the clock rate on non-OF platforms while leaving OF clock
rate assignment to firmware (assigned-clock-rates), so camera sensor drivers
should only check clk_get_rate().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123152722.1688=
79-1-hikmahgumelar@gmail.com?part=3D3
