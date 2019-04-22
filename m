Return-Path: <SRS0=Z5yo=SY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D96C10F11
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 10:20:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B722206A3
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 10:20:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=factor-ts.ru header.i=@factor-ts.ru header.b="lqzzzsBy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfDVKUV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Apr 2019 06:20:21 -0400
Received: from dionis-sg.factor-ts.ru ([194.154.76.132]:60152 "EHLO
        factor-ts.ru" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726675AbfDVKUV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Apr 2019 06:20:21 -0400
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=factor-ts.ru; s=10;
        t=1555928415; bh=5jfVTGY1sU8abVBXzX9aF+fXTbCjtVy8LM+h3jZTKLc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=lqzzzsByEkXxqTXO9r7WNQUe5FSA876iPS/2LepYMRywjTO+ZQ3A4GkvtWtnaH3vy
         ts4e/Tk4yMsCggSUwRjUswEGTJ6CWxtzKo6jAqC2LzR0bJS7PJVhHvDmlyzPX5AkKV
         5JvFY+WvgThcPLtnh1B960gwQ8DrFOozodEmIn1g=
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>,
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
 <a05e2ac3-de31-bd7a-6b39-8cdf00190f67@redhat.com>
 <c2fa7ae8-1ad5-1a85-3e25-8bc5a9b5ee01@factor-ts.ru>
 <da634f93-9cbb-f5a8-e7c2-4a20368823e9@redhat.com>
From:   Semyon Verchenko <semverchenko@factor-ts.ru>
Message-ID: <99a451b4-34cd-b14c-1cef-116829d435f9@factor-ts.ru>
Date:   Mon, 22 Apr 2019 13:20:13 +0300
MIME-Version: 1.0
In-Reply-To: <da634f93-9cbb-f5a8-e7c2-4a20368823e9@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US-large
X-MailScanner-ID: 3A0AE23E8003.AF4EB
X-MailScanner: Found to be clean
X-MailScanner-From: semverchenko@factor-ts.ru
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 18.04.2019 18:12, Hans de Goede wrote:
> Hi Semyon,
>
> On 18-04-19 15:26, Semyon Verchenko wrote:
>>
>> On 18.04.2019 16:09, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 09-04-19 17:31, Andy Shevchenko wrote:
>
> <snip>
>
>>> Ok.
>>>
>>> Семен Верченко, this means that we are going to need DMI info from
>>> the board in question. I thought we already had that, but I now see 
>>> that
>>> you original report did not have that a
>>>
>>> Please run as root:
>>>
>>> dmidecode &> dmidecode.log
>>>
>>> And then reply to this email with the generated dmidecode.log file
>>> attached. Once I have that file I can prepare a patch fixing this.
>
> Thank you for the DMI decode.
>
> Attached are 3 patches, can you please test if adding those 3 patches
> to your kernel fixes the problem?
>
> Thanks & Regards,
>
> Hans
>
Hi Hans,
It seems that these patches fix the problem (at least interfaces are 
visible through ip addr and it's possible to ping something from them).

Thanks for fixing this issue.
