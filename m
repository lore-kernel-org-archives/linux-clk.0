Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C059EC54EBD
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 08:44:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239643AbjALIo1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 03:44:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239547AbjALInI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 03:43:08 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E94C1B3
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 00:40:52 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id fy8so42867182ejc.13
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 00:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ENm6iorv0nXln4vaicjGTY0QYGWRA2CrScr4ZR1sLeg=;
        b=jlYz7H9d/myNayeY/5i8py3FP4b/UDBR2+p0jjp/WL++hDL7mg6P66lMIFWQubqWfS
         Czw0Eu8ctiYay+UlZer/NHZCWAVGqVk34cHrDLBUKIr5JtrrNoVkKAsx+9vv5zccvaAL
         qjwiLGxsEejqsUWhoPOTgkSuZ4LE7IInFjUvMmn+N8OHufQRTJF0NXzgohY710PohYjw
         hQo+o42k485mFOBUdWWmSPlG/uX1nNVzUel/ssaGig63wr5r1TwK3gACzhEOFbszKaJz
         VU2QbjF5y9eGk8INzZ1Bg1D/1hQbwiW6pH01T+5a34yItohVXqM6LDTxMFxRN9qT1aXs
         g5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ENm6iorv0nXln4vaicjGTY0QYGWRA2CrScr4ZR1sLeg=;
        b=RvBHweJqAOSSARTp05VJD2IarQPGxBUzD1CWaBU1f8oum+nmML8jJtz+PUo7blnF6S
         thUJO6KNMRFmVs4EdcZpo8W5aTB+tapxiozy7sGJgoiQ6tVQjVz0yGl2asbefUBPBdXZ
         eKhiZyIvozfzGWyYoqvLlN2ZNZFVkmpr7B74p/LUMay6wySBF3nKAJHwGNdKisTvidvn
         yHcclUhp3+oVbsZyijgySERy5JUSPadY0goie+5Sps8gj4FO5hVdK+W4FhB2NKah3WKi
         dpkmxFlzlKqVEeFDGHCqnH6Gx1j1sYjJgVpfwPA04HAwoTsXlCyrNDSDoA7g7t5k7MEb
         4FQQ==
X-Gm-Message-State: AFqh2krn7kkYqCVfqGup9AK3xO88g+Fmcp42HfZkuEZ6SMKmYk4V/gn2
        JlAYdHt+HvqL8mzr9GTulEDDcA==
X-Google-Smtp-Source: AMrXdXthfuv8FieEIEtEsqiKdgK/AJAySU3zHEVGZAskG/gWbt1tR5IhJNQ8wLEbgagglAyuZJwYrw==
X-Received: by 2002:a17:906:a891:b0:7c1:4d35:a143 with SMTP id ha17-20020a170906a89100b007c14d35a143mr61317242ejb.3.1673512851031;
        Thu, 12 Jan 2023 00:40:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q14-20020a1709066b0e00b0074134543f82sm7322955ejr.90.2023.01.12.00.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 00:40:50 -0800 (PST)
Message-ID: <a0f77ba9-5d39-7253-dc83-1b5ac0a43adf@linaro.org>
Date:   Thu, 12 Jan 2023 09:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom,msm8996-cbf: Describe the
 MSM8996 CBF clock controller
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
 <20230111195754.2593134-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230111195754.2593134-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/01/2023 20:57, Dmitry Baryshkov wrote:
> MSM8996 Core Bus Fabric (CBF) clock controller clocks an interconnect
> between two CPU clusters. The CBF clock should follow the CPU
> frequencies to provide enough bandwidth between clusters. Thus a single
> driver implements both a clock and an interconnect to set the clock
> rate.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,msm8996-cbf.yaml      | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
> new file mode 100644
> index 000000000000..2080e1743b2e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Dual license, please.

Best regards,
Krzysztof

