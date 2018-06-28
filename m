Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41631 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751466AbeF1G70 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Jun 2018 02:59:26 -0400
MIME-Version: 1.0
In-Reply-To: <52771065.UHJ1SZMy5a@jernej-laptop>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
 <20180625120304.7543-19-jernej.skrabec@siol.net> <CAGb2v651RGegpAi-2efhBUkyFf1iC+zxOGTbRkmjuWcYSTgYJw@mail.gmail.com>
 <52771065.UHJ1SZMy5a@jernej-laptop>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 28 Jun 2018 14:59:02 +0800
Message-ID: <CAGb2v66HOrbjm4w-EoVpvPde7SoVE5X3tfcyW_Ny-vQ+ax141Q@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH v3 18/24] drm/sun4i: DW HDMI PHY: Add
 support for second PLL
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jun 28, 2018 at 12:56 PM, Jernej Škrabec
<jernej.skrabec@siol.net> wrote:
> Dne četrtek, 28. junij 2018 ob 04:25:54 CEST je Chen-Yu Tsai napisal(a):
>> On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec <jernej.skrabec@siol.net>
> wrote:
>> > Some DW HDMI PHYs, like those found in A64 and R40 SoCs, can select
>> > between two clock parents.
>> >
>> > Add code which reads second PLL from DT.
>> >
>> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>>
>> This patch by itself does not do anything. It should be merged with the
>> next one.
>
> Maxime said clock changes should be separated from DT changes.
> http://lists.infradead.org/pipermail/linux-arm-kernel/2018-May/578775.html

OK. I think the boundary between these two is bit blurred in this case.
And I think implementing support for two or more parents, then actually
adding the second parent makes more sense.

ChenYu
