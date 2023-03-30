Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AAAC6FD1D
	for <linux-clk@archiver.kernel.org>; Thu, 30 Mar 2023 11:08:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbjC3LIh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Mar 2023 07:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbjC3LIg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Mar 2023 07:08:36 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263C5198C
        for <linux-clk@vger.kernel.org>; Thu, 30 Mar 2023 04:08:15 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id s20so19170789ljp.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Mar 2023 04:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680174493;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jLO7vgWzoNzoVqz4+P2GMtPNgHtIDgkZ9eAhGTulXJQ=;
        b=da4kcW5/pKOK9pEWrnACjJvxTsODnXjZ1lg1vGRREwwMhXqrAC+F5Lbm74iy+lq5zk
         Ad9O8wqXnqxRoz5FnMmV0ixPkrSd09OZ+oGB4JvCBaObk9ehyF2oeQtqcw48+JVPPUfm
         0UgveLYsn8SWEq8aVAHJk9maYyMGOcrBw/ftjLg1uH1CEBNwrcHNGx3YP0c1T12m/txP
         E3zwLVs5Jen38NI9IpXTJF46rcSUePTaEOlR1sYejIfV6x53oUFM2cCliM+u57JWW8vm
         CFJ9UMuuSRnaL/iXrBFj0Wyyskw3v1H1XZGYjhDAwpmIcmrvjwLnE/a6ocnYG3TfZWC8
         6vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680174493;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jLO7vgWzoNzoVqz4+P2GMtPNgHtIDgkZ9eAhGTulXJQ=;
        b=tv06K4/1hKQlW2V57A/g08iiBJdCI7zi4CSkYVRx/rU3O8oqLs00qOgs5PpYYDbyR9
         cqR3sB8m0VXqfzbQdJLvTazZ9CGbAu8+Oc5Y9ahtb8kju3Xh7koHMWplk01wexDAWgzP
         30iIsYdUyFu5pO3KXSjI2li5rAtGMEVCzdlfuwyJwENM4Ja30VIjaWA8YLikbbEfAEVL
         wTlK4lXcOooPLT0wPvXp1ZRcwr7j5LxWRHhzGv+RVfgPI/9WocD/4RSnSf84Qi74O/+h
         dgVoO5jkxcmI4U+GWZJhXX6+jIJAvw8zov5ibskXBz25OGiIvQps8CDxqeXEzCJ4S271
         +VaQ==
X-Gm-Message-State: AAQBX9cavUMkWlC1PT2fMHLS1/c665ICrr6/0gv+BMoIeBY73QiPBjcV
        LEk/Sb5fTE2dnmtWlhCea62SPdjpOOWslOMZtGg=
X-Google-Smtp-Source: AKy350YzYy/r7iglaMwNiqAKVDLbtfIQu7X17Cv90RCod/HTAxtiP5MKyiCEggrUFFsS5jML0nnPwg==
X-Received: by 2002:a2e:9448:0:b0:295:b0c4:845e with SMTP id o8-20020a2e9448000000b00295b0c4845emr7376125ljh.39.1680174493245;
        Thu, 30 Mar 2023 04:08:13 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h11-20020a2eb0eb000000b002935632b3f8sm5875257ljl.14.2023.03.30.04.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 04:08:12 -0700 (PDT)
Message-ID: <910df994-637e-07df-c53c-06a1c0d8d83e@linaro.org>
Date:   Thu, 30 Mar 2023 13:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 2/2] drivers: clk: zynqmp: Add versal-net compatible
 string
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        devicetree@vger.kernel.org
Cc:     git@amd.com, linux-clk@vger.kernel.org, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        michal.simek@xilinx.com
References: <20230330091309.16215-1-shubhrajyoti.datta@amd.com>
 <20230330091309.16215-3-shubhrajyoti.datta@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330091309.16215-3-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/03/2023 11:13, Shubhrajyoti Datta wrote:
> From: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
> 
> Add compatible string for versal-net.
> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
>  drivers/clk/zynqmp/clkc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
> index 5636ff1ce552..1ea5fba20d91 100644
> --- a/drivers/clk/zynqmp/clkc.c
> +++ b/drivers/clk/zynqmp/clkc.c
> @@ -789,6 +789,7 @@ static int zynqmp_clock_probe(struct platform_device *pdev)
>  static const struct of_device_id zynqmp_clock_of_match[] = {
>  	{.compatible = "xlnx,zynqmp-clk"},
>  	{.compatible = "xlnx,versal-clk"},
> +	{.compatible = "xlnx,versal-net-clk"},

Why no driver data? Why do you create new driver matchings if devices
are compatible?

Best regards,
Krzysztof

