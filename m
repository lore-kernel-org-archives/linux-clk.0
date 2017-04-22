Return-Path: <arndbergmann@gmail.com>
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20170422015820.GZ7065@codeaurora.org>
References: <20170419174507.4055014-1-arnd@arndb.de> <7f0c996e-df53-ffb7-2c02-2f7fa66d2b94@ti.com>
 <20170422015820.GZ7065@codeaurora.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 22 Apr 2017 14:08:19 +0200
Message-ID: <CAK8P3a0CYxRqX-eNrsFCc_BotVodgR7zZ1i3jLefpst_yj7umw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: ti: divider: try to fix ti_clk_register_divider
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Tero Kristo <t-kristo@ti.com>, Michael Turquette <mturquette@baylibre.com>,
	Tony Lindgren <tony@atomide.com>, Keerthy <j-keerthy@ti.com>, linux-omap@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sat, Apr 22, 2017 at 3:58 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 04/20, Tero Kristo wrote:
>> On 19/04/17 20:44, Arnd Bergmann wrote:
>> The failing piece of code is only executed for legacy boot mode
>> OMAP3 right now, which could be potentially stripped out of the
>> kernel already (I think Tony removed the support for non-DT boot
>> OMAP3 boards already...?) This explains why I didn't notice the
>> issue in my local testing either.
>>
>> >
>> >Fixes: d96f774b2538 ("clk: ti: divider: add support for legacy divider init")
>> >Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>
>> So, this patch itself is fine, but the desc should be updated to
>> reflect the above somehow.
>>
>> And the "Fixes:" line should be updated to point to the commit
>> mentioned above also.
>>
>
> Waiting for Arnd to agree. I can also rename reg_setup to reg.

Yes, it would be great if you could update the patch description that way
so I don't have to send a new version. Thanks,

     Arnd
