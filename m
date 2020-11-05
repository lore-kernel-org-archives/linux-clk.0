Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B105AC4741F
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 18:54:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BAEB2078E
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 18:54:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="vubNPTNX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729862AbgKESyG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Nov 2020 13:54:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729783AbgKESyF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Nov 2020 13:54:05 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F103C0613CF
        for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2020 10:54:04 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id h4so537053pjk.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2020 10:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=HtLxZkv0TYlH01o2C6+4735a4rHSzmaJuyNckO1OmEo=;
        b=vubNPTNXQb0W2AOa0qY3gSc9NNtvmPNZtHq+hbpfahbGOKrqfc8qEIFLmJR6OjIrnz
         M2PKlPGln2O2B4T1T5fL+0eOnI93x+JUEpPyca+11W+R0NFkacD7yvvALn3ptG8FC+9J
         gT6UaSXZVREeguoRzPh8+TsG659OPAXdFkqLjc5NTgqNjAxP1F95L4i7MhGGpJUPb8UQ
         SefnFxeKpHGoL4suJs1Z4wRUrGHezEQMIAXKUQ+SPVezcECpLxvb75IcsQucNFZIFr0m
         brJ2tp/B0cUXkZMRbyxyR6GE9J7jC/5iZhbG8g8UtAEH2fDDSYIBtRGTfRCTl7rtsayU
         sB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=HtLxZkv0TYlH01o2C6+4735a4rHSzmaJuyNckO1OmEo=;
        b=QUy6PfwaMOip1vKWEFxeBFgnOZqXboZVdGr1G3dtdnILgLBX/qgDySTHGrV8C/aAFR
         a9xNq+Fzd4uqD/dE2N3ONhVAvFeCPUklSZ9xMyzSC1+SZk8cJXb5wFmuFFd+YhJmWpcC
         isPAl+ZyhwtLSI8YgBYkLgrEtNRIe/R+Dfb70ZhlG2fvosRZ4cflB4/i5LYV1qG6/A+4
         kWqmAq3GRt/xI6QvVOe3rb26gmttxYLGVJQ3MCT7XbZ6Q7UMr5fbr4ftx2Y5+Y8cCDfz
         96LGiG9Z4MofAeKx0SqSjlWuxzyzVKPYMrLZ6oBhSnan4b6tI55mNquPVmIGivvMfQlw
         QRHQ==
X-Gm-Message-State: AOAM533EvqTEqh3u9jIqX5bWxkG42sIGaMTx1UOh1rYaz+2g3mu6Ieud
        YpvRlmvsv5QOQO3tK5ZqVHpgRA==
X-Google-Smtp-Source: ABdhPJz3Aj79Afx5ycabhmbdXG/hrX0zqj+ndTipQTpQLmniaRkOC9FOCRo98/vWkB4/t2JnqKMMqg==
X-Received: by 2002:a17:90b:3798:: with SMTP id mz24mr3696165pjb.46.1604602443863;
        Thu, 05 Nov 2020 10:54:03 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id z13sm3027751pgc.44.2020.11.05.10.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 10:54:03 -0800 (PST)
Date:   Thu, 05 Nov 2020 10:54:03 -0800 (PST)
X-Google-Original-Date: Thu, 05 Nov 2020 10:53:03 PST (-0800)
Subject:     Re: [PATCH 2/4] clk: sifive: Use common name for prci configuration
In-Reply-To: <160454441626.3965362.17922436443029310228@swboyd.mtv.corp.google.com>
CC:     zong.li@sifive.com, aou@eecs.berkeley.edu,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, mturquette@baylibre.com,
        Paul Walmsley <paul.walmsley@sifive.com>, yash.shah@sifive.com,
        zong.li@sifive.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     sboyd@kernel.org
Message-ID: <mhng-e3785c68-4fbc-49be-aaa1-40043bcc1cab@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 04 Nov 2020 18:46:56 PST (-0800), sboyd@kernel.org wrote:
> Quoting Zong Li (2020-10-16 02:18:24)
>> Use generic name CLK_SIFIVE_PRCI instead of CLK_SIFIVE_FU540_PRCI. This
>> patch is prepared for fu740 support.
>> 
>> Signed-off-by: Zong Li <zong.li@sifive.com>
>> ---
>
> Looks ok but needs an ack from riscv maintainers to go through clk
> tree. I was worried it would break defconfigs but it seems that the arch
> selects the config so this should be OK, right?

Ya, looks fine.  TBH the whole Kconfig.socs thing was probably a mistake, but
at least in this case it makes things easy.

I was going to suggest spliting the Kconfigs out so there's a _FU540_PRCI and
an _FU740_PRCI, but looking at the code it doesn't really seem to buy us much
-- just that one offset table we could toss.

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

>>  arch/riscv/Kconfig.socs     | 2 +-
>>  drivers/clk/sifive/Kconfig  | 6 +++---
>>  drivers/clk/sifive/Makefile | 2 +-
>>  3 files changed, 5 insertions(+), 5 deletions(-)
>> 
>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>> index 8a55f6156661..3284d5c291be 100644
>> --- a/arch/riscv/Kconfig.socs
>> +++ b/arch/riscv/Kconfig.socs
>> @@ -5,7 +5,7 @@ config SOC_SIFIVE
>>         select SERIAL_SIFIVE if TTY
>>         select SERIAL_SIFIVE_CONSOLE if TTY
>>         select CLK_SIFIVE
>> -       select CLK_SIFIVE_FU540_PRCI
>> +       select CLK_SIFIVE_PRCI
>>         select SIFIVE_PLIC
>>         help
>>           This enables support for SiFive SoC platform hardware.
