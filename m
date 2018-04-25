Return-Path: <s.nawrocki@samsung.com>
Subject: Re: [PATCH 05/61] clk: samsung: simplify getting .drvdata
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	kernel-janitors@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof
	Kozlowski <krzk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo
	Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <215c52b1-3044-8dd9-c021-dc2b8ff78afe@samsung.com>
Date: Wed, 25 Apr 2018 14:49:52 +0200
MIME-version: 1.0
In-reply-to: <20180419140641.27926-6-wsa+renesas@sang-engineering.com>
Content-type: text/plain; charset="utf-8"
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
	<CGME20180419140651epcas5p22119a061c760dd54c0c3e630b053ec1b@epcas5p2.samsung.com>
	<20180419140641.27926-6-wsa+renesas@sang-engineering.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/19/2018 04:05 PM, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Patch applied, thanks!
