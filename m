Return-Path: <sboyd@codeaurora.org>
Date: Thu, 4 Jun 2015 11:52:59 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Bill Huang <bilhuang@nvidia.com>,
	Paul Walmsley <pwalmsley@nvidia.com>, Jim Lin <jilin@nvidia.com>,
	Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 14/21] clk: tegra: pll: Adjust vco_min if SDM present
Message-ID: <20150604185259.GA676@codeaurora.org>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
 <1431451444-23155-16-git-send-email-rklein@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1431451444-23155-16-git-send-email-rklein@nvidia.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/12, Rhyland Klein wrote:
> From: Bill Huang <bilhuang@nvidia.com>
> 
> This code makes use of the SDM fractional divider if present to
> contrain the allowable programming range of the PLL divider register

s/contrain/constrain/

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
