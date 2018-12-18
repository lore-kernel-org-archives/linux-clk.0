Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E807C43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 05:33:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 16984217D9
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 05:33:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="eovQR+VA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbeLRFdi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 00:33:38 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46034 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbeLRFdi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Dec 2018 00:33:38 -0500
Received: by mail-pg1-f195.google.com with SMTP id y4so7245190pgc.12
        for <linux-clk@vger.kernel.org>; Mon, 17 Dec 2018 21:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KfqIkLeu2m5/AiyRCmid2VCatuc3NoK4silY2Vg5r64=;
        b=eovQR+VA1BqotdlxY1myyFmhBc9cnl20G1dhm+peLfbQS6O3AjhVK+Q6fW0jIm0hPB
         AZV+QLxGs772IHdGukc3OxwEOsVFponusnFIxB9X/Ui4KgvTob8Wkv/SP6CJqWloJVNU
         H21N1Zu/Ac1tI9GpC5zoByRidk+jR12yLW+Ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KfqIkLeu2m5/AiyRCmid2VCatuc3NoK4silY2Vg5r64=;
        b=SZx2031kbh8NUPKfAzpM29zyAqnpVLdqV+vEjxPsnLliQafmTQfx8A6vi27HkUWgP9
         PjTr5uymRGHr9URYxxt26+cNROStAb9OybxKK4l3Pz8VZmAoZx0JK5vVekMVJ4ImDXcZ
         axkA2M8hw47FZQZAl29taNgspC7n836DVuWqfpFuB9dE0OGFpQJNtqjj5mA9KA6zcrMV
         FijU4xwoLNPGwl866FFkN6bAiXBY4EF+DI0a+kXr2OqxYhFLU1Hyp9unHO1ep1492chV
         uqvA5ZiWyrzrqKzhPKntEOjrd2MWXCFI5vde0HQ+yLRdLp5kukHY/E33zEz8MI1tlsGu
         3K7w==
X-Gm-Message-State: AA+aEWY2/2i/FO67us/yUC9MebaBv2jzK2W1XR/oNCWLsXxbR3msIaYI
        Xut8YWmD06KlthaGLqnjWbAVmw==
X-Google-Smtp-Source: AFSGD/VqaYSgfM557ZXkezuEQLE19awWxL8cGX9MVBJT/xlZpr75J/yvDXHtcw7uclpXg+oTlk78zA==
X-Received: by 2002:a62:6cc8:: with SMTP id h191mr16167410pfc.89.1545111217495;
        Mon, 17 Dec 2018 21:33:37 -0800 (PST)
Received: from localhost ([122.172.23.29])
        by smtp.gmail.com with ESMTPSA id q1sm20270307pfb.96.2018.12.17.21.33.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Dec 2018 21:33:36 -0800 (PST)
Date:   Tue, 18 Dec 2018 11:03:33 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Joseph Lo <josephl@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH V2 14/21] cpufreq: dt-platdev: add Tegra210 to blacklist
Message-ID: <20181218053333.5qqz4gerxs6vd3wx@vireshk-i7>
References: <20181213093438.29621-1-josephl@nvidia.com>
 <20181213093438.29621-15-josephl@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213093438.29621-15-josephl@nvidia.com>
User-Agent: NeoMutt/20180323-120-3dd1ac
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13-12-18, 17:34, Joseph Lo wrote:
> Tegra210 uses "tegra124-cpufreq" platform driver to register device data
> for "cpufreq-dt" driver. So add it in the blacklist for
> "cpufreq-dt-platdev" driver to drop that.
> 
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> *V2:
>  - new added in V2
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index b1c5468dca16..47729a22c159 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -119,6 +119,7 @@ static const struct of_device_id blacklist[] __initconst = {
>  	{ .compatible = "mediatek,mt8176", },
>  
>  	{ .compatible = "nvidia,tegra124", },
> +	{ .compatible = "nvidia,tegra210", },
>  
>  	{ .compatible = "qcom,apq8096", },
>  	{ .compatible = "qcom,msm8996", },

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
