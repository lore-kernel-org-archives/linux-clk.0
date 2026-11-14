Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670069;
	b=bG7Okt1+5cL8EJMPCIubVGnE3aw5vcEdYaqyzrpTs5IbuuvQIktYMy8F0h1FA2Ep9IWA
	 FOBSH7EiahbhLXSHJLpckLrrU0N1k2ysFwZ2NYnLaOBwXqFNErGlfo8TNIxoieBw7QFQc
	 WAJZpef1OIoM20Yr6MmKLstLmbZNeya0OwR1HCeYJF7I1irnUIBwJKxnQk0sykZorRhiU
	 OzqpA3KNfWuv4XQ4GjP1k9Y/Il6GDXRPwUwc4An1d+GSiCSuQ9g7M7jCKQLBQ7pLR2LmC
	 mzWrJ6sL142AXe49yUOZrlmCKphLcQN/kE3pfom8D++D0CpUho2cFrwKq1aL097VBoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670069;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7IVdr+uqnW+Vi4Od41lDdlPqBibgzrIZeRRWaXIuQHY=;
	b=h0nupVasVxMRrqQnU1M3d3RtA5pqlLvVU/mpC9GVibPIzc88Tshzkd1zJh2qm355jADu
	 HuRZI9OjWKsTzr+EmtTzwRX6TwLhlx1oCm+iSHScVhpYyclNK1t6coFOBCOoOUZy3rVTU
	 2iiG0+wyf5LlZIFzECe9O5DnD/WlzajgbhFvcxvxpvlSXj5yb7XKQL/SinkJqdsSzlsGg
	 sA7VG8ObMGK26VVl1fh7GsdDznW1F7LYcM7x+37pH2ET3Xb6QpHHpt6t+LIrqKIgW26Da
	 fnREEshHL9g8WuUaGJ+lcZzOB0YivoTMc83BzL1hvU0HtyFiX73ctz0c3ae3bqcd34A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WhoTydmW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EA4606A327;
	Sat, 14 Nov 2026 15:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WhoTydmW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A480D1F000C5;
	Sat, 14 Nov 2026 15:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794670069;
	bh=7IVdr+uqnW+Vi4Od41lDdlPqBibgzrIZeRRWaXIuQHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WhoTydmWRonlsfVneAtx+yLkTIvAgC+otAbBJMGgKFw6CfhPGLaDlhNy7r7patyi0
	 5GiVcZkBZhVm6MdrYM68vhxbJsF6inDxXZo0DeVylmScU+imBR/mUVc5xECfEa8xpJ
	 O0KYmTZjsXodrw9DmAQenWUPfH9xPBCveekEyWaoO5GCwFj2L6OKeUMqSE1k93W05s
	 dReGflTFrCkdw/HUD6x1of8hPyYQLqUpVUivmI1m3/iKaKBDS7m4Uh1vZXW/RssorB
	 52u/q2hYTmrUX5F/FgRnndaAds779gXziQVNn+jponeAF71TW3TQwiHqjL55gCC1g/
	 v6+zJwfyGo2Aw==
Message-ID: <sashiko-outbox-214704@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 3/6] media: rockchip: Add RKVENC v1 video encoder
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Golle" <daniel@makrotopia.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <96b018d341e884c12e1d5c5c6d42880f134a644c.1794666330.git.daniel@makrotopia.org>
References: <cover.1794666330.git.daniel@makrotopia.org>
 <96b018d341e884c12e1d5c5c6d42880f134a644c.1794666330.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 15:27:48 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 22 potential
issues to consider:
- [High] media: rkvenc: DMA buffer overflow via rkvenc_s_fmt_vid_out()
  while streaming
- [High] media: rkvenc: missing NV12M plane 1 and data_offset check in
  rkvenc_buf_prepare()
- [High] media: rkvenc: divide-by-zero in rkvenc_rc_pick() and 32-bit RC
  overflows
- [High] media: rkvenc: missing plane 1 and data_offset checks in
  rkvenc_buf_prepare()
- [High] media: rkvenc: premature watchdog cancel in rkvenc_remove()
  before cleanup
- [High] media: rkvenc: SCLR_DONE masked by IRQF_ONESHOT in
  rkvenc_hw_recover()
- [High] media: rkvenc: watchdog cancel race in rkvenc_irq_thread() and
  device_run()
- [High] media: rockchip: rkvenc: job_running races in IRQ, watchdog,
  and device_run()
- [Medium] media: rkvenc: unreachable I-frame RC model and broken IDR
  overflow retry
- [Medium] media: rkvenc: VB2_BUF_STATE_DONE in rkvenc_buf_queue() and
  stale header_mode
- [Medium] media: rkvenc: rkvenc_gop_commit() drops concurrent
  force_keyframe requests
- [Medium] media: rkvenc: missing CREATE_BUFS validation in
  rkvenc_queue_setup()
- [Medium] media: rkvenc: rkvenc_apply_ctrls() prevents setting gop_size
  below 30
- [Medium] media: rkvenc: control handler leak on error in
  rkvenc_init_ctrls()
- [Medium] media: rkvenc: missing pm_runtime_disable() on error in
  rkvenc_probe()
- [Medium] media: rkvenc: rkvenc_try_fmt_vid_cap() ignores active OUTPUT
  dimensions
- [Medium] media: rockchip: rkvenc: userspace control/format values
  trigger WARN_ON()
- [Medium] media: rockchip: rkvenc: broken control updates and IDR
  header refresh in v4l2
