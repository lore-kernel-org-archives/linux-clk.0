Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71256C433E0
	for <linux-clk@archiver.kernel.org>; Sun, 14 Mar 2021 11:05:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40CC364EB7
	for <linux-clk@archiver.kernel.org>; Sun, 14 Mar 2021 11:05:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234362AbhCNLFB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Mar 2021 07:05:01 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:58789 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235225AbhCNLEg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 14 Mar 2021 07:04:36 -0400
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lLOXx-0003NH-Pt
        for linux-clk@vger.kernel.org; Sun, 14 Mar 2021 11:04:33 +0000
Received: by mail-wr1-f70.google.com with SMTP id h5so13606537wrr.17
        for <linux-clk@vger.kernel.org>; Sun, 14 Mar 2021 04:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/4FZlK8TmHAjuapB8AlwDbpmIGJr32ZFSixHpqXZ9pg=;
        b=hlovtTBpTikNkMpKKa+rYgnfwN2Qzh+n56VCyshZkxS0hRCwCRU7i0p8dvrF/IRU1H
         JrIv+7ruq1ZXwq+htsBvIg66iPvC4A1QWL3bIyFYfzVP8hjEpurqA/WNicBh/8L6POJq
         EAtM5/GmbgnFefgWo9pDOlPpYfZBgRieLeHrPixqrj/2KvdEtpGXnokMXGLRjlScu6ZH
         PkTDFcViwMRSrLzPfgTpQXaZhwl0S4YxrJvBuFi9nh62lG5I63JDTSAkZoEm9hzSLjnC
         jSATvM8/uHA41MhQt1Rcnn6fS4rZ21jZZGTxMNqg2MDLFNBUHyhF6xDeUGN5xW5OiP94
         Ae7w==
X-Gm-Message-State: AOAM532j0LMPve70KkfC+zVW4JDJvO4OP1KRFBj9QCbb72xZUN+JGX58
        nMsn9lTSeMF9A2lKAb1hIoPjqBwCVL/9a/G6fp2z89YPEEowrtcnHpMkg1MxIGad3rAzi5AZaUl
        NeRxBz55pkuX5jTXOOJxkICGNDOy0/IVDxccvTw==
X-Received: by 2002:a7b:cbc1:: with SMTP id n1mr21780640wmi.30.1615719873245;
        Sun, 14 Mar 2021 04:04:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjd1ztS9AgHaBu5UXec7saJLQB/ttHqHk3WZPTd6ZQaBlxShB38VGGEsz1DOst3D3NEHuVEQ==
X-Received: by 2002:a7b:cbc1:: with SMTP id n1mr21780629wmi.30.1615719873105;
        Sun, 14 Mar 2021 04:04:33 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id v6sm14931080wrx.32.2021.03.14.04.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Mar 2021 04:04:32 -0700 (PDT)
Subject: Re: [PATCH] clk: socfpga: fix iomem pointer cast on 64-bit
To:     Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>
References: <20210311144833.1313387-1-krzysztof.kozlowski@canonical.com>
 <161566984049.1478170.1891806275092209249@swboyd.mtv.corp.google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <7943a259-d40c-4191-1d0d-461edfc3a218@canonical.com>
Date:   Sun, 14 Mar 2021 12:04:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161566984049.1478170.1891806275092209249@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/03/2021 22:10, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2021-03-11 06:48:33)
>> Pointers should be cast to unsigned long instead of integer.  This fixes
>> warning when compile testing on ARM64:
>>
>>   drivers/clk/socfpga/clk-gate.c: In function ‘socfpga_clk_recalc_rate’:
>>   drivers/clk/socfpga/clk-gate.c:102:7: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> Any Fixes tag?

I'll add it.

> 
>> ---
>>  drivers/clk/socfpga/clk-gate.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
>> index 43ecd507bf83..c876523d5d51 100644
>> --- a/drivers/clk/socfpga/clk-gate.c
>> +++ b/drivers/clk/socfpga/clk-gate.c
>> @@ -99,7 +99,7 @@ static unsigned long socfpga_clk_recalc_rate(struct clk_hw *hwclk,
>>                 val = readl(socfpgaclk->div_reg) >> socfpgaclk->shift;
>>                 val &= GENMASK(socfpgaclk->width - 1, 0);
>>                 /* Check for GPIO_DB_CLK by its offset */
>> -               if ((int) socfpgaclk->div_reg & SOCFPGA_GPIO_DB_CLK_OFFSET)
>> +               if ((unsigned long) socfpgaclk->div_reg & SOCFPGA_GPIO_DB_CLK_OFFSET)
> 
> Should it be uintptr_t casted instead?

Good point, thanks!

> his isn't a very great code
> pattern given the way we store information in the iomem pointer about
> which clk type it is and then have to cast the pointer and assume
> alignment. Would be nice to get rid of it but I understand.

Best regards,
Krzysztof
