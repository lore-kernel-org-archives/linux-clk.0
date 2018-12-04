Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F472C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:30:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1D222146D
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:30:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="XtQx1dAx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1D222146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbeLDJa5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 04:30:57 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40637 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbeLDJa5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 04:30:57 -0500
Received: by mail-pf1-f196.google.com with SMTP id i12so7915397pfo.7
        for <linux-clk@vger.kernel.org>; Tue, 04 Dec 2018 01:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ksi5DC9S8xu/2FKg8Dsc/QBQ4RCmaSIIb9GmFJwD2uk=;
        b=XtQx1dAxxGzhscT5ugYeXJtp/kPnmkAJ7U+IXdF5omPTrIoeFkXSQnLgdc/hx+Wzh2
         Fzzp2x+9BM1auERkemo5Df0RkiKHMZ93v81D1MKTkn2AB71fAM5BCl2mOGdeqgqO/hFt
         9BBUMEI6+hzjqyir+PGUpldDKGTHfv9wjnLcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ksi5DC9S8xu/2FKg8Dsc/QBQ4RCmaSIIb9GmFJwD2uk=;
        b=nlhqYAV9YacTpnzFyg1qde+X08K1iSphptvugRg02kQI5vtA+eKUuhtvsT3NqXCufB
         vytcs9gQ4bcRjbi/BsF7TXtdAq61tsJXKmgUsus+MZOm1oIYI5FJJZDPZKpmQ4zNenMc
         eyvbQMg5X4vxlOIlk+Is8rwGfAqQnxhvPhBlFol2up/PTIMgP3OgadZcWXzhWsCsacjm
         nZm7NibNbmouoUxvX5782HfeQxSCTHCeIH9xVU5mPq58UKHrxAJwEnvcSOY23gumxhvW
         OvbdA8CdrSmemtZkfry+x+giHqUVv0+C/SgpRTYam8vJuZhvTTb6t5OkJOPMRbp1ChdK
         kpcA==
X-Gm-Message-State: AA+aEWZ1OzD7nv3CtnaCPWS5PNBh64S+oUlWt/+yCpQNSTFixprWu6ia
        ztUB3QQ4bjiSLPgzJQzq4ylfnw==
X-Google-Smtp-Source: AFSGD/UjIGxS4RgL4ty2Fua3NNl/cYDltdXjjG8/2kTv2PpqTnioIiCm5yaPtBIgZH3l8RasI4cSOA==
X-Received: by 2002:a63:db02:: with SMTP id e2mr16298362pgg.419.1543915856388;
        Tue, 04 Dec 2018 01:30:56 -0800 (PST)
Received: from localhost ([122.172.23.29])
        by smtp.gmail.com with ESMTPSA id z127sm26914124pfb.80.2018.12.04.01.30.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Dec 2018 01:30:55 -0800 (PST)
Date:   Tue, 4 Dec 2018 15:00:53 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Joseph Lo <josephl@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 12/19] cpufreq: tegra124: extend to support Tegra210
Message-ID: <20181204093053.pkwv5yeyjezbw5ay@vireshk-i7>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-13-josephl@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181204092548.3038-13-josephl@nvidia.com>
User-Agent: NeoMutt/20180323-120-3dd1ac
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04-12-18, 17:25, Joseph Lo wrote:
> Tegra210 uses the same methodology as Tegra124 for CPUFreq controlling
> that based on DFLL clock. So extending this driver to support Tegra210.
> 
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  drivers/cpufreq/tegra124-cpufreq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
> index 448d00763d00..1af955fb715c 100644
> --- a/drivers/cpufreq/tegra124-cpufreq.c
> +++ b/drivers/cpufreq/tegra124-cpufreq.c
> @@ -159,7 +159,8 @@ static int __init tegra_cpufreq_init(void)
>  	int ret;
>  	struct platform_device *pdev;
>  
> -	if (!of_machine_is_compatible("nvidia,tegra124"))
> +	if (!(of_machine_is_compatible("nvidia,tegra124") ||
> +		of_machine_is_compatible("nvidia,tegra210")))
>  		return -ENODEV;
>  
>  	/*

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
