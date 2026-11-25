Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595744;
	b=f1K3yFg83TxeAauPnJQzzuWXbbTG89IP19CCEaxMgVeKh8ZAEvFAh4UyvA4JlaYij91o
	 K+JeR9ZPgUg7HQlrKIX64e9ASEdRGN566FmJ/BblTJs5jlsTO46vvMZlp2hJ/nY+Nboje
	 p/l0OdMGtHedVICfBBJ/yFkMkyqoHGZa2JAc5uLooxtx790XJQX/blVuIBGmZ0Zn46NI5
	 ax9Vrx+27QR5uT0x73b5Kkw9p5+kOCaUFzTMlHRbGTX2K+RDBksWqxSj4yuUnrZ3b/cZi
	 1vsMvOK+w5rbOFZmiS17zLczSHFZ1Qyz3TnBzVVi/D0nsKwNK6UQ9VKqrNZKRVIHhzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595744;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=p9rDV1w1n1eUtOZlLwilCxzv/nUYe7BSNP2w6CsXzVY=;
	b=qKjlhL4ZC/h4c8hHeK4X/X+Vp16rNZglmKJlLrpaQ+VCLL8CZLeomkdz0dqwqGkuorig
	 IlVP7lX4D9US+ASENHd4W10tkfSI8R6tcX6gBd0j4eZ2NZ4a932saPM0V0asrTyU3nROV
	 KR3DexL4tENGmkCUCe39N/DH4S7IiLyO9EaDK5FURsYPiOC0aYzyUk6k3iHkwtdiptUy8
	 XPnLZkliq0yyB+ty6UKrf+THJkv6FgCRJwriBt9Woba4gFC1H2u1AMiYVaDliMlthKkRn
	 F6CyVQO3n/rmZJE5LN5a/hjhOBKTAwBRNiY6RjNmccZtku1k6tFR4OE2YhZte/KSo+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=XY20lnH+;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CD5606A339;
	Wed, 25 Nov 2026 08:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15CD5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=XY20lnH+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795595741; x=1795854941;
	bh=p9rDV1w1n1eUtOZlLwilCxzv/nUYe7BSNP2w6CsXzVY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XY20lnH+D7GdeyZUqXOcKCkr6BiFGJPnxcvmqt4O6Dh5xZF3Q/P4hr2BVK/Q6SxaS
	 XBhNEsM+jVHC4iV4LAktnZudo1qMCE3UGuL5oU2yJHnsD2bSxJ/YvEUt73gD6N27gs
	 j/KJN2wg/l/aa6dRxGwbY55Nilsj+jrd0oXJ4+4mNoEWbpkZ9gMIbhA0PzjIvsXPM6
	 EkwwWsVXgML4xizFPHupNQSsxGZxuBj46ZyGliH/V4xfyuBRaoSFWumTKygyn0LISu
	 0UJeGaezqcKuep8ZbhAYbRjRXl/ziLbNJUChi64B6zfAvjEcYYjYZChXz3M9/dDr2v
	 bk+Ku8ywDucdw==
Date: Wed, 25 Nov 2026 08:35:35 +0000
To: Echo Zhang <echo.zhang@mediatek.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, MMDVFS Team <linux-mediatek@lists.infradead.org>, kyrie.wu@mediatek.com, ming-fan.chen@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 3/7] soc: mediatek: add MMDVFS core driver
Message-ID: <0vpkq8QMzkS9rM8xDYoGQbv6SCvX1hOcLEoZdGV5sfYZSfp0taUU5JKnzSQbdC_iMZ8_Fje93Ih5YcskoVnb7k3bUQy5WAyy3B0uiEs5S14=@protonmail.com>
In-Reply-To: <20261125060037.649659-4-echo.zhang@mediatek.com>
References: <20261125060037.649659-1-echo.zhang@mediatek.com> <20261125060037.649659-4-echo.zhang@mediatek.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 4a1f33fb2a8211670c97ec8fddb31a18743b042b
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, November 25th, 2026 at 8:01 AM, Echo Zhang <echo.zhang@mediat=
ek.com> wrote:

> Add the common MediaTek MMDVFS driver framework.
>=20
> The core driver handles device probing, SoC data selection, clock provide=
r
> registration, power-management notification, and dispatch to the
> microprocessor transport used for runtime performance voting.
>=20
> Signed-off-by: Echo Zhang <echo.zhang@mediatek.com>
> ---

...

> diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-core.c b/drivers/soc/medi=
atek/mmdvfs/mmdvfs-core.c
> new file mode 100644
> index 000000000000..c32fa11557af
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-core.c
> @@ -0,0 +1,581 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 MediaTek Inc.
> + *
> + * MediaTek MMDVFS Core Framework
> + */
> +
> +#include <linux/atomic.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/sched/clock.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/suspend.h>
> +#include <linux/workqueue.h>
> +
> +#include "mmdvfs-internal.h"
> +
> +static int mmdvfs_register_device(struct mmdvfs_device *mmdvfs);
> +static void mmdvfs_unregister_device(struct mmdvfs_device *mmdvfs);
> +
> +struct mmdvfs_device *mmdvfs_find_device_by_version(enum mmdvfs_version_=
type version);
> +struct mmdvfs_device *mmdvfs_find_device_any(void);
> +
> +struct mmdvfs_device *mmdvfs_find_device_any(void)
> +{
> +=09return mmdvfs_find_device_by_version(MMDVFS_VERSION_HWCCF_DVFS_VOTER)=
;
> +}
> +EXPORT_SYMBOL_GPL(mmdvfs_find_device_any);

Ambiguous function name. any would mean *any* version, but it uses
hardware here.

> +
> +/**
> + * mmdvfs_get_version - Get MMDVFS voting mechanism type
> + *
> + * Return:
> + *   0 - No hardware voter
> + *   1 - HWCCF DVFS voter
> + */
> +u32 mmdvfs_get_version(void)
> +{
> +=09struct mmdvfs_device *mmdvfs;
> +
> +=09mmdvfs =3D mmdvfs_find_device_any();
> +=09if (!mmdvfs || !mmdvfs->data)
> +=09=09return MMDVFS_VERSION_NONE;
> +
> +=09return mmdvfs->data->version;
> +}
> +EXPORT_SYMBOL_GPL(mmdvfs_get_version);
> +
> +/*
> + * mmdvfs_validate_topology - Validate RC/MUX/User topology consistency
> + * @mmdvfs: MMDVFS device structure
> + *
> + * Return: 0 on success, -EINVAL if topology validation fails
> + */
> +static int mmdvfs_validate_topology(struct mmdvfs_device *mmdvfs)
> +{
> +=09struct mmdvfs_data *data =3D mmdvfs->data;
> +=09int i, j;
> +
> +=09if (!data || !data->mux || !data->rc) {
> +=09=09mmdvfs_err(mmdvfs->dev, "Invalid data structures for validation\n"=
);
> +=09=09return -EINVAL;
> +=09}
> +
> +=09for (i =3D 0; i < data->mux_num; i++) {
> +=09=09struct mmdvfs_mux *mux =3D &data->mux[i];
> +=09=09struct mmdvfs_rc *rc;
> +
> +=09=09if (!mux->name || strlen(mux->name) =3D=3D 0) {
> +=09=09=09mmdvfs_err(mmdvfs->dev, "MUX %d has empty name\n", i);
> +=09=09=09return -EINVAL;
> +=09=09}
> +
> +=09=09if (mux->rc >=3D data->rc_num) {
> +=09=09=09mmdvfs_err(mmdvfs->dev,
> +=09=09=09=09   "MUX %d (%s) has invalid RC reference: %d (max: %d)\n",
> +=09=09=09=09   i, mux->name, mux->rc, data->rc_num);
> +=09=09=09return -EINVAL;
> +=09=09}
> +
> +=09=09rc =3D &data->rc[mux->rc];
> +
> +=09=09if (rc->level_num =3D=3D 0 || rc->level_num > MMDVFS_MAX_LEVELS) {
> +=09=09=09mmdvfs_err(mmdvfs->dev,
> +=09=09=09=09   "MUX %d (%s): RC %d has invalid level_num: %d\n",
> +=09=09=09=09   i, mux->name, mux->rc, rc->level_num);
> +=09=09=09return -EINVAL;
> +=09=09}
> +
> +=09=09if (mux->freq_num =3D=3D 0 || mux->freq_num > MMDVFS_MAX_LEVELS) {
> +=09=09=09mmdvfs_err(mmdvfs->dev,
> +=09=09=09=09   "MUX %d (%s): invalid freq_num: %d\n",
> +=09=09=09=09   i, mux->name, mux->freq_num);
> +=09=09=09return -EINVAL;
> +=09=09}
> +
> +=09=09for (j =3D 0; j < mux->freq_num; j++) {
> +=09=09=09if (mux->freq[j] =3D=3D 0) {
> +=09=09=09=09mmdvfs_err(mmdvfs->dev,
> +=09=09=09=09=09   "MUX %d (%s): incomplete freq table at level %d/%d (fr=
eq=3D0)\n",
> +=09=09=09=09=09   i, mux->name, j, mux->freq_num);
> +=09=09=09=09return -EINVAL;
> +=09=09=09}
> +
> +=09=09=09if (j > 0 && mux->freq[j] <=3D mux->freq[j - 1]) {
> +=09=09=09=09mmdvfs_warn(mmdvfs->dev,
> +=09=09=09=09=09    "MUX %d (%s): freq not ascending: freq[%d]=3D%llu <=
=3D freq[%d]=3D%llu\n",
> +=09=09=09=09=09    i, mux->name, j, mux->freq[j],
> +=09=09=09=09=09    j - 1, mux->freq[j - 1]);
> +=09=09=09}
> +=09=09}
> +
> +=09=09mmdvfs_dbg(mmdvfs->dev,
> +=09=09=09   "MUX[%d] validated: name=3D%s, rc=3D%d, freq_num=3D%d (RC le=
vels=3D%d), freq_min=3D%llu, freq_max=3D%llu\n",
> +=09=09=09   i, mux->name, mux->rc, mux->freq_num,
> +=09=09=09   rc->level_num, mux->freq[0],
> +=09=09=09   mux->freq[mux->freq_num - 1]);
> +=09}
> +
> +=09for (i =3D 0; i < data->user_num; i++) {
> +=09=09struct mmdvfs_user *user =3D &data->user[i];
> +
> +=09=09if (!user->name || strlen(user->name) =3D=3D 0) {
> +=09=09=09mmdvfs_err(mmdvfs->dev, "User %d has empty name\n", i);
> +=09=09=09return -EINVAL;
> +=09=09}
> +
> +=09=09if (user->mux >=3D data->mux_num) {
> +=09=09=09mmdvfs_err(mmdvfs->dev,
> +=09=09=09=09   "User %d (%s) has invalid MUX reference: %d (max: %d)\n",
> +=09=09=09=09   i, user->name, user->mux, data->mux_num);
> +=09=09=09return -EINVAL;
> +=09=09}
> +
> +=09=09mmdvfs_dbg(mmdvfs->dev,
> +=09=09=09   "User[%d] validated: name=3D%s, id=3D%d, mux=3D%d\n",
> +=09=09=09   i, user->name, user->id, user->mux);
> +=09}
> +
> +=09mmdvfs_info(mmdvfs->dev, "Topology validation successful\n");

