Return-Path: <zhengxing@rock-chips.com>
Message-ID: <56540880.6010601@rock-chips.com>
Date: Tue, 24 Nov 2015 14:49:36 +0800
From: Xing Zheng <zhengxing@rock-chips.com>
MIME-Version: 1.0
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
CC: linux-rockchip@lists.infradead.org, kmixter@google.com,
 benchan@google.com, devicetree@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Kumar Gala <galak@codeaurora.org>,
 linux-kernel@vger.kernel.org,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Russell King <linux@arm.linux.org.uk>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/6] Build and support rk3036 SoC platform
References: <1446708840-12038-1-git-send-email-zhengxing@rock-chips.com> <1518219.zj9d8yfxJz@diego>
In-Reply-To: <1518219.zj9d8yfxJz@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

OK, Thanks Heiko. :-)

On 2015年11月24日 08:03, Heiko Stübner wrote:
> Hi Xing Zheng,
>
> Am Donnerstag, 5. November 2015, 15:33:54 schrieb Xing Zheng:
>> Hi,
>>    We need to support rk3036 soc platform via upstream, there are
>> some primary parts for the initial release of minimum system: dts,
>> clk-pll, smp, and clock tree for rk3036, and additional, we can use
>> these startup and run to init processs.
> [...]
>
> after talking with Mike and agreeing that I'm again taking the regular
> clock patches to them, I've applied all of this to appropriate branches.
> I did some cosmetics, as explained below.
>
>
>> Xing Zheng (6):
>>    dt-bindings: add documentation of rk3036 clock controller
>>    clk: rockchip: add dt-binding header for rk3036
>>    clk: rockchip: add new pll-type for rk3036 and similar socs
> - wrapped some overly long lines, otherwise this is similar to what
>    Stephen already took for the rk3066-pll-type.
>
>
>>    clk: rockchip: add clock controller for rk3036
>>    ARM: dts: rockchip: add core rk3036 dts
> - split off the evb into a separate patch
> - reordered some nodes (please order by the address (the @xxxxxxxx)
> - reordered some properties
> - fixed the gic cpu masks
>
>
>>    ARM: dts: enable smp for rk3036
> folded into the core dtsi addition
>
>
> Please take a final look at [0] to make sure I didn't mess up anything.
>
>
> Thanks
> Heiko
>
>
> [0]
> https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/log/?h=v4.5-clk/next
> https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/log/?h=v4.5-armsoc/dts32
>
>
>
