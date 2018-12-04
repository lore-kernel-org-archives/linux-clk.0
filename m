Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45183C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 20:51:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0405A206B7
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 20:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="k3l9GEIy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0405A206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbeLDUv5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 15:51:57 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:39814 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbeLDUv5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 15:51:57 -0500
Received: by mail-qk1-f193.google.com with SMTP id q70so10544688qkh.6;
        Tue, 04 Dec 2018 12:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hkWzP0yt40PfczAFgSa/UvNICUnu1M2oCe6p4pZO8eo=;
        b=k3l9GEIySt3MGOrquGqgmfT/0+NcY4IDChY1H6qYsuZ4h2maRvJu7pFEeCcTeoSXbW
         SxVR5H3p3ssA4Ek1Dg/Ykdbt8JnO+DYb2uLyVOYUlT5jXJHZMYe+5Us8rTCtHrgpwnfh
         gQ6JA2UPDSYn2WKKOCfeGIRlx/wrweI1K0IHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hkWzP0yt40PfczAFgSa/UvNICUnu1M2oCe6p4pZO8eo=;
        b=HLi5LcQB1Luqi+Iy6tP8gfA3Q1krsp7QqUk3zNFevDdJQC7MiRmgYULtG4zCoBMwyL
         SnO9ndtyU2+YumfrQSyHTL7ymsAJ5tOtA1PK9gUEDV3trXhNu2SdarVDInDGWVl7SdXj
         lA524B0ClUrAKTMdoAE1Ltzy5i1M+dqoNfg0N67PCu6aZB7qCHWPe+QYsq89n3fABMo4
         EXVFoOL+PIV2MngBVk9UYljLZ2H2/tMdYonskSJbUbP0rPcfFP9G7C3HYtsWaANx7UtW
         K1IQC8bjD4t0oMIiQqT12aV1RCUaTfz5yKDI5FYHPFvpmUQz5BxxKbJxqOVGuk1sdI+f
         XGNg==
X-Gm-Message-State: AA+aEWZ0opZZyz0e1bnmshtuIFQEjNRyB7XFqCx6IeyKNkbcY/ia7YTz
        IkolDbCHArVEsMTCHI4yLeNW3pv3glZnOOJ1TJQ=
X-Google-Smtp-Source: AFSGD/UbjOiFHyzCLzEexEd2M7TrM3WrLMSZCQRRlUhHHx0Z5UG6DJ0/ahKSORJZ4bLzGd8iTIKiNWku6P8ESdgxISw=
X-Received: by 2002:a37:2b5b:: with SMTP id r88mr20793549qkh.336.1543956715762;
 Tue, 04 Dec 2018 12:51:55 -0800 (PST)
MIME-Version: 1.0
References: <20181204185054.24053-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20181204185054.24053-1-jae.hyun.yoo@linux.intel.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 5 Dec 2018 07:21:43 +1030
Message-ID: <CACPK8XcwMMoxG6vhDhUU8RYGABx7rtBoxJvp2yDhHeD-PemdqA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: aspeed: Mark lclk (LPC) and espiclk (eSPI) as critical
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, vijaykhemka@fb.com,
        chyishian.jiang@gmail.com, linux-clk@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        "# 3.4.x" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Jae,

On Wed, 5 Dec 2018 at 05:20, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> These interfaces are used by host to talk to BMC, and the clock
> source is from the host, usually from PCH. So this commit marks
> the lclk as critical to make it able to be enabled. Also, it marks
> espiclk too because eSPI is sharing the same interface with LPC.

While this is true on the platform you have in mind, on other
platforms this is not the case. They do not use eSPI, and LCLK is
enabled by the driver that is used to configure LPC
(drivers/misc/aspeed-lpc-ctrl.c):

 lpc_ctrl: lpc-ctrl@0 {
     compatible = "aspeed,ast2400-lpc-ctrl";
     reg = <0x0 0x80>;
     clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 }

I wonder if we need a device tree binding to describe which clocks are critical.

Stephen, please don't merge this patch yet.

Cheers,

Joel


>
> Fixes: 15ed8ce5f84e ("clk: aspeed: Register gated clocks")
> Cc: stable@vger.kernel.org
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/clk/clk-aspeed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 596136793fc4..df9504427246 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -95,7 +95,7 @@ static const struct aspeed_gate_data aspeed_gates[] = {
>         [ASPEED_CLK_GATE_DCLK] =        {  5, -1, "dclk-gate",          NULL,   CLK_IS_CRITICAL }, /* DAC */
>         [ASPEED_CLK_GATE_REFCLK] =      {  6, -1, "refclk-gate",        "clkin", CLK_IS_CRITICAL },
>         [ASPEED_CLK_GATE_USBPORT2CLK] = {  7,  3, "usb-port2-gate",     NULL,   0 }, /* USB2.0 Host port 2 */
> -       [ASPEED_CLK_GATE_LCLK] =        {  8,  5, "lclk-gate",          NULL,   0 }, /* LPC */
> +       [ASPEED_CLK_GATE_LCLK] =        {  8,  5, "lclk-gate",          NULL,   CLK_IS_CRITICAL }, /* LPC clock from host. No parent dependency */
>         [ASPEED_CLK_GATE_USBUHCICLK] =  {  9, 15, "usb-uhci-gate",      NULL,   0 }, /* USB1.1 (requires port 2 enabled) */
>         [ASPEED_CLK_GATE_D1CLK] =       { 10, 13, "d1clk-gate",         NULL,   0 }, /* GFX CRT */
>         [ASPEED_CLK_GATE_YCLK] =        { 13,  4, "yclk-gate",          NULL,   0 }, /* HAC */
> @@ -103,7 +103,7 @@ static const struct aspeed_gate_data aspeed_gates[] = {
>         [ASPEED_CLK_GATE_UART1CLK] =    { 15, -1, "uart1clk-gate",      "uart", 0 }, /* UART1 */
>         [ASPEED_CLK_GATE_UART2CLK] =    { 16, -1, "uart2clk-gate",      "uart", 0 }, /* UART2 */
>         [ASPEED_CLK_GATE_UART5CLK] =    { 17, -1, "uart5clk-gate",      "uart", 0 }, /* UART5 */
> -       [ASPEED_CLK_GATE_ESPICLK] =     { 19, -1, "espiclk-gate",       NULL,   0 }, /* eSPI */
> +       [ASPEED_CLK_GATE_ESPICLK] =     { 19, -1, "espiclk-gate",       NULL,   CLK_IS_CRITICAL }, /* eSPI clock from host. No parent dependency */
>         [ASPEED_CLK_GATE_MAC1CLK] =     { 20, 11, "mac1clk-gate",       "mac",  0 }, /* MAC1 */
>         [ASPEED_CLK_GATE_MAC2CLK] =     { 21, 12, "mac2clk-gate",       "mac",  0 }, /* MAC2 */
>         [ASPEED_CLK_GATE_RSACLK] =      { 24, -1, "rsaclk-gate",        NULL,   0 }, /* RSA */
> --
> 2.7.4
>
