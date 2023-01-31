Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8C6C38142
	for <linux-clk@archiver.kernel.org>; Tue, 31 Jan 2023 09:31:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbjAaJb7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Jan 2023 04:31:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbjAaJb6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jan 2023 04:31:58 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1682125BB
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 01:31:56 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id qw12so23873189ejc.2
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 01:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A4df+YMYrca5Xl2bwz5EZIKoolwQF6iGlzj7p2qVcIs=;
        b=FW6x0jGkYIwA8TqNbVVgHK6Pk0O6Kaaope8iCCGlh6oY+LWTKdTA8pusjVlZNT7Gzh
         CNY9EN1wJRyIe3MRgcfrzyBE7CQW3lHlVsR+FoATiiOB78YeAEHJ9h120WXXyaivantA
         iUlA5vz9fRD/aQCIv21oyz0nKAZvpyBYoGwnlYZDcCBWktphCnwDi81jfIUIkAWc9Z5R
         P0cV3wujZFXuYRvmb8HIBIW4k7lx0oaN5jx7Eu6ekY9RBiCya8zAskNBQlzMAmhwKVq7
         bd/kooO2gMj3eJrlol0eSJEvYvxXHLzRNZub9OFr7PwcMRSi5C+OX3oeLk1OqR5+bOtH
         LH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A4df+YMYrca5Xl2bwz5EZIKoolwQF6iGlzj7p2qVcIs=;
        b=mB+7ocQs+anet4O/VVYBgJWPVztdT/szFq+9QBhfMRZtkbbmfR+lzpXabdDYmClIsM
         tTuKW9KkXEBAT6s+IN6oNHZcNTpM1YWHFok52pf/NygCb8iam0MxHq1SXiZimum4MSlf
         Qj9kmxSOeFfgs6W65dwp+DxkZeC6xfZRlxYH2fpaWIPtf+9rY1+tCI1Hc1/RVis6lSRr
         TjVgioGrEo8h1cgmWq6cSORtkIhLAnic+F98UlyaAALBURHXlP9/u3Ox42HTsaLQSj6+
         ZH+1QXFsfTlVmpw9EOvxrC6vBW4wg7H6uhtS7srcIPQqenNHdjyX6q5ODN+SsU9hZqUh
         WUXg==
X-Gm-Message-State: AFqh2kor3949N7KDlerINnV5GH9DtRsmYU5CAzmwgvlcOpqSFizCSGEz
        fMKpZsl1zoucVwc3DMfeocD8uA==
X-Google-Smtp-Source: AMrXdXvTI20pQa3xMP9ePTvSO6XvhZBS1sBCWdguw5OSM5xobqPC9/TI+CS7Z+mYGsluohhXwBtJuA==
X-Received: by 2002:a17:907:971d:b0:870:d15a:c2dc with SMTP id jg29-20020a170907971d00b00870d15ac2dcmr73161479ejc.74.1675157515261;
        Tue, 31 Jan 2023 01:31:55 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j6-20020a170906474600b0088ba2de323csm1088152ejs.181.2023.01.31.01.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 01:31:54 -0800 (PST)
Message-ID: <b8b90989-4bc9-f3a9-516e-2101bfc2293d@linaro.org>
Date:   Tue, 31 Jan 2023 11:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/6] arm64: defconfig: Enable ipq6018 apss clock and PLL
 controller
Content-Language: en-GB
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, jassisinghbrar@gmail.com,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        arnd@arndb.de, marcel.ziswiler@toradex.com,
        nfraprado@collabora.com, broonie@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230113143647.14961-1-quic_devipriy@quicinc.com>
 <20230113143647.14961-4-quic_devipriy@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230113143647.14961-4-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/01/2023 16:36, devi priya wrote:
> Enable the PLL controller and IPQ6018 APSS clock controller

... it is used on several IPQ platforms to clock the CPU so it should be 
enabled and built-in.

> 
> Co-developed-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>

Just to check: is the capitalization correct in your name here and 
everywhere else? (please excuse my ignorance here, I do not know all the 
spelling/capitalization rules).

> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index e0ae0996d5ad..8de3979b10a3 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1092,6 +1092,7 @@ CONFIG_QCOM_CLK_APCS_MSM8916=y
>   CONFIG_QCOM_CLK_APCC_MSM8996=y
>   CONFIG_QCOM_CLK_SMD_RPM=y
>   CONFIG_QCOM_CLK_RPMH=y
> +CONFIG_IPQ_APSS_6018=y
>   CONFIG_IPQ_GCC_6018=y
>   CONFIG_IPQ_GCC_8074=y
>   CONFIG_IPQ_GCC_9574=y

-- 
With best wishes
Dmitry

