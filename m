Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587705;
	b=3/CMr8y1VOrWzxWofGieIRD8TiQK9Ih9k6V9IB8AlSVb8/OJzaHEV3pt8cpPMFg23xCw
	 jgUc6rTFlDMJl1AkZ20xOQqSvy5iPbd9uTcMoATVr4uWVPK/SYWjKAzSqx/N8esNCznzf
	 GyrXt+fb6CTHb/mMID6jbvo8RPKaeSLaK10UcGEtzCYcNsvLTzUllDD3ItvfI1/kKbApb
	 m+UM+Jhjv0hLEMzTulXrPNTHFrlIxJKFF/R+20ZYSqQYBRoCWFmaCZ5hrczqVV69TEPZR
	 JU8BJscxYBStTgDvx9nSQ4Fw7D8qj8C5FfIGgtCqsBvs/1lhdtdQ/zMqhs1m3NEIQ9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587705;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=t9Fkdj4YmNzma0NRErgurunOz7jYIsyWcMHtQjRqLcQ=;
	b=K61t1vkNoFR++KOdVbn+5/ZVkfUwBFoEhDVo6SCeADtkaIqmY3K36TlWQf+13x/20a2h
	 oARra+H7DL1rUDhjWSHm8iKumuZXLB5HVKg+HIVuE0lAShVQAWrP2XeSMQl+VMCd3zJAV
	 KMxArade6+93Ycx8tNeC3zlXwVjWt+Otfmi656DMTF/JMKFEFjmu/CyU75olEqZ5dlKWX
	 SwycnXivxnso/yLfbhdF4A95OnICk2CUZxcnYjXcc74niuFoEyxB4+d7XTUdYzuSeGF8p
	 wCd4oc2tzFdxAnN7+nMEwM1GXIINOl7jX0M3jeNcdVWLh042b0nU0U9TZD9YbAuVU2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OF+5rjeE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4957606A321;
	Wed, 25 Nov 2026 06:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OF+5rjeE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064B71F000CF;
	Wed, 25 Nov 2026 06:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795587705;
	bh=t9Fkdj4YmNzma0NRErgurunOz7jYIsyWcMHtQjRqLcQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OF+5rjeEjenOtsNR89GyPVpYH3pH9nefVxP15Wf5UCnXWak7Y7jGxxMH+LdWKi4YO
	 k62L/X/dPyiX1uGgvI6rC7859tX1j6iH5warEXBwMhzzeJwWI+pWKrG/Pla+/B5pay
	 EErxYAOL80RSC16cXoXyCYmDUpVNX0gVvEW/uHiR5dOzWETMywjWMmrCvClmRd4ZkQ
	 vUE+ZpbrhtPjxdh7VThnCeeJ0G0nk+Ansre0nmmfSTqMS/pwQTTKaJuv9iw4B6L3t9
	 vVgpTNNXoJrEVnROTrzbLT9bNRZ8c2fkpl+flN/9BCR9dd/Op69PUuNDfykvc/Mvuw
	 lZjRKlTpnNa5A==
Message-ID: <sashiko-outbox-232673@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] soc: mediatek: mmdvfs: add VCP backend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Echo Zhang" <echo.zhang@mediatek.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125060037.649659-5-echo.zhang@mediatek.com>
References: <20261125060037.649659-1-echo.zhang@mediatek.com>
 <20261125060037.649659-5-echo.zhang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 06:21:44 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 18 potential
issues to consider:
- [High] soc: mediatek: mmdvfs: missing mtk_vcp_public.h breaks build
- [High] soc: mediatek: mmdvfs: use-after-free on init_task in
  mmdvfs_remove()
- [High] soc: mediatek: mmdvfs: unlocked up_instances access and
  init/suspend races
- [Medium] soc: mediatek: mmdvfs: invalid async EPROBE_DEFER in
  mmdvfs_vcp_init_impl()
- [Medium] soc: mediatek: mmdvfs: stale MEM_IPI_SYNC_FUNC bit on error
  and UB shift
- [Medium] soc: mediatek: mmdvfs: missing NULL check for
  get_vcp_sram_virt() callback
- [Medium] soc: mediatek: mmdvfs: use-after-put and unvalidated length
  in get_bootmode()
- [Medium] soc: mediatek: mmdvfs: premature break in
  mmdvfs_vcp_wait_target_ready()
- [Medium] soc: mediatek: mmdvfs: broken readiness wait in
  mmdvfs_vcp_wait_target_ready()
- [Medium] soc: mediatek: mmdvfs: incomplete mux table init in
  mmdvfs_vcp_init_impl()
- [Medium] soc: mediatek: mmdvfs: unlocked state access on
  VCP_EVENT_SUSPEND
- [Medium] soc: mediatek: mmdvfs: stale init_done and late unregister on
  VCP teardown
- [Medium] soc: mediatek: mmdvfs: multi-second CPU busy-wait in
  sleepable VCP paths
- [Medium] soc: mediatek: mmdvfs: 100s ssleep(1) polling loops in
  mmdvfs_init_up()
- [Low] soc: mediatek: mmdvfs: duplicate definitions in
  mmdvfs-internal.h
- [Low] soc: mediatek: mmdvfs: __iomem stripped in
  mmdvfs_vcp_get_base_impl()
- [Low] soc: mediatek: mmdvfs: __iomem qualifier dropped in get_base()
  helpers
- [Low] soc: mediatek: mmdvfs: kernel-doc mismatches and unused fields
  in VCP backend
--

