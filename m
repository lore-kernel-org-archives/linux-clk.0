Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.133]:41784 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753970AbcARKoV (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 18 Jan 2016 05:44:21 -0500
Subject: Re: [PATCH] clk: rockchip: rk3036: enable the CLK_IGNORE_UNUSED flag
 for hclk_vio_bus
To: Heiko Stuebner <heiko@sntech.de>
References: <1452858854-841-1-git-send-email-ykk@rock-chips.com>
 <1816378.OnNVlMiORS@phil>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
From: Yakir Yang <ykk@rock-chips.com>
Message-ID: <569CC200.1050504@rock-chips.com>
Date: Mon, 18 Jan 2016 18:44:16 +0800
MIME-Version: 1.0
In-Reply-To: <1816378.OnNVlMiORS@phil>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 01/18/2016 03:14 AM, Heiko Stuebner wrote:
> Am Freitag, 15. Januar 2016, 19:54:14 schrieb Yakir Yang:
>> HCLK_VIO_BUS is the noc bus controller clock for display module,
>> due to it shouldn't belong to any driver, but we need it enabled,
>> so just mark it as the CLK_IGNORE_UNUSED flag.
>>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> applied to my clk-branch for 4.6

Thanks  ;)

- Yakir
> Thanks
> Heiko
>
>
>


