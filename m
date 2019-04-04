Return-Path: <SRS0=Ee6+=SG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9752FC4360F
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 14:43:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C8232171F
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 14:43:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbfDDOnH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Apr 2019 10:43:07 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39723 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726888AbfDDOnH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Apr 2019 10:43:07 -0400
Received: by mail-wr1-f68.google.com with SMTP id j9so4133869wrn.6
        for <linux-clk@vger.kernel.org>; Thu, 04 Apr 2019 07:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=meGhI0Qy5pFFnmPl9gxhqXa7QE+NJ+emEGLAf90atFU=;
        b=eq4pkPWou0wZV24zla5+F51aTlb3fn7bzG+5lNwIdJC8X4WuGD/aleWa9gX0s9ffLX
         /UTetPqnbRSYcEIcqBShDA8zIjhu1bYhfOpPrV959ApvMSmRgOqN8Ht3dzsSzUTdS7I3
         /7XYSvHJcSP5RTzzCGVvltBOEgGhSYqX1sCvuc406pY8EL6bpAeQy70nqRV7UYX3aH5b
         K3S1t3BA/qkdpZDWX1df7sqmtHGax+BnZK7KQGZJ/2dvj6y7IGptiu6BcmvpnrsGI33m
         dOGPott419h/DlqkeH6+Zj6bq8RXyBW8oRC20zBANcYF6do1RsGID6JY9ICakFugN7+O
         8e8w==
X-Gm-Message-State: APjAAAXFz6KiPbrC8bZsgq0xNWid3yUKCeofsgQcy+TajH+/1yBIJ+2y
        dxhRFHADIou54SfCsJV1lnhTgeODhX8=
X-Google-Smtp-Source: APXvYqwdyZgrxiBYJj7ywySp794ca51/pnZ+twSq2FQdaBX0rBYe2lfqBd4w3HLZZDBiOH6TUWE02Q==
X-Received: by 2002:adf:deca:: with SMTP id i10mr4260963wrn.88.1554388985443;
        Thu, 04 Apr 2019 07:43:05 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id z84sm29918931wmg.24.2019.04.04.07.43.04
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 07:43:04 -0700 (PDT)
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?B?0KHQtdC80LXQvSDQktC10YDRh9C10L3QutC+?= 
        <semverchenko@factor-ts.ru>,
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
 <ef893b2e-121a-d395-9843-47d0c9f1515a@factor-ts.ru>
 <942808d6-e2c1-cc8c-4aed-9b44a7ce4c76@redhat.com>
Message-ID: <c5ebcf73-1706-48d8-6904-ae6a89c44151@redhat.com>
Date:   Thu, 4 Apr 2019 16:43:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <942808d6-e2c1-cc8c-4aed-9b44a7ce4c76@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 29-03-19 16:53, Hans de Goede wrote:
> Hi,
> 
> On 3/29/19 2:59 PM, Семен Верченко wrote:
>>
>> On 29.03.2019 15:30, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 3/28/19 4:49 PM, Andy Shevchenko wrote:
>>>> On Thu, Mar 28, 2019 at 04:32:27PM +0100, Hans de Goede wrote:
>>>>> On 28-03-19 16:24, Andy Shevchenko wrote:
>>>>>> On Thu, Mar 28, 2019 at 04:01:37PM +0100, Hans de Goede wrote:
>>>>>>> On 28-03-19 15:58, Andy Shevchenko wrote:
>>>>>>>> On Thu, Mar 28, 2019 at 03:35:58PM +0100, David Müller wrote:
>>>>>>>>> Andy Shevchenko wrote:
>>>>>>>>>> On Wed, Mar 27, 2019 at 06:31:19PM +0100, David Müller wrote:
>>>>
>>>>>>>>>> Any driver for device which is using PMC clock should take it into
>>>>>>>>>> consideration.
>>>>>>>>>
>>>>>>>>> I agree that each driver should properly request the clocks and other
>>>>>>>>> resources needed.
>>>>
>>>>>>>> Can you elaborate a bit more the case you are talking about?
>>>>
>>>>>>> I think the board with igb ethernet controllers might
>>>>>>> just as well be handled the same way (I already checked it has usable
>>>>>>> DMI identifying info).
>>>>>>
>>>>>> But am I right that in the case of igb we will loose power at suspend? Wouldn't
>>>>>> be better to patch the driver?
>>>>>
>>>>> This is an industrial embedded PC, so it is not running on battery and
>>>>> I doubt it typically spends a lot of time in suspend at all.
>>>>
>>>> Okay, but still from logical point of view wouldn't be better to fix the driver
>>>> for such case? At least I see benefits out of this approach: a) less hackish,
>>>> less quirk code; b) if this happens on non-industrial case it would be better
>>>> to have in the driver due to power consumption.
>>>
>>> Maybe, I guess we first need to figure out which platforms clock(s) is (are)
>>> being used, if there is more then one; or it is a different one then in the
>>> realtek ethernet case it might be better to go with the dmi quirk option.
>>>
>>> Semyon Verchenko can you (as root) run the following command on a kernel
>>> where the ethernet does work:
>>>
>>> grep . /sys/kernel/debug/clk/pmc_plt_clk_?/flags
>>>
>>> And then email us the output please?
>>>
>>> Regards,
>>>
>>> Hans
>>>
>> I don't have flags files in /sys/kernel/debug/clk/pmc_plt_clk_?; did you mean clk_flags?
>>
>> [root@archatom ~]# grep . /sys/kernel/debug/clk/pmc_plt_clk_?/flags
>> grep: /sys/kernel/debug/clk/pmc_plt_clk_?/flags: No such file or directory
>> [root@archatom ~]# grep . /sys/kernel/debug/clk/pmc_plt_clk_?/clk_flags
>> /sys/kernel/debug/clk/pmc_plt_clk_0/clk_flags:CLK_IS_CRITICAL
>> /sys/kernel/debug/clk/pmc_plt_clk_1/clk_flags:CLK_IS_CRITICAL
>> /sys/kernel/debug/clk/pmc_plt_clk_2/clk_flags:CLK_IS_CRITICAL
>> /sys/kernel/debug/clk/pmc_plt_clk_3/clk_flags:CLK_IS_CRITICAL
>> [root@archatom ~]# ls /sys/kernel/debug/clk
>> clk_dump         clk_orphan_summary  pll            pmc_plt_clk_1 pmc_plt_clk_3  pmc_plt_clk_5
>> clk_orphan_dump  clk_summary         pmc_plt_clk_0  pmc_plt_clk_2 pmc_plt_clk_4  xtal
> 
> Hmm, so 4 ethernet cards and 4 enabled / marked as critical clocks.
> 
> Supporting this through get_clk is going to require a DMI table in the igb driver
> combined with checking which PCI "slot" the card is to get the correct clock
> for each ethernet controller.
> 
> I believe tht just restoring the old behavior to mark all clocks enabled
> on boot as critical, but then limited to this system based on a dmi match,
> is the best solution here.
> 
> Andy?

Andy? Now that we've the patch ready for the other system which needs to
have the CLK_IS_CRITICAL workaround and enables this based on DMI info,
I believe the best fix for this system is to simply add it to that DMI
table?

Regards,

Hans
