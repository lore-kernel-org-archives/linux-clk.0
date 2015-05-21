Return-Path: <jcmvbkbc@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20150521181435.GA21195@codeaurora.org>
References: <1432218373.27793.0.camel@ingics.com>
	<20150521181435.GA21195@codeaurora.org>
Date: Thu, 21 May 2015 21:35:50 +0300
Message-ID: <CAMo8Bf+C1J6nBh-K4VXn=tzvOGhW1s=CgZNfMV+GSi--Fjh2nA@mail.gmail.com>
Subject: Re: [PATCH] clk: cdce706: Add missing of_clk_del_provider call in cdce706_remove
From: Max Filippov <jcmvbkbc@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Axel Lin <axel.lin@ingics.com>, Mike Turquette <mturquette@linaro.org>,
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, May 21, 2015 at 9:14 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 05/21, Axel Lin wrote:
>> Remove a previously registered clock provider when unload the module.
>>
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>> ---
>
> What about all the clocks that are registered? Don't those need
> to be unregistered as well?

They're registered with devm_clk_register, should be managed automatically.

-- 
Thanks.
-- Max
