Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:34162 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755403AbdETCCG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 May 2017 22:02:06 -0400
MIME-Version: 1.0
In-Reply-To: <ED64A56C-4FD3-4878-B67E-1501F20C7B8D@aosc.io>
References: <20170517164354.16399-1-icenowy@aosc.io> <20170517164354.16399-2-icenowy@aosc.io>
 <20170519180215.7lc7duueu74pt4kz@flea.home> <ED64A56C-4FD3-4878-B67E-1501F20C7B8D@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 20 May 2017 10:01:41 +0800
Message-ID: <CAGb2v66DOZbppAOT6yLaxyLSmSQ3t9RT-ESHaNq1vs=Fwbv93Q@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [RFC PATCH 01/11] dt-bindings: update the
 binding for Allwinner H3 TVE support
To: Icenowy Zheng <icenowy@aosc.io>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, May 20, 2017 at 2:06 AM, Icenowy Zheng <icenowy@aosc.io> wrote:
>
>
> 于 2017年5月20日 GMT+08:00 上午2:02:15, Maxime Ripard <maxime.ripard@free-electrons.com> 写到:
>>On Thu, May 18, 2017 at 12:43:44AM +0800, Icenowy Zheng wrote:
>>> -On SoCs other than the A33 and V3s, there is one more clock
>>required:
>>> +For the following compatibles:
>>> +   * allwinner,sun5i-a13-tcon
>>> +   * allwinner,sun6i-a31-tcon
>>> +   * allwinner,sun6i-a31s-tcon
>>> +   * allwinner,sun8i-a33-tcon
>>> +   * allwinner,sun8i-v3s-tcon
>>> +there is one more clock and one more property required:
>>> + - clocks:
>>> +   - 'tcon-ch0': The clock driving the TCON channel 0
>>> + - clock-output-names: Name of the pixel clock created
>>> +
>>> +For the following compatibles:
>>> +   * allwinner,sun5i-a13-tcon
>>> +   * allwinner,sun6i-a31-tcon
>>> +   * allwinner,sun6i-a31s-tcon
>>> +   * allwinner,sun8i-h3-tcon0
>>> +there is one more clock required:
>>>     - 'tcon-ch1': The clock driving the TCON channel 1
>>
>>Putting ID's in the compatible name is usually a bad idea. What is the
>>difference between the two? Only that the second one doesn't have a
>>clock?
>
> Yes.
>
>>
>>That seems highly unlikely. How does it generate the pixel clock
>>frequency?
>
> Yes it seems impossible, but it's also the fact.
>
> There's only one CLK_TCON in H3/5, which is for TCON0.
>
> It's possible that lcd-ch1 clk is CLK_TVE, but it's still a weird situation --
> Although we have a lcd-ch1 clock, we cannot touch it, otherwise
> the TVE will refuse to work (the TVE can only work under 216MHz).

Assuming the TV encoder is like the old one, then it never had a
separate module clock. Instead its timing signals are fed from the
TCON. So CLK_TVE is likely the clock for TCON1 here.

ChenYu