commit d167aba7bcc45b8ea038c59647e59a2dd799bbb8
Author: Echo Zhang <echo.zhang@mediatek.com>

soc: mediatek: mmdvfs: add VCP backend

This commit adds the VCP and MMUP microprocessor abstraction and backend
for MediaTek MMDVFS to manage shared memory, feature power reference
counts, readiness notifications, and IPI commands.

> diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-core.c b/drivers/soc/medi=
atek/mmdvfs/mmdvfs-core.c
> index c32fa11557aff..3388a5a3a1459 100644
> --- a/drivers/soc/mediatek/mmdvfs/mmdvfs-core.c
> +++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-core.c
> @@ -7,22 +7,23 @@
> =20
>  #include <linux/atomic.h>
>  #include <linux/clk-provider.h>
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> +#include <linux/kthread.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> -#include <linux/notifier.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
> +#include <linux/remoteproc/mtk_vcp_public.h>

[Severity: High]
Does this build without include/linux/remoteproc/mtk_vcp_public.h in the
tree?  Both mmdvfs-core.c and mmdvfs-vcp.c include this header and rely
on VCP types, constants (such as MMDVFS_MMUP_MEM_ID and
MMDVFS_VCP_MEM_ID), and helpers (vcp_get(), vcp_put(), vcp_get_ipidev())
that are not defined in the repository, so compiling this driver fails.

[ ... ]

> @@ -249,45 +251,61 @@ int mmdvfs_parse_dt(struct mmdvfs_device *mmdvfs)
>  	return 0;
>  }
> =20
> -/*
> - * mmdvfs_pm_notifier_callback - PM notifier callback for suspend/resume=
 handling
> - * @nb: Notifier block
> - * @event: PM event type
> - * @data: Event data
> - *
> - * Return: NOTIFY_DONE
> - */
> -static int mmdvfs_pm_notifier_callback(struct notifier_block *nb, unsign=
ed long event,
> -				       void *data)
> +static int mmdvfs_init_up(struct mmdvfs_device *mmdvfs, bool stoppable)
>  {
> -	struct mmdvfs_data *mdata =3D
> -		container_of(nb, struct mmdvfs_data, pm_notifier);
> -	struct mmdvfs_device *mmdvfs =3D dev_get_drvdata(mdata->dev);
> +	struct mmdvfs_data *mdata =3D mmdvfs->data;
> +	int retry =3D 0;
> +	int ret;
> =20
> -	switch (event) {
> -	case PM_SUSPEND_PREPARE:
> -		mmdvfs_dbg(mmdvfs->dev, "System suspending...\n");
> +	ret =3D mmdvfs_up_register(mmdvfs, MMDVFS_UP_VCP);
> +	if (ret) {
> +		mmdvfs_err(mmdvfs->dev, "Failed to register HFRP: %d\n", ret);
> +		return ret;
> +	}
> =20
> -		if (mdata->ops && mdata->ops->suspend_prepare)
> -			mdata->ops->suspend_prepare(mmdvfs);
> +	while (!mmdvfs_up_get_cb_ready(mmdvfs, MMDVFS_UP_VCP)) {
> +		if (stoppable && kthread_should_stop()) {
> +			ret =3D -ECANCELED;
> +			goto err_unregister_up;
> +		}
> =20
> -		mdata->pm_suspended =3D true;
> -		break;
> +		if (++retry > 100) {
> +			mmdvfs_err(mmdvfs->dev,
> +				   "Init timeout: VCP/MMUP callback not ready after %d seconds\n",
> +				   retry);
> +			ret =3D -ETIMEDOUT;
> +			goto err_unregister_up;
> +		}
> +		ssleep(1);
> +	}

[Severity: Medium]
Can this ssleep(1) loop stall synchronous probe for up to 100 seconds?
When vote_requires_up_ready is true, mmdvfs_probe() runs mmdvfs_init_up()
synchronously; polling in 1-second increments delays probe whenever
VCP_EVENT_READY arrives asynchronously, and hangs probe for 100 seconds
if FUNC_MMDVFS_INIT or FUNC_MMDVFSRC_INIT fails in
mmdvfs_mmup_notifier_callback().  mmdvfs_vcp_init_impl() also runs two
duplicate 100-second ssleep(1) loops polling mmdvfs_vcp_get_ipidev() into
an unused local variable when mmup_enable is set.  Could this wait on a
completion signaled by the notifier callback instead of open-coded
1-second polling?

[ ... ]

> +static int mmdvfs_init_kthread(void *data)
> +{
> +	return mmdvfs_init_up(data, true);
> +}

[ ... ]

> @@ -358,38 +366,52 @@ static int mmdvfs_probe(struct platform_device *pde=
v)
>  		}
>  	}
> =20
> -	data->init_done =3D true;
> +	if (pdata->soc_data->vote_requires_up_ready) {
> +		ret =3D mmdvfs_init_up(mmdvfs, false);
> +		if (ret) {
> +			mmdvfs_err(mmdvfs->dev,
> +				   "Failed to initialize UP before clock registration: %d\n",
> +				   ret);
> +			goto err_deinit_hw;
> +		}
> +	}
> =20
>  	ret =3D mmdvfs_register_clocks(mmdvfs);
>  	if (ret) {
>  		mmdvfs_err(mmdvfs->dev, "Failed to register clocks: %d\n", ret);
> -		goto err_deinit_hw;
> -	}
> -
> -	data->pm_notifier.notifier_call =3D mmdvfs_pm_notifier_callback;
> -	data->pm_notifier.priority =3D 0;
> -	data->pm_suspended =3D false;
> -	ret =3D register_pm_notifier(&data->pm_notifier);
> -	if (ret) {
> -		mmdvfs_err(mmdvfs->dev, "Failed to register PM notifier: %d\n", ret);
> -		goto err_unregister_clocks;
> +		goto err_unregister_up;
>  	}
> -	mmdvfs_info(mmdvfs->dev, "PM notifier registered\n");
> =20
>  	ret =3D mmdvfs_register_device(mmdvfs);
>  	if (ret) {
>  		mmdvfs_err(mmdvfs->dev, "Failed to register device: %d\n", ret);
> -		goto err_unregister_pm_notifier;
> +		goto err_unregister_up;
>  	}
> =20
> +	if (pdata->soc_data->vote_requires_up_ready) {
> +		mmdvfs_dbg(mmdvfs->dev,
> +			   "UP ready before MMDVFS clock provider registration\n");
> +	} else {
> +		/* Initialize VCP/MMUP asynchronously and wait for callback ready. */
> +		data->init_task =3D kthread_run(mmdvfs_init_kthread, mmdvfs,
> +					      "mmdvfs-init-kthread");
> +		if (IS_ERR(data->init_task)) {
> +			mmdvfs_warn(mmdvfs->dev,
> +				    "Failed to launch init kthread: %ld (non-fatal)\n",
> +				    PTR_ERR(data->init_task));
> +			data->init_task =3D NULL;
> +		} else {
> +			mmdvfs_dbg(mmdvfs->dev, "Init kthread launched successfully\n");
> +		}
> +	}
> +
> +	mmdvfs_debug_init(mmdvfs);
>  	mmdvfs_info(mmdvfs->dev, "MMDVFS driver probed successfully\n");
>  	return 0;
> =20
> -err_unregister_pm_notifier:
> -	unregister_pm_notifier(&data->pm_notifier);
> -
> -err_unregister_clocks:
> -	mmdvfs_unregister_clocks(mmdvfs);
> +err_unregister_up:
> +	if (data->up_count)
> +		mmdvfs_up_unregister(mmdvfs, MMDVFS_UP_VCP);
> =20
>  err_deinit_hw:
>  	if (data->ops && data->ops->deinit_hw)
> @@ -409,14 +431,20 @@ static void mmdvfs_remove(struct platform_device *p=
dev)
>  	struct mmdvfs_device *mmdvfs =3D platform_get_drvdata(pdev);
>  	struct mmdvfs_data *data =3D mmdvfs->data;
> =20
> -	unregister_pm_notifier(&data->pm_notifier);
> -	mmdvfs_dbg(mmdvfs->dev, "PM notifier unregistered\n");
> +	mmdvfs_debug_exit(mmdvfs);
> =20
> -	mmdvfs_unregister_clocks(mmdvfs);
> +	if (data->init_task) {
> +		kthread_stop(data->init_task);
> +		data->init_task =3D NULL;
> +		mmdvfs_dbg(mmdvfs->dev, "Init kthread stopped\n");
> +	}

