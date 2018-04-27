Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36404 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757241AbeD0Jdn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Apr 2018 05:33:43 -0400
Received: by mail-wm0-f67.google.com with SMTP id n10so1731247wmc.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Apr 2018 02:33:42 -0700 (PDT)
Message-ID: <1524821620.4026.113.camel@baylibre.com>
Subject: Re: [PATCH 0/2] clk: meson: mpll: add round closest support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date: Fri, 27 Apr 2018 11:33:40 +0200
In-Reply-To: <20180420095603.29964-1-jbrunet@baylibre.com>
References: <20180420095603.29964-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2018-04-20 at 11:56 +0200, Jerome Brunet wrote:
> ATM, the mpll driver can only round the requested rate down, even if
> rounding up would have provided a better approximation of the requested
> rate.
> 
> This patchset adds a flag to enable rounding to the closest rate possible,
> even if it means rounding up.
> 
> The flag is then enabled on the axg platform to improve the rates provided
> to the audio subsystem.
> 
> Jerome Brunet (2):
>   clk: meson: mpll: add round closest support
>   clk: meson: axg: let mpll clocks round closest
> 
>  drivers/clk/meson/axg.c      |  4 ++++
>  drivers/clk/meson/clk-mpll.c | 25 ++++++++++++++++++++-----
>  drivers/clk/meson/clkc.h     |  3 +++
>  3 files changed, 27 insertions(+), 5 deletions(-)
> 

Series applied with Neil's ack
