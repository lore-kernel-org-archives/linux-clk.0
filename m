Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618D6C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 10:30:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiL1Kaw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 05:30:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbiL1Ka0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 05:30:26 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FCCC101EE
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 02:30:26 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id cf42so23073132lfb.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 02:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YfNKDjlL/IBl1ps/WofCT5YK2K0PufWBlxgDjQwdl4E=;
        b=lJGNxRx+sm07vUaqz8eAVaBOvOBkecJOnFvIcvhMOAT0I+PrVovIFnfL6Luks7og4H
         zO52YlagtGiMGQgb6VdZXHoNSWrG+xTDlFw3sMdYSa34NdNZWGzkdGNa/LuAUiWN2eRT
         TTRUVYtz4drubFMqo3c06IUbWUAk/yteM0lmoRHqe6sUx/0mbkIb5gpuwOPXiS7R+Jnk
         R0JTvimpdkbkhKNjLd5evTTV+L5riw69EdC01cpckED8UAM1vC/b9mA9iaS91gXieB4i
         p1uZW1LrpVd/75PVKiW9KK/C5kmvt4IBKmWyNTXzIMabkDk72cVwzRrXfaxCmnfts2rf
         dT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YfNKDjlL/IBl1ps/WofCT5YK2K0PufWBlxgDjQwdl4E=;
        b=k2Gi0qcxVpXu7ALFdlpFma1IEOBoYWmanE9sGHs1ypfxr1ZYBoCVePI6xoulRivEMG
         VTL1REfmedGmDzz7JXXhz6/oIvE5+vNo2cbULHkqVRUyoiFTa1mkLM1F3QBuALHrD6gD
         OO/ObUwKtbi0COI/V4JXRkYhRy1v08d0o3vMb84NS1odyfWUdMpsioyNxkBNyiVp/++m
         rBDLGrE3SPzcazk33ztpKBYkJTykdY8MSmkCspubZ5idWLB3mm40M73Y1HXOLTa4fbzH
         yl+zw5aqan7Pk1R/dTAl/TLChrruax41ZtJUmjmWqr3jkACLNC0B+SGnZeyMEPH9uWJH
         cbHQ==
X-Gm-Message-State: AFqh2kqzDapUchRaYf2Wp+D7cM2buG5eHwR/g1wtDX/RN1jWXOhPjoaC
        ZPndBo3JqVvAiQ3FA1RC4VtfoQ==
X-Google-Smtp-Source: AMrXdXslXpgAENEAPDKauCftaqi9wz7ttpBfkZ3cUa33HcIgUm13+2ieJ/WemhBKEoarQNwN2JSMtw==
X-Received: by 2002:a05:6512:3b9c:b0:4a4:68b7:ded7 with SMTP id g28-20020a0565123b9c00b004a468b7ded7mr10549365lfv.51.1672223425765;
        Wed, 28 Dec 2022 02:30:25 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z20-20020ac24194000000b004b56a8d9e90sm2608883lfh.116.2022.12.28.02.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 02:30:25 -0800 (PST)
Message-ID: <687b83e6-9dbe-2f12-b4a8-5810f249ed43@linaro.org>
Date:   Wed, 28 Dec 2022 11:30:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 02/12] dt-bindings: clock: qcom,gcc-apq8084: add
 GCC_MMSS_GPLL0_CLK_SRC
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
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
 <20221227013225.2847382-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221227013225.2847382-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/12/2022 02:32, Dmitry Baryshkov wrote:
> Add GCC_MMSS_GPLL0_CLK_SRC, the branch clock gating gpll0 clock for the
> multimedia subsystem.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

