Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787986;
	b=lDvvOnZb0FCLK4BYzD6VAIBCRk9BLHPc6tc57GYQ6SrKKQQ7d9nejf+hzVQRJ/7LDOCA
	 d6/OAMeOR6zMQD6oBVttkH071tmTjYUv9MxpYTaOgwUKI+aWCbPpGptWYJhHghBehTcH8
	 3p519Nkq/8wKnxrTa1I9EOLUrd2wGO65lA8EhpcEGCkNmR7xEcB/zvATcO/u4sfBo3u8Q
	 AuidMs0j7JEElIhC3vGyMwbwf6x+XiFwXFjYhQY6W6f98In72Oi0tocSNUlzJEPXYWNLg
	 1htCSl3Ff+7Kz4xaIuU25tHviWrziSoYy67X45AxnZDC3kj+/0r5ZtIzKB8ytdwTAcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787986;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=joBQGaVGzM4ICcPvegBww9ZWFSucrUXQglmcNWxdBgE=;
	b=mIqUmTB2mBdvtl1zAxT0+z9poCPZGmzjReDqc3tMc1Ko4JSJ6TShwqZnYVz0vhd8YWZR
	 FqikV59JTza06lYx92p6B0Iq4xpePC4XaCLxi0GYD8kyt0KqAYI5aAiS7JCY3XHF5S1B0
	 LC9cFRwwsUz6at6FxQYBEVAbq4vwwYCMhXLIOMYNuwm+TTxZ/im5Mmwlhx2YzrAJB5DEl
	 0ldoL8TQx8IFmluGpPz5dFOitp838hiNMBsrjZS5KBFVljByr5V0Xtj8CAHs7jYeprpGZ
	 mQc+mkrDjA+NGieqig71GoKkh/qWK6iZmu2c5j8Z8o8Mi6naM2dLgRMEj+4/2cmHX0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KPTo+nVq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA64606A326;
	Fri, 27 Nov 2026 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KPTo+nVq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86EF11F0089C;
	Fri, 27 Nov 2026 13:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795787985;
	bh=joBQGaVGzM4ICcPvegBww9ZWFSucrUXQglmcNWxdBgE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KPTo+nVqX64oLBlSHSrRIrhorCvdbR8lSFbLwJMPtwxuKDgITBVKJJlv6XpEgsDWi
	 Yio//ts6iq8UQ+c5n3Vp0tCWqkhnfb2fFlY+bghxldv65Fop6zW4uuKSxBKxu4U03z
	 WsPkgWd9bWtkrOA7EjFr6L0WQUi2x5aS0dPsgTOZOjNt45PVzam0jHSqjHycPAyCWE
	 bb1Jo21jcAhTY3p86rXRJ19pzWCAh5I86ThmI8Rnfgi2mH+/+ewr9SXHVjyuz/lLXs
	 juev2VVXXO9tMrhW6UFuAY9yhBNxJE/dWRhMdwF+9P67vjpiWbMWK10zwrk/0q15Jn
	 RYT0OmMbSOKoA==
Message-ID: <sashiko-outbox-237527@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/7] media: i2c: add ov12a10 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hikmah Gumelar" <hikmahgumelar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261127134507.125513-6-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
 <20261127134507.125513-6-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 13:59:45 +0000
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
- [High] media: i2c: ov12a10: self-deadlock on ov12a10->mutex in
  ov12a10_set_format()
- [Low] media: i2c: ov12a10: Kconfig selects unused V4L2_CCI_I2C while
  duplicating CCI
- [Low] media: i2c: ov12a10: ov12a10_set_ctrl() skips register writes
  when !CONFIG_PM
--

commit a28b7978efda2c7b1cde0c21ec38f6018f80694c
Author: Hikmah Gumelar <hikmahgumelar@gmail.com>

media: i2c: add ov12a10 image sensor driver

This commit adds a V4L2 subdevice driver for the OmniVision OV12A10 MIPI
CSI-2 CMOS image sensor.

> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 4c622e5eef73f..338244aa23eb4 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -538,6 +538,16 @@ config VIDEO_OV08X40
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called ov08x40.
> =20
> +config VIDEO_OV12A10
> +	tristate "OmniVision OV12A10 sensor support"
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a Video4Linux2 sensor-level driver for the OmniVision
> +	  OV12A10 12MP camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called ov12a10.
> +
>  config VIDEO_OV13858
>  	tristate "OmniVision OV13858 sensor support"
>  	help
> diff --git a/drivers/media/i2c/ov12a10.c b/drivers/media/i2c/ov12a10.c
> new file mode 100644
> index 0000000000000..99580ceedceff
> --- /dev/null
> +++ b/drivers/media/i2c/ov12a10.c
> @@ -0,0 +1,770 @@

