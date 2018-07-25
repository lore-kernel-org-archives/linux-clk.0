Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731681AbeGYX6p (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 25 Jul 2018 19:58:45 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Stephen Boyd <sboyd@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        thierry.reding@gmail.com
References: <1532010175-28364-1-git-send-email-pdeschrijver@nvidia.com>
 <1532010175-28364-3-git-send-email-pdeschrijver@nvidia.com>
 <b34c2624-7a55-331e-4462-bb3265f411b5@nvidia.com>
In-Reply-To: <b34c2624-7a55-331e-4462-bb3265f411b5@nvidia.com>
Message-ID: <153255869581.48062.10244129990637940083@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 2/2] clk: tegra: Correct clk_out_mux parents
Date: Wed, 25 Jul 2018 15:44:55 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Jon Hunter (2018-07-19 08:06:50)
> =

> On 19/07/18 15:22, Peter De Schrijver wrote:
> > The first 3 possible parents of clk_out_[1-3] are defined as clk_m, clk=
_m/2
> > and clk_m/4. However They are actually osc, osc/2 and osc/4. In chips p=
rior
> > to Tegra210 clk_m and osc had the same frequency, so this difference di=
dn't
> > matter. Since Tegra210 however, clk_m is a divided version of osc. This
> > results in CCF reporting the rate as only half the actual rate on Tegra=
210.
> > To fix this, we add new clocks which have osc, osc/2, osc/4 and the
> > respective extern clock as their possible parents and use them for
> > Tegra210. Also 2 new DT clock defines are added to reflect the new
> > names of clk_m/2 and clk_m/4. The old defines are still kept for backwa=
rds
> > compatibility.
> > =

> > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> I gave this a whirl on the Tegra210 Smaug which uses the PMC CLK_OUT1 to
> clock the audio codec, but unfortunately this did not work. The good news
> is that I know why. Basically, for Tegra210 there is a slight change in t=
he
> behaviour of the CLKx_ACCEPT_REQ bit. Essentially, this bit must always be
> set if you want to use any of the osc clocks to drive the CLK_OUTx. Setti=
ng
> this bit does not effect the CLK_OUTx if you are using the CAR to drive t=
he
> pin. The simplest thing to do for Tegra210 is to always set the
> CLKx_ACCEPT_REQ. =

> =


So resend with that bit also set?

