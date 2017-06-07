Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mx07-00252a01.pphosted.com ([62.209.51.214]:9091 "EHLO
        mx07-00252a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751460AbdFGUxA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jun 2017 16:53:00 -0400
Received: from pps.filterd (m0102628.ppops.net [127.0.0.1])
        by mx07-00252a01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v57KnUwY006530
        for <linux-clk@vger.kernel.org>; Wed, 7 Jun 2017 21:52:58 +0100
Received: from mail-wr0-f200.google.com (mail-wr0-f200.google.com [209.85.128.200])
        by mx07-00252a01.pphosted.com with ESMTP id 2aujgyt7hx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
        for <linux-clk@vger.kernel.org>; Wed, 07 Jun 2017 21:52:58 +0100
Received: by mail-wr0-f200.google.com with SMTP id g36so2749791wrg.4
        for <linux-clk@vger.kernel.org>; Wed, 07 Jun 2017 13:52:58 -0700 (PDT)
Subject: Re: [PATCH 0/2] Add bcm2835aux interrupt controller
To: Stefan Wahren <stefan.wahren@i2se.com>
References: <6dc301c8-e5a2-1334-c476-1ce7e303787f@raspberrypi.org>
 <1357388068.219504.1496867858076@email.1und1.de>
Cc: alexanders83@web.de, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
From: Phil Elwell <phil@raspberrypi.org>
Message-ID: <89e725de-c77d-6a24-3ae5-9acb061cd6bb@raspberrypi.org>
Date: Wed, 7 Jun 2017 21:55:27 +0100
MIME-Version: 1.0
In-Reply-To: <1357388068.219504.1496867858076@email.1und1.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/06/2017 21:37, Stefan Wahren wrote:
> Hi Phil,
>
>> Phil Elwell <phil@raspberrypi.org> hat am 7. Juni 2017 um 13:11 geschrieben:
>>
>>
>> Devices in the AUX block share a common interrupt line, with a register
>> indicating which devices have active IRQs. Expose this as a nested
>> interrupt controller to avoid IRQ sharing problems (easily observed if
>> UART1 and SPI1/2 are enabled simultaneously).
>>
>> The interrupt functionality could arguably be forked off as a separate
>> irqchip driver, but the clock driver has already claimed the AUX_IRQ
>> register so some driver and DT surgery would still be required.
>> Eric Anholt thought that including it here is reasonable, but I'm
>> prepared to split it out if this is considered too hacky.
>
> in order to give the maintainers (e.g. irqchip) a chance, they should be included into CC.

Will do.

>> Phil Elwell (2):
>>   clk: bcm2835: Add AUX interrupt controller
>
> Either way the dt-binding must be updated as a separate patch. So Rob can review it.

Thanks, Stefan - I'll add that to v2.

Phil

