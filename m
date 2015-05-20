Return-Path: <sboyd@codeaurora.org>
Date: Wed, 20 May 2015 16:45:58 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, Liviu Dudau <Liviu.Dudau@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	"Jon Medhurst (Tixy)" <tixy@linaro.org>,
	Mike Turquette <mturquette@linaro.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: scpi: add support for cpufreq virtual device
Message-ID: <20150520234558.GB31753@codeaurora.org>
References: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com>
 <1430134846-24320-4-git-send-email-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1430134846-24320-4-git-send-email-sudeep.holla@arm.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/27, Sudeep Holla wrote:
> The clocks for the CPUs are provided by SCP and are managed by this
> clock driver. So the cpufreq device needs to be added only after the
> clock get registered and removed when this driver is unloaded.
> 
> This patch manages the cpufreq virtual device based on the clock
> availability.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

The cpufreq device can't handle probe defer? I suppose we do it
this way because we need to create a platform device somewhere
and this is the best place to do so?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
