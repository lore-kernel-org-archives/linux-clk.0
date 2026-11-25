Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610683;
	b=SUZDY135wcWQycMT5fEPE9ehXy2t/Q8GKMs7GIoAfhui9RLniOvrdOZaCAqeKU5071vn
	 NL1b7cyIahT7OxVtblUxuLBpIoLjmx4doBtjj0EDWwgfsRO4DOTecEml2SKwK+QOvE80h
	 qYtFdVCmnqk6iiivn6z2NE5vkrOZrpWV6uqjWQScT8HNssmYNPa+IdYuQ4woND8ATgZJX
	 RGUoumVf1a5fqhOcR/XyLu4GP2VLUKyO6ww/9goHI1YX94LaBkbSFVHQ1T/hV3+n1KrUV
	 Jl5zTq6TwVGcEIxBT80kmcwMGAhoYuqxKQBzAmn6YjRKdxUMMUCNpdpMf7ne2RunVAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610683;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZLTjpd3XnUz/ZzSdq2po/3f2k3GzMZNRz6Dm1JnltU0=;
	b=EzdW1m/n1tHdrAAZw0SRmK5dCwR3CF18SZUq7heN2NBqHpEnz8RsHM5Bo/79so39AGhP
	 W5id1W8kG6nsCYYD/UqImV9zYqVkMmhJMcCg+ZvWbU+jYEKJfpjSysZx0O1470ECc7gM8
	 nY5e+ujj/75vRVzpq0VB0AmlWtV0bhpZcGDdCaD/JkrnmL3QBvQqDAhTyCJ5Ckkxro2Dn
	 Zx3OT6RRdhgiGa3GH9kZ0QUsmQ9ElPWwLOvez6VcDSQGEAFZFjADqe3vaWgydzkP4zx14
	 szkdnMg6ltyB7TFCbtpbnhNZvcFbAd0BQYbKoj7Ow1C4zBmsUSeLRLDoDW7hPFvKpsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GkPMAE1Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10D1606A331;
	Wed, 25 Nov 2026 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GkPMAE1Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE151F000EE;
	Wed, 25 Nov 2026 12:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795610683;
	bh=ZLTjpd3XnUz/ZzSdq2po/3f2k3GzMZNRz6Dm1JnltU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GkPMAE1YxeFme44nFrBRNYInCnG0T1m2dCn8biKIXNplTRYgVkpWJwfasvnspvFcg
	 wWWya0CEe2UCVoTB2RpJFJPqMxSoq3kR9p2A6Jh1MXBBJySx84TgSZ0l8Fv3zoyFDB
	 2OB/JFlHxIuUOIV3/6v9w1kRxNcicKi2hxuU1NnVvenCK/hdj3T8VlqZcsl6TRvxP8
	 AcQkD0gGx8kWmcwaSXK48Ovk2aIHVcy6fejoquPA6qgsqPY52YiNyGl39cWtkRHXmb
	 1yF+jbDSvDXVIIgoxL09PfBMqduTIPTUNa2FVnqEGSwRIpwHzxiCeLv3YVve6hxEmM
	 Y/fqwPhoBgtvw==
Message-ID: <sashiko-outbox-233389@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] media: i2c: add s5k5e8 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hikmah Gumelar" <hikmahgumelar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261125123146.379057-4-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
 <20261125123146.379057-4-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 12:44:42 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] media: i2c: Kconfig: unintended removal of select V4L2_CCI_I2C
  from 53 drivers
- [High] media: i2c: premature VIDEO_OV12A10 Kconfig and Makefile
  entries without ov12a10.c
- [High] media: i2c: s5k5e8: missing VIDEO_S5K5E8 Kconfig entry and
  MAINTAINERS entry
- [Low] media: i2c: s5k5e8: open-coded CCI I2C helpers instead of
  v4l2-cci framework
- [Low] media: i2c: s5k5e8: legacy s_stream and manual mutex/streaming
  state
- [Low] media: i2c: s5k5e8: malformed indentation in default_mode and
  s5k5e8_set_ctrl()
--

commit f9317782624ff79a943a965105715454acccfd55
Author: Hikmah Gumelar <hikmahgumelar@gmail.com>

media: i2c: add s5k5e8 image sensor driver

This commit adds a V4L2 subdevice driver for the Samsung S5K5E8 5-megapixel
MIPI CSI-2 CMOS image sensor.

> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 162b8ea026018..4ac9545f1581f 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -43,7 +43,6 @@ config VIDEO_CCS_PLL
> =20
>  config VIDEO_ALVIUM_CSI2
>  	tristate "Allied Vision ALVIUM MIPI CSI-2 camera support"
> -	select V4L2_CCI_I2C
>  	help
>  	  This is a Video4Linux2 sensor-level driver for the Allied Vision
>  	  ALVIUM camera connected via MIPI CSI-2 interface.
> @@ -62,7 +61,6 @@ config VIDEO_AR0521
> =20
>  config VIDEO_GC0308
>  	tristate "GalaxyCore GC0308 sensor support"
> -	select V4L2_CCI_I2C
>  	help
>  	  This is a Video4Linux2 sensor driver for the GalaxyCore
>  	  GC0308 camera.

[Severity: High]
Were these select V4L2_CCI_I2C lines removed by mistake from 53 existing
drivers in drivers/media/i2c/Kconfig?

V4L2_CCI_I2C is a promptless helper symbol, and devm_cci_regmap_init_i2c()
is only declared and compiled when CONFIG_V4L2_CCI_I2C is enabled. Without
these selects, any build that enables one of the 53 CCI-based drivers while
CONFIG_VIDEO_CCS is disabled fails with an implicit declaration of
devm_cci_regmap_init_i2c() and undefined references to the cci_*() helpers.

