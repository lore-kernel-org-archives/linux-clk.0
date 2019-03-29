Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A991BC43381
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 04:52:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7912A217F5
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 04:52:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbfC2Ewv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 00:52:51 -0400
Received: from mail.i8u.org ([75.148.87.25]:21088 "EHLO chris.i8u.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725861AbfC2Ewu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 29 Mar 2019 00:52:50 -0400
X-Greylist: delayed 382 seconds by postgrey-1.27 at vger.kernel.org; Fri, 29 Mar 2019 00:52:50 EDT
Received: by chris.i8u.org (Postfix, from userid 1000)
        id 6CC5816C9926; Thu, 28 Mar 2019 21:46:26 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by chris.i8u.org (Postfix) with ESMTP id 6B14216C9493;
        Thu, 28 Mar 2019 21:46:26 -0700 (PDT)
Date:   Thu, 28 Mar 2019 21:46:26 -0700 (PDT)
From:   Hisashi T Fujinaka <htodd@twofifty.com>
X-X-Sender: htodd@chris.i8u.org
Reply-To: todd.fujinaka@intel.com
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc:     Hans de Goede <hdegoede@redhat.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "e1000-devel@lists.sf.net" <e1000-devel@lists.sf.net>,
        linux-clk@vger.kernel.org
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
In-Reply-To: <20190328154931.GK9224@smile.fi.intel.com>
Message-ID: <alpine.NEB.2.21.9999.1903282138420.979@chris.i8u.org>
References: <9B4A1B1917080E46B64F07F2989DADD69AF4DDE7@ORSMSX115.amr.corp.intel.com> <0d0b97cc-2871-6a81-11ad-4dbb8a6b652e@redhat.com> <20190327164748.GO9224@smile.fi.intel.com> <907ab1ec-ae46-a678-4f0e-87af5069f2eb@gmx.ch> <20190327191925.GP9224@smile.fi.intel.com>
 <5dd6a6ac-94de-07ad-df5a-2601cbc7e9d0@gmx.ch> <20190328145827.GI9224@smile.fi.intel.com> <e01bb9da-0dde-4bfa-5693-eb4c02a1d696@redhat.com> <20190328152421.GJ9224@smile.fi.intel.com> <26800a0e-c309-1e69-c5b4-e11b761c7b40@redhat.com>
 <20190328154931.GK9224@smile.fi.intel.com>
User-Agent: Alpine 2.21.9999 (NEB 324 2019-01-20)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 28 Mar 2019, Andy Shevchenko wrote:

> On Thu, Mar 28, 2019 at 04:32:27PM +0100, Hans de Goede wrote:
>> On 28-03-19 16:24, Andy Shevchenko wrote:
>>> On Thu, Mar 28, 2019 at 04:01:37PM +0100, Hans de Goede wrote:
>>>> On 28-03-19 15:58, Andy Shevchenko wrote:
>>>>> On Thu, Mar 28, 2019 at 03:35:58PM +0100, David M?ller wrote:
>>>>>> Andy Shevchenko wrote:
>>>>>>> On Wed, Mar 27, 2019 at 06:31:19PM +0100, David M?ller wrote:
>
>>>>>>> Any driver for device which is using PMC clock should take it into
>>>>>>> consideration.
>>>>>>
>>>>>> I agree that each driver should properly request the clocks and other
>>>>>> resources needed.
>
>>>>> Can you elaborate a bit more the case you are talking about?
>
>>>> I think the board with igb ethernet controllers might
>>>> just as well be handled the same way (I already checked it has usable
>>>> DMI identifying info).
>>>
>>> But am I right that in the case of igb we will loose power at suspend? Wouldn't
>>> be better to patch the driver?
>>
>> This is an industrial embedded PC, so it is not running on battery and
>> I doubt it typically spends a lot of time in suspend at all.
>
> Okay, but still from logical point of view wouldn't be better to fix the driver
> for such case? At least I see benefits out of this approach: a) less hackish,
> less quirk code; b) if this happens on non-industrial case it would be better
> to have in the driver due to power consumption.

Sorry for replying from home. It's either that or top-posting with
Outlook.

It sounds to me like Andriy's arguments are counter to what he suggests
since we'd have to fix the USB and the Ethernet and that would add more
special case code, right? However, I'm just the old igb bug fixer and
not a clock guy, and I've spent little time outside of the Ethernet
drivers.

It really sounded like there were going to be changes to the clock code
that would resolve the issue. Were those done? Do I still need to change
the igb driver to change the clocks used?

-- 
Todd Fujinaka <todd.fujinaka@intel.com>

