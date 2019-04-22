Return-Path: <SRS0=Z5yo=SY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E88C10F14
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 02:03:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8DE120870
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 02:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555898612;
	bh=2a9Z8/DaSjwPM6O9TGd9wlTjxaI9FoyLwycunWdEAE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=BC4iRtaee14BsSRs7Bw7RvZ8QjnHcMpI/YbZaFkdPZSEg3wRSuj7wJfUfdX3kpXCm
	 Gz58UgY1byQ/xRftdEaKH70SM5OXuUqSVOnl1J+jD2hbvGqrPXplhz9PiUZ1z0neXt
	 wPJUtAiHgvtMg6UWVg9kfTOIFpXudslt500nSgzI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbfDVCDc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 21 Apr 2019 22:03:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:36462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725928AbfDVCDb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 21 Apr 2019 22:03:31 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F10172075A;
        Mon, 22 Apr 2019 02:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555898611;
        bh=2a9Z8/DaSjwPM6O9TGd9wlTjxaI9FoyLwycunWdEAE8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eOh/E+OfntEBVcHL7tTXMKJplppnmB2hJL1A+jyO3uAhU2UuVESB5vUk62Jxfycuu
         sk4adymrk29JnG9tg6PF7BZueIesl7R7VdjRy5N2YnVsK+ElPBl56+SvCvp2m7MIFM
         d6Vm9WxDW98dL85ZOJ54TbWxnsY+0sJM1OoK9BBI=
Date:   Mon, 22 Apr 2019 10:03:15 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Anson Huang <anson.huang@nxp.com>
Subject: Re: [PATCH 1/1] Revert "clk: imx: use
 devm_platform_ioremap_resource() to simplify code"
Message-ID: <20190422020314.GR19962@dragon>
References: <1555670144-24220-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1555670144-24220-1-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Apr 19, 2019 at 10:42:51AM +0000, Aisheng Dong wrote:
> This reverts commit 612d5b65894b5b1607a004bd9bc60d5963b58ef6.
> 
> Originally we use devm_ioremap() specifically because we want to bypass
> the devm_request_mem_region due to LPCG address space are shared with
> some other modules within the same SS (subsystem).
> 
> The patch in question occasionally added the request_me_region back
> by calling devm_platform_ioremap_resource which results in all the devices
> with overlappded IO space failed to be probed as follows:
> 
> [    1.062996] fsl-lpuart 5a060000.serial: can't request region for resource [mem 0x5a060000-0x5a060fff]
> [    1.071923] fsl-lpuart: probe of 5a060000.serial failed with error -16
> 
> Cc: Anson Huang <Anson.Huang@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> Shawn,
> 
> This is a new issue and only exist in imx/for-next branch.
> You can decide whether to remove it or take the revert patch.

Dropped the offending patch.  Thanks for finding it.

Shawn
