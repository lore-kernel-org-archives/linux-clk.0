Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794669682;
	b=rKmntORbstHmsTB8ZJbIw+lrC/kANqC8BFCRPmuhfAaRidf2TWukiJtvMgP5BRFz/tCw
	 YVy/cSzmB9Kqy+DjUbUCsm9K2NCJO+EgC660F/du+/BMUQL518GROxJcqqZ8nZAQ4JK7q
	 LUkAngLzVlbfHAMoHm4VVgmG6ZvgIJNlXZbQJHzjhQokqXKkaQeZ2kbazy8o5MtX5mjxD
	 SuRnalEfD/GuKPM5mloM5MQB581uNKhumTGU4lY9ITGbjAI99C5HTAqFiFWGIegLmT7ht
	 2w/+QK7XUE7USTxL8on/KZNWY5lSM6xX96AX33n4jF5t3gt8FxNKrOWQU1/bSf4Jxpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794669682;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wzPQIx8Z0+gIZTyMDMpKF3VQjIGnBi5IkQQQfxx5pdk=;
	b=YcR9QokhIfv+5BOZDj/7kYPILPZHVl3XG4JD5ksjFafa4mXF7FuPQgUrGLcusYTRkKCg
	 stlX4tIKhnWNd885dOV+sowG5GAuWc5Wd3jrRzwEKre0Q305iDosk1W541UpebHEIU2ux
	 qa4Jlj8YqEhZX3ek4ATX0RfP0Q+N/mM7FGKCnQ9MP8gElO9zWSQ+q3YCrzJhZ3NAqCYdI
	 QNuI+/qko8aNtl/sk89+1twf1wRX7HAFHhpIjRQZ/DZ+wlMblY0M0qKYvC+nFtx6oFSjE
	 FPRh4CdoxKj7mnao20heqaoEi1Bj7/ML2nTV9wKPwndqPfAI9qMwa05Nr8lSYsEfPPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E5wTdWFw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB8A606A323;
	Sat, 14 Nov 2026 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E5wTdWFw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0C61F000C4;
	Sat, 14 Nov 2026 15:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794669681;
	bh=wzPQIx8Z0+gIZTyMDMpKF3VQjIGnBi5IkQQQfxx5pdk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E5wTdWFwsbRGocmX4nWlswBTj7xCsP/oCaembQuRQ2D8Ur+LpHl6T8PqXyqeCabO2
	 Nu3xZGs9b3nbqnzrNoecmWqkzXhO8OAh6pDiaxyqIVLQuyeJa0/T9ae1d7IXy7/HUe
	 L0auaegzInDtU2xA4MgRaz0ej/ajFPFJOBifYsczKNMtGMMlxJgZyEfcxO6uAI04Yt
	 04LINECD90kEChzfpL/w2nIRYkJ1pD7htzKoX+ttM/1a/UXWrWkAbstRGvDQ3uBtCx
	 1kncC8aiM4WmmCAFsqAGxbINcliTOnvvCPq31/MBP9MPsSuIBcuZTD/92FhPs1kxCc
	 MKdH5eQ39wm2Q==
Message-ID: <sashiko-outbox-214695@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 4/6] media: rockchip: rkvenc: Add frequency scaling
 and cooling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Golle" <daniel@makrotopia.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <c15929e16f343db702381ddc214b4732cf7c483a.1794666330.git.daniel@makrotopia.org>
References: <cover.1794666330.git.daniel@makrotopia.org>
 <c15929e16f343db702381ddc214b4732cf7c483a.1794666330.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 15:21:21 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [High] media: rockchip: rkvenc: rkvenc_dvfs_init() leaves initial OPP
  and venc-supply unconfigured
- [High] media: rkvenc: UAF and teardown race in rkvenc_remove() and
  rkvenc_dvfs_exit()
- [Medium] media: rockchip: rkvenc: probe fails in
  rkvenc_dvfs_cooling_init() without THERMAL_OF
- [Medium] media: rockchip: rkvenc: thermal duty-cycle throttling
  bypassed in rkvenc_dvfs_start_allowed()
- [Medium] media: rockchip: rkvenc: devfreq updates stall in
  rkvenc_dvfs_job_end() when round_ctx idles
- [Medium] media: rockchip: rkvenc: unreset last_eval in
  rkvenc_dvfs_job_end() skews first round load
- [Low] media: rockchip: rkvenc: freq / HZ_PER_KHZ truncation in
  rkvenc_cdev_set_state()
