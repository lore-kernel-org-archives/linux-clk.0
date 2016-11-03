Return-Path: <jonathanh@nvidia.com>
Subject: Re: [PATCH V3 1/6] clk: tegra: add TEGRA20_CLK_NOR to init table
To: Mirza Krak <mirza.krak@gmail.com>, <swarren@wwwdotorg.org>,
	<thierry.reding@gmail.com>
References: <1477576872-2665-1-git-send-email-mirza.krak@gmail.com>
 <1477576872-2665-2-git-send-email-mirza.krak@gmail.com>
CC: <gnurou@gmail.com>, <linux@armlinux.org.uk>, <pdeschrijver@nvidia.com>,
	<pgaikwad@nvidia.com>, <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<robh+dt@kernel.org>, <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <fb7b486b-aa2a-e2c2-cd41-c0ee934f9cf2@nvidia.com>
Date: Thu, 3 Nov 2016 13:45:39 +0000
MIME-Version: 1.0
In-Reply-To: <1477576872-2665-2-git-send-email-mirza.krak@gmail.com>
Return-Path: jonathanh@nvidia.com
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 27/10/16 15:01, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak@gmail.com>
>
> Add TEGRA20_CLK_NOR to init table and set default rate to 92 MHz which
> is max rate.
>
> The maximum rate value of 92 MHz is pulled from the downstream L4T
> kernel.
>
> Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
> Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Tested-on: Colibri T20/T30 on EvalBoard V3.x and GMI-Memory Board

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