- [Medium] media: rockchip: rkvenc: missing pm_runtime_disable() on
  probe error path
- [Medium] media: rockchip: rkvenc: watchdog canceled before V4L2/M2M
  teardown in remove()
- [Low] media: rkvenc: HEVC merge candidate 0 overridden in
  rkvenc_hevc_setup()
- [Low] media: rkvenc: CAPTURE format mismatch and round_up() overflow
  in try_fmt
--

commit aafc130d19efda3692073c7ce74ebbd170ec8aca
Author: Daniel Golle <daniel@makrotopia.org>

media: rockchip: Add RKVENC v1 video encoder driver

This commit adds a stateful V4L2 memory-to-memory H.264 and HEVC video
encoder driver for the Rockchip RKVENC v1 IP on RV1109/RV1126 and
RK3566/RK3568 SoCs.

> diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-gop.c b/driver=
s/media/platform/rockchip/rkvenc/rkvenc-gop.c
> new file mode 100644
> index 0000000000000..208bb122a3f87
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-gop.c
> @@ -0,0 +1,72 @@

[ ... ]

> +void rkvenc_gop_commit(struct rkvenc_ctx *ctx)
> +{
> +	struct rkvenc_gop *g =3D &ctx->gop;
> +
> +	if (ctx->cur_intra) {
> +		g->idr_pic_id++;
> +		ctx->last_good =3D ctx->cur;
> +		ctx->last_good_valid =3D true;
> +		g->frames_since_idr =3D 1;
> +	} else {
> +		g->frames_since_idr++;
> +	}
> +	ctx->last =3D ctx->cur;
> +	ctx->cur ^=3D 1;
> +	ctx->c.force_keyframe =3D false;
> +}
> +
> +void rkvenc_gop_rollback(struct rkvenc_ctx *ctx)
> +{
> +	ctx->c.force_keyframe =3D false;
> +}
> +
> +void rkvenc_gop_force_keyframe(struct rkvenc_ctx *ctx)
> +{
> +	ctx->c.force_keyframe =3D true;
> +}

[Severity: Medium]
Does clearing ctx->c.force_keyframe unconditionally in rkvenc_gop_commit()
and rkvenc_gop_rollback() drop keyframe requests that arrive while a frame
is in flight?

CPU0                              CPU1
rkvenc_device_run()
  idr =3D rkvenc_gop_is_idr(ctx)
  /* false: starts a P frame */
                                  rkvenc_s_ctrl()
                                    rkvenc_gop_force_keyframe(ctx)
                                      ctx->c.force_keyframe =3D true
rkvenc_irq_thread()
  rkvenc_finish_job()
    rkvenc_gop_commit(ctx)
      ctx->c.force_keyframe =3D false  <-- request lost before next frame

Consuming ctx->c.force_keyframe when rkvenc_device_run() decides idr =3D tr=
ue
(or only clearing it when committing an intra frame) would preserve requests
made while a P frame is encoding.

> diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c b/drive=
rs/media/platform/rockchip/rkvenc/rkvenc-hevc.c
> new file mode 100644
> index 0000000000000..49bf3cccdf8a0
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c
> @@ -0,0 +1,63 @@

[ ... ]

