Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.133]:48172 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751139AbcHQIQM (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 17 Aug 2016 04:16:12 -0400
Subject: Re: [PATCH] clk: core: Force setting the phase delay when no change
To: Jean-Francois Moine <moinejf@free.fr>
References: <20160813164656.DD30A61A06@smtp.codeaurora.org>
 <20160815182959.GV361@codeaurora.org>
 <7e871c7e-d7fb-92f4-aacc-092c67a1ec1f@rock-chips.com>
 <20160817083438.8c7f336e76bc12205e71e13d@free.fr>
Cc: shawn.lin@rock-chips.com, Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	=?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <63bc0953-9c64-e7f5-3938-6ecf894c893e@rock-chips.com>
Date: Wed, 17 Aug 2016 16:15:57 +0800
MIME-Version: 1.0
In-Reply-To: <20160817083438.8c7f336e76bc12205e71e13d@free.fr>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

+ Heiko

On 2016/8/17 14:34, Jean-Francois Moine wrote:
> On Wed, 17 Aug 2016 09:00:05 +0800
> Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
>> On 2016/8/16 2:29, Stephen Boyd wrote:
>>> On 08/13, Jean-Francois Moine wrote:
>>>> The hardware phase delay may depend on some other settings as clock
>>>> reparenting, so, it has to be set each time.
>>>> Also, when the delay was the same as previously, an error was returned.
>>>>
>>>> Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
>>>> ---
>>>
>>> This effectively reverts commit 023bd7166be0 (clk: skip
>>> unnecessary set_phase if nothing to do, 2016-02-26), so I'd like
>>> to see if Shawn has any comments or if that patch was just a
>>> broken optimization.
>>>
>>> We may want to go another route and get the phase from the
>>> hardware and compare that to what's requested. That way we don't
>>> set the phase again unnecessarily.
>>>
>>
>> Sorry for late response.
>>
>> If the client calls clk_set_phase to set the same phase ,
>> why it needs to reparent as *this* parent already support this phase and
>> we don't need to do it again?
>>
>> For some reasons we have to reparent the clock, it should be sub clock
>> drivers' responsibility to guarantee that we can maintain/restore the
>> topology structure no matter for rate or for phase. But it shouldn't
>> make the callers/users be aware of what was happening.
>>
>> How do you nofify them that "Oh, reparent now, please call
>> clk_set_phase again" ? :)
>>
>> Plz correct me if my understanding is wrong.
>
> Shawn,
>
> Maybe this problem is Allwinner specific.
>
> In their SoCs, the phase delays 0..360° must be translated to a
> hardware shift 0..7 which depends on the ratio of of the rates of the
> clock and its father. When reparenting the clock, the ratio may change
> and, with a same phase delay, the hardware shift may have to be

So when reparenting the clock, could you update the clk->core->phase
as well to match the real phase using?

> changed. As the phase delay is always set after setting the clock,
> setting the clock hardware in all cases solves the possible mismatch.
>
> Now, the problem I had is a bit different: in some devices (MMCs) of
> some Allwinner SoCs, and under some conditions, the hardware phase
> delay may be set directly in the client instead of in the clock.

You mean Allwinner mmc driver hardcode the setting of clk phasse instead
of calling clk API? Looks strange to me...

> Only the clock knows when this capability is used, so the clock must
> alert the client that this one has to set the phase delay or not.
> I solved this required synchronization by returning a specific error
> code when the clock does not set the phase delay on its side.
> This mechanism works fine when the set_phase() callback function of the
> clock is always called, even with a same delay.
>
> In the Allwinner's SoCs, setting the hardware phase delay asks for only
> a few machine instructions, so, the overhead is very small.
> If this is not the case for other machines, it could be simple enough
> to move the test of same delay to the clock drivers of these machines...

I understand it now but it's a trick but not a legit way to solve your
problem from my view.

>


-- 
Best Regards
Shawn Lin