--

commit f718f2271f482c079204fa578dffff0091dcfc44
Author: Daniel Golle <daniel@makrotopia.org>

media: rockchip: rkvenc: Add frequency scaling and cooling

This commit adds devfreq-based frequency scaling for the RKVENC core clock
andvenc-supply regulator, along with a thermal cooling device that caps the
maximum frequency via PM QoS and throttles job execution duty cycle.

> diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-dvfs.c b/drive=
rs/media/platform/rockchip/rkvenc/rkvenc-dvfs.c
> new file mode 100644
> index 0000000000000..8b59122d5d983
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-dvfs.c
[ ... ]
> @@ -0,0 +1,364 @@
[ ... ]
> +bool rkvenc_dvfs_start_allowed(struct rkvenc_dev *rkvenc)
> +{
> +	struct rkvenc_dvfs *dvfs =3D &rkvenc->dvfs;
> +	unsigned long flags, delay;
> +	s64 delay_us;
> +	bool allowed;
> +
> +	spin_lock_irqsave(&dvfs->lock, flags);
> +	delay_us =3D ktime_to_us(ktime_sub(dvfs->next_start, ktime_get()));
> +	allowed =3D dvfs->duty_pct >=3D 100 || delay_us <=3D 0;
> +	delay =3D usecs_to_jiffies(clamp_t(s64, delay_us, 0, UINT_MAX));
> +	if (!allowed)
> +		queue_delayed_work(system_wq, &dvfs->throttle_work, delay);
> +	spin_unlock_irqrestore(&dvfs->lock, flags);
> +
> +	return allowed;
> +}

[Severity: Medium]
Can multiple contexts bypass duty-cycle throttling when dvfs->duty_pct < 10=
0?

v4l2_m2m only checks .job_ready() in __v4l2_m2m_try_queue() before placing a
context onto m2m_dev->job_queue; once queued, v4l2_m2m_try_run() pops and
runs contexts via .device_run() without calling .job_ready() again. Because
dvfs->next_start is only updated when a job finishes in
rkvenc_dvfs_job_end() and rkvenc_dvfs_start_allowed() does not check
dvfs->busy, every context scheduled by rkvenc_dvfs_throttle_work() (or via
VIDIOC_QBUF while the first job is running) sees delay_us <=3D 0 and enters
m2m_dev->job_queue to run back-to-back without throttling.

In addition, when rkvenc_finish_job() retries a frame on bitstream overflow,
it calls rkvenc_dvfs_job_end() followed directly by
rkvenc_m2m_ops.device_run(ctx), bypassing rkvenc_dvfs_start_allowed()
completely.

> +
> +void rkvenc_dvfs_job_end(struct rkvenc_dev *rkvenc, struct rkvenc_ctx *c=
tx)
> +{
> +	struct rkvenc_dvfs *dvfs =3D &rkvenc->dvfs;
> +	struct devfreq *devfreq =3D dvfs->devfreq;
> +	unsigned long flags;
> +	bool evaluate;
> +	ktime_t now;
> +
> +	spin_lock_irqsave(&dvfs->lock, flags);
> +	now =3D ktime_get();
> +	dvfs->busy_total =3D
> +		ktime_add(dvfs->busy_total, ktime_sub(now, dvfs->busy_since));
> +	dvfs->next_start =3D ktime_add_ns(
> +		dvfs->job_start,
> +		div_u64(ktime_to_ns(ktime_sub(now, dvfs->job_start)) * 100,
> +			dvfs->duty_pct));
> +	dvfs->busy =3D false;
> +	/* A round ends with the context that opened it, covering every other o=
ne */
> +	evaluate =3D dvfs->round_ctx =3D=3D ctx;
> +	if (!dvfs->round_ctx)
> +		dvfs->round_ctx =3D ctx;

[Severity: Medium]
Does opening a new evaluation round when dvfs->round_ctx is NULL leave a
stale dvfs->last_eval from before the encoder was idle?

dvfs->last_eval is only initialized in rkvenc_dvfs_init() and updated in
rkvenc_dvfs_status(). When the first job after boot or after VIDIOC_STREAMO=
FF
sets dvfs->round_ctx =3D ctx, dvfs->last_eval and dvfs->busy_total are not
reset, so on the next job completion rkvenc_dvfs_status() computes
stat->total_time across the entire preceding idle period and drops the clock
to the lowest OPP.

> +	spin_unlock_irqrestore(&dvfs->lock, flags);
> +	wake_up(&dvfs->idle_wq);
> +
> +	if (!devfreq || !evaluate)
> +		return;
> +
> +	mutex_lock(&devfreq->lock);
> +	update_devfreq(devfreq);
> +	mutex_unlock(&devfreq->lock);
> +}

