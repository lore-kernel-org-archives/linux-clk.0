Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55B7578D.10306@arm.com>
Date: Tue, 28 Jul 2015 11:21:01 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
MIME-Version: 1.0
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sudeep Holla <Sudeep.Holla@arm.com>,
	Liviu Dudau <Liviu.Dudau@arm.com>,
	Punit Agrawal <Punit.Agrawal@arm.com>,
	"Jon Medhurst (Tixy)" <tixy@linaro.org>,
	Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v5 3/8] clk: add support for clocks provided by SCP(System
 Control Processor)
References: <1437649828-14540-1-git-send-email-sudeep.holla@arm.com> <1437649828-14540-4-git-send-email-sudeep.holla@arm.com>
In-Reply-To: <1437649828-14540-4-git-send-email-sudeep.holla@arm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen/Mike,

On 23/07/15 12:10, Sudeep Holla wrote:
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

Can one of you provide ACK if this patch looks fine, so that I can take 
this series via ARM-SoC ?

Regards,
Sudeep
