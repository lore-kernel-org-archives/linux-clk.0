Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.138]:56770 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756374AbcHEC1Q (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 4 Aug 2016 22:27:16 -0400
Message-ID: <57A3F971.6000009@rock-chips.com>
Date: Fri, 05 Aug 2016 10:26:57 +0800
From: Xing Zheng <zhengxing@rock-chips.com>
MIME-Version: 1.0
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
CC: mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	dianders@chromium.org, briannorris@chromium.org,
	huangtao@rock-chips.com, zhangqing@rock-chips.com
Subject: Re: [PATCH v3 7/7] clk: rockchip: rk3399: Add support frac mode frequencies
References: <1470122401-31934-1-git-send-email-zhengxing@rock-chips.com> <1470122579-32083-1-git-send-email-zhengxing@rock-chips.com> <12790025.3tRiQgk9GG@diego>
In-Reply-To: <12790025.3tRiQgk9GG@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Heiko,

On 2016年08月05日 03:19, Heiko Stübner wrote:
> Hi Xing,
>
> Am Dienstag, 2. August 2016, 15:22:59 schrieb Xing Zheng:
>> We need to support various display resolutions for external
>> display devices like HDMI/DP, the frac mode can help us to
>> acquire almost any frequencies, and need higher VCOs to reduce
>> clock jitters.
>>
>> Signed-off-by: Xing Zheng<zhengxing@rock-chips.com>
> why does this need to be a separate rate array and cannot live in the general
> pll rate array?
>
> The plls are general purpose, so we shouldn't limit them arbitarily.
Yes, I understand your mean. :-)
>
> I currently only see some frequencies (594MHz, 297MHz, 54MHz) that are present
> in both arrays but have different settings. As your patch description says
> that these settings reduce clock jitter, wouldn't the general frequencies also
> profit from merging these new values into the general rate array?
>
>
and here are some of our ideas:

"WIth the frac mode and higher VCO to reduce clock jitters" that 
suggestion is from IC designer.
There are many and various kinds resolution and needed frequencies for 
external disaplay devices. For example, the DP needs:
3840x2160 533250KHz
3840x2160 297000KHz
3840x2160 296703KHz
2560x1440 241500KHz
1920x1080 148500KHz
1920x1080 148352KHz
1680x1050 146250KHz
1600x900 108000KHz
1280x1024 135000KHz
1280x1024 108000KHz
... and so on

There some frequencies must be allocated with frac mode. We separate 
these frequencies that are only used for display (VPLL) from the general 
rate table, and put them to be classified into a frac mode table, we can 
reduce the frequency of the query time, the two rate tables will not 
interfere with each other. Because other PLLs don't need to assgin these 
various frequencies with frac mode.

Thanks

-- 
- Xing Zheng


