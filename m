Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B5CC46467
	for <linux-clk@archiver.kernel.org>; Tue, 10 Jan 2023 10:55:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238183AbjAJKzv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Jan 2023 05:55:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238263AbjAJKzq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Jan 2023 05:55:46 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A0566999
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 02:55:41 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id r2so11287323wrv.7
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 02:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=steAEzh8bEsrRFaPtR5QEO7PwY+TRudVvhGkJEjyxrM=;
        b=nkM28h88WcckND4JJdWLKnwnMGI7HvjWyoei7BfOUVO5rbzPCJNQQT8oVhvU/hfkZ0
         Im4Bw75GhShlHBMIsHA9UlmLR6qIGBTYNsvGeEuxhWGQ4FEzUq86bP5bxdwhzmvHIHai
         g5hzX7u9clSMTahY9oWaa+Ly6k/sel8soNjmQxUfm8+TF/XiWUhntfKgwvYcSxodAu+L
         Wloxjj0dlecVgpgKP8vvsXNVAcIDBPMtkYhcSQvfFGWaIcZX1ymQ2IyH9HyFmZfnKoK8
         Zo32R8jVe05037Wt3Wi9GpCov4CLScu8d3FpfPTahyF6i5hfO24U+4bx9OMMyHhyO4dp
         yL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=steAEzh8bEsrRFaPtR5QEO7PwY+TRudVvhGkJEjyxrM=;
        b=wgvHVr1XSE5+lsUD6tIiHpkfufCqRhQjDLnKfN1JvqOft8t+Zn0pAD1Rff1kX0PDMa
         uFGBJMboslOoBs6U+LeV0EwXI9TV1MZezsL/+tg16b5J/UflUXlMDtPT5QXfILVj2nuM
         CzDf2vecLsJc7gPmhf0sUfUxZrz93HMVO2kPOPRDGFw5lqioVxTVRJKpcO7UFkdRwgUF
         qq8Sz4T8JL4NkXBSCQnHnu6H0N8y5Lbkr1l9OBRfVT0sBE+BqffO+rWBb/49O3WYeWHn
         0WhZYzZ73VXchrzKxCbIISMLvskt8+LidnET3bw9ctw/Y4QwEz8rADGyRCGs/6oiWxpT
         thLA==
X-Gm-Message-State: AFqh2krru9J2FHaLkWsGea3FjFtxrfwh3SAOMY/FpMwoMMMKc0Kl7qb5
        rxOR+xpiqaIPwJxyHxYwVrezBA==
X-Google-Smtp-Source: AMrXdXsWypeJy1KwetU1TKmnb3+brikmWgsmmvQUMmlaAG7xOOcZoLypIut/nX7oHHCRe/05wwxTeg==
X-Received: by 2002:adf:eb09:0:b0:2aa:1121:1b79 with SMTP id s9-20020adfeb09000000b002aa11211b79mr13601321wrn.25.1673348139731;
        Tue, 10 Jan 2023 02:55:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t17-20020adff611000000b00236488f62d6sm10703537wrp.79.2023.01.10.02.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:55:39 -0800 (PST)
Message-ID: <26589373-4ed5-10c5-9b49-3edfa78c71e6@linaro.org>
Date:   Tue, 10 Jan 2023 11:55:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RESEND v3 1/4] dt-bindings: clock: qcom,sc7280-lpasscc: Add
 qcom,adsp-pil-mode property
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        swboyd@chromium.org, agross@kernel.org, andersson@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org, quic_plai@quicinc.com,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com
References: <1672849297-3116-1-git-send-email-quic_srivasam@quicinc.com>
 <1672849297-3116-2-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1672849297-3116-2-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/01/2023 17:21, Srinivasa Rao Mandadapu wrote:
> When this property is set, the remoteproc is used to boot the
> LPASS and therefore qdsp6ss clocks would be used to bring LPASS
> out of reset, hence they are directly controlled by the remoteproc.
> 
> This is a cleanup done to handle overlap of regmap of lpasscc
> and adsp remoteproc blocks.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

