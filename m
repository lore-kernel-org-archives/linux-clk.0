Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <ebdc6b56-f6d6-7e63-ebc2-6d60f5d1b690@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1525428158-29147-1-git-send-email-tdas@codeaurora.org>
 <1525428158-29147-2-git-send-email-tdas@codeaurora.org>
 <152545267793.138124.15345698220033125655@swboyd.mtv.corp.google.com>
 <a926924f-2033-acd6-67cb-210a5e487ebb@codeaurora.org>
 <152573930157.138124.12994299541712205183@swboyd.mtv.corp.google.com>
 <ebdc6b56-f6d6-7e63-ebc2-6d60f5d1b690@codeaurora.org>
Message-ID: <152580143451.138124.11843604181263814941@swboyd.mtv.corp.google.com>
Subject: Re: [v8] clk: qcom: clk-rpmh: Add QCOM RPMh clock driver
Date: Tue, 08 May 2018 10:43:54 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-05-08 09:57:36)
> On 5/8/2018 5:58 AM, Stephen Boyd wrote:
> > Quoting Taniya Das (2018-05-07 03:48:06)
> >> Will be okay, if I can the following?
> >>
> >> _probe...
> >> {
> >>          struct clk_rpmh_desc *hw_desc_data;
> >>          ....
> >>
> >>          hw_desc_data =3D kmemdup(desc, sizeof(*desc), GFP_KERNEL);
> >>
> >>          ...
> >>          ret =3D devm_of_clk_add_hw_provider(&pdev->dev,     of_clk_rp=
mh_hw_get,
> >> hw_desc_data);
> >>           ....
> >>
> >> }
> >>
> >> And also I fix the "getter" function.
> > =

> > I'd rather see the check for out of bounds number just go away, unless
> > that's helping something. The kmemdup() doesn't look good.
> > =

> =

> I think it is better to copy the desc data to "clk_hw_onecell_data", as =

> I would also have to fix the "getter" function to check for out of bound =

> numbers (idx >=3D num_clks).
> =


Hmm ok. It would be nicer if we didn't have to duplicate the pointers
just because of const though. I'd rather have the cast away of const and
a comment indicating we know what we're doing. Maybe in the future we
can make the getter function take a const void pointer.
