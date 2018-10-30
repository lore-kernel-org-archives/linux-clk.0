Return-Path: <SRS0=0weS=NK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27FBC6786F
	for <linux-clk@archiver.kernel.org>; Tue, 30 Oct 2018 16:04:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC7A620664
	for <linux-clk@archiver.kernel.org>; Tue, 30 Oct 2018 16:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC7A620664
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbeJaA6a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Oct 2018 20:58:30 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51216 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbeJaA63 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Oct 2018 20:58:29 -0400
Received: by mail-wm1-f67.google.com with SMTP id w7-v6so1296402wmc.1
        for <linux-clk@vger.kernel.org>; Tue, 30 Oct 2018 09:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BYnaQcLx06HAjRIELsZiqQrtQWk7Prf2bT5hLFZ6RWo=;
        b=qX5j8u2NAda39g/CCQba5SVjMvUsxk2Y2aNmpB9USSzWTPA8qAnhYJvszQJSHzO/z+
         iEDsxG/aYCMhrY24XNAjFp/AUCKmf7AQNc40/I9gXzwPWqwuygf9Qw8HjZ2KCaf11g2p
         LjZAcwDSCv3Lyr/5ilkbLrvlAViQDq2ekUxQcrGfxlk3yPauWyla0pFKtz/alYrqA822
         kZnoUgQKvFWkjt0Kl5z7dvawiiuwHe6pmztg3U/Xad9EWgyKIwr3rxxsoLHggwEoJt28
         4I9WVJNsiPcSb97fBvVS6+fuR9rn+UT8aeUhFM6M0xcSVpp0va67/FVIDhgf9zPBO7kr
         5xAw==
X-Gm-Message-State: AGRZ1gIBAuAepqBYtXtTNOSIgSViTnuaYUjWwA+Wig5wAkOYHc7c9oEP
        nnqHSnNoQCqyI8LAYbZr5TXvOg==
X-Google-Smtp-Source: AJdET5dEDKa6jBiSy5bWFKgIJp4T5zvz2dpCwA6wPocNa+16dik7U9eULEvZEf3PmvOlJ2t3DqOJEQ==
X-Received: by 2002:a1c:930c:: with SMTP id v12-v6mr2374554wmd.9.1540915464389;
        Tue, 30 Oct 2018 09:04:24 -0700 (PDT)
Received: from shalem.localdomain (546A5441.cm-12-3b.dynamic.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id l125-v6sm19653447wmb.1.2018.10.30.09.04.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 09:04:23 -0700 (PDT)
Subject: Re: Regression found (Stop-marking-clocks-as-CLK_IS_CRITICAL)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Dean Wallace <duffydack73@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stable <stable@vger.kernel.org>,
        Johannes Stezenbach <js@sig21.net>,
        Carlo Caione <carlo@endlessm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mogens Jensen <mogens-jensen@protonmail.com>
References: <20181025232517.ywnw54qibemosjws@picard>
 <154083512089.98144.9141070901932719147@swboyd.mtv.corp.google.com>
 <CAHp75VfnN5tF1Z9+CDDhKFNG5QfCRcGOZeAkpf-5BfCEx16gvg@mail.gmail.com>
 <CAHp75VctdBE-GM60udJawBCXdmoOqZn4N=kFWz5GLHzjPG2iQQ@mail.gmail.com>
 <20181029190819.2ivlx73n6y6sx4vk@picard>
 <ffc4bcc9-62c3-8940-85d6-d0fd01f3a1b8@linux.intel.com>
 <c8fb730a-c160-41b4-dad0-8ed8594e5687@redhat.com>
 <20181030143836.feo7zcxiestylxoo@picard>
 <2d429c87-24c5-4075-683e-b0d12c3eb1c2@linux.intel.com>
 <d00df762-e4fc-06c5-701e-d5100bfd0e35@redhat.com>
Message-ID: <e48696f0-aa3e-e20e-d038-9d8dda9cbfce@redhat.com>
Date:   Tue, 30 Oct 2018 17:04:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <d00df762-e4fc-06c5-701e-d5100bfd0e35@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 30-10-18 16:46, Hans de Goede wrote:
> Hi,
> 
> On 30-10-18 16:04, Pierre-Louis Bossart wrote:
>> In addition I am not aware of any baytrail device using plt_clk_0, so moving a common machine driver such a cht_bsw_max98090_ti to use plt_clk0 only would break other devices (e.g. Rambi/Orco). Asking for both clocks to be on might work though, 
> 
> Ok, so we need to have a DMI based quirk for the Swanky and maybe also
> the clapper to use plt_clk_0 there. Asking for 2 clks if we only need
> one does not seem like a good plan.

Dean, Mogens,

To write a proper patch for this I'm going to need DMI strings
from your devices.

Can you please run (as normal user):

grep . /sys/class/dmi/id/* 2> /dev/null

And reply with the output of this command?

Thanks,

Hans
