Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40779 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbeHJTTT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 Aug 2018 15:19:19 -0400
MIME-Version: 1.0
In-Reply-To: <20180810151638.30900-1-icenowy@aosc.io>
References: <20180810151638.30900-1-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 11 Aug 2018 00:48:19 +0800
Message-ID: <CAGb2v66Wsjvz8Pdo+7JDHudOxqqWX_9qMX4kgiFHo8cJJou7Ew@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: h6: fix PWM gate/reset offset
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Rongyi Chen <chenyi@tt-cool.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Aug 10, 2018 at 11:16 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> From: Rongyi Chen <chenyi@tt-cool.com>
>
> Currently the register offset of the PWM bus gate in Allwinner H6 clock
> driver is wrong.
>
> Fix this issue.
>
> Fixes: 542353ea ("clk: sunxi-ng: add support for the Allwinner H6 CCU")
> Signed-off-by: Rongyi Chen <chenyi@tt-cool.com>
> [Icenowy: refactor commit message]
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Queued up for 4.20. Thanks

ChenYu
