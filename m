Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC477C19F29
	for <linux-clk@archiver.kernel.org>; Wed, 27 Jul 2022 12:19:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbiG0MTE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Jul 2022 08:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiG0MTD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Jul 2022 08:19:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 988294AD51
        for <linux-clk@vger.kernel.org>; Wed, 27 Jul 2022 05:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658924338;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WmCiTMtuhWI7oCif0/8Z84LPgcREuckswJDytFqvLLY=;
        b=R/zD2k/ExCCmb6OC/OwUpIWWQpJwTcYms/cbpUfZ5e0qKVhevp5y/eoKCdpwcuaChMgQya
        hP/x99UaD61R6Oyqyd0HCNvR4ESTLfqMFREFvsjlGNivFn6ozAexRQxTJQM/qpVayNtIcp
        lZ7T1ggzUgBPkUB62uBfPD8XXqtO7LY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-XbqVOf-qP_GhenuOexAb5A-1; Wed, 27 Jul 2022 08:18:57 -0400
X-MC-Unique: XbqVOf-qP_GhenuOexAb5A-1
Received: by mail-ed1-f70.google.com with SMTP id w15-20020a056402268f00b0043be4012ea9so6395560edd.4
        for <linux-clk@vger.kernel.org>; Wed, 27 Jul 2022 05:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WmCiTMtuhWI7oCif0/8Z84LPgcREuckswJDytFqvLLY=;
        b=DRSN3/DD2ofEPdpAHhoM4RzhjC579hhK39ueo9ebkeKg/UzlClmvfDZGstuGNF3Yxd
         j2FibszEA7YeLXolV3gRKtC6JzG1jzkP57rFqReHjwJ3eZ2YO74qi1JMNvfp0bNCF/Y8
         UfDMKUkL7bWJSE57ToLQxR87V2iLxP8UgEosCE/k6/9Z6C0dYGS+lTUzGhiD4ddK8eHr
         4BKbzgEYEePzD+lBH9Q6qavH++RFatpw9kpVrGQi4E0R61wOhctInNxvYQyFxUe3Vda7
         kQacAZygkzxx6eNXDp9kVjMNfsTx2b/5wGbLCqK75VI3Hj8aSdu6ppFCi/TVTWwwGDvm
         Ieew==
X-Gm-Message-State: AJIora/mlytdwALXMh1j55sv+UPvBo6sMo7yiJoaT2pfpV86IILvJYJP
        LzEzkJZ2OQmz3xdtE96AKfiOGFcWoJp08xDByrjOoPbnlxX8jshl9m45ythF+Y62EfEjPlvFTvr
        Y9hxhjF560PulQXI/DvGe
X-Received: by 2002:a17:907:7245:b0:72f:39e7:1207 with SMTP id ds5-20020a170907724500b0072f39e71207mr17507006ejc.201.1658924336254;
        Wed, 27 Jul 2022 05:18:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tq77tz3LjPQkemKAdpM2HQ6LQo5dMeyMGCTEGREBkr8scpvEfFdsmnmo1I0sOl4/nEv/Ym3Q==
X-Received: by 2002:a17:907:7245:b0:72f:39e7:1207 with SMTP id ds5-20020a170907724500b0072f39e71207mr17506990ejc.201.1658924335983;
        Wed, 27 Jul 2022 05:18:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906310b00b00722fc0779e3sm7443534ejx.85.2022.07.27.05.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 05:18:55 -0700 (PDT)
Message-ID: <08c744e6-385b-8fcf-ecdf-1292b5869f94@redhat.com>
Date:   Wed, 27 Jul 2022 14:18:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [BISECTED] igb initialization failure on Bay Trail
Content-Language: en-US
To:     "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
Cc:     andriy.shevchenko@linux.intel.com, carlo@endlessm.com,
        davem@davemloft.net, hkallweit1@gmail.com, js@sig21.net,
        linux-clk@vger.kernel.org, linux-wireless@vger.kernel.org,
        mturquette@baylibre.com, netdev@vger.kernel.org,
        pierre-louis.bossart@linux.intel.com, sboyd@kernel.org
References: <20180912093456.23400-4-hdegoede@redhat.com>
 <20220724210037.3906-1-matwey.kornilov@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220724210037.3906-1-matwey.kornilov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Paul,

On 7/24/22 23:00, Matwey V. Kornilov wrote:
> Hello,
> 
> I've just found that the following commit
> 
>     648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
> 
> breaks the ethernet on my Lex 3I380CW (Atom E3845) motherboard. The board is
> equipped with dual Intel I211 based 1Gbps copper ethernet.
> 
> Before the commit I see the following:
> 
>      igb 0000:01:00.0: added PHC on eth0
>      igb 0000:01:00.0: Intel(R) Gigabit Ethernet Network Connection
>      igb 0000:01:00.0: eth0: (PCIe:2.5Gb/s:Width x1) 4c:02:89:10:02:e4
>      igb 0000:01:00.0: eth0: PBA No: FFFFFF-0FF
>      igb 0000:01:00.0: Using MSI-X interrupts. 2 rx queue(s), 2 tx queue(s)
>      igb 0000:02:00.0: added PHC on eth1
>      igb 0000:02:00.0: Intel(R) Gigabit Ethernet Network Connection
>      igb 0000:02:00.0: eth1: (PCIe:2.5Gb/s:Width x1) 4c:02:89:10:02:e5
>      igb 0000:02:00.0: eth1: PBA No: FFFFFF-0FF
>      igb 0000:02:00.0: Using MSI-X interrupts. 2 rx queue(s), 2 tx queue(s)
> 
> while when the commit is applied I see the following:
> 
>      igb 0000:01:00.0: added PHC on eth0
>      igb 0000:01:00.0: Intel(R) Gigabit Ethernet Network Connection
>      igb 0000:01:00.0: eth0: (PCIe:2.5Gb/s:Width x1) 4c:02:89:10:02:e4
>      igb 0000:01:00.0: eth0: PBA No: FFFFFF-0FF
>      igb 0000:01:00.0: Using MSI-X interrupts. 2 rx queue(s), 2 tx queue(s)
>      igb: probe of 0000:02:00.0 failed with error -2
> 
> Please note, that the second ethernet initialization is failed.
> 
> 
> See also: http://www.lex.com.tw/products/pdf/3I380A&3I380CW.pdf

Yes some boards use more then 1 clk for the ethernet and do not take
care of enabling/disabling the clk in their ACPI.

As Pierre-Louis mentioned already the disabling of the clocks is necessary
to make 100-s of different (tablet) models suspend properly.

Unfortunately this is known to break ethernet on some boards. As a workaround
we use DMI quirks on those few boards to keep the clocks enabled there, see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/pmc_atom.c#n381

If you can submit a patch adding your board to this DMI table, then I will
merge it and get it on its way to Linus Torvalds asap.

If you instead want me to write the patch for you, please run:

sudo dmidecode > dmidecode.txt

And attach the generated dmidecode.txt file to your next email.

Regards,

Hans

