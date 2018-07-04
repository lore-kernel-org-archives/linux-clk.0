Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45326 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750855AbeGDEGH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Jul 2018 00:06:07 -0400
MIME-Version: 1.0
In-Reply-To: <1814959.07NGAI1aoU@jernej-laptop>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
 <1669385.k4L9lni8DF@jernej-laptop> <CAGb2v67iRZZTQuTH8inwmPC6S0BRecFgPEpKrxgThQbsYaZgmQ@mail.gmail.com>
 <1814959.07NGAI1aoU@jernej-laptop>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 4 Jul 2018 12:05:43 +0800
Message-ID: <CAGb2v65RUiEFSKe9YO8=bROmtozHKRN4s76QHpY+38PJPLaG7w@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH v3 15/24] dt-bindings: display:
 sun4i-drm: Add description of A64 HDMI PHY
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

On Sat, Jun 30, 2018 at 3:32 AM, Jernej Škrabec <jernej.skrabec@siol.net> wrote:
> Dne četrtek, 28. junij 2018 ob 09:00:32 CEST je Chen-Yu Tsai napisal(a):
>> On Thu, Jun 28, 2018 at 12:51 PM, Jernej Škrabec
>>
>> <jernej.skrabec@siol.net> wrote:
>> > Dne četrtek, 28. junij 2018 ob 04:19:55 CEST je Chen-Yu Tsai napisal(a):
>> >> On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec <jernej.skrabec@siol.net>
>> >
>> > wrote:
>> >> > A64 HDMI PHY is similar to H3 HDMI PHY except it has two possible PLL
>> >> > clock parents. It is compatible to other HDMI PHYs, like that found in
>> >> > R40.
>> >> >
>> >> > Acked-by: Rob Herring <robh@kernel.org>
>> >> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>> >> > ---
>> >> >
>> >> >  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 4 +++-
>> >> >  1 file changed, 3 insertions(+), 1 deletion(-)
>> >> >
>> >> > diff --git
>> >> > a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> >> > b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt index
>> >> > 84fe38dbb900..dc83f21ef188 100644
>> >> > --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> >> > +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> >> > @@ -101,6 +101,7 @@ DWC HDMI PHY
>> >> >
>> >> >  Required properties:
>> >> >    - compatible: value must be one of:
>> >> > +    * allwinner,sun50i-a64-hdmi-phy
>> >> >
>> >> >      * allwinner,sun8i-a83t-hdmi-phy
>> >> >      * allwinner,sun8i-h3-hdmi-phy
>> >>
>> >> Nit: the list is sorted by family first, then SoC name, so it should
>> >> be the last on the list.
>> >
>> > I went alphabetically, since "5" is before "8"...
>>
>> I see. I think version sort applies here, given that sun50i is newer
>> than sun8i.
>
> Should I make a patch for that?

Yes, please.
