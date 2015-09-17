Return-Path: <vinceh@nvidia.com>
Message-ID: <55FA1496.7000003@nvidia.com>
Date: Thu, 17 Sep 2015 09:17:10 +0800
From: Vince Hsu <vinceh@nvidia.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
	<mturquette@baylibre.com>, <swarren@wwwdotorg.org>,
	<thierry.reding@gmail.com>, <gnurou@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Vince Hsu
	<vince.h@nvidia.com>
Subject: Re: [PATCH] clk: tegra: dfll: add missing rcu_read_unlock() for error
 path
References: <1442384094-22144-1-git-send-email-vinceh@nvidia.com> <20150916221531.GN23081@codeaurora.org>
In-Reply-To: <20150916221531.GN23081@codeaurora.org>
Return-Path: vinceh@nvidia.com
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 09/17/2015 06:15 AM, Stephen Boyd wrote:
> On 09/16, Vince Hsu wrote:
>> From: Vince Hsu <vince.h@nvidia.com>
>>
>> The commit e770940218028c6a5927fda45f2ca9db5d9b35e0 ("clk: tegra: dfll:
>> Properly protect OPP list") added the rcu_read_{lock,unlock} but missed
>> one in the error path. So add the missing one.
>>
>> Signed-off-by: Vince Hsu <vince.h@nvidia.com>
>> ---
> I think we'll just squash this into the original patch from
> Thierry.
Sure. Thanks!

Vince
