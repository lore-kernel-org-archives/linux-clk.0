Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:39483 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751270AbdEFOv1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 6 May 2017 10:51:27 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Sat, 06 May 2017 22:51:25 +0800
From: icenowy@aosc.io
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Yong Deng <iemdey@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] clk: sunxi-ng: v3s: Fix usb otg device reset bit
In-Reply-To: <20170505200440.zje5s7x2seglxzi6@lukather>
References: <1493980317-39775-1-git-send-email-iemdey@gmail.com>
 <20170505200440.zje5s7x2seglxzi6@lukather>
Message-ID: <a7ef1477b9dec8009e9c40bce5d42267@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

在 2017-05-06 04:04，Maxime Ripard 写道：
> Hi,
> 
> On Fri, May 05, 2017 at 06:31:57PM +0800, Yong Deng wrote:
>> V3S's usb otg device reset bit should be 24, not 23.
>> 
>> Signed-off-by: Yong Deng <iemdey@gmail.com>
>> Reviewed-By: Icenowy Zheng <icenowy@aosc.io>
> 
> Applied, thanks.
> Maxime

Maybe it should also apply to 4.11 stable?

Cc: stable@vger.kernel.org
