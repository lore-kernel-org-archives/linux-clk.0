Return-Path: <paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Mon, 26 Jun 2017 15:34:38 +0200
From: Paul Cercueil <paul@crapouillou.net>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Michael Turquette
 <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Paul Burton
 <paul.burton@imgtec.com>, Maarten ter Huurne <maarten@treewalker.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@linux-mips.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 01/17] clk: ingenic: Use const pointer to clk_ops in
 struct
In-Reply-To: <20170621215038.GG4493@codeaurora.org>
References: <20170607200439.24450-2-paul@crapouillou.net>
 <20170620151855.19399-1-paul@crapouillou.net>
 <20170621215038.GG4493@codeaurora.org>
Message-ID: <580231557b0447d9019a20ac99292938@crapouillou.net>
List-ID: <linux-clk.vger.kernel.org>

Hi,

Le 2017-06-21 23:50, Stephen Boyd a écrit :
> On 06/20, Paul Cercueil wrote:
>> The CGU common code does not modify the pointed clk_ops structure, so 
>> it
>> should be marked as const.
>> 
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
> 
> How did you want to merge this series? I can ack clk patches if
> you like, or apply the clk patches to the clk tree.

The clk patches refer to CONFIG_MACH_JZ4770 in the Kconfig, so they 
indirectly depend on the other patches. I think it's better that you ack 
them then.
