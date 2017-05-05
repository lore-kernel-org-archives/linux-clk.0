Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:54700 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751645AbdEEMjn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 5 May 2017 08:39:43 -0400
Date: Fri, 05 May 2017 20:39:31 +0800
In-Reply-To: <20170505123618.5vztqx2vdwsgnrxt@lukather>
References: <20170504114858.9008-1-icenowy@aosc.io> <20170504114858.9008-9-icenowy@aosc.io> <20170504130535.6nokhni5a3uxwy66@lukather> <522ab8cb2939f0017917c5e9b4065089@aosc.io> <20170505123618.5vztqx2vdwsgnrxt@lukather>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: [PATCH v6 08/13] drm/sun4i: add support for Allwinner DE2 mixers
To: linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <maxime.ripard@free-electrons.com>
CC: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <185C1948-541D-4198-9A56-E3F0DFF08734@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



于 2017年5月5日 GMT+08:00 下午8:36:18, Maxime Ripard <maxime.ripard@free-electrons.com> 写到:
>On Fri, May 05, 2017 at 12:50:51AM +0800, icenowy@aosc.io wrote:
>> > > +void sun8i_mixer_layer_enable(struct sun8i_mixer *mixer,
>> > > +				int layer, bool enable)
>> > > +{
>> > > +	u32 val;
>> > > +	/* Currently the first UI channel is used */
>> > > +	int chan = mixer->cfg->vi_num;
>> > > +
>> > > +	DRM_DEBUG_DRIVER("Enabling layer %d in channel %d\n", layer,
>chan);
>> > > +
>> > > +	if (enable)
>> > > +		val = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
>> > > +	else
>> > > +		val = 0;
>> > > +
>> > > +	regmap_update_bits(mixer->engine.regs,
>> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(chan, layer),
>> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN, val);
>> > > +
>> > > +	/* Set the alpha configuration */
>> > > +	regmap_update_bits(mixer->engine.regs,
>> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(chan, layer),
>> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK,
>> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_DEF);
>> > > +	regmap_update_bits(mixer->engine.regs,
>> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(chan, layer),
>> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK,
>> > > +			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_DEF);
>> > > +}
>> > 
>> > This one too.
>> 
>> It's called from sun8i_layer.c, so it cannot be static.
>
>Fair enough.
>
>> > > +	/* Set base coordinates */
>> > > +	DRM_DEBUG_DRIVER("Layer coordinates X: %d Y: %d\n",
>> > > +			 state->crtc_x, state->crtc_y);
>> > > +	regmap_write(mixer->engine.regs,
>> > > +		     SUN8I_MIXER_CHAN_UI_LAYER_COORD(chan, layer),
>> > > +		     SUN8I_MIXER_COORD(state->crtc_x, state->crtc_y));
>> > 
>> > X and Y are fixed point numbers. You want to keep only the higher
>16
>> > bits there.
>> 
>> Do you mean "lower 16 bits"? Thus should I (x & 0xffff) or ((u16)x) ?
>
>Nevermind, I got confused with src_x and src_y.
>
>> P.S. The negative coordinates are broken, how should I deal with it?
>or
>> is the coordinates promised to be not negative?
>
>Adjust the buffer base address, and use a shorter line. You have such
>an example in the sun4i code.

Are they these two lines:
```
paddr += (state->src_x >> 16) * bpp;
paddr += (state->src_y >> 16) * fb->pitches[0];
```

I think I copied them here, so I don't need to mind this problem any more, right?

>
>Maxime
