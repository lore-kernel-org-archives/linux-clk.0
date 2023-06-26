Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5E3EB64D7
	for <linux-clk@archiver.kernel.org>; Mon, 26 Jun 2023 11:50:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjFZLux (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Jun 2023 07:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjFZLuw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2023 07:50:52 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A181AA
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 04:50:50 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b6a675743dso5527071fa.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 04:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687780249; x=1690372249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rEMURCLF3tQbRxt4gBqiVFVUpF3p7VboWxLcm/W6LZ4=;
        b=dmzpjJFiWavLAnKLGZzfSP2saN+6Y+oZhp9gInGqASoCOvFISEG3YsB8V+UCqq/a6H
         KlC0paOCoZywEjJI+jDMOuf1A9FG8HIgXMD2ensRauubWhJt+7HiTJFnsY7cQEGcjgJs
         u0RaxspdImK2K3N2UO72cGPnFO4AxgkpbuatoujdzCKf8TDkIr4jDJlgUSEt8srvjl3q
         jWRfoq2Xrx0xq4nBJSkHdhhmF9wqGz8eV3oioN8zUU6tGMmdlKGde9B5huuLlNHkysAf
         Fb0r5p1s1g3DAZBRRrUlRf08qWvoQ2ulg+qmeqSXcThZzCiC5PuZ/QHtrj69a7B/PUxG
         nYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687780249; x=1690372249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rEMURCLF3tQbRxt4gBqiVFVUpF3p7VboWxLcm/W6LZ4=;
        b=FlhzKuXQUswJh1FapVM5n/vMgngCXfYqOiUhw6CuVl1uQz9+4jXx9uEUvc3Uz86EEp
         3JpVRgZQsYqyZrgGARVqnMiglZIdl1aO7T04AULJ43tpBfxS61VDUryVAiSvs6xl+2px
         B43RVmTpfZwOB+WUx3RXUP0RvVr6bJtZh2O79YnCmbMoHNwSaky6GtPhcU8QucJ2QFmx
         iSY2+krIZzK6gIaRjpO9ACOJdmZi0/T8KY2DRdgWFa+44cOGOpSF3JAlP1KcGLHa9Ydw
         MQZmnOA87Ph5DkDSEZPmhJIm5MDMyMq7mY7qHmfYgzf6H9OaAN6CGGxxilFoHxq6vo5S
         nqog==
X-Gm-Message-State: AC+VfDxCSiO6wBSli6TbrboIo9yv/hTUD9xZoCp2vr1/nqACdrnseLhF
        HmWe2zNlBykbzRbpyc9ErEKsGw==
X-Google-Smtp-Source: ACHHUZ7yY79x1qqb+kiCD8FwbO2hKs4TEuCpuJGp3mPKQkIrzzJzrgFn2BB040n6AXmm3RW6X6n8nA==
X-Received: by 2002:a2e:854f:0:b0:2b6:a05e:f1bb with SMTP id u15-20020a2e854f000000b002b6a05ef1bbmr1998267ljj.51.1687780248977;
        Mon, 26 Jun 2023 04:50:48 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm984416ljj.101.2023.06.26.04.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 04:50:48 -0700 (PDT)
Message-ID: <a1fb306f-6a68-43c6-dfab-abe9a656e7f0@linaro.org>
Date:   Mon, 26 Jun 2023 13:50:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 10/26] cpufreq: qcom-nvmem: also accept
 operating-points-v2-krait-cpu
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
 <20230625202547.174647-11-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230625202547.174647-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25.06.2023 22:25, Dmitry Baryshkov wrote:
> the qcom-cpufreq-nvmem driver attempts to support both Qualcomm Kryo
> (newer 64-bit ARMv8 cores) and Krait (older 32-bit ARMv7 cores). It
> makes no sense to use 'operating-points-v2-kryo-cpu' compatibility node
compatible string*

> for the Krait cores. Add support for 'operating-points-v2-krait-cpu'
> compatibility string.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index ab78ef1531d0..3bb552f498da 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -238,7 +238,8 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>  	if (!np)
>  		return -ENOENT;
>  
> -	ret = of_device_is_compatible(np, "operating-points-v2-kryo-cpu");
> +	ret = of_device_is_compatible(np, "operating-points-v2-kryo-cpu") ||
> +	      of_device_is_compatible(np, "operating-points-v2-krait-cpu");
>  	if (!ret) {
>  		of_node_put(np);
>  		return -ENOENT;
