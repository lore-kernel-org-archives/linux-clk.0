Return-Path: <sboyd@codeaurora.org>
Date: Wed, 19 Apr 2017 09:27:54 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: arm-soc <arm@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 7/7] clk: spear: fix ADC clock definition on SPEAr600
Message-ID: <20170419162754.GE7065@codeaurora.org>
References: <1492433205-13376-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1492433205-13376-8-git-send-email-thomas.petazzoni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1492433205-13376-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/17, Thomas Petazzoni wrote:
> There is no SPEAr600 device named "adc". Instead, the description of the
> ADC was recently added to the Device Tree, and the device name is
> "d820b000.adc", so we should associate the ADC gatable clock to this
> device name.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
