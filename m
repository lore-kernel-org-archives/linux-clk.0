Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:58878 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751441AbdHNOiF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Aug 2017 10:38:05 -0400
MIME-Version: 1.0
In-Reply-To: <d47777b1acaae095020697fa7c2064ac@aosc.io>
References: <20170812124352.24148-1-icenowy@aosc.io> <20170812124352.24148-2-icenowy@aosc.io>
 <d47777b1acaae095020697fa7c2064ac@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 14 Aug 2017 22:37:41 +0800
Message-ID: <CAGb2v64ed-wGXkVL2mQ1yPmawcqah_dH9NHR65BQbg43B=Sxqg@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH v4 1/3] clk: sunxi-ng: div: Add support
 for fixed post-divider
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Priit Laes <plaes@plaes.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sun, Aug 13, 2017 at 10:50 AM,  <icenowy@aosc.io> wrote:
> 在 2017-08-12 20:43，Icenowy Zheng 写道：
>>
>> From: Priit Laes <plaes@plaes.org>
>>
>> SATA clock on sun4i/sun7i is of type (parent) / M / 6 where
>> 6 is fixed post-divider.
>>
>> Signed-off-by: Priit Laes <plaes@plaes.org>
>
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Applied, thanks.

ChenYu
