Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438335;
	b=ucNanId+5OpSiDSJrhVNFc5c+JnJX045OF9ZAMI4jQjlIXE/Qu25Je8BYlITcJGJ6N1c
	 p1AFabTeJQoXIuc4ik+zvbt1+QXgrWDwcefGhTJWfs1oPBuNGDbWvRuh58nS8R9fu0VDv
	 Ufkk21JydVBuaoeQpFX9pht8Gk8GJrPFnmotinsXnYYytuK/rMaXz6H1WthRbDAFTjAfg
	 WReRbTymIKZI+bDQ20T2jpaUEr6awa5G73Co7Z1pz6T89jyJ8SBkfTl9HL48dBXV9l60t
	 MSlobr1PfMVIOtC8fpic52QLUpkz93cSJS9uhk0yoDgN7s/+QdSTkxBbhimx3lTUM1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438335;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Qhk3n6BzIIuwSmW6pDujbKNwGgJOMlsc3XKf1nVHy28=;
	b=Qm2N7W2xBChx4bNybpF6pESc6Sy24cc7Szl4wQIPwwUBdbkmpGk84/uAdGlrQvZqP4FY
	 v7Spzgpk8Bm4tBq8ziVuzyBGOyS4+BssE8WtWRZhHORQcqphTFudfFW1qFjN0eHr5Ay6R
	 FK0iO8F+0hE9f+wbfBWxTVdyOAYCtJiuRD1X25mkoy7R1MWxoaE+I9aYH0DYE+FrmIbFM
	 dQBcb3vC7S7RIUAh8F2hiNR0ZagCjVfar2uf9stKSEsZPU8qrsGgf8bzoJNPspF20n/IW
	 qDhDO8FukuD2RdFRUc0sZIZT/JcbplnnXmydhjzjmszK28ZgTEmeEwj3+IMz/VgUCAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nfuFKEEx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4BA606A6AA;
	Mon, 23 Nov 2026 12:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nfuFKEEx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9642D1F000CF;
	Mon, 23 Nov 2026 12:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795438335;
	bh=Qhk3n6BzIIuwSmW6pDujbKNwGgJOMlsc3XKf1nVHy28=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nfuFKEEx/X720JPXyJSKuZ+XaENzt72fuG3LRyDzFWlH18H2PPrp9miAknIPQhizX
	 H1uazAh0xatxYPK/rpEEoIdNM0zvQv7lbo1+s0TFlIMK0b7EtgyuYc20LxniKVi5Z6
	 D7h3r8D018rLzVu5GWbch4eGKOb0+zxZmgdvBSS0yEVGtuC/2rvGzVhSQd6q/cUGBU
	 Chq33pFAACBl8D2GRcXhMy/NoXEneo1LD2pIYMfTVxN5qso86x9I9oism0icXLyn2r
	 T5hisDqNSMmbJvxTXgoH1hpmuIknuwkGdlvC/0UdtGmvHY8nQ3JBcZn9coe3lJud3N
	 GTvWF2E4k+aLA==
Message-ID: <sashiko-outbox-229271@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] media: i2c: add s5k5e8 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hikmah Gumelar" <hikmahgumelar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261123123546.152162-4-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-4-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 12:52:13 +0000
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
- [High] media: i2c: s5k5e8: broken runtime PM in s5k5e8_probe() and
  s5k5e8_set_ctrl()
- [Medium] media: i2c: s5k5e8: missing v4l2_subdev_cleanup() in probe()
  and remove()
- [Medium] media: i2c: s5k5e8: uninitialized and unupdated active state
  in set_format()
- [Medium] media: i2c: s5k5e8: missing exposure update on VBLANK in
  s5k5e8_set_ctrl()
- [Medium] media: i2c: s5k5e8: missing clock rate and fwnode check in
  s5k5e8_probe()
- [Low] media: i2c: s5k5e8: custom CCI helpers, legacy s_stream, and
  missing pm_ptr()
- [Low] media: i2c: s5k5e8: missing pm_ptr() wrapper on
  s5k5e8_i2c_driver.driver.pm
- [Low] media: i2c: s5k5e8: empty commit message body for new sensor
  driver
--

commit e12574756509927d5cb3038e7e50ce4245c96a90
Author: Hikmah Gumelar <hikmahgumelar@gmail.com>

> media: i2c: add s5k5e8 image sensor driver
>
> Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>

[Severity: Low]
This commit adds a new 500-line image sensor driver with an empty commit
message body.  Could a description of the sensor and its supported features
be added to the changelog?

