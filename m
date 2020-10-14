Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962E8C433E7
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 00:41:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A57321D7F
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 00:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602636115;
	bh=ktlbk/J47pEjprml6nkkSZD4+iNOKh1qZtKuJeWNo64=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=bZo27GcWFXyhwbW4YWAh+kvChKWBZ2hrtOVPSY6jlkH9uSSfUtbpVWBrdogVmrcJf
	 lTXxrXQK5PhU8QuH4JsqJFpjgdQLb3mSdfHicVKwOccXfg/yJM+gSc5sxZHx8fH1qH
	 FI3u4iPN0wV2XO1/TULPbdMKhwjohpC605ZzZe/Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728029AbgJNAlz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 20:41:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:54710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727837AbgJNAly (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 20:41:54 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 87C8021D40;
        Wed, 14 Oct 2020 00:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602636114;
        bh=ktlbk/J47pEjprml6nkkSZD4+iNOKh1qZtKuJeWNo64=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Bfo7RQVJRbkrjzVo4gz7VdoH8U27OWZNo1S3Rfq4VRr4jX79Gp9wtnxUTch2Esyz5
         eIzfpAN7uuKKmBSMiZgcy+6Fv9eZsSxYrhMaCE8J1zOtnoe5qyJ3BNvlOjV0bkLV7O
         2sc0AnUQ8jMkyZPPEXtxI4uZvnY43EqUe39Yp81k=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1596009618-25516-3-git-send-email-aisheng.dong@nxp.com>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com> <1596009618-25516-3-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH v7 02/11] dt-bindings: clock: imx-lpcg: add support to parse clocks from device tree
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
Date:   Tue, 13 Oct 2020 17:41:53 -0700
Message-ID: <160263611343.310579.16763738308745090179@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2020-07-29 01:00:09)
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
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
