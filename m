Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S967134AbeFSUMc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 19 Jun 2018 16:12:32 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hans de Goede <hdegoede@redhat.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180619172221.20252-1-geert+renesas@glider.be>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20180619172221.20252-1-geert+renesas@glider.be>
Message-ID: <152943915116.16708.6058152206701595837@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] video: fbdev: simplefb: Stop including <linux/clk-provider.h>
Date: Tue, 19 Jun 2018 13:12:31 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Geert Uytterhoeven (2018-06-19 10:22:21)
> Simplefb is not a clock provider, but it uses of_clk_get_parent_count(),
> so it can just include <linux/of_clk.h> instead.
> =

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

