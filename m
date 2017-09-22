Return-Path: <carlo@endlessm.com>
MIME-Version: 1.0
In-Reply-To: <20170922213614.GA10927@fury>
References: <20170714082356.28117-1-carlo@caione.org> <CAOQ7t2beu8CyHM1qR+DDt-BQXmFHoyJe8q_56qhkkYLM_o1upQ@mail.gmail.com>
 <ac99f461-798b-e245-232e-5e76c2de93b0@linux.intel.com> <58ef7321-a16d-8974-6a37-db473b6bf48e@linux.intel.com>
 <1505721917.25945.275.camel@linux.intel.com> <20170922213614.GA10927@fury>
From: Carlo Caione <carlo@endlessm.com>
Date: Fri, 22 Sep 2017 22:47:59 +0100
Message-ID: <CAL9uMOEeKz3Gjpo4v2AfXFE1SEbWYacKadvnqPVosGhu96oECA@mail.gmail.com>
Subject: Re: [PATCH v3] clk: x86: Do not gate clocks enabled by the firmware
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Carlo Caione <carlo@caione.org>,
	alan@linux.intel.com, Michael Turquette <mturquette@baylibre.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Linux Upstreaming Team <linux@endlessm.com>, Enric Balletbo Serra <eballetbo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Fri, Sep 22, 2017 at 10:36 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Mon, Sep 18, 2017 at 11:05:17AM +0300, Andy Shevchenko wrote:
>> On Thu, 2017-09-07 at 16:51 -0500, Pierre-Louis Bossart wrote:
>> >
>> >
>>
>> > >
>> > > Looks like the same code that was initially used as a reference for
>> > > support of PMC clocks in the clock framework, so now we have 2
>> > > drivers
>> > > programming the same PMC hardware, not so good. We'd probably have
>> > > to
>> > > move the atomisp driver to move to clk_get/prepare/enable instead
>> > > of
>> > > the old vlv2_clck_get?
>> >
>> > See attached an untested change to show the idea on moving to the clk
>> > API and get feedback (I am not a camera guy, just trying to help -
>> > compile-tested/checkpatch only).
>> > This code *should* enable the same functionality using existing hooks
>> > in
>> > the kernel (and handle the BYT/CHT clocking difference as a bonus).
>> > I am sure Andy will have plenty of comments :-)
>>
>> I have one comment: nice clean up!
>>
>> AtomISP is a *horrible* mess.
>>
>
> Pierre, will you be submitting this patch officially now that you have a
> tested-by?

Just to clarify that my tested-by was to assert that the fix proposed
by Pierre makes my system bootable again but I cannot say for sure if
the atomisp driver keeps working fine after that.


-- 
Carlo Caione  |  +39.340.80.30.096  |  Endless
