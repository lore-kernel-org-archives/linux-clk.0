Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731918AbeGZRY4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 26 Jul 2018 13:24:56 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Peter De Schrijver <pdeschrijver@nvidia.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180726081920.GQ1636@tbergstrom-lnx.Nvidia.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, thierry.reding@gmail.com
References: <1532010175-28364-1-git-send-email-pdeschrijver@nvidia.com>
 <1532010175-28364-3-git-send-email-pdeschrijver@nvidia.com>
 <b34c2624-7a55-331e-4462-bb3265f411b5@nvidia.com>
 <153255869581.48062.10244129990637940083@swboyd.mtv.corp.google.com>
 <20180726081920.GQ1636@tbergstrom-lnx.Nvidia.com>
Message-ID: <153262124609.48062.2614573183952941241@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 2/2] clk: tegra: Correct clk_out_mux parents
Date: Thu, 26 Jul 2018 09:07:26 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Peter De Schrijver (2018-07-26 01:19:20)
> On Wed, Jul 25, 2018 at 03:44:55PM -0700, Stephen Boyd wrote:
> > Quoting Jon Hunter (2018-07-19 08:06:50)
> > > =

> > > On 19/07/18 15:22, Peter De Schrijver wrote:
> > > > The first 3 possible parents of clk_out_[1-3] are defined as clk_m,=
 clk_m/2
> > > > and clk_m/4. However They are actually osc, osc/2 and osc/4. In chi=
ps prior
> > > > to Tegra210 clk_m and osc had the same frequency, so this differenc=
e didn't
> > > > matter. Since Tegra210 however, clk_m is a divided version of osc. =
This
> > > > results in CCF reporting the rate as only half the actual rate on T=
egra210.
> > > > To fix this, we add new clocks which have osc, osc/2, osc/4 and the
> > > > respective extern clock as their possible parents and use them for
> > > > Tegra210. Also 2 new DT clock defines are added to reflect the new
> > > > names of clk_m/2 and clk_m/4. The old defines are still kept for ba=
ckwards
> > > > compatibility.
> > > > =

> > > > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> > > I gave this a whirl on the Tegra210 Smaug which uses the PMC CLK_OUT1=
 to
> > > clock the audio codec, but unfortunately this did not work. The good =
news
> > > is that I know why. Basically, for Tegra210 there is a slight change =
in the
> > > behaviour of the CLKx_ACCEPT_REQ bit. Essentially, this bit must alwa=
ys be
> > > set if you want to use any of the osc clocks to drive the CLK_OUTx. S=
etting
> > > this bit does not effect the CLK_OUTx if you are using the CAR to dri=
ve the
> > > pin. The simplest thing to do for Tegra210 is to always set the
> > > CLKx_ACCEPT_REQ. =

> > > =

> > =

> > So resend with that bit also set?
> > =

> =

> We haven't figured out who should set this bit as it has some other
> side-effects like overriding the pinmux settings. Also not all CLK_OUT
> clocks appear to behave the same way.
> =


Ok! Thanks for letting me know.

