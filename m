Return-Path: <SRS0=lNOc=M4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22357C5ACCC
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 21:31:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A7BFD21470
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 21:31:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdLontDR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7BFD21470
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbeJQFYF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 01:24:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:51840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725960AbeJQFYF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 01:24:05 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A82F2145D;
        Tue, 16 Oct 2018 21:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539725506;
        bh=fO3zzgg1HxDKgr7SDmM5jQRDuH46rNa7bAopPSSPkFE=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=fdLontDRiZ/toMeQq+zU36JgXrxHrVpeWIaDrdZeoStAvXNeBzufhjBg86aHbOv3v
         m4VlrOQbgjb2W7aF+9++op9rtB/5SlhD2R99QYe4iQ0YIiDtM6qyd7vTNXwrL0/DSM
         JQuM7C/cSch8wgBOHz+4LS1/yhxnOvMIM2YSu++M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1539504194-28289-3-git-send-email-aisheng.dong@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-3-git-send-email-aisheng.dong@nxp.com>
Message-ID: <153972550584.5275.12112973418888551824@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH V4 02/11] clk: imx: scu: add scu clock common part
Date:   Tue, 16 Oct 2018 14:31:45 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-10-14 01:07:45)
> Add scu clock common part which will be used by client clock drivers.
> =

> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> ChangeLog:
> v3->v4:
>  * scu headfile path change
> v2->v3:
>  * no changes
> v1->v2:
>  * update function call name
> ---
>  drivers/clk/imx/Kconfig       |  2 ++
>  drivers/clk/imx/Makefile      |  2 ++
>  drivers/clk/imx/scu/Kconfig   |  5 +++++
>  drivers/clk/imx/scu/Makefile  |  4 ++++
>  drivers/clk/imx/scu/clk-scu.c | 17 +++++++++++++++++
>  drivers/clk/imx/scu/clk-scu.h | 18 ++++++++++++++++++

Why is scu nested one level deeper in the imx directory? Can't we just
keep them all within imx toplevel directory?

>  6 files changed, 48 insertions(+)
>  create mode 100644 drivers/clk/imx/scu/Kconfig
>  create mode 100644 drivers/clk/imx/scu/Makefile
>  create mode 100644 drivers/clk/imx/scu/clk-scu.c
>  create mode 100644 drivers/clk/imx/scu/clk-scu.h
>=20
