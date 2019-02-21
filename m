Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECB2C43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 22:11:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A38262083B
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 22:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550787109;
	bh=hu2x6J3Cp768k9buOc0u9djISDGlbdR3mRtAa/mtKGI=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=2ApmCGF3wPwheggl/AqKLkud694w76gbwR6h0NEBVJu10sepSFe1jQ2uNC9nPNmQf
	 GQJVJLNbqIWIpbCZ71O6w/670p3ZFL4j/IPZma4uOHsMI+AXfAeXV1KIavTX1fL//Y
	 uDBPJpc4M4ic5FGb9ql0byxb617a96aVDrj7QRU0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbfBUWLt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 17:11:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:44370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbfBUWLt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 17:11:49 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84203207E0;
        Thu, 21 Feb 2019 22:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550787108;
        bh=hu2x6J3Cp768k9buOc0u9djISDGlbdR3mRtAa/mtKGI=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=a5xffMxpgzxY9qKU6QK0iWa4pTSdklvP10HaoDADa6IJToNO4xsdi1F6GIcB7EJQh
         B9sp/JH8GRzzJPzQgVtbuXcCDI+hGb8N/OoIG+b0Je9pumRQv77PypXDcvCnotrjGZ
         AnC645CPnXkP0Xk67EB3kaJr6RzlRizZqwnEepBM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: clk-twl6040: Fix imprecise external abort for pdmclk
Message-ID: <155078710773.77512.128781702472483784@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <20190211225907.38511-1-tony@atomide.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190211225907.38511-1-tony@atomide.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Cc:     linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
        Misael Lopez Cruz <misael.lopez@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Date:   Thu, 21 Feb 2019 14:11:47 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tony Lindgren (2019-02-11 14:59:07)
> I noticed that modprobe clk-twl6040 can fail after a cold boot with:
> abe_cm:clk:0010:0: failed to enable
> ...
> Unhandled fault: imprecise external abort (0x1406) at 0xbe896b20
>=20
> WARNING: CPU: 1 PID: 29 at drivers/clk/clk.c:828 clk_core_disable_lock+0x=
18/0x24
> ...
> (clk_core_disable_lock) from [<c0123534>] (_disable_clocks+0x18/0x90)
> (_disable_clocks) from [<c0124040>] (_idle+0x17c/0x244)
> (_idle) from [<c0125ad4>] (omap_hwmod_idle+0x24/0x44)
> (omap_hwmod_idle) from [<c053a038>] (sysc_runtime_suspend+0x48/0x108)
> (sysc_runtime_suspend) from [<c06084c4>] (__rpm_callback+0x144/0x1d8)
> (__rpm_callback) from [<c0608578>] (rpm_callback+0x20/0x80)
> (rpm_callback) from [<c0607034>] (rpm_suspend+0x120/0x694)
> (rpm_suspend) from [<c0607a78>] (__pm_runtime_idle+0x60/0x84)
> (__pm_runtime_idle) from [<c053aaf0>] (sysc_probe+0x874/0xf2c)
> (sysc_probe) from [<c05fecd4>] (platform_drv_probe+0x48/0x98)
>=20
> After searching around for a similar issue, I came across an earlier fix
> that never got merged upstream in the Android tree for glass-omap-xrr02.
> There is patch "MFD: twl6040-codec: Implement PDMCLK cold temp errata"
> by Misael Lopez Cruz <misael.lopez@ti.com>.
>=20
> Based on my observations, this fix is also needed when cold booting
> devices, and not just for deeper idle modes. Since we now have a clock
> driver for pdmclk, let's fix the issue in twl6040_pdmclk_prepare().
>=20
> Cc: Misael Lopez Cruz <misael.lopez@ti.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-next + added a stable tag

