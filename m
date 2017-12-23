Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33406 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751529AbdLWW2z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Dec 2017 17:28:55 -0500
Received: by mail-wm0-f67.google.com with SMTP id g130so29094116wme.0
        for <linux-clk@vger.kernel.org>; Sat, 23 Dec 2017 14:28:55 -0800 (PST)
Message-ID: <1514068131.4333.1.camel@baylibre.com>
Subject: Re: [PATCH] clk: meson: mpll: use 64-bit maths in params_from_rate
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        narmstrong@baylibre.com, linux-amlogic@lists.infradead.org
Cc: khilman@baylibre.com, carlo@caione.org, linux-clk@vger.kernel.org
Date: Sat, 23 Dec 2017 23:28:51 +0100
In-Reply-To: <20171223213832.16552-1-martin.blumenstingl@googlemail.com>
References: <20171223213832.16552-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, 2017-12-23 at 22:38 +0100, Martin Blumenstingl wrote:
> "rem * SDM_DEN" can easily overflow on the 32-bit Meson8 and Meson8b
> SoCs if the "remainder" (after the division operation) is greater than
> 262143Hz. This is likely to happen since the input clock for the MPLLs
> on Meson8 and Meson8b is "fixed_pll", which is running at a rate of
> 2550MHz.
> 
> One example where this was observed to be problematic was the Ethernet
> clock calculation (which takes MPLL2 as input). When requesting a rate
> of 125MHz there is a remainder of 2500000Hz.
> The resulting MPLL2 rate before this patch was 127488329Hz.
> The resulting MPLL2 rate after this patch is 124999103Hz.
> 
> Commit b609338b26f5 ("clk: meson: mpll: use 64bit math in
> rate_from_params") already fixed a similar issue in rate_from_params.
> 
> Fixes: 007e6e5c5f01d3 ("clk: meson: mpll: add rw operation")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Good catch !

Applied to next/drivers
