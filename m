Return-Path: <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] clk: x86: Do not gate clocks enabled by the firmware
To: Darren Hart <dvhart@infradead.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>
References: <20170710203801.17496-1-carlo@caione.org>
 <CAFqH_51Mje4tK494JRgb=wWJNU9zu=WZ1sS482kRAvRrPpLkXQ@mail.gmail.com>
 <20170710235403.GB25390@fury>
Cc: Carlo Caione <carlo@caione.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 Stephen Boyd <sboyd@codeaurora.org>, linux@endlessm.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Carlo Caione <carlo@endlessm.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1ac00dd5-038c-7ef7-44e7-4c95fea8042d@linux.intel.com>
Date: Mon, 24 Jul 2017 15:49:30 +0200
MIME-Version: 1.0
In-Reply-To: <20170710235403.GB25390@fury>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 7/11/17 1:54 AM, Darren Hart wrote:
> On Tue, Jul 11, 2017 at 12:31:28AM +0200, Enric Balletbo Serra wrote:
>> Hi,
>>
>> 2017-07-10 22:38 GMT+02:00 Carlo Caione <carlo@caione.org>:
>>> From: Carlo Caione <carlo@endlessm.com>
>>>
>>> Read the enable register to determine if the clock is already in use by
>>> the firmware. In this case avoid gating the clock.
>>>
>>> Signed-off-by: Carlo Caione <carlo@endlessm.com>
>>> ---
>>>  drivers/clk/x86/clk-pmc-atom.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom.c
>>> index 2b60577703ef..46a8b6216fca 100644
>>> --- a/drivers/clk/x86/clk-pmc-atom.c
>>> +++ b/drivers/clk/x86/clk-pmc-atom.c
>>> @@ -185,6 +185,9 @@ static struct clk_plt *plt_clk_register(struct platform_device *pdev, int id,
>>>         pclk->reg = base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZE;
>>>         spin_lock_init(&pclk->lock);
>>>
>>> +       if (plt_clk_is_enabled(&pclk->hw))
>>> +               init.flags |= CLK_IGNORE_UNUSED;
>>> +
>>>         ret = devm_clk_hw_register(&pdev->dev, &pclk->hw);
>>>         if (ret) {
>>>                 pclk = ERR_PTR(ret);
>>> --
>>> 2.13.2
>>>
>>
>> It also fixes the issue introduced in commit 282a4e4 ("platform/x86:
>> Enable Atom PMC platform clocks") that causes no audio on Baytrail.
>>
>> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
> Excellent, thank you Enric. Pierre, any objections to this going in to
> 4.13 now and stable back to 4.12?

I saw an update of this patch being merged while I was away on an 
extended summer break, but out of curiosity what was the problem with no 
audio on Baytrail? the code was added precisely to add support for 19.2 
MHz on Baytrail and finally solve audio issues. I have no reports of 
broken functionality with this 282a4e4 commit... Enric, do you have a 
bugzilla or pointers?
