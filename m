Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D2CC10F0E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 13:09:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA5DB20674
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 13:09:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388343AbfDRNJT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 09:09:19 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]:32998 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbfDRNJT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Apr 2019 09:09:19 -0400
Received: by mail-wm1-f41.google.com with SMTP id z6so6918217wmi.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2019 06:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NBNzyXE5iaOPUoVOUROGSZSKXq/p8U4Oi/meNFfnFWE=;
        b=oTVrl7R7SJhWN6oi20wQ6/v0Q9ZKd0PkQqDZCC4IGQ3Km0AhdDr+76k2HDSfSz3hAJ
         iu3bb30tgBvncWr47eH6J4Ar9pgq5VnhuTrTOfGoSWywK9kpZTMsQwxHC+YcGdw+WV5Y
         jAYiO7+o6U0LvPljAPz1WJA78h+Wj825xcqCRTw9f7GhgnrlPP0y5qL8m76Qz57uqWHO
         qsX/NJQRLrCR8PPI3dqT2c+uYZ5rNb9DwjFJ4s2fVxV24pyMMNBQ0x9IxIESHphobejr
         ZeRB4g9VzX1F6eG832x78ORPuNCtn2ZJAOo8YCkBKsf2A2ZzKnradxaIVLFB6OSwlCC2
         Cc0A==
X-Gm-Message-State: APjAAAUvwESS685vzSej4t80F3UfhCdHse9Up/SEGE6UDzCucKlyE4eb
        DHwq2t+v3gLvzVBupRJ+qslLdw==
X-Google-Smtp-Source: APXvYqy/k+L3rsoLOHBuVgRTHCpBYCBpOqXgUKiXUExgKLsfKJQrsz667H39lvjSYXEgULGpVc5v9w==
X-Received: by 2002:a1c:4845:: with SMTP id v66mr3326106wma.144.1555592957551;
        Thu, 18 Apr 2019 06:09:17 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id z6sm1758386wrh.45.2019.04.18.06.09.16
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 06:09:16 -0700 (PDT)
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     =?UTF-8?B?0KHQtdC80LXQvSDQktC10YDRh9C10L3QutC+?= 
        <semverchenko@factor-ts.ru>,
        =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>,
        "Fujinaka, Todd" <todd.fujinaka@intel.com>,
        "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "e1000-devel@lists.sf.net" <e1000-devel@lists.sf.net>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <e01bb9da-0dde-4bfa-5693-eb4c02a1d696@redhat.com>
 <20190328152421.GJ9224@smile.fi.intel.com>
 <26800a0e-c309-1e69-c5b4-e11b761c7b40@redhat.com>
 <20190328154931.GK9224@smile.fi.intel.com>
 <d4c44bc8-ae0c-a6ff-3042-ae3185ceb33e@redhat.com>
 <ef893b2e-121a-d395-9843-47d0c9f1515a@factor-ts.ru>
 <942808d6-e2c1-cc8c-4aed-9b44a7ce4c76@redhat.com>
 <c5ebcf73-1706-48d8-6904-ae6a89c44151@redhat.com>
 <20190408172111.GX9224@smile.fi.intel.com>
 <a5392081-b545-6c19-ed0f-d71432308c63@redhat.com>
 <20190409153125.GU9224@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a05e2ac3-de31-bd7a-6b39-8cdf00190f67@redhat.com>
Date:   Thu, 18 Apr 2019 15:09:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190409153125.GU9224@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 09-04-19 17:31, Andy Shevchenko wrote:
> On Mon, Apr 08, 2019 at 08:43:10PM +0200, Hans de Goede wrote:
>> On 08-04-19 19:21, Andy Shevchenko wrote:
>>> On Thu, Apr 04, 2019 at 04:43:03PM +0200, Hans de Goede wrote:
>>>> On 29-03-19 16:53, Hans de Goede wrote:
>>>>> On 3/29/19 2:59 PM, Семен Верченко wrote:
>>>
>>>>> Hmm, so 4 ethernet cards and 4 enabled / marked as critical clocks.
>>>>>
>>>>> Supporting this through get_clk is going to require a DMI table in the igb driver
>>>>> combined with checking which PCI "slot" the card is to get the correct clock
>>>>> for each ethernet controller.
>>>>>
>>>>> I believe tht just restoring the old behavior to mark all clocks enabled
>>>>> on boot as critical, but then limited to this system based on a dmi match,
>>>>> is the best solution here.
>>>>>
>>>>> Andy?
>>>>
>>>> Andy? Now that we've the patch ready for the other system which needs to
>>>> have the CLK_IS_CRITICAL workaround and enables this based on DMI info,
>>>> I believe the best fix for this system is to simply add it to that DMI
>>>> table?
>>>
>>> I reviewed v4, supposed to go via CLK tree.
>>
>> Right, but that patch adds the quirk for the system with the USB hub,
>> do you agree, that given that each ethernet controller seems to be
>> using its own clock, it is best to use a DMI quirk for this case too?
>>
>> If you agree then someone needs to prepare a follow-up patch on top of
>> v4 which adds the DMI info for this board to the table.
> 
> I hope we may find a better solution in the future, but for now as a quick fix
> the proposed can be done.

Ok.

Семен Верченко, this means that we are going to need DMI info from
the board in question. I thought we already had that, but I now see that
you original report did not have that a

Please run as root:

dmidecode &> dmidecode.log

And then reply to this email with the generated dmidecode.log file
attached. Once I have that file I can prepare a patch fixing this.

Regards,

Hans

