Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449054;
	b=ni4Kk6UfjK8Dmoqbusaqyl3jyVfO7EsE+GZKjU9Qi2HBIKWVDgjsWr464yWe+KWRrRe6
	 Ghj4q2SFmofYH2yTEUH5mFs+LN0nzXKyvwfCJc9Y4cz/8C73izRsUdsX3WkozxyEgNFYk
	 sfoPNAiH/qWuJ2tkTms5/NbgFPtPW5TiRCJkvCigIflGH3vtrJGIL8ITDD3/aXLFNAGZn
	 8zBa8/e+yC6AW+3Q8rLAslWOq+84dTo/Mhx65Hv/Rlpq6LMDu9DSlTyf06brqLsI4xMTY
	 9Z3B8wLEenWAt24mIl6yWCNhTEF9eqRpJhBgezgXtallZz6yw7DafnbdysSHX7SmeCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449054;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Hh26FF5hGvxDFjeSw492Uy76opokr86v3BCPnJF2wJ8=;
	b=WH/Z6ZhuJkbumrgVl6ZANT817dXpsIbxlkUMDVihKA5+A1xLC9GjyFxZjxyq1D5fyjmF
	 22mzRfaXXHxVTfvcYUeLeuuexcac6bVCAPiKtl4mfdlZhSAMttKfiieAiJQ11z66ZnCjZ
	 scvAqDusorgMOiZkZ2fXj/O/5mTXBaySUp+zfBA6gbwQEzQhyVmc6cov3jTpZ6A1zzbc/
	 bsHy3HH/BClj1clev2R6K8yQaVfIw7GGzwpRxcvc6iYVC+LB7YWnQCS2Gc2fXvG/Cbg2A
	 hOlw2QsjGKcRZwqX9ahAB7BnMUtPP+ATWQ3jCTkXQLy/8usv8aYyyNEC/xr5FYkfAzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JDFmZbZ/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1322606A321;
	Mon, 23 Nov 2026 15:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JDFmZbZ/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D81C1F000C0;
	Mon, 23 Nov 2026 15:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449053;
	bh=Hh26FF5hGvxDFjeSw492Uy76opokr86v3BCPnJF2wJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JDFmZbZ/tl2uQIjI3jhj5o0QLALLG/BdG0N9SRWGy03VIKpWPT5NO0QmoZQOlz4ox
	 k3SOoKJs68JjaETPPUy6Qmluzvb7iQcRdlmT41d09fC524aDVVKZ/wxzk0QEMb7K/J
	 vqSk48rQtutgOyfmMiTaQPycCmPhcbo0PiiqEXIHMqE3dcdSSIH31KfpI1s472IzYx
	 Ph8Os1j4tt+hk65SknP+eqFGo3NV3XOibCmrOCb/vKZsfBCKSi6gSM8LPtIwuoJrK+
	 jvXvtUIIYXk1B3WW/qX6dDtkwMtmKeaUO7CaiAqn8Xcu2z19OWag6XhOktYv77cnn1
	 DBZqPkoqGVGsQ==
Message-ID: <sashiko-outbox-229613@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] media: i2c: add ov12a10 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hikmah Gumelar" <hikmahgumelar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261123152722.168879-6-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-6-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:50:52 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 12 potential
issues to consider:
- [High] media: i2c: ov12a10: missing IS_ERR() GPIO checks and name
  mismatch in probe()
- [Medium] media: i2c: ov12a10: missing v4l2_subdev_cleanup() in probe()
  and remove()
- [Medium] media: i2c: ov12a10: missing vana_gpio rollback in
  ov12a10_power_on()
- [Medium] media: i2c: ov12a10: runtime PM bugs in ov12a10_probe() and
  ov12a10_set_ctrl()
- [Medium] media: i2c: ov12a10: missing exposure range update in
  ov12a10_set_ctrl()
- [Medium] media: i2c: ov12a10: missing test pattern enable bit in
  ov12a10_set_ctrl()
- [Medium] media: i2c: ov12a10: uninitialized subdev state in get_fmt()
  and set_fmt()
- [Medium] media: i2c: ov12a10: wrong native and crop rectangles in
  ov12a10_get_selection()
- [Low] media: i2c: ov12a10: missing fwnode endpoint and clk_set_rate()
  checks in ov12a10_probe()
