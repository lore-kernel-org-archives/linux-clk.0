Return-Path: <hdegoede@redhat.com>
Subject: Re: [PATCH 06/19] clk: sunxi: Add Allwinner R8 AHB gates support
To: Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-7-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v64ErryRq+-fToWihKONO5tgPxyydZ78gzsYYYJtOMGxWw@mail.gmail.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Alexander Kaplan <alex@nextthing.co>,
        Wynter Woods <wynter@nextthing.co>,
        Boris Brezillon <boris.brezillon@free-electrons.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <56339BD2.9010001@redhat.com>
Date: Fri, 30 Oct 2015 17:33:22 +0100
MIME-Version: 1.0
In-Reply-To: <CAGb2v64ErryRq+-fToWihKONO5tgPxyydZ78gzsYYYJtOMGxWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi,

On 30-10-15 17:01, Chen-Yu Tsai wrote:
> On Fri, Oct 30, 2015 at 10:20 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
>> The R8 has yet another array of gates for AHB. Let's add it to the list of
>> compatibles we can deal with.
>>
>> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>> ---
>>   drivers/clk/sunxi/clk-simple-gates.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/clk/sunxi/clk-simple-gates.c b/drivers/clk/sunxi/clk-simple-gates.c
>> index 5666c767fa14..e3190a8687a8 100644
>> --- a/drivers/clk/sunxi/clk-simple-gates.c
>> +++ b/drivers/clk/sunxi/clk-simple-gates.c
>> @@ -158,5 +158,7 @@ CLK_OF_DECLARE(sun5i_a10s_ahb, "allwinner,sun5i-a10s-ahb-gates-clk",
>>                 sun4i_a10_ahb_init);
>>   CLK_OF_DECLARE(sun5i_a13_ahb, "allwinner,sun5i-a13-ahb-gates-clk",
>>                 sun4i_a10_ahb_init);
>> +CLK_OF_DECLARE(sun5i_r8_ahb, "allwinner,sun5i-r8-ahb-gates-clk",
>> +              sun4i_a10_ahb_init);
>>   CLK_OF_DECLARE(sun7i_a20_ahb, "allwinner,sun7i-a20-ahb-gates-clk",
>>                 sun4i_a10_ahb_init);
>> --
>> 2.6.2
>>
>
> Please also update Documentation/devicetree/bindings/clock/sunxi.txt
>
> Otherwise,
>
> Acked-by: Chen-Yu Tsai <wens@csie.org>

I wonder if this patch really is a good idea. We've confirmation from
Allwinner that all of the sun5i SoCs are using the same die. Sure some
peripherals are not connected to the outside but it is still the same
die. This patch feels to me like it just grows the kernel and dts size
without serving any purpose.

Regards,

Hans
