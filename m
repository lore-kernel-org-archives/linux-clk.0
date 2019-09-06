Return-Path: <SRS0=yL/a=XB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333F2C43331
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:00:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 081CD20578
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567789240;
	bh=edmt0mWAVzMrncvBSTQ4sSM8tDFkQPsUZ6bHredUyAE=;
	h=In-Reply-To:References:To:From:Cc:Subject:Date:List-ID:From;
	b=14oJz7LylVkrb9JnsvJ6a/IPF77iVVZ0oO3OkTGvfEusebzWM21Z99tbxS9/eQZXK
	 8LX8ZdYsN/dUsn7rIh0Q/rCgrM0ff6Iup5SpPiPDjMXBfx+qqMV6l/d4yyua1C2thv
	 F9EG1exwkon6Kw3NIYH/iyqbF4r0gDAyjzirlS/s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388314AbfIFRAj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Sep 2019 13:00:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:57638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727816AbfIFRAj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Sep 2019 13:00:39 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7271720693;
        Fri,  6 Sep 2019 17:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567789238;
        bh=edmt0mWAVzMrncvBSTQ4sSM8tDFkQPsUZ6bHredUyAE=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=VOiJ/CZaGT0AlatZpumHMBvaMiBcMzchXIfHDZjECNtalH9Q/tYgJwBBpJMH9j7Vu
         vyt4vnSi8a9QhBbzQGl+cTeDrbvt1Wnh+XIoqmWAtE82Cy+YcE+/aJOxSLhg+vQUgQ
         0yKMiTrlSt/+Fjs1U16kGKAL/gFjslxK7mLMMgkc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1566299605-15641-3-git-send-email-aisheng.dong@nxp.com>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com> <1566299605-15641-3-git-send-email-aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH V4 02/11] dt-bindings: clock: imx-lpcg: add support to parse clocks from device tree
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 10:00:37 -0700
Message-Id: <20190906170038.7271720693@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2019-08-20 04:13:16)
> MX8QM and MX8QXP LPCG Clocks are mostly the same except they may reside
> in different subsystems across CPUs and also vary a bit on the availabili=
ty.
>=20
> Same as SCU clock, we want to move the clock definition into device tree
> which can fully decouple the dependency of Clock ID definition from device
> tree and make us be able to write a fully generic lpcg clock driver.
>=20
> And we can also use the existence of clock nodes in device tree to address
> the device and clock availability differences across different SoCs.
>=20
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

> ChangeLog:
> v3->v4:
>  * change bit-offset property to clock-indices
>  * use constant macro to define clock indinces
>  * drop hw-autogate property which is still not used by drivers
> v2->v3:
>  * no changes
> v1->v2:
>  * Update example
>  * Add power domain property
> ---
>  .../devicetree/bindings/clock/imx8qxp-lpcg.txt     | 36 ++++++++++++++++=
++----
>  include/dt-bindings/clock/imx8-lpcg.h              | 14 +++++++++
>  2 files changed, 44 insertions(+), 6 deletions(-)
>  create mode 100644 include/dt-bindings/clock/imx8-lpcg.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt b/D=
ocumentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> index 965cfa4..cad8fc4 100644
> --- a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> +++ b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> @@ -11,6 +11,21 @@ enabled by these control bits, it might still not be r=
unning based
>  on the base resource.
> =20
>  Required properties:
> +- compatible:          Should be one of:
> +                         "fsl,imx8qxp-lpcg"
> +                         "fsl,imx8qm-lpcg" followed by "fsl,imx8qxp-lpcg=
".
> +- reg:                 Address and length of the register set.
> +- #clock-cells:                Should be 1. One LPCG supports multiple c=
locks.
> +- clocks:              Input parent clocks phandle array for each clock.
> +- clock-indices:       An integer array indicating the bit offset for ea=
ch clock.
> +                       Refer to <include/dt-bindings/clock/imx8-lpcg.h> =
for the
> +                       supported LPCG clock indices.

This is an interesting solution.

> +- clock-output-names:  Shall be the corresponding names of the outputs.
> +                       NOTE this property must be specified in the same =
order
> +                       as the clock-indices property.
> +- power-domains:       Should contain the power domain used by this cloc=
k.
> +
> +Legacy binding (DEPRECATED):
>  - compatible:  Should be one of:
>                   "fsl,imx8qxp-lpcg-adma",
>                   "fsl,imx8qxp-lpcg-conn",
