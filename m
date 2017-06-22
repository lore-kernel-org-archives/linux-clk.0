Return-Path: <t-kristo@ti.com>
Subject: Re: [PATCH] clk: keystone: TI_SCI_PROTOCOL is needed for clk driver
To: Stephen Boyd <sboyd@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>
CC: Santosh Shilimkar <ssantosh@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20170620201249.145468-1-arnd@arndb.de>
 <20170621215053.GH4493@codeaurora.org>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <c5b9e51f-4c16-6cdd-0b84-dd372d1e7982@ti.com>
Date: Thu, 22 Jun 2017 09:09:09 +0300
MIME-Version: 1.0
In-Reply-To: <20170621215053.GH4493@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 22/06/17 00:50, Stephen Boyd wrote:
> On 06/20, Arnd Bergmann wrote:
>> CONFIG_COMPILE_TEST allows building a configuration without
>> TI_SCI_PROTOCOL, which then fails to link:
>>
>> drivers/clk/keystone/sci-clk.o: In function `ti_sci_clk_probe':
>> sci-clk.c:(.text.ti_sci_clk_probe+0x4c): undefined reference to `devm_ti_sci_get_handle'
>>
>> This makes it a hard dependency. Right now, that means we can't
>> actually compile-test the driver unless ARCH_KEYSTONE is set as
>> well, but we can fix that by allowing TI_MESSAGE_MANAGER to
>> be selected for COMPILE_TEST as well.
>>
>> Fixes: b745c0794e2f ("clk: keystone: Add sci-clk driver support")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>
> 
> Looks ok to me. Tero?
> 

Yeah, looks okay to me also, been traveling so sorry about the latency.

Acked-by: Tero Kristo <t-kristo@ti.com>
