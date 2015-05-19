Return-Path: <Vladimir_Zapolskiy@mentor.com>
Message-ID: <555B9D7A.7040105@mentor.com>
Date: Tue, 19 May 2015 23:30:50 +0300
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette
	<mturquette@linaro.org>
CC: <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: fix output format of debugfs/clk_dump
References: <1432050130-12612-1-git-send-email-vladimir_zapolskiy@mentor.com> <555B9C93.7030002@codeaurora.org>
In-Reply-To: <555B9C93.7030002@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On 19.05.2015 23:26, Stephen Boyd wrote:
> On 05/19/15 08:42, Vladimir Zapolskiy wrote:
>> The output format of $(cat /sys/kernel/debug/clk/clk_dump) was
>> compliant to JSON and Python dictionary type some time ago, but at the
>> moment a couple of commas are missing, fix it.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> 
> Isn't this already fixed in clk-next with 7cb81136d2ef (clk: Fix JSON
> output in debugfs, 2015-04-29)?
> 

Ah, great, I overlooked it, thank you for pointing it out, please ignore
my change.

--
With best wishes,
Vladimir
