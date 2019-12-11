Return-Path: <SRS0=MyMj=2B=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE9DC43603
	for <linux-clk@archiver.kernel.org>; Wed, 11 Dec 2019 08:05:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 387F221D7D
	for <linux-clk@archiver.kernel.org>; Wed, 11 Dec 2019 08:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576051539;
	bh=lOgUt5y6/9L7MQb4eG6VNacAiDWxoo4lEdTGn+202fM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=tqnfWyGWjce4E7HPdpcO++QQJHDDAjL7YmMlODewvrY6MliHkV2nN32ofnipAoDaF
	 eOghJFkpWPZ1PJ2sViZxe+y4WgwUajQpKFxERULhtnD2mPzDqzJ21VXLOF9umC+niB
	 0Zt/yqSbI5rVfg7JMunkZOOpwomDJBzmbbQwQaAs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbfLKIFj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Dec 2019 03:05:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:57970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727829AbfLKIFi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 11 Dec 2019 03:05:38 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 772762173E;
        Wed, 11 Dec 2019 08:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576051538;
        bh=lOgUt5y6/9L7MQb4eG6VNacAiDWxoo4lEdTGn+202fM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kKGpcDBhAqIccgus4FFXLt4MvUzoZW0PD5sFYKdYrreTHPlai14UxDSWNgPwR2nBi
         HlRy9l//1vZqEVYHnr+cfSyNqxplAvQVQn1SOKzbQ0IwXB2ZGXGQnmtBz8DDzACugm
         kcbrMhBb068Bmp1y9k5g7L0rni8KhwxFNUB3e/PU=
Date:   Wed, 11 Dec 2019 16:05:26 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        mturquette@baylibre.com, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de
Subject: Re: [PATCH RESEND V5 00/11] clk: imx8: add new clock binding for
 better pm support
Message-ID: <20191211080525.GS15858@dragon>
References: <1573993519-14308-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573993519-14308-1-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Nov 17, 2019 at 08:25:08PM +0800, Dong Aisheng wrote:
> This is a follow up of this patch series.
> https://patchwork.kernel.org/cover/10924029/
> [V2,0/2] clk: imx: scu: add parsing clocks from device tree support
> 
> This patch series is a preparation for the MX8 Architecture improvement.
> As for IMX SCU based platforms like MX8QM and MX8QXP, they are comprised
> of a couple of SS(Subsystems) while most of them within the same SS
> can be shared. e.g. Clocks, Devices and etc.
> 
> However, current clock binding is using SW IDs for device tree to use
> which can cause troubles in writing the common <soc>-ss-xx.dtsi file for
> different SoCs.
> 
> This patch series aims to introduce a new binding which is more close to
> hardware and platform independent and can makes us write a more general
> drivers for different SCU based SoCs.
> 
> Another important thing is that on MX8, each Clock resource is associated
> with a power domain. So we have to attach that clock device to the power
> domain in order to make it work properly. Further more, the clock state
> will be lost when its power domain is completely off during suspend/resume,
> so we also introduce the clock state save&restore mechanism.
> 
> ChangeLog:
> v4->v5:
>  * Address all comments from Stephen

Hi Stephen,

Are you fine with this version?

Shawn
