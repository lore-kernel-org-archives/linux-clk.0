Return-Path: <SRS0=6R0q=TX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2534C282DD
	for <linux-clk@archiver.kernel.org>; Thu, 23 May 2019 13:13:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 995ED2133D
	for <linux-clk@archiver.kernel.org>; Thu, 23 May 2019 13:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558617205;
	bh=i7lYr45x2CNGJaVE1I+vswY/B6Ep0jfoFOLag/jMchc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xM53UJybxQg3r4CHIf2ukMZuaVbuNdSmSOgi7faRTM8Sx1qo52QjkhZUBZouRwb+W
	 Ei5ecsq1212Ap3lXL3PTXGuf1jg8U2cVmMWyiA9jx7UPxNAJv5o93dOOa9mZS93W5L
	 LJsUTudtvIe1o6g3cD1LJ2kAe8jnQTqIm3LVnKGg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730369AbfEWNNZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 May 2019 09:13:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:38400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbfEWNNZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 23 May 2019 09:13:25 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7907A20851;
        Thu, 23 May 2019 13:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558617204;
        bh=i7lYr45x2CNGJaVE1I+vswY/B6Ep0jfoFOLag/jMchc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sEUCzJUidA3eyt8eg3BWuPceRxfrp0mSFsGy5xctpfatiZ6q8QaoT4l6IBsNmcj0v
         +NZoqhxb1QNjkuPRez2oTcnledgt9qFut3OzqY7PGTbo/i0w6ksYGTj54GXV/qeYB5
         vV9GCxeGqPvKEb1knG0MxxtJrtHDNvtp2gRZc+Zw=
Date:   Thu, 23 May 2019 21:12:20 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/2] clk: imx8m: Add GIC clock
Message-ID: <20190523131219.GX9261@dragon>
References: <cover.1558518323.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1558518323.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, May 22, 2019 at 09:48:28AM +0000, Leonard Crestez wrote:
> Add gic clk and mark it as critical so that parents are not turned off
> by accident.
> 
> Changes since v1:
>  * Add imx8mq
>  * Split dt-bindings to separate patch
>  * Rebase on shawnguo/clk/imx
> Link to v1: https://patchwork.kernel.org/patch/10940303/
> 
> Leonard Crestez (2):
>   dt-bindings: clock: imx8m: Add GIC clock
>   clk: imx8m: Add GIC clock

Applied both, thanks.
