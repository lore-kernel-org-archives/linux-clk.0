Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-sh2.amlogic.com ([58.32.228.45]:31127 "EHLO
        mail-sh2.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751577AbdLNKLm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Dec 2017 05:11:42 -0500
Subject: Re: [PATCH v7 0/6] add clk controller driver for Meson-AXG SoC
To: Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
References: <20171211141348.22048-1-yixun.lan@amlogic.com>
 <1513245826.32163.7.camel@baylibre.com>
CC: <yixun.lan@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Carlo Caione <carlo@caione.org>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        <linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
From: Yixun Lan <yixun.lan@amlogic.com>
Message-ID: <2428ba7e-c0c4-5f91-e575-970171195df2@amlogic.com>
Date: Thu, 14 Dec 2017 18:11:51 +0800
MIME-Version: 1.0
In-Reply-To: <1513245826.32163.7.camel@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Jerome & Kevin

On 12/14/17 18:03, Jerome Brunet wrote:
> On Mon, 2017-12-11 at 22:13 +0800, Yixun Lan wrote:
>> Qiufang Dai (3):
>>   clk: meson-axg: add clocks dt-bindings required header
>>   clk: meson-axg: add clock controller drivers
>>   arm64: dts: meson-axg: add clock DT info for Meson AXG SoC
>>
>> Yixun Lan (3):
>>   clk: meson: make the spinlock naming more specific
>>   dt-bindings: clock: add compatible variant for the Meson-AXG
>>   arm64: dts: meson-axg: switch uart_ao clock to CLK81
>>
>>  .../bindings/clock/amlogic,gxbb-clkc.txt           |   7 +-
>>  arch/arm64/Kconfig.platforms                       |   1 +
>>  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts     |   2 +
>>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  19 +-
>>  drivers/clk/meson/Kconfig                          |   8 +
>>  drivers/clk/meson/Makefile                         |   1 +
>>  drivers/clk/meson/axg.c                            | 936 +++++++++++++++++++++
>>  drivers/clk/meson/axg.h                            | 126 +++
>>  drivers/clk/meson/clkc.h                           |   2 +-
>>  drivers/clk/meson/gxbb.c                           | 112 +--
>>  drivers/clk/meson/meson8b.c                        |  24 +-
>>  include/dt-bindings/clock/axg-clkc.h               |  71 ++
>>  12 files changed, 1234 insertions(+), 75 deletions(-)
>>  create mode 100644 drivers/clk/meson/axg.c
>>  create mode 100644 drivers/clk/meson/axg.h
>>  create mode 100644 include/dt-bindings/clock/axg-clkc.h
> 
> Kevin, 
> 
> I took the first 4 patches through clk-meson. I left the last 2 for you.
> 
> I have applied the DT bindings update separately.
> Let me know if you have dependency on these new bindings and need a tag.
> 

thanks for taking care of this..

I think it's a good idea to make a tag, if peripheral driver request
clock, then the DT part patch will need
include/dt-bindings/clock/axg-clkc.h to build successfully.

Yixun

