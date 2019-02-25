Return-Path: <SRS0=kMKU=RA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6EAC43381
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 19:46:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E9CE720C01
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 19:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1551123977;
	bh=SA2AA7ySpjPhChgWVLUp5vYKkEeRYksJa+vUzVxiNME=;
	h=In-Reply-To:References:Cc:From:To:Subject:Date:List-ID:From;
	b=shPv9KTcYrTpvG3OKX+kZvM/cQ5MKuJVMdPOQX+/qqCdqsL2LPi3M5Vp43G/q++9n
	 Zy1sC2ktG5fKyNX9+0ZHRtk0bSwmDiE7pYPV18/VWDkH+T9WiOQPWaGqd4sDfFhfKB
	 raJLBPCehqoCEVPCX/Usi77EWFWHkmubI9nrdXeU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfBYTqQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Feb 2019 14:46:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:44412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726377AbfBYTqQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 25 Feb 2019 14:46:16 -0500
Received: from localhost (unknown [104.132.1.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F60F2084D;
        Mon, 25 Feb 2019 19:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1551123975;
        bh=SA2AA7ySpjPhChgWVLUp5vYKkEeRYksJa+vUzVxiNME=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=vqwvKaDJ0Zt/nv+Nn4xNHUUF4NpdlmpyOZdyv0zXDaVS8UO9H7SRtZgpZJSh7zaN0
         cZID4WIEfAsQZV1OM/ERrGtWDqyixgt8Q7iGUwSVRoK/nI4Euvizw4pdWLdYXyzENJ
         byzrCfKwBkuGWT4dE9KyEF3m0IT8Y844YOmiAD1c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1550771836-10014-3-git-send-email-aisheng.dong@nxp.com>
User-Agent: alot/0.8
References: <1550771836-10014-1-git-send-email-aisheng.dong@nxp.com> <1550771836-10014-3-git-send-email-aisheng.dong@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Rob Herring <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: imx-lpcg: add support to parse clocks from device tree
Message-ID: <155112397472.191923.18309287020361500256@swboyd.mtv.corp.google.com>
Date:   Mon, 25 Feb 2019 11:46:14 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2019-02-21 10:03:47)
> MX8QM and MX8QXP LPCG Clocks are mostly the same except they may reside
> in different subsystems across CPUs and also vary a bit on the availabili=
ty.
>=20
> Same as SCU clock, we want to move the clock definition into device tree
> which can fully decouple the dependency of Clock ID definition from device
> tree. And no frequent changes required in clock driver any more to handle
> the difference.
>=20
> We can use the existence of clock nodes in device tree to address the
> device and clock availability differences across different SoCs.

This sounds similar to what TI folks are doing with their new firmware.
It leads to problems where we don't know what in the clk tree needs to
be registered, debugfs is not super helpful in that case, and late init
only turns off clks that are found during probe (so nothing then?).

>=20
> diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt b/D=
ocumentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> index 965cfa4..a317844 100644
> --- a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> +++ b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> @@ -11,6 +11,20 @@ enabled by these control bits, it might still not be r=
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
> +- bit-offset:          An integer array indicating the bit offset for ea=
ch clock.
> +- hw-autogate:         Boolean array indicating whether supports HW auto=
gate for
> +                       each clock.

This looks like one clk per node style of bindings which is a direction
we don't want DT bindings to go in. It leads to a bunch of time parsing
DT to generate clks and in general doesn't represent the clock
controller hardware that is there. Basically, anything with 'bit-offset'
in the binding is not going to be acceptable.

> +- clock-output-names:  Shall be the corresponding names of the outputs.
> +                       NOTE this property must be specified in the same =
order
> +                       as the clock bit-offset and hw-autogate property.
> +
> +Legacy binding (DEPRECATED):
>  - compatible:  Should be one of:
>                   "fsl,imx8qxp-lpcg-adma",
