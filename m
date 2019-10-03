Return-Path: <SRS0=L6e3=X4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A94C10F14
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 11:23:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A28420673
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 11:23:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CqfXBRSa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbfJCLXV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Oct 2019 07:23:21 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40265 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729870AbfJCLXV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Oct 2019 07:23:21 -0400
Received: by mail-lf1-f68.google.com with SMTP id d17so1525799lfa.7;
        Thu, 03 Oct 2019 04:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YxgRbJvKRqdXZCKgx4otJFPYIVJvaWckk0e2/WgsOjc=;
        b=CqfXBRSaXxDre5rZG+6MS/6NUrFKX9khISEfHKxI88YJTBTJ/TvtsaqiLoMZgumVAz
         OxQlmshzwIaKNwT8+5FbKkC5gIu7SsHVKRfq6/dkfekwJQBh8El1hoNHBAJCSJBeIh4Y
         xv9hKgT6iV26BXMXtB75+y5ajZWur6BVq5fPhRXINVmubHjAgEO7IYCJfJdTqmKybwP0
         INTyYsBxGvJmNSWsfleI75jgX7XThcHfI97oDgA2XxemthrvvsVHpf0TJRhERkKX97ia
         AbR5iGbrvfwlI7quiE64pMUQkMBlCjov3ka/UNwh5yX9krYouzbE2sXni8horOEQtdoM
         uhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YxgRbJvKRqdXZCKgx4otJFPYIVJvaWckk0e2/WgsOjc=;
        b=K+8lLo1s8+X6B+oXm/PHw6ImiW/dszCXhZeZDPy5ShNZr+1GEO0hyWLzKGI3s2TUy7
         dXAghrnqegiaQMZU8i2lJruvoaG21NHdQqmfRBSXknopCm0Rj0wyYqit+gGl6uckS5vS
         KsFThk52ZwQ0IR83Sh4K1EhIZhY10JnseDTbPQDd8MkQxZFL6zbps4huzLgyh5uBe9R8
         wdqhq4kwAYV5gIYzu0mhNj0YIVfrMSsIck4zWDF6QzPd9rlCfBzW+AQ9Sb8TDvgJQE0k
         enejBWsvfNDS8uBWj48G08jVUkcvkPlH9Kk9ns2yJRDuQwZCHqit2LbaiUWCmHWtCCal
         J+5w==
X-Gm-Message-State: APjAAAXX7gux11caFuljMWfNNho+XbW0PyrOVvmo+muXOj/JrYoW2VgB
        u7R1SUQVqNBjw7q58Ubgs4z4fi4/
X-Google-Smtp-Source: APXvYqxw9T8acyhKN7toM+boOABCJRsj3U33cLAZP8AUTXsQQBL5YfgkbLNN1I8BxY63Q0K8D8uz9w==
X-Received: by 2002:ac2:51ce:: with SMTP id u14mr5022429lfm.72.1570101799169;
        Thu, 03 Oct 2019 04:23:19 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.34.231])
        by smtp.googlemail.com with ESMTPSA id h3sm484353ljf.12.2019.10.03.04.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 04:23:18 -0700 (PDT)
Subject: Re: [PATCH 1/4] clk: tegra: Enable fuse clock on Tegra124
To:     Stephen Warren <swarren@wwwdotorg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20191001211346.104400-1-swarren@wwwdotorg.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7f8934d9-8192-f88e-a329-630209d42a85@gmail.com>
Date:   Thu, 3 Oct 2019 14:23:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191001211346.104400-1-swarren@wwwdotorg.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

02.10.2019 00:13, Stephen Warren пишет:
> From: Stephen Warren <swarren@nvidia.com>
> 
> For a little over a year, U-Boot has configured the flow controller to
> perform automatic RAM re-repair on off->on power transitions of the CPU
> rail1]. This is mandatory for correct operation of Tegra124. However, RAM
> re-repair relies on certain clocks, which the kernel must enable and
> leave running. The fuse clock is one of those clocks. Enable this clock
> so that LP1 power mode (system suspend) operates correctly.
> 
> [1] 3cc7942a4ae5 ARM: tegra: implement RAM repair
> 
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra124.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
> index 0224fdc4766f..f53f6315c646 100644
> --- a/drivers/clk/tegra/clk-tegra124.c
> +++ b/drivers/clk/tegra/clk-tegra124.c
> @@ -1291,6 +1291,7 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
>  };
>  
>  static struct tegra_clk_init_table tegra124_init_table[] __initdata = {
> +	{ TEGRA124_CLK_FUSE, -1, 0, 1 },
>  	{ TEGRA124_CLK_SOC_THERM, TEGRA124_CLK_PLL_P, 51000000, 0 },
>  	{ TEGRA124_CLK_CCLK_G, TEGRA124_CLK_CLK_MAX, 0, 1 },
>  	{ TEGRA124_CLK_HDA, TEGRA124_CLK_PLL_P, 102000000, 0 },
> 

Hello Stephen,

Does this mean that devices which are using older U-Boot version were always in a trouble?
It sounds to me that the RAM re-repair should be also enabled by the kernel's flow
controller driver in a case if bootloader did not enable it.
If enabling RAM re-repair is a change that won't be easily backportable to stable kernels,
then may be it's worth to simply force-disable LP1 on T124 for the older kernels.
