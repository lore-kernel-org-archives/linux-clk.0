Return-Path: <sudeep.holla@arm.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org,
 Sudeep Holla <sudeep.holla@arm.com>, Jolly Shah <jollys@xilinx.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 0/2] drivers: clk: Add ZynqMP clock driver support
To: Jolly Shah <jolly.shah@xilinx.com>, michal.simek@xilinx.com,
 linux-clk@vger.kernel.org
References: <1515449797-5629-1-git-send-email-jollys@xilinx.com>
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <6004ad81-96f1-34d9-a037-2c355720dc08@arm.com>
Date: Thu, 11 Jan 2018 10:54:39 +0000
MIME-Version: 1.0
In-Reply-To: <1515449797-5629-1-git-send-email-jollys@xilinx.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>



On 08/01/18 22:16, Jolly Shah wrote:
> Add clock driver for ZynqMP
> 

Can you post the complete series in one set for easy of review. It's
currently broken into *6 - 8* different sets by different authors and
it's extremely hard to get the full view of how these pieces are
connected and extremely misleading. Can someone post them collectively
as you would already have it if you are doing some testing building on
each patch set.

IIUC mailbox is used for all the communication, right ?
If so, to start with just have 2 series one for mailbox/transport and
another for the whole protocol(eemi?) and users of it.

-- 
Regards,
Sudeep
