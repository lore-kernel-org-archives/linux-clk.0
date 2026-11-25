Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611001;
	b=latKCZ6CKtCc3TxJAAJuZ44+U8ipTopKnWF4dR8njbc4hFPjgJ7a0sQ6Jbhtfta/IhXZ
	 CwP2jPm7YkoiWi4k6yqIt/yZQ87AOWuBmsHjJJFt0TEkGIWLAFsJrzPlYHESdDT6T8xyB
	 kKPJZbbJ6RDpAx8pn6FhsHco4FbnvqKSh6p2ylRZSRck0zOMdbK7/lL8PEGxjdZRcY/if
	 gyFPsN24eWegdQiEZ1Vn3jC7oguCaUlNqPKtBTWf4MhyodKloQSCia3RfaZW3Gxv5AchY
	 ZwsFXLELB20YAzB7LwH7jncYnL0NtH4WFZNg3jnbquXp4aN0g6Z4t03UVRrVOUuZ+OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611001;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KNysPPBh4yG5wGlZP+ywBsraSjbmYlcEykOWuKWvZFU=;
	b=vXvBLm6jsJflZUk0EXvy9f2fkljfwGjnuOO8FjzWlmhib2qL7notqRB5RkEoqx/4CkCF
	 tQqq9r0BGhng8VIr06fW0ByvF4ZLBynuTo7BxLrhm+1vBpJJTExiuODPxkY4BSJUAKhqi
	 Z2QW39KjBNuHJRzCwzJFl9fhAmvFR7ESyhuzdl6u7ICkL+r7pbl7PSNfXUdX/3nz6yrTO
	 NRWK75Stp3mhekPKFD5mZO6G1giObWMN0oWr2IUUefpiRk0Dvgd8+KpieJVIkUr5+Knf1
	 F9neU9TxEDAS4+pQkO07YrqjghYiB8Uh3NSD+Y1EExqWLqZ5orBJqHP8XSrzkDL6RZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mr8qb1cv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C3F606A31E;
	Wed, 25 Nov 2026 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mr8qb1cv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6D01F0093C;
	Wed, 25 Nov 2026 12:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611001;
	bh=KNysPPBh4yG5wGlZP+ywBsraSjbmYlcEykOWuKWvZFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mr8qb1cv0psQ4KKCssU5Qz4q/y//y7QHSu9FanNUI6htHat56vGKAwY/paFdaxNLL
	 fk9WA1Jok8TwX1nsGVk2kmC9/a2tJIO26URF6INbbdJ7OnitofIcnwPhsxf1FADjsl
	 YcljeYQd1ScZbLWA1ZPvEz0bVmSfJoDTSmmeWUjVtBIQ1EeTUDrJM8DIrIkB0Rw4EB
	 OQ2KwCRzz6Ms/t3dHQvRvl1i9UAe95lh2WmnOek+mf6P018adsEMfd7r0KtucMhDz2
	 O5L+9ZiERL0NDzAAmd72EOe8ybw1MZojZUZeXWqxb6PziH4r1N/FGkhuxAXgZwzgGi
	 ENTvrGivrDnPw==
Message-ID: <sashiko-outbox-233395@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/7] media: i2c: add ov12a10 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hikmah Gumelar" <hikmahgumelar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261125123146.379057-6-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
 <20261125123146.379057-6-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 12:50:00 +0000
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
- [Medium] media: i2c: ov12a10: missing v4l2_subdev_cleanup() in
  ov12a10_probe()
- [Medium] media: i2c: ov12a10: async subdev registered before enabling
  runtime PM
- [Medium] media: i2c: ov12a10: missing streaming check and state update
  in ov12a10_set_format()
- [Medium] media: i2c: ov12a10: Kconfig and Makefile entries misplaced
  into earlier commit
- [Low] media: i2c: ov12a10: inconsistent initial V4L2_CID_EXPOSURE
  maximum in ov12a10_init_controls()
- [Low] media: i2c: ov12a10: missing post-powerdown delay in
  ov12a10_power_on()
--

commit 470fcc60c01175d16a98461402ebe19e658c65b4
Author: Hikmah Gumelar <hikmahgumelar@gmail.com>

media: i2c: add ov12a10 image sensor driver

This commit adds a V4L2 subdevice driver for the OmniVision OV12A10 MIPI
CSI-2 CMOS image sensor supporting 1280x720 binned 10-bit Bayer output.

> diff --git a/drivers/media/i2c/ov12a10.c b/drivers/media/i2c/ov12a10.c
> new file mode 100644
> index 0000000000000..e314b0e2eba7e
> --- /dev/null
> +++ b/drivers/media/i2c/ov12a10.c
[ ... ]
> +static int ov12a10_power_on(struct device *dev)
> +{
> +	struct ov12a10 *ov12a10 =3D to_ov12a10(dev_get_drvdata(dev));
> +	int ret;
> +
> +	ret =3D regulator_bulk_enable(OV12A10_NUM_SUPPLIES, ov12a10->supplies);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D clk_prepare_enable(ov12a10->xvclk);
> +	if (ret) {
> +		regulator_bulk_disable(OV12A10_NUM_SUPPLIES, ov12a10->supplies);
> +		return ret;
> +	}
> +
> +	msleep(35);
> +	if (ov12a10->pwdn_gpio)
> +		gpiod_set_value_cansleep(ov12a10->pwdn_gpio, 0);
> +	if (ov12a10->reset_gpio) {
> +		gpiod_set_value_cansleep(ov12a10->reset_gpio, 1);
> +		usleep_range(3000, 5000);
> +		gpiod_set_value_cansleep(ov12a10->reset_gpio, 0);
> +		msleep(35);
> +	}
> +	return 0;
> +}

