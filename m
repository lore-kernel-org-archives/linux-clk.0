Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55B90F5B.9070100@codeaurora.org>
Date: Wed, 29 Jul 2015 10:37:31 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Sudeep Holla <sudeep.holla@arm.com>
CC: linux-kernel@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
	Punit Agrawal <punit.agrawal@arm.com>,
	"Jon Medhurst (Tixy)" <tixy@linaro.org>,
	Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@kernel.org>,
	Mike Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 3/8] clk: add support for clocks provided by SCP(System
 Control Processor)
References: <1437649828-14540-1-git-send-email-sudeep.holla@arm.com> <1437649828-14540-4-git-send-email-sudeep.holla@arm.com>
In-Reply-To: <1437649828-14540-4-git-send-email-sudeep.holla@arm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/23/2015 04:10 AM, Sudeep Holla wrote:
> On some ARM based systems, a separate Cortex-M based System Control
> Processor(SCP) provides the overall power, clock, reset and system
> control. System Control and Power Interface(SCPI) Message Protocol
> is defined for the communication between the Application Cores(AP)
> and the SCP.
>
> This patch adds support for the clocks provided by SCP using SCPI
> protocol.
>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Mike Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Jon Medhurst (Tixy) <tixy@linaro.org>
> Cc: linux-clk@vger.kernel.org

Looks good to me, modulo one comment.

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

> +
> +static const struct of_device_id scpi_clocks_ids[] = {
> +	{ .compatible = "arm,scpi-clocks", },
> +	{}
> +};

Did you want a MODULE_DEVICE_TABLE() here?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

