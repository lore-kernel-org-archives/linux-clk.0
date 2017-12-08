Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:44540 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751937AbdLHSuI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Dec 2017 13:50:08 -0500
Received: by mail-wm0-f53.google.com with SMTP id t8so4746030wmc.3
        for <linux-clk@vger.kernel.org>; Fri, 08 Dec 2017 10:50:07 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: gxbb: remove IGNORE_UNUSED from mmc clocks
References: <20171204133428.24631-1-jbrunet@baylibre.com>
Date: Fri, 08 Dec 2017 10:50:03 -0800
In-Reply-To: <20171204133428.24631-1-jbrunet@baylibre.com> (Jerome Brunet's
        message of "Mon, 4 Dec 2017 14:34:28 +0100")
Message-ID: <7hmv2tm4v8.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Jerome Brunet <jbrunet@baylibre.com> writes:

> Remove CLK_IGNORE_UNUSED from mmc clocks. This was only needed while the
> mmc driver incorrectly used the xtal as source instead of the mmc
> clock. Now, the driver takes the correct clock, CCF is aware that the
> clock is being used and we can remove this flag.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>