[Severity: High]
Doesn't kthread_stop(data->init_task) trigger a use-after-free once
mmdvfs_init_kthread() finishes?

mmdvfs_probe() starts mmdvfs_init_kthread() with kthread_run() without
taking a task_struct reference via get_task_struct().  Because
mmdvfs_init_kthread() returns as soon as mmdvfs_init_up() completes or
times out, the thread exits on its own and frees its task_struct while
data->init_task remains non-NULL.  When mmdvfs_remove() later runs,
kthread_stop(data->init_task) dereferences the freed task_struct.

[ ... ]

> @@ -512,69 +540,111 @@ static void mmdvfs_unregister_device(struct mmdvfs=
_device *mmdvfs)
>  	mutex_unlock(&mmdvfs_device_list_lock);
>  }
> =20
> -int mtk_mmdvfs_camera_notify(bool enable)
> +/* HWCCF voter - Memory and SRAM management via multi-UP architecture */
> +void *mmdvfs_get_mmup_base(phys_addr_t *pa)
>  {
>  	struct mmdvfs_device *mmdvfs;
> +	struct mmdvfs_up_instance *hfrp_instance;
> =20
>  	mmdvfs =3D mmdvfs_find_device_any();
> -	if (!mmdvfs || !mmdvfs->data || !mmdvfs->data->ops ||
> -	    !mmdvfs->data->ops->camera_notify)
> -		return -EOPNOTSUPP;
> +	if (!mmdvfs || !mmdvfs->data)
> +		return NULL;
> =20
> -	return mmdvfs->data->ops->camera_notify(mmdvfs, enable);
> +	/* HFRP UP returns MMUP base with MMDVFS_MMUP_MEM_ID */
> +	hfrp_instance =3D mmdvfs_up_get_instance(mmdvfs, MMDVFS_UP_VCP);
> +	if (!hfrp_instance || !hfrp_instance->ops || !hfrp_instance->ops->get_b=
ase)
> +		return NULL;
> +
> +	return hfrp_instance->ops->get_base(mmdvfs, MMDVFS_MMUP_MEM_ID, pa);
>  }
> -EXPORT_SYMBOL_GPL(mtk_mmdvfs_camera_notify);
> +EXPORT_SYMBOL_GPL(mmdvfs_get_mmup_base);
> =20
> -int mtk_mmdvfs_genpd_notify(u8 idx, bool enable)
> +void *mmdvfs_get_vcp_base(phys_addr_t *pa)

