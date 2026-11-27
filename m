Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788112;
	b=s98b3Hf8+xSS7nEfLXb7bG2wem9ReKRgGnthYtRdw+m8VwfneX235bSY2CKUqAmkrDy5
	 bmG4FlC40tjvEnuB+oO20Hc0ZqBuilPsvSZgbXSbH2erkio2OAIDJ7u4msSeSRhRrrVx9
	 v7e9U1hZbUOvDaGppqMDtle+oHRCoL76rr9dH0dgXf/Z0vHdqnHQHtA5OpIQQRRY/PrZD
	 WGjlV8PvcMBApa24b8SEj1EkoD/VfAELeM/HnvlWti1Igz+hqprpzQeOdfIW7l6re6Sa5
	 JgRH7tJmp0IR8o+kzWL6z7tSdwyouOuZLRkUevW9F5yrg2J+o1kHeCMerO74ZJ/zoAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788112;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kPd6TTHPPZF1o4owm+NX+PvKg2IQUY4I29eF/MO8HIQ=;
	b=VrphQk2nkCjbmKTOTuvGrv8NnKnTJRJk8tTql/MXXM+wQdC7rgjOSU3EnKK3EWGwzojG
	 ZBeKBjtBK7ulPre+n7QGJfBUdLfwxemjNTYe+LEBIprjSvUCwOfgLtsvwVEfapLk1aOWV
	 2dQltuDDCmTTTjGC1ECF9MrWtcevgWsMAOI0tPQtNfxsMjikRMa6LF8O5N85n8YeLnqNO
	 5QpECzP9xhwaL3pEDfriemism7DyIxBe942h5RgzE5pSkAFmEyfLq55iRJz2N8/cCXAR6
	 RzhH3ThC7I2Kg+EvZ324mv/g9IYZJlRYZV/cNfbILYMiUVVuG7cmOnB3wjW9g5zTFig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z8v02QAP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F62F606A31C;
	Fri, 27 Nov 2026 14:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z8v02QAP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C901F0089A;
	Fri, 27 Nov 2026 14:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788111;
	bh=kPd6TTHPPZF1o4owm+NX+PvKg2IQUY4I29eF/MO8HIQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z8v02QAPm8lUxNll8MzmgNQeso9m92czo1iF1bUEG/epivqLKj5f8/itDtJmFUknH
	 MkZ3WYctcx3EMVLQ2iLgLloo5yf3UxVI51cjqH9a2yNT3Q30Wr0iNEGNDo6p2OQJMk
	 f54Iq3b4t1tyF8/Qp4/fjx6vZKLJ00Al4DjVY5/Ns+46yVU986Igr+GsetsP7SmC+k
	 dg3RH7IlD0/rhgYBU4uLPOjmY5492Ji5TuYgh7g5m7on0uUQ0frWxwk7Ta/hBMPcqL
	 hKM4/U2rLmlq/7LXYoEoYD0S681du/CqU41YlNb8avGGiz2Zj88ZkR295wvmFODdh5
	 SLmSZUarzcnfQ==
Message-ID: <sashiko-outbox-237529@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/7] media: i2c: add s5k5e8 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hikmah Gumelar" <hikmahgumelar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261127134507.125513-4-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
 <20261127134507.125513-4-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 14:01:50 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] media: i2c: s5k5e8: control writes skipped when !CONFIG_PM in
  s5k5e8_set_ctrl()
- [Low] media: i2c: s5k5e8: unused V4L2_CCI_I2C select and duplicate I2C
  helpers
- [Low] media: i2c: s5k5e8: deprecated s_stream op used instead of
  enable_streams
--

commit f8cb2239802ac8d357b8e34b78a9d168603a7bc8
Author: Hikmah Gumelar <hikmahgumelar@gmail.com>

media: i2c: add s5k5e8 image sensor driver

This commit adds a V4L2 subdevice driver for the Samsung S5K5E8 5MP
MIPI CSI-2 CMOS image sensor.

> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 162b8ea026018..4c622e5eef73f 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -879,6 +879,16 @@ config VIDEO_S5K3M5
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called s5k3m5.
> =20
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
>  config VIDEO_S5K5BAF
>  	tristate "Samsung S5K5BAF sensor support"
>  	help
> diff --git a/drivers/media/i2c/s5k5e8.c b/drivers/media/i2c/s5k5e8.c
> new file mode 100644
> index 0000000000000..d25b978d7eda6
> --- /dev/null
> +++ b/drivers/media/i2c/s5k5e8.c
> @@ -0,0 +1,567 @@

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
Could this driver use the V4L2 CCI helpers (devm_cci_regmap_init_i2c(),
cci_read(), cci_write() and cci_multi_reg_write()) instead of open-coding
raw I2C transfers?  VIDEO_S5K5E8 already selects V4L2_CCI_I2C in Kconfig,
which is currently unused.

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
> +		ret =3D __v4l2_ctrl_modify_range(s5k5e8->exposure, 4, exp_max, 1,
> +					       exp_def);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D pm_runtime_get_if_active(s5k5e8->dev);
> +	if (ret <=3D 0)
> +		return 0;

[Severity: Medium]
Does checking ret <=3D 0 here skip all control register writes when
CONFIG_PM is disabled?

When CONFIG_PM is disabled, pm_runtime_get_if_active() returns -EINVAL, so
s5k5e8_set_ctrl() returns 0 without writing any registers during both
__v4l2_ctrl_handler_setup() and runtime control updates.  Checking
!pm_runtime_get_if_active(s5k5e8->dev) (or using
pm_runtime_get_if_in_use()) allows register writes to proceed when runtime
PM is disabled.

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
Should this driver implement v4l2_subdev_pad_ops.enable_streams and
.disable_streams with v4l2_subdev_s_stream_helper instead of implementing
the deprecated .s_stream callback directly?  Using the pad stream
callbacks with the active subdev state lock also avoids manual
s5k5e8->streaming tracking and the separate s5k5e8->mutex.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127134507.1255=
13-1-hikmahgumelar@gmail.com?part=3D3
