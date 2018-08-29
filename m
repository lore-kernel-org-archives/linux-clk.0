Return-Path: <Akshu.Agrawal@amd.com>
Subject: Re: [PATCH] clk: x86: Set default parent to 48Mhz
To: Stephen Boyd <sboyd@kernel.org>
Cc: djkurtz@chromium.org, Alexander.Deucher@amd.com,
 Michael Turquette <mturquette@baylibre.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <1534834341-18345-1-git-send-email-akshu.agrawal@amd.com>
 <153549535306.129321.6563896874769936616@swboyd.mtv.corp.google.com>
From: "Agrawal, Akshu" <Akshu.Agrawal@amd.com>
Message-ID: <bf082f4f-04bf-30bd-bd0e-04cb113cd261@amd.com>
Date: Wed, 29 Aug 2018 09:54:31 +0530
MIME-Version: 1.0
In-Reply-To: <153549535306.129321.6563896874769936616@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Return-Path: Akshu.Agrawal@amd.com
List-ID: <linux-clk.vger.kernel.org>



On 8/29/2018 3:59 AM, Stephen Boyd wrote:
> Quoting Akshu Agrawal (2018-08-20 23:51:57)
>> System clk provided in ST soc can be set to:
>> 48Mhz, non-spread
>> 25Mhz, spread
>> To get accurate rate, we need it to set it at non-spread
>> option which is 48Mhz.
>>
>> Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
> 
> Does this need to go to 4.18 stable trees? I don't see a fixes tag so
> I'm trying to understand merge priority of this patch.
> 
Yes, and its a fix, as it fixes the in accuracy in the bclk which is
derived from this clk.

Thanks,
Akshu
