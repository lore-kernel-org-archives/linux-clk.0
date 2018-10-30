Return-Path: <SRS0=0weS=NK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984BFC6786F
	for <linux-clk@archiver.kernel.org>; Tue, 30 Oct 2018 19:10:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58A922081B
	for <linux-clk@archiver.kernel.org>; Tue, 30 Oct 2018 19:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58A922081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbeJaEFL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 Oct 2018 00:05:11 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39481 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbeJaEFL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Oct 2018 00:05:11 -0400
Received: by mail-wm1-f67.google.com with SMTP id y144-v6so12355666wmd.4
        for <linux-clk@vger.kernel.org>; Tue, 30 Oct 2018 12:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N8lL8ewi2pT1RH28j6xWpur3+QBDIW5hctXSxhKT1S4=;
        b=rPsVOgs9Fc+PRZdw4whlTuMm0dOcjWKZGfhbHJps7ikivt17szmK9ZR8XqMZPfeD2J
         GuN4otEPZE9ZofS+qfL6H4+JYyRkf6IXMAziftzVtt0YZ2sHIDcWwkIJk6bS6aZVCZtw
         YjRyF93JzOQ3bgix0jXQzi4s252p7cp21gAW+96Rv2q2TZAKvE0ViVWSw2/GfoFZHEXV
         UA5Sk18zB1iAYCZMdfEJhSDkqdlz9KlM0L6q3NOLdqtIFwV8Mpdv6jJC9PdXPNZK9JFm
         QW04Ks+Ga2IiRzf3sRxJj5YPzUnu0cEeXb+FYP3YpYFUzS2etA7AD9LFNTi69HDMMJhZ
         sgiw==
X-Gm-Message-State: AGRZ1gJJ8F0SlBDqF38Jt9yMO3gbuv578JDA9LUrjfGTSkWxvdhbEhg2
        6lkLtYrma7ncGlOdJqdRrRIS0g==
X-Google-Smtp-Source: AJdET5d9/F9UUaQnr7K03/KLsAS2ty78P4u+yRWCg0lX8erI3+kfl8RG4JTuXEpvX4gb10ItS5stlQ==
X-Received: by 2002:a1c:2387:: with SMTP id j129-v6mr62064wmj.20.1540926627040;
        Tue, 30 Oct 2018 12:10:27 -0700 (PDT)
Received: from shalem.localdomain (546A5441.cm-12-3b.dynamic.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id c9-v6sm25764417wrh.50.2018.10.30.12.10.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 12:10:25 -0700 (PDT)
Subject: Re: Regression found (Stop-marking-clocks-as-CLK_IS_CRITICAL)
To:     Mogens Jensen <mogens-jensen@protonmail.com>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Dean Wallace <duffydack73@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stable <stable@vger.kernel.org>,
        Johannes Stezenbach <js@sig21.net>,
        Carlo Caione <carlo@endlessm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20181025232517.ywnw54qibemosjws@picard>
 <CAHp75VctdBE-GM60udJawBCXdmoOqZn4N=kFWz5GLHzjPG2iQQ@mail.gmail.com>
 <20181029190819.2ivlx73n6y6sx4vk@picard>
 <ffc4bcc9-62c3-8940-85d6-d0fd01f3a1b8@linux.intel.com>
 <c8fb730a-c160-41b4-dad0-8ed8594e5687@redhat.com>
 <20181030143836.feo7zcxiestylxoo@picard>
 <2d429c87-24c5-4075-683e-b0d12c3eb1c2@linux.intel.com>
 <d00df762-e4fc-06c5-701e-d5100bfd0e35@redhat.com>
 <e48696f0-aa3e-e20e-d038-9d8dda9cbfce@redhat.com>
 <BaxBOBmUCld7THAnRIDXUpKq8uQ2oJ49EaNlq0mZ11gFjA5JjhbfhVouLZGc1q74PrQC6uGfddKklIP059D_DtQwBqK-sn9rd4xEPhW9E6s=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d53738e1-4ba5-640e-7ef7-1705ab205061@redhat.com>
Date:   Tue, 30 Oct 2018 20:10:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <BaxBOBmUCld7THAnRIDXUpKq8uQ2oJ49EaNlq0mZ11gFjA5JjhbfhVouLZGc1q74PrQC6uGfddKklIP059D_DtQwBqK-sn9rd4xEPhW9E6s=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 30-10-18 19:56, Mogens Jensen wrote:
> ‐‐‐‐‐‐‐ Original Message ‐‐‐‐‐‐‐
> On Tuesday, October 30, 2018 4:04 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Hi,
>>
>> On 30-10-18 16:46, Hans de Goede wrote:
>>
>>> Hi,
>>> On 30-10-18 16:04, Pierre-Louis Bossart wrote:
>>>
>>>> In addition I am not aware of any baytrail device using plt_clk_0, so moving a common machine driver such a cht_bsw_max98090_ti to use plt_clk0 only would break other devices (e.g. Rambi/Orco). Asking for both clocks to be on might work though,
>>>
>>> Ok, so we need to have a DMI based quirk for the Swanky and maybe also
>>> the clapper to use plt_clk_0 there. Asking for 2 clks if we only need
>>> one does not seem like a good plan.
>>
>> Dean, Mogens,
>>
>> To write a proper patch for this I'm going to need DMI strings
>> from your devices.
>>
>> Can you please run (as normal user):
>>
>> grep . /sys/class/dmi/id/* 2> /dev/null
>>
>> And reply with the output of this command?
> I have attached the output from a coreboot seabios based clapper.

Thank you.

> Should I still test 0001-ASoC-intel-cht_bsw_max98090_ti-Use-pmc_plt_clk_0-ins.patch with SND_SOC_INTEL_CHT_BSW_MAX98090_TI_MACH and asoundrc from Dean? There seems to have been some development in the case since that request was made.

Yes please test that, I expect that to also fix things for the
Clapper, but I need to have that confirmed before submitting a
patch upstream adding a quirk for the Clapper to use pmc_plt_clk_0
instead of pmc_plt_clk_3.

Regards,

Hans