Do we really need these logs? This applies to the rest of the driver
too.

...

> +/*
> + * mmdvfs_parse_dt - Parse device tree configuration
> + * @mmdvfs: MMDVFS device structure
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int mmdvfs_parse_dt(struct mmdvfs_device *mmdvfs)
> +{
> +=09struct device_node *node =3D mmdvfs->dev->of_node;
> +
> +=09if (!node) {
> +=09=09mmdvfs_err(mmdvfs->dev, "No device tree node found\n");
> +=09=09return -ENODEV;
> +=09}
> +
> +=09mmdvfs_info(mmdvfs->dev, "Device tree parsed (hardware attributes)\n"=
);
> +
> +=09return 0;

This is not DT parsing.

> +}
> +
> +/*
> + * mmdvfs_pm_notifier_callback - PM notifier callback for suspend/resume=
 handling
> + * @nb: Notifier block
> + * @event: PM event type
> + * @data: Event data
> + *
> + * Return: NOTIFY_DONE
> + */
> +static int mmdvfs_pm_notifier_callback(struct notifier_block *nb, unsign=
ed long event,
> +=09=09=09=09       void *data)
> +{
> +=09struct mmdvfs_data *mdata =3D
> +=09=09container_of(nb, struct mmdvfs_data, pm_notifier);
> +=09struct mmdvfs_device *mmdvfs =3D dev_get_drvdata(mdata->dev);
> +
> +=09switch (event) {
> +=09case PM_SUSPEND_PREPARE:
> +=09=09mmdvfs_dbg(mmdvfs->dev, "System suspending...\n");
> +
> +=09=09if (mdata->ops && mdata->ops->suspend_prepare)
> +=09=09=09mdata->ops->suspend_prepare(mmdvfs);
> +
> +=09=09mdata->pm_suspended =3D true;
> +=09=09break;
> +
> +=09case PM_POST_SUSPEND:
> +=09=09mmdvfs_dbg(mmdvfs->dev, "System resumed\n");
> +
> +=09=09mdata->pm_suspended =3D false;
> +
> +=09=09if (mdata->ops && mdata->ops->post_suspend)
> +=09=09=09mdata->ops->post_suspend(mmdvfs);
> +=09=09break;
> +
> +=09default:
> +=09=09break;
> +=09}
> +
> +=09return NOTIFY_DONE;
> +}
> +
> +/*
> + * mmdvfs_probe - Main probe function
> + * @pdev: Platform device
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int mmdvfs_probe(struct platform_device *pdev)
> +{
> +=09struct mmdvfs_device *mmdvfs;
> +=09struct mmdvfs_data *data;
> +=09const struct mmdvfs_platform_data *pdata;
> +=09int ret;
> +
> +=09mmdvfs =3D devm_kzalloc(&pdev->dev, sizeof(*mmdvfs), GFP_KERNEL);
> +=09if (!mmdvfs)
> +=09=09return -ENOMEM;
> +
> +=09data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +=09if (!data)
> +=09=09return -ENOMEM;
> +
> +=09mmdvfs->dev =3D &pdev->dev;
> +=09mmdvfs->data =3D data;
> +=09data->dev =3D &pdev->dev;
> +
> +=09mutex_init(&data->lock);
> +
> +=09platform_set_drvdata(pdev, mmdvfs);
> +
> +=09pdata =3D of_device_get_match_data(&pdev->dev);
> +=09if (!pdata) {

This is not possible, since you already have mt8196 platform data in
the table. Drop the check.

> +=09=09mmdvfs_err(mmdvfs->dev, "No matching platform data\n");
> +=09=09return -ENODEV;
> +=09}
> +
> +=09data->ops =3D pdata->ops;
> +=09data->version =3D pdata->soc_data->version;
> +
> +=09if (data->version =3D=3D MMDVFS_VERSION_HWCCF_DVFS_VOTER) {
> +=09=09data->hwccf_voter_priv =3D devm_kzalloc(&pdev->dev,
> +=09=09=09=09=09=09      sizeof(*data->hwccf_voter_priv),
> +=09=09=09=09=09=09      GFP_KERNEL);
> +=09=09if (!data->hwccf_voter_priv)
> +=09=09=09return -ENOMEM;
> +
> +=09=09data->hwccf_voter_priv->mmdvfs =3D mmdvfs;
> +=09}
> +
> +=09ret =3D mmdvfs_parse_dt(mmdvfs);
> +=09if (ret) {
> +=09=09mmdvfs_err(mmdvfs->dev, "Failed to parse device tree: %d\n", ret);
> +=09=09return ret;

dev_err_probe

> +=09}
> +
> +=09ret =3D mmdvfs_init_from_soc_data(mmdvfs, pdata->soc_data);
> +=09if (ret) {
> +=09=09mmdvfs_err(mmdvfs->dev, "Failed to initialize from SoC data: %d\n"=
, ret);
> +=09=09return ret;

...same...

> +=09}
> +
> +=09if (data->ops && data->ops->init_hw) {
> +=09=09ret =3D data->ops->init_hw(mmdvfs);
> +=09=09if (ret) {
> +=09=09=09mmdvfs_err(mmdvfs->dev, "Failed to initialize hardware: %d\n", =
ret);
> +=09=09=09return ret;

here too.

> +=09=09}
> +=09}
> +
> +=09data->init_done =3D true;
> +
> +=09ret =3D mmdvfs_register_clocks(mmdvfs);
> +=09if (ret) {
> +=09=09mmdvfs_err(mmdvfs->dev, "Failed to register clocks: %d\n", ret);
> +=09=09goto err_deinit_hw;
> +=09}
> +
> +=09data->pm_notifier.notifier_call =3D mmdvfs_pm_notifier_callback;
> +=09data->pm_notifier.priority =3D 0;
> +=09data->pm_suspended =3D false;
> +=09ret =3D register_pm_notifier(&data->pm_notifier);
> +=09if (ret) {
> +=09=09mmdvfs_err(mmdvfs->dev, "Failed to register PM notifier: %d\n", re=
t);
> +=09=09goto err_unregister_clocks;
> +=09}
> +=09mmdvfs_info(mmdvfs->dev, "PM notifier registered\n");
> +
> +=09ret =3D mmdvfs_register_device(mmdvfs);
> +=09if (ret) {
> +=09=09mmdvfs_err(mmdvfs->dev, "Failed to register device: %d\n", ret);
> +=09=09goto err_unregister_pm_notifier;
> +=09}
> +
> +=09mmdvfs_info(mmdvfs->dev, "MMDVFS driver probed successfully\n");
> +=09return 0;
> +
> +err_unregister_pm_notifier:
> +=09unregister_pm_notifier(&data->pm_notifier);
> +
> +err_unregister_clocks:
> +=09mmdvfs_unregister_clocks(mmdvfs);
> +
> +err_deinit_hw:
> +=09if (data->ops && data->ops->deinit_hw)
> +=09=09data->ops->deinit_hw(mmdvfs);
> +
> +=09return ret;
> +}
> +

...

> +struct mmdvfs_device *mmdvfs_find_device_by_version(enum mmdvfs_version_=
type version)
> +{
> +=09struct mmdvfs_device_node *node;
> +=09struct mmdvfs_device *found =3D NULL;
> +
> +=09mutex_lock(&mmdvfs_device_list_lock);

guard(mutex)(&mmdvfs_device_list_lock)

> +=09list_for_each_entry(node, &mmdvfs_device_list, list) {
> +=09=09if (node->mmdvfs && node->mmdvfs->data &&
> +=09=09    node->mmdvfs->data->version =3D=3D version) {
> +=09=09=09found =3D node->mmdvfs;
> +=09=09=09break;
> +=09=09}
> +=09}
> +=09mutex_unlock(&mmdvfs_device_list_lock);
> +
> +=09return found;
> +}
> +EXPORT_SYMBOL_GPL(mmdvfs_find_device_by_version);
> +

...

> diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h b/drivers/soc/=
mediatek/mmdvfs/mmdvfs-internal.h
> new file mode 100644
> index 000000000000..df16e38d78c8
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h
> @@ -0,0 +1,305 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2026 MediaTek Inc.
> + *
> + * MediaTek MMDVFS (MultiMedia Dynamic Voltage and Frequency Scaling) Dr=
iver
> + */
> +
> +#ifndef __MMDVFS_H__
> +#define __MMDVFS_H__
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_device.h>
> +
> +struct dentry;
> +
> +#define MMDVFS_MAX_LEVELS=09=098
> +#define MMDVFS_MAX_USERS=09=0964
> +#define MMDVFS_MAX_MUXES=09=0916
> +#define MMDVFS_MAX_RCS=09=09=094
> +
> +/* MMDVFS voting mechanism types */
> +enum mmdvfs_version_type {
> +=09MMDVFS_VERSION_NONE =3D 0,=09=09/* No hardware voter */
> +=09MMDVFS_VERSION_HWCCF_DVFS_VOTER =3D 1,=09/* HWCCF DVFS voter */
> +};
> +
> +#define MAX_OPP=09=09=09=098
> +
> +/* MMDVFS RC domains */
> +enum mmdvfs_rc_domain {
> +=09MMDVFS_PWR_VCORE =3D 0,  /* PWR_MMDVFS_VCORE */
> +=09MMDVFS_PWR_VMM   =3D 1,  /* PWR_MMDVFS_VMM */
> +=09MMDVFS_PWR_VDISP =3D 2,  /* PWR_MMDVFS_VDISP */
> +=09MMDVFS_PWR_NUM   =3D 3   /* PWR_MMDVFS_NUM */
> +};
> +
> +/**
> + * struct mmdvfs_rc - Resource Controller
> + * @id: RC identifier
> + * @pa: Physical address base
> + * @level_num: Number of supported levels
> + * @rc_base: Virtual address base (mapped from pa)
> + */
> +struct mmdvfs_rc {
> +=09u8 id;
> +=09u32 pa;

phys_addr_t

> +=09u8 level_num;
> +=09void __iomem *rc_base;
> +};

...

> +/* Logging macros */
> +#define mmdvfs_dbg(dev, fmt, args...) \
> +=09dev_dbg(dev, "[mmdvfs] " fmt, ##args)
> +#define mmdvfs_info(dev, fmt, args...) \
> +=09dev_info(dev, "[mmdvfs] " fmt, ##args)
> +#define mmdvfs_warn(dev, fmt, args...) \
> +=09dev_warn(dev, "[mmdvfs] " fmt, ##args)
> +#define mmdvfs_err(dev, fmt, args...) \
> +=09dev_err(dev, "[mmdvfs] " fmt, ##args)

The driver name is already printed when using dev_* APIs. Use them
directly.

Best regards,
Roman
