Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:55637 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933226AbeFMDUX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jun 2018 23:20:23 -0400
MIME-Version: 1.0
In-Reply-To: <20180612200036.21483-3-jernej.skrabec@siol.net>
References: <20180612200036.21483-1-jernej.skrabec@siol.net> <20180612200036.21483-3-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 13 Jun 2018 11:19:59 +0800
Message-ID: <CAGb2v65PyFjC9vQjLj4wGqZ4ETuZd5dF664gwbCRf66=wKOH0w@mail.gmail.com>
Subject: Re: [PATCH v2 02/27] clk: sunxi-ng: r40: Allow setting parent rate to
 display related clocks
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jun 13, 2018 at 4:00 AM, Jernej Skrabec <jernej.skrabec@siol.net> wrote:
> Display related peripherals need precise clocks to operate correctly.
>
> Allow DE2, TCONs and HDMI to set parent clock.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
