Return-Path: <SRS0=Ee6+=SG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31ABCC4360F
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 08:02:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B1A120855
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 08:02:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbfDDICb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Apr 2019 04:02:31 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45775 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbfDDICb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Apr 2019 04:02:31 -0400
Received: by mail-ed1-f67.google.com with SMTP id m16so1271620edd.12
        for <linux-clk@vger.kernel.org>; Thu, 04 Apr 2019 01:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0X1LdjUtWLBunrWyunuKbgCrDDBfn96812gyeBcosxo=;
        b=OYm5gP0DAQ5k65YNCULsSsGtWqnNBR9d1/ePameSeeCOZ5CAEJ5otejPqr6qReHV0D
         0i+x5HDYCvfE7aYC1wq98m9eO54DUumLeEjiQs8ZCTb5IU637tAnE20Rhjb48oPMKyCz
         YZ3Mc04tVxAQzwuq0ox0gqf4SCRgSN3c8R5engYiHnXk2rKPmeRH2HveED+oPNv/i+oZ
         5ffWRAbh9X6kTcHO2PpEvMvaNy8yll4iXKPw2L4SvPiTobstie5VlPoL6ISJd52Yt9Dk
         qBxl/W9YhBZuqVsPAtj4ktBD1SCM+bPkVpHaqzGEN7JDIGgc3iTW94VvU5CsAQCHwCyh
         vkmQ==
X-Gm-Message-State: APjAAAVQqAm6fLYcgk2jKRPJc9xEdoBqnKrRWIOfLa8alWrmyEXpKMry
        qgWpcXBBhiOM8efM7b9H9DDHtQ==
X-Google-Smtp-Source: APXvYqwLumaO7CppVrlnlUfoNxXDGVCXVww9dYoYp4DoY5LN4sESyioS6MLRexFk2zOeXUDr32+R+Q==
X-Received: by 2002:a17:906:4bc3:: with SMTP id x3mr2630562ejv.150.1554364949574;
        Thu, 04 Apr 2019 01:02:29 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id q3sm5362592edr.31.2019.04.04.01.02.28
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 01:02:28 -0700 (PDT)
Subject: Re: [PATCH v2] clk: x86: Add system specific quirk to mark clocks as
 critical
To:     =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
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
 <d8f96161-9ab8-2300-35fb-9e2b2e442c1d@redhat.com>
 <f0ec3df1-f142-29c6-5f1e-baab95f93665@gmx.ch>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3c0c7d47-6cae-99c9-fa8f-2ebc956be2ba@redhat.com>
Date:   Thu, 4 Apr 2019 10:02:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f0ec3df1-f142-29c6-5f1e-baab95f93665@gmx.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 04-04-19 10:00, David Müller wrote:

 > Is there a rule / recommendation how the sentinel entry should look
 > like? In the kernel sources I see a "{}", "{ }", "{ /*sentinel*/ }", ...

Nope, no rule, you can use whatever feels good to you,
although Andy might have a different opinion...

> Hans de Goede wrote:
>> On 03-04-19 17:36, Andy Shevchenko wrote:
>>> On Wed, Apr 3, 2019 at 6:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>> On 03-04-19 16:08, David Müller wrote:
>>>
>>>>>         clk_data->base = pmc_regmap; /* offset is added by client */
>>>>>         clk_data->clks = pmc_data->clks;
>>>>> +     if (d) {
>>>>> +             clk_data->chk_critclks = true;
>>>>> +             pr_info("%s critclks quirk enabled\n", d->ident);
>>>>> +     }
>>>>>
>>>>>         clkdev = platform_device_register_data(&pdev->dev,
>>>>> "clk-pmc-atom",
>>>>>                                                PLATFORM_DEVID_NONE,
>>>>
>>>> Normally I would be fine with your choice to use dmi_first_match(),
>>>> but since
>>>> you need to respin anyway, can you change this to:
>>>>
>>>>           if (dmi_check_system(critclk_systems)) {
>>>>                   clk_data->chk_critclks = true;
>>>>                   pr_info("%s critclks quirk enabled\n", d->ident);
>>>>           }
>>>>
>>>> That will allow you to drop the 'd' variable declaration all together
>>>> and is
>>>> somewhat cleaner IMHO.
>>>
>>> pr_info() relies on it AFAICS.
>>
>> Ah right I missed that, I would just do: pr_info("System is on critclks
>> quirk list, critclks quirk enabled\n");
>> but keeping the solution with ident is fine too.
> 
> If it is OK, I will keep the "dmi_first_match()" implementation.

Sure that is fine.

Regards,

Hans