[ ... ]

> +static int ov12a10_read_reg(struct ov12a10 *ov12a10, u16 reg, u32 len, u=
32 *val)
> +{
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&ov12a10->sd);
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
> +static int ov12a10_write_reg(struct ov12a10 *ov12a10, u16 reg, u32 len, =
u32 val)
> +{
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&ov12a10->sd);
> +	u8 buf[6];
> +	int ret;
> +
> +	put_unaligned_be16(reg, buf);
> +	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
> +	ret =3D i2c_master_send(client, buf, len + 2);
> +	return ret =3D=3D len + 2 ? 0 : (ret < 0 ? ret : -EIO);
> +}
> +
> +static int ov12a10_write_regs(struct ov12a10 *ov12a10, const struct ov12=
a10_reg *regs, u32 len)
> +{
> +	u32 i;
> +	int ret;
> +
> +	for (i =3D 0; i < len; i++) {
> +		ret =3D ov12a10_write_reg(ov12a10, regs[i].address, 1, regs[i].val);
> +		if (!ret && regs[i].address =3D=3D 0x0103)
> +			usleep_range(5000, 6000);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}

[Severity: Low]
Why does VIDEO_OV12A10 select V4L2_CCI_I2C in Kconfig while the driver
open-codes its own 16-bit big-endian I2C register access in
ov12a10_read_reg(), ov12a10_write_reg() and ov12a10_write_regs() instead of
using the V4L2 CCI helpers?

[ ... ]

> +static int ov12a10_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov12a10 *ov12a10 =3D container_of(ctrl->handler, struct ov12a10,=
 ctrl_handler);
> +	int ret =3D 0;
> +
> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +		s64 exp_max =3D ov12a10->cur_mode->height + ctrl->val - 4;
> +
> +		ret =3D __v4l2_ctrl_modify_range(ov12a10->exposure, 4, exp_max, 1,
> +					       min_t(s64, 2400, exp_max));
> +		if (ret)
> +			return ret;
> +	}
> +	if (pm_runtime_get_if_active(ov12a10->dev) <=3D 0)
> +		return 0;

[Severity: Low]
Does this pm_runtime_get_if_active() check skip all control register writes
when CONFIG_PM is disabled?

When CONFIG_PM is disabled, ov12a10_probe() leaves the sensor powered on
and pm_runtime_get_if_active() returns -EINVAL, so ov12a10_set_ctrl()
returns early without programming exposure, gain, vblank or test pattern
registers.  Using pm_runtime_get_if_in_use() =3D=3D 0 avoids skipping regis=
ter
writes when runtime PM is disabled.

[ ... ]

> +static int ov12a10_set_format(struct v4l2_subdev *sd,
> +			      const struct v4l2_subdev_client_info *ci,
> +			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_format *fmt)
> +{
> +	struct ov12a10 *ov12a10 =3D to_ov12a10(sd);
> +
> +	mutex_lock(&ov12a10->mutex);
> +	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && ov12a10->streaming) {
> +		mutex_unlock(&ov12a10->mutex);
> +		return -EBUSY;
> +	}
> +
> +	ov12a10_update_pad_format(&default_mode, &fmt->format);
> +	if (fmt->which !=3D V4L2_SUBDEV_FORMAT_TRY)
> +		ov12a10->cur_mode =3D &default_mode;
> +	*v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->format;
> +	mutex_unlock(&ov12a10->mutex);
> +
> +	return 0;
> +}

[Severity: High]
Does ov12a10_set_format() self-deadlock on ov12a10->mutex?

ov12a10_probe() sets ov12a10->sd.state_lock =3D &ov12a10->mutex before call=
ing
v4l2_subdev_init_finalize(), so the V4L2 subdev core already acquires
ov12a10->mutex via v4l2_subdev_lock_state(state) before invoking .set_fmt.
Any VIDIOC_SUBDEV_S_FMT ioctl will hang permanently on this second
mutex_lock(&ov12a10->mutex).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127134507.1255=
13-1-hikmahgumelar@gmail.com?part=3D5
