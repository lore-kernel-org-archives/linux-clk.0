Return-Path: <sudeep.holla@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@codeaurora.org" <sboyd@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC PATCH 0/2] drivers: clk: Add ZynqMP clock driver support
To: Jolly Shah <JOLLYS@xilinx.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <1515449797-5629-1-git-send-email-jollys@xilinx.com>
 <6004ad81-96f1-34d9-a037-2c355720dc08@arm.com>
 <DM2PR0201MB0767E1E08918BED4CB06DB20B8160@DM2PR0201MB0767.namprd02.prod.outlook.com>
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <bb8d1c16-f10e-5e5e-8a7b-54851e5d9de7@arm.com>
Date: Fri, 12 Jan 2018 11:47:08 +0000
MIME-Version: 1.0
In-Reply-To: <DM2PR0201MB0767E1E08918BED4CB06DB20B8160@DM2PR0201MB0767.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>



On 11/01/18 20:29, Jolly Shah wrote:
> Hi Sudeep,
> 
> There are 3 things:
> 
> 1> IPI mailbox transport - series is already posted
> https://patchwork.kernel.org/patch/10145795/
> 2> EEMI - Posted by me below
> https://patchwork.kernel.org/patch/10150665/
> 3> EEMI Users
> Currently posted as RFC as they are dependent on #2.
> OK, can #2 and #3 can be put together until initial review ?

> #2 doesn’t use mailbox so it is a posted as a separate series. 

OK, does it use smc ? If so, the point is treat it as smc mailbox
so that smc is just a transport and EEMI can be still used with other
transport technically.

-- 
Regards,
Sudeep
