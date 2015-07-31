Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 30 Jul 2015 23:26:03 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Liviu Dudau <Liviu.Dudau@arm.com>,
	Punit Agrawal <Punit.Agrawal@arm.com>,
	"Jon Medhurst (Tixy)" <tixy@linaro.org>,
	Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@kernel.org>,
	Mike Turquette <mturquette@baylibre.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v5 3/8] clk: add support for clocks provided by
 SCP(System Control Processor)
Message-ID: <20150731062603.GT3159@codeaurora.org>
References: <1437649828-14540-1-git-send-email-sudeep.holla@arm.com>
 <1437649828-14540-4-git-send-email-sudeep.holla@arm.com>
 <55B90F5B.9070100@codeaurora.org>
 <55B9EA6B.70403@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <55B9EA6B.70403@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/30, Sudeep Holla wrote:
> 
> 
> On 29/07/15 18:37, Stephen Boyd wrote:
> >On 07/23/2015 04:10 AM, Sudeep Holla wrote:
> >>On some ARM based systems, a separate Cortex-M based System Control
> >>Processor(SCP) provides the overall power, clock, reset and system
> >>control. System Control and Power Interface(SCPI) Message Protocol
> >>is defined for the communication between the Application Cores(AP)
> >>and the SCP.
> >>
> >>This patch adds support for the clocks provided by SCP using SCPI
> >>protocol.
> >>
> >>Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> >>Cc: Mike Turquette <mturquette@baylibre.com>
> >>Cc: Stephen Boyd <sboyd@codeaurora.org>
> >>Cc: Liviu Dudau <Liviu.Dudau@arm.com>
> >>Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> >>Cc: Jon Medhurst (Tixy) <tixy@linaro.org>
> >>Cc: linux-clk@vger.kernel.org
> >
> >Looks good to me, modulo one comment.
> >
> >Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
> >
> 
> Thanks, I assume you are fine if this gets merged via arm-soc

Yes that's fine.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