> +int rkvenc_hevc_setup(struct rkvenc_ctx *ctx)
> +{
> +	struct rkvenc_hevc_seq *seq =3D &ctx->hevc_seq;
> +
> +	memset(seq, 0, sizeof(*seq));
> +	seq->width =3D ctx->width;
> +	seq->height =3D ctx->height;
> +	seq->level_idc =3D rkvenc_hevc_level(ctx->c.level);
> +	seq->log2_max_poc_lsb_m4 =3D 4;
> +	seq->pic_init_qp =3D ctx->c.p_frame_qp;
> +	seq->max_merge_cand =3D ctx->c.hevc_max_merge ?: 2;

[Severity: Low]
Does using ?: 2 here prevent setting
V4L2_CID_MPEG_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1 to 0?  rkvenc_init_ctrls()
registers that control with a minimum of 0, so a valid control value of 0 is
overwritten with 2.

Also, V4L2_CID_MPEG_VIDEO_HEVC_TMV_PREDICTION is registered and stored into
ctx->c.hevc_tmv in rkvenc_apply_ctrls(), and ctx->vlock is initialized in
rkvenc_open(), but neither is used anywhere in the driver.

[ ... ]

> diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-rc.c b/drivers=
/media/platform/rockchip/rkvenc/rkvenc-rc.c
> new file mode 100644
> index 0000000000000..b7ab57e490cf0
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-rc.c
> @@ -0,0 +1,214 @@

[ ... ]

> +static u32 rkvenc_rc_capacity(struct rkvenc_ctx *ctx)
> +{
> +	if (ctx->c.vbv_size)
> +		return ctx->c.vbv_size;
> +	return ctx->rc_tavg * max_t(u32, ctx->c.gop_size, 1);
> +}

[ ... ]

> +	if (ctx->rc_x[0] && ctx->rc_x[1]) {
> +		u64 w =3D div_u64((u64)ctx->rc_x[0] * 256,
> +				ctx->rc_x[1] ?: 1);
> +		u32 n =3D max_t(u32, ctx->c.gop_size, 1);
> +		u64 t_p, t_t;
> +
> +		w =3D min_t(u64, w, RKVENC_RC_W_CLAMP);
> +		t_p =3D div64_u64((u64)ctx->rc_tavg * n * 256,
> +				w + 256 * (n - 1));
> +		t_t =3D t ? t_p : t_p * w / 256;
> +		t_t =3D rkvenc_rc_correct(ctx, t_t, n);
> +
> +		target =3D (u32)div_u64((u64)ctx->rc_x[t] * 256, t_t);
> +
> +		for (q =3D 0; q <=3D RKVENC_QP_MAX; q++)
> +			if (rkvenc_qs[q] >=3D target)
> +				break;
> +		if (q > RKVENC_QP_MAX)
> +			q =3D RKVENC_QP_MAX;
> +	} else {
> +		q =3D prev;
> +	}

[ ... ]

> +void rkvenc_rc_update(struct rkvenc_ctx *ctx, u32 bytes, u32 qp_avg,
> +		     u8 frame_type)
> +{
> +	unsigned int t =3D frame_type ? 1 : 0;
> +	u64 s =3D (u64)bytes * 8;
> +	s64 cap =3D max_t(u64, rkvenc_rc_capacity(ctx), 1);
> +
> +	if (!ctx->rc_active)
> +		return;
> +
> +	ctx->rc_x[t] =3D rkvenc_rc_complexity(ctx, t, s, qp_avg);
> +
> +	ctx->rc_buf +=3D (s32)s - (s32)ctx->rc_tavg;
> +	ctx->rc_buf =3D clamp_t(s64, ctx->rc_buf, -cap, cap);
> +
> +	ctx->rc_first[t] =3D false;
> +}

[Severity: High]
Can div64_u64() in rkvenc_rc_pick() divide by zero when ctx->c.gop_size is =
0?

When ctx->c.gop_size is 0 (allowed by the 0..300 control range), n is 1.
If a low-complexity, low-QP I frame is followed by a high-complexity, high-=
QP
P frame such that ctx->rc_x[1] > (u64)ctx->rc_x[0] * 256, w truncates to 0
and the divisor w + 256 * (n - 1) becomes 0.

In addition, ctx->rc_tavg * max_t(u32, ctx->c.gop_size, 1) in
rkvenc_rc_capacity() can overflow u32 at high bitrates and low frame rates
(e.g. 40 Mbps at 1 fps with gop_size =3D 300), and ctx->rc_buf +=3D (s32)s -
(s32)ctx->rc_tavg in rkvenc_rc_update() can overflow 32-bit signed
arithmetic before being clamped to [-cap, cap].

> +/* The step limit alone would need frames that the overflow keeps droppi=
ng */
> +void rkvenc_rc_overflow(struct rkvenc_ctx *ctx, u32 bytes, u8 frame_type)
> +{
> +	s8 start =3D frame_type ? ctx->c.p_frame_qp : ctx->c.i_frame_qp;
> +	unsigned int t =3D frame_type ? 1 : 0;
> +
> +	rkvenc_rc_update(ctx, bytes, ctx->cur_qp, frame_type);
> +	if (ctx->rc_qp[t] < start)
> +		ctx->rc_qp[t] =3D start;
> +}

[Severity: Medium]
Does the I-frame rate control and overflow retry logic in rkvenc_rc_pick()
and rkvenc_rc_overflow() ever adjust QP for IDR frames?

In rkvenc_rc_pick(), when t =3D=3D 0:
- if !ctx->rc_first[1] is true, it always takes the rkvenc_rc_p_qp_mean()
  branch and returns early;
- if ctx->rc_first[1] is true, ctx->rc_x[1] is still 0, so
  if (ctx->rc_x[0] && ctx->rc_x[1]) is false and it falls back to q =3D pre=
v.

As a result, the t =3D=3D 0 complexity branch in rkvenc_rc_pick() is unreac=
hable,
all-Intra streams (gop_size =3D=3D 1 or intra-only resolutions) stay at the
initial i_frame_qp forever, and when an IDR frame overflows the bitstream
buffer, the retry in rkvenc_finish_job() ignores the complexity update from
rkvenc_rc_overflow() and re-encodes at the same failing QP (or an unadjusted
P-frame mean QP).  Also, ctx->rc_tavg is only computed in rkvenc_rc_init(),
so runtime changes to V4L2_CID_MPEG_VIDEO_BITRATE have no effect.

> diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-v4l2.c b/drive=
rs/media/platform/rockchip/rkvenc/rkvenc-v4l2.c
> new file mode 100644
> index 0000000000000..3be496f5cf0c1
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-v4l2.c
> @@ -0,0 +1,1069 @@

[ ... ]

> +/* Runs for every frame, so that control changes apply to the next one */
> +static void rkvenc_apply_ctrls(struct rkvenc_ctx *ctx)
> +{
> +	struct rkvenc_ctrls *c =3D &ctx->c;
> +	bool h264 =3D ctx->codec =3D=3D RKVENC_CODEC_H264;
> +
> +	c->bitrate_mode =3D rkvenc_ctrl_val(ctx, V4L2_CID_MPEG_VIDEO_BITRATE_MO=
DE);
> +	c->bitrate =3D rkvenc_ctrl_val(ctx, V4L2_CID_MPEG_VIDEO_BITRATE);
> +	c->vbv_size =3D rkvenc_ctrl_val(ctx, V4L2_CID_MPEG_VIDEO_VBV_SIZE);
> +	c->frame_rc_enable =3D
> +		rkvenc_ctrl_val(ctx, V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE);
> +	c->gop_size =3D rkvenc_ctrl_val(ctx, V4L2_CID_MPEG_VIDEO_GOP_SIZE);
> +	c->i_period =3D rkvenc_ctrl_val(ctx, V4L2_CID_MPEG_VIDEO_H264_I_PERIOD);
> +	c->header_mode =3D rkvenc_ctrl_val(ctx, V4L2_CID_MPEG_VIDEO_HEADER_MODE=
);
> +	c->prepend_spspps =3D
> +		rkvenc_ctrl_val(ctx, V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR);
> +
> +	if (h264) {

[ ... ]

> +		c->min_qp =3D rkvenc_ctrl_val(ctx, V4L2_CID_MPEG_VIDEO_H264_MIN_QP);
> +		c->max_qp =3D rkvenc_ctrl_val(ctx, V4L2_CID_MPEG_VIDEO_H264_MAX_QP);
> +		c->i_frame_qp =3D
> +			rkvenc_ctrl_val(ctx, V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP);
> +		c->p_frame_qp =3D
> +			rkvenc_ctrl_val(ctx, V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP);
> +		if (rkvenc_ctrl_val(ctx, V4L2_CID_MPEG_VIDEO_H264_I_PERIOD) >
> +		    c->gop_size)
> +			c->gop_size =3D
> +				rkvenc_ctrl_val(ctx,
> +					V4L2_CID_MPEG_VIDEO_H264_I_PERIOD);
> +	} else {

[ ... ]

> +		if (rkvenc_ctrl_val(ctx, V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERIOD) >
> +		    c->gop_size)
> +			c->gop_size =3D
> +				rkvenc_ctrl_val(ctx,
> +					V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERIOD);
> +	}

[Severity: Medium]
Does taking the maximum of V4L2_CID_MPEG_VIDEO_GOP_SIZE and
V4L2_CID_MPEG_VIDEO_H264_I_PERIOD (or V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERI=
OD)
prevent setting a GOP size below 30?

All three controls default to 30 in rkvenc_init_ctrls(), so if an
application lowers only V4L2_CID_MPEG_VIDEO_GOP_SIZE (for example to 1 for
all-Intra or 0 for infinite GOP), the untouched codec-specific period contr=
ol
stays at 30 and overrides c->gop_size back to 30.

[ ... ]

> +static int rkvenc_queue_setup(struct vb2_queue *vq, unsigned int *num_bu=
ffers,
> +			      unsigned int *num_planes, unsigned int sizes[],
> +			      struct device *alloc_devs[])
> +{
> +	struct rkvenc_ctx *ctx =3D vb2_get_drv_priv(vq);
> +	const struct rkvenc_fmt *fmt;
> +	unsigned int i;
> +	u32 size;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +		fmt =3D rkvenc_find_fmt(rkvenc_output_fmts,
> +				      ARRAY_SIZE(rkvenc_output_fmts),
> +				      ctx->src_fourcc);
> +		if (!fmt)
> +			return -EINVAL;
> +		*num_planes =3D fmt->num_planes;
> +		for (i =3D 0; i < *num_planes; i++)
> +			sizes[i] =3D rkvenc_output_plane_size(ctx, i);
> +		return 0;
> +	}
> +
> +	fmt =3D rkvenc_find_fmt(rkvenc_capture_fmts,
> +			      ARRAY_SIZE(rkvenc_capture_fmts),
> +			      ctx->coded_fourcc);
> +	if (!fmt)
> +		return -EINVAL;
> +	size =3D rkvenc_capture_size(ctx);
> +	*num_planes =3D 1;
> +	if (*num_buffers)
> +		sizes[0] =3D max(sizes[0], size);
> +	else
> +		sizes[0] =3D size;
> +	return 0;
> +}

[Severity: Medium]
Does rkvenc_queue_setup() validate *num_planes and sizes[] when called from
VIDIOC_CREATE_BUFS?

When *num_planes !=3D 0, the vb2 queue_setup callback is expected to return
-EINVAL if *num_planes does not match the format or if any sizes[i] is
smaller than the minimum plane size.  Here, the OUTPUT branch unconditional=
ly
overwrites *num_planes and sizes[i], and the CAPTURE branch checks
*num_buffers instead of *num_planes and clamps sizes[0] instead of rejecting
invalid plane counts or undersized buffers.

> +static int rkvenc_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vb2_queue *vq =3D vb->vb2_queue;
> +	struct rkvenc_ctx *ctx =3D vb2_get_drv_priv(vq);
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +		if (vb2_plane_size(vb, 0) < rkvenc_output_plane_size(ctx, 0))
> +			return -EINVAL;
> +	} else {
> +		if (vb2_plane_size(vb, 0) < rkvenc_capture_size(ctx))
> +			return -EINVAL;
> +	}
> +	return 0;
> +}

