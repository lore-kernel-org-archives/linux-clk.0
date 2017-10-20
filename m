Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:54485 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752146AbdJTIky (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Oct 2017 04:40:54 -0400
Received: by mail-wm0-f68.google.com with SMTP id r68so1298382wmr.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Oct 2017 01:40:54 -0700 (PDT)
Subject: Re: [PATCH 0/2] clk: meson: gxbb: Add VPU and VAPB clocks
To: jbrunet@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1508168085-19032-1-git-send-email-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <1c908eb9-a7ea-b083-d52a-e017f4ca997f@baylibre.com>
Date: Fri, 20 Oct 2017 10:40:52 +0200
MIME-Version: 1.0
In-Reply-To: <1508168085-19032-1-git-send-email-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 16/10/2017 17:34, Neil Armstrong wrote:
> This patchset adds the VPU and VAPB clocks used to feed the Amlogic Meson
> GX SoC Video Processing Unit and it's power domain.
> 
> Neil Armstrong (2):
>   clk: meson: gxbb: Add VPU and VAPB clockids
>   clk: meson: gxbb: Add VPU and VAPB clocks data
> 
>  drivers/clk/meson/gxbb.c              | 292 ++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/gxbb.h              |   6 +-
>  include/dt-bindings/clock/gxbb-clkc.h |  11 ++
>  3 files changed, 308 insertions(+), 1 deletion(-)
> 

Applied to next/headers and next/drivers with removal of CLK_IGNORE_UNUSED for muxes and dividers.

Neil
