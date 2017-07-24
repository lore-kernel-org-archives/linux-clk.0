Return-Path: <eballetbo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d92350f4-8bb3-85cb-4c2b-a44ab794c29a@linux.intel.com>
References: <20170710203801.17496-1-carlo@caione.org> <CAFqH_51Mje4tK494JRgb=wWJNU9zu=WZ1sS482kRAvRrPpLkXQ@mail.gmail.com>
 <20170710235403.GB25390@fury> <1ac00dd5-038c-7ef7-44e7-4c95fea8042d@linux.intel.com>
 <1500904960.29303.204.camel@linux.intel.com> <d92350f4-8bb3-85cb-4c2b-a44ab794c29a@linux.intel.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 24 Jul 2017 17:02:58 +0200
Message-ID: <CAFqH_52ZaQ=JP==wAgsa3FKLZi0N4+PCMdYUBBL-nvKkoLDKMA@mail.gmail.com>
Subject: Re: [PATCH] clk: x86: Do not gate clocks enabled by the firmware
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>,
	Carlo Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>, linux@endlessm.com,
	Carlo Caione <carlo@endlessm.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

2017-07-24 16:07 GMT+02:00 Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com>:
> On 7/24/17 4:02 PM, Andy Shevchenko wrote:
>>
>> On Mon, 2017-07-24 at 15:49 +0200, Pierre-Louis Bossart wrote:
>>>
>>> On 7/11/17 1:54 AM, Darren Hart wrote:
>>>>
>>>> On Tue, Jul 11, 2017 at 12:31:28AM +0200, Enric Balletbo Serra
>>>> wrote:
>>
>>
>>>>> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>>
>>>>
>>>> Excellent, thank you Enric. Pierre, any objections to this going in
>>>> to
>>>> 4.13 now and stable back to 4.12?
>>>
>>>
>>> I saw an update of this patch being merged while I was away on an
>>> extended summer break, but out of curiosity what was the problem with
>>> no
>>> audio on Baytrail? the code was added precisely to add support for
>>> 19.2
>>> MHz on Baytrail and finally solve audio issues. I have no reports of
>>> broken functionality with this 282a4e4 commit... Enric, do you have a
>>> bugzilla or pointers?
>>
>>
>> TL;DR: We should respect firmware settings before blindly shut down
>> "unused" resources. (We used to have similar stuff in GPIO/pinctrl
>> driver for direct IRQ pins, where we shut up the pins which are used
>> directly by IOAPIC)
>
>
> I wasn't arguing against those patches, just curious as to which platforms
> were broken by setting pmc_plat_3 blindly in the driver.
>

After your patch the clock framework disables the required clocks
because the driver does not request then and audio stopped to
work.This is not the solution as is the codec who *must* request these
clocks. We should implement this in the codec driver.. But now, at
least, if firmware enables the clocks audio continues working on
Baytrail.

Regards,
 Enric
