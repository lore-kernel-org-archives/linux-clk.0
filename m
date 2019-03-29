Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AD3C43381
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 14:08:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 525DA2183F
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 14:08:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=factor-ts.ru header.i=@factor-ts.ru header.b="A81Ueufi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbfC2OIW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 10:08:22 -0400
Received: from dionis-sg.factor-ts.ru ([194.154.76.132]:41362 "EHLO
        factor-ts.ru" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728713AbfC2OIW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 29 Mar 2019 10:08:22 -0400
X-Greylist: delayed 538 seconds by postgrey-1.27 at vger.kernel.org; Fri, 29 Mar 2019 10:08:21 EDT
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=factor-ts.ru; s=10;
        t=1553867957; bh=Uk9h2aT126VleGP2vO4WR9OduQXn15XdMX/0vpeCHow=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=A81Ueufi/D71uPafZUWFnxstuRZd8qLjaWgMkneC4Mplys286fedfPY2IzuzF5sFj
         rmTHDn0Lm48RRmXieciSzlD1GmAceBF2wa8pMag4LQtIK6nobhzR3hymGi0sJT/UP6
         TFEsKoeyF+oyXyyVv4gF9/9FLK9oJkjSIG/kS4wo=
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>,
        "Fujinaka, Todd" <todd.fujinaka@intel.com>,
        "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "e1000-devel@lists.sf.net" <e1000-devel@lists.sf.net>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <9B4A1B1917080E46B64F07F2989DADD69AF4DDE7@ORSMSX115.amr.corp.intel.com>
 <0d0b97cc-2871-6a81-11ad-4dbb8a6b652e@redhat.com>
 <20190327164748.GO9224@smile.fi.intel.com>
 <907ab1ec-ae46-a678-4f0e-87af5069f2eb@gmx.ch>
 <20190327191925.GP9224@smile.fi.intel.com>
 <5dd6a6ac-94de-07ad-df5a-2601cbc7e9d0@gmx.ch>
 <20190328145827.GI9224@smile.fi.intel.com>
 <e01bb9da-0dde-4bfa-5693-eb4c02a1d696@redhat.com>
 <20190328152421.GJ9224@smile.fi.intel.com>
 <26800a0e-c309-1e69-c5b4-e11b761c7b40@redhat.com>
 <20190328154931.GK9224@smile.fi.intel.com>
 <d4c44bc8-ae0c-a6ff-3042-ae3185ceb33e@redhat.com>
From:   =?UTF-8?B?0KHQtdC80LXQvSDQktC10YDRh9C10L3QutC+?= 
        <semverchenko@factor-ts.ru>
Message-ID: <ef893b2e-121a-d395-9843-47d0c9f1515a@factor-ts.ru>
Date:   Fri, 29 Mar 2019 16:59:17 +0300
MIME-Version: 1.0
In-Reply-To: <d4c44bc8-ae0c-a6ff-3042-ae3185ceb33e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US-large
X-MailScanner-ID: 4F18B23E8003.A04DC
X-MailScanner: Found to be clean
X-MailScanner-From: semverchenko@factor-ts.ru
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 29.03.2019 15:30, Hans de Goede wrote:
> Hi,
>
> On 3/28/19 4:49 PM, Andy Shevchenko wrote:
>> On Thu, Mar 28, 2019 at 04:32:27PM +0100, Hans de Goede wrote:
>>> On 28-03-19 16:24, Andy Shevchenko wrote:
>>>> On Thu, Mar 28, 2019 at 04:01:37PM +0100, Hans de Goede wrote:
>>>>> On 28-03-19 15:58, Andy Shevchenko wrote:
>>>>>> On Thu, Mar 28, 2019 at 03:35:58PM +0100, David Müller wrote:
>>>>>>> Andy Shevchenko wrote:
>>>>>>>> On Wed, Mar 27, 2019 at 06:31:19PM +0100, David Müller wrote:
>>
>>>>>>>> Any driver for device which is using PMC clock should take it into
>>>>>>>> consideration.
>>>>>>>
>>>>>>> I agree that each driver should properly request the clocks and 
>>>>>>> other
>>>>>>> resources needed.
>>
>>>>>> Can you elaborate a bit more the case you are talking about?
>>
>>>>> I think the board with igb ethernet controllers might
>>>>> just as well be handled the same way (I already checked it has usable
>>>>> DMI identifying info).
>>>>
>>>> But am I right that in the case of igb we will loose power at 
>>>> suspend? Wouldn't
>>>> be better to patch the driver?
>>>
>>> This is an industrial embedded PC, so it is not running on battery and
>>> I doubt it typically spends a lot of time in suspend at all.
>>
>> Okay, but still from logical point of view wouldn't be better to fix 
>> the driver
>> for such case? At least I see benefits out of this approach: a) less 
>> hackish,
>> less quirk code; b) if this happens on non-industrial case it would 
>> be better
>> to have in the driver due to power consumption.
>
> Maybe, I guess we first need to figure out which platforms clock(s) is 
> (are)
> being used, if there is more then one; or it is a different one then 
> in the
> realtek ethernet case it might be better to go with the dmi quirk option.
>
> Semyon Verchenko can you (as root) run the following command on a kernel
> where the ethernet does work:
>
> grep . /sys/kernel/debug/clk/pmc_plt_clk_?/flags
>
> And then email us the output please?
>
> Regards,
>
> Hans
>
I don't have flags files in /sys/kernel/debug/clk/pmc_plt_clk_?; did you 
mean clk_flags?

[root@archatom ~]# grep . /sys/kernel/debug/clk/pmc_plt_clk_?/flags
grep: /sys/kernel/debug/clk/pmc_plt_clk_?/flags: No such file or directory
[root@archatom ~]# grep . /sys/kernel/debug/clk/pmc_plt_clk_?/clk_flags
/sys/kernel/debug/clk/pmc_plt_clk_0/clk_flags:CLK_IS_CRITICAL
/sys/kernel/debug/clk/pmc_plt_clk_1/clk_flags:CLK_IS_CRITICAL
/sys/kernel/debug/clk/pmc_plt_clk_2/clk_flags:CLK_IS_CRITICAL
/sys/kernel/debug/clk/pmc_plt_clk_3/clk_flags:CLK_IS_CRITICAL
[root@archatom ~]# ls /sys/kernel/debug/clk
clk_dump         clk_orphan_summary  pll            pmc_plt_clk_1 
pmc_plt_clk_3  pmc_plt_clk_5
clk_orphan_dump  clk_summary         pmc_plt_clk_0  pmc_plt_clk_2 
pmc_plt_clk_4  xtal

Kernel is 5.0.4 with commit 648e921888ad ("clk: x86: Stop marking clocks 
as CLK_IS_CRITICAL") reversed, is it enough or I need to install older 
kernel?

