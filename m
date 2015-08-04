Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55C01ADB.4090300@rock-chips.com>
Date: Tue, 04 Aug 2015 09:52:27 +0800
From: hl <hl@rock-chips.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: heiko@sntech.de, mturquette@baylibre.com, dianders@chromium.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] clk: rockchip: add pclk_pd_pmu to the list of
 rk3288 critical clocks
References: <1438650222-14357-1-git-send-email-hl@rock-chips.com> <55C011E9.3000002@codeaurora.org>
In-Reply-To: <55C011E9.3000002@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 04/08/15 09:14, Stephen Boyd wrote:
> On 08/03/2015 06:03 PM, Lin Huang wrote:
>> From: huang lin <hl@rock-chips.com>
>>
>> pclk_pd_pmu needs to keep running and with the upcoming gpio clock
>> handling this is not always the case anymore. So add it to the list
>> of critical clocks for now.
>>
>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>> Signed-off-by: Lin Huang <hl@rock-chips.com>
>
> From: says huang lin, first signed-off-by is Heiko Stuebner, and final 
> signed-off-by is Lin Huang... who actually authored this patch? Is Lin 
> Huang the same person as huang lin ?
>
This patch writed by Heiko and upload by me, i am sorry confuse you with 
my name, yes, Lin Huang and huang lin is the same person, it is all me.

