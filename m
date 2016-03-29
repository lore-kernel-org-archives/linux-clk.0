Return-Path: <zhengxing@rock-chips.com>
Subject: Re: [PATCH v6 0/3] Add more clock compatible features and support the
 RK3399 clock
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
References: <1459158697-8218-1-git-send-email-zhengxing@rock-chips.com>
 <4649399.g7v7zsVJik@diego>
Cc: linux-rockchip@lists.infradead.org, huangtao@rock-chips.com,
 jay.xu@rock-chips.com, elaine.zhang@rock-chips.com, dianders@chromium.org,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
 Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
From: Xing Zheng <zhengxing@rock-chips.com>
Message-ID: <56F9D790.1080608@rock-chips.com>
Date: Tue, 29 Mar 2016 09:17:04 +0800
MIME-Version: 1.0
In-Reply-To: <4649399.g7v7zsVJik@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>


On 2016年03月28日 20:59, Heiko Stübner wrote:
> Am Montag, 28. März 2016, 17:51:34 schrieb Xing Zheng:
>>    The patch series add support more mux parameters and multiple
>> clock providers for the rockchip features of the clock framework,
>> and support the clock controller for the RK3399.
> applied all 3 for 4.7 with one change:
>
> I've dropped the grf paragraph from the binding doc (as it is not used
> anymore) and also dropped the gmac_phy_rx_clk input clock.
>
> We can add these back once they are getting used in the future.
>
>
> Heiko
>
OK, thanks Heiko. :-)

-- 
- Xing Zheng
