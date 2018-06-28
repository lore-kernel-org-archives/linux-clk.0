Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Chen-Yu Tsai <wens@csie.org>
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
Subject: Re: [PATCH v3 18/24] drm/sun4i: DW HDMI PHY: Add support for second PLL
Date: Thu, 28 Jun 2018 06:56:30 +0200
Message-ID: <52771065.UHJ1SZMy5a@jernej-laptop>
In-Reply-To: <CAGb2v651RGegpAi-2efhBUkyFf1iC+zxOGTbRkmjuWcYSTgYJw@mail.gmail.com>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <20180625120304.7543-19-jernej.skrabec@siol.net> <CAGb2v651RGegpAi-2efhBUkyFf1iC+zxOGTbRkmjuWcYSTgYJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Dne četrtek, 28. junij 2018 ob 04:25:54 CEST je Chen-Yu Tsai napisal(a):
> On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec <jernej.skrabec@siol.net> 
wrote:
> > Some DW HDMI PHYs, like those found in A64 and R40 SoCs, can select
> > between two clock parents.
> > 
> > Add code which reads second PLL from DT.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> This patch by itself does not do anything. It should be merged with the
> next one.

Maxime said clock changes should be separated from DT changes.
http://lists.infradead.org/pipermail/linux-arm-kernel/2018-May/578775.html

Best regards,
Jernej
