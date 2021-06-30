Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6B6C11F65
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 12:21:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3D3D613ED
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 12:21:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234553AbhF3MX4 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jun 2021 08:23:56 -0400
Received: from aposti.net ([89.234.176.197]:54664 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234510AbhF3MX4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 30 Jun 2021 08:23:56 -0400
Date:   Wed, 30 Jun 2021 13:21:15 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 4/5] MIPS: CI20: Reduce clocksource to 750 kHz.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Message-Id: <FZKIVQ.1Y3JQ8K8BRMB3@crapouillou.net>
In-Reply-To: <1624688321-69131-5-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624688321-69131-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1624688321-69131-5-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Zhou,

Le sam., juin 26 2021 at 14:18:40 +0800, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> The original clock (3 MHz) is too fast for the clocksource,
> there will be a chance that the system may get stuck.
> 
> Reported-by: Nikolaus Schaller <hns@goldelico.com>
> Tested-by: Nikolaus Schaller <hns@goldelico.com> # on CI20
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> 
> Notes:
>     v4:
>     New patch.
> 
>  arch/mips/boot/dts/ingenic/ci20.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts 
> b/arch/mips/boot/dts/ingenic/ci20.dts
> index 8877c62..3a4eaf1 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -525,10 +525,10 @@
> 
>  &tcu {
>  	/*
> -	 * 750 kHz for the system timer and 3 MHz for the clocksource,
> +	 * 750 kHz for the system timer and clocksource,
>  	 * use channel #0 for the system timer, #1 for the clocksource.
>  	 */
>  	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>,
>  					  <&tcu TCU_CLK_OST>;
> -	assigned-clock-rates = <750000>, <3000000>, <3000000>;
> +	assigned-clock-rates = <750000>, <750000>, <3000000>;
>  };
> --
> 2.7.4
> 


