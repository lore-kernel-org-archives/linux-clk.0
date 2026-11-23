Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438674;
	b=o4w8dOaY5UxhuMc/oLhRGhs5J2usQ5ngoeDT34J64u99/OaJ2K29sL69EQNacGgkq4kM
	 aG+53jPJgaPrxDcH9736P476JGBEAQEmkBSjyUjwwCv6bLay7X1V+6Z/qNnP/NM08pwYg
	 EPPGKqWsmtig4YELerFJZStOige8EAf9rOxTvMrGFRYmnO0nLwcr1rnlsDH4n6Wr/HfUZ
	 0F4XTSbcZUX1KupeeyfqbVIoXbxJScsCtSiRsiHODV7SANoPuVoxRVgx4ZhL+dfeBmFAm
	 moY8D+dVprq3EvHYRxHC7CIgfTudgMXDvLGPqjl69lKs34KuZy6UYw1xIQrTvIf4+kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438674;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FjbRce3SxSVnUiR91WyaQkRMa8JCzkMcUJtrU8ymZQ8=;
	b=SBrJScvPwPHfmKwlubwciL4lsBbFDPxukI1v4Ww1zJrOVawjz5yFVANYMQeNRkiNsXmH
	 L2AlXqdVoOuPnFbT/otKC2bt/DgoS7kLNPyLSJVjwINeoNJlpNE1pArCwMqsY2rYF7kC/
	 evgwcsrRnGrxqTHcmEYfssjudU03aTUkd5WFRwUFQpOEXHY28xrf3Zg4yt0L8aVF73aWY
	 yFk27IUY8Pi0T8siZ8Gl1OqeG5gtlc51siz9EWWpi3mQ0RvlG7uqSJFx+YvDbuSa2Dd46
	 LZWB8EdUh8p5gAl3xJef6+s+fE+tQiGLpG6pckyL5tpL6lkE7h/ppJAqErT8UbEB9Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NmCfhsxe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76257606A321;
	Mon, 23 Nov 2026 12:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NmCfhsxe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2E51F000D1;
	Mon, 23 Nov 2026 12:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795438674;
	bh=FjbRce3SxSVnUiR91WyaQkRMa8JCzkMcUJtrU8ymZQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NmCfhsxecydtQQsZcHmO5Ke4sFgbPM57iZM4Cosiy7S8pL+eNEzgc8BPbip40mDQ1
	 4CSg6HgZBP6jHD12KO4P/55lKTsI9FpJvKl+ggxaLrW96WFX/jkxypaKPWalYyu+1q
	 AS8Ok1a5ZNs6S6AfNdakqXtLWH42kTCohyuh6oc8zH99ToRybobCvaLscJnErcFiIW
	 Eudbp+TRpJl/keywlekx/mEtud0vO3glcBecbch6pWhepI8fm2+rH2swdpiywGAC9W
	 d2khPSNM/0hWdJiuMLxtXLM7TK4v8ZT8wtFQbTTiCwNDm1RYEAIkLnTE9ydEVfJwnc
	 knfNJZgNq/nUA==
Message-ID: <sashiko-outbox-229277@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] media: i2c: add ov12a10 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hikmah Gumelar" <hikmahgumelar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261123123546.152162-6-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-6-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 12:57:53 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 11 potential
issues to consider:
- [High] media: i2c: ov12a10: missing IS_ERR() checks on GPIOs in
  ov12a10_probe()
- [Medium] media: i2c: ov12a10: missing vana_gpio rollback in
  ov12a10_power_on()
- [Medium] media: i2c: ov12a10: missing v4l2_subdev_cleanup() in probe()
  and remove()
- [Medium] media: i2c: ov12a10: uninitialized active state in
  ov12a10_set_format()
- [Medium] media: i2c: ov12a10: runtime PM ordering in probe() and
  ov12a10_set_ctrl()
- [Medium] media: i2c: ov12a10: missing test pattern enable bit in
  ov12a10_set_ctrl()
- [Medium] media: i2c: ov12a10: missing exposure range update in
  ov12a10_set_ctrl()
- [Low] media: i2c: ov12a10: missing fwnode endpoint validation in
  ov12a10_probe()
- [Low] media: i2c: ov12a10: mismatched OV12A10_REG_EXPOSURE and unused
  macros
- [Low] media: i2c: ov12a10: missing pm_ptr() and
  DEFINE_RUNTIME_DEV_PM_OPS()
- [Low] media: i2c: ov12a10: empty commit message and coding style
  violations
--

commit 87e706783d08e4892b5ba94e037a4944e990a93f
Author: Hikmah Gumelar <hikmahgumelar@gmail.com>

> media: i2c: add ov12a10 image sensor driver
>
> Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>

[Severity: Low]
This commit adds a new V4L2 image sensor driver with an empty commit
message body.  Please include a description of the OmniVision OV12A10
sensor and the features supported by the driver.

