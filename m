Return-Path: <slash.tmp@free.fr>
Subject: Re: Two-output clk provider with standard clk consumer
To: Michael Turquette <mturquette@baylibre.com>,
 clk <linux-clk@vger.kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
References: <561CC7DA.1070101@free.fr> <561CF3CD.8060508@free.fr>
 <20151015120956.7777.63740@quantum>
From: Mason <slash.tmp@free.fr>
Message-ID: <561FBA42.2050209@free.fr>
Date: Thu, 15 Oct 2015 16:37:54 +0200
MIME-Version: 1.0
In-Reply-To: <20151015120956.7777.63740@quantum>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 15/10/2015 14:09, Michael Turquette wrote:

> Regarding the reliance on string names when clock-output-names is not
> used, that is an on-going discussion[0] affecting multiple drivers right
> now. We're trying to find a long-term solution that moves away from
> string names and uses the DT hierarchy to establish parent-child
> relationships.

Thanks for your help!

The important thing I was missing is that of_clk_get_parent_name()
actually looks up the parent's "clock-output-names" property.

  if (of_property_read_string_index(clkspec.np, "clock-output-names", index, &clk_name) < 0)
    clk_name = clkspec.np->name;

but since I had "hardcoded" the clock names, the parent didn't
have a "clock-output-names" property.

Regards.
