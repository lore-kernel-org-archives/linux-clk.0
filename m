Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6B0EB64DA
	for <linux-clk@archiver.kernel.org>; Sat, 24 Jun 2023 13:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233090AbjFXN5N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 24 Jun 2023 09:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbjFXN5M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 24 Jun 2023 09:57:12 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 368D3A8
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 06:57:11 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f86bc35f13so2216005e87.1
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 06:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687615029; x=1690207029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9aKXFcPZYN71lVrD41n3tvciEk57GS1gmN4aKHDSr8k=;
        b=nh7egyfbs9EQjNOJlyeC3lUbpEBELjaN9kojbnICztH1ZvUQrGYmxTNpJlbcMfTKhE
         LeGMR3dTTFhyZSh5iRSA+56JNd+mJbwnugBeUxCJ+Re0JiC9wWxvz8NqUT5XugumCsa8
         jW3KNXeuwCtcVAnUUCDv6GChuj2NPivSSNnEHUBgqS4D+viapIpsUAyHHe0qFEwz2MUE
         yX0lZbuyJsa+HAc9/KiEvGjA2mOtoabDyz3fJy5Yq+Ynv5kwM4qucf6qNmMrBTo2JB+l
         MvbIfmzsp5NaV4bg/USumfm2z/kDfyKUYH2P3ccB+PAZjSjjxMQLzpYwg0Yy7UjG9ZbL
         GkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687615029; x=1690207029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9aKXFcPZYN71lVrD41n3tvciEk57GS1gmN4aKHDSr8k=;
        b=V6CvQf/zsTY/C7zZWlcBZr/BiGC+o3NcyQCKj/PFzezN3Ny9+xZQzYfIIfxWIX2xoP
         6BlyVuHkzNXcGQ87bKr1iIkcPA7TmguNB+jfrtPJ1bnqqcl1yB7yfg4RIpSL9Rx532sr
         661Bo0/Zfy5sgKZRsOvW4HNx1gK4OTP6hOAmvNA7+3HOVQGShRkAFT2nxkoXi2pZHhFN
         46GppGMq8PWe2iRO4A6AbGsNkxPAofDTM0QrwQuOSOuSYv6meCP1Wg6EnZfQ3+3cl0O7
         J5KSavH77uWn1z0eLUDXf5yS7D7fex54/iLjekOmosCJ7YhmrSQdFDfyYPPCzl5q1hfD
         J5Dw==
X-Gm-Message-State: AC+VfDz3a9BG5No59Xpu5iA5E9hfos7Fjn57ZBdZJadaOGH+GdI816FN
        vmylbTsPCaOfUh0kXD9GlRjkVw==
X-Google-Smtp-Source: ACHHUZ6k1LKKBFNt/EX0E7NN433j+xnsZspguI8URc9lAQkFAD13Q5b2hqPG6AkXMdmpgD7FDiPWcQ==
X-Received: by 2002:a19:da02:0:b0:4f8:70d8:28f8 with SMTP id r2-20020a19da02000000b004f870d828f8mr11500375lfg.55.1687615029558;
        Sat, 24 Jun 2023 06:57:09 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x23-20020ac24897000000b004f643664882sm287279lfc.147.2023.06.24.06.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 06:57:08 -0700 (PDT)
Message-ID: <5bdb02d7-74c3-2d54-28c5-eb5d33ddbdba@linaro.org>
Date:   Sat, 24 Jun 2023 16:57:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V5 5/5] arm64: dts: qcom: sm8550: Add camera clock
 controller
Content-Language: en-GB
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230623164619.11464-1-quic_jkona@quicinc.com>
 <20230623164619.11464-6-quic_jkona@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230623164619.11464-6-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/06/2023 19:46, Jagadeesh Kona wrote:
> Add device node for camera clock controller on Qualcomm
> SM8550 platform.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
> Changes since v4:
>   - No changes
> Changes since v3:
>   - No changes
> Changes since v2:
>   - No changes
> Changes since v1:
>   - Padded non-zero address part to 8 hex digits
> 
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

