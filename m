Return-Path: <zhang.lyra@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20171205232854.GC4283@codeaurora.org>
References: <20171121092438.19316-1-chunyan.zhang@spreadtrum.com> <20171205232854.GC4283@codeaurora.org>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 6 Dec 2017 15:51:35 +0800
Message-ID: <CAAfSe-vVptmOYy_DpEuxTE9Oy0YXiJkWt5yXkNCipzGi9dPETw@mail.gmail.com>
Subject: Re: [PATCH V2] clk: fix a panic error caused by accessing NULL pointer
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Chunyan Zhang <chunyan.zhang@spreadtrum.com>,
	Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Cai Li <cai.li@spreadtrum.com>,
	Orson Zhai <orson.zhai@spreadtrum.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On 6 December 2017 at 07:28, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 11/21, Chunyan Zhang wrote:
>> From: Cai Li <cai.li@spreadtrum.com>
>>
>> In some cases the clock parent would be set NULL when doing re-parent,
>> it will cause a NULL pointer accessing if clk_set trace event is
>> enabled.
>>
>> This patch sets the parent as "none" if the input parameter is NULL.
>>
>> Fixes: dfc202ead312 (clk: Add tracepoints for hardware operations)
>> Signed-off-by: Cai Li <cai.li@spreadtrum.com>
>> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
>> ---
>
> Applied to clk-fixes

Thanks!

Chunyan

>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
