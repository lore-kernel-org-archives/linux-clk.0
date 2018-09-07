Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:39013 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbeIGIw3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Sep 2018 04:52:29 -0400
Received: by mail-it0-f66.google.com with SMTP id h1-v6so18296290itj.4
        for <linux-clk@vger.kernel.org>; Thu, 06 Sep 2018 21:13:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180905075056.tob7itg3judccooe@flea>
References: <20180904044053.15425-1-icenowy@aosc.io> <20180904044053.15425-9-icenowy@aosc.io>
 <20180905075056.tob7itg3judccooe@flea>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 7 Sep 2018 09:43:29 +0530
Message-ID: <CAMty3ZBo+X5o22i1=HR9d1VjkEWQ7=DHHPL9RLtbzbyzCZLyFw@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] arm64: dts: allwinner: a64: Add display pipeline
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Sep 5, 2018 at 1:20 PM, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> On Tue, Sep 04, 2018 at 12:40:50PM +0800, Icenowy Zheng wrote:
>> +             hdmi_phy: hdmi-phy@1ef0000 {
>> +                     compatible = "allwinner,sun8i-h3-hdmi-phy";
>> +                     reg = <0x01ef0000 0x10000>;
>> +                     clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_DDC>,
>> +                              <&ccu 7>;
>> +                     clock-names = "bus", "mod", "pll-0";
>> +                     resets = <&ccu RST_BUS_HDMI0>;
>> +                     reset-names = "phy";
>> +                     #phy-cells = <0>;
>> +             };
>
> This needs to use the bindings we have for that phy.

You mean allwinner,sun50i-a64-hdmi-phy ?
