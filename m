Return-Path: <SRS0=VSe3=DG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B0AC4727C
	for <linux-clk@archiver.kernel.org>; Tue, 29 Sep 2020 20:29:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 194532076B
	for <linux-clk@archiver.kernel.org>; Tue, 29 Sep 2020 20:29:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IXrkbCsW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728084AbgI2U3Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Sep 2020 16:29:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45550 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728300AbgI2U3Z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Sep 2020 16:29:25 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601411363;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DpiQHbf0e7iFDIkjmKw/gjRWiP27u8yMbP5WylBiLEA=;
        b=IXrkbCsWmnusNqsz49QP1lAt5JwkpIhENFQIVWwAUW64BjZ7+3iQchbkNl2hAKvI9icOsk
        1+tmOsW31HnTz1qeCKxjfna0P0iFWT9vJ97WkfVWuyguWLo5jKctPwqp21k1Er7dE9bL16
        EaRNokty3ICimvwzO5wGG/BShQOGoCg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-Mv-7eGO-MGazySbFZp_HVA-1; Tue, 29 Sep 2020 16:29:22 -0400
X-MC-Unique: Mv-7eGO-MGazySbFZp_HVA-1
Received: by mail-ej1-f69.google.com with SMTP id d8so2438954ejt.14
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2020 13:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DpiQHbf0e7iFDIkjmKw/gjRWiP27u8yMbP5WylBiLEA=;
        b=bqiI9ddrZmM/kQH61jufDi56INQRFOPSI0dSCNrnAeNyF2USovdoL8HpAjbHiOSUkp
         My8LBLH7y5OCqa2Ut0EB2gOvQgVr2ocqRRH0sRynoBD5PKQ9h2EXfxdJpUJeOBaIrCEK
         0qMmayoqLsA3bkbgWrrX41qO3Nf2Sqz1m+KOn+C5n0aaOlPxPUZM3UF/eO3ZDJohGVAU
         wnvFjNZJt02lm2ExP66mAMRsy+79ecr4kIZiPKWHnGSkrw0MBsGfjmHkIMXDDee6XrNY
         OLzkce7lLbfMATo5YCPmqAWIzQRzJkZOWe9NNGLtXc0ZcFwO4pLjmeU7vUYWxFm1tjft
         ZxNA==
X-Gm-Message-State: AOAM530rOYopxXYDGMSfQvRYYL2sEETgOKx8M9blkZGloVY1DlaNyy56
        dwIu0/Ncl8FOQxJQf4iQ070XI+91vz6iqZYafyPkn4W/5ofN9gQKrLpXGAylJFWcD+zIkAzEuNL
        zZWGAwXdqH49FdcApUTaD
X-Received: by 2002:a17:906:660f:: with SMTP id b15mr5892508ejp.333.1601411359985;
        Tue, 29 Sep 2020 13:29:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWx79kTJuJPWlPlpZXqdIw0O/DCB/48FQt75Rsu+cZUxxVNtzgXNBvY/t+Y1QS1Tbb/qsTiA==
X-Received: by 2002:a17:906:660f:: with SMTP id b15mr5892497ejp.333.1601411359816;
        Tue, 29 Sep 2020 13:29:19 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id p12sm6162778ejb.42.2020.09.29.13.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 13:29:19 -0700 (PDT)
Subject: Re: RTL8402 stops working after hibernate/resume
From:   Hans de Goede <hdegoede@redhat.com>
To:     Petr Tesarik <ptesarik@suse.cz>,
        Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Realtek linux nic maintainers <nic_swsd@realtek.com>,
        netdev@vger.kernel.org, linux-clk@vger.kernel.org
References: <20200715102820.7207f2f8@ezekiel.suse.cz>
 <d742082e-42a1-d904-8a8f-4583944e88e1@gmail.com>
 <20200716105835.32852035@ezekiel.suse.cz>
 <e1c7a37f-d8d0-a773-925c-987b92f12694@gmail.com>
 <20200903104122.1e90e03c@ezekiel.suse.cz>
 <7e6bbb75-d8db-280d-ac5b-86013af39071@gmail.com>
 <20200924211444.3ba3874b@ezekiel.suse.cz>
 <a10f658b-7fdf-2789-070a-83ad5549191a@gmail.com>
 <20200925093037.0fac65b7@ezekiel.suse.cz>
 <20200925105455.50d4d1cc@ezekiel.suse.cz>
 <aa997635-a5b5-75e3-8a30-a77acb2adf35@gmail.com>
 <20200925115241.3709caf6@ezekiel.suse.cz>
 <20200925145608.66a89e73@ezekiel.suse.cz>
 <30969885-9611-06d8-d50a-577897fcab29@gmail.com>
 <20200929210737.7f4a6da7@ezekiel.suse.cz>
 <217ae37d-f2b0-1805-5696-11644b058819@redhat.com>
Message-ID: <fd66b023-2dc3-954f-c55b-b03b51abb08f@redhat.com>
Date:   Tue, 29 Sep 2020 22:29:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <217ae37d-f2b0-1805-5696-11644b058819@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

p.s.

On 9/29/20 10:08 PM, Hans de Goede wrote:

<snip>

> So I believe that the proper fix for this is to revert
> commit 9f0b54cd167219
> ("r8169: move switching optional clock on/off to pll power functions")

Heiner, assuming you agree that reverting this commit is
the best way to fix this, can you please submit a revert
for this upstream ?

With a:

Fixes: 9f0b54cd167219 ("r8169: move switching optional clock on/off to pll power functions")

Tag in the commit-message so that this gets cherry-picked into
the stable series where necessary.

Regards,

Hans



> As that caused the whole chip's clock to be left off after
> a suspend/resume while the interface is down.
> 
> Also some remarks about this while I'm being a bit grumpy about
> all this anyways (sorry):
> 
> 1. 9f0b54cd167219 ("r8169: move switching optional clock on/off
> to pll power functions") commit's message does not seem to really
> explain why this change was made...
> 
> 2. If a git blame would have been done to find the commit adding
> the clk support: commit c2f6f3ee7f22 ("r8169: Get and enable optional ether_clk clock")
> then you could have known that the clk in question is an external
> clock for the entire chip, the commit message pretty clearly states
> this (although "the entire" part is implied only) :
> 
> "On some boards a platform clock is used as clock for the r8169 chip,
> this commit adds support for getting and enabling this clock (assuming
> it has an "ether_clk" alias set on it).
> 
> This is related to commit d31fd43c0f9a ("clk: x86: Do not gate clocks
> enabled by the firmware") which is a previous attempt to fix this for some
> x86 boards, but this causes all Cherry Trail SoC using boards to not reach
> there lowest power states when suspending.
> 
> This commit (together with an atom-pmc-clk driver commit adding the alias)
> fixes things properly by making the r8169 get the clock and enable it when
> it needs it."
> 
> Regards,
> 
> Hans

