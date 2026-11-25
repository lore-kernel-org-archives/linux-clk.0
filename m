Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587538;
	b=ZfIZCbm84hGYuGAlkKG8gbxXXGG9/F8o6SHlijmOj7kHpDvlYjJaN7uYfrNDrSXtmCd+
	 ESGGtBJ8cWboyo2/ouYMbpMtP8B4EZ/4x4TLm29a1Bi5rYUQkV1PqmGDaG/zaDf+syzxm
	 bRqe97qRpzrIpaImeMB7U6IOPm9TKFGH857OeYdleAV+uabPXneKRX2iCgbRX0Y7hCIch
	 W1E1wxubhSnlZF88kbq2z5js1nuUs6YEk+BOR6YaHkSXzMOkHRwEVG8R+ATPzFRpApco7
	 DmicWunxJSCnI7m0kQ866zbPW/WUAEX6nExza1rw1ZLRBWPekowyymHdmE5t6YDhx3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587538;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eUqQ+xkonxgNvemknNBIJXUyl79Er6aQ0iwMEjOwX90=;
	b=c6vcWD82RNqi8xaSRmRka8Elj97zfaDNqSyvWP/SUdG389g9ZD0ZYC91N2RfI+Ry/qBO
	 19PelpBxBakjfUlKn+l/mruXx1i6CMfoJw5+5+KT1ZmJm18xk9k4Pxk5p7g+MP6j6WwML
	 5/qHEnqSGBAU+kwMXK2Wwcg1atz6iC6ivHMR5jpiZk9nOMknpymap8RLTpUvyBRKE92gR
	 zqfBcuhauyp5ZIVYcvROzU8DPa8Y1CtRkrXlDNF9gHHvpx7Cs/Wg+IwZKHeBstzTryr/+
	 u7I41r7cnHn0h9/sF4QIuCrc/i9dI18cqf5GRVt3fLQYlIsQR/MmJ0a+RHq/kmpXNpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eswPSzhZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2526C606A682;
	Wed, 25 Nov 2026 06:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eswPSzhZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573B51F00344;
	Wed, 25 Nov 2026 06:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795587537;
	bh=eUqQ+xkonxgNvemknNBIJXUyl79Er6aQ0iwMEjOwX90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eswPSzhZaKYTEveg9Dx1kBZG7JZQLk/GUsPICNECbtYPlfK2vVVqUDZ5b0+A64NsD
	 CHKEUVpvR+Ycx9EhGX3PWXRFhGVQ1SgVTfrWdkg9hyz08lUi1+FoZwKXPv2ha7weEM
	 OX5bvi/Qi2YLElz/rA1zBxdQeGid4Zks0Cn6sLEKIwxeVJSBPoffBUjyhzhro3SRsZ
	 6NjJK2AnauHLFRjbuwI6npsUCQPLmTlmXpN9r0g6/0QE7L7FX3VTyGS5ijKeyb2QVA
	 4Gh64szfff9D/X1Pj825egWbuEYwA4kx+8AjxgU9yPymM7ioL+inODy6+18G4tKbnK
	 nwhU+qd9fZzkg==
Message-ID: <sashiko-outbox-232656@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] soc: mediatek: add MMDVFS core driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Echo Zhang" <echo.zhang@mediatek.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125060037.649659-4-echo.zhang@mediatek.com>
References: <20261125060037.649659-1-echo.zhang@mediatek.com>
 <20261125060037.649659-4-echo.zhang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 06:18:53 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] soc: mediatek: mmdvfs: dependency on undefined Kconfig symbol
  MTK_VCP_RPROC
- [High] soc: mediatek: mmdvfs: premature MT8196 symbol references cause
  link failure
- [Medium] soc: mediatek: mmdvfs: UAF and teardown order bug in
  mmdvfs_remove()
- [Medium] soc: mediatek: mmdvfs: clocks remain active during
  deinit_hw() teardown
