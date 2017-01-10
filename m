Return-Path: <sboyd@codeaurora.org>
Date: Mon, 9 Jan 2017 16:08:43 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	webczat_200@poczta.onet.pl,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] clk: scpi: don't add cpufreq device if the scpi dvfs
 node is disabled
Message-ID: <20170110000843.GC17126@codeaurora.org>
References: <1483706070-12357-1-git-send-email-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1483706070-12357-1-git-send-email-sudeep.holla@arm.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/06, Sudeep Holla wrote:
> Currently we add the virtual cpufreq device unconditionally even when
> the SCPI DVFS clock provider node is disabled. This will cause cpufreq
> driver to throw errors when it gets initailised on boot/modprobe and
> also when the CPUs are hot-plugged back in.
> 
> This patch fixes the issue by adding the virtual cpufreq device only if
> the SCPI DVFS clock provider is available and registered.
> 
> Fixes: 9490f01e2471 ("clk: scpi: add support for cpufreq virtual device")
> Reported-by: Michał Zegan <webczat_200@poczta.onet.pl>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
