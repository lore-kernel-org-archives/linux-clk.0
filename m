Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017761;
	b=SW3cerVlmiPvN6K21VS9B13xlw/fPp/vIg2GThAelXZgMKLA2JPQ44DaQX1k8T6jh5ZN
	 OJuPzRh+3hI0Pd6gGIqC0Os6M7XEf+t8ogIyuz4Rxg452E5FW4doTXmw3n8SncApAcKD2
	 noi4X7Ym2ETMvLRR2upBCcW+EeOjpN2JsS/6yBxlyk974VFTGnd/RSoQV8NfvWUnKPIyT
	 NNhoBlks9YCL1pOqSLFFH11lSoHBpIi6JLqr5KAxCbTUbB1u7DiyYYsCJ6/bxKymxzmiI
	 bvxshgR1D39vvf5Q66XtmWUjAMeb/y4n3w7PbkxTlbtI2cmtQIYAZ2OhDG/8BxJC0yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017761;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QwBKZBhqRAe39+88zv0TUkAs/LK0TPgu//N+wd/gzuo=;
	b=4xytjZANrNGHnSjzJQoHoS3cZcn0SvOGhrXuHbzH8GT5nST9oczOwXWf8hBqkJ73LkYd
	 t/1cTu8rD/ykal4bgNuGD5b39EXATKQ41gyrj6fe9lrIbi7xKYvKxaJ/RFFqH6ptJYc/8
	 KW+iow1VvTpB1l6avbw7SEJ3qyrk/ML0n5jwbRlrQkKLp3szpXbVGXphPy7jv7rWK9pnE
	 Bw1/VIRfOWMxzzcmKyIXA3U9KI6EApaL3J/dZPbe6jvPMx+1pTNi2JzirPEpDcm8I2H/N
	 nq9Fc6GkMPXgL/X3FWFoW0L92cY5U0uXI+ezWf12VDA3uGbMN+1AGmwrpua9VS5oZOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5HPGoTC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C527606A32C;
	Wed, 18 Nov 2026 16:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5HPGoTC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC53A1F000C7;
	Wed, 18 Nov 2026 16:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017761;
	bh=QwBKZBhqRAe39+88zv0TUkAs/LK0TPgu//N+wd/gzuo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P5HPGoTCSggtGUTnsuPjPdhQaQpmAmODSCopLVRSuEkXD8eRE72t/sVaqdqPy1DRM
	 bKAqY+OQ4N7OVoBca2/a6vwHMVgLvoVWR7BVL7vHU6ij7N53fgAYgGEuVDi9p0v5d/
	 M4ofzvFVpUTSxm2QMjHTdrB/2Om1t+2DdsrsmZiyo6dnZzvnxPNwtr7AhvRc+Jcav/
	 /tdlRUJpEwGW8q2ftJs5NWVE8tDY4/96q086R7g5rH79pOw0MQFdhXf12ll0yaOChE
	 bMsuCurZpWbFikN/1TugZC0d937EqtzggGHtqaaLPM1xWajgypQL45JPNhTBJuyjKR
	 uwfoPhLh1zMWw==
Message-ID: <sashiko-outbox-221406@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/5] drm/imx: Add support for i.MX94 DCIF
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261118-dcif-upstreaming-v12-2-29b35e27a1cc@oss.nxp.com>
References: <20261118-dcif-upstreaming-v12-0-29b35e27a1cc@oss.nxp.com>
 <20261118-dcif-upstreaming-v12-2-29b35e27a1cc@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 16:02:40 +0000
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
- [Medium] drm/imx/dcif: unclocked MMIO access when runtime PM resume
  fails
- [Medium] drm/imx: dcif: unbalanced clock disable if
  dcif_runtime_resume() fails
- [Low] drm/imx/dcif: missing shadow load and trigger clear in
  dcif_crc_source_disable()
--

commit 373caa0eccbfd7fa4334093ea8869b540640e7ab
Author: Sandor Yu <sandor.yu@nxp.com>

drm/imx: Add support for i.MX94 DCIF

This commit adds a DRM/KMS driver for the NXP i.MX94 Display Control
Interface (DCIF), supporting primary and overlay planes, YCbCr-to-RGB CSC
on layer 0, and frame/ROI CRC generation.

