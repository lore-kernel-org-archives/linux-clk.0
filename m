Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C787C43381
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 15:53:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 57B2421871
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 15:53:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729678AbfC2Pxp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 11:53:45 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46055 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729671AbfC2Pxo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Mar 2019 11:53:44 -0400
Received: by mail-ed1-f65.google.com with SMTP id m16so2414804edd.12
        for <linux-clk@vger.kernel.org>; Fri, 29 Mar 2019 08:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=giQRHIV8+gUoTSQheC3YAA4GLMNJbob5sNVwsrF/Aqc=;
        b=TCvVSb7FQmZJwo4c9ilPAjVO2OUTN5SznC+zNud9Ltkupnlev0JlryE7dNIS7Wllau
         hscMhkEELrizd+CeBS0uOGKEznxsDtAbwNMaywGWSz3HCIj9+4SD9HvGCOrw22Sm3fVr
         /S4IpVrZK7NSv6qr265vc/NqIriYYMM2HwuyXFDbp7pKhy6J3Yz2FVlsPJRgOuR35rwL
         vriXJZErjc0D3Vv4Xy0+Japfch4FlNKOtzV7bX8w8rb7QA7LPPcUY9gkYsMvhOHOMcTc
         5GB8fX55ICgAZ+RxNdiv3nVFK1Sh/R/uGPmNWe3+EW5VTXklT7gCxOF4oRRZmJi63UHV
         gMTg==
X-Gm-Message-State: APjAAAWAwH+QgYJdcuTRDLw8Ode39rtdJScRFeE7wv0Sx0y/IJy9bCig
        7HHXSBKaT1reJCglQwc3QJ64wg==
X-Google-Smtp-Source: APXvYqyDeV4Wk/H2hYVp9A2UHVK24TEzV053pODK7Ie1NJ1KAI7XiOsK6NHuKS2psMarb7e7BiK1Mg==
X-Received: by 2002:a50:8997:: with SMTP id g23mr33303959edg.80.1553874822595;
        Fri, 29 Mar 2019 08:53:42 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:1c0c:6c86:46e0:a7ad:5246:f04d])
        by smtp.gmail.com with ESMTPSA id g27sm743776edg.77.2019.03.29.08.53.37
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Mar 2019 08:53:41 -0700 (PDT)
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <942808d6-e2c1-cc8c-4aed-9b44a7ce4c76@redhat.com>
Date:   Fri, 29 Mar 2019 16:53:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <ef893b2e-121a-d395-9843-47d0c9f1515a@factor-ts.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 3/29/19 2:59 PM, Семен Верченко wrote:
> 
> On 29.03.2019 15:30, Hans de Goede wrote:
>> Hi,
>>
>> On 3/28/19 4:49 PM, Andy Shevchenko wrote:
>>> On Thu, Mar 28, 2019 at 04:32:27PM +0100, Hans de Goede wrote:
>>>> On 28-03-19 16:24, Andy Shevchenko wrote:
>>>>> On Thu, Mar 28, 2019 at 04:01:37PM +0100, Hans de Goede wrote:
>>>>>> On 28-03-19 15:58, Andy Shevchenko wrote:
>>>>>>> On Thu, Mar 28, 2019 at 03:35:58PM +0100, David Müller wrote:
>>>>>>>> Andy Shevchenko wrote:
>>>>>>>>> On Wed, Mar 27, 2019 at 06:31:19PM +0100, David Müller wrote:
>>>
>>>>>>>>> Any driver for device which is using PMC clock should take it into
>>>>>>>>> consideration.
>>>>>>>>
>>>>>>>> I agree that each driver should properly request the clocks and other
>>>>>>>> resources needed.
>>>
>>>>>>> Can you elaborate a bit more the case you are talking about?
>>>
>>>>>> I think the board with igb ethernet controllers might
>>>>>> just as well be handled the same way (I already checked it has usable
>>>>>> DMI identifying info).
>>>>>
>>>>> But am I right that in the case of igb we will loose power at suspend? Wouldn't
>>>>> be better to patch the driver?
>>>>
>>>> This is an industrial embedded PC, so it is not running on battery and
>>>> I doubt it typically spends a lot of time in suspend at all.
>>>
>>> Okay, but still from logical point of view wouldn't be better to fix the driver
>>> for such case? At least I see benefits out of this approach: a) less hackish,
>>> less quirk code; b) if this happens on non-industrial case it would be better
>>> to have in the driver due to power consumption.
>>
>> Maybe, I guess we first need to figure out which platforms clock(s) is (are)
>> being used, if there is more then one; or it is a different one then in the
>> realtek ethernet case it might be better to go with the dmi quirk option.
>>
>> Semyon Verchenko can you (as root) run the following command on a kernel
>> where the ethernet does work:
>>
>> grep . /sys/kernel/debug/clk/pmc_plt_clk_?/flags
>>
>> And then email us the output please?
>>
>> Regards,
>>
>> Hans
>>
> I don't have flags files in /sys/kernel/debug/clk/pmc_plt_clk_?; did you mean clk_flags?
> 
> [root@archatom ~]# grep . /sys/kernel/debug/clk/pmc_plt_clk_?/flags
> grep: /sys/kernel/debug/clk/pmc_plt_clk_?/flags: No such file or directory
> [root@archatom ~]# grep . /sys/kernel/debug/clk/pmc_plt_clk_?/clk_flags
> /sys/kernel/debug/clk/pmc_plt_clk_0/clk_flags:CLK_IS_CRITICAL
> /sys/kernel/debug/clk/pmc_plt_clk_1/clk_flags:CLK_IS_CRITICAL
> /sys/kernel/debug/clk/pmc_plt_clk_2/clk_flags:CLK_IS_CRITICAL
> /sys/kernel/debug/clk/pmc_plt_clk_3/clk_flags:CLK_IS_CRITICAL
> [root@archatom ~]# ls /sys/kernel/debug/clk
> clk_dump         clk_orphan_summary  pll            pmc_plt_clk_1 pmc_plt_clk_3  pmc_plt_clk_5
> clk_orphan_dump  clk_summary         pmc_plt_clk_0  pmc_plt_clk_2 pmc_plt_clk_4  xtal

Hmm, so 4 ethernet cards and 4 enabled / marked as critical clocks.

Supporting this through get_clk is going to require a DMI table in the igb driver
combined with checking which PCI "slot" the card is to get the correct clock
for each ethernet controller.

I believe tht just restoring the old behavior to mark all clocks enabled
on boot as critical, but then limited to this system based on a dmi match,
is the best solution here.

Andy?

Regards,

Hans
