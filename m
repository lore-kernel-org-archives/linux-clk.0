Return-Path: <digetx@gmail.com>
Return-Path: <digetx@gmail.com>
Subject: Re: [PATCH] clk: tegra: Return the exact clock rate from
 clk_round_rate
To: ryang <decatf@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180921220149.17136-1-decatf@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f669ff16-cb4a-614f-de3c-2585d91f2b57@gmail.com>
Date: Mon, 24 Sep 2018 19:51:26 +0300
MIME-Version: 1.0
In-Reply-To: <20180921220149.17136-1-decatf@gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 9/22/18 1:01 AM, ryang wrote:
> The current behavior is that clk_round_rate would return the same clock
> rate passed to it for valid PLL configurations. This change will return
> the exact rate the PLL will provide in accordance with clk API.
> 
> Signed-off-by: ryang <decatf@gmail.com>

A minor comment.. [0] require a real name, it's not even obvious whether
you're "Ryan G" or "R Yang".

[0]
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#developer-s-certificate-of-origin-1-1