- [Low] media: i2c: ov12a10: missing DEFINE_RUNTIME_DEV_PM_OPS() and
  pm_ptr()
- [Low] media: i2c: ov12a10: mismatched OV12A10_REG_EXPOSURE and unused
  macros
- [Low] media: i2c: ov12a10: coding style violations in struct, switch,
  and error labels
--

commit b4d54d6ecb617bf73cbccd2d0578b1858ed17a67
Author: Hikmah Gumelar <hikmahgumelar@gmail.com>

media: i2c: add ov12a10 image sensor driver

This commit adds a V4L2 subdevice driver for the OmniVision OV12A10 MIPI
CSI-2 image sensor supporting 1280x720 binned 10-bit Bayer output.

> diff --git a/drivers/media/i2c/ov12a10.c b/drivers/media/i2c/ov12a10.c
> new file mode 100644
> index 0000000000000..48e7a5e981972
> --- /dev/null
> +++ b/drivers/media/i2c/ov12a10.c
> @@ -0,0 +1,719 @@

[ ... ]

> +#define OV12A10_REG_MODE_SELECT		0x0100
> +#define OV12A10_MODE_STANDBY		0x00
> +#define OV12A10_MODE_STREAMING		0x01
> +#define OV12A10_REG_VTS			0x380e
> +#define OV12A10_REG_EXPOSURE		0x3501

[Severity: Low]
Should OV12A10_REG_EXPOSURE be defined as 0x3500 and used in
ov12a10_set_ctrl()?  The 24-bit exposure write in ov12a10_set_ctrl()
hardcodes 0x3500 (the MSB of 0x3500..0x3502), leaving OV12A10_REG_EXPOSURE
unused at 0x3501.  OV12A10_MODE_STREAMING is also unused because
ov12a10_set_stream() hardcodes { 0x0100, 0x01 } in stream_on_regs[].

[ ... ]

> +struct ov12a10_reg { u16 address;
> +u8 val;
> +};

[Severity: Low]
This isn't a bug, but struct ov12a10_reg does not follow kernel coding
style, and the same applies to the misaligned break statements in
ov12a10_set_ctrl() and the single-line goto labels at the bottom of
ov12a10_probe().

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
Does ov12a10_power_on() leave vana_gpio asserted high when
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
Should this check pm_runtime_get_if_in_use(ov12a10->dev) <=3D 0?  When
runtime PM is disabled (or CONFIG_PM is unset), pm_runtime_get_if_in_use()
returns -EINVAL without incrementing the usage count, so !ret is false and
ov12a10_set_ctrl() writes to I2C and calls an unbalanced pm_runtime_put()
that underflows dev->power.usage_count.

Also, in ov12a10_probe(), v4l2_async_register_subdev_sensor() is called
before pm_runtime_set_active() and pm_runtime_enable(), so if the receiver
binds synchronously during registration and starts streaming or sets
controls, runtime PM is still disabled and marked suspended.

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
Does changing V4L2_CID_VBLANK need to update the range of
ov12a10->exposure via __v4l2_ctrl_modify_range() before the
pm_runtime_get_if_in_use() check?  Without that update, lowering vblank
down to its minimum of 124 (VTS =3D 844) leaves exposure's maximum at 3360
and default at 2400, allowing exposure values that exceed VTS.

> +	case V4L2_CID_TEST_PATTERN:
> +		ret =3D ov12a10_write_reg(ov12a10, OV12A10_REG_TEST_PATTERN, 1, ctrl->=
val);
> +	break;

[Severity: Medium]
Does writing ctrl->val directly to OV12A10_REG_TEST_PATTERN (0x5080) leave
the test pattern generator disabled?  On OmniVision sensors using register
0x5080, BIT(7) is the test pattern enable bit and non-zero menu selections
map to (ctrl->val - 1) | BIT(7).

[ ... ]

> +static int ov12a10_get_format(struct v4l2_subdev *sd, struct v4l2_subdev=
_state *sd_state,
> +		struct v4l2_subdev_format *fmt)
> +{
> +	struct ov12a10 *ov12a10 =3D to_ov12a10(sd);
> +
> +	fmt->format =3D (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) ? *v4l2_subd=
ev_state_get_format(sd_state,
> +			fmt->pad) : fmt->format;
> +	if (fmt->which !=3D V4L2_SUBDEV_FORMAT_TRY)
> +		ov12a10_update_pad_format(ov12a10->cur_mode, &fmt->format);
> +	return 0;
> +}
> +
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
Does this leave sd->active_state unpopulated and active format queries
partially uninitialized?

