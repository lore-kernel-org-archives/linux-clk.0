Return-Path: <digetx@gmail.com>
Return-Path: <digetx@gmail.com>
Subject: Re: [PATCH v1 3/4] clk: tegra20: Turn EMC clock gate into divider
To: Stephen Boyd <sboyd@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20180530150646.19030-1-digetx@gmail.com>
 <20180530150646.19030-4-digetx@gmail.com>
 <152792144851.225090.7409061495035612435@swboyd.mtv.corp.google.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7bed6350-b6ee-1d79-39f5-bf0db2c2b102@gmail.com>
Date: Sat, 2 Jun 2018 14:00:18 +0300
MIME-Version: 1.0
In-Reply-To: <152792144851.225090.7409061495035612435@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 02.06.2018 09:37, Stephen Boyd wrote:
> Quoting Dmitry Osipenko (2018-05-30 08:06:45)
>> Kernel should never gate the EMC clock as it causes immediate lockup, so
>> removing clk-gate functionality doesn't affect anything. Turning EMC clk
>> gate into divider allows to implement glitch-less EMC scaling, avoiding
>> reparenting to a backup clock.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Looks ok to me, but I'm waiting for someone from Tegra side to ack it or
> review it.
> 

I've already prepared v2 with some minor cleanups and additional clk patch. For
now waiting for Peter's review comments to v1.
