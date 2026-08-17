Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67142F8E8B;
	Mon, 17 Aug 2026 11:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964923; cv=none; b=hnWY/J6dWUo4V9CIU4ekCxBEY4TK8dmVrC8yciFg5OJEFst+5dp4mBo03JYmXDOzmXwrKaXpU+n8OBi+NUqudmHwyBX8/Aror/n6JEhxtaV0D2o1zuZizgnnoNl9DibGM1FH7YFHorwxV0IuB0ED6h9+nLKmDCWcNstXXgu48aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964923; c=relaxed/simple;
	bh=vwCGTN+H+HxYlDSe2lcUM5EUUdvAdFDWJvUJG6XVhtw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gC05TARK4YV9q0NPrPbAqQFX6ZyEPU+noLqo19JVBWSPk1NVPeaDsSB5br3GHq/mpUM1w3kVPPNGrDQMBxcyMo7YfXntIj6F/h7i9yyu4z4zMc9eKWPgUIeyGHN4pBE+wWP9qECZPojllonWHB7eMosTdf8TNBPT1Mlq6wtDq2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MTPpgCcT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MTPpgCcT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3351F000E9;
	Mon, 17 Aug 2026 11:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786964922;
	bh=0y26Wpre5yaAEuVApWp4Bu7RnkBwqWCmzR80TLAJgcc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MTPpgCcTspfTXpe/FG+9OsO4gazM7dbf7BMsS811cHIDAEOstvTyT1sPxjVmWPoVk
	 JoSjGVy4iGRiWvVCgYjkRIAv4g0wiG9M4Tvqhoxm89Sye1eXRLYaUn8n7cAh6oPQbP
	 JbAIbF8peNPUTuwv6mHyFNPttT9372m2DNmK27WrOVY2eZDRvJR0rzhABDuJujTmHb
	 VvvnU9bNiLbV594x6TrLtwL4xHB98Ks9w7+XmVrQrMYfcewGtfX4K5rPspHC+GqhXc
	 CTELHXk2JclXw89lFmYtRzlTSq9e238wnTtj4sPksX99ONwXikYxmoOZiJjlcUllOn
	 sNss5FmQNhh+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 5/6] clk: scmi: Introduce common header for SCMI
 clock interface
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260817-clk-v11-v11-5-36e9bc701b11@nxp.com>
References: <20260817-clk-v11-v11-0-36e9bc701b11@nxp.com>
 <20260817-clk-v11-v11-5-36e9bc701b11@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 11:08:41 +0000
Message-Id: <20260817110842.3D3351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] Architecture / Unsafe Global State Exposure
- [Low] Compilation Error / Missing Include
- [Low] Header Incompleteness / Missing Includes
- [Low] Linker Error / Missing Export
--

--- Patch [5]: [PATCH v11 5/6] clk: scmi: Introduce common header for SCMI =
clock interface ---
commit 543bf2610f13161874461756bcae09693a9e083b
Author: Peng Fan <peng.fan@nxp.com>

clk: scmi: Introduce common header for SCMI clock interface

Added a new header file 'clk-scmi.h' to define common structures and
interfaces for the SCMI clock driver. This header will also be used by
OEM-specific extensions to ensure consistency and reusability.

> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index 7c562559ad8bb..d88e78cc9a12e 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -13,32 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/scmi_protocol.h>

[Severity: Low]
Is an #include "clk-scmi.h" missing here?

Since struct scmi_clk and to_scmi_clk were moved to the new header, they wi=
ll
be undefined in this file without the include. For example, in
scmi_clk_recalc_rate(), struct scmi_clk *clk =3D to_scmi_clk(hw); will trig=
ger a
compilation error.

> =20
> -#define NOT_ATOMIC	false
> -#define ATOMIC		true

[ ... ]

> -
> -#define to_scmi_clk(clk) container_of(clk, struct scmi_clk, hw)
> +const struct scmi_clk_proto_ops *scmi_proto_clk_ops;

[Severity: Low]
If this global variable is meant to be shared via extern for OEM modules, d=
oes
it need EXPORT_SYMBOL_GPL(scmi_proto_clk_ops)?

Without it, external modules will likely encounter linker errors when they
attempt to use it.

[Severity: Medium]
Could this global state exposure lead to a NULL pointer dereference?

The pointer is populated asynchronously during probe in scmi_clocks_probe():

	scmi_proto_clk_ops =3D
		handle->devm_protocol_get(sdev, SCMI_PROTOCOL_CLOCK, &ph);

If an external OEM module loads and accesses scmi_proto_clk_ops before the
main driver completes probe, it could dereference a NULL pointer.

> diff --git a/drivers/clk/clk-scmi.h b/drivers/clk/clk-scmi.h
> new file mode 100644
> index 0000000000000..6ef6adc77c836
> --- /dev/null
> +++ b/drivers/clk/clk-scmi.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + *  Copyright 2025 NXP
> + */
> +
> +#ifndef __SCMI_CLK_H
> +#define __SCMI_CLK_H
> +
> +#include <linux/bits.h>
> +#include <linux/scmi_protocol.h>
> +#include <linux/types.h>
> +

[ ... ]

> +
> +struct scmi_clk {
> +	u32 id;
> +	struct device *dev;
> +	struct clk_hw hw;

[Severity: Low]
Should this header include <linux/clk-provider.h>?

It embeds struct clk_hw hw by value, which requires the full definition of =
the
struct. Any external source file including clk-scmi.h that hasn't previously
included <linux/clk-provider.h> will fail to compile.

> +	const struct scmi_clock_info *info;
> +	const struct scmi_protocol_handle *ph;
> +	struct clk_parent_data *parent_data;
> +};
> +
> +#define to_scmi_clk(clk) container_of(clk, struct scmi_clk, hw)
> +
> +extern const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
> +
> +#endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-clk-v11-v1=
1-0-36e9bc701b11@nxp.com?part=3D5
