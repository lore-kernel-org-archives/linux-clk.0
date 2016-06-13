Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
Subject: Re: [Query]set clk rate must operate its coordinated clock
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>
References: <20160309152420.20de187a@xhacker>
 <20160311165152.4103.82090@quark.deferred.io> <2738343.ekabfXD0fs@diego>
Cc: Jisheng Zhang <jszhang@marvell.com>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 pi-cheng.chen@linaro.org
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <575ED857.2020008@linaro.org>
Date: Mon, 13 Jun 2016 18:59:19 +0300
MIME-Version: 1.0
In-Reply-To: <2738343.ekabfXD0fs@diego>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 06/06/2016 11:10 AM, Heiko Stübner wrote:
> Hi Mike,
> 
> Am Freitag, 11. März 2016, 08:51:52 schrieb Michael Turquette:
>> Quoting Jisheng Zhang (2016-03-08 23:24:20)
>>> I have the following clk case which I dunno the elegant solution:
>>>
>>>
>>> cpuclk have two parents: cpupll and refclk. When set the cpuclk freq, we
>>> have to set its parent's freq, I.E cpupll freq. But before changing the
>>> cpupll's freq, we should set its refclk as its parent firstly.
>>>
>>> AFAIK, this is a common case, I have seen such requirement in rockchip,
>>> samsung clk driver. They solve this by notifier, but as pointed out by
>>> Michael in
>>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/351565.ht
>>> ml
>>>
>>> "This is also a hack and it points towards some missing infrastructure in
>>> the clock framework."
>>>
>>> I also don't like the notifier solution, I believe the elegant solution
>>> could be using the coordinated clock infrastructure. So what's the status
>>> of this infrastructure? I can test, and I can even add some code to make
>>> it be ready to be merged if you guide me ;)
>>
>> Thanks for the email. I hope to finish that feature before ELC. I have
>> Cc'd Pi-Cheng Chen from Mediatek who is also interested in coordinated
>> clock rates.
> 
> pulling this up again, did this materialize yet? :-)
> 
> Because it looks like on Rockchip we're getting yet another clock that needs 
> special handling (set_rate needs to go through the trusted-firmware, while 
> reading stays the same) which might profit from that as well.
> 

Hi,
I am also interested in the CCR. Hopefully Mike will post some patches on
the list soon.

Regards,
Georgi
