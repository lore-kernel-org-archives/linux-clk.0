Return-Path: <w.egorov@phytec.de>
Subject: Re: [PATCH v5 3/6] regulator: rk808: Add regulator driver for RK818
To: Lee Jones <lee.jones@linaro.org>
References: <1462886340-7893-1-git-send-email-w.egorov@phytec.de>
 <1462886340-7893-4-git-send-email-w.egorov@phytec.de>
 <20160510140320.GO19473@dell>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org, lgirdwood@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, dianders@chromium.org, zyw@rock-chips.com
From: Wadim Egorov <w.egorov@phytec.de>
Message-ID: <5731ECFB.2000207@phytec.de>
Date: Tue, 10 May 2016 16:15:23 +0200
MIME-Version: 1.0
In-Reply-To: <20160510140320.GO19473@dell>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>



On 10.05.2016 16:03, Lee Jones wrote:
> On Tue, 10 May 2016, Wadim Egorov wrote:
>
>> Add support for the rk818 regulator. The regulator module consists
>> of 4 DCDCs, 9 LDOs, 1 switch and 1 BOOST converter which is used to
>> power OTG and HDMI5V.
>>
>> The output voltages are configurable and are meant to supply power
>> to the main processor and other components.
>>
>> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
>> ---
>>  drivers/regulator/Kconfig           |   4 +-
>>  drivers/regulator/rk808-regulator.c | 143 ++++++++++++++++++++++++++++++++++--
>>  2 files changed, 138 insertions(+), 9 deletions(-)
> Needs an Ack before I can take the set.
>

Mark acked this patch in v3.
After small changes I removed the ack again. I don't know if it is ok to
keep an Acked-by with small changes in the patch.
