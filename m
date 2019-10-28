Return-Path: <SRS0=ANa5=YV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79505CA9EA0
	for <linux-clk@archiver.kernel.org>; Mon, 28 Oct 2019 09:45:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4154720B7C
	for <linux-clk@archiver.kernel.org>; Mon, 28 Oct 2019 09:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572255950;
	bh=NpA9WFAdCxizCJxZSvAxIdo/i5JN5nJYOoDLmsKAt/I=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=ArQaWeLHrEWbnO6zGHkJ4LdHkVctKnTyAEYgVjd3I5RTcsWnNqXWezRCYOy/WEnmO
	 CCJcnG/jFC+e3dxV8zrl2ZdxtS6V9iXLn2fztfDplDfP+12P3qnfwZyX2YUJTirI0q
	 BQNRUkHvrN+4ueBe+30lToOPFrqZplTfkO4CV8yA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388051AbfJ1Jpu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Oct 2019 05:45:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:42910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730486AbfJ1Jpt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 28 Oct 2019 05:45:49 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4920E208C0;
        Mon, 28 Oct 2019 09:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572255949;
        bh=NpA9WFAdCxizCJxZSvAxIdo/i5JN5nJYOoDLmsKAt/I=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=DTkHA3nnwVaScqXjtw8VkSDfOUDg9xr+lg/z6q4znfjZND4muFY2zzmZ96N83EeeJ
         XiH1eVY/3HLy0okTR/I1fcJKgbFJPsAX13l4O/S00GfCf2BY1BqJ2G3tAo6iHD0azG
         nuhItMbAsrSz4rk88+dvjYNBJN2EJ1xLQWJy9r6A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f5d2b9c53f1ed5ccb1dd3c6624f56759d92e1689.1571771777.git.leonard.crestez@nxp.com>
References: <f5d2b9c53f1ed5ccb1dd3c6624f56759d92e1689.1571771777.git.leonard.crestez@nxp.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: imx8m: Use SYS_PLL1_800M as intermediate parent of CLK_ARM
To:     Leonard Crestez <leonard.crestez@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 28 Oct 2019 02:45:48 -0700
Message-Id: <20191028094549.4920E208C0@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Leonard Crestez (2019-10-22 12:21:28)
> During cpu frequency switching the main "CLK_ARM" is reparented to an
> intermediate "step" clock. On imx8mm and imx8mn the 24M oscillator is
> used for this purpose but it is extremely slow, increasing wakeup
> latencies to the point that i2c transactions can timeout and system
> becomes unresponsive.
>=20
> Fix by switching the "step" clk to SYS_PLL1_800M, matching the behavior
> of imx8m cpufreq drivers in imx vendor tree.
>=20
> This bug was not immediately apparent because upstream arm64 defconfig
> uses the "performance" governor by default so no cpufreq transitions
> happen.
>=20
> Fixes: ba5625c3e272 ("clk: imx: Add clock driver support for imx8mm")
> Fixes: 96d6392b54db ("clk: imx: Add support for i.MX8MN clock driver")
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> ---

Applied to clk-fixes

