Return-Path: <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 5/7] clk: tegra: don't warn for PLL defaults
 unnecessarily
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad
	<pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>,
	"Thierry Reding" <thierry.reding@gmail.com>, Alexandre Courbot
	<gnurou@gmail.com>, "Rob Herring" <robh+dt@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, "Rhyland Klein" <rklein@nvidia.com>,
	<linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <1487846686-6388-1-git-send-email-pdeschrijver@nvidia.com>
 <1487846686-6388-6-git-send-email-pdeschrijver@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <d6435129-4c67-1126-429d-ffef52d0b2d4@nvidia.com>
Date: Thu, 23 Mar 2017 14:37:23 +0000
MIME-Version: 1.0
In-Reply-To: <1487846686-6388-6-git-send-email-pdeschrijver@nvidia.com>
Return-Path: jonathanh@nvidia.com
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>

Hi Peter,

On 23/02/17 10:44, Peter De Schrijver wrote:
> If the PLL is on, only warn if the defaults are not yet set. Otherwise be
> silent.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>

This patch is breaking boot for Tegra210 Smaug on -next [0]. Reverting
this on top of -next allows the board to boot again. I have not had
chance to dig into this any further yet, but can unless you have some
thoughts.

Cheers
Jon

[0]
https://nvtb.github.io//linux-next/test_next-20170323/20170323021534/boot/tegra210-smaug/tegra210-smaug/defconfig_log.txt

-- 
nvpublic
