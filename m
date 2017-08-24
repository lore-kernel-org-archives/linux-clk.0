Return-Path: <sudeep.holla@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, julia.lawall@lip6.fr,
 lorenzo.pieralisi@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: versatile: make clk_ops const
To: Liviu Dudau <liviu.dudau@arm.com>, Bhumika Goyal <bhumirks@gmail.com>
References: <1503410786-25519-1-git-send-email-bhumirks@gmail.com>
 <20170824095442.GC11316@e110455-lin.cambridge.arm.com>
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <de0c14c4-cdd4-8e6f-6f47-d318f775938d@arm.com>
Date: Thu, 24 Aug 2017 11:20:19 +0100
MIME-Version: 1.0
In-Reply-To: <20170824095442.GC11316@e110455-lin.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>



On 24/08/17 10:54, Liviu Dudau wrote:
> On Tue, Aug 22, 2017 at 07:36:26PM +0530, Bhumika Goyal wrote:
>> Make this const as it is only stored in the const field of a
>> clk_init_data structure.
>>
>> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
> 
> Acked-by: Liviu Dudau <Liviu.Dudau@arm.com>
> 
> Thanks for the patch!
> 
> Sudeep, can you going to pick this up for 4.14?
> 

IIUC anything under drivers/clk is routed via clk tree.
I assume Mike/Stephen will pick this up.

-- 
Regards,
Sudeep