[Severity: Low]
Should mmdvfs_get_mmup_base() and mmdvfs_get_vcp_base() return
void __iomem * instead of void *?  The underlying pointers priv->mmup_va
and priv->vcp_va are void __iomem *, so returning void * strips the
__iomem address-space qualifier and triggers Sparse warnings.

> diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h b/drivers/soc/=
mediatek/mmdvfs/mmdvfs-internal.h
> index df16e38d78c89..2aaec44a8db7a 100644
> --- a/drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h
> +++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h
> @@ -27,6 +29,60 @@ enum mmdvfs_version_type {
>  	MMDVFS_VERSION_HWCCF_DVFS_VOTER =3D 1,	/* HWCCF DVFS voter */
>  };
> =20
> +/* HWCCF voter configuration - Power User Definitions */
> +/*
> + * VCP Power User Index - must match VCP firmware definition
> + * Used by mtk_mmdvfs_enable_vcp() to track per-user power reference cou=
nt
> + */
> +enum mmdvfs_vcp_pwr_usr {
> +	VCP_PWR_USR_MMDVFS_INIT =3D 0,
> +	VCP_PWR_USR_MMDVFS_RESERVED1,
> +	VCP_PWR_USR_MMDVFS_RESERVED2,
> +	VCP_PWR_USR_MMDVFS_VOTE,
> +	VCP_PWR_USR_MMDVFS_CCU,
> +	VCP_PWR_USR_MMDVFS_RST,
> +	VCP_PWR_USR_MMQOS,
> +	VCP_PWR_USR_CAM,
> +	VCP_PWR_USR_IMG,
> +	VCP_PWR_USR_PDA,
> +	VCP_PWR_USR_SENIF,
> +	VCP_PWR_USR_VDEC,
> +	VCP_PWR_USR_VFMT,
> +	VCP_PWR_USR_SMI,
> +	VCP_PWR_USR_DISP,
> +	VCP_PWR_USR_MDP,
> +	VCP_PWR_USR_MML,
> +	VCP_PWR_USR_VENC,
> +	VCP_PWR_USR_JPEGDEC,
> +	VCP_PWR_USR_JPEGENC,
> +	VCP_PWR_USR_NUM
> +};

[Severity: Low]
mmdvfs-internal.h duplicates enum mmdvfs_version_type, the
VCP_PWR_USR_* enumerators, and the public API prototypes from
include/soc/mediatek/mmdvfs.h instead of including <soc/mediatek/mmdvfs.h>.
Any file that includes both headers will fail to compile with
redefinition errors, and the public prototypes in
include/soc/mediatek/mmdvfs.h are never type-checked against their
definitions in mmdvfs-core.c.

> +
> +/* IPI function codes used by this driver; values match VCP/MMUP firmwar=
e. */
> +enum mmdvfs_ipi_func {
> +	FUNC_MMDVFS_INIT =3D 0,		/* Initialize firmware-side MMDVFS */
> +	FUNC_MMDVFSRC_INIT =3D 9,	/* Initialize resource controller */
> +};
> +
> +/**
> + * struct mmdvfs_vcp_ipi_data - VCP IPI message format
> + * @func: Function code
> + * @idx: Index parameter
> + * @opp: OPP level
> + * @ack: High 32-bit of 64-bit parameter
> + * @base: Low 32-bit of 64-bit parameter
> + *
> + * For FUNC_MMDVFS_INIT/MMDVFSRC_INIT, the 64-bit shared memory IOVA is =
split
> + * across ack and base.
> + */
> +struct mmdvfs_vcp_ipi_data {
> +	u8 func;
> +	u8 idx;
> +	u8 opp;
> +	u8 ack;
> +	u32 base;
> +} __packed;

[Severity: Low]
The kernel-doc for struct mmdvfs_vcp_ipi_data describes @ack as the high
32 bits of a 64-bit parameter, but ack is a u8 and only holds bits 32..39
of target_iova.

Also, struct mmdvfs_device adds debugfs_dir without a matching
@debugfs_dir kernel-doc entry, and struct mmdvfs_vcp_priv in mmdvfs-vcp.c
is missing kernel-doc entries for @vcp_device, @vcp_stop, @rst_clk_done,
@release_step_done, and @mmup_notifier (while vcp_pdev, mmup_pdev,
vcp_stop, rst_clk_done, and release_step_done are never meaningfully
used).

> diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-up.c b/drivers/soc/mediat=
ek/mmdvfs/mmdvfs-up.c
> new file mode 100644
> index 0000000000000..cdf9948893909
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-up.c
> @@ -0,0 +1,275 @@

[ ... ]

> +int mmdvfs_up_register(struct mmdvfs_device *mmdvfs, enum mmdvfs_up_type=
 type)
