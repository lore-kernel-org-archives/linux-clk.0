Return-Path: <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/2] clk: aspeed: Fix is_enabled and prevent reset if
 clock enabled
To: Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org, joel@jms.id.au, mturquette@baylibre.com,
        mine260309@gmail.com, ryan_chen@aspeedtech.com
References: <1520542640-9185-1-git-send-email-eajames@linux.vnet.ibm.com>
 <152064250369.205167.5918389143946901453@swboyd.mtv.corp.google.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 14 Mar 2018 14:11:42 -0500
MIME-Version: 1.0
In-Reply-To: <152064250369.205167.5918389143946901453@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Message-Id: <b137a12a-82d9-2e5d-8408-f743162d1628@linux.vnet.ibm.com>
List-ID: <linux-clk.vger.kernel.org>



On 03/09/2018 06:41 PM, Stephen Boyd wrote:
> Quoting Eddie James (2018-03-08 12:57:18)
>> Here are two fixes for the Aspeed clock driver. The first fixes the is_enabled
>> clock function to account for different clock gates getting disabled with
>> either 0s or 1s. The second patch addresses some issue found with the LPC
>> controller clock if it gets reset while the clock is enabled, which it is by
>> default. Thanks to Lei Yu for tracking down the LPC issue.
>>
> Can you please add some "Fixes:" tags to these patches? Or just indicate
> the tags and I can pick them up. If it doesn't happen, I'll just apply
> these early next week.

Sure, sorry for the late response...

Patch 1 fixes 6671507f0fbd582b4003f837ab791d03ade8e0f4
Patch 2 fixes 15ed8ce5f84e2b3718690915dbee12ebd497dc0f

Thanks!
Eddie

>
