Return-Path: <sergej@taudac.com>
Subject: Re: [RFC PATCH v1] clk: si5351: Rename internal plls to avoid name
 collisions
To: Stephen Boyd <sboyd@codeaurora.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 Rabeeh Khoury <rabeeh@solid-run.com>
References: <1501017662-9239-1-git-send-email-sergej@taudac.com>
 <20171012225135.GG18706@codeaurora.org>
From: Sergej Sawazki <sergej@taudac.com>
Message-ID: <cc9554f5-4843-4f8e-7cb5-814b151605d3@taudac.com>
Date: Sat, 14 Oct 2017 11:12:57 +0200
MIME-Version: 1.0
In-Reply-To: <20171012225135.GG18706@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Am 13.10.2017 um 00:51 schrieb Stephen Boyd:
> On 07/25, Sergej Sawazki wrote:
>> This drivers probe fails due to a clock name collision if a clock named
>> 'plla' or 'pllb' is already registered when registering this drivers
>> internal plls.
>>
>> Fix it by renaming internal plls to avoid name collisions.

> 
> Is this needed still? I was expecting Sebastian to review.
> 

Yes, it is still needed. Can't use the driver on raspberry pi due to a
name collision -- clock names "plla, pllb, plls, plld, pllh" already
used.

Sergej
