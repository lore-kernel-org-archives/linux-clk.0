Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Saravanan Sekar <sravanhome@gmail.com>, afaerber@suse.de,
 manivannan.sadhasivam@linaro.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180703092524.1697111-4-sravanhome@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@cubietech.com,
 sravanhome@gmail.com, support@cubietech.com, catalin.marinas@arm.com,
 mturquette@baylibre.com, will.deacon@arm.com, linux-kernel@vger.kernel.org,
 thomas.liau@actions-semi.com, darren@cubietech.com, robh+dt@kernel.org,
 jeff.chen@actions-semi.com, pn@denx.de, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com
References: <20180703092524.1697111-1-sravanhome@gmail.com>
 <20180703092524.1697111-4-sravanhome@gmail.com>
Message-ID: <153090281264.143105.2922773144286373098@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 3/5] clk: actions: Add REGMAP as dependency
Date: Fri, 06 Jul 2018 11:46:52 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Saravanan Sekar (2018-07-03 02:25:22)
> Add REGMAP as dependency to avoid undefined reference to regmap symbol
> =

> Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>

Fixes tag? This should come earlier in the series, or even at the
beginning.
