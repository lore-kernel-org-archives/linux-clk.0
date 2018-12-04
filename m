Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2871C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 11:22:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8837C214C1
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 11:22:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvfmLVQN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8837C214C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbeLDLWh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 06:22:37 -0500
Received: from mail-it1-f195.google.com ([209.85.166.195]:39072 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbeLDLWh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 06:22:37 -0500
Received: by mail-it1-f195.google.com with SMTP id a6so13786556itl.4;
        Tue, 04 Dec 2018 03:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3P1d5DDIqUFxdjGVz7UNRAh88NVQDvbfKe5TEQrIqh8=;
        b=dvfmLVQNGi2t8nbRsNtKEl8bqDkR/wLUQ2uht/NtAmjXnR9i8CTpi2hmJUl7m5w2Kn
         F34Ly9d8zgXQoKFs2KavJkGPvWo5OhMSjqBVp/8WAhNrrqihjXeQdR0n14DLpNjv6Hy0
         Tdas0YeLMwEzBeQplvT/8ek+jqavbt6IC9NGar7jFpewzRO7VRSOBry4gNg2B+BE7kl4
         jEbZQQh6mJGKQ967alF42vGBDDvY/9Blp7qDfgK4F2IESIKopY7p4mLIrRCCnSWgLgCn
         ZhCxsAtOxfqej2dmgp3vAZj0g7VzVShLnjibSCMgcYXAvWt/1+RXhjFNdvrAwFTtox63
         m1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3P1d5DDIqUFxdjGVz7UNRAh88NVQDvbfKe5TEQrIqh8=;
        b=BgRKGEsTROnUlOEYMLPzWaZMZG9YozLhu6LP44wpwkV8ZKPKKCwv2OReR0KQfXmUJX
         6an91q0/qC31zad99WyHmDEDQNeFF/+cE2bykIgVF5WqftNyC9P+j3NpQXky8w6CbTXf
         wvzGBkPqG0Ofm5obAUrFUtIXS1JaSsZ3IcNw40XWJiDgBAR6EmiwKhgjXSCZ7+Sa4d2M
         xBEpgvu1IeZvihAMEH9CI0cff83rqHbjVoFnjUMazljMHF1u8Ydn0eZS3Of4KK+DwcHi
         nshv3mFvosd0Z8i5v9X+mY1WeGHgGrkXhDy/w/45MLngSS9pT3CMedFAAmgeJonGmG/d
         ny9A==
X-Gm-Message-State: AA+aEWY0kP7CUgkYfM9lKh9cxFDncUvI++S9tYae45LqzzyK/+yoFioz
        qupLrjPN6cCKkGRvhopTwP7IliJe
X-Google-Smtp-Source: AFSGD/XCM6bm8sojSMqOSC2M/56CoNhESJbEO1G5zRYIpkHn3FDr0TDb2qMsZ95SLxLp2r0t5v97iw==
X-Received: by 2002:a02:89dd:: with SMTP id e29mr18658617jak.21.1543922556160;
        Tue, 04 Dec 2018 03:22:36 -0800 (PST)
Received: from [192.168.2.145] (ppp91-79-165-221.pppoe.mtu-net.ru. [91.79.165.221])
        by smtp.googlemail.com with ESMTPSA id r11sm6631108iog.46.2018.12.04.03.22.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Dec 2018 03:22:35 -0800 (PST)
Subject: Re: [PATCH 12/19] cpufreq: tegra124: extend to support Tegra210
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
        linux-pm@vger.kernel.org
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-13-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c4f34e85-052b-f3a3-a6ea-715d1971335c@gmail.com>
Date:   Tue, 4 Dec 2018 14:22:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181204092548.3038-13-josephl@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04.12.2018 12:25, Joseph Lo wrote:
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
> 

Seems that's not enough, you also need to blacklist "nvidia,tegra210" in the drivers/cpufreq/cpufreq-dt-platdev.c