[Severity: Low]
Does ov12a10_power_on() skip the post-deassertion startup delay when
pwdn_gpio is present without reset_gpio?  The initial msleep(35) runs while
pwdn_gpio is still asserted, and the second msleep(35) is gated on
ov12a10->reset_gpio, so on boards without reset-gpios the driver issues I2C
transactions immediately after deasserting powerdown.

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
[ ... ]
> +static int ov12a10_init_controls(struct ov12a10 *ov12a10)
> +{
[ ... ]
> +	v4l2_ctrl_new_std(hdl, &ov12a10_ctrl_ops, V4L2_CID_VBLANK, 124,
> +			  0x7fff - ov12a10->cur_mode->height, 1, 2656);
> +	ov12a10->hblank =3D v4l2_ctrl_new_std(hdl, &ov12a10_ctrl_ops, V4L2_CID_=
HBLANK, hblank,
> +					    hblank, 1, hblank);
> +	if (ov12a10->hblank)
> +		ov12a10->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +	v4l2_ctrl_new_std(hdl, &ov12a10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN, 0x80,=
 0x7ff, 1, 0x300);
> +	ov12a10->exposure =3D v4l2_ctrl_new_std(hdl, &ov12a10_ctrl_ops, V4L2_CI=
D_EXPOSURE, 4,
> +					      3360, 1, 2400);

[Severity: Low]
Should the initial V4L2_CID_EXPOSURE maximum in ov12a10_init_controls() be
3372 instead of 3360?  With default_mode.height =3D 720 and the default
V4L2_CID_VBLANK of 2656, ov12a10_set_ctrl() computes exp_max =3D 720 + 2656=
 -
4 =3D 3372, so the exposure maximum reported after probe changes from 3360 =
to
3372 on the first stream start when __v4l2_ctrl_handler_setup() runs.

[ ... ]

> +static int ov12a10_set_format(struct v4l2_subdev *sd,
> +			      const struct v4l2_subdev_client_info *ci,
> +			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_format *fmt)
> +{
> +	struct ov12a10 *ov12a10 =3D to_ov12a10(sd);
> +
> +	ov12a10_update_pad_format(&default_mode, &fmt->format);
> +	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +		*v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->format;
> +	else
> +		ov12a10->cur_mode =3D &default_mode;
> +
> +	return 0;
> +}

[Severity: Medium]
Should ov12a10_set_format() return -EBUSY when fmt->which =3D=3D
V4L2_SUBDEV_FORMAT_ACTIVE and ov12a10->streaming is true, and update
*v4l2_subdev_state_get_format(sd_state, fmt->pad) for active formats as
well?  Because this driver implements .s_stream rather than
.enable_streams, the V4L2 core does not block active format updates while
streaming, and only updating sd_state on the V4L2_SUBDEV_FORMAT_TRY branch
leaves the active pad state stale for v4l2_subdev_get_fmt() and
v4l2_subdev_link_validate().

[ ... ]

> +	ov12a10->sd.state_lock =3D &ov12a10->mutex;
> +	ret =3D v4l2_subdev_init_finalize(&ov12a10->sd);
> +	if (ret)
> +		goto err_media;
> +	ret =3D v4l2_async_register_subdev_sensor(&ov12a10->sd);
> +	if (ret)
> +		goto err_media;
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +	return 0;
> +err_media:
> +	media_entity_cleanup(&ov12a10->sd.entity);
> +err_ctrl:
> +	v4l2_ctrl_handler_free(ov12a10->sd.ctrl_handler);
> +err_mutex:
> +	mutex_destroy(&ov12a10->mutex);
> +err_power:
> +	ov12a10_power_off(dev);
> +	return ret;
> +}

[Severity: Medium]
Does the err_media path in ov12a10_probe() leak the subdev active state
allocated by v4l2_subdev_init_finalize() when
v4l2_async_register_subdev_sensor() fails?  Unlike ov12a10_remove(), the
error unwind does not call v4l2_subdev_cleanup(&ov12a10->sd).

[Severity: Medium]
Can registering the async subdev before enabling runtime PM cause streaming
or control setup to fail if the receiver driver's async notifier is already
waiting?  v4l2_async_register_subdev_sensor() can immediately bind and
expose the subdevice while runtime PM is still disabled and marked
suspended, causing pm_runtime_resume_and_get() in ov12a10_set_stream() to
fail with -EACCES and pm_runtime_get_if_active() in ov12a10_set_ctrl() to
return -EINVAL and skip register writes.

[ ... ]

> +static struct i2c_driver ov12a10_i2c_driver =3D {
> +	.driver =3D {
> +		.name =3D "ov12a10",
> +		.pm =3D pm_ptr(&ov12a10_pm_ops),
> +		.of_match_table =3D ov12a10_of_match,
> +	},
> +	.probe =3D ov12a10_probe, .remove =3D ov12a10_remove,
> +};
> +module_i2c_driver(ov12a10_i2c_driver);
> +MODULE_DESCRIPTION("OmniVision OV12A10 12MP sensor driver");
> +MODULE_LICENSE("GPL");

[Severity: Medium]
Should the VIDEO_OV12A10 Kconfig and ov12a10.o Makefile entries be moved
into this commit from earlier commit "media: i2c: add s5k5e8 image sensor
driver" in this series?  Adding obj-$(CONFIG_VIDEO_OV12A10) +=3D ov12a10.o =
in
the earlier commit breaks the build during git bisect whenever
CONFIG_VIDEO_OV12A10 is enabled before drivers/media/i2c/ov12a10.c exists.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125123146.3790=
57-1-hikmahgumelar@gmail.com?part=3D5
