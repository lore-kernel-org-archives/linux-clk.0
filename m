Return-Path: <SRS0=fESv=SF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7ED6C4360F
	for <linux-clk@archiver.kernel.org>; Wed,  3 Apr 2019 15:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 91492206B8
	for <linux-clk@archiver.kernel.org>; Wed,  3 Apr 2019 15:38:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfDCPiu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Apr 2019 11:38:50 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:36765 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfDCPiu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Apr 2019 11:38:50 -0400
Received: by mail-ed1-f68.google.com with SMTP id s16so15353022edr.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Apr 2019 08:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qiPORL6kEtQRn8NG/qvK6hVJRXxvqHVqVeFG8gh1n2U=;
        b=PGiwJSvwHwXghwP8MILai6XjtDxs4cD/AR6+Q1ElrV0MI4dDG6WlOi+XUxjpdEM4sr
         rUpfsdhAjm8efOzinzoQlXV4EZWV8UqzeCsVGvn+iAIxmZ8OWUYLF2ipjAqDa+d4FE9w
         Hm/HbnV/AKUWkT1KH16b01V0gqYLSXIFuc4iQTe1yCmb7lL0dtkgOnjjRoPS4fcZRrv7
         +eHPDLvMyuSGIA3JX06Gw5kZKD3m6znO57OziubxQh2JiecH/o1DvAjqrsZGp1VBxoin
         VbuNvTd4GlChG2eB6voqAB6Py6PCiWD5JdtZaxHQ85jJpyDXdy+kFlBtfMQdPM2BOhYb
         KNGw==
X-Gm-Message-State: APjAAAWF42TySSUw/ZmH/VO1mVbfwFzkiOP0t8lY60GE3HIYOGs5hH6t
        ayGYLad/s/3vCNKVAPvVIhairuqW+NQ=
X-Google-Smtp-Source: APXvYqygd3tw1ZqFFI2UK/fXxOQ/T4pf2ko4CUhRsilXhOrFdW3c7SbiCLWP/+DVFIEkBqXfdwCYBw==
X-Received: by 2002:a50:e610:: with SMTP id y16mr180823edm.67.1554305928344;
        Wed, 03 Apr 2019 08:38:48 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id s9sm4931954eda.93.2019.04.03.08.38.47
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Apr 2019 08:38:47 -0700 (PDT)
Subject: Re: [PATCH v2] clk: x86: Add system specific quirk to mark clocks as
 critical
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>,
        linux-clk <linux-clk@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
References: <20190328124939.23139-1-dave.mueller@gmx.ch>
 <20190403140857.1130-1-dave.mueller@gmx.ch>
 <ed8c07ff-5719-9179-424c-13b0891605f7@redhat.com>
 <CAHp75VdT_4e1F51YfRVtmPBmT+ZbwvjVGJAY5uhC=QMKxyANPQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d8f96161-9ab8-2300-35fb-9e2b2e442c1d@redhat.com>
Date:   Wed, 3 Apr 2019 17:38:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VdT_4e1F51YfRVtmPBmT+ZbwvjVGJAY5uhC=QMKxyANPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 03-04-19 17:36, Andy Shevchenko wrote:
> On Wed, Apr 3, 2019 at 6:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 03-04-19 16:08, David Müller wrote:
> 
>>>        clk_data->base = pmc_regmap; /* offset is added by client */
>>>        clk_data->clks = pmc_data->clks;
>>> +     if (d) {
>>> +             clk_data->chk_critclks = true;
>>> +             pr_info("%s critclks quirk enabled\n", d->ident);
>>> +     }
>>>
>>>        clkdev = platform_device_register_data(&pdev->dev, "clk-pmc-atom",
>>>                                               PLATFORM_DEVID_NONE,
>>
>> Normally I would be fine with your choice to use dmi_first_match(), but since
>> you need to respin anyway, can you change this to:
>>
>>          if (dmi_check_system(critclk_systems)) {
>>                  clk_data->chk_critclks = true;
>>                  pr_info("%s critclks quirk enabled\n", d->ident);
>>          }
>>
>> That will allow you to drop the 'd' variable declaration all together and is
>> somewhat cleaner IMHO.
> 
> pr_info() relies on it AFAICS.

Ah right I missed that, I would just do: pr_info("System is on critclks quirk list, critclks quirk enabled\n");
but keeping the solution with ident is fine too.

Regards,

Hans

