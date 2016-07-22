Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Chen-Yu Tsai <wens@csie.org>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <CAGb2v67ft=EktCcfGFdBN1K4SoOyK+Stz2WuvqScMmRjoBWxfA@mail.gmail.com>
Cc: "Chen-Yu Tsai" <wens@csie.org>, "Lee Jones" <lee.jones@linaro.org>,
 "Alessandro Zummo" <a.zummo@towertech.it>,
 "Alexandre Belloni" <alexandre.belloni@free-electrons.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Maxime Ripard" <maxime.ripard@free-electrons.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>,
 "linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
 rtc-linux@googlegroups.com, "linux-clk" <linux-clk@vger.kernel.org>,
 "devicetree" <devicetree@vger.kernel.org>,
 "linux-kernel" <linux-kernel@vger.kernel.org>
References: <1467302331-9663-1-git-send-email-wens@csie.org>
 <1467302331-9663-5-git-send-email-wens@csie.org>
 <146800297598.73491.13472152266331488346@resonance>
 <CAGb2v67ft=EktCcfGFdBN1K4SoOyK+Stz2WuvqScMmRjoBWxfA@mail.gmail.com>
Message-ID: <146914709427.8780.16475894348537760808@resonance>
Subject: Re: [PATCH v4 4/7] rtc: ac100: Add clk output support
Date: Thu, 21 Jul 2016 17:24:54 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Chen-Yu Tsai (2016-07-13 20:34:34)
> On Sat, Jul 9, 2016 at 2:36 AM, Michael Turquette
> <mturquette@baylibre.com> wrote:
> > Quoting Chen-Yu Tsai (2016-06-30 08:58:48)
> >> +static long ac100_clkout_round_rate(struct clk_hw *hw, unsigned long =
rate,
> >> +                                   unsigned long prate)
> >> +{
> >> +       unsigned long best_rate =3D 0, tmp_rate, tmp_prate;
> >> +       int i;
> >> +
> >> +       if (prate =3D=3D AC100_RTC_32K_RATE)
> >> +               return divider_round_rate(hw, rate, &prate, NULL,
> >> +                                         AC100_CLKOUT_DIV_WIDTH,
> >> +                                         CLK_DIVIDER_POWER_OF_TWO);
> >> +
> >> +       for (i =3D 0; ac100_clkout_prediv[i].div; i++) {
> >> +               tmp_prate =3D DIV_ROUND_UP(prate, ac100_clkout_prediv[=
i].val);
> >> +               tmp_rate =3D divider_round_rate(hw, rate, &tmp_prate, =
NULL,
> >> +                                             AC100_CLKOUT_DIV_WIDTH,
> >> +                                             CLK_DIVIDER_POWER_OF_TWO=
);
> >> +
> >> +               if (tmp_rate > rate)
> >> +                       continue;
> >> +               if (rate - tmp_rate < best_rate - tmp_rate)
> >> +                       best_rate =3D tmp_rate;
> >> +       }
> >> +
> >> +       return best_rate;
> >> +}
> >> +
> >> +static int ac100_clkout_determine_rate(struct clk_hw *hw,
> >> +                                      struct clk_rate_request *req)
> >> +{
> >> +       struct clk_hw *best_parent;
> >> +       unsigned long best =3D 0;
> >> +       int i, num_parents =3D clk_hw_get_num_parents(hw);
> >> +
> >> +       for (i =3D 0; i < num_parents; i++) {
> >> +               struct clk_hw *parent =3D clk_hw_get_parent_by_index(h=
w, i);
> >> +               unsigned long tmp, prate =3D clk_hw_get_rate(parent);
> >> +
> >> +               tmp =3D ac100_clkout_round_rate(hw, req->rate, prate);
> >> +
> >> +               if (tmp > req->rate)
> >> +                       continue;
> >> +               if (req->rate - tmp < req->rate - best) {
> >> +                       best =3D tmp;
> >> +                       best_parent =3D parent;
> >> +               }
> >> +       }
> >> +
> >> +       if (!best)
> >> +               return -EINVAL;
> >> +
> >> +       req->best_parent_hw =3D best_parent;
> >> +       req->best_parent_rate =3D best;
> >> +       req->rate =3D best;
> >> +
> >> +       return 0;
> >> +}
> >
> > You only need one of the two functions above. Keep the .determine_rate
> > callback and drop .round_rate.
> =

> Only .round_rate is set in the clk_ops. ac100_clkout_round_rate just
> serves to split out some of the calculations done per parent.

If you only use .round_rate, shouldn't you drop .determine_rate then?

Regards,
Mike

> =

> > Otherwise the rest of the clk support looks great to me. Feel free to
> > add:
> >
> > Reviewed-by: Michael Turquette <mturquette@baylibre.com>
> =

> Thanks!
> =

> ChenYu
