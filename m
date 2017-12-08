Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:43668 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753237AbdLHVB0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Dec 2017 16:01:26 -0500
Received: by mail-wm0-f51.google.com with SMTP id n138so5209306wmg.2
        for <linux-clk@vger.kernel.org>; Fri, 08 Dec 2017 13:01:25 -0800 (PST)
Message-ID: <1512766881.334.0.camel@baylibre.com>
Subject: Re: [PATCH] clk: meson: gxbb: remove IGNORE_UNUSED from mmc clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date: Fri, 08 Dec 2017 22:01:21 +0100
In-Reply-To: <7hmv2tm4v8.fsf@baylibre.com>
References: <20171204133428.24631-1-jbrunet@baylibre.com>
         <7hmv2tm4v8.fsf@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2017-12-08 at 10:50 -0800, Kevin Hilman wrote:
> Jerome Brunet <jbrunet@baylibre.com> writes:
> 
> > Remove CLK_IGNORE_UNUSED from mmc clocks. This was only needed while the
> > mmc driver incorrectly used the xtal as source instead of the mmc
> > clock. Now, the driver takes the correct clock, CCF is aware that the
> > clock is being used and we can remove this flag.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> Acked-by: Kevin Hilman <khilman@baylibre.com>

Thanks Kevin
Applied
