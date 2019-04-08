Return-Path: <SRS0=sViq=SK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB42C10F13
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 18:43:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7230A20833
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 18:43:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbfDHSnO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Apr 2019 14:43:14 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43886 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfDHSnO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Apr 2019 14:43:14 -0400
Received: by mail-ed1-f67.google.com with SMTP id w3so3449557edu.10
        for <linux-clk@vger.kernel.org>; Mon, 08 Apr 2019 11:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qOuHPchuOdn1XJ7GtbXDKH3QSd4JJfWWEvKGQmffLIM=;
        b=e8I0KNtmGTLTcD5opcGrHu7kTOAwgDLoVFo6+0lDhkQyxnD+1JvZlONRZwVTSqWZKy
         kd9WtkmVSpvfKDdyhNGaPfOSnO43E6yDqbRprymDZICxYarthUReBXKYBRiSG0im3Vl6
         8AHcKpY8ePEg/HbmuBrOKVm9zt2QQGl5Tek5Yma9EZirwnnaU4rg1m5TB7RqDo8W55re
         hpCJu/YIsfLBjoCoGZshbHV398aV0rYwIE4Y7IdL+qTasz8ltTM5UCED8tWV6CeFc7pT
         b8UR/WeOF+Mn/oANGwoF6ngvrpAQICKdNhuO+iHk2EKiXbdYR56eP1MciuV78vKM3FYp
         szuw==
X-Gm-Message-State: APjAAAWd4Ef4tPcPM1qocWJ1cSspQ9bVETg2pfeeRdSKAEG+TIWcLPEN
        /TScH94RN2s1XF/dw38pAeOjTw==
X-Google-Smtp-Source: APXvYqzf0NzZXkENIU1qjLGAhSlA8PWm1pUgj57cI4VXefPXxJsjj2exCYuuJgdcCYofQ/2506LXSA==
X-Received: by 2002:aa7:d784:: with SMTP id s4mr20555438edq.177.1554748992255;
        Mon, 08 Apr 2019 11:43:12 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id j15sm2495089edt.47.2019.04.08.11.43.11
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Apr 2019 11:43:11 -0700 (PDT)
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
References: <5dd6a6ac-94de-07ad-df5a-2601cbc7e9d0@gmx.ch>
 <20190328145827.GI9224@smile.fi.intel.com>
 <e01bb9da-0dde-4bfa-5693-eb4c02a1d696@redhat.com>
 <20190328152421.GJ9224@smile.fi.intel.com>
 <26800a0e-c309-1e69-c5b4-e11b761c7b40@redhat.com>
 <20190328154931.GK9224@smile.fi.intel.com>
 <d4c44bc8-ae0c-a6ff-3042-ae3185ceb33e@redhat.com>
 <ef893b2e-121a-d395-9843-47d0c9f1515a@factor-ts.ru>
 <942808d6-e2c1-cc8c-4aed-9b44a7ce4c76@redhat.com>
 <c5ebcf73-1706-48d8-6904-ae6a89c44151@redhat.com>
 <20190408172111.GX9224@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a5392081-b545-6c19-ed0f-d71432308c63@redhat.com>
Date:   Mon, 8 Apr 2019 20:43:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190408172111.GX9224@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 08-04-19 19:21, Andy Shevchenko wrote:
> On Thu, Apr 04, 2019 at 04:43:03PM +0200, Hans de Goede wrote:
>> On 29-03-19 16:53, Hans de Goede wrote:
>>> On 3/29/19 2:59 PM, Семен Верченко wrote:
> 
>>> Hmm, so 4 ethernet cards and 4 enabled / marked as critical clocks.
>>>
>>> Supporting this through get_clk is going to require a DMI table in the igb driver
>>> combined with checking which PCI "slot" the card is to get the correct clock
>>> for each ethernet controller.
>>>
>>> I believe tht just restoring the old behavior to mark all clocks enabled
>>> on boot as critical, but then limited to this system based on a dmi match,
>>> is the best solution here.
>>>
>>> Andy?
>>
>> Andy? Now that we've the patch ready for the other system which needs to
>> have the CLK_IS_CRITICAL workaround and enables this based on DMI info,
>> I believe the best fix for this system is to simply add it to that DMI
>> table?
> 
> I reviewed v4, supposed to go via CLK tree.

Right, but that patch adds the quirk for the system with the USB hub,
do you agree, that given that each ethernet controller seems to be
using its own clock, it is best to use a DMI quirk for this case too?

If you agree then someone needs to prepare a follow-up patch on top of
v4 which adds the DMI info for this board to the table.

Regards,

Hans
