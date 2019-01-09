Return-Path: <SRS0=vytI=PR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22B5C43387
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 20:36:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 839BD206BB
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 20:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547066197;
	bh=1fT7Bg+75j43RQvUjXngwZ0yU66k6sghg4UC2YIEoHs=;
	h=Subject:Cc:To:In-Reply-To:From:References:Date:List-ID:From;
	b=yKModyLKt3XAhsPY/7YxEzp9aenaR+iieeckX3yy4Sjb49CvmIiX7b8jblM6zqIRB
	 ZnI8C+FInDWTFwxcLyV556xC/moxoyeTfLIOHC+eXHVtrzOndVeQHRwU0hybFzbl4w
	 H2E0/zzPFB+QJub+ExadfDASTLrNh8AsuccQwpSo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbfAIUgh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jan 2019 15:36:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:52408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726181AbfAIUgh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Jan 2019 15:36:37 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 13698206B6;
        Wed,  9 Jan 2019 20:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547066196;
        bh=1fT7Bg+75j43RQvUjXngwZ0yU66k6sghg4UC2YIEoHs=;
        h=Subject:Cc:To:In-Reply-To:From:References:Date:From;
        b=K0gPPutMIkOYviYCDPIMy3bDaScH5aOCtb8k98vDRY2ooVM2EGXYMIJaQQjdwPFbj
         y13bYVBeiNm6AS+o3akeguyf2PhdksyZZjgDlIlh3GosqDdxgFasNfSOvP4r3pKZgy
         paWQPqssdIPS3P9olb+38xKE0fy4vbB04TugX4TA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] dt-bindings: imx: Add clock binding doc for imx8mm
Cc:     Fabio Estevam <fabio.estevam@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
To:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>
In-Reply-To: <1546938317-23203-2-git-send-email-ping.bai@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
References: <1546938317-23203-1-git-send-email-ping.bai@nxp.com> <1546938317-23203-2-git-send-email-ping.bai@nxp.com>
Message-ID: <154706619539.15366.15074052691710369448@swboyd.mtv.corp.google.com>
Date:   Wed, 09 Jan 2019 12:36:35 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jacky Bai (2019-01-08 01:00:58)
> Add the clock binding doc for i.MX8MM.
>=20
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> ---
>  .../devicetree/bindings/clock/imx8mm-clock.txt     |  19 ++
>  include/dt-bindings/clock/imx8mm-clock.h           | 244 +++++++++++++++=
++++++
>  2 files changed, 263 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx8mm-clock.=
txt
>  create mode 100644 include/dt-bindings/clock/imx8mm-clock.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/imx8mm-clock.txt b/D=
ocumentation/devicetree/bindings/clock/imx8mm-clock.txt
> new file mode 100644
> index 0000000..034b6d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imx8mm-clock.txt
> @@ -0,0 +1,19 @@
> +* Clock bindings for NXP i.MX8M Mini
> +
> +Required properties:
> +- compatible: Should be "fsl,imx8mm-ccm"
> +- reg: Address and length of the register set
> +- #clock-cells: Should be <1>
> +- clocks: list of clock specifiers, must contain an entry for each requi=
red
> +          entry in clock-names
> +- clock-names: should include the following entries:
> +    - "osc_32k"
> +    - "osc_24m"
> +    - "clk_ext1"
> +    - "clk_ext2"
> +    - "clk_ext3"
> +    - "clk_ext4"
> +
> +The clock consumer should specify the desired clock by having the clock
> +ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8mm-cl=
ock.h
> +for the full list of i.MX8M Mini clock IDs.

Any example of this node? Not the clock consumer.

