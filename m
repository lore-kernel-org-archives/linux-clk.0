Return-Path: <SRS0=7bnF=UX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E93AC43613
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jun 2019 02:22:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AF8220673
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jun 2019 02:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561342942;
	bh=pKDGJCOm3sPFWQrKUlY7wE/3DQYSqRgICebooU0YJ7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=JMvd9CCZx4vj3GyfpSlJ8UiW/UwN6pBNuJuTV6RrkRybgAaoKZYdMMnxm7FDrQiGv
	 V/8kL8LWGpSNuDc7iFs+PXl4gIp6qkrZhHu7AH+cjf6g0IwZYkgfy74MXpm1yv/TM2
	 kc0Ny1oZOuZvsxiIsenSyCjupW9b9kiOs2naq2RI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfFXCWS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 Jun 2019 22:22:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:48360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726370AbfFXCWS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 23 Jun 2019 22:22:18 -0400
Received: from dragon (li1322-146.members.linode.com [45.79.223.146])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3446B20674;
        Mon, 24 Jun 2019 02:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561342937;
        bh=pKDGJCOm3sPFWQrKUlY7wE/3DQYSqRgICebooU0YJ7c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XjM5N81g/7ve7z57/8jaDqCnZ3Hty3NR8A7l6bunQ9KdlanZ6HOZsDD/ClYP9MPc4
         srCthmgHw/mqYOGJTIEVI5zmm42hKYGJ1cGcRdlP/nlECOqXJjnMbtJMpTF+gJAMXq
         RmLZZkOJC53WswVM7rWJECum2pznydE/45EBiODg=
Date:   Mon, 24 Jun 2019 10:22:01 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson.Huang@nxp.com
Cc:     catalin.marinas@arm.com, will@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, mturquette@baylibre.com,
        sboyd@kernel.org, leonard.crestez@nxp.com, aisheng.dong@nxp.com,
        ping.bai@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com,
        abel.vesa@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH 1/4] arm64: Enable TIMER_IMX_SYS_CTR for ARCH_MXC
 platforms
Message-ID: <20190624022200.GN3800@dragon>
References: <20190621070720.12395-1-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621070720.12395-1-Anson.Huang@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jun 21, 2019 at 03:07:17PM +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> ARCH_MXC platforms needs system counter as broadcast timer
> to support cpuidle, enable it by default.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 4778c77..f5e623f 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -173,6 +173,7 @@ config ARCH_MXC
>  	select PM
>  	select PM_GENERIC_DOMAINS
>  	select SOC_BUS
> +	select TIMER_IMX_SYS_CTR

Where is that driver?

Shawn

>  	help
>  	  This enables support for the ARMv8 based SoCs in the
>  	  NXP i.MX family.
> -- 
> 2.7.4
> 