- [Low] soc: mediatek: mmdvfs: duplicate enum and declarations across
  headers
--

commit 5b3edaa4a79dffb92cf9cae0a066c56967485e24
Author: Echo Zhang <echo.zhang@mediatek.com>

soc: mediatek: add MMDVFS core driver

This commit adds the common MediaTek MMDVFS driver framework, including
device probing, SoC topology validation, clock provider registration,
power-management notification, and exported consumer helpers.

> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index d7293977f06e8..bb273a4461f0a 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -60,6 +60,25 @@ config MTK_REGULATOR_COUPLER
>  	default ARCH_MEDIATEK
>  	depends on REGULATOR
> =20
> +config MTK_MMDVFS
> +	tristate "MediaTek MMDVFS support"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on MTK_VCP_RPROC

[Severity: High]
Is MTK_VCP_RPROC defined anywhere in the Kconfig tree?  Because that symbol
does not exist, CONFIG_MTK_MMDVFS and CONFIG_MTK_MMDVFS_MT8196 can never be
enabled, and the IS_ENABLED(CONFIG_MTK_VCP_RPROC) guard in
include/soc/mediatek/mmdvfs.h always selects the no-op inline stubs instead
of the public declarations.

> diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c b/drivers/soc/media=
tek/mmdvfs/mmdvfs-clk.c
> new file mode 100644
> index 0000000000000..114f3148cf461
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c
[ ... ]
> +/*
> + * mmdvfs_unregister_clocks - Unregister clock providers
> + * @mmdvfs: MMDVFS device structure
> + */
> +void mmdvfs_unregister_clocks(struct mmdvfs_device *mmdvfs)
> +{
> +	if (mmdvfs && mmdvfs->dev)
> +		mmdvfs_dbg(mmdvfs->dev, "MMDVFS clocks unregistered\n");
> +}

[Severity: Medium]
Can clock consumers still call mmdvfs_set_rate() -> data->ops->hw_vote()
while or after data->ops->deinit_hw() tears down the hardware?

mmdvfs_register_clocks() registers the clocks and OF provider with
devm_clk_hw_register() and devm_of_clk_add_hw_provider(), while
mmdvfs_unregister_clocks() only logs a debug message and leaves
data->init_done set to true.  When mmdvfs_remove() or the
err_unregister_clocks path in mmdvfs_probe() calls
mmdvfs_unregister_clocks() followed by data->ops->deinit_hw(), the devres-
managed clock provider remains active until mmdvfs_remove() or
mmdvfs_probe() returns.

> diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-core.c b/drivers/soc/medi=
atek/mmdvfs/mmdvfs-core.c
> new file mode 100644
> index 0000000000000..c32fa11557aff
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-core.c
[ ... ]
> +/* Platform data definitions for device match table */
> +#if IS_ENABLED(CONFIG_MTK_MMDVFS_MT8196)
> +static const struct mmdvfs_platform_data mmdvfs_mt8196_pdata =3D {
> +	.soc_data =3D &mmdvfs_mt8196_soc_data,
> +	.ops =3D &mmdvfs_mt8196_ops,
> +};
> +#endif

[Severity: High]
Does enabling CONFIG_MTK_MMDVFS_MT8196 at this commit fail to link due to
undefined references to mmdvfs_mt8196_soc_data and mmdvfs_mt8196_ops?

drivers/soc/mediatek/Kconfig already exposes CONFIG_MTK_MMDVFS_MT8196 here,
but drivers/soc/mediatek/mmdvfs/Makefile only links mmdvfs-core.o and
mmdvfs-clk.o until commit "soc: mediatek: mmdvfs: add MT8196 support" adds
mmdvfs-mt8196.c, breaking bisectability when CONFIG_MTK_MMDVFS_MT8196 is
selected.

[ ... ]

