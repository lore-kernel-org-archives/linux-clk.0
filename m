Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB9EC001DC
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 10:29:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233553AbjG0K3K (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 06:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231978AbjG0K2Z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 06:28:25 -0400
Received: from out-87.mta0.migadu.com (out-87.mta0.migadu.com [91.218.175.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0703B1FF3
        for <linux-clk@vger.kernel.org>; Thu, 27 Jul 2023 03:28:20 -0700 (PDT)
Message-ID: <fd03a5f4-151a-bc7d-429c-c045745da523@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1690453697;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cdNMArdaFWVI5SKSPm1vQyJoyF/bmKiSh+QjqHSwJY0=;
        b=NriIWc+uIleh+ze4o2J+UOpT04I4WThX6gf3dXAI8lj9M09YHk1OVVkXck++hhTRBTGk8E
        4eD11Z3y+oNLibSGtUV+HnOmq1OsvnARyeqfL2Wx9+gW02TZ+HZXRAkKi1tB/Rw4BihKB4
        GLLXJpQFGs6Ro14ZLlvr9uCoX7+GCBs=
Date:   Thu, 27 Jul 2023 11:28:12 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 09/11] ice: implement dpll interface to control cgu
Content-Language: en-US
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Jiri Pirko <jiri@resnulli.us>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     Jonathan Lemon <jonathan.lemon@gmail.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Bart Van Assche <bvanassche@acm.org>
References: <ZLo0ujuLMF2NrMog@nanopsycho>
 <DM6PR11MB46576153E0E28BA4C283A30A9B3FA@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZLpzwMQrqp7mIMFF@nanopsycho>
 <DM6PR11MB46579CC7E6D314BFDE47E4EE9B3FA@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZLqoMhxHq3m4dp1u@nanopsycho>
 <DM6PR11MB46571D843FB903AC050E2F129B3FA@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZLt5GPRls7UL4zGx@nanopsycho>
 <DM6PR11MB465713389A234771BD29DF149B02A@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZL+B48Om/cf61/Vq@nanopsycho>
 <DM6PR11MB465734F6AD226A39DE8574419B03A@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZMC/TRSYqMQ57Rf7@nanopsycho>
 <DM6PR11MB46576A241EA1519BC559B5C09B00A@DM6PR11MB4657.namprd11.prod.outlook.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <DM6PR11MB46576A241EA1519BC559B5C09B00A@DM6PR11MB4657.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/07/2023 22:11, Kubalewski, Arkadiusz wrote:
>> From: Jiri Pirko <jiri@resnulli.us>
>> Sent: Wednesday, July 26, 2023 8:38 AM
>>
> 
> [...]
>   
>>>>>>>
>>>>>>> Just to make it clear:
>>>>>>>
>>>>>>> AUTOMATIC:
>>>>>>> - inputs monitored, validated, phase measurements available
>>>>>>> - possible states: unlocked, locked, locked-ho-acq, holdover
>>>>>>>
>>>>>>> FREERUN:
>>>>>>> - inputs not monitored, not validated, no phase measurements available
>>>>>>> - possible states: unlocked
>>>>>>
>>>>>> This is your implementation of DPLL. Others may have it done
>>>>>> differently. But the fact the input is monitored or not, does not make
>>>>>> any difference from user perspective.
>>>>>>
>>>>>> When he has automatic mode and does:
>>>>>> 1) disconnect all pins
>>>>>> 2) reset state    (however you implement it in the driver is totaly up
>>>>>> 		   to the device, you may go to your freerun dpll mode
>>>>>> 		   internally and to automatic back, up to you)
>>>>>> -> state will go to unlocked
>>>>>>
>>>>>> The behaviour is exactly the same, without any special mode.
>>>>>
>>>>> In this case there is special reset button, which doesn't exist in
>>>>> reality, actually your suggestion to go into FREERUN and back to AUTOMATIC
>>>>> to pretend the some kind of reset has happened, where in reality dpll went
>>>>> to
>>>>> FREERUN and AUTOMATIC.
>>>>
>>>> There are 3 pin states:
>>>> disconnected
>>>> connected
>>>> selectable
>>>>
>>>> When the last source disconnects, go to your internal freerun.
>>>> When some source gets selectable or connected, go to your internal
>>>> automatic mode.
>>>>
>>>
>>> This would make the driver to check if all the sources are disconnected
>>> each time someone disconnects a source. Which in first place is not
>>> efficient, but also dpll design already allows different driver instances
>>> to
>>> control separated sources, which in this case would force a driver to
>>> implement
>>> additional communication between the instances just to allow such hidden
>>> FREERUN mode.
>>> Which seems another argument not to do this in the way you are proposing:
>>> inefficient and unnecessarily complicated.
>>>
>>> We know that you could also implement FREERUN mode by disconnecting all
>>> the
>>> sources, even if HW doesn't support it explicitly.
>>>
>>> >From user perspactive, the mode didn't change.
>>>>
>>>
>>> The user didn't change the mode, the mode shall not change.
>>> You wrote to do it silently, so user didn't change the mode but it would
>> have
>>> changed, and we would have pretended the different working mode of DPLL
>> doesn't
>>> exist.
>>>
>>> >From user perepective, this is exacly the behaviour he requested.
>>>>
>>>
>>> IMHO this is wrong and comes from the definition of pin state DISCONNECTED,
>>> which is not sharp, for our HW means that the input will not be considered
>>> as valid input, but is not disconnecting anything, as input is still
>>> monitored and measured.
>>> Shall we have additional mode like PIN_STATE_NOT_SELECTABLE? As it is not
>>> possible to actually disconnect a pin..
>>>
>>>>
>>>>> For me it seems it seems like unnecessary complication of user's life.
>>>>> The idea of FREERUN mode is to run dpll on its system clock, so all the
>>>>> "external" dpll sources shall be disconnected when dpll is in FREERUN.
>>>>
>>>> Yes, that is when you set all pins to disconnect. no mode change needed.
>>>>
>>>
>>> We don't disconnect anything, we used a pin state DISCONNECTED as this
>>> seemed
>>> most appropriate.
>>>
>>>>
>>>>> Let's assume your HW doesn't have a FREERUN, can't you just create it by
>>>>> disconnecting all the sources?
>>>>
>>>> Yep, that's what we do.
>>>>
>>>
>>> No, you were saying that the mode doesn't exist and that your hardware
>>> doesn't
>>> support it. At the same time it can be achieved by manually disconnecting
>>> all
>>> the sources.
>>>
>>>>
>>>>> BTW, what chip are you using on mlx5 for this?
>>>>> I don't understand why the user would have to mangle state of all the pins
>>>>> just
>>>>> to stop dpll's work if he could just go into FREERUN and voila. Also what
>>>>> if
>>>>> user doesn't want change the configuration of the pins at all, and he just
>>>>> want
>>>>> to desynchronize it's dpll for i.e. testing reason.
>>>>
>>>> I tried to explain multiple times. Let the user have clean an abstracted
>>>> api, with clear semantics. Simple as that. Your internal freerun mode is
>>>> just something to abstract out, it is not needed to expose it.
>>>>
>>>
>>> Our hardware can support in total 4 modes, and 2 are now supported in ice.
>>> I don't get the idea for abstraction of hardware switches, modes or
>>> capabilities, and having those somehow achievable through different
>>> functionalities.
>>>
>>> I think we already discussed this long enough to make a decision..
>>> Though I am not convinced by your arguments, and you are not convinced by
>>> mine.
>>>
>>> Perhaps someone else could step in and cut the rope, so we could go further
>>> with this?
>>
>> Or, even better, please drop this for the initial patchset and have this
>> as a follow-up. Thanks!
>>
>>
> 
> On the responses from Jakub and Paolo, they supported the idea of having
> such mode.
> 
> Although Jakub have asked if there could be better name then FREERUN, also
> suggested DETACHED and STANDALONE.
> For me DETACHED seems pretty good, STANDALONE a bit too far..
> I am biased by the FREERUN from chip docs and don't have strong opinion
> on any of those..
> 
> Any suggestions?

It looks like we have a kind of split-brain situation, and my thoughts 
are following:
Even though right now we don't have any hardware supporting 
freerun/standalone mode, I do really like the idea to have it. It will 
be used in monitoring implementations where we refer to internal 
oscillator (Rb/Cs) as a source of truth to compare with the signal on 
the other pins. We can name it DETACHED if it sounds better.

> 
> Thank you!
> Arkadiusz
> 
> [...]

