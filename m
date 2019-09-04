Return-Path: <SRS0=96bN=W7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5A3C3A5A8
	for <linux-clk@archiver.kernel.org>; Wed,  4 Sep 2019 18:17:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1141F208E4
	for <linux-clk@archiver.kernel.org>; Wed,  4 Sep 2019 18:17:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="X+onD9qh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390032AbfIDSR4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Sep 2019 14:17:56 -0400
Received: from mout.gmx.net ([212.227.17.22]:33867 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389848AbfIDSRz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Sep 2019 14:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1567621066;
        bh=wp3BFGHf3e9AqYMhwToQMhDhg3qcuPDQepOHeW8aOYk=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
        b=X+onD9qh1JhH2DtCoOar3q8MT+GBAs6DN4VHQlS3hudOOKtjTbHicWWaR0sYXPgaq
         NyPe0vUDkNLYSl1L5Py9Rb9U8zZymUC3OPuJuvWm4K9nPsbPxJvlEB0LDsKZ5hAGY3
         IlY/vepLcTIQ1rTkaOf8o80uMPhNjjK4wnwuMbGQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.140]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFbVu-1hxGGV3qV4-00HBDy; Wed, 04
 Sep 2019 20:17:46 +0200
Subject: Re: [PATCH 0/4] clk: bcm2835: Add bcm2711 support
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
References: <1566145424-3186-1-git-send-email-wahrenst@gmx.net>
 <af92fd53-1e3b-0022-e402-74c18bb1a859@gmx.net>
Message-ID: <436b1ed5-7fa2-384a-8bd6-11b3eefd6f5a@gmx.net>
Date:   Wed, 4 Sep 2019 20:17:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <af92fd53-1e3b-0022-e402-74c18bb1a859@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:3RHGuVpzYYzUCA3O+n0sLZVO40xK9bVLfov9pBArKiR2+Qoxe3J
 I1L3K64fx2B0yRY/A+Ewzj9QcuKe7NUsp0meNtSu0cacQvM9Mj3kuTL1vveIsiSShAYQoTk
 V9Vn1mLFxfj49FXauBPfn+8Mzw2vI6ppBaEofPP36Bk+aSVBufHv+lFsZmi0E7oeQZuSJE1
 uDVxCeyj6KjGfClUTPwpA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eoWzTk115Kg=:4+ogYgyhKaxwu0Do1C0aI6
 g3O6FO6riNGpMBnP7jHUkMiRqZwBTX/lODxw6zyIxAGtADB+/LMnyfJnp1jXvFScFF0Ghn1hj
 XDfO7BBs9VrgZDBlrVB8RA5yUfVQuCwHusbGR3Z9NmXVqKzsdDIMM1c/svYMTM4yZ+kiqxSm2
 LHELu6qPKCbyi9gk6ItG8CVywuy3sA5VQlENaLe38P9O+G/xPZhxbsTZRQk+AOO1pmUjT5OwC
 d/o1LrGvrQTG/oZ0WE9afy7Z+Luqcx0suKPzuL5ffWNMkk5/61wbX1bZYL2CDL9LMyAsll+tK
 FWaVX7EwUm7GcyzjkYVMMEoU4aX3ser9tY+5Vdvt01cXLsfwFQfIgHJ2YdA93x0BK0TVfry7k
 qLe/YBeibqNozaydIpFQj9umgHbtp717AfwGpuwP9b4RC5uR5QL25dDzcSNU2XGv7hiSCw8Tv
 a3MV9klehnCtiCWUsjEOseDoTCkU7GYfaP/5kiXHVZqhoTDZfdOhE3hk1I5hzxq4CdTBKzOgi
 dribp3w3xcHxmwsa2EcrRNLm57sr6w+ddj1lOu8h3lzkiO7X4Vd3VCpZ/d8mPZ8hemIvHBP92
 ZP08eqPnoLmfq6GPxlTw8YN/eT4CrQURIm/xcnpzX0onUcuVg/GOwsJz3GkrxdYHjnOO1gs9h
 v92O5uXJrVPAvVnLTqJtE4Krxko4hMdog8vfB09qXTnrACVvTc+UQCUnbkndCKeZwCHI5hlBX
 uCEApy14G6m40+FzH4puG0SBZDdqOpqUP8TQd4HhmoZXXXxVfcldCoaZ9YsyVM1dcW6VkfqeN
 yes3jpmniSAwtoQmj3MTfDZhLivphaumUhRTf8fzYEUS8uMUGzMZpJ1DDl9L+S7MJZRHLU58f
 rfcfzFm3+c0fcMN9nL7rr9EBRo74ujHrP8e9Mi7nRJicPfFlzDBLnrQv6lsvfL0QopMimb215
 ddDiPXbqlRcoZTSYTCBjloI9hXXNgZ7VxBF+iOzwjWcGD2RrbcQyqY4o4KaXyasniPY+I/cn7
 +y5EfD+ceY1IyX1mrV3WENsJDJvipmBkhHI0gcZ12BceX/7oI70/IS0SPdiUNns2Pq2lIs2v5
 g19FX5lSB4uUapT9msTpTZG/pvJ0bZKSGts6AlJyaw3Z7vJ6EFOVwDx1zndoK0ngwASSflvw5
 JyqyZfLBtqGK4aMMcCkgmHy1XbHsd/JIORPddf4u0jh+4gXZeOE2vVmWzzOhjfKmzMSpuJlQT
 8oWVqSp6PsgERs05P
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

Am 26.08.19 um 20:16 schrieb Stefan Wahren:
> Hi Stephen,
>
> Am 18.08.19 um 18:23 schrieb Stefan Wahren:
>> This series has been split out of the recent Raspberry Pi 4 support
>> series [1]. There are no functional changes, just an explaining commit
>> for marking PLLD_PER as critical as request by Stephen Boyd.
>>
>> [1] - https://marc.info/?l=3Dlinux-arm-kernel&m=3D156571347332483
>>
>> Stefan Wahren (4):
>>   dt-bindings: bcm2835-cprman: Add bcm2711 support
>>   clk: bcm2835: Introduce SoC specific clock registration
>>   clk: bcm2835: Add BCM2711_CLOCK_EMMC2 support
>>   clk: bcm2835: Mark PLLD_PER as CRITICAL
>>
>>  .../bindings/clock/brcm,bcm2835-cprman.txt         |   4 +-
>>  drivers/clk/bcm/clk-bcm2835.c                      | 138 ++++++++++++++++=
>> ++---
>>  include/dt-bindings/clock/bcm2835.h                |   2 +
>>  3 files changed, 125 insertions(+), 19 deletions(-)
>>
>> =2D-
>> 2.7.4
>>
> gentle ping ...
gentle ping ...