> +struct mmdvfs_device *mmdvfs_find_device_by_version(enum mmdvfs_version_=
type version)
> +{
> +	struct mmdvfs_device_node *node;
> +	struct mmdvfs_device *found =3D NULL;
> +
> +	mutex_lock(&mmdvfs_device_list_lock);
> +	list_for_each_entry(node, &mmdvfs_device_list, list) {
> +		if (node->mmdvfs && node->mmdvfs->data &&
> +		    node->mmdvfs->data->version =3D=3D version) {
> +			found =3D node->mmdvfs;
> +			break;
> +		}
> +	}
> +	mutex_unlock(&mmdvfs_device_list_lock);
> +
> +	return found;
> +}
> +EXPORT_SYMBOL_GPL(mmdvfs_find_device_by_version);
[ ... ]
> +int mtk_mmdvfs_camera_notify(bool enable)
> +{
> +	struct mmdvfs_device *mmdvfs;
> +
> +	mmdvfs =3D mmdvfs_find_device_any();
> +	if (!mmdvfs || !mmdvfs->data || !mmdvfs->data->ops ||
> +	    !mmdvfs->data->ops->camera_notify)
> +		return -EOPNOTSUPP;
> +
> +	return mmdvfs->data->ops->camera_notify(mmdvfs, enable);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmdvfs_camera_notify);

[Severity: Medium]
Can concurrent callers of mtk_mmdvfs_camera_notify() and the other exported
helpers race with mmdvfs_remove() and hit a use-after-free?

CPU0                                    CPU1
mtk_mmdvfs_camera_notify()
  mmdvfs =3D mmdvfs_find_device_any()
    lock(&mmdvfs_device_list_lock)
    found =3D node->mmdvfs
    unlock(&mmdvfs_device_list_lock)
                                        mmdvfs_remove()
                                          data->ops->deinit_hw(mmdvfs)
                                          mmdvfs_unregister_device(mmdvfs)
                                        devres_release_all()
                                          /* frees mmdvfs and mmdvfs->data =
*/
  mmdvfs->data->ops->camera_notify(...) <-- use-after-free

mmdvfs_find_device_by_version() drops mmdvfs_device_list_lock and returns a
raw pointer to devm-allocated memory without taking a reference or holding a
lock across the callback.  In addition, mmdvfs_remove() runs
data->ops->deinit_hw(mmdvfs) before mmdvfs_unregister_device(mmdvfs) unlinks
the device from mmdvfs_device_list, and mmdvfs_probe() has no teardown
callback for state allocated by data->ops->probe() if
mmdvfs_validate_topology() or data->ops->init_hw() fails.

> diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h b/drivers/soc/=
mediatek/mmdvfs/mmdvfs-internal.h
> new file mode 100644
> index 0000000000000..df16e38d78c89
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h
> @@ -0,0 +1,305 @@
[ ... ]
> +/* MMDVFS voting mechanism types */
> +enum mmdvfs_version_type {
> +	MMDVFS_VERSION_NONE =3D 0,		/* No hardware voter */
> +	MMDVFS_VERSION_HWCCF_DVFS_VOTER =3D 1,	/* HWCCF DVFS voter */
> +};
[ ... ]
> +/* Platform-specific operations */
> +u32 mmdvfs_get_version(void);
> +int mtk_mmdvfs_enable_ccu(const bool enable, const u8 idx);
> +int mtk_mmdvfs_camera_notify(bool enable);
> +int mtk_mmdvfs_camsv_dc_enable(const u8 idx, const bool enable);
> +int mtk_mmdvfs_genpd_notify(u8 idx, bool enable);
> +int mtk_mmdvfs_set_avs(u8 idx, u32 aging, u32 fresh);
> +int mmdvfs_set_lp_mode(bool enable);

[Severity: Low]
Should mmdvfs-internal.h include <soc/mediatek/mmdvfs.h> instead of
redefining enum mmdvfs_version_type and redeclaring these public API
functions?  Any file that includes both headers will fail to compile due to
the duplicate enum definition.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125060037.6496=
59-1-echo.zhang@mediatek.com?part=3D3
