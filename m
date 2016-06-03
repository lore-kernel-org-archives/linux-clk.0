Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:50730 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751082AbcFCH30 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jun 2016 03:29:26 -0400
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Shawn Lin <shawn.lin@kernel-upstream.org>
Cc: Xing Zheng <zhengxing@rock-chips.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: rockchip: remove ROCKCHIP_SOFTRST_HIWORD_MASK for rockchip platform
Date: Fri, 03 Jun 2016 09:29:03 +0200
Message-ID: <1853369.vjRjVRadgx@diego>
In-Reply-To: <7fdf43a9-58d4-d6a8-d863-a7e265c93a06@kernel-upstream.org>
References: <1464915288-10877-1-git-send-email-shawn.lin@rock-chips.com> <5750DC85.4040400@rock-chips.com> <7fdf43a9-58d4-d6a8-d863-a7e265c93a06@kernel-upstream.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Shawn,

Am Freitag, 3. Juni 2016, 11:35:32 schrieb Shawn Lin:
> 在 2016/6/3 9:25, Xing Zheng 写道:
> > On 2016年06月03日 08:54, Shawn Lin wrote:
> >> I check all the Socs including RK2928/3000/3066/3028X/316X/312X/
> >> 3190/3188/3228/3368/3399/3036, and find all of them use high 16-bit
> >> as write mask. Obviously we don't need ROCKCHIP_SOFTRST_HIWORD_MASK
> >> any more(actually I don't know why we need it before). This patch
> >> removes it to simplify the code and save a little cpu cycle when calling
> >> assert or deassert callback.
> > 
> > In my opinion, this flag can be used for compatibility, we can not
> > ensure that our SoCs will not use the 32bit SOFTRST_CONs in future.
> > 
> > Thanks.
> 
> Thanks for sharing your thought.
> 
> I'm not 100% sure, but I'm 99% sure about we won't let
> it happened. You have to consider the backward compatibility
> rather than the future ones. If you got a chip with 10 bit, or
> 8bit for SOFTRST_CONX, so how do you wanna deal with it?
> Should we now add  ROCKCHIP_SOFTRST_X_BIT_MASK?  :)

older SoCs like the rk2818 (ARM9-based) do actually use 32bit softrst 
registers. And if I ever get my hands on one of those, I'd actually try to 
support it :-) .

So I'd really like to keep the flag.

Heiko
