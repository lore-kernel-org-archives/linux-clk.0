Return-Path: <digetx@gmail.com>
Return-Path: <digetx@gmail.com>
Subject: Re: [PATCH v1] clk: tegra20: Add 216 MHz entry for PLL_X
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <adc15215591018b4a35a7d64e065f81bb09e214e.1513018125.git.digetx@gmail.com>
 <20171212100200.GW32106@tbergstrom-lnx.Nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <508cb22d-42cb-d169-dbea-0073d7a4e034@gmail.com>
Date: Tue, 12 Dec 2017 15:08:08 +0300
MIME-Version: 1.0
In-Reply-To: <20171212100200.GW32106@tbergstrom-lnx.Nvidia.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 12.12.2017 13:02, Peter De Schrijver wrote:
> On Mon, Dec 11, 2017 at 09:50:09PM +0300, Dmitry Osipenko wrote:
>> The cpufreq driver uses 216 MHz as the lowest CPU clock frequency, but
>> clock driver doesn't provide that rate, so the requested clock is rounded
>> up to 312 MHz. Let's add entry for 216 MHz to match with cpufreq.
>>
> 
> This seems odd. If there's no table entry, _calc_rate should kick in and
> calculate the parameters for 216MHz. Any idea why this is not happening?

Actually, it is happening. Please ignore this patch.

If PLL's rate could be calculated, why do we need the predefined tables?
