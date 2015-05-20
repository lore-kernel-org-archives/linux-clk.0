Return-Path: <rklein@nvidia.com>
Message-ID: <555CC20E.8030907@nvidia.com>
Date: Wed, 20 May 2015 13:19:10 -0400
From: Rhyland Klein <rklein@nvidia.com>
MIME-Version: 1.0
To: Benson Leung <bleung@chromium.org>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette
	<mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd
	<sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre
 Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Paul Walmsley
	<pwalmsley@nvidia.com>, Jim Lin <jilin@nvidia.com>,
	<linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 17/21] clk: tegra: pll: Add logic for SS
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>	<1431451444-23155-19-git-send-email-rklein@nvidia.com> <CANLzEks10KmCAx4tK0oSejJ6Z+oBRS2+pcsktvStQrogCarTJQ@mail.gmail.com>
In-Reply-To: <CANLzEks10KmCAx4tK0oSejJ6Z+oBRS2+pcsktvStQrogCarTJQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On 5/13/2015 8:25 PM, Benson Leung wrote:
> On Tue, May 12, 2015 at 10:24 AM, Rhyland Klein <rklein@nvidia.com> wrote:
>> +static void pll_clk_start_ss(struct tegra_clk_pll *pll)
>> +{
>> +       if (pll->params->defaults_set && pll->params->ssc_ctrl_en_mask) {
> 
> Is there any reason you're checking for the existence of
> ssc_ctrl_en_mask rather than ssc_ctrl_reg?

Not particularly, just a way of seeing if ssc is supported by this pll,
I will change it to check the register to be more consistent with other
checks in the code.

-rhyland

-- 
nvpublic
