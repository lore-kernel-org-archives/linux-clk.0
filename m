Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7497AC77B75
	for <linux-clk@archiver.kernel.org>; Mon,  8 May 2023 16:40:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234062AbjEHQkr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 May 2023 12:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233694AbjEHQkm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 May 2023 12:40:42 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E6972AE
        for <linux-clk@vger.kernel.org>; Mon,  8 May 2023 09:40:24 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f14ec4efb0so3219977e87.2
        for <linux-clk@vger.kernel.org>; Mon, 08 May 2023 09:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683564016; x=1686156016;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aUxn30nI2JC2NtHSud7ubjIIo2ZFwZw2vxazxJv+hlE=;
        b=A2H6+EZETU19uZp9uxVwu4SLkeNRyo0WdTduVSE/23Ny5M9vHuZs88iS3TfkWjq/Kx
         hLjp1IsETrANWQxedB2rfqB91hzKz4iy0TPDwJVUKyMlabSFfq6tegZC4hlH/1YZEvxx
         fZ+k5zOCLujASQLnt1AoVOPj73CVRGdZ6MkS5FvlZg17+DITlJnJhd89drvazuYV8pTP
         V3Mkqur6AYVFFJAw/O7SZD3oykGJUbzQ8u0+qIgPntINVazYreG9ZPCAHgsdUU1US0PC
         lGKKMZKK0QdZEFNp3hU+iQL/gLdNpNCUo1edloWE2we+tC2YlabQgTFpnEESV15Y0+pF
         eivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683564016; x=1686156016;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUxn30nI2JC2NtHSud7ubjIIo2ZFwZw2vxazxJv+hlE=;
        b=i/dgVLxaEKwl7b1Qxy2QUMxfjF/2OcL/KtwvtdddzIDrM8+SoalasjuZeAyJAnuOEE
         hJUcJgg9NBtZ9PJzr7GbjE8EzyV2tYYgEin6lfE+yvunT5Vqxn9vSZ/hoDz+Bk+z9KAi
         dgENbLCO88fRMWWvQ5f9ibzgFUFSRD4O8qlXQwIwwof5fYtn+6YAMEaKjyUZLSJ9rvsK
         LLpIbMftdJTJ3sOhgAnmEK871WSL4PqA0zZfDOnty6pbvY2+gjut1NVYjtP0ysTr9veU
         2nTmoYAgAizHjtgPzEHmStmwz1UTfT5S4fdXwRn/bv7m/0DlmKt6iqPA4UYQ+qWCQEF3
         tmgw==
X-Gm-Message-State: AC+VfDxZ3duMRPP2hwfoCyD+0ae6j2wb5Iz3M+XOCeLgHluCswdLoglC
        eUgw1e3bCP4Mp/xqIGheTpAXpw==
X-Google-Smtp-Source: ACHHUZ6u7+V88g+UMiDYJc3ekgTOxbHHa+oqE7nsNuFqFyqBCSf8uLTqkAINz7xlB87R6Q38suZyeg==
X-Received: by 2002:ac2:52b0:0:b0:4ec:8b57:b018 with SMTP id r16-20020ac252b0000000b004ec8b57b018mr2670653lfm.33.1683564016101;
        Mon, 08 May 2023 09:40:16 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id y11-20020ac255ab000000b004efeb7776d3sm37000lfg.278.2023.05.08.09.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 09:40:15 -0700 (PDT)
Message-ID: <bd57675e-fe80-b5ea-cd21-46bc98e45c3e@linaro.org>
Date:   Mon, 8 May 2023 18:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] clk: qcom: gcc: ipq5332: Use floor ops for SDCC clocks
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230508163145.9678-1-quic_kathirav@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230508163145.9678-1-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 8.05.2023 18:31, Kathiravan T wrote:
> SDCC clocks must be rounded down to avoid overclocking the controller.
> 
> Fixes: 3d89d52970fd ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5332 SoC")
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-ipq5332.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5332.c b/drivers/clk/qcom/gcc-ipq5332.c
> index bdb4a0a11d07..1ad23aa8aa5a 100644
> --- a/drivers/clk/qcom/gcc-ipq5332.c
> +++ b/drivers/clk/qcom/gcc-ipq5332.c
> @@ -963,7 +963,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
>  		.name = "gcc_sdcc1_apps_clk_src",
>  		.parent_data = gcc_parent_data_9,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
>  
