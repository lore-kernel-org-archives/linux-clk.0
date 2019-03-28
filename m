Return-Path: <SRS0=OKnm=R7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEB7C43381
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 15:01:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE12B2173C
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 15:01:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbfC1PBm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Mar 2019 11:01:42 -0400
Received: from mail-ed1-f47.google.com ([209.85.208.47]:41748 "EHLO
        mail-ed1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfC1PBm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Mar 2019 11:01:42 -0400
Received: by mail-ed1-f47.google.com with SMTP id a25so17505361edc.8
        for <linux-clk@vger.kernel.org>; Thu, 28 Mar 2019 08:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dpIAczkQI0QpeXbqU/A8VhDQGu7WCuLNWFlAAUHGhew=;
        b=EIEeiVRplTOlmo+FQnAZAyd70bF+X2c12kPJ+BKvVRx/201U565zEPGL8xXZBKNIlc
         9rxKENT36dlF/Dt0GnGu0ug+FSuzYftpoybEz0UMtAQmos+qjfwr7bNBqtxZU1sFp45j
         eKzUUciabRfk3YSFycMqqrKdH+gKCXAk6nB1wdoa9050yfKfPBoEQZEFzAglG+brvyPY
         yT4EozdPz/xNNuJxtuGaXMrt1TuqoyK7dddGt7NJbrsmzF0N+chcLQac/yzcvmL/6HEx
         tO10AjEP8fTSeGGTnSxtPuiVHrb7e8y/Py89LeaEYQ6jvi9bK6XkbgsX2c7n5v6ldBMl
         fCEw==
X-Gm-Message-State: APjAAAVRILZ6Zk4ZqGsf4qLXv7QZGx0vbNzY11C9aCMIL9OLOausqiz2
        z+EGubpS19oyufkcMYjcsRPY+g==
X-Google-Smtp-Source: APXvYqxHFuG8Ujj8XwjxkmcuWYLtiOnxTi3BRjZuBgO5YJNutu8BjKqY1YaL03//Y+o0Qesux15Aww==
X-Received: by 2002:a17:906:7621:: with SMTP id c1mr2583010ejn.47.1553785300384;
        Thu, 28 Mar 2019 08:01:40 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id o1sm5232639eja.18.2019.03.28.08.01.38
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Mar 2019 08:01:39 -0700 (PDT)
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>
Cc:     "Fujinaka, Todd" <todd.fujinaka@intel.com>,
        "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "e1000-devel@lists.sf.net" <e1000-devel@lists.sf.net>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <1c433bef-055e-2ac3-990c-325aa2d3899e@factor-ts.ru>
 <9B4A1B1917080E46B64F07F2989DADD69AF4DDE7@ORSMSX115.amr.corp.intel.com>
 <0d0b97cc-2871-6a81-11ad-4dbb8a6b652e@redhat.com>
 <20190327164748.GO9224@smile.fi.intel.com>
 <907ab1ec-ae46-a678-4f0e-87af5069f2eb@gmx.ch>
 <20190327191925.GP9224@smile.fi.intel.com>
 <5dd6a6ac-94de-07ad-df5a-2601cbc7e9d0@gmx.ch>
 <20190328145827.GI9224@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e01bb9da-0dde-4bfa-5693-eb4c02a1d696@redhat.com>
Date:   Thu, 28 Mar 2019 16:01:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190328145827.GI9224@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Andy,

On 28-03-19 15:58, Andy Shevchenko wrote:
> On Thu, Mar 28, 2019 at 03:35:58PM +0100, David Müller wrote:
>> Andy Shevchenko wrote:
>>> On Wed, Mar 27, 2019 at 06:31:19PM +0100, David Müller wrote:
>>>> The pmc_plt_clks may also be used for external hardware purposes without
>>>> the need for a driver involved. So I'm afraid a fix similar to the r8169
>>>> approach will not suit all needs. Please see
>>>> https://www.spinics.net/lists/linux-clk/msg35800.html for details.
>>>
>>> Any driver for device which is using PMC clock should take it into
>>> consideration.
>>
>> I agree that each driver should properly request the clocks and other
>> resources needed.
>>
>> But what if the PMC clock is used by hardware for which no driver is
>> being loaded or needed?
> 
> Perhaps I didn't get a full picture.
> 
> In the original message you referred to igb _driver_ and devices that are not
> working properly after resume.
> 
> The igb driver patching can fix that, right?
> 
> If the driver is not loaded, then the clock is not in use and can be gated,
> correct?
> 
> If there is a connection of this clock to the hardware which is served by
> firmware, then its firmware's deal, no?
> 
> Can you elaborate a bit more the case you are talking about?

In David's case we are talking about a USB hub which needs a pmc-clk
(yes really). Also see me other mail I send about this about 5 minutes
ago.

David's case is the reason why I believe we need a DMI quirk table; and
once we have that I think the board with igb ethernet controllers might
just as well be handled the same way (I already checked it has usable
DMI identifying info).

Regards,

Hans
