Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:39817 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726921AbeH0QrJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Aug 2018 12:47:09 -0400
Received: by mail-wm0-f65.google.com with SMTP id q8-v6so8235225wmq.4
        for <linux-clk@vger.kernel.org>; Mon, 27 Aug 2018 06:00:34 -0700 (PDT)
Message-ID: <fbdc7304e8864ce35f27de2d932ccdc661187dbe.camel@baylibre.com>
Subject: Re: [PATCH] clk: meson: axg: round audio system master clocks down
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Date: Mon, 27 Aug 2018 15:00:32 +0200
In-Reply-To: <20180801140732.27671-1-jbrunet@baylibre.com>
References: <20180801140732.27671-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, 2018-08-01 at 16:07 +0200, Jerome Brunet wrote:
> Some of the master clocks provided by the axg audio clock controller are
> system clock (spdifin and pdm sysclk). They are used to clock an internal
> DSP of the related devices. Having them constantly rounded down instead
> of closest is preferable.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/axg-audio.c | 34 +++++++++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 11 deletions(-)

queued for 4.20
