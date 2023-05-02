Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32792C77B73
	for <linux-clk@archiver.kernel.org>; Tue,  2 May 2023 11:15:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233648AbjEBLPP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 May 2023 07:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjEBLPO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 May 2023 07:15:14 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05FB19A
        for <linux-clk@vger.kernel.org>; Tue,  2 May 2023 04:15:09 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2a7b02615f1so36439361fa.0
        for <linux-clk@vger.kernel.org>; Tue, 02 May 2023 04:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683026108; x=1685618108;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hn43BgmaPSG0ZxbYAOhGGavK0XGwzs7u2L9/RApRsk8=;
        b=HjaXgEWG6hlvbZ8rvGQnTmq4s29DshxgQ/wWCy2KsQPdonLzCyu6GyleFjQJ75zZsd
         EW3qLp59Vo7wUiSc6rnNw54OuC++UpSs3JWAo180Lh8WuMGhpqRcE4eniS/ce0OsAT12
         o1GqyosSF6I+N6bZsPxkLKUvJyNwyyhQSUju4LAeOvXrq8V3Q1t2KLxdnBoOxb66Y/PA
         BNW8fD2l22BjmOQSnR2dKenFhuoegCpG1wRarmhgmFS4b9I/5Un5O+kcUdBBclXKqFKh
         sU5b9TCQlCatCvK5kVzHWvYSBiy7Fhmq07y0htcqhi7uQGqQ1c+laCWgrnk3N5nKrHdZ
         Eslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683026108; x=1685618108;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hn43BgmaPSG0ZxbYAOhGGavK0XGwzs7u2L9/RApRsk8=;
        b=mFzKBJBGcf5jxh2FNl2EbSaavrzPTUanJ/I9WDXgQ+Ikl55gY5vVqI5S1sNYQkifOZ
         xnVKL73/dEsaU7BhdpkJoFQinJ7LTDiwruI1oRMJfh+eDt8WWAgJq18LbqStKyCgBunL
         eFc288hbqA/EbmMXF1Eddf0ZcQd4ZIWW7Pk1801xHC5Oiiv07G4nfd3zz5OEwdlY5mCm
         QBwGEJGtXuBOma6GQJ5y/XoYMDdbl1AsQAs52ML6cBVNtxjwzXIORQVs8O9QkMmuhCHr
         erVfdKXzkGJ+o3ptCNgPSWyRoH8rdQh5sX5RTeNnZ2sqQh234lWkJ6+uKkypXFaWQ3MD
         I1tQ==
X-Gm-Message-State: AC+VfDxzJoM9ZyxpRH0YnKZzA53fCUf+R8yzFVPcoDOl+oieZgy4N+qH
        3JwtAfy5CkjiElr3cMZDxIOPHQ==
X-Google-Smtp-Source: ACHHUZ4jjyl+cn2Vz2BYxJKAviozjShus97785KPyQ6CZBeBzlYdzDSb0Bwv0jiGX06zoQpaGNAaMw==
X-Received: by 2002:a05:6512:11f0:b0:4ed:c494:32d0 with SMTP id p16-20020a05651211f000b004edc49432d0mr4009623lfs.59.1683026107973;
        Tue, 02 May 2023 04:15:07 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id y26-20020ac255ba000000b004edce1d338csm5281728lfg.89.2023.05.02.04.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 04:15:07 -0700 (PDT)
Message-ID: <8684a7c7-5af3-c773-4330-200e4b897937@linaro.org>
Date:   Tue, 2 May 2023 13:15:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 06/10] clk: qcom: gcc-mdm9615: use proper parent for
 pll0_vote clock
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
 <20230501203401.41393-7-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230501203401.41393-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 1.05.2023 22:33, Dmitry Baryshkov wrote:
> The pll0_vote clock definitely should have pll0 as a parent (instead of
> pll8).
> 
> Fixes: 7792a8d6713c ("clk: mdm9615: Add support for MDM9615 Clock Controllers")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Cc: <stable@vger.kernel.org>

?

Konrad
>  drivers/clk/qcom/gcc-mdm9615.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
> index fb5c1244fb97..2f921891008d 100644
> --- a/drivers/clk/qcom/gcc-mdm9615.c
> +++ b/drivers/clk/qcom/gcc-mdm9615.c
> @@ -58,7 +58,7 @@ static struct clk_regmap pll0_vote = {
>  	.enable_mask = BIT(0),
>  	.hw.init = &(struct clk_init_data){
>  		.name = "pll0_vote",
> -		.parent_names = (const char *[]){ "pll8" },
> +		.parent_names = (const char *[]){ "pll0" },
>  		.num_parents = 1,
>  		.ops = &clk_pll_vote_ops,
>  	},
