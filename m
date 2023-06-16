Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9C7EB64DC
	for <linux-clk@archiver.kernel.org>; Fri, 16 Jun 2023 11:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345643AbjFPLV7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Jun 2023 07:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345639AbjFPLV6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Jun 2023 07:21:58 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5654D1FC3
        for <linux-clk@vger.kernel.org>; Fri, 16 Jun 2023 04:21:56 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f6370ddd27so746216e87.0
        for <linux-clk@vger.kernel.org>; Fri, 16 Jun 2023 04:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686914514; x=1689506514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9AFVVJUU2a3J7rX52GO0yuu+o/Wphy8iDgj8w8iCy8=;
        b=SiLajHKV5PPKHPTZm8F4oSx5a4TEXFkLrSC0uSd/QkIS0MeNqDJeYRANUWmVGYUilF
         FqsFN/3eNcbU4QIl3Iktjnyg9zVAO2t/14TLlqYrqunBx/X7Vv8yfIBF6wnyXB3Uovfp
         qNdjdDcFG99jCcyFq7bVX43Z0XGAbNfZ4jgOxAWXEu2xFWgTNi9j8H58h1IipG6//qf6
         93MECTyMrFJnwNw9tjOJ+Ad74ukC4XiDLVh+dOw+q6N6kHLvNsbc9X5PGSdfp2g7CvhZ
         AnDglJhVw2yMbxLIx3XqG2FKnnsYR6kxCZdSPTEOoU5v0nTmXMuy/d7zU67iGiwZlwrE
         CMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686914514; x=1689506514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9AFVVJUU2a3J7rX52GO0yuu+o/Wphy8iDgj8w8iCy8=;
        b=H/hVZICcG/Ci5e2xwTUUyFcB0sECQCJDFvzA1oF2haTgQndBLJbGTHUgQOMtIfTknP
         v+OsdAK3CTH/h92x0HPEp+8ew/bSmNm8r3WNtD4PcSupJXV9Mw0S2+nFWh6cehcicouY
         CnFNXDo0G3YO6KTojvY8cmdmb6EqghYKJSUu1mTsfMQhVB12rF5AY7ncvY3l1B/luRX8
         9zHVvJ0yD7lfj0Kiw1yZCbMuS6luyvRqKGLefgCQ0ZZcC/twoqpgjinOdgLnDYVN0/16
         2232jWrfrefHI4XDXR+pDn93a3LczvMyLhFe+Si8mTlgRBWGIwiB2zp21ky8qMkwdSCy
         tP8g==
X-Gm-Message-State: AC+VfDyHNRUVUkTf7867eUU/5ekTDRNHr44Y2ZdN7stOBjlfJ6716Fyo
        c5Z3Fr1sXSsj5FsZuXVLkmZPFQ==
X-Google-Smtp-Source: ACHHUZ4Syw3oZM4YNS/8pjaSvesmeoSok7WWaFguhjpSYchWZo4nDZT1eQR15fus3VyVGiBgGnXKEQ==
X-Received: by 2002:a19:5055:0:b0:4f6:14d1:596d with SMTP id z21-20020a195055000000b004f614d1596dmr1045011lfj.61.1686914514506;
        Fri, 16 Jun 2023 04:21:54 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id m7-20020a195207000000b004f60a2429d4sm2990923lfb.78.2023.06.16.04.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 04:21:54 -0700 (PDT)
Message-ID: <c963cc67-5c8d-4503-af0e-082ee0be8688@linaro.org>
Date:   Fri, 16 Jun 2023 13:21:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 0/2] Update GCC clocks for QDU1000 and QRU1000 SoCs
Content-Language: en-US
To:     Imran Shaik <quic_imrashai@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230616104941.921555-1-quic_imrashai@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230616104941.921555-1-quic_imrashai@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16.06.2023 12:49, Imran Shaik wrote:
> Update GCC clocks and add support for GDSCs for QDU1000 and QRU1000 SoCs.
> Also, add support for v2 variant as well.
Does that imply the first submission concerned v1/pre-mass-production chips?

We usually don't support these upstream, as they are rather short-lived and
never (officially, anyway) escape Qualcomm internal..

Konrad
> 
> Imran Shaik (2):
>   dt-bindings: clock: Update GCC clocks for QDU1000 and QRU1000 SoCs
>   clk: qcom: gcc-qdu1000: Update GCC clocks and add support for GDSCs
> 
>  .../bindings/clock/qcom,qdu1000-gcc.yaml      |   6 +-
>  drivers/clk/qcom/gcc-qdu1000.c                | 162 ++++++++++++------
>  include/dt-bindings/clock/qcom,qdu1000-gcc.h  |   4 +-
>  3 files changed, 118 insertions(+), 54 deletions(-)
> 