> +{
> +	struct mmdvfs_data *data;
> +	struct mmdvfs_up_instance *up;
> +	const struct mmdvfs_up_ops *ops;
> +	int ret =3D 0;
> +
> +	if (!mmdvfs || !mmdvfs->data) {
> +		pr_err("mmdvfs: Invalid device reference\n");
> +		return -EINVAL;
> +	}
> +
> +	data =3D mmdvfs->data;
> +
> +	if (data->up_count >=3D MMDVFS_UP_MAX) {
> +		mmdvfs_err(mmdvfs->dev, "Maximum UP instances reached\n");
> +		return -ENOSPC;
> +	}
> +
> +	ops =3D mmdvfs_up_get_ops(type);
> +	if (!ops) {
> +		mmdvfs_err(mmdvfs->dev, "UP operations not found for type %d\n", type);
> +		return -ENODEV;
> +	}
> +
> +	mutex_lock(&data->lock);
> +
> +	for (int i =3D 0; i < data->up_count; i++) {
> +		if (data->up_instances[i].type =3D=3D type) {
> +			mmdvfs_err(mmdvfs->dev,
> +				   "UP type %d already registered\n", type);
> +			ret =3D -EEXIST;
> +			goto unlock;
> +		}
> +	}
> +
> +	up =3D &data->up_instances[data->up_count];
> +	up->type =3D type;
> +	up->ops =3D ops;
> +	up->priv_data =3D NULL;
> +
> +	data->up_count++;
> +
> +	if (ops->init) {
> +		ret =3D ops->init(mmdvfs);
> +		if (ret) {
> +			mmdvfs_err(mmdvfs->dev,
> +				   "Failed to initialize UP type %d: %d\n",
> +				   type, ret);
> +			data->up_count--;
> +			goto unlock;
> +		}
> +	}

[ ... ]

> +struct mmdvfs_up_instance *
> +mmdvfs_up_get_instance(struct mmdvfs_device *mmdvfs, enum mmdvfs_up_type=
 type)
> +{
> +	struct mmdvfs_data *data;
> +	int i;
> +
> +	if (!mmdvfs || !mmdvfs->data) {
> +		pr_err("mmdvfs: Invalid device reference\n");
> +		return NULL;
> +	}
> +
> +	data =3D mmdvfs->data;
> +
> +	for (i =3D 0; i < data->up_count; i++) {
> +		if (data->up_instances[i].type =3D=3D type)
> +			return &data->up_instances[i];
> +	}
> +
> +	return NULL;
> +}

[Severity: High]
Can concurrent callers of mtk_mmdvfs_enable_vcp() or mmdvfs_get_vcp_base()
race with asynchronous UP registration and teardown?

When vote_requires_up_ready is false, mmdvfs_probe() publishes the device
via mmdvfs_register_device() before mmdvfs_init_kthread() calls
mmdvfs_up_register().  mmdvfs_up_register() increments data->up_count
before ops->init() finishes, and mmdvfs_up_get_instance() reads
data->up_count and data->up_instances[] without holding data->lock:

mmdvfs-init-kthread               CPU1
mmdvfs_init_up()
  mmdvfs_up_register()
    data->up_count++
    mmdvfs_vcp_init_impl()
      mmdvfs_up_set_priv(..., priv)
      ...
                                  mtk_mmdvfs_enable_vcp()
                                    mmdvfs_up_get_instance()
      /* init times out */
      vcp_put(priv->vcp_device)
                                    hfrp_instance->ops->enable()
                                      /* uses put vcp_device */

Similarly, mmdvfs_remove() calls deinit_hw() and mmdvfs_up_unregister()
before mmdvfs_unregister_device(), and VCP_EVENT_SUSPEND accesses
priv->pwr_usage[], init_ready_mask, and cb_ready without pwr_mutex or
cb_mutex.

> diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-vcp.c b/drivers/soc/media=
tek/mmdvfs/mmdvfs-vcp.c
> new file mode 100644
> index 0000000000000..fc6db1c89294c
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-vcp.c
> @@ -0,0 +1,1075 @@

[ ... ]

> +static void mmdvfs_get_bootmode(void)
> +{
> +	struct device_node *np_chosen;
> +	struct tag_bootmode {
> +		u32 size;
> +		u32 tag;
> +		u32 bootmode;
> +		u32 boottype;
> +	} *tag;
> +
> +	if (bootmode < UNKNOWN_BOOT)
> +		return;
> +
> +	np_chosen =3D of_find_node_by_path("/chosen");
> +	if (!np_chosen) {
> +		bootmode =3D NORMAL_BOOT;
> +		return;
> +	}
> +
> +	tag =3D (struct tag_bootmode *)of_get_property(np_chosen, "atag,boot", =
NULL);
> +	of_node_put(np_chosen);
> +
> +	if (tag)
> +		bootmode =3D tag->bootmode;
> +	else
> +		bootmode =3D NORMAL_BOOT;
> +}

[Severity: Medium]
Doesn't mmdvfs_get_bootmode() dereference tag->bootmode after dropping
the reference to np_chosen with of_node_put(), without checking the
property length?

If "atag,boot" is shorter than offsetofend(struct tag_bootmode, bootmode),
reading tag->bootmode reads out of bounds, and the raw struct cast skips
FDT endianness conversion.  In addition, bootmode is read and written
without locking before priv->ipi_mutex is taken, returning -EACCES on
RECOVERY_BOOT causes VCP_EVENT_READY to abort before setting cb_ready
(making mmdvfs_init_up() time out after 100 seconds), and neither
"atag,boot" nor the unused "mediatek,mmup-core" lookup in
mmdvfs_vcp_init_impl() is documented in Devicetree bindings.

> +
> +/*
> + * mmdvfs_vcp_wait_target_ready - Wait for VCP/MMUP ready
> + */
> +static int
> +mmdvfs_vcp_wait_target_ready(struct mmdvfs_device *mmdvfs,
> +			     struct mmdvfs_vcp_priv *priv,
> +			     enum vcp_feature_id target_feature,
> +			     const char *target_name,
> +			     struct mmdvfs_vcp_ipi_data *ipi_data)
> +{
> +	int retry =3D 0;
> +	bool hw_ready =3D mmdvfs_vcp_is_ready(priv, target_feature);
> +
> +	while (!hw_ready || !READ_ONCE(priv->cb_ready) || priv->rst_clk_done) {
> +		if (!READ_ONCE(priv->cb_ready) &&
> +		    (ipi_data->func =3D=3D FUNC_MMDVFS_INIT ||
> +		     ipi_data->func =3D=3D FUNC_MMDVFSRC_INIT))
> +			break;

[Severity: Medium]
Does this break out of the readiness wait loop on the first iteration for
FUNC_MMDVFS_INIT and FUNC_MMDVFSRC_INIT even when hw_ready is false?
Because priv->cb_ready is always false while sending those two init IPIs,
the condition is unconditionally true and skips waiting for
mmdvfs_vcp_is_ready() and !priv->rst_clk_done.

> +
> +		if (++retry > VCP_SYNC_TIMEOUT_MS) {
> +			mmdvfs_err(mmdvfs->dev,
> +				   "%s not ready after %d ms (func=3D%u)\n",
> +				   target_name, VCP_SYNC_TIMEOUT_MS, ipi_data->func);
> +			return -ETIMEDOUT;
> +		}
> +		mdelay(1);
> +		hw_ready =3D mmdvfs_vcp_is_ready(priv, target_feature);
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * mmdvfs_vcp_send_and_sync - Send IPI and sync
> + */
> +static int
> +mmdvfs_vcp_send_and_sync(struct mmdvfs_device *mmdvfs,
> +			 struct mmdvfs_vcp_priv *priv,
> +			 struct mtk_ipi_device *ipidev,
> +			 enum vcp_feature_id target_feature,
> +			 u32 target_ipi_id,
> +			 const char *target_name,
> +			 void *data,
> +			 struct mmdvfs_vcp_ipi_data *ipi_data,
> +			 void __iomem *mem_base,
> +			 u32 sync_func_val)
> +{
> +	int ret, retry;

[ ... ]

> +	mutex_lock(&priv->pwr_mutex);
> +
> +	writel(0, mem_base + MEM_IPI_SYNC_DATA);
> +	writel(sync_func_val | (1 << ipi_data->func),
> +	       mem_base + MEM_IPI_SYNC_FUNC);
> +
> +	mutex_lock(&priv->cb_mutex);
> +	if (!priv->cb_ready &&
> +	    ipi_data->func !=3D FUNC_MMDVFS_INIT &&
> +	    ipi_data->func !=3D FUNC_MMDVFSRC_INIT) {
> +		mutex_unlock(&priv->cb_mutex);
> +		mmdvfs_err(mmdvfs->dev, "%s cb_ready false before IPI\n", target_name);
> +		mutex_unlock(&priv->pwr_mutex);
> +		return -ETIMEDOUT;
> +	}
> +	mutex_unlock(&priv->cb_mutex);
> +	mutex_unlock(&priv->pwr_mutex);
> +
> +	ret =3D priv->vcp_device->ipi_ops->ipi_send(ipidev, target_ipi_id,
> +						  data, PIN_OUT_SIZE_MMDVFS);
> +	if (ret !=3D IPI_ACTION_DONE) {
> +		mmdvfs_err(mmdvfs->dev, "IPI send to %s failed: %d\n",
> +			   target_name, ret);
> +		ret =3D -EIO;
> +		goto cleanup_sync;
> +	}
> +
> +	retry =3D 0;
> +	while (1) {
> +		u32 sync_data =3D readl(mem_base + MEM_IPI_SYNC_DATA);
> +
> +		if (sync_data & (1 << ipi_data->func))
> +			break;
> +
> +		if (++retry > 1000000) {
> +			mmdvfs_err(mmdvfs->dev, "IPI timeout (func=3D%u)\n", ipi_data->func);
> +			ret =3D -ETIMEDOUT;
> +			goto cleanup_sync;
> +		}
> +
> +		if (!mmdvfs_vcp_is_ready(priv, target_feature)) {
> +			mmdvfs_err(mmdvfs->dev, "%s not ready during wait (func=3D%u)\n",
> +				   target_name, ipi_data->func);
> +			ret =3D -ETIMEDOUT;
> +			goto cleanup_sync;
> +		}
> +		udelay(1);
> +	}

[Severity: Medium]
Can this udelay(1) loop busy-spin on the CPU for over a second while
holding priv->ipi_mutex in sleepable process context?

mmdvfs_vcp_wait_target_ready() and mmdvfs_vcp_init_impl() similarly
busy-wait with mdelay(1) for up to 1000 ms each while holding mutexes in
process context.  Could these loops use sleeping delays such as
usleep_range() or msleep() instead?

> +
> +	ret =3D 0;
> +
> +cleanup_sync:
> +	mutex_lock(&priv->pwr_mutex);
> +	if (ret =3D=3D 0) {
> +		u32 sync_func =3D readl(mem_base + MEM_IPI_SYNC_FUNC);
> +		u32 sync_data =3D readl(mem_base + MEM_IPI_SYNC_DATA);
> +
> +		writel(sync_func & ~sync_data, mem_base + MEM_IPI_SYNC_FUNC);
> +	}
> +	mutex_unlock(&priv->pwr_mutex);
> +
> +	return ret;
> +}

[Severity: Medium]
If ipi_send() fails, cb_ready is false, or the acknowledgment wait times
out, doesn't MEM_IPI_SYNC_FUNC keep the (1 << ipi_data->func) bit set?

Because MEM_IPI_SYNC_FUNC is written before checking cb_ready and
cleanup_sync only clears bits when ret =3D=3D 0, any failed IPI leaves its
function bit permanently set in MEM_IPI_SYNC_FUNC across subsequent IPIs
(which read back MEM_IPI_SYNC_FUNC into sync_func_val).  Also,
(1 << ipi_data->func) shifts a signed 32-bit int by an unvalidated u8;
using BIT(ipi_data->func) after checking ipi_data->func < 32 would avoid
undefined shift behavior.

> +
> +/*
> + * mmdvfs_vcp_send_ipi_impl - Send IPI to VCP/MMUP
> + */
> +static int
> +mmdvfs_vcp_send_ipi_impl(struct mmdvfs_device *mmdvfs, void *data, u32 l=
en,
> +			 const bool vcp)
> +{

[ ... ]

> +	mutex_lock(&priv->ipi_mutex);
> +	if (!mem_base) {
> +		mmdvfs_err(mmdvfs->dev, "Shared memory base is NULL\n");
> +		ret =3D -ENOMEM;
> +		goto unlock_ipi;
> +	}
> +
> +	sync_func_val =3D readl(mem_base + MEM_IPI_SYNC_FUNC);
> +
> +	ret =3D mmdvfs_vcp_wait_target_ready(mmdvfs, priv, target_feature,
> +					   target_name, ipi_data);

[Severity: Medium]
If a non-init IPI calls mmdvfs_vcp_send_ipi_impl() while priv->cb_ready
is false, doesn't holding priv->ipi_mutex across
mmdvfs_vcp_wait_target_ready() prevent VCP_EVENT_READY from ever setting
priv->cb_ready =3D true?

CPU0                              CPU1 (VCP_EVENT_READY)
mmdvfs_vcp_send_ipi_impl()
  mutex_lock(&priv->ipi_mutex)
  mmdvfs_vcp_wait_target_ready()
    /* polls priv->cb_ready */
                                  mmdvfs_mmup_notifier_callback()
                                    mmdvfs_vcp_send_ipi_impl(FUNC_MMDVFS_IN=
IT)
                                      mutex_lock(&priv->ipi_mutex)
                                      <-- blocked until CPU0 times out
                                    mmdvfs_vcp_set_init_ready(..., true)

Because VCP_EVENT_READY must acquire priv->ipi_mutex to send
FUNC_MMDVFS_INIT and FUNC_MMDVFSRC_INIT before setting priv->cb_ready,
CPU0 is guaranteed to spin for the full 1000 ms and fail with -ETIMEDOUT.

[ ... ]

> +static int mmdvfs_mmup_notifier_callback(struct notifier_block *nb,
> +					 unsigned long event, void *data)
> +{
> +	struct mmdvfs_vcp_priv *priv =3D
> +		container_of(nb, struct mmdvfs_vcp_priv, mmup_notifier);
> +	struct mmdvfs_device *mmdvfs =3D priv->mmdvfs;
> +	int ret;
> +
> +	switch (event) {
> +	case VCP_EVENT_READY:

[ ... ]

> +		/* Initialize MMUP SRAM */
> +		if (priv->mmup_enable && priv->mmup_sram_enable && !priv->mmup_sram_va=
) {
> +			void __iomem *sram_base;
> +			void __iomem *mem_base;
> +			u32 sram_offset;
> +
> +			sram_base =3D priv->vcp_device->ops->get_vcp_sram_virt(priv->vcp_devi=
ce);

[Severity: Medium]
Can priv->vcp_device->ops->get_vcp_sram_virt be NULL here?
mmdvfs_vcp_init_impl() checks get_mem_phys, get_mem_iova, and
get_mem_virt, but never verifies that get_vcp_sram_virt is populated
before this unconditional call.

> +			if (sram_base) {
> +				mem_base =3D priv->mmup_enable ? priv->mmup_va : priv->vcp_va;
> +				sram_offset =3D readl(mem_base + MEM_SRAM_OFFSET);
> +				priv->mmup_sram_va =3D sram_base + sram_offset;
> +			}
> +		}
> +
> +		mmdvfs_vcp_set_init_ready(priv, MMDVFS_UP_INIT_READY, true);
> +
> +		break;
> +
> +	case VCP_EVENT_STOP:
> +		priv->vcp_stop =3D true;
> +		mmdvfs_vcp_set_init_ready(priv, MMDVFS_UP_INIT_READY, false);
> +		break;
> +
> +	case VCP_EVENT_SUSPEND:
> +		priv->release_step_done =3D true;
> +		mmdvfs_reset_vcp(priv);
> +		WRITE_ONCE(priv->init_ready_mask, 0);
> +		WRITE_ONCE(priv->cb_ready, false);
> +		WRITE_ONCE(mmdvfs->data->init_done, false);
> +		break;

[Severity: Medium]
Should VCP_EVENT_SUSPEND hold priv->pwr_mutex around mmdvfs_reset_vcp()
and update init_ready_mask, cb_ready, and init_done through
mmdvfs_vcp_set_init_ready() under priv->cb_mutex?  Modifying those fields
without cb_mutex can race with concurrent mmdvfs_vcp_set_init_ready() or
mmdvfs_vcp_send_and_sync() calls.

[ ... ]

> +static void *mmdvfs_vcp_get_base_impl(struct mmdvfs_device *mmdvfs, u32 =
mem_id, phys_addr_t *pa)
> +{
> +	struct mmdvfs_vcp_priv *priv =3D mmdvfs_vcp_priv(mmdvfs);
> +
> +	if (!priv)
> +		return NULL;
> +
> +	if (mem_id =3D=3D MMDVFS_MMUP_MEM_ID) {
> +		if (pa)
> +			*pa =3D priv->mmup_pa;
> +		return priv->mmup_va;
> +	} else if (mem_id =3D=3D MMDVFS_VCP_MEM_ID) {
> +		if (pa)
> +			*pa =3D priv->vcp_pa;
> +		return priv->vcp_va;
> +	}
> +
> +	mmdvfs_warn(mmdvfs->dev, "Unknown mem_id %u, defaulting to VCP\n", mem_=
id);
> +	if (pa)
> +		*pa =3D priv->vcp_pa;
> +	return priv->vcp_va;
> +}

[Severity: Low]
mmdvfs_vcp_get_base_impl() and struct mmdvfs_up_ops::get_base return
void * instead of void __iomem * when returning priv->mmup_va and
priv->vcp_va, unlike get_sram() right below which preserves __iomem.

[ ... ]

> +static int mmdvfs_vcp_init_impl(struct mmdvfs_device *mmdvfs)
> +{

[ ... ]

> +	priv->vcp_device =3D vcp_get(to_platform_device(mmdvfs->dev));
> +	if (!priv->vcp_device) {
> +		return dev_err_probe(mmdvfs->dev, -EPROBE_DEFER,
> +				     "VCP device is not ready\n");
> +	}

[Severity: Medium]
Is it valid to call dev_err_probe(..., -EPROBE_DEFER, ...) when
mmdvfs_vcp_init_impl() is invoked from the asynchronous
mmdvfs_init_kthread()?

When vote_requires_up_ready is false, mmdvfs_probe() has already returned
0 by the time mmdvfs_init_kthread() runs.  Calling dev_err_probe() outside
probe context mutates dev->p->deferred_probe_reason without driver-core
probe locking, and returning -EPROBE_DEFER from the kthread will not
trigger deferred re-probing, leaving data->init_done permanently false.

[ ... ]

> +		/* Keep firmware-owned control slots inactive unless firmware changes =
them. */
> +		for (i =3D 0; i < MEM_FW_RSVD_OPP_PWR_COUNT; i++) {
> +			writel(MAX_OPP, mem_base + MEM_FW_RSVD_OPP_PWR(i));
> +			writel(MAX_OPP, mem_base + MEM_VOTE_OPP_PWR(i));
> +			writel(MAX_OPP, mem_base + MEM_PWR_OPP(i));
> +			writel(MAX_OPP, mem_base + MEM_PWR_CUR_GEAR(i));
> +			writel(MAX_OPP, mem_base + MEM_FW_RSVD_VOL(i));
> +		}
> +		for (i =3D 0; i < MEM_VOTE_OPP_USR_COUNT; i++) {
> +			writel(MAX_OPP, mem_base + MEM_VOTE_OPP_USR(i));
> +			writel(MAX_OPP, mem_base + MEM_MUX_OPP(i));
> +			writel(MAX_OPP, mem_base + MEM_MUX_MIN(i));
> +			writel(MAX_OPP, mem_base + MEM_FW_RSVD_CLK(i));
> +		}

[Severity: Medium]
Doesn't bounding this loop by MEM_VOTE_OPP_USR_COUNT (14) leave mux slots
14 and 15 of MEM_MUX_OPP, MEM_MUX_MIN, and MEM_FW_RSVD_CLK uninitialized
at 0 instead of MAX_OPP?  In mmdvfs-vcp-memory.h those three mux register
arrays have 16 entries (matching MMDVFS_MAX_MUXES =3D 16).

[ ... ]

> +static void mmdvfs_vcp_deinit_impl(struct mmdvfs_device *mmdvfs)
> +{
> +	struct mmdvfs_vcp_priv *priv =3D mmdvfs_vcp_priv(mmdvfs);
> +
> +	if (!priv)
> +		return;
> +
> +	if (!priv->initialized) {
> +		mmdvfs_up_set_priv(mmdvfs, MMDVFS_UP_VCP, NULL);
> +		return;
> +	}
> +
> +	mmdvfs_vcp_unregister_notify(priv,
> +				     priv->mmup_enable ? priv->mmup_feature_id :
> +				     priv->vcp_feature_id,
> +				     &priv->mmup_notifier);
> +
> +	if (priv->pwr_usage[VCP_PWR_USR_MMDVFS_INIT])
> +		mmdvfs_vcp_enable_impl(mmdvfs, false, VCP_PWR_USR_MMDVFS_INIT);
> +
> +	if (priv->vcp_pdev)
> +		platform_device_put(priv->vcp_pdev);
> +	if (priv->mmup_pdev)
> +		platform_device_put(priv->mmup_pdev);
> +	if (priv->vcp_device && priv->vcp_device->dev)
> +		vcp_put(priv->vcp_device);
> +
> +	priv->initialized =3D false;
> +	mmdvfs_up_set_priv(mmdvfs, MMDVFS_UP_VCP, NULL);
> +}

[Severity: Medium]
Should mmdvfs_vcp_deinit_impl() clear priv->cb_ready and
mmdvfs->data->init_done via mmdvfs_vcp_set_init_ready(priv,
MMDVFS_UP_INIT_READY, false)?

If mmdvfs_init_up() fails in mmdvfs_vcp_release_init() or stops after
VCP_EVENT_READY has already set data->init_done =3D true, tearing down the
VCP backend leaves data->init_done set, allowing mmdvfs_set_rate() votes
to proceed after VCP unregistration.  Also, in mmdvfs_remove(), should
mmdvfs_unregister_device() run before deinit_hw() and
mmdvfs_up_unregister() so exported helpers cannot look up the device while
it is being torn down?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125060037.6496=
59-1-echo.zhang@mediatek.com?part=3D4
