Return-Path: <SRS0=xwbt=DH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7009DC4741F
	for <linux-clk@archiver.kernel.org>; Wed, 30 Sep 2020 09:04:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 181B12076B
	for <linux-clk@archiver.kernel.org>; Wed, 30 Sep 2020 09:04:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C36I6GkJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728677AbgI3JEQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Sep 2020 05:04:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20092 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728367AbgI3JEP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Sep 2020 05:04:15 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601456653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L7nOrATNsk4/WXTkNQk1+iJwvYCU+O3mITu7GApVYsU=;
        b=C36I6GkJ0FIruu0+2dZWXOnkMHeU1wYpAxpb024EoT4s900feJAYt1B8yvTtSmwxbsBSpn
        ZHsCil7yQdvSbvhTKDHQbQqPw0Ws4R1IFUyxQ4vwWJOeja7e6OEQMQbxcF7RhqfjoIDE3x
        a8ZDDe+Cj23iESZv/pxhEdtiiVGU4Ao=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-5L2UrelKO4GtF-RegVM8Tg-1; Wed, 30 Sep 2020 05:04:11 -0400
X-MC-Unique: 5L2UrelKO4GtF-RegVM8Tg-1
Received: by mail-ej1-f72.google.com with SMTP id y25so538758ejj.4
        for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2020 02:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L7nOrATNsk4/WXTkNQk1+iJwvYCU+O3mITu7GApVYsU=;
        b=nqpnpij+uIaHFedN35GDOc5Yu2ISGu4G41GmYGiYbnOS675Zr4PJRcTBGYcxyUxk2a
         arqIWQ6Nox7i5U9fbxMDxZKMslq8qSttg/RkZQTqjqX2ntzpK0IHKOXDNxpgKp05PMpv
         VGFte6Ev1bkTYsKh66dG4YTyT9rF2Lgq3rKTH/mmVz4zstbn3w9hjNb1relQP5q9OHlo
         ImW4lWBVmMDi3ASnBvyIWoN3zpplgoGJBIItY40bdZOpJGEoW/R3djEiq2SinnI36AGb
         QwPCmVmMx8j6QxFZGilrMdyWImNgpxhvA++Lst8tvICIE8p3CiqVQPL3Rpc7feUG5Gw9
         WcJw==
X-Gm-Message-State: AOAM531I1Cx9Kx1EU4dwlHwNuGHmPO/LgtGTOpjybbgTqiF69iEkEr2i
        fhQANTjGmjA+i1Mr6qjIyGyIa1z5lzEwkIoYxuyFdgCIRIcPz3ExD7g47eWQ2ZENGjPCXoj2GiV
        zLWWJcxYRgpv5op3vb0Zt
X-Received: by 2002:a17:906:9a1:: with SMTP id q1mr1752124eje.30.1601456650443;
        Wed, 30 Sep 2020 02:04:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSoN+r2eWqXyZxpSYN74YclCtPgiL0JJopctRhGOIbldFXa2fJrk4QGzlGoVfZZWIRuUcEmQ==
X-Received: by 2002:a17:906:9a1:: with SMTP id q1mr1752106eje.30.1601456650199;
        Wed, 30 Sep 2020 02:04:10 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id qu11sm994756ejb.15.2020.09.30.02.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 02:04:09 -0700 (PDT)
Subject: Re: RTL8402 stops working after hibernate/resume
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Petr Tesarik <ptesarik@suse.cz>
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
 <5f2d3d48-9d1d-e9fe-49bc-d1feeb8a92eb@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1c2d888a-5702-cca9-195c-23c3d0d936b9@redhat.com>
Date:   Wed, 30 Sep 2020 11:04:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5f2d3d48-9d1d-e9fe-49bc-d1feeb8a92eb@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 9/29/20 10:35 PM, Heiner Kallweit wrote:
> On 29.09.2020 22:08, Hans de Goede wrote:

<snip>

>> Also some remarks about this while I'm being a bit grumpy about
>> all this anyways (sorry):
>>
>> 1. 9f0b54cd167219 ("r8169: move switching optional clock on/off
>> to pll power functions") commit's message does not seem to really
>> explain why this change was made...
>>
>> 2. If a git blame would have been done to find the commit adding
>> the clk support: commit c2f6f3ee7f22 ("r8169: Get and enable optional ether_clk clock")
>> then you could have known that the clk in question is an external
>> clock for the entire chip, the commit message pretty clearly states
>> this (although "the entire" part is implied only) :
>>
>> "On some boards a platform clock is used as clock for the r8169 chip,
>> this commit adds support for getting and enabling this clock (assuming
>> it has an "ether_clk" alias set on it).
>>
> Even if the missing clock would stop the network chip completely,
> this shouldn't freeze the system as described by Petr.
> In some old RTL8169S spec an external 25MHz clock is mentioned,
> what matches the MII bus frequency. Therefore I'm not 100% convinced
> that the clock is needed for basic chip operation, but due to
> Realtek not releasing datasheets I can't verify this.

Well if that 25 MHz is the only clock the chip has, then it basically
has to be on all the time since all clocked digital ASICs cannot work
without a clock.  Now pci-e is a packet-switched point-to-point bus,
so the ethernet chip not working should not freeze the entire system,
but I'm not really surprised that even though it should not do that,
that it still does.

> But yes, if reverting this change avoids the issue on Petr's system,
> then we should do it. A simple mechanical revert wouldn't work because
> source file structure has changed since then, so I'll prepare a patch
> that effectively reverts the change.

Great, thank you.

Regards,

Hans

