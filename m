Return-Path: <digetx@gmail.com>
Return-Path: <digetx@gmail.com>
Subject: Re: [PATCH v2 1/2] clk: tegra: Mark HCLK, SCLK, EMC, MC and PLL_P
 outputs as critical
To: Michael Turquette <mturquette@baylibre.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@codeaurora.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <10b27ad57c959b6a87f339cc2237cfe45865771d.1513655733.git.digetx@gmail.com>
 <151371340146.45969.1875712520168365873@resonance>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6e09f1cb-cb89-55a5-b7ea-52cb9f0efaf2@gmail.com>
Date: Tue, 19 Dec 2017 23:20:56 +0300
MIME-Version: 1.0
In-Reply-To: <151371340146.45969.1875712520168365873@resonance>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 19.12.2017 22:56, Michael Turquette wrote:
> Quoting Dmitry Osipenko (2017-12-18 19:59:06)
>> Machine dies if HCLK, SCLK or EMC is disabled, hence mark these clocks
>> as critical. Currently some of drivers do not manage clocks properly,
>> expecting clocks to be 'always enabled', these clocks are MC and PLL_P
>> outputs. Let's mark MC or PLL_P outputs as critical for now and revert
>> this change once drivers would be corrected.
> 
> Are the drivers that do not manage their clocks correctly merged
> upstream? If so can we fix those drivers instead of marking clocks as
> critical?

All the drivers are in upstream for a quite long time already. We should be able
to correct them, but I haven't tried yet.

> If not can we annotate the flags below with a comment stating to remove
> the critical clock flag once the consumer driver gets a clue?
I'll try to take a look at how much effort it would take to correct the drivers
during the next few days and will send v3 with either the comment being added or
'always enabled' clocks being dropped from the patch.
