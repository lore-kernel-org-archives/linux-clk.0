Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8217EB64DD
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jul 2023 00:19:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjGYATK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jul 2023 20:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbjGYATJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jul 2023 20:19:09 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1FE6115
        for <linux-clk@vger.kernel.org>; Mon, 24 Jul 2023 17:19:07 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-63cebd0a7c5so10758026d6.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Jul 2023 17:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690244347; x=1690849147;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sq0tUX0m/kKmcUPSfS7G+SqKh/SFxtieh6Kx29IV+n8=;
        b=EUywN4k8ZBlW1nadUa29eLEOdH3pCrlRPM38Dh62Vmnq/iMAVdw0Ixm/aK70TEJGqc
         4cQWaBY3fVumozavXkbcUZF4hvAoOSY6UUXvvNCByfnC+zQPioTWT0I8aBujom+z9d37
         43EXKzwgW3XchgFfr5fv607BRpDOzFslNst7Ra1mB6vA/cjCTJDS69PBsUZgZBEs8dqF
         YUBvvp6KdxqsBgc+VE0DkGWAROACufuWvzWus5kQiUivf7qUAJgwLBkPhSBeJMFoLSCJ
         Ivr4oq93VZl4j9rd3e0lvzGIP86MKL7TvGJYP+StElRU8yym4xIh8ORf/hnbMfdWcFf1
         2F4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690244347; x=1690849147;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sq0tUX0m/kKmcUPSfS7G+SqKh/SFxtieh6Kx29IV+n8=;
        b=FswA151eWmZGyzcpo/VrKN/k4g1NYX94mjzHGrgZt8TYVXa9AmhtTfXxUIORBDhZBl
         Y6llOS0NnJBe5FesukeJ9bYDHcz6acodDo4TnGKA+6oJJSujnB4dFvJZYD20H6/Jtxdm
         jLfLf1ClbWuamGhKwfSoU+8hy321VXf0sx/cnur1I9e3Y0Y/D/11rZ7qZKTLYRf05uRB
         07hCev/HIyyVUj9oYon3auztdsV/k+YoW2MyvWCiVunIUSBxNFHSb9YZbWvHG0XVKelx
         0hLS/hXEPySr/LQirJrM46g9P7w2iJR0Drs4rgMqCaLV8I28vgBQDC5kUo4BjyxPLbZo
         J/WQ==
X-Gm-Message-State: ABy/qLZiIDjT/brTzCOo8lXVufJf+lKjzWXQgKjM1izfvHjHZuBRNVbi
        5smFNNPPNgA9J9XNjvoRISmHhQ==
X-Google-Smtp-Source: APBJJlH2pGX6WFQ4Mo0OhprlCwim/m4qlDB1/3eYQHooa3S+JB/LRDpGfIMqy6v4oKiX30M/exUPAg==
X-Received: by 2002:a05:622a:1ba5:b0:405:4709:ba6b with SMTP id bp37-20020a05622a1ba500b004054709ba6bmr1401835qtb.16.1690244346983;
        Mon, 24 Jul 2023 17:19:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:d28:aa2f:eead:2774? ([2600:1700:2000:b002:d28:aa2f:eead:2774])
        by smtp.gmail.com with ESMTPSA id l28-20020ac84cdc000000b00401217aa51dsm3707909qtv.76.2023.07.24.17.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 17:19:06 -0700 (PDT)
Message-ID: <dc0d7cb8-e855-3453-25e4-e2caa77e6d7f@sifive.com>
Date:   Mon, 24 Jul 2023 19:19:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: sifive: Allow building the driver as a module
Content-Language: en-US
To:     Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20230717210356.2794736-1-samuel.holland@sifive.com>
 <20230717210356.2794736-2-samuel.holland@sifive.com>
 <CAJM55Z9B6atT_t4321kOCGWoeqLxe+ZBsJDr4BeV1byaeYw5fw@mail.gmail.com>
From:   Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAJM55Z9B6atT_t4321kOCGWoeqLxe+ZBsJDr4BeV1byaeYw5fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2023-07-19 9:18 AM, Emil Renner Berthing wrote:
> On Wed, 19 Jul 2023 at 10:07, Samuel Holland <samuel.holland@sifive.com> wrote:
>>
>> This can reduce the kernel image size in multiplatform configurations.
> 
> I don't mind this, but booting without this driver also means there is
> no uart for debug output or any other peripheral until the kernel gets
> to the initrd to load the driver. Does the earlycon console work all
> the way until we reach the initrd? Otherwise I can't imagine many
> scenarios where configuring this as a module is desirable.

Thanks for the review.

Yes, an "earlycon" command-line argument still works after this change, since
the stdout-path UART already has its clock set up by a previous boot stage.

>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>>  drivers/clk/sifive/Kconfig       | 2 +-
>>  drivers/clk/sifive/sifive-prci.c | 8 +++-----
>>  2 files changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
>> index 2322f634a910..49597d95602e 100644
>> --- a/drivers/clk/sifive/Kconfig
>> +++ b/drivers/clk/sifive/Kconfig
>> @@ -10,7 +10,7 @@ menuconfig CLK_SIFIVE
>>  if CLK_SIFIVE
>>
>>  config CLK_SIFIVE_PRCI
>> -       bool "PRCI driver for SiFive SoCs"
>> +       tristate "PRCI driver for SiFive SoCs"
>>         default ARCH_SIFIVE
>>         select RESET_CONTROLLER
>>         select RESET_SIMPLE
>> diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
>> index e317f3454e93..8c67d1a7c8df 100644
>> --- a/drivers/clk/sifive/sifive-prci.c
>> +++ b/drivers/clk/sifive/sifive-prci.c
>> @@ -7,6 +7,7 @@
>>  #include <linux/clkdev.h>
>>  #include <linux/delay.h>
>>  #include <linux/io.h>
>> +#include <linux/module.h>
>>  #include <linux/of_device.h>
>>  #include "sifive-prci.h"
>>  #include "fu540-prci.h"
>> @@ -618,9 +619,6 @@ static struct platform_driver sifive_prci_driver = {
>>         },
>>         .probe = sifive_prci_probe,
>>  };
>> +module_platform_driver(sifive_prci_driver);
>>
>> -static int __init sifive_prci_init(void)
>> -{
>> -       return platform_driver_register(&sifive_prci_driver);
>> -}
>> -core_initcall(sifive_prci_init);
> 
> Maybe also add the MODULE_AUTHOR() and MODULE_DESCRIPTION() macros
> while you're at it.

Will do.

>> +MODULE_LICENSE("GPL");
>> --
>> 2.40.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

