Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ot0-f179.google.com ([74.125.82.179]:36571 "EHLO
        mail-ot0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752087AbeENVAg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 May 2018 17:00:36 -0400
Received: by mail-ot0-f179.google.com with SMTP id m11-v6so15951464otf.3
        for <linux-clk@vger.kernel.org>; Mon, 14 May 2018 14:00:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1526292199.2897.7.camel@baylibre.com>
References: <20180501214555.11476-1-martin.blumenstingl@googlemail.com>
 <CAFBinCBz9ne9qeU3a6SQJpqRFm0ix0Dc0LYvmzWKmKJWVML_UQ@mail.gmail.com> <1526292199.2897.7.camel@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 14 May 2018 23:00:15 +0200
Message-ID: <CAFBinCB6r5X6-714cBN=eftaA95j7F2RU3X5-kguBt1-5gQmkQ@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: meson8b: mark fclk_div gate clocks as CLK_IS_CRITICAL
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: yixun.lan@amlogic.com, linux-amlogic@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, May 14, 2018 at 12:03 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Tue, 2018-05-01 at 23:55 +0200, Martin Blumenstingl wrote:
>> Hello Yixun,
>>
>> On Tue, May 1, 2018 at 11:45 PM, Martin Blumenstingl
>> <martin.blumenstingl@googlemail.com> wrote:
>> > Until commit 05f814402d6174 ("clk: meson: add fdiv clock gates") we
>> > relied on the bootloader to enable the fclk_div clock gates. It turns
>> > out that our clock tree is incomplete at least on Meson8b (tested with
>> > an Odroid-C1, which uses an RGMII PHY) because after the mentioned
>> > commit Ethernet is not working anymore (no RX/TX activity can be seen).
>> > At the same time Ethernet was still working on Meson8m2 with a RMII PHY.
>> >
>> > It is currently not clear which of the fclk_div gates is required for
>> > (RGMII) Ethernet operation on Meson8b and why. Mark the fclk_div gates
>> > as CLK_IS_CRITICAL so the common clock framework keeps these gates
>> > enabled for us until we know which clock is required for Ethernet on
>> > Meson8b and which driver has to claim it.
>>
>> based on the public datasheet for Meson8b (S805) I cannot see which
>> part of the SoC uses fclk_divX for (RGMII) Ethernet.
>> I did some further tests and it seems that Ethernet is not working if
>> fclk_div2 is disabled (the other fclk_divX don't seem to affect
>> Ethernet operation)
>>
>> could you please check your internal datasheets and let us know how
>> fclk_div2 is routed internally and how it can affect Ethernet data
>> transfers?
>
> Hi Martin,
>
> As usual, thanks for your thorough work !
>
> Now that you know which of the fdiv is actually required, I would prefer if we
> could mark only the required clock as critical.
OK, I'll re-send the patch this weekend

> Also, could you please add a short FIXME comment in the code explaining why this
> is necessary. This should a be temporary fix while we get the ethernet driver
> sorted out. If the ethernet of the meson8b requires the fdiv2 it should claim it
> (through other clock if necessary)
I'll include the "FIXME" comment
and I totally agree that this should only be a temporary workaround


Regards
Martin