[Severity: High]
When V4L2_PIX_FMT_NV12M (ctx->src_num_planes =3D=3D 2) is used, can a queued
buffer with an undersized plane 1 or a large planes[1].data_offset cause an
out-of-bounds DMA read?

rkvenc_buf_prepare() only checks vb2_plane_size(vb, 0) and does not check
plane 1 or account for planes[1].data_offset before rkvenc_device_run()
adds data_offset to the plane 1 DMA address.

> +static void rkvenc_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct rkvenc_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +
> +	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type)) {
> +		if (vb2_is_streaming(vb->vb2_queue) &&
> +		    v4l2_m2m_dst_buf_is_last(ctx->m2m_ctx)) {
> +			vb2_set_plane_payload(vb, 0, 0);
> +			vbuf->field =3D V4L2_FIELD_NONE;
> +			v4l2_m2m_last_buffer_done(ctx->m2m_ctx, vbuf);
> +			return;
> +		}
> +
> +		/* The parameter sets take a CAPTURE buffer of their own */
> +		if (ctx->header_pending &&
> +		    ctx->c.header_mode =3D=3D
> +			V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) {
> +			u8 *vaddr =3D vb2_plane_vaddr(vb, 0);
> +
> +			if (vaddr) {
> +				rkvenc_ensure_header(ctx);
> +				if (rkvenc_copy_headers(ctx, vaddr,
> +							vb2_plane_size(vb, 0)) < 0)
> +					vb2_set_plane_payload(vb, 0, 0);
> +				else
> +					vb2_set_plane_payload(vb, 0,
> +							     ctx->hdr_len);
> +			} else {
> +				vb2_set_plane_payload(vb, 0, 0);
> +			}
> +			vbuf->field =3D V4L2_FIELD_NONE;
> +			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
> +			ctx->header_pending =3D false;
> +			return;
> +		}
> +	}
> +
> +	v4l2_m2m_buf_queue(ctx->m2m_ctx, vbuf);
> +}