[Severity: Medium]
What happens to frequency scaling if the context stored in dvfs->round_ctx
stops submitting jobs without calling VIDIOC_STREAMOFF or closing the fd?

dvfs->round_ctx is only cleared in rkvenc_dvfs_ctx_idle() from
rkvenc_stop_streaming() and rkvenc_release(). If that context finishes
draining via v4l2_m2m_mark_stopped() or hits vb2_queue_error() in
rkvenc_finish_job() (which then calls rkvenc_dvfs_job_end() and keeps or
assigns dvfs->round_ctx =3D ctx), or if userspace simply pauses queueing
frames on that context while other contexts keep streaming, evaluate will
never be true again and update_devfreq() stops running.

[ ... ]

> +static int rkvenc_cdev_set_state(struct thermal_cooling_device *cdev,
> +				 unsigned long state)
> +{
> +	struct rkvenc_dvfs *dvfs =3D cdev->devdata;
> +	unsigned long idx =3D min_t(unsigned long, state, dvfs->num_freqs - 1);
> +	unsigned long freq =3D dvfs->freqs[dvfs->num_freqs - 1 - idx];
> +	unsigned long flags;
> +	int ret;
> +
> +	ret =3D dev_pm_qos_update_request(&dvfs->max_freq_req, freq / HZ_PER_KH=
Z);
> +	if (ret < 0)
> +		return ret;
> +
> +	spin_lock_irqsave(&dvfs->lock, flags);
> +	dvfs->duty_pct =3D 100 - RKVENC_THROTTLE_STEP_PCT * (state - idx);
> +	spin_unlock_irqrestore(&dvfs->lock, flags);
> +	dvfs->cooling_state =3D state;
> +
> +	return 0;
> +}

[Severity: Low]
Should freq / HZ_PER_KHZ use DIV_ROUND_UP(freq, HZ_PER_KHZ) here?

devfreq converts the PM QoS maximum frequency back to Hz via
HZ_PER_KHZ * qos_max_freq and looks up the target OPP with
DEVFREQ_FLAG_LEAST_UPPER_BOUND (floor), so truncating an OPP frequency that
is not an exact multiple of 1000 Hz drops the limit below that OPP and
selects the next lower one. Also, state is not bounds-checked against
dvfs->num_freqs - 1 + RKVENC_THROTTLE_STEPS before computing dvfs->duty_pct.

[ ... ]