> diff --git a/drivers/gpu/drm/imx/dcif/dcif-crc.c b/drivers/gpu/drm/imx/dc=
if/dcif-crc.c
> new file mode 100644
> index 0000000000000..ad94b458a6c59
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcif/dcif-crc.c
[ ... ]
> +void dcif_crc_source_enable(struct dcif_dev *dcif, enum dcif_crc_source =
source,
> +			    struct drm_rect *roi, int ncrc)
> +{
> +	int ret;
> +
> +	if (ncrc >=3D MAX_DCIF_CRC_NUM)
> +		return;
> +
> +	if (source =3D=3D DCIF_CRC_SRC_NONE)
> +		return;
> +
> +	if (dcif->crc_is_enabled)
> +		return;
> +
> +	ret =3D drm_crtc_vblank_get(&dcif->crtc);
> +	if (ret) {
> +		drm_err(&dcif->drm, "Could not get vblank reference: %d\n", ret);
> +		return;
> +	}
> +
> +	dcif_crc_config(dcif, roi, ncrc);
> +
> +	regmap_set_bits(dcif->regmap, DCIF_CRC_CTRL,
> +			DCIF_CRC_CTRL_CRC_MODE | DCIF_CRC_CTRL_CRC_SHADOW_LOAD_EN |
> +			DCIF_CRC_CTRL_CRC_TRIG);
> +
> +	scoped_guard(spinlock_irqsave, &dcif->drm.event_lock)
> +		dcif->crc_is_enabled =3D true;
> +}
> +
> +void dcif_crc_source_disable(struct dcif_dev *dcif, int ncrc)
> +{
> +	if (!dcif->crc_is_enabled)
> +		return;
> +
> +	if (ncrc >=3D MAX_DCIF_CRC_NUM)
> +		return;
> +
> +	regmap_clear_bits(dcif->regmap, DCIF_CRC_CTRL, DCIF_CRC_CTRL_CRC_EN(ncr=
c));

[Severity: Low]
Should dcif_crc_source_disable() also clear DCIF_CRC_CTRL_CRC_TRIG and set
DCIF_CRC_CTRL_CRC_SHADOW_LOAD_EN when disabling CRC on an active CRTC?

Clearing only DCIF_CRC_CTRL_CRC_EN(ncrc) leaves the disabled state
unlatched, and if DCIF_CRC_CTRL_CRC_MODE, DCIF_CRC_CTRL_CRC_SHADOW_LOAD_EN
and DCIF_CRC_CTRL_CRC_TRIG stay set in DCIF_CRC_CTRL, a later
dcif_crc_source_enable() call via regmap_set_bits() will see no bit changes
and skip writing the register.

[ ... ]

> diff --git a/drivers/gpu/drm/imx/dcif/dcif-crtc.c b/drivers/gpu/drm/imx/d=
cif/dcif-crtc.c
> new file mode 100644
> index 0000000000000..233e149929964
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcif/dcif-crtc.c
[ ... ]
> +static void dcif_crtc_atomic_enable(struct drm_crtc *crtc,
> +				    struct drm_atomic_commit *state)
> +{
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, crtc);
> +	struct dcif_crtc_state *dcif_crtc_state =3D to_dcif_crtc_state(crtc_sta=
te);
> +	struct drm_display_mode *adj =3D &crtc_state->adjusted_mode;
> +	struct dcif_dev *dcif =3D crtc_to_dcif_dev(crtc);
> +	struct drm_device *drm =3D crtc->dev;
> +	int ret;
> +
> +	dev_dbg(drm->dev, "mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(adj));
> +
> +	/* enable power when we start to set mode for CRTC */
> +	ret =3D pm_runtime_resume_and_get(drm->dev);
> +	if (ret < 0) {
> +		drm_err(drm, "failed to resume DCIF, ret =3D %d\n", ret);
> +		return;
> +	}
> +	dcif->crtc_pm_enabled =3D true;
[ ... ]
> +static void dcif_crtc_atomic_disable(struct drm_crtc *crtc,
> +				     struct drm_atomic_commit *state)
> +{
> +	struct dcif_dev *dcif =3D crtc_to_dcif_dev(crtc);
> +	struct drm_device *drm =3D crtc->dev;
> +
> +	if (dcif->has_crc)
> +		dcif_crc_source_disable(dcif, 0);
> +
> +	dcif_disable_controller(dcif);
> +	dcif_disable_plane_panic(dcif);
> +
> +	drm_crtc_vblank_off(crtc);
> +
> +	if (dcif->crtc_pm_enabled) {
> +		dcif->crtc_pm_enabled =3D false;
> +		pm_runtime_put_sync(drm->dev);
> +	}

[Severity: Medium]
Can a failure in pm_runtime_resume_and_get() lead to MMIO register accesses
while the DCIF clocks are disabled?

If pm_runtime_resume_and_get() fails in dcif_crtc_atomic_enable(),
dcif->crtc_pm_enabled remains false, but crtc_state->active is still true.
In the same commit tail, drm_atomic_helper_commit_planes() still calls
dcif_plane_atomic_update() and dcif_crtc_atomic_flush(), and a later
dcif_crtc_atomic_disable() calls dcif_crc_source_disable(),
dcif_disable_controller(), and dcif_disable_plane_panic() before checking
dcif->crtc_pm_enabled.  Accessing DCIF registers while the block is
unclocked can cause an external abort or bus hang on i.MX94.

[ ... ]

> diff --git a/drivers/gpu/drm/imx/dcif/dcif-drv.c b/drivers/gpu/drm/imx/dc=
if/dcif-drv.c
> new file mode 100644
> index 0000000000000..80b554f1b6843
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcif/dcif-drv.c
[ ... ]
> +static int dcif_suspend(struct device *dev)
> +{
> +	struct dcif_dev *dcif =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D drm_mode_config_helper_suspend(&dcif->drm);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	return dcif_runtime_suspend(dev);
> +}
> +
> +static int dcif_resume(struct device *dev)
> +{
> +	struct dcif_dev *dcif =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!pm_runtime_suspended(dev)) {
> +		ret =3D dcif_runtime_resume(dev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return drm_mode_config_helper_resume(&dcif->drm);
> +}

[Severity: Medium]
Can a failure in dcif_runtime_resume() during system resume cause an
unbalanced clk_bulk_disable_unprepare()?

When the CRTC is active entering system suspend, the PM core's
device_prepare() holds a runtime PM reference, so the pm_runtime_put_sync()
in dcif_crtc_atomic_disable() leaves the device's runtime PM status as
RPM_ACTIVE.  dcif_suspend() then calls dcif_runtime_suspend() directly,
disabling clocks without updating runtime_status.  If dcif_runtime_resume()
fails in dcif_resume(), clocks remain disabled while runtime_status is
still RPM_ACTIVE, and device_complete() -> pm_runtime_put() will invoke
dcif_runtime_suspend() a second time.  Using pm_runtime_force_suspend() and
pm_runtime_force_resume() would keep runtime_status aligned with the clock
state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-dcif-upstr=
eaming-v12-0-29b35e27a1cc@oss.nxp.com?part=3D2
