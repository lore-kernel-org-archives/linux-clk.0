Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <575E240C.9060502@rock-chips.com>
References: <1465724913-14553-1-git-send-email-zhengxing@rock-chips.com>
 <CAD=FV=XSSPMOnMD3mqFyqM3wWLShbRc2cXVdN0PYcUxpaDnsTw@mail.gmail.com> <575E240C.9060502@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Jun 2016 16:46:14 -0700
Message-ID: <CAD=FV=WhaN__psCV_hYoc67gZMpCt_9yp5=vR-C4uc8i39RAaA@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: add pclk_vio_grf to critical clock on the RK3399
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	elaine zhang <elaine.zhang@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>,
	Brian Norris <briannorris@chromium.org>, Yakir Yang <ykk@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Xing,

On Sun, Jun 12, 2016 at 8:10 PM, Xing Zheng <zhengxing@rock-chips.com> wrot=
e:
> Hi Doug,
>
>
> On 2016=E5=B9=B406=E6=9C=8813=E6=97=A5 05:32, Doug Anderson wrote:
>>
>> Xing,
>>
>> On Sun, Jun 12, 2016 at 2:48 AM, Xing Zheng<zhengxing@rock-chips.com>
>> wrote:
>>>
>>> The pclk_vio_grf supply power for GRF IOs, if it is disabled, will
>>> cause abnormal operation of the GRF.
>>>
>>> The clock tree of the pclk_vio like this:
>>>               | --> pclk_vio_grf
>>> ... pclk_vio | --> pclk_mipi_dsi1
>>>               | --> pclk_mipi_dsi0
>>>
>>> and the pclk_mipi_dsi0 and pclk_mipi_dsi1 don't have the flag
>>> CLK_IGNORE_UNUSED, and they will be disabled by clk_disable_unused
>>> when startup:
>>> clk_disable_unused
>>>    --> clk_disable_unprepare
>>>      --> clk_disable
>>>        --> clk_core_disable(core->parent)
>>>
>>> then, the pclk_vio_grf also is disabled. Therefore, we need to add
>>> pclk_vio_grf to critical clock and avoid to disable pclk_vio and
>>> pclk_vio_grf.
>>>
>>> Tested-by: Yakir Yang<ykk@rock-chips.com>
>>> Signed-off-by: Yakir Yang<ykk@rock-chips.com>
>>> Signed-off-by: Brian Norris<briannorris@chromium.org>
>>> Signed-off-by: Xing Zheng<zhengxing@rock-chips.com>
>>> ---
>>>
>>>   drivers/clk/rockchip/clk-rk3399.c |    1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/clk/rockchip/clk-rk3399.c
>>> b/drivers/clk/rockchip/clk-rk3399.c
>>> index b6742fa..7ecb12c3 100644
>>> --- a/drivers/clk/rockchip/clk-rk3399.c
>>> +++ b/drivers/clk/rockchip/clk-rk3399.c
>>> @@ -1485,6 +1485,7 @@ static const char *const
>>> rk3399_cru_critical_clocks[] __initconst =3D {
>>>          "gpll_hclk_perilp1_src",
>>>          "gpll_aclk_perilp0_src",
>>>          "gpll_aclk_perihp_src",
>>> +       "pclk_vio_grf",
>>
>> This clock is only needed when doing video output (like eDP), right?
>> That means it is not really a critical clock.  Critical clocks are
>> supposed to be ones that are needed for the basic functioning of the
>> system and that can never be turned off in any circumstances.  In this
>> case, if someone were running a rk3399 device and didn't have any
>> video output they would want this clock off.
>>
>> Can you figure out in exactly which circumstances this clock needs to
>> be on and then add a proper consumer of this clock?  For instance, if
>> this clock is needed whenever the VOP is outputting data, then the VOP
>> should be a client and should turn this clock on and off when video is
>> being output.  If this clock is needed whenever you access VOP
>> registers, then the VOP should be a client and turn this clock on
>> around register accesses.
>>
>> -Doug
>>
> Yes, the pclk_vio_grf is needed for doing video output.
> andpclk_vio_grf supply for: grf_soc_con9, 20~26, grf_hdcp
>
> From our design folks, we have many GRF registers in different power
> domains,
> and these GRF gates should be always enabled. In this case, we can avoid
> some
> of the operations GRF registers exception problems, and it is only a very
> small
> increase in  power consumption (aboult <=3D1ma).

Even if it's not much power, it seems like we should still turn it off
and on in the right place.  Unless I'm mistaken it should be such a
simple patch provide the clock to the right driver and then get the
clock when appropriate.


> I will refer the latest TRM to update a new patch for always enable these
> GRFs.

Does that mean you're going to make these all critical clocks?  That
doesn't sound so great...

-Doug