[ ... ]

> @@ -538,6 +506,15 @@ config VIDEO_OV08X40
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called ov08x40.
> =20
> +config VIDEO_OV12A10
> +	tristate "OmniVision OV12A10 sensor support"
> +	help
> +	  This is a Video4Linux2 sensor-level driver for the OmniVision
> +	  OV12A10 12-megapixel MIPI CSI-2 CMOS image sensor.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called ov12a10.
> +
>  config VIDEO_OV13858
>  	tristate "OmniVision OV13858 sensor support"
>  	help

[ ... ]

> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index a750942e9c620..1ae704f57468c 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -99,6 +99,7 @@ obj-$(CONFIG_VIDEO_OV02E10) +=3D ov02e10.o
>  obj-$(CONFIG_VIDEO_OV05C10) +=3D ov05c10.o
>  obj-$(CONFIG_VIDEO_OV08D10) +=3D ov08d10.o
>  obj-$(CONFIG_VIDEO_OV08X40) +=3D ov08x40.o
> +obj-$(CONFIG_VIDEO_OV12A10) +=3D ov12a10.o
>  obj-$(CONFIG_VIDEO_OV13858) +=3D ov13858.o
>  obj-$(CONFIG_VIDEO_OV13B10) +=3D ov13b10.o
>  obj-$(CONFIG_VIDEO_OV2640) +=3D ov2640.o

[Severity: High]
Does adding VIDEO_OV12A10 to Kconfig and Makefile here break the build when
CONFIG_VIDEO_OV12A10 is enabled?

drivers/media/i2c/ov12a10.c is not added until the later commit "media:
i2c: add ov12a10 image sensor driver" in this series, so enabling
CONFIG_VIDEO_OV12A10 at this commit fails with no rule to make target
drivers/media/i2c/ov12a10.o.

> @@ -137,6 +138,7 @@ obj-$(CONFIG_VIDEO_RJ54N1) +=3D rj54n1cb0c.o
>  obj-$(CONFIG_VIDEO_S5C73M3) +=3D s5c73m3/
>  obj-$(CONFIG_VIDEO_S5K3M5) +=3D s5k3m5.o
>  obj-$(CONFIG_VIDEO_S5K5BAF) +=3D s5k5baf.o
> +obj-$(CONFIG_VIDEO_S5K5E8) +=3D s5k5e8.o
>  obj-$(CONFIG_VIDEO_S5K6A3) +=3D s5k6a3.o
>  obj-$(CONFIG_VIDEO_S5KJN1) +=3D s5kjn1.o
>  obj-$(CONFIG_VIDEO_S5KJN5) +=3D s5kjn5.o

[Severity: High]
Is a config VIDEO_S5K5E8 entry missing from drivers/media/i2c/Kconfig?

Without a VIDEO_S5K5E8 symbol in Kconfig, CONFIG_VIDEO_S5K5E8 can never be
enabled and drivers/media/i2c/s5k5e8.c is never compiled. An entry in
MAINTAINERS is also missing for the new driver.

> diff --git a/drivers/media/i2c/s5k5e8.c b/drivers/media/i2c/s5k5e8.c
> new file mode 100644
> index 0000000000000..d25b978d7eda6
> --- /dev/null
> +++ b/drivers/media/i2c/s5k5e8.c

[ ... ]

> +static const struct s5k5e8_mode default_mode =3D {
> +		.width =3D 2592, .height =3D 1944, .hts_def =3D 2856,
> +			.num_regs =3D ARRAY_SIZE(s5k5e8_2592x1944_regs),
> +		.regs =3D s5k5e8_2592x1944_regs,
> +	};

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
Could this driver use the V4L2 CCI regmap helpers (devm_cci_regmap_init_i2c=
(),
cci_read(), cci_write(), and cci_multi_reg_write()) instead of open-coding
16-bit big-endian I2C register access in s5k5e8_read_reg(),
s5k5e8_write_reg(), and s5k5e8_write_regs()? Also, s5k5e8_probe() can use
v4l2_link_freq_to_bitmap() to validate the link frequency.

[ ... ]

> +	switch (ctrl->id) {
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret =3D s5k5e8_write_reg(s5k5e8, S5K5E8_REG_ANALOG_GAIN, 2, ctrl->val);
> +	break;
> +	case V4L2_CID_EXPOSURE:
> +		ret =3D s5k5e8_write_reg(s5k5e8, S5K5E8_REG_EXPOSURE, 2, ctrl->val);
> +	break;
> +	case V4L2_CID_VBLANK:
> +		ret =3D s5k5e8_write_reg(s5k5e8, S5K5E8_REG_VTS, 2,
> +				       s5k5e8->cur_mode->height + ctrl->val);
> +	break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret =3D s5k5e8_write_reg(s5k5e8, S5K5E8_REG_TEST_PATTERN, 2, ctrl->val=
);
> +	break;
> +	}

[Severity: Low]
This isn't a bug, but the break statements in s5k5e8_set_ctrl() are aligned
with the case labels, and the fields and closing brace in default_mode above
have inconsistent indentation.

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
Should this implement .enable_streams and .disable_streams in s5k5e8_pad_ops
with .s_stream =3D v4l2_subdev_s_stream_helper instead of wiring a custom
.s_stream callback and tracking s5k5e8->streaming manually? Aliasing
s5k5e8->sd.state_lock to s5k5e8->ctrl_handler.lock would also avoid the need
for a separate s5k5e8->mutex.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125123146.3790=
57-1-hikmahgumelar@gmail.com?part=3D3
