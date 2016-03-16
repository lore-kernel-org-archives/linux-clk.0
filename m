Return-Path: <slash.tmp@free.fr>
Subject: Re: [PATCH] clk: sunxi: Remove use of VLAIS
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-clk <linux-clk@vger.kernel.org>
References: <20160226194830.GA21652@lukather>
 <1456878048-23393-1-git-send-email-sboyd@codeaurora.org>
 <CAGb2v65TZh0uBD-WEURP6znxx0t427UBk4gLDpMMPUJ3vbc99Q@mail.gmail.com>
 <20160303191604.GW24999@codeaurora.org> <20160304152711.GR8418@lukather>
 <20160304171841.GF24999@codeaurora.org> <20160308221320.GI8418@lukather>
 <20160315221601.GJ25972@codeaurora.org> <56E91EA4.7030603@free.fr>
 <20160316203018.GQ25972@codeaurora.org>
From: Mason <slash.tmp@free.fr>
Message-ID: <56E9C5C0.901@free.fr>
Date: Wed, 16 Mar 2016 21:44:48 +0100
MIME-Version: 1.0
In-Reply-To: <20160316203018.GQ25972@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-15
List-ID: <linux-clk.vger.kernel.org>

On 16/03/2016 21:30, Stephen Boyd wrote:
> On 03/16, Mason wrote:
>> On 15/03/2016 23:16, Stephen Boyd wrote:
>>>
>>> Applied to clk-next.
>>
>> For the record, I will state again that I find it quite sub-optimal
>> to resort to dynamic allocation for small temporary pointer arrays.
>>
>> A fortiori when one considers that getting the patch right required
>> several attempts.
> 
> Feel free to send the patch and then we can discuss and test. For
> the record, I was waiting for Maxime or Chen-Yu to speak up if
> they would prefer that approach, but nothing happened. Usually
> patches spur discussions better than comments.

While I didn't provide a formal patch, I did outline the two
lines that needed to be changed (and it is obvious that the
behavior is strictly equivalent to the VLA solution, as long
as num_parents < 8).

I do agree with you that, considering the silence from the
driver's maintainers, they probably don't care which solution
is adopted.

I will remember to post an actual patch next time.

Regards.