> +static int rkvenc_dvfs_cooling_init(struct rkvenc_dev *rkvenc)
> +{
> +	struct rkvenc_dvfs *dvfs =3D &rkvenc->dvfs;
> +	struct device *dev =3D rkvenc->dev;
> +	int ret;
> +
> +	if (!of_property_present(dev->of_node, "#cooling-cells"))
> +		return 0;
> +
> +	ret =3D dev_pm_qos_add_request(dev, &dvfs->max_freq_req,
> +				     DEV_PM_QOS_MAX_FREQUENCY,
> +				     PM_QOS_MAX_FREQUENCY_DEFAULT_VALUE);
> +	if (ret < 0)
> +		return ret;
> +	dvfs->qos_added =3D true;
> +
> +	dvfs->cdev =3D thermal_of_cooling_device_register(
> +		dev->of_node, 0, "rkvenc", dvfs, &rkvenc_cdev_ops);
> +	if (IS_ERR(dvfs->cdev)) {
> +		ret =3D PTR_ERR(dvfs->cdev);
> +		dvfs->cdev =3D NULL;
> +		return dev_err_probe(dev, ret,
> +				     "could not add the cooling device\n");
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Does rkvenc_probe() fail with -ENODEV when CONFIG_THERMAL_OF is disabled?

VIDEO_ROCKCHIP_RKVENC does not depend on or select THERMAL or THERMAL_OF in
Kconfig. When CONFIG_THERMAL_OF is disabled, the
thermal_of_cooling_device_register() stub returns ERR_PTR(-ENODEV), which
aborts probe on any board whose device tree node has #cooling-cells.

> +
> +int rkvenc_dvfs_init(struct rkvenc_dev *rkvenc)
> +{
[ ... ]
> +	if (of_property_present(dev->of_node, "venc-supply"))
> +		opp_config.regulator_names =3D supply_names;
> +
> +	ret =3D devm_pm_opp_set_config(dev, &opp_config);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_pm_opp_of_add_table(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D rkvenc_dvfs_freqs_get(rkvenc);
> +	if (ret)
> +		return ret;
> +
> +	dvfs->profile.target =3D rkvenc_dvfs_target;
> +	dvfs->profile.get_dev_status =3D rkvenc_dvfs_status;
> +	dvfs->profile.get_cur_freq =3D rkvenc_dvfs_cur_freq;
> +	dvfs->profile.freq_table =3D dvfs->freqs;
> +	dvfs->profile.max_state =3D dvfs->num_freqs;
> +	rkvenc_dvfs_cur_freq(dev, &dvfs->profile.initial_freq);
> +
> +	devfreq =3D devfreq_add_device(dev, &dvfs->profile,
> +				     DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);

[Severity: High]
Does anything enable and configure venc-supply or set an initial OPP before
the first round of encoding jobs completes?

devm_pm_opp_set_config() only acquires venc-supply via
regulator_get_optional(); the OPP core does not enable the regulator or
configure its voltage until dev_pm_opp_set_rate() or dev_pm_opp_set_opp() is
called. Because polling is disabled, devfreq_add_device() does not invoke
rkvenc_dvfs_target() at registration time, so RKVENC_VERSION is read in
rkvenc_probe() and the first round of jobs runs on the hardware before
dev_pm_opp_set_rate() is ever called (and regulator_init_complete() can
disable a boot-on venc-supply as unused). In addition, setting
dvfs->profile.initial_freq directly from clk_get_rate() without rounding it
to an OPP entry causes devfreq_update_status() to fail with -EINVAL on the
first transition if the boot clock rate does not exactly match an OPP.

> diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc.c b/drivers/me=
dia/platform/rockchip/rkvenc/rkvenc.c
> index 00778e97686d7..f15a0922059f1 100644
> --- a/drivers/media/platform/rockchip/rkvenc/rkvenc.c
> +++ b/drivers/media/platform/rockchip/rkvenc/rkvenc.c
[ ... ]
> @@ -442,6 +450,7 @@ static void rkvenc_remove(struct platform_device *pde=
v)
>  	struct rkvenc_dev *rkvenc =3D platform_get_drvdata(pdev);
> =20
>  	cancel_delayed_work_sync(&rkvenc->watchdog);
> +	rkvenc_dvfs_exit(rkvenc);
>  	rkvenc_v4l2_cleanup(rkvenc);
>  	v4l2_m2m_release(rkvenc->m2m_dev);
>  	v4l2_device_unregister(&rkvenc->v4l2_dev);

[Severity: High]
Can calling rkvenc_dvfs_exit() before rkvenc_v4l2_cleanup() and
v4l2_m2m_release() cause a use-after-free during driver teardown?

While V4L2 contexts and an in-flight job are still active, rkvenc_dvfs_exit=
()
frees dvfs->devfreq before clearing the pointer and cancels
dvfs->throttle_work while dvfs->duty_pct can still be below 100:

CPU0                                  CPU1
rkvenc_remove()
  rkvenc_dvfs_exit()
    devfreq_remove_device(dvfs->devfreq)
                                      rkvenc_irq_thread()
                                        rkvenc_finish_job()
                                          rkvenc_dvfs_job_end()
                                            mutex_lock(&devfreq->lock)
                                              <-- use-after-free
    cancel_delayed_work_sync(&dvfs->throttle_work)
                                          v4l2_m2m_buf_done_and_job_finish()
                                            ...
                                              rkvenc_dvfs_start_allowed()
                                                queue_delayed_work(...,
                                                  &dvfs->throttle_work, ...)
  ...
  (devm frees rkvenc)
                                      rkvenc_dvfs_throttle_work()
                                        <-- use-after-free on rkvenc

Also, in rkvenc_dvfs_exit(), calling dev_pm_qos_remove_request() before
devfreq_remove_device() fires devfreq's max-frequency QoS notifier and runs
update_devfreq() -> rkvenc_dvfs_target() during teardown right before
devfreq is removed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794666330.gi=
t.daniel@makrotopia.org?part=3D4
