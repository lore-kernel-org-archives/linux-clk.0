Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:40041 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753495AbcIGAey (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Sep 2016 20:34:54 -0400
Date: Tue, 6 Sep 2016 17:34:52 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: carlo@caione.org, khilman@baylibre.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson-gxbb: Export PWM related clocks for DT
Message-ID: <20160907003452.GR12510@codeaurora.org>
References: <1471870177-10609-1-git-send-email-narmstrong@baylibre.com>
 <57CACA00.9010306@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <57CACA00.9010306@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/03, Neil Armstrong wrote:
> 
> 
> Le 22/08/2016 14:49, Neil Armstrong a écrit :
> > Add the PWM related clocks in order to be referenced as PWM source
> > clocks.
> > 
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > ---
> >  drivers/clk/meson/gxbb.h              | 6 +++---
> >  include/dt-bindings/clock/gxbb-clkc.h | 3 +++
> >  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> Dear Clock Maintainers,
> 
> Could you review this patch since it is a strong requirement to select the PWM clock parents over DT ?
> 

Looks fine to me. Did you want an ack or an immutable branch?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
