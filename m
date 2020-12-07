Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C8EC4361B
	for <linux-clk@archiver.kernel.org>; Mon,  7 Dec 2020 21:56:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3E00235F9
	for <linux-clk@archiver.kernel.org>; Mon,  7 Dec 2020 21:56:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgLGV4D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Dec 2020 16:56:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:47332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727536AbgLGV4D (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 7 Dec 2020 16:56:03 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607378123;
        bh=3EQFkmqIZkltTxJADw/b/Hs6gH8+FUgExT759gjOTxk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=vLrUm+r5C4Fk0NfKDIVKDqMnGc6C6IFVFQB0U6RPudekGohvvnXyDnFSbIZ3ltWAa
         AAqaj9k8XLCHn4bizUA2XGo3YX907M7wPt577W+l+g4n/I1yfcDt4F0TMIEtJIrEn9
         0FiDCBX7GJqGq4fgOuQFAGe91oAGEMKdN5Kt9WJ+2r22K2vTkd0ZuZYORByFBzgfEY
         H7VDQwF0x2k527nsTvI/UfV1crzkxOVK09ZImIJJRtn+SWkCctGGDwAas0JgRMwTUZ
         AgXFszCjo8dBj9Ljgbj+rSyr0cZ0/36D218KL+n4zM/5AA/TBJ8dtUa1DBlG0nS9mL
         huj367HllK9TQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201130084624.21113-1-aisheng.dong@nxp.com>
References: <20201130084624.21113-1-aisheng.dong@nxp.com>
Subject: Re: [PATCH v2 1/1] clk: imx: scu: fix MXC_CLK_SCU module build break
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        sudipm.mukherjee@gmail.com, shawnguo@kernel.org,
        dongas86@gmail.com, Dong Aisheng <aisheng.dong@nxp.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
Date:   Mon, 07 Dec 2020 13:55:21 -0800
Message-ID: <160737812159.1580929.2422809729561564029@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2020-11-30 00:46:24)
> This issue can be reproduced by CONFIG_IMX_MBOX=3Dm and CONFIG_MXC_CLK_SC=
U=3Dm.
> It's caused by current Makefile writing can't support build clk-scu.o and
> clk-imx8qxp.o independently. (e.g. MXC_CLK_SCU =3D y while CLK_IMX8QXP =
=3D n)
>=20
> "obj-$(CONFIG_MXC_CLK_SCU) +=3D clk-imx-scu.o clk-imx-lpcg-scu.o
> clk-imx-scu-$(CONFIG_CLK_IMX8QXP) +=3D clk-scu.o clk-imx8qxp.o"
>=20
> Only enable MXC_CLK_SCU while CLK_IMX8QXP not will cause unable to locate
> the input files during linking.
>=20
> Error log:
>   LD [M]  drivers/clk/imx/clk-imx-scu.o
> arm-poky-linux-gnueabi-ld: no input files
> ../scripts/Makefile.build:434: recipe for target 'drivers/clk/imx/clk-imx=
-scu.o' failed
> make[4]: *** [drivers/clk/imx/clk-imx-scu.o] Error 1
>=20
> This patch makes MXC_CLK_SCU to be invisible to users and can only be
> selected by CLK_IMX8QXP option to ensure they're built together.
>=20
> And COMPILE_TEST on an option that isn't selectable is meaningless.
> We can remove it from MXC_CLK_SCU because CLK_IMX8QXP selecting MXC_CLK_S=
CU
> already has COMPILE_TEST.
>=20
> Fixes: e0d0d4d86c766 ("clk: imx8qxp: Support building i.MX8QXP clock driv=
er as module")
> Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Applied to clk-fixes.
