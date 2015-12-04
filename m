Return-Path: <sudeep.holla@arm.com>
Subject: Re: clk: scpi: Fix checking return value of
 platform_device_register_simple()
To: Axel Lin <axel.lin@ingics.com>, Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <1449211896.14226.2.camel@ingics.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-clk@vger.kernel.org
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <56616311.9050208@arm.com>
Date: Fri, 4 Dec 2015 09:55:29 +0000
MIME-Version: 1.0
In-Reply-To: <1449211896.14226.2.camel@ingics.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen, Mike,

Can you pick up this fix for your next pull request ?

On 04/12/15 06:51, Axel Lin wrote:
> platform_device_register_simple() returns ERR_PTR on error.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep
