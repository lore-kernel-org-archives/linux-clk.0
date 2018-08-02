Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180724164221.3307-8-digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20180724164221.3307-1-digetx@gmail.com>
 <20180724164221.3307-8-digetx@gmail.com>
Message-ID: <153324339043.10763.5630011710766819511@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v5 7/8] clk: tegra20: Check whether direct PLLM sourcing is
 turned off for EMC
Date: Thu, 02 Aug 2018 13:56:30 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Dmitry Osipenko (2018-07-24 09:42:20)
> Ensure that direct PLLM sourcing is turned off for EMC as we don't support
> that configuration in the clk driver.
> =

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
