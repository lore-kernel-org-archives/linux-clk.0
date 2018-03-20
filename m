Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:48384 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751609AbeCTHAt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 20 Mar 2018 03:00:49 -0400
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: hl <hl@rock-chips.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, dbasehore@chromium.org,
        briannorris@chromium.org, dianders@chromium.org,
        linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: assign clock rate for some cpll child clock
Date: Tue, 20 Mar 2018 08:00:40 +0100
Message-ID: <22053902.qFbnfPJqGC@diego>
In-Reply-To: <d92aa74d-7a49-8fbd-5efc-b931210ef0b7@rock-chips.com>
References: <1521511589-17844-1-git-send-email-hl@rock-chips.com> <13843114-3db5-b98c-a71d-c61911a8a42c@rock-chips.com> <d92aa74d-7a49-8fbd-5efc-b931210ef0b7@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 20. März 2018, 03:23:41 CET schrieb hl:
> On Tuesday, March 20, 2018 10:12 AM, Shawn Lin wrote:
> > On 2018/3/20 10:06, Lin Huang wrote:
> >> These clocks do not assign default clock frequency, and use the
> >> default cru register value to get frequency, so if cpll increase
> >> frequency, these clocks also increase their frequency, that may
> >> exceed their signed off frequency. So assign default clock for
> >> them to avoid it.
> >> 
> >> NOTE: on none of the boards currently in mainline do we expect
> >> CPLL to be anything other than 800 MHz, but some future boards
> >> might have it. It's still good to be explicit about the clock
> >> rates to make diffing against future boards easier and also to
> >> rely less on BIOS muxing.
> >> 
> >> Change-Id: If79368aeda5c51dbf2a3b6659f17052a2ae4a401
> > 
> > Should remove Change-Id for future patch(es), thought Heiko may help
> > do it when applied.
> 
> Opp, sorry for that.

Yep, I can drop the changeId when applying
