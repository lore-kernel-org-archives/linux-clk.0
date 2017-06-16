Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170615210020.GG20170@codeaurora.org>
References: <20170524082044.8473-1-linus.walleij@linaro.org>
 <20170601070208.GO20170@codeaurora.org> <CACRpkdZv8MzXVecEXVdJ+P0MxVscYSy=MxC-yQAR0S4yQ6-rwQ@mail.gmail.com>
 <20170605195812.GH20170@codeaurora.org> <CACRpkdbya9xaN-i7AkG0bTyuFYfZc59sSTYhWB43=9btSKfPpQ@mail.gmail.com>
 <CACRpkdapAgHix2vw-woDFi4sh+H3_EX7w-5q=opBGMyegFrXbA@mail.gmail.com>
 <20170612210248.GP20170@codeaurora.org> <CACRpkdaZJbzC0-xg_go=-o+0cQ-JOY3mUe27HUnwQ+DnZYbyMA@mail.gmail.com>
 <CAMuHMdXdYNTLCUfQ9rdj8Fffff5G6fGREcHs5-E5LbwPU9yyLw@mail.gmail.com>
 <CACRpkdY+aSyec9PZaoXErzsRefWg2zzw1xihQt_whmote-jBBw@mail.gmail.com> <20170615210020.GG20170@codeaurora.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Jun 2017 10:35:00 +0200
Message-ID: <CACRpkdbKzsQvo-GHkSc6YpQzLMmFy_z10p=_02_zmUj7XDpicA@mail.gmail.com>
Subject: Re: [PATCH 2/2 v4] clk: Add Gemini SoC clock controller
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>, Janos Laube <janos.dev@gmail.com>,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jun 15, 2017 at 11:00 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> We have quite a few clock and reset controllers that put their
> drivers into the clk directory. I don't see any problem with that
> approach.

OK I'll proceed like this!

Thanks,
Linus Walleij
