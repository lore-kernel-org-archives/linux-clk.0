Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E0FC7EE2E
	for <linux-clk@archiver.kernel.org>; Fri, 26 May 2023 15:55:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjEZPzD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 May 2023 11:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244004AbjEZPyw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 May 2023 11:54:52 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A947F3
        for <linux-clk@vger.kernel.org>; Fri, 26 May 2023 08:54:51 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f6e4554453so6817255e9.3
        for <linux-clk@vger.kernel.org>; Fri, 26 May 2023 08:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685116489; x=1687708489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UxJRX95nR7lgawLbY9ei/X7hSzGOF/KUvLucc8yijNM=;
        b=g7PSHot2l7VS8EXyTj17hqAOLoSsCnLRDW6gY0Spb1atRcCo3AyvjDAQdFQmYEhL3g
         DIvb/y/nRRwgZNWt65p58Iz/nQWLCJ1XMLBqQ3jxrvcC1K1eiRzqeF66lxDnBUNnf01U
         q+MtowiYszrvL5JxgMgiD6m0/h5HDxVgGjD29lE9rGSYgElFnPnaNFCkIYGRHsJvfLLb
         yRHcbrZUVkKmbIQnigv6vgukxaCmLcL5R+XltVbbnHB+ZlxD5L9pmLW5Jho3Nxxl/td+
         l1TKWDQZnEj0c5RYy4V52YhvZ53SAU8tMwoSJzqY04pcFUQARJMwSyL4rK2etQ4S4E4i
         oruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685116489; x=1687708489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UxJRX95nR7lgawLbY9ei/X7hSzGOF/KUvLucc8yijNM=;
        b=dRJYCem928dd1v2Aw59lWMrXzeedNymqDnjCmg6On9tu2jC0p/aT7LqNhRfP9Tyo9H
         bYPVDxqWVA1mrQu9XKbGOpNEdC4Q8D3GrM3r6HAULzsQsuxdqzQ1iaAUSXQ+CsGyL397
         Yda+HdFk+TJ9t4TqjAglv+OJIZKc3n7NvSfVPfkLFZVKLtYCaV1PaKU6fcTQ14vmNDfF
         QtRu6zDoZnsCwZjWrIm2BDJM2TG6w78irtfojeFuwcTr4bvsx7oew9BqftyBvT/wSDE2
         WYD54xsQtxnYBChNgYlgAB1ubmcJ1Homb0Rz/fSkEoCISc9LCPLP575q7UmcH800wYE/
         RrVA==
X-Gm-Message-State: AC+VfDyyRhKyURXq229nN1HcnPa7+fE9f/gq8jiG41/Vp3taU8Brns5e
        bRcKcGPuAmGfDeReGaXlkCSzqw==
X-Google-Smtp-Source: ACHHUZ7VBICs66Xv1eWHGLAdsaUs4Rm1TwIh0QnGVY2XmsmEvwuQiqIHqwluaA2IgFSdB/I1iexJNw==
X-Received: by 2002:a05:6000:505:b0:309:42f3:4c3a with SMTP id a5-20020a056000050500b0030942f34c3amr2040157wrf.32.1685116489672;
        Fri, 26 May 2023 08:54:49 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e18-20020adfef12000000b00304b5b2f5ffsm5419516wro.53.2023.05.26.08.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 08:54:49 -0700 (PDT)
Message-ID: <240fa683-afb1-eb60-c24f-2b3f1d7f1339@linaro.org>
Date:   Fri, 26 May 2023 16:54:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V2 3/6] clk: qcom: clk-alpha-pll: Remove explicit CAL_L
 configuration for EVO PLL
Content-Language: en-US
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230525172142.9039-1-quic_jkona@quicinc.com>
 <20230525172142.9039-4-quic_jkona@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230525172142.9039-4-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/05/2023 18:21, Jagadeesh Kona wrote:
> Fixes: 260e36606a03 ("clk: qcom: clk-alpha-pll: add Lucid EVO PLL configuration interfaces")

Is this a "Fixes" without the previous patch to stuff the CAL_L_VAL and 
VAL_L fields ?

[PATCH V2 3/6] clk: qcom: clk-alpha-pll: Remove explicit CAL_L 
configuration for EVO PLL

Surely you need _both_ with this patch depending on the previous, per 
your comment ?

-	.l = 0x3e,
+	/* .l includes CAL_L_VAL, L_VAL fields */
+	.l = 0x0044003e,

---
bod
