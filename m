Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F88DC43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 15:32:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EEA6E20811
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 15:32:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727472AbfCSPc6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 11:32:58 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:33057 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbfCSPc6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 11:32:58 -0400
Received: by mail-wm1-f42.google.com with SMTP id z6so4789571wmi.0
        for <linux-clk@vger.kernel.org>; Tue, 19 Mar 2019 08:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZOE/PPrmdND083jhVr3fcQQ3EiiZs78erOaP32tQeaY=;
        b=jkoMTa/U3ocQ2gy8WDkJdRLTsZDnn1PSBJDC7hIv12xWOqwGCq7jx8/6IlHvrPgicw
         QqkDz5RFz2JYWl3vmqriQMWChITklRwb76zeVvspMMt5eZZhdiPN/MXV5ogQZ820bmLH
         dvyt8MgP9w2JdiQHhUyRZC3mbJeV2hcFaL9J6v6+4SHXSnPB+qf2s6NJrqbdS3cXUyoJ
         lesV26k2G8LYwjEIzUXK7O30o5ZBipK9RyJfF2ZiO/KWvqa7E9L1gA2C+UdTk3FpMX77
         edvKUgn9zlxVuA4yPHGQkThUmP9GrdPI/ka2PQHS3+BVheE7QUE7Iw71ikWuNjMOMGmo
         FeuA==
X-Gm-Message-State: APjAAAWuqwr3JbyPz8RFT/cj2PEvhOcPXLd7d9eRAjIbY5/EnR2T60J2
        sLjQkETsMwJUqhe9tcCzi1XdjxmcsPw=
X-Google-Smtp-Source: APXvYqyJBFTr152S3NvZlBnUIMkFBCFhFOo+EmeGguSePzmwuOvPlErVuZROXruqY2/OmDpBLu60CQ==
X-Received: by 2002:a1c:c647:: with SMTP id w68mr4277309wmf.8.1553009576868;
        Tue, 19 Mar 2019 08:32:56 -0700 (PDT)
Received: from shalem.localdomain (546A5441.cm-12-3b.dynamic.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id z20sm2970581wma.48.2019.03.19.08.32.55
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Mar 2019 08:32:56 -0700 (PDT)
Subject: Re: clk: x86: Stop marking clocks as CLK_IS_CRITICAL is causing
 non-working hardware.
To:     =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <e6e11d5c-988a-aef4-cb8c-9e3bef254b87@gmx.ch>
 <155257844626.20095.2420043618878828782@swboyd.mtv.corp.google.com>
 <73c30c82-1a69-97e6-40e9-3cdd6059e72d@redhat.com>
 <6948f8df-e6ee-2312-3ad1-8b3b48c99c4e@gmx.ch>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f0a46869-c6c2-049a-b51f-f19471b1978e@redhat.com>
Date:   Tue, 19 Mar 2019 16:32:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <6948f8df-e6ee-2312-3ad1-8b3b48c99c4e@gmx.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 19-03-19 14:16, David Müller wrote:
> Hello
> 
> Hans de Goede wrote:
> 
>> So the background here is that the ACPI tables would normally be
>> responsible for turning on/off the pmc clocks and they are on cherry-trail
>> but on bay-trail the OS is somehow supposed to figure this all out.
> 
> Sorry, I'm not familiar with CherryTrail but the "clk-pmc-atom" clk
> driver is used by both BayTrail and CherryTrail, isn't it?
> I don't see any ACPI related clock handling in this driver. Is it
> handled somewhere else?
> 
>> Do you know if the kernel already has some special code-paths to deal
>> with the HSIC phy in the xhci code ?
> 
> The HSIC chip is more an USB hub than a phy. There is also no specific
> driver loaded/needed for HSIC to work, at least not on x86.
> I have also not seen any "external clock enabling code-paths" in the
> xHCI code, but maybe I overlooked it.
> 
>> Otherwise I guess we should probably conditionally register a
>> platform_usb_phy_clk clock alias (see commit b1e3454d39f992)
>> based on a dmi_system_id table and have the xhci driver (optionally)
>> request this clock and enable it if present.
>> There are some interesting probe-ordering issues here though,
>> for this to work the clk-pmc-atom (builtin) platform driver must
>> bind to the clk-pmc-atom platform-device *before* the xhci
>> driver tries to get the clock.
> 
> Wouldn't it be simpler and more straightforward to put a "dmi_system_id
> table" based quirk into the clk-pmc-atom driver itself?
> That would also avoid any potential probe-ordering issues.

That is possible, I see 2 downsides to that approach:

1) I do not think a quirk for an USB HUB belongs in a generic clk
driver, but if Stephen is ok with this I'm fine with this approach
since it certainly seems the simplest solution.

Stephen ?

2) If we just restore the CLK_IS_CRITICAL flag for pmc_clk0 on the
device in question, based on a dmi check, then that means the
device in question will not be able to reach S0i3 when suspended
and thus use more power while suspended, this is certainly better
then having non working USB ports, so if you are ok with this
downside (so in essence going back to the old situation as a
revert would do), then that is fine with me.

Regards,

Hans
