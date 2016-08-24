Return-Path: <arvind.yadav.cs@gmail.com>
Return-Path: <arvind.yadav.cs@gmail.com>
Subject: Re: [v.1] clk:clk-rockchip:-of_iomap failed to remap then abort clock
 initialization.
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
References: <1471101978-1881-1-git-send-email-arvind.yadav.cs@gmail.com>
 <1528160.BtdbmuP27T@diego>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: arvind Yadav <arvind.yadav.cs@gmail.com>
Message-ID: <fa254e23-818c-0698-cbbc-68c983e83203@gmail.com>
Date: Wed, 24 Aug 2016 19:52:45 +0530
MIME-Version: 1.0
In-Reply-To: <1528160.BtdbmuP27T@diego>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

yes, I am referring this code for clock control.

--Arvind


On Tuesday 23 August 2016 09:45 PM, Heiko Stübner wrote:
> Hi Arvind,
>
> Am Samstag, 13. August 2016, 20:56:18 schrieb Arvind Yadav:
>> -check return of 'of_iomap'.if It's falied to remap then abort.
>>
>> -Unmap a region obtained by remap. iounmap frees the mapping when failed
>> to allocate the memory.
>>
>> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
>> ---
>>   drivers/clk/rockchip/clk-rockchip.c | 7 ++++++-
> I've applied the patch, after rewording both patch subject and message [0].
>
> That driver is deprecated for quite some time, see
> Documenation/devicetree/bindings/clock/rockchip.txt - so I'm hoping this is
> more of a random find and you're not actually using it?
>
>
> Thanks
> Heiko
>
> [0] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=023a8280b8355a0aebe094299afec8d8b7b264cd
>