[Severity: Medium]
Can completing the separate-header buffer with VB2_BUF_STATE_DONE inside
rkvenc_buf_queue() trigger a vb2 warning if rkvenc_start_streaming()
subsequently fails?

For buffers queued before VIDIOC_STREAMON, vb2_start_streaming() invokes
.buf_queue() before .start_streaming().  If rkvenc_buf_queue() finishes a
buffer onto q->done_list and rkvenc_start_streaming() then returns an error,
rkvenc_return_dst_bufs() cannot reclaim that buffer and vb2_start_streaming=
()
hits WARN_ON(!list_empty(&q->done_list)).

In addition, rkvenc_buf_queue() tests ctx->c.header_mode, which is only
updated in rkvenc_apply_ctrls() (and starts at 0, i.e. SEPARATE, before the
first stream), while rkvenc_s_ctrl() sets ctx->header_pending =3D true on
SEPARATE without updating ctx->c.header_mode or clearing ctx->header_pending
when switching back to JOINED_WITH_1ST_FRAME, and rkvenc_start_streaming()
does not re-arm ctx->header_pending on stream restart.

[ ... ]

> +static void rkvenc_device_run(void *priv)
> +{
> +	struct rkvenc_ctx *ctx =3D priv;
> +	struct rkvenc_dev *dev =3D ctx->dev;
> +	struct vb2_v4l2_buffer *src, *dst;
> +	struct rkvenc_frame f =3D {};
> +	u8 qp;
> +	bool idr;
> +	u32 hdr_len =3D 0;
> +	u8 *vaddr;
> +	int ret;
> +
> +	dev->job_ctx =3D ctx;
> +	dev->job_running =3D true;

[Severity: High]
Can setting dev->job_ctx and dev->job_running =3D true here without holding
dev->irq_lock race with an already-dispatched rkvenc_watchdog_work()?

CPU0 (rkvenc_irq_thread)          CPU1 (kworker)
spin_lock(&dev->irq_lock)
dev->job_running =3D false
spin_unlock(&dev->irq_lock)
cancel_delayed_work(&watchdog)
                                  rkvenc_watchdog_work()
rkvenc_finish_job()
  rkvenc_device_run()
    dev->job_ctx =3D ctx
    dev->job_running =3D true
                                    spin_lock(&dev->irq_lock)
                                    /* sees job_running =3D=3D true! */
                                    dev->job_running =3D false
                                    spin_unlock(&dev->irq_lock)
                                    rkvenc_finish_job()  <-- aborts new job
    pm_runtime_resume_and_get()

Because rkvenc_irq_thread() uses non-synchronous cancel_delayed_work(),
rkvenc_watchdog_work() can already be running on another CPU and mistake the
newly starting job for the timed-out one before pm_runtime_resume_and_get()
and rkvenc_hw_run() have even run, accessing MMIO registers while clocks are
disabled and underflowing the runtime PM count.

> +	src =3D v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> +	dst =3D v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +	if (!src || !dst)
> +		goto finish_error;
> +
> +	idr =3D rkvenc_gop_is_idr(ctx);
> +
> +	if (idr)
> +		ctx->gop.frames_since_idr =3D 0;
> +
> +	rkvenc_apply_ctrls(ctx);
> +	rkvenc_rc_pick(ctx, &qp, idr ? 0 : 1);
> +	ctx->cur_qp =3D qp;
> +	ctx->cur_intra =3D idr;
> +
> +	if (idr)
> +		rkvenc_refresh_header(ctx);

[Severity: Medium]
Does calling rkvenc_refresh_header(ctx) on every IDR frame desynchronize the
slice syntax registers from the bitstream parameter sets when new headers a=
re
not emitted?

rkvenc_refresh_header() overwrites ctx->h264_seq or ctx->hevc_seq (which
feed the hardware slice registers) from the current V4L2 controls on every
IDR picture, even when V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE is used or when
V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME is used without
V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR.  Also, as noted earlier,
rkvenc_apply_ctrls() overrides gop_size < 30 with the default 30 of
H264_I_PERIOD / HEVC_REFRESH_PERIOD, does not update ctx->rc_tavg when
V4L2_CID_MPEG_VIDEO_BITRATE changes, and rkvenc_hevc_setup() replaces a
hevc_max_merge value of 0 with 2.

[ ... ]

> +	f.src.plane[0] =3D lower_32_bits(
> +		vb2_dma_contig_plane_dma_addr(&src->vb2_buf, 0));
> +	if (ctx->src_num_planes =3D=3D 1)
> +		f.src.plane[1] =3D f.src.plane[0] + ctx->bytesperline * ctx->height;
> +	else
> +		f.src.plane[1] =3D lower_32_bits(
> +			vb2_dma_contig_plane_dma_addr(&src->vb2_buf, 1) +
> +			src->vb2_buf.planes[1].data_offset);

[Severity: High]
Can src->vb2_buf.planes[1].data_offset push f.src.plane[1] past the end of
the plane 1 DMA buffer?

Because rkvenc_buf_prepare() never checks that vb2_plane_size(vb, 1) -
vb->planes[1].data_offset is at least rkvenc_output_plane_size(ctx, 1),
queueing a 2-plane V4L2_PIX_FMT_NV12M buffer with a non-zero data_offset or
an undersized second plane programs RKVENC_ADR_SRC1 to DMA-read up to
ctx->bytesperline * ctx->height / 2 bytes out of bounds.

[ ... ]

> +	v4l2_ctrl_new_std(hdl, &rkvenc_ctrl_ops,
> +			  V4L2_CID_MPEG_VIDEO_AVERAGE_QP, 0, 51, 1, 0);
> +
> +	if (hdl->error)
> +		return hdl->error;

[Severity: Medium]
Does returning hdl->error here without calling v4l2_ctrl_handler_free(hdl)
leak the control handler and any controls allocated before the failure?
rkvenc_open()'s err_m2m path also does not free ctx->ctrl_hdl when
rkvenc_init_ctrls() fails.

[ ... ]

> +static void rkvenc_try_fmt_vid_out(struct rkvenc_ctx *ctx, struct v4l2_f=
ormat *f)
> +{
> +	struct v4l2_pix_format_mplane *pix =3D &f->fmt.pix_mp;
> +	const struct rkvenc_fmt *fmt;
> +	u32 bpl;
> +
> +	fmt =3D rkvenc_find_fmt(rkvenc_output_fmts,
> +			      ARRAY_SIZE(rkvenc_output_fmts),
> +			      pix->pixelformat);
> +	if (!fmt) {
> +		fmt =3D &rkvenc_output_fmts[0];
> +		pix->pixelformat =3D fmt->fourcc;
> +	}
> +
> +	pix->field =3D V4L2_FIELD_NONE;
> +	pix->width =3D clamp(round_up(pix->width, 2), 16, ctx->dev->max_width);
> +	pix->height =3D clamp(round_up(pix->height, 2), 16, ctx->dev->max_heigh=
t);

[Severity: Low]
Can round_up(pix->width, 2) overflow u32 before clamp() if userspace passes
0xffffffff?  Wrapping to 0 clamps the dimension to 16 instead of
ctx->dev->max_width (and likewise in rkvenc_try_fmt_vid_cap()).  Also,
rkvenc_start_streaming() does not call
v4l2_m2m_update_start_streaming_state() to pair with
v4l2_m2m_update_stop_streaming_state() in rkvenc_stop_streaming().

[ ... ]

> +static void rkvenc_try_fmt_vid_cap(struct rkvenc_ctx *ctx, struct v4l2_f=
ormat *f)
> +{
> +	struct v4l2_pix_format_mplane *pix =3D &f->fmt.pix_mp;
> +	const struct rkvenc_fmt *fmt;
> +
> +	fmt =3D rkvenc_find_fmt(rkvenc_capture_fmts,
> +			      ARRAY_SIZE(rkvenc_capture_fmts),
> +			      pix->pixelformat);
> +	if (!fmt) {
> +		fmt =3D &rkvenc_capture_fmts[0];
> +		pix->pixelformat =3D fmt->fourcc;
> +	}
> +
> +	pix->field =3D V4L2_FIELD_NONE;
> +	pix->width =3D clamp(round_up(pix->width, 2), 16, ctx->dev->max_width);
> +	pix->height =3D clamp(round_up(pix->height, 2), 16, ctx->dev->max_heigh=
t);
> +	pix->num_planes =3D 1;
> +	pix->plane_fmt[0].bytesperline =3D 0;
> +
> +	if (fmt->fourcc =3D=3D V4L2_PIX_FMT_H264) {
> +		u32 mbw =3D ALIGN(pix->width, 16) / 16;
> +		u32 mbh =3D ALIGN(pix->height, 16) / 16;
> +
> +		pix->plane_fmt[0].sizeimage =3D
> +			min(mbw * mbh * 400, pix->width * pix->height / 2) +
> +			RKVENC_HDR_MAX;
> +	} else {
> +		pix->plane_fmt[0].sizeimage =3D
> +			pix->width * pix->height / 2 + RKVENC_HDR_MAX;
> +	}
> +}

[Severity: Medium]
Should rkvenc_try_fmt_vid_cap() derive pix->width, pix->height, and
pix->plane_fmt[0].sizeimage from ctx->width and ctx->height instead of the
caller-supplied f->fmt.pix_mp?

Because rkvenc_s_fmt_vid_cap() does not update ctx->width or ctx->height,
calling VIDIOC_TRY_FMT or VIDIOC_S_FMT on the CAPTURE queue with different
dimensions (such as 0x0 when selecting the coded format) returns a width,
height, and sizeimage that disagree with VIDIOC_G_FMT(CAPTURE),
rkvenc_queue_setup(), and rkvenc_buf_prepare().

[ ... ]

> +static int rkvenc_s_fmt_vid_out(struct file *file, void *priv,
> +				struct v4l2_format *f)
> +{
> +	struct rkvenc_ctx *ctx =3D fh_to_rkvenc_ctx(file->private_data);
> +	struct vb2_queue *vq =3D v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
> +
> +	if (vb2_is_busy(vq))
> +		return -EBUSY;
> +
> +	rkvenc_try_fmt_vid_out(ctx, f);
> +	ctx->src_fourcc =3D f->fmt.pix_mp.pixelformat;
> +	ctx->src_num_planes =3D f->fmt.pix_mp.num_planes;
> +	ctx->width =3D f->fmt.pix_mp.width;
> +	ctx->height =3D f->fmt.pix_mp.height;
> +	ctx->bytesperline =3D f->fmt.pix_mp.plane_fmt[0].bytesperline;
> +	return 0;
> +}

[Severity: High]
Can changing the OUTPUT format while the CAPTURE queue is already streaming
overflow the reconstruction and reference DMA buffers in ctx->slot[]?

rkvenc_start_streaming() only allocates ctx->slot[] (via rkvenc_ref_alloc())
and validates dimensions when the CAPTURE queue starts streaming, while
returning 0 immediately for the OUTPUT queue.  Because rkvenc_s_fmt_vid_out=
()
only checks vb2_is_busy() on the OUTPUT queue, userspace can start CAPTURE
streaming at a small resolution (e.g. 16x16), then call VIDIOC_S_FMT(OUTPUT)
with a larger resolution (up to 4096x2304) and start OUTPUT streaming,
causing the hardware encoder to DMA-write past the end of the undersized
ctx->slot[] buffers.

[ ... ]

> diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc.c b/drivers/me=
dia/platform/rockchip/rkvenc/rkvenc.c
> new file mode 100644
> index 0000000000000..00778e97686d7
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvenc/rkvenc.c
> @@ -0,0 +1,489 @@

[ ... ]

> +int rkvenc_hw_run(struct rkvenc_dev *dev, const struct rkvenc_frame *f)
> +{
> +	struct rkvenc_img *img =3D &dev->img;
> +	void __iomem *regs =3D dev->regs;
> +	unsigned int a;
> +	int ret;
> +
> +	ret =3D rkvenc_vepu541_img_build(f, img);
> +	if (WARN_ON(ret))
> +		return ret;

[Severity: Medium]
Can userspace trigger this WARN_ON(ret) via standard V4L2 controls or format
changes?

V4L2_CID_MPEG_VIDEO_H264_MIN_QP / MAX_QP (and the HEVC equivalents) are
independent controls with range 1..51 and no check enforcing min_qp <=3D
max_qp.  Setting min_qp > max_qp passes inverted bounds to clamp_t() in
rkvenc_rc_pick() and causes rkvenc_frame_check() inside
rkvenc_vepu541_img_build() to return -EINVAL and hit WARN_ON(ret) on every
frame (as does setting a narrow H.264 resolution with width <=3D 32 and
height > 16 on OUTPUT after CAPTURE is already streaming).

[ ... ]

> +void rkvenc_hw_recover(struct rkvenc_dev *dev)
> +{
> +	void __iomem *regs =3D dev->regs;
> +
> +	if (rkvenc_hw_force_clear(dev))
> +		return;
> +
> +	dev_err(dev->dev, "job did not stop on force clear, resetting\n");
> +
> +	writel(RKVENC_INT_ALL & ~RKVENC_INT_SCLR_DONE, regs + RKVENC_INT_MSK);
> +	writel(RKVENC_INT_ALL, regs + RKVENC_INT_CLR);
> +
> +	reinit_completion(&dev->sclr_done);
> +	writel(RKVENC_ENC_CLR_SAFE, regs + RKVENC_ENC_CLR);
> +	wait_for_completion_timeout(&dev->sclr_done,
> +				    msecs_to_jiffies(RKVENC_SAFE_CLEAR_MS));
> +
> +	if (dev->num_resets) {
> +		reset_control_bulk_assert(dev->num_resets, dev->resets);
> +		udelay(RKVENC_RESET_PULSE_US);
> +		reset_control_bulk_deassert(dev->num_resets, dev->resets);
> +	}
> +
> +	writel(0, regs + RKVENC_INT_MSK);
> +}
> +
> +static irqreturn_t rkvenc_irq(int irq, void *priv)
> +{
> +	struct rkvenc_dev *dev =3D priv;
> +	u32 sta;
> +
> +	sta =3D readl(dev->regs + RKVENC_INT_STA);
> +	if (!sta)
> +		return IRQ_NONE;
> +
> +	writel(sta, dev->regs + RKVENC_INT_CLR);
> +	/* Flush the posted clear before the interrupt line is sampled again */
> +	readl(dev->regs + RKVENC_INT_STA);
> +
> +	if (sta & RKVENC_INT_SCLR_DONE)
> +		complete(&dev->sclr_done);
> +
> +	dev->irq_sta =3D sta;
> +	return IRQ_WAKE_THREAD;
> +}

[Severity: High]
Can dev->sclr_done ever be completed by rkvenc_irq() when rkvenc_hw_recover=
()
is called from rkvenc_irq_thread()?

Because the IRQ is requested with IRQF_ONESHOT, the interrupt line remains
masked at the interrupt controller for the entire duration of
rkvenc_irq_thread().  When rkvenc_irq_thread() -> rkvenc_finish_job() ->
rkvenc_hw_recover() waits on dev->sclr_done, rkvenc_irq() cannot run until
rkvenc_irq_thread() exits, so wait_for_completion_timeout() always stalls f=
or
the full 100 ms timeout.

Furthermore, when RKVENC_INT_SCLR_DONE does fire in rkvenc_irq(), it
overwrites dev->irq_sta =3D sta and returns IRQ_WAKE_THREAD instead of
IRQ_HANDLED, queuing a spurious run of rkvenc_irq_thread().

[ ... ]

> +static irqreturn_t rkvenc_irq_thread(int irq, void *priv)
> +{
> +	struct rkvenc_dev *dev =3D priv;
> +	struct rkvenc_ctx *ctx;
> +	enum vb2_buffer_state state;
> +	u32 int_sta, bytes, qp_sum;
> +	unsigned long flags;
> +
> +	/* Whoever clears job_running first, IRQ or watchdog, finishes the job =
*/
> +	spin_lock_irqsave(&dev->irq_lock, flags);
> +	if (!dev->job_running) {
> +		spin_unlock_irqrestore(&dev->irq_lock, flags);
> +		return IRQ_HANDLED;
> +	}
> +	ctx =3D dev->job_ctx;
> +	dev->job_running =3D false;
> +	spin_unlock_irqrestore(&dev->irq_lock, flags);
> +
> +	cancel_delayed_work(&dev->watchdog);

[Severity: High]
Can a spurious IRQ thread wake-up from RKVENC_INT_SCLR_DONE or a fast IRQ
before schedule_delayed_work() corrupt the next job's state?

<hardirq>                         rkvenc_irq_thread
rkvenc_irq() (SCLR_DONE)
  dev->irq_sta =3D SCLR_DONE
  return IRQ_WAKE_THREAD
                                  rkvenc_finish_job()
                                    rkvenc_device_run() (retry / next job)
                                      dev->job_running =3D true
                                  /* next threaded IRQ run starts */
                                  rkvenc_irq_thread()
                                    dev->job_running =3D false
                                    /* ENC_DONE not set in irq_sta */
                                    rkvenc_finish_job(..., ERROR)  <-- abor=
ts

In addition to the unlocked dev->job_running assignment in
rkvenc_device_run() and the non-synchronous cancel_delayed_work() above,
rkvenc_hw_run() writes RKVENC_ENC_STRT before calling
schedule_delayed_work(&dev->watchdog, ...).  If a small frame finishes and
rkvenc_irq_thread() calls cancel_delayed_work() before rkvenc_hw_run() calls
schedule_delayed_work(), the watchdog timer remains armed after the job
completes.

[ ... ]

> +	ret =3D devm_request_threaded_irq(dev, irq, rkvenc_irq,
> +					rkvenc_irq_thread, IRQF_ONESHOT,
> +					dev_name(dev), rkvenc);
> +	if (ret) {
> +		dev_err(dev, "Could not request encoder IRQ\n");
> +		return ret;
> +	}

[Severity: Medium]
Is registering the IRQ with devm_request_threaded_irq() before
pm_runtime_enable(dev) safe?

Because devm_request_threaded_irq() is called before pm_runtime_enable(dev),
devres will also free the IRQ after rkvenc_remove() has already called
pm_runtime_disable(&pdev->dev), and an early error return after
pm_runtime_enable(dev) leaves runtime PM enabled.

> +
> +	pm_runtime_enable(dev);
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Does returning directly when pm_runtime_resume_and_get(dev) fails leave
runtime PM enabled on the device?  Jumping to err_pm_disable would balance
pm_runtime_enable(dev).

[ ... ]

> +static void rkvenc_remove(struct platform_device *pdev)
> +{
> +	struct rkvenc_dev *rkvenc =3D platform_get_drvdata(pdev);
> +
> +	cancel_delayed_work_sync(&rkvenc->watchdog);

[Severity: High]
Can rkvenc->watchdog be re-armed after cancel_delayed_work_sync() returns in
rkvenc_remove()?

CPU0                              CPU1
rkvenc_remove()
  cancel_delayed_work_sync(&watchdog)
                                  rkvenc_device_run() / retry
                                    rkvenc_hw_run()
                                      schedule_delayed_work(&watchdog, ...)
  rkvenc_v4l2_cleanup()
  ...
  /* devm frees rkvenc */
                                  rkvenc_watchdog_work()  <-- use-after-free

Because cancel_delayed_work_sync() runs before rkvenc_v4l2_cleanup() and
v4l2_m2m_release(), a new job or an in-flight overflow retry in
rkvenc_finish_job() can call rkvenc_hw_run() and re-schedule rkvenc->watchd=
og
before the V4L2 and M2M devices are torn down.

> +	rkvenc_v4l2_cleanup(rkvenc);
> +	v4l2_m2m_release(rkvenc->m2m_dev);
> +	v4l2_device_unregister(&rkvenc->v4l2_dev);
> +	pm_runtime_disable(&pdev->dev);
> +}

[Severity: Medium]
Should cancel_delayed_work_sync(&rkvenc->watchdog) (and stopping any active
IRQ/retry activity) happen after rkvenc_v4l2_cleanup() and
v4l2_m2m_release() have stopped new M2M jobs from starting, so that teardown
cannot leave rkvenc->watchdog queued when devres frees struct rkvenc_dev?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794666330.gi=
t.daniel@makrotopia.org?part=3D3
