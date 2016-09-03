Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:37504 "EHLO
        mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752548AbcICNDM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 3 Sep 2016 09:03:12 -0400
Received: by mail-wm0-f50.google.com with SMTP id v143so69172523wmv.0
        for <linux-clk@vger.kernel.org>; Sat, 03 Sep 2016 06:03:12 -0700 (PDT)
Message-ID: <57CACA00.9010306@baylibre.com>
Date: Sat, 03 Sep 2016 15:02:56 +0200
From: Neil Armstrong <narmstrong@baylibre.com>
MIME-Version: 1.0
To: sboyd@codeaurora.org, carlo@caione.org, khilman@baylibre.com,
        devicetree@vger.kernel.org
CC: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson-gxbb: Export PWM related clocks for DT
References: <1471870177-10609-1-git-send-email-narmstrong@baylibre.com>
In-Reply-To: <1471870177-10609-1-git-send-email-narmstrong@baylibre.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



Le 22/08/2016 14:49, Neil Armstrong a écrit :
> Add the PWM related clocks in order to be referenced as PWM source
> clocks.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/gxbb.h              | 6 +++---
>  include/dt-bindings/clock/gxbb-clkc.h | 3 +++
>  2 files changed, 6 insertions(+), 3 deletions(-)

Dear Clock Maintainers,

Could you review this patch since it is a strong requirement to select the PWM clock parents over DT ?

Thanks,
Neil
