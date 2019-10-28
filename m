Return-Path: <SRS0=ANa5=YV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9735CCA9EA0
	for <linux-clk@archiver.kernel.org>; Mon, 28 Oct 2019 08:36:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D77D20717
	for <linux-clk@archiver.kernel.org>; Mon, 28 Oct 2019 08:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572251766;
	bh=YSz7TfslhiFwmoaN1bPaiGLyGWgIdmnawIFyeNvBbtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OsSYJubwmNvN2eFBxbmqf0OBip0OY9fLJgcuQqz876eK2zsFkwx5MPI7UAZVSF8PS
	 kNbtWXJze76whK+xVfzjIz7yBUbhe601OcH9WhbilyBAtpOQOE750Zu+Eawc/nDuaw
	 HWpT5bwWobxkqacSR+Lqwq2EHDGGjbu3ifN92K/U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732003AbfJ1IgF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Oct 2019 04:36:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:53824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732023AbfJ1IgF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 28 Oct 2019 04:36:05 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 913C220650;
        Mon, 28 Oct 2019 08:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572251765;
        bh=YSz7TfslhiFwmoaN1bPaiGLyGWgIdmnawIFyeNvBbtU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VfjtwdY4B4l+k3YieRfLebQ0T/q+/R30MRXAiyVe1v/8sglkt3uLbuGJ3YPOeyopS
         xdSTCV2Q2HDdWnpA8UBTp7WNAoTfQZ50T7ThHZFTsb3z2rIUwmPT3lPNivgD58PKlk
         yhm87rSAYBKqgAVQ+DE/PUgkfNEhwzzwRp3Y5gQA=
Date:   Mon, 28 Oct 2019 16:35:40 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: imx8m: Use SYS_PLL1_800M as intermediate parent of
 CLK_ARM
Message-ID: <20191028083539.GT16985@dragon>
References: <f5d2b9c53f1ed5ccb1dd3c6624f56759d92e1689.1571771777.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5d2b9c53f1ed5ccb1dd3c6624f56759d92e1689.1571771777.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Oct 22, 2019 at 10:21:28PM +0300, Leonard Crestez wrote:
> During cpu frequency switching the main "CLK_ARM" is reparented to an
> intermediate "step" clock. On imx8mm and imx8mn the 24M oscillator is
> used for this purpose but it is extremely slow, increasing wakeup
> latencies to the point that i2c transactions can timeout and system
> becomes unresponsive.
> 
> Fix by switching the "step" clk to SYS_PLL1_800M, matching the behavior
> of imx8m cpufreq drivers in imx vendor tree.
> 
> This bug was not immediately apparent because upstream arm64 defconfig
> uses the "performance" governor by default so no cpufreq transitions
> happen.
> 
> Fixes: ba5625c3e272 ("clk: imx: Add clock driver support for imx8mm")
> Fixes: 96d6392b54db ("clk: imx: Add support for i.MX8MN clock driver")
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Acked-by: Shawn Guo <shawnguo@kernel.org>

Stephen,

I assume that you will pick up this one as a fix.

Shawn
