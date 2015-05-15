Return-Path: <sebastian.hesselbarth@gmail.com>
Return-Path: <sebastian.hesselbarth@gmail.com>
Message-ID: <5555BB7F.2090602@gmail.com>
Date: Fri, 15 May 2015 11:25:19 +0200
From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
To: Michael Turquette <mturquette@linaro.org>,
 Sergej Sawazki <ce3a@gmx.de>,
 sboyd@codeaurora.org, mwelling@ieee.org, moinejf@free.fr
CC: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: si5351: Multisynth 6-7 fixes
References: <1431333859-7224-1-git-send-email-ce3a@gmx.de> <20150512233834.16410.23856@quantum>
In-Reply-To: <20150512233834.16410.23856@quantum>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 13.05.2015 01:38, Michael Turquette wrote:
> Quoting Sergej Sawazki (2015-05-11 01:44:19)
>> The second synthesis stage in the Si5351 clock generator consists of six
>> *fractional* multisynth dividers (MS0 .. MS5) and two *even-integer*
>> dividers (MS6 and MS7). The current si5351 driver implementation does
>> not handle MS6 and MS7 correctly, this leads to wrong rates on output 6
>> and 7. This patch series fixes that.
>>
>> Patch 1 fixes the divider calculation for multisynth 6 and 7.
>>
>> Patch 2 fixes the divider re-calculation for multisynth 6 and 7.
>>
>> Info: Base on branch 'clk-fixes'.
>>
>> Sergej Sawazki (2):
>>    clk: si5351: fix .round_rate for multisynth 6-7
>>    clk: si5351: fix .recalc_rate for multisynth 6-7
>
> Applied both patches to clk-next.

Sergei,

next time please _always_ keep the version numbering on your patches,
IIRC it should be v3 and it should include the changelog history.

Also, I sent a Reviewed-by for at least the .round_rate callback
patch. It would be nice if you'd include that into resends of your
patch to help Mike keeping track of those.

Sebastian