> diff --git a/drivers/media/i2c/s5k5e8.c b/drivers/media/i2c/s5k5e8.c
> new file mode 100644
> index 0000000000000..80931e5a1c6b2
> --- /dev/null
> +++ b/drivers/media/i2c/s5k5e8.c

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
This isn't a bug, but s5k5e8_read_reg(), s5k5e8_write_reg(), and
s5k5e8_write_regs() duplicate the standard V4L2 CCI regmap helpers.  Could
this driver select V4L2_CCI_I2C and use devm_cci_regmap_init_i2c(),
cci_read(), cci_write(), and cci_multi_reg_write() instead?  Likewise, new
sensor drivers should implement v4l2_subdev_pad_ops.enable_streams and
.disable_streams with v4l2_subdev_s_stream_helper rather than manual
s5k5e8->streaming tracking in .s_stream, and wrap s5k5e8_pm_ops with
pm_ptr().

[ ... ]

> +static int s5k5e8_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct s5k5e8 *s5k5e8 =3D container_of(ctrl->handler, struct s5k5e8, ct=
rl_handler);
> +	int ret =3D 0;
> +
> +	if (!pm_runtime_get_if_in_use(s5k5e8->dev))
> +		return 0;
> +	switch (ctrl->id) {
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret =3D s5k5e8_write_reg(s5k5e8, S5K5E8_REG_ANALOG_GAIN, 2, ctrl->val);
> +	break;
> +	case V4L2_CID_EXPOSURE:
> +		ret =3D s5k5e8_write_reg(s5k5e8, S5K5E8_REG_EXPOSURE, 2, ctrl->val);
> +	break;
> +	case V4L2_CID_VBLANK:
> +		ret =3D s5k5e8_write_reg(s5k5e8, S5K5E8_REG_VTS, 2,
> +				s5k5e8->cur_mode->height + ctrl->val);
> +	break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret =3D s5k5e8_write_reg(s5k5e8, S5K5E8_REG_TEST_PATTERN, 2, ctrl->val=
);
> +	break;
> +	}
> +	pm_runtime_put(s5k5e8->dev);
> +	return ret;
> +}

[Severity: High]
Can s5k5e8_set_ctrl() underflow dev->power.usage_count and write to the
sensor while runtime PM is disabled?

pm_runtime_get_if_in_use() returns -EINVAL without incrementing usage_count
when runtime PM is disabled (or when CONFIG_PM is unset).  Because
!-EINVAL is false, s5k5e8_set_ctrl() proceeds with I2C writes and then
calls an unbalanced pm_runtime_put().  In addition, s5k5e8_probe() calls
v4l2_async_register_subdev_sensor() before pm_runtime_set_active() and
pm_runtime_enable(), so if the bridge notifier is already registered, the
subdevice can be bound and accessed while runtime PM is still disabled,
causing pm_runtime_resume_and_get() in s5k5e8_set_stream() to fail with
-EACCES.

Checking pm_runtime_get_if_in_use(s5k5e8->dev) <=3D 0 and enabling runtime =
PM
before v4l2_async_register_subdev_sensor() (with proper unwind on error)
would avoid both issues.

[Severity: Medium]
Should V4L2_CID_VBLANK in s5k5e8_set_ctrl() also update the maximum range
of s5k5e8->exposure?

s5k5e8_init_controls() initializes V4L2_CID_EXPOSURE with a maximum of 1964
lines (vts_def - 4), but changing V4L2_CID_VBLANK never calls
__v4l2_ctrl_modify_range() on s5k5e8->exposure before the
pm_runtime_get_if_in_use() check.  As a result, userspace cannot increase
exposure beyond 1964 lines after increasing vertical blanking.

[ ... ]

> +static int s5k5e8_set_format(struct v4l2_subdev *sd, const struct v4l2_s=
ubdev_client_info *ci, struct v4l2_subdev_state *sd_state,
> +		struct v4l2_subdev_format *fmt)
> +{
> +	struct s5k5e8 *s5k5e8 =3D to_s5k5e8(sd);
> +
> +	s5k5e8_update_pad_format(&supported_modes[0], &fmt->format);
> +	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +		*v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->format;
> +	else
> +		s5k5e8->cur_mode =3D &supported_modes[0];
> +
> +	return 0;
> +}

[ ... ]

> +static int s5k5e8_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	struct s5k5e8 *s5k5e8 =3D to_s5k5e8(sd);
> +
> +	mutex_lock(&s5k5e8->mutex);
> +	s5k5e8_update_pad_format(&supported_modes[0], v4l2_subdev_state_get_for=
mat(fh->state, 0));
> +	mutex_unlock(&s5k5e8->mutex);
> +	return 0;
> +}

