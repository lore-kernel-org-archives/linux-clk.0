Return-Path: <SRS0=5BjN=NU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B32C43441
	for <linux-clk@archiver.kernel.org>; Fri,  9 Nov 2018 18:48:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 457232089A
	for <linux-clk@archiver.kernel.org>; Fri,  9 Nov 2018 18:48:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=koalo-de.20150623.gappssmtp.com header.i=@koalo-de.20150623.gappssmtp.com header.b="TYNZGzVD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 457232089A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=koalo.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbeKJE35 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Nov 2018 23:29:57 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40564 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728162AbeKJE35 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Nov 2018 23:29:57 -0500
Received: by mail-ed1-f65.google.com with SMTP id d3so1957217edx.7
        for <linux-clk@vger.kernel.org>; Fri, 09 Nov 2018 10:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=koalo-de.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=roM9piOpylr6IsQMgnlih5B3O7zG0iJ2MHglJe1pfRU=;
        b=TYNZGzVDcm29byFmq6ffM/leV/duhznhDSpuI6aIAxejQCsZbstylB+i6+dYa5NyWP
         CASPeSXSCL/TPa8v8zSV3jEclyAm6yYzx1Hg2PWYl/awrr3Cc1iyxqXg5G9SPi3Aj2Yy
         2muRX2zSg92m/JjQSoZlOQSw/ffwIM/Mw24dEZAveex2gHmeGfBwPloWxuBCKanQf4h3
         i4C7/NlQI3fd/f3ZvfCEepxmWlC7nA6gfBLqfz66CePfdvRrkCviiUB4HbyLNqstEppG
         Qqlu2Ub7rE2cA8sO5OdVKJD+nfhZNdqyzTS55jEvtEUOmR/7gb1On6YjBzJtvqpnJ1Jh
         0DfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=roM9piOpylr6IsQMgnlih5B3O7zG0iJ2MHglJe1pfRU=;
        b=MkHWUlsztVuwMlgCB9Rkde9NOBx4pihCdgkL0+51HfosyuLsM7Ii2d0GGKrsqseT4N
         xLjQ6CY4mFdzvzd0JfPnCC6eB/x8Bz8OEFpT54I3MwwDkEctYDNEMJHqjuUaZu1lskQa
         SnHkYmnGg0xTidmtB4amsz6g/XemGFqPJe+jCuYvWcjl6VDl3znN85p+I9w52/wmTuhr
         OixfVrR9R2UMM8Rp4ru5GWVkr2OL6F2WWhRbjQwjxc2X74zQChJJpP4cyWaXpRZbS31t
         246tUAL2bVIrIdqFC6aOBLebH+LnDs+HSqaw3Fe9cQXynt9O1ktMe8jT+d52+sR2PaUD
         p+Lw==
X-Gm-Message-State: AGRZ1gKd+0ZfR00N30yDP6ncuilfAIJ4HwUIVmA6507YtDWHhn/VctBX
        miyqNz6pIl+NzCKbIrvZ8p/WkRYMKbQjNQ==
X-Google-Smtp-Source: AJdET5cxgQ3URisTObXYIqB0xHhXOj5gTL0Qscne6axNSAg9lBMsDHG9BGWoESvog7gP06aunKBhnA==
X-Received: by 2002:a50:8e8c:: with SMTP id w12-v6mr3475772edw.280.1541789285420;
        Fri, 09 Nov 2018 10:48:05 -0800 (PST)
Received: from ?IPv6:2001:16b8:66a2:a300:dca4:98c2:96b1:7794? (200116b866a2a300dca498c296b17794.dip.versatel-1u1.de. [2001:16b8:66a2:a300:dca4:98c2:96b1:7794])
        by smtp.googlemail.com with ESMTPSA id b18-v6sm1123977eju.38.2018.11.09.10.48.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Nov 2018 10:48:04 -0800 (PST)
Subject: Re: [PATCH 0/3] Fix MODULE_LICENSE of bcm2835 drivers
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Chris Boot <bootc@bootc.net>, dmaengine@vger.kernel.org,
        linux-spi@vger.kernel.org, Martin Sperl <kernel@martin.sperl.org>,
        Florian Meier <florian.meier@koalo.de>,
        Eric Anholt <eric@anholt.net>,
        linux-arm-kernel@lists.infradead.org
References: <1540292769-5905-1-git-send-email-stefan.wahren@i2se.com>
 <815844594.141792.1541616607053@email.ionos.de>
From:   Florian Kauer <florian.kauer@koalo.de>
Message-ID: <26a93a5d-0ed2-b82d-3a0b-ef2888c59af0@koalo.de>
Date:   Fri, 9 Nov 2018 19:48:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <815844594.141792.1541616607053@email.ionos.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Sorry for not replying in time. I became father recently ;-)
So if it is still relevant:
Acked-by: Florian Kauer <florian.kauer@koalo.de>

On 07.11.2018 19:50, Stefan Wahren wrote:
> Hi Mark,
> hi Vinod,
> 
>> Stefan Wahren <stefan.wahren@i2se.com> hat am 23. Oktober 2018 um 13:06 geschrieben:
>>
>>
>> In preparation of a treewide switch of all bcm2835 drivers to SPDX tags,
>> we need to make sure that the license text and MODULE_LICENSE matches.
>>
>> This series starts sooner than usual to have more time to collect the authors
>> ACK.
>>
>> Stefan Wahren (3):
>>    clk: bcm2835: make license text and module license match
>>    dma: bcm2835: make license text and module license match
>>    spi: bcm2835: make license text and module license match
>>
>>   drivers/clk/bcm/clk-bcm2835-aux.c | 2 +-
>>   drivers/clk/bcm/clk-bcm2835.c     | 2 +-
>>   drivers/dma/bcm2835-dma.c         | 2 +-
>>   drivers/spi/spi-bcm2835.c         | 2 +-
>>   drivers/spi/spi-bcm2835aux.c      | 2 +-
>>   5 files changed, 5 insertions(+), 5 deletions(-)
>>
> 
> since i didn't receive any objections from the authors, could you please apply or should i resend with Eric's Reviewed-by?
> 
