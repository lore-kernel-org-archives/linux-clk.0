Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ot0-f179.google.com ([74.125.82.179]:37593 "EHLO
        mail-ot0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750780AbeEAV4O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 May 2018 17:56:14 -0400
Received: by mail-ot0-f179.google.com with SMTP id 77-v6so14378916otd.4
        for <linux-clk@vger.kernel.org>; Tue, 01 May 2018 14:56:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180501214555.11476-1-martin.blumenstingl@googlemail.com>
References: <20180501214555.11476-1-martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 1 May 2018 23:55:53 +0200
Message-ID: <CAFBinCBz9ne9qeU3a6SQJpqRFm0ix0Dc0LYvmzWKmKJWVML_UQ@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: meson8b: mark fclk_div gate clocks as CLK_IS_CRITICAL
To: yixun.lan@amlogic.com
Cc: linux-amlogic@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
        linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Yixun,

On Tue, May 1, 2018 at 11:45 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> Until commit 05f814402d6174 ("clk: meson: add fdiv clock gates") we
> relied on the bootloader to enable the fclk_div clock gates. It turns
> out that our clock tree is incomplete at least on Meson8b (tested with
> an Odroid-C1, which uses an RGMII PHY) because after the mentioned
> commit Ethernet is not working anymore (no RX/TX activity can be seen).
> At the same time Ethernet was still working on Meson8m2 with a RMII PHY.
>
> It is currently not clear which of the fclk_div gates is required for
> (RGMII) Ethernet operation on Meson8b and why. Mark the fclk_div gates
> as CLK_IS_CRITICAL so the common clock framework keeps these gates
> enabled for us until we know which clock is required for Ethernet on
> Meson8b and which driver has to claim it.
based on the public datasheet for Meson8b (S805) I cannot see which
part of the SoC uses fclk_divX for (RGMII) Ethernet.
I did some further tests and it seems that Ethernet is not working if
fclk_div2 is disabled (the other fclk_divX don't seem to affect
Ethernet operation)

could you please check your internal datasheets and let us know how
fclk_div2 is routed internally and how it can affect Ethernet data
transfers?

(my current speculation is that it may be related to the "Ethernet
Memory Power Domain" in CBUS HHI_MEM_PD_REG0, but I have no proof for
that)
