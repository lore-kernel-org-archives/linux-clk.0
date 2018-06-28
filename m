Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2676604.ZYCNkuCdbT@jernej-laptop>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
 <20180625120304.7543-10-jernej.skrabec@siol.net> <CAGb2v64EkVK+AEngEuadBzAZagyU7eyOhHhBh0iFrxS+-BbCYQ@mail.gmail.com>
 <2676604.ZYCNkuCdbT@jernej-laptop>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 28 Jun 2018 14:24:34 +0800
Message-ID: <CAGb2v67kBRWkJpJogFR4GXgA66dsxVaMVWN8MDiP_wFTqxW-=g@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH v3 09/24] drm/sun4i: Don't skip TCONs if
 they don't have channel 0
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
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jun 28, 2018 at 12:45 PM, Jernej Škrabec
<jernej.skrabec@siol.net> wrote:
> Dne četrtek, 28. junij 2018 ob 03:51:31 CEST je Chen-Yu Tsai napisal(a):
>> On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec <jernej.skrabec@siol.net>
> wrote:
>> > TV TCONs (channel 1 only) are always connected to TV or HDMI encoder.
>> > Because of that, all output endpoints on such TCON node will point to a
>> > encoder which is part of component framework.
>> >
>> > Correct current graph traversing algorithm in such way that it doesn't
>> > skip output enpoints with id 0 on TV TCONs.
>>
>> No. Our bindings say that endpoint 0 _is_ channel 0. For TCONs that don't
>> have channel 0, it must be skipped.
>
> I'm not sure where this is stated. I read TCON binding again. Can you please
> point me to it?

https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt#L169

Our TCON driver still expects RGB or LVDS panel / bridges on endpoint 0.
So I guess this was sort of implied historically. It's no longer true.
This is something we should probably fix.

In practice our drivers don't look at it (yet), but rely on the downstream
encoder type to determine which channel to use.

But please add the "allwinner,tcon-channel" property as specified in
the binding.

> So on TV TCONs on R40 (without channel 0) TVE would be endpoint 1 and HDMI
> endpoint 2 (or the other way around)?

Which one goes first doesn't quite matter. IIRC there's also a mux for TVE?

ChenYu
