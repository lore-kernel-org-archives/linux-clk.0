Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794669310;
	b=yjpJkACCipMNfO9gskli19Iw+t2Chz2xOm+dd/lVwRJ55sB1JhVp9KpYwyQ/K6kStwi5
	 sRZETCMSgLwB7umIfi+rFE4JSrlzVwNIJKAwlvxSjYsv/e9O5xrMb/3d4jP0cHZwmBlHY
	 cuo84z6RUPcSiDrZeZc1CTSICqmR8Lh6VDjiEKQRF34JVMIOdV1LmdcuM9DEw9yzuHjRg
	 QHx64VI15EQLfK2UTxRZtPlOzCoRcClIXnyHGofAitiV/8wiC9kK5nen77Jjy2/rWN9FE
	 ipuQ5XehGb4nSYIe3WAJD+snPc95vwpYDQ04qQc31ZNZWNUKotLpNmKDNH9zUGBXEMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794669310;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hfXozuOrfnsjtn7Dwq094tyoh/kCv611XtsLq2FcXaI=;
	b=v61J82p7s5K5Rm0X1nlF9tLIbQWpWr5rEu/UZ0xtLTLnQxjJRXKjFgIo5bWwPPz9auhm
	 HPNlTmrN8ulxUTQmQxmQ9yhnwPEL4zMtQ6CX4xz07pEzUe0vadQAMW+YDiGkD8jCOHmxC
	 Snn5Ukj5kDznsVdmmGHuw2CUcbX2M3ydoQMbkJEs4PnFXT3sprPUYnAowrRo6GwCk/oqw
	 G3CtF3qqTXJlKq8+V/7diG2n8EraDe4gOsJvPbCtLorvqxZol60mwQQ/TXQDRC7AzCE+U
	 2ct0/orJ5CAyi9yzWDsrcPgmfhYQ5VDR+TiQHeBirQkYyD23mZF2qzt9s4YfuygfF7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z4LXO8cZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E64606A323;
	Sat, 14 Nov 2026 15:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z4LXO8cZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED601F000C4;
	Sat, 14 Nov 2026 15:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794669309;
	bh=hfXozuOrfnsjtn7Dwq094tyoh/kCv611XtsLq2FcXaI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z4LXO8cZSYjPbqhqfFkocQKQeAHoriNIiV8zTkQUxplgNuQMiFFTvOa6xxR/E+UNE
	 DSlcBiuwh5w0gh9AQrXDFpsLYWQoC89mnSuMGGdT3LSlHLSI810g4n+zp6hoP+k7EF
	 xkVjPVoBwa78z91pgUJW89hmokrDmDVjBy+5iMy5mxgW0ikOKqlLI4tY2KisRFiht1
	 fIOsr/cXF0SvPmjCkf4XrkrIoliJykrpGvtKKwKeD2/HC8ztkHeNCY3kswNnUoz3g+
	 AVcmYEL38MVRGhrUI+G4X+NiZ+yyxJZT0tg13vzFICYJA6U19hOnDYgfv3aldEIx4z
	 MkPr7q6sv9vJA==
Message-ID: <sashiko-outbox-214680@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 6/6] ARM: dts: rockchip: Add RKVENC operating points
 to RV1126
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Golle" <daniel@makrotopia.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <13212e28d26fde53f49c1838bb099f1f6b419dfd.1794666330.git.daniel@makrotopia.org>
References: <cover.1794666330.git.daniel@makrotopia.org>
 <13212e28d26fde53f49c1838bb099f1f6b419dfd.1794666330.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 15:15:08 +0000
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
- [High] media: rkvenc: probe fails in rkvenc_dvfs_cooling_init()
  without THERMAL_OF
- [High] media: rkvenc: teardown race in rkvenc_remove() and UAF in
  rkvenc_release()
- [High] media: rkvenc: SCLR_DONE IRQ and unlocked job_running race in
  rkvenc
- [High] media: rkvenc: slot DMA buffer overflow via
  rkvenc_s_fmt_vid_out()
- [Medium] media: rkvenc: missing initial OPP and PM lifecycle for
  venc-supply
- [Medium] media: rkvenc: unbalanced pm_runtime_enable() in
  rkvenc_probe()
--

commit f41b6ddf3d36774f6ef1b61d948fc7c27e1896c8
Author: Daniel Golle <daniel@makrotopia.org>

ARM: dts: rockchip: Add RKVENC operating points to RV1126

This commit adds the operating points table for the RKVENC video encoder on
RV1126 and registers the encoder node as a cooling device.

> diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/r=
ockchip/rv1126.dtsi
> index 63705291dd3ce..7e37fd89609a7 100644
> --- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
> +++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
> @@ -104,6 +104,30 @@ xin24m: oscillator {
>  		#clock-cells =3D <0>;
>  	};
> =20
> +	venc_opp_table: opp-table-venc {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-297000000 {
> +			opp-hz =3D /bits/ 64 <297000000>;
> +			opp-microvolt =3D <725000 725000 1000000>;
> +		};

[Severity: Medium]
On boards that define venc-supply, does rkvenc_dvfs_init() ever apply the
initial OPP voltage or disable venc-supply across runtime suspend?

In commit "media: rockchip: rkvenc: Add frequency scaling and cooling",
devm_pm_opp_set_config() acquires venc-supply without enabling it or
setting its voltage, and devfreq_add_device() does not run an initial
update_devfreq() because polling_ms is 0:

drivers/media/platform/rockchip/rkvenc/rkvenc-dvfs.c:rkvenc_dvfs_init() {
    ...
	if (of_property_present(dev->of_node, "venc-supply"))
		opp_config.regulator_names =3D supply_names;

	ret =3D devm_pm_opp_set_config(dev, &opp_config);
	if (ret)
		return ret;

	ret =3D devm_pm_opp_of_add_table(dev);
    ...
}

As a result, the first batch of encode jobs runs at the 396 MHz assigned
clock rate before dev_pm_opp_set_rate() has ever configured or enabled
venc-supply. Once rkvenc_dvfs_job_end() later triggers dev_pm_opp_set_rate(=
),
rkvenc_runtime_suspend() only disables clocks without calling
dev_pm_opp_set_rate(dev, 0), leaving venc-supply enabled at the last active
OPP voltage (up to 825 mV) while idle.

[ ... ]

> @@ -665,6 +689,8 @@ venc: video-codec@ffbb0000 {
>  		clock-names =3D "axi", "ahb", "core";
>  		assigned-clocks =3D <&cru ACLK_VENC>, <&cru CLK_VENC_CORE>;
>  		assigned-clock-rates =3D <297000000>, <396000000>;
> +		operating-points-v2 =3D <&venc_opp_table>;
> +		#cooling-cells =3D <2>;

[Severity: High]
Does adding #cooling-cells =3D <2> cause rkvenc_probe() to fail with -ENODEV
when CONFIG_THERMAL_OF is disabled?

VIDEO_ROCKCHIP_RKVENC does not depend on or select THERMAL or THERMAL_OF,
and thermal_of_cooling_device_register() returns ERR_PTR(-ENODEV) when
CONFIG_THERMAL_OF is disabled, which rkvenc_dvfs_cooling_init() treats as a
fatal probe error:

drivers/media/platform/rockchip/rkvenc/rkvenc-dvfs.c:rkvenc_dvfs_cooling_in=
it() {
	if (!of_property_present(dev->of_node, "#cooling-cells"))
		return 0;
    ...
	dvfs->cdev =3D thermal_of_cooling_device_register(
		dev->of_node, 0, "rkvenc", dvfs, &rkvenc_cdev_ops);
	if (IS_ERR(dvfs->cdev)) {
		ret =3D PTR_ERR(dvfs->cdev);
		dvfs->cdev =3D NULL;
		return dev_err_probe(dev, ret,
				     "could not add the cooling device\n");
	}
}

[Severity: Medium]
In commit "media: rockchip: Add RKVENC v1 video encoder driver", does
rkvenc_probe() leave runtime PM enabled if pm_runtime_resume_and_get()
fails?

drivers/media/platform/rockchip/rkvenc/rkvenc.c:rkvenc_probe() {
    ...
	pm_runtime_enable(dev);

	ret =3D pm_runtime_resume_and_get(dev);
	if (ret)
		return ret;
    ...
err_pm_disable:
	pm_runtime_disable(dev);
	return ret;
}

Returning directly instead of jumping to err_pm_disable leaves
dev->power.disable_depth unbalanced.

[Severity: High]
In commits "media: rockchip: Add RKVENC v1 video encoder driver" and
"media: rockchip: rkvenc: Add frequency scaling and cooling", can
rkvenc_remove() and rkvenc_release() trigger a use-after-free on
dvfs->devfreq, rkvenc_dev, and rkvenc->m2m_dev?

drivers/media/platform/rockchip/rkvenc/rkvenc.c:rkvenc_remove() {
	struct rkvenc_dev *rkvenc =3D platform_get_drvdata(pdev);

	cancel_delayed_work_sync(&rkvenc->watchdog);
	rkvenc_dvfs_exit(rkvenc);
	rkvenc_v4l2_cleanup(rkvenc);
	v4l2_m2m_release(rkvenc->m2m_dev);
	v4l2_device_unregister(&rkvenc->v4l2_dev);
	pm_runtime_disable(&pdev->dev);
}

rkvenc_remove() cancels the watchdog and tears down DVFS before stopping
V4L2/M2M:

CPU0                              CPU1
rkvenc_remove()
  rkvenc_dvfs_exit()
                                  rkvenc_irq_thread()
                                    rkvenc_finish_job()
                                      rkvenc_dvfs_job_end()
                                        devfreq =3D dvfs->devfreq
    devfreq_remove_device(devfreq)
                                        mutex_lock(&devfreq->lock)
                                          <-- use-after-free

In addition, active jobs during rkvenc_dvfs_exit() can re-queue
dvfs->throttle_work and rkvenc->watchdog after cancel_delayed_work_sync().
Finally, because struct rkvenc_dev is allocated with devm_kzalloc() and
rkvenc->m2m_dev is freed in rkvenc_remove(), closing an open V4L2 file
descriptor after unbind runs rkvenc_release() ->
rkvenc_dvfs_ctx_del(ctx->dev, ctx) and v4l2_m2m_ctx_release(ctx->m2m_ctx)
on freed ctx->dev and rkvenc->m2m_dev memory.

[Severity: High]
In commit "media: rockchip: Add RKVENC v1 video encoder driver", can
rkvenc_hw_recover() and unlocked updates to dev->job_running race with
rkvenc_irq_thread() and rkvenc_watchdog_work()?

First, the IRQ is registered with IRQF_ONESHOT, which keeps the interrupt
line masked while rkvenc_irq_thread() is running. When rkvenc_finish_job()
-> rkvenc_hw_recover() waits on dev->sclr_done from inside
rkvenc_irq_thread(), RKVENC_INT_SCLR_DONE cannot be delivered until
rkvenc_irq_thread() returns, so wait_for_completion_timeout() always times
out and the subsequent RKVENC_INT_SCLR_DONE interrupt wakes a spurious
rkvenc_irq_thread().

Second, rkvenc_device_run() sets dev->job_ctx and dev->job_running =3D true
without holding dev->irq_lock and before sleeping in
rkvenc_dvfs_job_begin(), calling pm_runtime_resume_and_get(), and starting
the hardware in rkvenc_hw_run():

CPU0                              CPU1
rkvenc_device_run()
  dev->job_ctx =3D ctx
  dev->job_running =3D true
  rkvenc_dvfs_job_begin()
                                  rkvenc_irq_thread() /
                                  rkvenc_watchdog_work()
                                    spin_lock_irqsave(&dev->irq_lock)
                                    if (dev->job_running)
                                      dev->job_running =3D false
                                    spin_unlock_irqrestore(&dev->irq_lock)
                                    rkvenc_finish_job()
                                      pm_runtime_put()
                                      v4l2_m2m_buf_done_and_job_finish()
  pm_runtime_resume_and_get()
  rkvenc_hw_run()  <-- starts DMA on completed vb2 buffers

When the spurious rkvenc_irq_thread() or a racing rkvenc_watchdog_work()
(since rkvenc_irq_thread() uses non-sync cancel_delayed_work()) runs in
that window, rkvenc_finish_job() reads MMIO while the device may be
suspended, underflows the runtime PM usage count, and returns the vb2
buffers to userspace before rkvenc_hw_run() starts DMA on them.

[Severity: High]
In commit "media: rockchip: Add RKVENC v1 video encoder driver", can
changing the OUTPUT format while CAPTURE is streaming overflow the
reference frame DMA buffers?

rkvenc_start_streaming() only calls rkvenc_ref_alloc() when starting the
CAPTURE queue, sizing ctx->slot[] from ctx->width and ctx->height once while
ctx->slots_alloc is false. However, rkvenc_s_fmt_vid_out() only checks
whether the OUTPUT queue is busy before updating ctx->width and ctx->height:

drivers/media/platform/rockchip/rkvenc/rkvenc-v4l2.c:rkvenc_s_fmt_vid_out()=
 {
	struct rkvenc_ctx *ctx =3D fh_to_rkvenc_ctx(file->private_data);
	struct vb2_queue *vq =3D v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);

	if (vb2_is_busy(vq))
		return -EBUSY;

	rkvenc_try_fmt_vid_out(ctx, f);
    ...
	ctx->width =3D f->fmt.pix_mp.width;
	ctx->height =3D f->fmt.pix_mp.height;
}

If userspace starts streaming on CAPTURE first and then increases the
OUTPUT dimensions with VIDIOC_S_FMT before starting OUTPUT,
rkvenc_device_run() programs the encoder with the larger resolution while
DMA-writing reconstructed frames into the smaller ctx->slot[] buffers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794666330.gi=
t.daniel@makrotopia.org?part=3D6
