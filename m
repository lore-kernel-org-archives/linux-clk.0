Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7459CC43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:56:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4CF5121841
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:56:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbeLRJ4C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 04:56:02 -0500
Received: from mail.bootlin.com ([62.4.15.54]:51950 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726386AbeLRJ4C (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 18 Dec 2018 04:56:02 -0500
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 5BC7C20824; Tue, 18 Dec 2018 10:56:00 +0100 (CET)
Received: from localhost (unknown [37.71.171.242])
        by mail.bootlin.com (Postfix) with ESMTPSA id 2A6BA20717;
        Tue, 18 Dec 2018 10:55:50 +0100 (CET)
Date:   Tue, 18 Dec 2018 10:55:50 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: at91: enable AUDIOPLL as source for PCKx
Message-ID: <20181218095550.GW19816@piout.net>
References: <e07fdef0c9a959a6e820a040048e9ab5b7aec9d2.1545075103.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e07fdef0c9a959a6e820a040048e9ab5b7aec9d2.1545075103.git.mirq-linux@rere.qmqm.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

On 17/12/2018 20:37:04+0100, Michał Mirosław wrote:
> SAMA5D2x have 6 sources, the last being AUDIOPLL.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  arch/arm/boot/dts/sama5d2.dtsi | 2 +-
>  drivers/clk/at91/dt-compat.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
> index dd0dda6ed44b..6c8c15c363e4 100644
> --- a/arch/arm/boot/dts/sama5d2.dtsi
> +++ b/arch/arm/boot/dts/sama5d2.dtsi
> @@ -526,7 +526,7 @@
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  					interrupt-parent = <&pmc>;
> -					clocks = <&clk32k>, <&main>, <&plladiv>, <&utmi>, <&mck>;
> +					clocks = <&clk32k>, <&main>, <&plladiv>, <&utmi>, <&mck>, <&audio_pll_pmc>;

This won't apply as sama5d2 has now switch to the new binding. Please
fix drivers/clk/at91/sama5d2.c instead.

>  
>  					prog0: prog0 {
>  						#clock-cells = <0>;
> diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
> index b95bb4e2a927..19badfc51f50 100644
> --- a/drivers/clk/at91/dt-compat.c
> +++ b/drivers/clk/at91/dt-compat.c
> @@ -17,7 +17,7 @@
>  
>  #define PERIPHERAL_ID_MIN	2
>  
> -#define PROG_SOURCE_MAX		5
> +#define PROG_SOURCE_MAX		6
>  #define PROG_ID_MAX		7
>  
>  #define SYSTEM_MAX_ID		31
> -- 
> 2.19.2
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
