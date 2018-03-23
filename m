Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:45048 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751668AbeCWIpe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Mar 2018 04:45:34 -0400
From: Heiko Stuebner <heiko@sntech.de>
To: Lin Huang <hl@rock-chips.com>
Cc: dbasehore@chromium.org, shawn.lin@rock-chips.com,
        briannorris@chromium.org, linux-rockchip@lists.infradead.org,
        dianders@chromium.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: assign clock rate for some cpll child clock
Date: Fri, 23 Mar 2018 09:45:22 +0100
Message-ID: <2857663.tlolacRkt7@phil>
In-Reply-To: <1521511589-17844-2-git-send-email-hl@rock-chips.com>
References: <1521511589-17844-1-git-send-email-hl@rock-chips.com> <1521511589-17844-2-git-send-email-hl@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 20. März 2018, 03:06:29 CET schrieb Lin Huang:
> These clocks do not assign default clock frequency, and use the
> default cru register value to get frequency, so if cpll increase
> frequency, these clocks also increase their frequency, that may
> exceed their signed off frequency. So assign default clock for
> them to avoid it.
> 
> NOTE: on none of the boards currently in mainline do we expect
> CPLL to be anything other than 800 MHz, but some future boards
> might have it. It's still good to be explicit about the clock
> rates to make diffing against future boards easier and also to
> rely less on BIOS muxing.
> 
> Change-Id: If79368aeda5c51dbf2a3b6659f17052a2ae4a401
> Signed-off-by: Lin Huang <hl@rock-chips.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

applied for 4.17 (but will most likely move to 4.18) with some changes:
- dropped Change-Id
- fixed duplicate assigned clocks for dp node
- grouped aclk_vio and aclk_hdcp into one line in cru nodes
- moved assigned clocks


Heiko
