Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4E9427F93;
	Thu, 27 Aug 2026 18:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787855004; cv=none; b=KHF4A82Z3DhnJipy3I/qs4N8kWA+6f9wMEB5DQ+F0JCWJvKsMnE8sRLdAaLtnss8fPkBit5yLXhCJj9lxUOC1RaaOmEQjTie8lQSYUjzVtRwzx93Hmj/KnHBxOoUhl1qcV7UGw7tV424YU3t4SBo18DJKCv1NG7uG1VhzwlPHrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787855004; c=relaxed/simple;
	bh=C4KUYnC+6cLY5EE5qau7bMQnH2q3SW44K5cRKaDJEd4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gdd+RB/xNEglNR+JtqkFEEUlDM4w8Z5HWQZrBlYRKrqOXOsao4dC1LSNGTAtWTzTif9fMchjTkhDLelXP849RKxVEQP/X3VfEQUcw1vTjXxRkvq9KslssY4LuJOwBJ4ngl1FP2Aozv7wUCd6uZze2dGczyGdhCEoNO5kaOS2VS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qlror62l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qlror62l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1B01F000E9;
	Thu, 27 Aug 2026 18:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787855002;
	bh=jlxQuoObuutJ0TlgvA6sol+E59zkVWzvDAmLokqmA+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qlror62lfuZjYSR7dQ0VS0X6JGerXTnyq1iPV7SfUq/u7M8RnGPAEGqcRYLZ/SLWu
	 e6Lqkz/D4ObwJToO7kc+hGRNrmroTvt4pCyEDyzNK5dE6vtep8dvjCuufyN6utKmc8
	 5dF+Pg9V6slPZvLtk+QVcoXxcmJ/SZE19reblWP72EHfd55+czoPz90ReY5DYVKXwT
	 TirNXtTRm/MtRV64X/fep5U5CDuhEIsl4wB3Cg8gDz7652Qrhhn828gSbkydHeVTiE
	 3tv8npJa2FHJpgfe77CCY2mWWtGoh4yWSI0NqzHMUZZFPrY79EBqp+vlev1g5AYpTV
	 sxAsL/7VCRyUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hardeep Sharma" <hardeep.sharma@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260827-kuno-soc-support-v5-7-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-7-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 18:23:22 +0000
Message-Id: <20260827182322.7A1B01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dangling pointers in statically allocated `qcom_icc_node` structs =
cause Use-After-Free on driver rebind or deferred probe.
--

commit 247254381db99e8828d00f4e780472baac9636d1
Author: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

interconnect: qcom: Add Kuno interconnect provider driver
   =20
This commit adds a new interconnect provider driver for the Qualcomm Kuno
SoC. It defines the interconnect nodes and BCM structures, and registers
the interconnect provider using the common RPMh probe and remove functions.

> diff --git a/drivers/interconnect/qcom/kuno.c b/drivers/interconnect/qcom=
/kuno.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/interconnect/qcom/kuno.c
> @@ -0,0 +1,988 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/interconnect.h>
> +#include <linux/interconnect-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/interconnect/qcom,kuno.h>
> +
> +#include "bcm-voter.h"
> +#include "icc-rpmh.h"
> +
> +static struct qcom_icc_node qup0_core_slave =3D {
> +	.name =3D "qup0_core_slave",
> +	.channels =3D 1,
> +	.buswidth =3D 4,
> +	.num_links =3D 0,
> +};

[Severity: High]
This isn't a bug introduced by this patch, but does the use of statically
allocated nodes like qup0_core_slave in kuno.c create a risk of a dangling
pointer?

When the driver binds, qcom_icc_rpmh_probe() allocates dynamic icc_node
structures and caches them in the node field of these static definitions.

On driver unbind or deferred probe error paths, qcom_icc_rpmh_remove()
frees those structures via kfree(). However, the static pointers in the
qcom_icc_node arrays are never cleared to NULL.

If a privileged user unbinds and rebinds the driver via sysfs, or if a
deferred probe is triggered on startup, could the new probe call bypass the
if (!qn->node) check, reuse the freed pointer in icc_node_set_name() or
icc_node_add(), and result in memory corruption or a use-after-free?

[ ... ]

> +static struct platform_driver qnoc_driver =3D {
> +	.probe =3D qcom_icc_rpmh_probe,
> +	.remove =3D qcom_icc_rpmh_remove,
> +	.driver =3D {
> +		.name =3D "qnoc-kuno",
> +		.of_match_table =3D qnoc_of_match,
> +		.sync_state =3D icc_sync_state,
> +	},
> +};

[Severity: High]
This isn't a bug introduced by this patch, but since qnoc_driver registers
with qcom_icc_rpmh_probe and qcom_icc_rpmh_remove, does it inherit the
unbind and rebind issue described above?

Because qcom_icc_rpmh_remove() does not clear the cached pointers from the
static node arrays provided by this driver, could a deferred probe or sysfs
rebind result in dereferencing freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-kuno-soc-s=
upport-v5-0-6d47636a8f09@oss.qualcomm.com?part=3D7
