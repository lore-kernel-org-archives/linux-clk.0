Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30FCC001E0
	for <linux-clk@archiver.kernel.org>; Sat, 15 Jul 2023 14:44:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjGOOo0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 15 Jul 2023 10:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjGOOoZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Jul 2023 10:44:25 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D92E4A
        for <linux-clk@vger.kernel.org>; Sat, 15 Jul 2023 07:44:22 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso4903101e87.1
        for <linux-clk@vger.kernel.org>; Sat, 15 Jul 2023 07:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689432261; x=1692024261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vSTbiGWl/f9LXjwAM0s7iS/UViUSFOcV217Gp5upeiY=;
        b=C+ourM6Lmr2qHTgK8boStrHTzGetBzQ5iBBHn8dXY6XToi62odOpkNiz5gljm5ePob
         82baiEh9x20IgoTSD5KfdYwSwOZVl5O5OW7QzozCOmmYpKWJ5rTfSHJV6gcd56kOBJaI
         uyzK947Y1C3FuCzCL18c/7LVonJFd/cve06ML6ksbFQJn8nIV9dDmZH5alD7wVYRkf+c
         +K3Wdr7XLvdQA1qQ08WXHIr/XtcgC/MiruoXsPp0BSUARGMHQ2H0Vrq7BA0qcsmyq3RB
         l6TyStTECc0LM8hYrsVIfzbw0HSsMV01dbkv8GTrXQwQsiRIMcF5p7mC9VVDDlOH0Unk
         rsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689432261; x=1692024261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vSTbiGWl/f9LXjwAM0s7iS/UViUSFOcV217Gp5upeiY=;
        b=jRBCH65bl948YgmVtlbwxOPzrvP2k10MFgPBmTFIRLiXuj0qHJrVvGptihMKonyYqt
         vQW3CJvLxbi6nLY5EJ1+BA8thUFKSnzgcfC3voxCwSEtx9uohTVpl8+maolo+81a4iGr
         uPibleg6/hq1mgAhBnAPPQjzC/NvGk4aZp8JjvnVSH2Ko8fx6tdRxefwqAgp3gZ2+daf
         RD/v8IqT9DuxO02ehGVfVqetXkPsEH+ruscCAM5ba29VdWcKr+WMu6ccvpy7al/vp7ud
         WDgJfZtLs1FD3gPy0FdDq6tIVjsh221qccDY0hYwxZ8PQtjbpbhNCk8CWMlPkYGAPtsT
         3kcw==
X-Gm-Message-State: ABy/qLYlAWq0keYKmZHgkVJg9fp1jOmbNdz9D2geUIBblX+zLhU2RHS+
        hkJ/vSIpEBED15D/ax4ysaKJ9A==
X-Google-Smtp-Source: APBJJlGKypXRCCU2rBpdohwglN/0iKXifubS2+iEPFSgy4Ue4OkkYElHGzUjauhRcw4vD0hXKb3L9w==
X-Received: by 2002:a05:6512:3c96:b0:4fa:f79f:85a with SMTP id h22-20020a0565123c9600b004faf79f085amr6711334lfv.69.1689432260696;
        Sat, 15 Jul 2023 07:44:20 -0700 (PDT)
Received: from [192.168.1.101] (abxi167.neoplus.adsl.tpnet.pl. [83.9.2.167])
        by smtp.gmail.com with ESMTPSA id q20-20020ac24a74000000b004fb9d7b9915sm1911777lfp.37.2023.07.15.07.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 07:44:20 -0700 (PDT)
Message-ID: <9799a98a-7e41-3b23-f883-bc790e2bba60@linaro.org>
Date:   Sat, 15 Jul 2023 16:44:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/7] clk: qcom: gcc-sc7180: Fix up
 gcc_sdcc2_apps_clk_src
Content-Language: en-US
To:     David Wronek <davidwronek@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org
References: <20230715091932.161507-1-davidwronek@gmail.com>
 <20230715091932.161507-2-davidwronek@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230715091932.161507-2-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15.07.2023 11:16, David Wronek wrote:
> Set .flags = CLK_OPS_PARENT_ENABLE to fix "gcc_sdcc2_apps_clk_src: rcg
> didn't update its configuration" error.
> 
> Fixes: 17269568f726 ("clk: qcom: Add Global Clock controller (GCC) driver for SC7180")
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-sc7180.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
> index cef3c77564cf..49f36e1df4fa 100644
> --- a/drivers/clk/qcom/gcc-sc7180.c
> +++ b/drivers/clk/qcom/gcc-sc7180.c
> @@ -651,6 +651,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.name = "gcc_sdcc2_apps_clk_src",
>  		.parent_data = gcc_parent_data_5,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