ov12a10_probe() calls v4l2_subdev_init_finalize(), which allocates
sd->active_state and initializes it via internal_ops->init_state.  Because
ov12a10_internal_ops implements .open instead of .init_state, and
ov12a10_set_format() only writes to v4l2_subdev_state_get_format(sd_state,
fmt->pad) when fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY, sd->active_state
stays zeroed.  In addition, when fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIV=
E,
ov12a10_get_format() self-assigns fmt->format and calls
ov12a10_update_pad_format(), which only sets width, height, code, field,
and colorspace, leaving ycbcr_enc, quantization, xfer_func, and flags
uninitialized for in-kernel callers such as
v4l2_subdev_link_validate_get_format().

Implementing .init_state in ov12a10_internal_ops, unconditionally updating
*v4l2_subdev_state_get_format(sd_state, fmt->pad) in ov12a10_set_format(),
and using v4l2_subdev_get_fmt as .get_fmt would fix all three issues.

[ ... ]

> +static int ov12a10_get_selection(struct v4l2_subdev *sd, const struct v4=
l2_subdev_client_info *ci,
> +				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP:
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r.left =3D 0;
> +		sel->r.top =3D 0;
> +		sel->r.width =3D 1280;
> +		sel->r.height =3D 720;
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}

[Severity: Medium]
Should ov12a10_get_selection() report the full 12MP pixel array for
V4L2_SEL_TGT_NATIVE_SIZE / CROP_BOUNDS / CROP_DEFAULT and the pre-binning
analog crop window for V4L2_SEL_TGT_CROP?

In ov12a10_common_regs, the full sensor array is 4112x3088 (active
4096x3072), and in ov12a10_1280x720_regs registers 0x3800..0x3807
configure an analog crop window from (800, 872) to (3391, 2343) before 2x2
binning down to 1280x720.  Returning (0, 0, 1280, 720) for all targets
misreports the sensor geometry and binning factor to userspace camera
stacks.

[ ... ]

> +static int ov12a10_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct ov12a10 *ov12a10;
> +	u32 val =3D 0;
> +	unsigned int i;
> +	int ret;
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

[Severity: Low]
Should ov12a10_probe() check the return value of clk_set_rate() and
validate the MIPI CSI-2 fwnode endpoint?  The DT binding requires a
4-lane CSI-2 endpoint with a 216 MHz link-frequencies property, but the
driver never parses the endpoint with v4l2_fwnode_endpoint_alloc_parse().

> +	ov12a10->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT=
_HIGH);
> +	ov12a10->vana_gpio =3D devm_gpiod_get_optional(dev, "vana", GPIOD_OUT_L=
OW);
> +	ov12a10->pwdn_gpio =3D devm_gpiod_get_optional(dev, "pwdn", GPIOD_OUT_H=
IGH);
> +	if (IS_ERR(ov12a10->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ov12a10->reset_gpio), "reset\n");

[Severity: High]
What happens if devm_gpiod_get_optional() returns an error pointer (such
as -EPROBE_DEFER) for vana_gpio or pwdn_gpio?  Because neither pointer is
checked with IS_ERR(), the non-NULL ERR_PTR is stored and passed straight
to gpiod_set_value_cansleep() in ov12a10_power_on() instead of deferring
or aborting probe.

Also, the DT binding (Documentation/devicetree/bindings/media/i2c/ovti,ov12=
a10.yaml)
defines powerdown-gpios rather than pwdn-gpios (and does not document
vana-gpios), so requesting "pwdn" will never match a conforming DT.

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
Does missing v4l2_subdev_cleanup(sd) in ov12a10_remove() and on the
v4l2_async_register_subdev_sensor() error path in ov12a10_probe() leak
sd->active_state?  v4l2_subdev_init_finalize() allocates sd->active_state
and its pad array, which are only freed by v4l2_subdev_cleanup().

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
Could ov12a10_pm_ops use DEFINE_RUNTIME_DEV_PM_OPS() and be wired with
.pm =3D pm_ptr(&ov12a10_pm_ops) so the PM ops are dropped when CONFIG_PM is
disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123152722.1688=
79-1-hikmahgumelar@gmail.com?part=3D5
