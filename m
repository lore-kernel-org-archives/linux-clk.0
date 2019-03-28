Return-Path: <SRS0=OKnm=R7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493F8C43381
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 14:48:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22DF9217F9
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 14:48:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbfC1OsH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Mar 2019 10:48:07 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:39701 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbfC1OsH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Mar 2019 10:48:07 -0400
Received: by mail-ed1-f67.google.com with SMTP id p20so16975950eds.6
        for <linux-clk@vger.kernel.org>; Thu, 28 Mar 2019 07:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VrZPrAXBf8+KeKNgUhd/K7rHyQGYDT1Vm8qRXj0q5EY=;
        b=jiEHiH8efqbCqCG0wubq0mKXNOQcd1Aeyq5XFGYMjzNWgsbZZCryp6MyjKod9BpSWO
         mFwEdoFvT5n+DydjQP6zP+QnOvx8nJM5PV7jRLp4UmJKdrrmo4qKqlsz32wZgValRcLQ
         SClMwhPxxVPYT1zXK+HKzXsxzUqKeNfAt4xMns49UvXXeUFfm6YYB56BWJ7SsiQoRwbg
         mm83suBm0lry8yPR8v+m8UQ9xGcaphLCsYbaHIy61qJF6n3efXeWSIXdR4haj+m1qyDl
         zhS6wh2NHRjYW6CBmPWrvo8Llp8bD7G1/G/Ic2A9JanUa6qoGk1FyqH+OE3OK2YXwWuq
         LdKQ==
X-Gm-Message-State: APjAAAUT/PLFKwxwTf3HjGi8GvmdmSar6gBRSNXUp3NVVrHJwjvOVY9B
        KMnCVGVj1kj6Z1u5J1H7Jg4tdA==
X-Google-Smtp-Source: APXvYqxy4ckstZsN1GtQUuPJi9ItLKbzKE8PNO8GtM8QlVOQOn7fGtJTaDi6rGEX/hsf/8aUH+ul9g==
X-Received: by 2002:a50:ac71:: with SMTP id w46mr28668072edc.95.1553784485800;
        Thu, 28 Mar 2019 07:48:05 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id t52sm3304033edd.54.2019.03.28.07.48.03
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Mar 2019 07:48:04 -0700 (PDT)
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Fujinaka, Todd" <todd.fujinaka@intel.com>,
        Semyon Verchenko <semverchenko@factor-ts.ru>,
        "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "e1000-devel@lists.sf.net" <e1000-devel@lists.sf.net>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <1c433bef-055e-2ac3-990c-325aa2d3899e@factor-ts.ru>
 <9B4A1B1917080E46B64F07F2989DADD69AF4DDE7@ORSMSX115.amr.corp.intel.com>
 <0d0b97cc-2871-6a81-11ad-4dbb8a6b652e@redhat.com>
 <20190327164748.GO9224@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c6cf3052-786f-9022-44d9-ad2b5c8a7c31@redhat.com>
Date:   Thu, 28 Mar 2019 15:48:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190327164748.GO9224@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 27-03-19 17:47, Andy Shevchenko wrote:
> On Wed, Mar 27, 2019 at 05:02:31PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 3/25/19 9:12 PM, Fujinaka, Todd wrote:
>>> This is going to take a bit of time to see what we need to do. The attachments were stripped but I think just figuring out what they had to change in the Realtek driver will tell us what we need to know.
>>
>> I'm not sure fixing this in the ethernet driver is the best way to go,
>> the board in question is an embedded PC and I've also recently received
>> a bug report about a similar problem with the consumer not requesting
>> the pmc clocks causing a HSIC usb hub to not work.
>>
>> I think that it might be better to restore the CLK_IS_CRITICAL workaround
>> for this, but then only on select boards, based on DMI matching.
>>
>> I've added a bunch of relevant people / lists to the Cc.
>>
>> Andy, Stephen, what is your take on this ?
> 
> I'm afraid I forgot all details about that (semi-)famous issue. Though, looking
> into your patch against r8169 and taking into account DT practice, it would be
> not bad to fix a driver, we have by the way devm_clk_get_optional() now, so, it
> would be not a big deal.

This assumes that the machine with the igb ethernet problem is using
the same pmc clk as the other device I fixed and that it is using one
and the same clock for all 4 of its ethernet controllers.

IMHO the not controlling of the clock as an ACPI resource on Bay Trail
models as is normal on x86 really is a firmware bug (shared by the
entire Bay Trail generation). I'm not in favor of adding workarounds to
drivers all over the place because of this.

And in case of the problem with David Müller's system, the problem
is that the clock is needed for an external USB hub connected via
HSIC. The USB subsystem assumes that HUBs will just work without
needing to request resources for them and in this case there really
is no good place to do the devm_clk_get_optional().

So I believe that we are going to need the DMI based approach for
David's case anyway, at which point we might just as well also fix
the igb problem that way, at least until more boards using the igb
driver and showing the same problem pop up.

The reasons I patched the r8169 driver for this are:
1) In principle I agree that this is the right thing to do
(but see above)

2) I expect more Cherry Trail based devices (yes this is a Cherry
Trail device, so here it really really is a firmware bug) to
use the r8169 (cheap SoC + cheap ethernet chip)

3) This is a laptop where being able to reach S0i3 is important,
which the CLK_IS_CRITICAL workaround will break

>> I'm myself starting to believe the DMI based applying of the
>> CLK_IS_CRITICAL workaround is the best solution here.
> 
> DMI quirk table tends to grow in mysterious ways. I would prefer in this case
> logical solution — if platform has an optional clock, then use it.

I'm afraid that otherwise instead of a growing DMI table in a
single place we will get extra coded added for niche cases to
a bunch of different drivers, in which case I prefer the "central"
DMI quirk database.

Regards,

Hans

