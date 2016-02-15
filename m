Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20160213010941.GH4847@codeaurora.org>
Cc: linux-clk@vger.kernel.org, lee.jones@linaro.org,
 maxime.ripard@free-electrons.com, maxime.coquelin@st.com,
 geert@linux-m68k.org, heiko@sntech.de, andre.przywara@arm.com,
 rklein@nvidia.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
 <1455225554-13267-4-git-send-email-mturquette@baylibre.com>
 <20160213010941.GH4847@codeaurora.org>
Message-ID: <20160215200953.2278.7427@quark.deferred.io>
Subject: Re: [PATCH v42 3/6] clk: Provide OF helper to mark clocks as CRITICAL
Date: Mon, 15 Feb 2016 12:09:53 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Stephen Boyd (2016-02-12 17:09:41)
> On 02/11, Michael Turquette wrote:
> > +int of_clk_mark_if_critical(struct device_node *np,
> > +                                       int index, unsigned long *flags)
> > +{
> > +     struct property *prop;
> > +     const __be32 *cur;
> > +     uint32_t idx;
> > +
> > +     if (!np || !flags)
> > +             return -EINVAL;
> > +
> > +     of_property_for_each_u32(np, "clock-critical", prop, cur, idx)
> > +             if (index =3D=3D idx)
> > +                     *flags |=3D CLK_IS_CRITICAL;
> > +
> > +     return 0;
> > +}
> =

> I hope we don't have to export this to modules...

I hope so too.

If a clock provider driver is able to build as a module AND has a
corresponding device tree node, then likely they won't need this thing.
This is more for the CLK_OF_DECLARE crowd (flexgen, allwinner, etc).

Regards,
Mike

> =

> -- =

> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
