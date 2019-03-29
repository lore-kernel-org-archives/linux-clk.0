Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB3AC43381
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 12:32:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A60DC206DD
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 12:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729483AbfC2McE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 08:32:04 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44757 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729411AbfC2McE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Mar 2019 08:32:04 -0400
Received: by mail-ed1-f65.google.com with SMTP id x10so1836209edh.11
        for <linux-clk@vger.kernel.org>; Fri, 29 Mar 2019 05:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9JeiW5skbkKdWszPqLy/o7AZO3SjR/N7pIfj0HRFK9I=;
        b=iAH1RUwBlxo5W31qlpsOgQwpw21c70/ycEjsM49TvKzNxalRSmXie9Jzn2XYPY0ldq
         czMWkKflU7Li3M9fDij5KtACleP3IPubXJwKW1dSilqSaefu8ksBektsBfSOkxq3M19d
         4k/c5pNcgh7GpnfcistAyAySgoQM4UjlVIEYHiZ2ePw4K4Hf3Hg0NWon2hc2C4fKSzBm
         /48x7llYzyUETIR+SXz/0aEqidSNz7BjAem03ojWxBGW6bFks0oNmLKAQDVtc9Y/pgvQ
         DrxEF4cuTkvJ4WO3+sggiMqt2MaTulMq3oFzwrodGTo9kYvABhglQI4+L9Tnl9MFk8+b
         RKGQ==
X-Gm-Message-State: APjAAAUPN0U6RTXw6CuJzInTj4rrX51MYceSqO8h6jawo9ba74IAoxXS
        n8BgOZtfdl6nDbyLieDuMdtZThBad90=
X-Google-Smtp-Source: APXvYqzYVsZKvSicxn32uo7wgEkWG35nUr/F79mRPOJrUegp9EasfmR5q87mXLKpYV3Dk9d0ZTJAcw==
X-Received: by 2002:a17:906:6ada:: with SMTP id q26mr27252060ejs.138.1553862722261;
        Fri, 29 Mar 2019 05:32:02 -0700 (PDT)
Received: from localhost.localdomain ([62.140.137.96])
        by smtp.gmail.com with ESMTPSA id x54sm634049edd.35.2019.03.29.05.32.00
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Mar 2019 05:32:01 -0700 (PDT)
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
To:     todd.fujinaka@intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "e1000-devel@lists.sf.net" <e1000-devel@lists.sf.net>,
        linux-clk@vger.kernel.org
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
 <alpine.NEB.2.21.9999.1903282138420.979@chris.i8u.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <584713e5-0a7a-4b55-d721-9bff388348f0@redhat.com>
Date:   Fri, 29 Mar 2019 13:32:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.NEB.2.21.9999.1903282138420.979@chris.i8u.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Hisashi,

On 3/29/19 5:46 AM, Hisashi T Fujinaka wrote:
> On Thu, 28 Mar 2019, Andy Shevchenko wrote:
> 
>> On Thu, Mar 28, 2019 at 04:32:27PM +0100, Hans de Goede wrote:
>>> On 28-03-19 16:24, Andy Shevchenko wrote:
>>>> On Thu, Mar 28, 2019 at 04:01:37PM +0100, Hans de Goede wrote:
>>>>> On 28-03-19 15:58, Andy Shevchenko wrote:
>>>>>> On Thu, Mar 28, 2019 at 03:35:58PM +0100, David M?ller wrote:
>>>>>>> Andy Shevchenko wrote:
>>>>>>>> On Wed, Mar 27, 2019 at 06:31:19PM +0100, David M?ller wrote:
>>
>>>>>>>> Any driver for device which is using PMC clock should take it into
>>>>>>>> consideration.
>>>>>>>
>>>>>>> I agree that each driver should properly request the clocks and other
>>>>>>> resources needed.
>>
>>>>>> Can you elaborate a bit more the case you are talking about?
>>
>>>>> I think the board with igb ethernet controllers might
>>>>> just as well be handled the same way (I already checked it has usable
>>>>> DMI identifying info).
>>>>
>>>> But am I right that in the case of igb we will loose power at suspend? Wouldn't
>>>> be better to patch the driver?
>>>
>>> This is an industrial embedded PC, so it is not running on battery and
>>> I doubt it typically spends a lot of time in suspend at all.
>>
>> Okay, but still from logical point of view wouldn't be better to fix the driver
>> for such case? At least I see benefits out of this approach: a) less hackish,
>> less quirk code; b) if this happens on non-industrial case it would be better
>> to have in the driver due to power consumption.
> 
> Sorry for replying from home. It's either that or top-posting with
> Outlook.
> 
> It sounds to me like Andriy's arguments are counter to what he suggests
> since we'd have to fix the USB and the Ethernet and that would add more
> special case code, right? However, I'm just the old igb bug fixer and
> not a clock guy, and I've spent little time outside of the Ethernet
> drivers.
> 
> It really sounded like there were going to be changes to the clock code
> that would resolve the issue. Were those done? Do I still need to change
> the igb driver to change the clocks used?

Andy and I are still discussing this, we will get back to you when
we've a conclusion on how best to fix this.

Regards,

Hans

