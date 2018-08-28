Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180828154433.5693-3-robh@kernel.org>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20180828154433.5693-1-robh@kernel.org>
 <20180828154433.5693-3-robh@kernel.org>
Message-ID: <153549455575.129321.22566359378173086@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2] clk: Convert to using %pOFn instead of device_node.name
Date: Tue, 28 Aug 2018 15:15:55 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Rob Herring (2018-08-28 08:44:29)
> In preparation to remove the node name pointer from struct device_node,
> convert printf users to use the %pOFn format specifier.
> =

> Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