[Severity: Medium]
Does this leave sd->active_state->pads[0].format permanently zeroed?

s5k5e8_probe() calls v4l2_subdev_init_finalize(), which initializes
sd->active_state via internal_ops->init_state, but s5k5e8_internal_ops only
provides .open (which initializes per-filehandle fh->state on devnode
open).  Furthermore, s5k5e8_set_format() only writes to
*v4l2_subdev_state_get_format(sd_state, fmt->pad) when fmt->which is
V4L2_SUBDEV_FORMAT_TRY.  Any bridge driver or V4L2 helper querying the
active format from sd->active_state will see width, height, and media bus
code as 0.

Implementing .init_state in s5k5e8_internal_ops and unconditionally
updating *v4l2_subdev_state_get_format(sd_state, fmt->pad) in
s5k5e8_set_format() would also allow replacing s5k5e8_get_format() with
v4l2_subdev_get_fmt.

[ ... ]

> +static int s5k5e8_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct s5k5e8 *s5k5e8;
> +	u32 val =3D 0;
> +	unsigned int i;
> +	int ret;
> +
> +	s5k5e8 =3D devm_kzalloc(dev, sizeof(*s5k5e8), GFP_KERNEL);
> +	if (!s5k5e8)
> +		return -ENOMEM;
> +	s5k5e8->dev =3D dev;
> +	v4l2_i2c_subdev_init(&s5k5e8->sd, client, &s5k5e8_subdev_ops);
> +	s5k5e8->xvclk =3D devm_v4l2_sensor_clk_get(dev, NULL);
> +	if (IS_ERR(s5k5e8->xvclk))
> +		return dev_err_probe(dev, PTR_ERR(s5k5e8->xvclk), "xvclk\n");
> +	clk_set_rate(s5k5e8->xvclk, S5K5E8_XVCLK_FREQ);

[Severity: Medium]
Should s5k5e8_probe() validate the xvclk frequency and the fwnode endpoint
configuration?

clk_set_rate() is called without checking its return value or verifying via
clk_get_rate() that the clock rate matches S5K5E8_XVCLK_FREQ (24 MHz),
which can leave the sensor PLL and MIPI link frequency misconfigured if a
different rate is supplied.  In addition, s5k5e8_probe() never parses the
fwnode endpoint via v4l2_fwnode_endpoint_alloc_parse() to verify that the
configured data-lanes and link-frequencies match the 2-lane, 418 MHz
register settings hardcoded in the driver.

[ ... ]

> +	s5k5e8->sd.state_lock =3D &s5k5e8->mutex;
> +	ret =3D v4l2_subdev_init_finalize(&s5k5e8->sd);
> +	if (ret)
> +		goto err_media;
> +	ret =3D v4l2_async_register_subdev_sensor(&s5k5e8->sd);
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
> +	return ret;
> +}
> +
> +static void s5k5e8_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct s5k5e8 *s5k5e8 =3D to_s5k5e8(sd);
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

[Severity: Medium]
Does this leak sd->active_state when v4l2_async_register_subdev_sensor()
fails or when s5k5e8_remove() runs?

v4l2_subdev_init_finalize() allocates sd->active_state, and
v4l2_async_register_subdev_sensor() populates
sd->async_subdev_endpoint_list, but neither the error path after
v4l2_subdev_init_finalize() nor s5k5e8_remove() calls
v4l2_subdev_cleanup(sd).

> +
> +static const struct dev_pm_ops s5k5e8_pm_ops =3D { SET_RUNTIME_PM_OPS(s5=
k5e8_power_off,
> +		s5k5e8_power_on, NULL) };
> +static const struct of_device_id s5k5e8_of_match[] =3D { { .compatible =
=3D "samsung,s5k5e8" }, { } };
> +MODULE_DEVICE_TABLE(of, s5k5e8_of_match);
> +static struct i2c_driver s5k5e8_i2c_driver =3D {
> +	.driver =3D { .name =3D "s5k5e8", .pm =3D &s5k5e8_pm_ops, .of_match_tab=
le =3D s5k5e8_of_match },

[Severity: Low]
Should s5k5e8_pm_ops use DEFINE_RUNTIME_DEV_PM_OPS() and be assigned via
pm_ptr(&s5k5e8_pm_ops) so the PM structure and callbacks can be dropped by
the compiler when CONFIG_PM is disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123123546.1521=
62-1-hikmahgumelar@gmail.com?part=3D3
