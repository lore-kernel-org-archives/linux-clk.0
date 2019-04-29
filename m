Return-Path: <SRS0=OnHn=S7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81AEC04AA6
	for <linux-clk@archiver.kernel.org>; Mon, 29 Apr 2019 15:02:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4FB420656
	for <linux-clk@archiver.kernel.org>; Mon, 29 Apr 2019 15:02:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727554AbfD2PCO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Apr 2019 11:02:14 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50]:53735 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728424AbfD2PCO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Apr 2019 11:02:14 -0400
Received: by mail-wm1-f50.google.com with SMTP id 26so14638135wmj.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Apr 2019 08:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bu4z3CsRZTC1vnXUxqRTthuHFmySDtZc6o0iA1j0Xvk=;
        b=Uejl6OqcPkwZS9US12+y5adCiBdtRzoNtoRzEYxdyXiCH7m6piGsjIGPs+tSHhebCc
         0uHyJ9fGVOcThcBNhbB8VBNBKJBcA6jmepz7AxvyBoksNmCpRkY4ylYGNbnZTmOrEktJ
         gH1IPqsA+/XuODvtsfl8y3JBfTD6pjgzqAxTxG18OwfLUuyTeh8YdgJtlC81h9C5STmk
         7RpEdGqA3nYZZ1zVJFN65zkkuoNj9sFvvztWMYh7XoXYO/4vw8ceEYWrr7PoMtbPPpKN
         mZgkjPUogxb/3OrkFPtTJsKSvPr3b5079xSgyX5MckXkeiVn/EBdljj1H8EoSw/qXNkQ
         +ezw==
X-Gm-Message-State: APjAAAWo+eaQjL1caaE/7p6CfUITOZUj5GGsAbpFqARofyePptZ40L+5
        k2Gx7bDPGg1AXkZjSItVT8hgNKsGLaQ=
X-Google-Smtp-Source: APXvYqwdlpEfBCZjZ7fHzNg7NYZnlKJJ2GQn0Dw8jgQg949JvokkEiP/Jy0ivrdpwCDojESQaHduYQ==
X-Received: by 2002:a1c:4602:: with SMTP id t2mr17343410wma.120.1556550132468;
        Mon, 29 Apr 2019 08:02:12 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id h84sm36352494wmf.15.2019.04.29.08.02.10
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 08:02:11 -0700 (PDT)
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
To:     Semyon Verchenko <semverchenko@factor-ts.ru>,
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
 <99a451b4-34cd-b14c-1cef-116829d435f9@factor-ts.ru>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <929d2bc6-2ffd-5137-2eed-5eedcc123aee@redhat.com>
Date:   Mon, 29 Apr 2019 17:02:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <99a451b4-34cd-b14c-1cef-116829d435f9@factor-ts.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 22-04-19 12:20, Semyon Verchenko wrote:
> 
> On 18.04.2019 18:12, Hans de Goede wrote:
>> Hi Semyon,
>>
>> On 18-04-19 15:26, Semyon Verchenko wrote:
>>>
>>> On 18.04.2019 16:09, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 09-04-19 17:31, Andy Shevchenko wrote:
>>
>> <snip>
>>
>>>> Ok.
>>>>
>>>> Семен Верченко, this means that we are going to need DMI info from
>>>> the board in question. I thought we already had that, but I now see that
>>>> you original report did not have that a
>>>>
>>>> Please run as root:
>>>>
>>>> dmidecode &> dmidecode.log
>>>>
>>>> And then reply to this email with the generated dmidecode.log file
>>>> attached. Once I have that file I can prepare a patch fixing this.
>>
>> Thank you for the DMI decode.
>>
>> Attached are 3 patches, can you please test if adding those 3 patches
>> to your kernel fixes the problem?
>>
>> Thanks & Regards,
>>
>> Hans
>>
> Hi Hans,
> It seems that these patches fix the problem (at least interfaces are visible through ip addr and it's possible to ping something from them).
> 
> Thanks for fixing this issue.

Thank you for testing the fix, I've submitted the patch fixing this upstream.

Regards,

Hans


