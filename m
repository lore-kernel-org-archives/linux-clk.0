Return-Path: <kernel@martin.sperl.org>
Subject: Re: [PATCH 1/2] clk: bcm2835: expose raw clock-registers via debugfs
To: Eric Anholt <eric@anholt.net>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
 Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <1456755616-2472-1-git-send-email-kernel@martin.sperl.org>
 <1456755616-2472-2-git-send-email-kernel@martin.sperl.org>
 <87k2ln5k09.fsf@eliezer.anholt.net>
From: Martin Sperl <kernel@martin.sperl.org>
Message-ID: <56D59998.8060301@martin.sperl.org>
Date: Tue, 1 Mar 2016 14:31:04 +0100
MIME-Version: 1.0
In-Reply-To: <87k2ln5k09.fsf@eliezer.anholt.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 29.02.2016 21:39, Eric Anholt wrote:
> kernel@martin.sperl.org writes:
>
>> From: Martin Sperl <kernel@martin.sperl.org>
>>
>> For debugging purposes under some circumstance
>> it helps to be able to see the actual clock registers.
>>
>> E.g: when looking at the clock divider it is helpful to
>> see what the actual clock divider is.
>>
>> This patch exposes all the clock registers specific to each
>> clock/pll/pll-divider via debugfs.
>>
>> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
>
> This one definitely seems useful to me.  I think the debugfs bits need
> to be under #ifdef CONFIG_DEBUG_FS though.
>
> With that fixed,
>
> Acked-by: Eric Anholt <eric@anholt.net>
>
Note that include/linux/debugfs.h contains such ifdef and generates
dummy code like this:
static inline struct dentry *debugfs_create_regset32(const char *name,
                                    umode_t mode, struct dentry *parent,
                                    struct debugfs_regset32 *regset)
{
         return ERR_PTR(-ENODEV);
}
(see also Documentation/filesystem/debugfs.txt )

On the other hand the clock framework calls debug_init only
if debugfs is enabled.

So all the code is essentially "dead" when debugfs is disabled.

I assume I will not ifdef this just in case.

Thanks, Martin
