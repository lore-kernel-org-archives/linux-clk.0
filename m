Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5ADBC05027
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 20:19:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbjBFUTu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Feb 2023 15:19:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbjBFUTe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2023 15:19:34 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3DDE2CC53
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 12:19:07 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id u21so12910651edv.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 12:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YpSBEYnC1yN1Z48asglOX+KVnSlBsHak3KW73YE2TaY=;
        b=s9pgKZv6vt41rE7EzzpJpXmOr8fEaNHTztldIuVXDDqVfSasjl0BdM+YCYYLO7FI8j
         kAwYc1wep9rcIEHW4U9+b8nl4MPCpdIMbhVFY2XORAaEB/Be3SzjtYIcR/quaYvu8IgF
         ON01RjCIkRDY3QJh7VI+qAx+VM3S6AR394PONdrpTVQKg88aZDFm+db5EnUWIKFAB+/3
         g55mHYoOqsrG4EY2lWxJZDWL82fxrAnywPNM74BaNGQg3ei5MfnZ4qcOgcOh1UArAd2n
         LzgYa/5PP6CorgICmOMufzvuZ0y/NLkztmzJM/LCMnROIbxXKrPGJak69BAhnahjeHAP
         OWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpSBEYnC1yN1Z48asglOX+KVnSlBsHak3KW73YE2TaY=;
        b=iEyKeXetDiM/rP3WxtlFqo9FT/B3r3rEr19d1upCyt8Sd6h0Yeg9KNDoydnnPCEobD
         esBCnknE6rx7U4nyHiwEsBUgqezWWLliu/0KsqTvPgSUJYjmOSDEqgI9jTRz1PNbw//e
         Y2YF6z6ouahQLVWgHRFfuUo0S+/GGOhDC/J/PMOMMyUMO5jl8GqGd7zNMwH4JxbmmvK9
         mfoizm++lCzI4qmvN+xcw0/m2GTKd8oWb7cJTtWBDQ5gB8kLoBdxEV/oIodFpI1QNBkU
         zVgRiOVxJvyPZzcN+dkUdnvuqpZ9RpuI87WT0+92kY+jbg+DEUH3oBePNp9YjGhyVVaj
         mS2w==
X-Gm-Message-State: AO0yUKVA6P38jW9R1+x6YsdQXVgjkgWGz/UQFyO9QEPvSwQnTNStGWtJ
        fj2nlY68HKNkFtXZAl9W01H9VhuC2OwVb3h1
X-Google-Smtp-Source: AK7set+93id+gKLuBNqT3Prum9OcgkVfpgKbUX+ICOlvjJ2gZ2QBT5DFEuY9o/3ohDGDi2lvDi2s1Q==
X-Received: by 2002:a50:d7da:0:b0:4aa:b36a:7601 with SMTP id m26-20020a50d7da000000b004aab36a7601mr998335edj.24.1675714744222;
        Mon, 06 Feb 2023 12:19:04 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id i3-20020aa7c9c3000000b004a087d1d313sm5478682edt.64.2023.02.06.12.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 12:19:03 -0800 (PST)
Message-ID: <6ee1f7d7-a923-8f93-f68b-decdc263987a@linaro.org>
Date:   Mon, 6 Feb 2023 21:19:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/8] dt-bindings: power: qcom,rpmpd: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_L1
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
        devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
 <20230206145707.122937-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230206145707.122937-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 6.02.2023 15:57, Dmitry Baryshkov wrote:
> Add define for another power saving state used on SM8350 for the GPU.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  include/dt-bindings/power/qcom-rpmpd.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index 4a30d10e6b7d..1bf8e87ecd7e 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -211,6 +211,7 @@
>  #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
>  #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
>  #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
> +#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1	80
>  #define RPMH_REGULATOR_LEVEL_SVS	128
>  #define RPMH_REGULATOR_LEVEL_SVS_L0	144
>  #define RPMH_REGULATOR_LEVEL_SVS_L1	192
