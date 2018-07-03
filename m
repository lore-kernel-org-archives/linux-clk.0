Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38076 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933219AbeGCPKk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jul 2018 11:10:40 -0400
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] video: fbdev: simplefb: Stop including
 <linux/clk-provider.h>
Date: Tue, 03 Jul 2018 17:10:34 +0200
Message-id: <2060425.mtieo8VWGK@amdc3058>
In-reply-to: <20180619172221.20252-1-geert+renesas@glider.be>
MIME-version: 1.0
Content-type: text/plain; charset="us-ascii"
References: <CGME20180619172229epcas3p15ff0f115330cd4ffea687479cc929738@epcas3p1.samsung.com>
        <20180619172221.20252-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tuesday, June 19, 2018 07:22:21 PM Geert Uytterhoeven wrote:
> Simplefb is not a clock provider, but it uses of_clk_get_parent_count(),
> so it can just include <linux/of_clk.h> instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch queued for 4.19, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

