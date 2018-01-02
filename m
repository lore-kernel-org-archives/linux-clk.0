Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:48628 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751274AbeABIKX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Jan 2018 03:10:23 -0500
MIME-Version: 1.0
In-Reply-To: <20171230113043.30237-4-icenowy@aosc.io>
References: <20171230113043.30237-1-icenowy@aosc.io> <20171230113043.30237-4-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 2 Jan 2018 16:09:57 +0800
Message-ID: <CAGb2v65DiLg8QyT=BRHGJXUYLibP=wzYCj8ZW3hpWsF2miO2sA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v4 3/6] clk: sunxi-ng: add support for
 Allwinner A64 DE2 CCU
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, Dec 30, 2017 at 7:30 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> Allwinner A64's DE2 needs to claim a section of SRAM (SRAM C) to work.
>
> Add support for it.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v4:
> - Use a struct to maintain both ccu desc and quirks as Chen-Yu Tsai
>   suggested.

This made the patch slightly messy. Could you split it into two patches?
The first just adds the struct (without the sram_needed field) and migrates
everything to that. This patch should mention it is preperation for the
next patch, which adds the a field to the struct (otherwise it makes no
sense and just looks like churn.) The second patch will add the .sram_needed
field and support for the A64 DE2 CCU.


Thanks
ChenYu