> diff --git a/drivers/media/i2c/ov12a10.c b/drivers/media/i2c/ov12a10.c
> new file mode 100644
> index 0000000000000..ce2e01bc67e0c
> --- /dev/null
> +++ b/drivers/media/i2c/ov12a10.c
> @@ -0,0 +1,720 @@

[ ... ]

> +#define OV12A10_CHIP_ID_REG		0x300a
> +#define OV12A10_CHIP_ID			0x5612
> +#define OV12A10_REG_MODE_SELECT		0x0100
> +#define OV12A10_MODE_STANDBY		0x00
> +#define OV12A10_MODE_STREAMING		0x01
> +#define OV12A10_REG_VTS			0x380e
> +#define OV12A10_REG_EXPOSURE		0x3501
> +#define OV12A10_REG_ANALOG_GAIN		0x3508
> +#define OV12A10_REG_TEST_PATTERN		0x5080
> +#define OV12A10_XVCLK_FREQ		24000000
> +#define OV12A10_LINK_FREQ_216MHZ		216000000ULL
> +#define OV12A10_PIXEL_RATE		144000000ULL

[Severity: Low]
Should OV12A10_REG_EXPOSURE be 0x3500 instead of 0x3501?
ov12a10_set_ctrl() performs a 3-byte write for V4L2_CID_EXPOSURE starting
at hardcoded register 0x3500, leaving OV12A10_REG_EXPOSURE unused.
OV12A10_MODE_STREAMING is also unused because ov12a10_set_stream() uses a
local stream_on_regs[] table with raw values { 0x0100, 0x01 }.

> +
> +struct ov12a10_reg { u16 address;
> +u8 val;
> +};

[Severity: Low]
This isn't a bug, but the formatting of struct ov12a10_reg, the
misaligned break statements in ov12a10_set_ctrl(), and the goto labels
sharing lines with cleanup calls in ov12a10_probe() do not follow kernel
coding style.

[ ... ]

