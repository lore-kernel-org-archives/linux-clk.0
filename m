Return-Path: <SRS0=OKnm=R7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2FFC43381
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 15:43:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 928CF21773
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 15:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbfC1PnE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Mar 2019 11:43:04 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39502 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfC1PnD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Mar 2019 11:43:03 -0400
Received: by mail-ed1-f65.google.com with SMTP id p20so17147434eds.6
        for <linux-clk@vger.kernel.org>; Thu, 28 Mar 2019 08:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=481NxV7ntmPtgH8xt7gUza1uBcmzo0QVGBBZl2/cdbk=;
        b=Sv84sOpRznA0oxmkrFYLtNG0e0sacvWLK8QiwduyyKzSnKkj9a0NwSOJ6i0vDJUrdQ
         1a0UfUUXHzSUc64LwhN0FGN0ffahqs/Nt1s7Li/MD4eSNvq2oi0TSmvWYEtbqE/rKw70
         4xPBg2sqCWNSYqlKXiaPdd8tasj9fbXWSDQsNdzMeuf4FCTJOsLS8rEeOE4gkrVX3and
         dHyC69VaOkBgsKgGT2KGEa5MrOsIRGqpL85SfgTgNlQKAgEtGlT1WztbPL3+XiujaF8w
         +EpC1IaWPYg/IXLBt7q9R1NeyroAo2nt2eSnqSiJUz1H95xQq3NjV9uHOkhc7iPLT44H
         X+VA==
X-Gm-Message-State: APjAAAXyv7yDxwMf7jYFQkDNiP4dAfxI2S7OXaMYS9n7yKx0tpkuJKp7
        E1wuHUdYsd0qn7tLQR3ZbvURVQ==
X-Google-Smtp-Source: APXvYqycub/xq8w/ugv8IexrA1nUZJfkZgM/VgoZQ1JUG1SEryiJAmbSgmGfho2AZi0chQ7Lfj7oSA==
X-Received: by 2002:a17:906:924e:: with SMTP id c14mr24275239ejx.230.1553787781754;
        Thu, 28 Mar 2019 08:43:01 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id bz3sm3925307ejb.52.2019.03.28.08.42.59
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Mar 2019 08:43:00 -0700 (PDT)
Subject: Re: [PATCH] clk: x86: Add system specific quirk to mark clocks as
 critical
To:     =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>,
        linux-clk@vger.kernel.org
Cc:     platform-driver-x86@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
References: <20190328124939.23139-1-dave.mueller@gmx.ch>
 <ad96925b-adde-e62a-76d0-8f91865a0814@redhat.com>
 <e47cb333-61c5-ba72-edd8-021ccf961c78@gmx.ch>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <65798648-9ed4-02fe-bcb1-bb7c2bf53588@redhat.com>
Date:   Thu, 28 Mar 2019 16:42:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <e47cb333-61c5-ba72-edd8-021ccf961c78@gmx.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 28-03-19 16:41, David Müller wrote:
> Hello
> 
> Hans de Goede wrote:
>> Can you respin the patch to use the old method of looking at which
>> clocks are enabled by the BIOS? (note you may want to wait with
>> this till Andy and I have reached an agreement on how to solve this)
> 
> Sure, I will wait until consensus is reached. ;-)

I believe that Andy I agree now that at least your case needs the
DMI based approach, so go ahead and respin it :)

Regards,

Hans

