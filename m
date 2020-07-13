Return-Path: <SRS0=Hq2+=AY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D398C433E2
	for <linux-clk@archiver.kernel.org>; Mon, 13 Jul 2020 09:25:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F2FE2076D
	for <linux-clk@archiver.kernel.org>; Mon, 13 Jul 2020 09:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594632311;
	bh=zL6gDU8NNAXnZx3N2O7UvFDUEoZA1JnSABXb3oHA0cY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=SdaSB+pogD54vD0BuGHc3GDmECJegw8The5vMso23Zp5ulgOYR/avtaNpAKu5lIOS
	 0QqcNCOa92DnMnzaS5MbvuG26FIatkH7bSiLA2YkywG6xV/LfiF2pf7OEdWJWQIGaj
	 1acVC/gUTxxFnIXj9xvm6IfZcxkoReGhJTwQxE+k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729357AbgGMJZK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Jul 2020 05:25:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:56278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726380AbgGMJZJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 13 Jul 2020 05:25:09 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 04B6B2073A;
        Mon, 13 Jul 2020 09:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594632309;
        bh=zL6gDU8NNAXnZx3N2O7UvFDUEoZA1JnSABXb3oHA0cY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jkduy5BbNyA/4RmadeAZxZLV/yPr3+ex/g6rt+FokRP+1BQ+IcKzgJXzzlqWIA4wp
         QFoLrEoRpSyd4DdqByNk+HnFbuujxr3dJgICzdQQKE5NUZH9lDcNWErc5pVU9INjWr
         ndMtskebMtr+dveQd8Wh//aQyCDPBkwifU7aWekU=
Date:   Mon, 13 Jul 2020 17:25:01 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        abel.vesa@nxp.com, peng.fan@nxp.com, sfr@canb.auug.org.au,
        j.remmet@phytec.de, georg.waibel@wiedemann-group.de,
        Georg.Waibel@wiedemann-group.com,
        laurent.pinchart@ideasonboard.com, chen.fang@nxp.com,
        fugang.duan@nxp.com, daniel.baluta@nxp.com, yuehaibing@huawei.com,
        andrew.smirnov@gmail.com, horia.geanta@nxp.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Linux-imx@nxp.com
Subject: Re: [PATCH V6 0/6] Support building i.MX ARMv8 platforms clock
 driver as module
Message-ID: <20200713092500.GM15718@dragon>
References: <1594098579-25050-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594098579-25050-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jul 07, 2020 at 01:09:33PM +0800, Anson Huang wrote:
> Nowdays, there are more and more requirements of building SoC specific drivers
> as modules, such as Android GKI (generic kernel image), this patch set supports
> building i.MX ARMv8 SoCs clock drivers as modules,
> 
> The CLK_IMXxxx is introduced for i.MX ARMv7 platforms in order to make the build
> options aligned, the reason why i.MX ARMv7 platforms clock driver do NOT support
> module build and COMPILE_TEST is because, some drivers like i.MX GPT timer driver
> depends on clock driver to be ready before it, GPT driver uses TIMER_OF_DECLARE(),
> while i.MX6/7 clock drivers use CLK_OF_DECLARE(), and GPT driver is critical for
> i.MX6/7 platforms kernel boot up, so GPT driver needs to be changed to support
> loadable clock driver first, then the i.MX6/7 clock drivers can support loadable
> module, this will be done later.
> 
> Changes since V5:
> 	- make i.MX ARMv7 platforms clock driver to bool and NOT support COMPILT_TEST,
> 	  since they depends on ARCH_MXC or SOC config, which makes the COMPILT_TEST
> 	  NOT make enough sense, so just skip the COMPILT_TEST support for i.MX ARMv7
> 	  platform clock drivers, leave them same as original implementation.
> 	- add a patch to fix build warning reported by kernel robot test on i.MX6SL
> 	  clock driver.
> 
> Anson Huang (6):
>   clk: composite: Export clk_hw_register_composite()
>   clk: imx: Support building i.MX common clock driver as module
>   clk: imx: Add clock configuration for ARMv7 platforms
>   clk: imx8m: Support module build
>   clk: imx8qxp: Support building i.MX8QXP clock driver as module
>   clk: imx6sl: Fix build warning reported by kernel test robot

I'm picking up the series and throwing it into linux-next for testing.

Shawn