> +static int ov12a10_power_on(struct device *dev)
> +{
> +	struct ov12a10 *ov12a10 =3D to_ov12a10(dev_get_drvdata(dev));
> +	int ret;
> +
> +	if (ov12a10->vana_gpio)
> +		gpiod_set_value_cansleep(ov12a10->vana_gpio, 1);
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

[Severity: Medium]
Does ov12a10_power_on() leave ov12a10->vana_gpio asserted high when
regulator_bulk_enable() or clk_prepare_enable() fails?

[ ... ]

> +static int ov12a10_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov12a10 *ov12a10 =3D container_of(ctrl->handler, struct ov12a10,=
 ctrl_handler);
> +	int ret =3D 0;
> +
> +	if (!pm_runtime_get_if_in_use(ov12a10->dev))
> +		return 0;

[Severity: Medium]
Can pm_runtime_get_if_in_use() return -EINVAL here without incrementing
the runtime PM usage counter?

When runtime PM is disabled (for example on a kernel without CONFIG_PM,
or during the window in ov12a10_probe() where
v4l2_async_register_subdev_sensor() runs before pm_runtime_enable()),
pm_runtime_get_if_in_use() returns -EINVAL, so ov12a10_set_ctrl()
proceeds to write registers and calls an unbalanced pm_runtime_put() that
underflows usage_count.  Checking pm_runtime_get_if_in_use(ov12a10->dev)
<=3D 0 and enabling runtime PM before registering the async subdevice in
ov12a10_probe() would avoid both issues.

> +	switch (ctrl->id) {
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret =3D ov12a10_write_reg(ov12a10, OV12A10_REG_ANALOG_GAIN, 2, ctrl->v=
al);
> +	break;
> +	case V4L2_CID_EXPOSURE:
> +		ret =3D ov12a10_write_reg(ov12a10, 0x3500, 3, ctrl->val << 4);
> +	break;
> +	case V4L2_CID_VBLANK:
> +		ret =3D ov12a10_write_reg(ov12a10, OV12A10_REG_VTS, 2,
> +				ov12a10->cur_mode->height + ctrl->val);
> +	break;

[Severity: Medium]
Should changing V4L2_CID_VBLANK also update the range of
ov12a10->exposure via __v4l2_ctrl_modify_range() before the
pm_runtime_get_if_in_use() check?  Without that, lowering V4L2_CID_VBLANK
(for example to its minimum of 124, giving VTS =3D 844) leaves
ov12a10->exposure with a maximum of 3360 and default of 2400, allowing
exposure values that exceed VTS.

> +	case V4L2_CID_TEST_PATTERN:
> +		ret =3D ov12a10_write_reg(ov12a10, OV12A10_REG_TEST_PATTERN, 1, ctrl->=
val);
> +	break;

[Severity: Medium]
Does writing ctrl->val directly to OV12A10_REG_TEST_PATTERN (0x5080)
leave the test pattern generator disabled for non-zero menu items?  On
OmniVision sensors using register 0x5080, BIT(7) must be set to enable
test pattern output.

[ ... ]

> +static int ov12a10_set_format(struct v4l2_subdev *sd, const struct v4l2_=
subdev_client_info *ci, struct v4l2_subdev_state *sd_state,
> +		struct v4l2_subdev_format *fmt)
> +{
> +	struct ov12a10 *ov12a10 =3D to_ov12a10(sd);
> +
> +	ov12a10_update_pad_format(&supported_modes[0], &fmt->format);
> +	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +		*v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->format;
> +	else
> +		ov12a10->cur_mode =3D &supported_modes[0];
> +
> +	return 0;
> +}

[Severity: Medium]
Does this leave sd->active_state uninitialized when fmt->which is
V4L2_SUBDEV_FORMAT_ACTIVE?

ov12a10_probe() calls v4l2_subdev_init_finalize(), but
ov12a10_internal_ops implements .open instead of .init_state and
ov12a10_set_format() only writes to sd_state for V4L2_SUBDEV_FORMAT_TRY.
As a result, sd->active_state->pads[0].format stays zero-initialized for
the lifetime of the subdevice, breaking format queries or link validation
in callers that inspect active subdev state.

[ ... ]

> +static int ov12a10_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct ov12a10 *ov12a10;
> +	u32 val =3D 0;
> +	unsigned int i;
> +	int ret;

[Severity: Low]
Should ov12a10_probe() parse and validate the fwnode graph endpoint using
v4l2_fwnode_endpoint_alloc_parse()?  The DT binding requires a port
endpoint with 4 CSI-2 data lanes and a 216 MHz link-frequencies property,
which are currently never checked.

> +
> +	ov12a10 =3D devm_kzalloc(dev, sizeof(*ov12a10), GFP_KERNEL);
> +	if (!ov12a10)
> +		return -ENOMEM;
> +	ov12a10->dev =3D dev;
> +	v4l2_i2c_subdev_init(&ov12a10->sd, client, &ov12a10_subdev_ops);
> +	ov12a10->xvclk =3D devm_v4l2_sensor_clk_get(dev, NULL);
> +	if (IS_ERR(ov12a10->xvclk))
> +		return dev_err_probe(dev, PTR_ERR(ov12a10->xvclk), "xvclk\n");
> +	clk_set_rate(ov12a10->xvclk, OV12A10_XVCLK_FREQ);
> +	ov12a10->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT=
_HIGH);
> +	ov12a10->vana_gpio =3D devm_gpiod_get_optional(dev, "vana", GPIOD_OUT_L=
OW);
> +	ov12a10->pwdn_gpio =3D devm_gpiod_get_optional(dev, "pwdn", GPIOD_OUT_H=
IGH);
> +	if (IS_ERR(ov12a10->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ov12a10->reset_gpio), "reset\n");

[Severity: High]
What happens if devm_gpiod_get_optional() returns an error or
-EPROBE_DEFER for ov12a10->vana_gpio or ov12a10->pwdn_gpio?

Because only ov12a10->reset_gpio is checked with IS_ERR(), a non-NULL
ERR_PTR stored in vana_gpio or pwdn_gpio passes the truthiness checks in
ov12a10_power_on() and ov12a10_power_off() and is passed straight to
gpiod_set_value_cansleep(), triggering a warning in gpiolib and breaking
probe deferral.

[ ... ]

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
> +err_media: media_entity_cleanup(&ov12a10->sd.entity);
> +err_ctrl: v4l2_ctrl_handler_free(ov12a10->sd.ctrl_handler);
> +err_mutex: mutex_destroy(&ov12a10->mutex);
> +err_power: ov12a10_power_off(dev);
> +	return ret;
> +}
> +
> +static void ov12a10_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct ov12a10 *ov12a10 =3D to_ov12a10(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(sd->ctrl_handler);

[Severity: Medium]
Does omitting v4l2_subdev_cleanup() in ov12a10_remove() and on the
v4l2_async_register_subdev_sensor() error path in ov12a10_probe() leak
sd->active_state allocated by v4l2_subdev_init_finalize()?

[ ... ]

> +static const struct dev_pm_ops ov12a10_pm_ops =3D { SET_RUNTIME_PM_OPS(o=
v12a10_power_off,
> +		ov12a10_power_on, NULL) };
> +static const struct of_device_id ov12a10_of_match[] =3D { { .compatible =
=3D "ovti,ov12a10" }, { } };
> +MODULE_DEVICE_TABLE(of, ov12a10_of_match);
> +static struct i2c_driver ov12a10_i2c_driver =3D {
> +	.driver =3D { .name =3D "ov12a10", .pm =3D &ov12a10_pm_ops, .of_match_t=
able =3D ov12a10_of_match },

[Severity: Low]
This isn't a bug, but using DEFINE_RUNTIME_DEV_PM_OPS() for
ov12a10_pm_ops and wrapping .pm with pm_ptr(&ov12a10_pm_ops) would allow
the PM callbacks to be dropped when CONFIG_PM is disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123123546.1521=
62-1-hikmahgumelar@gmail.com?part=3D5
