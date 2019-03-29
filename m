Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F4CC43381
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 12:30:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F2A0206DD
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 12:30:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729472AbfC2Mar (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 08:30:47 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37418 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729411AbfC2Mar (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Mar 2019 08:30:47 -0400
Received: by mail-ed1-f65.google.com with SMTP id v21so1880798edq.4
        for <linux-clk@vger.kernel.org>; Fri, 29 Mar 2019 05:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dhuBTT8ya/RqAFw+m+ZJVHEJalT/wE5i0Qb6kthghg8=;
        b=JwSdSK+Eq7GGefzvOjqvji4tYHSfvi5vKIfmTzhn2GQY4z7m3Yff8EkIul6d5cvIln
         pr3U7T1zAgKMkulmPJH0Zpn52DAxRNkJcautRC4+65WZXnzjgDCz2v1vuW2UA/OhO2VC
         c/W5fty56iA7k3X95aGhfRmEUMm1/z5neeqhmuVt6acT5+KDG+2jVvqNIzT1nkVPcQRe
         vr7K7+tX//EO3zIv0x44mHaeXyVM+eekoFeuy2w7XplCcX4WPzxT6Am9g8D02I2d/kBU
         FHBtWLFPP3afwaSHYXsvKEWacvfNnSXqOUp0EWa1qoLH7uOdM6eubqsRCNlxbUHgsbnP
         +2Vw==
X-Gm-Message-State: APjAAAWeL2emt0iBiswwHbKtRBjLdjOVnTQGSakoGLCRUNM1/09TD3mI
        A43kh3YF6c9mzNIcL75DVxXKGg==
X-Google-Smtp-Source: APXvYqxapEiK0JOYteJiJvMaetZfN1hVVAjAiUhDeraOFhd4NffEyKfK/tx2Ir5mH2G4oKwAEtB82w==
X-Received: by 2002:a50:ad32:: with SMTP id y47mr31064698edc.198.1553862645512;
        Fri, 29 Mar 2019 05:30:45 -0700 (PDT)
Received: from localhost.localdomain ([62.140.137.96])
        by smtp.gmail.com with ESMTPSA id g20sm342075ejk.72.2019.03.29.05.30.38
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Mar 2019 05:30:44 -0700 (PDT)
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>,
        "Fujinaka, Todd" <todd.fujinaka@intel.com>,
        "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "e1000-devel@lists.sf.net" <e1000-devel@lists.sf.net>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Semyon Verchenko <semverchenko@factor-ts.ru>
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d4c44bc8-ae0c-a6ff-3042-ae3185ceb33e@redhat.com>
Date:   Fri, 29 Mar 2019 13:30:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190328154931.GK9224@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 3/28/19 4:49 PM, Andy Shevchenko wrote:
> On Thu, Mar 28, 2019 at 04:32:27PM +0100, Hans de Goede wrote:
>> On 28-03-19 16:24, Andy Shevchenko wrote:
>>> On Thu, Mar 28, 2019 at 04:01:37PM +0100, Hans de Goede wrote:
>>>> On 28-03-19 15:58, Andy Shevchenko wrote:
>>>>> On Thu, Mar 28, 2019 at 03:35:58PM +0100, David Müller wrote:
>>>>>> Andy Shevchenko wrote:
>>>>>>> On Wed, Mar 27, 2019 at 06:31:19PM +0100, David Müller wrote:
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

Maybe, I guess we first need to figure out which platforms clock(s) is (are)
being used, if there is more then one; or it is a different one then in the
realtek ethernet case it might be better to go with the dmi quirk option.

Semyon Verchenko can you (as root) run the following command on a kernel
where the ethernet does work:

grep . /sys/kernel/debug/clk/pmc_plt_clk_?/flags

And then email us the output please?

Regards,

Hans

