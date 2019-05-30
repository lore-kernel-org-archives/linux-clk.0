Return-Path: <SRS0=/AGb=T6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E222C28CC0
	for <linux-clk@archiver.kernel.org>; Thu, 30 May 2019 13:16:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E86C42596F
	for <linux-clk@archiver.kernel.org>; Thu, 30 May 2019 13:16:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q72IpVwP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfE3NQb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 May 2019 09:16:31 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46375 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfE3NQb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 May 2019 09:16:31 -0400
Received: by mail-lf1-f68.google.com with SMTP id l26so4965642lfh.13;
        Thu, 30 May 2019 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:newsgroups:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/wo/IbEeAJ9hsENKT3caSWlfePL4jGoTXJCbueVNDgA=;
        b=Q72IpVwPw6IchK/vyAidzYWyEO6OG9P709yrvua0CMrz/RlZUHUi9zsBgxxnUIBv17
         lFnYWHS59WHi57gTvMwdShuxj6Ie9x9ImMRtkl7JDp1Mjk0vnVhh4CvWYwPYy0wN+Keg
         lHmlwijyZshMaT/yXgcGpYhEMt5+xPGJGFs77tmGqmCObDjODW4vs1wIyvqpeMmyQD4G
         XjbnvqwyWeqtEoDodAi80xk3hgMDLtOY0tCVgqJmOyQfN3I9YcQElEjF+YaLevLNUi+H
         1RStWXksOA9ud5BKClsroeJls+Y96O0cPnvK5maHj35YH4QS/aD0qFjEWkCpI9yDl9sh
         fIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:newsgroups:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/wo/IbEeAJ9hsENKT3caSWlfePL4jGoTXJCbueVNDgA=;
        b=IERjaFDWyaVPZ1NaCktmo5TJEUp+9hjYnHwCSMzs4e2UoZBN6yTw1HEDwx2w/43sL/
         LUhPqs/jvhbQOik4mGwkfAussEkJuGyvGiLAPErZdOwbE/8nVcSyUA4uSFkCJM/dQkG9
         if/ypcrhxZVrT+NPSzWH2RCWN3dGW4tkXi5ObuLuf0jSDua2hnCXMD8wUBNyLFL+rqJ6
         t72mKA2SORTL4ABP//tXSgLHlLS3fODB6rdTdwIPSKdNhi1Z1x7NYzHkSpLgNJ+zJiUQ
         QRp00WXJxSU+FODarQk2JxduUufGyHqjl+YYCpXFWdywX0WoLrFJW3FarEvpSKqegMCk
         rCug==
X-Gm-Message-State: APjAAAX5hycSqMpNpbLfikVG6vfv1St94hgGt2TRAbjnLbfJBXtN/ehc
        QlwXdDbh0DwGZ7qpTiYbJZk=
X-Google-Smtp-Source: APXvYqxpcgDwwYzwQSo6d4iOLauigH9H3tz8PaSQRCVDJa7sOicZdKK2t7a/GYAL3OvRBVkp6qP1fw==
X-Received: by 2002:a19:6b04:: with SMTP id d4mr2079636lfa.57.1559222188882;
        Thu, 30 May 2019 06:16:28 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id p5sm480738ljg.55.2019.05.30.06.16.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 06:16:28 -0700 (PDT)
Subject: Re: [PATCH V4 6/8] memory: tegra: Add EMC scaling sequence code for
 Tegra210
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Newsgroups: gmane.linux.ports.arm.kernel,gmane.linux.ports.tegra,gmane.linux.drivers.devicetree,gmane.linux.kernel.clk
References: <20190529082139.5581-1-josephl@nvidia.com>
 <20190529082139.5581-7-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3929cca9-5277-a88d-5270-c6c2a9c5c2a0@gmail.com>
Date:   Thu, 30 May 2019 16:16:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529082139.5581-7-josephl@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

29.05.2019 11:21, Joseph Lo пишет:
> This patch includes the sequence for clock tuning and the dynamic
> training mechanism for the clock above 800MHz.
> 
> And historically there have been different sequences to change the EMC
> clock. The sequence to be used is specified in the EMC table.
> However, for the currently supported upstreaming platform, only the most
> recent sequence is used. So only support that in this patch.
> 
> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> v4:
> - no change
> ---
>  drivers/memory/tegra/Makefile                 |    2 +-
>  drivers/memory/tegra/tegra210-emc-cc-r21021.c | 1953 +++++++++++++++++
>  drivers/memory/tegra/tegra210-emc.c           |    5 +
>  drivers/memory/tegra/tegra210-emc.h           |  157 ++
>  4 files changed, 2116 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/memory/tegra/tegra210-emc-cc-r21021.c
> 
> diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
> index f78bbb7cd16f..def087f13a09 100644
> --- a/drivers/memory/tegra/Makefile
> +++ b/drivers/memory/tegra/Makefile
> @@ -12,5 +12,5 @@ obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
>  
>  obj-$(CONFIG_TEGRA20_EMC)  += tegra20-emc.o
>  obj-$(CONFIG_TEGRA124_EMC) += tegra124-emc.o
> -obj-$(CONFIG_TEGRA210_EMC) += tegra210-emc.o
> +obj-$(CONFIG_TEGRA210_EMC) += tegra210-emc.o tegra210-emc-cc-r21021.o
>  obj-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o
> diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> new file mode 100644
> index 000000000000..ec5e1db71896
> --- /dev/null
> +++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> @@ -0,0 +1,1953 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2014-2019, NVIDIA CORPORATION.  All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/io.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/of.h>
> +#include <soc/tegra/mc.h>

Minor nit: please keep all the includes sorted in alphabet order.

-- 
Dmitry
