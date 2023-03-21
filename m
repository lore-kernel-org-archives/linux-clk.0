Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED84FC761A6
	for <linux-clk@archiver.kernel.org>; Tue, 21 Mar 2023 06:47:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbjCUGrg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Mar 2023 02:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbjCUGrf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 02:47:35 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F8FA199F4
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 23:47:31 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id t5so18893598edd.7
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 23:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679381249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vud8OdanTIVE8CKcTMVQ4gPfhnpd++tLAO321wwmVqE=;
        b=WU4xX6kjc3o/CIHowPEa/CpBbEe85Iy5kyudkFpNiMq8oQuLVFC0LR45eT7xOc1nPn
         B+CPR33JLOvMNdVhWOaAqIBhWBs6eY9zkPEwPKYJDaNnfiaskWZAzwagHGG55FUuWdfk
         LLq4YteSf4JjlnoFe2v3Q4DxhOqnmlUM+sJzI6xp0FoIsld4WOCuhQrLucf4o/W1gUfQ
         QUX/RuxPad5JQzpuT0JHaT/Y1qhiGNQOqiZ44ivhz2fI+8byWRgZRA35vqHeOWQHnE9r
         Por4lmFx6lu6DhXzZCMkhvxHhCN6KhHYida25CxBS8IUeAv7WjbxOo7seBcmFsV9T1PI
         RrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679381249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vud8OdanTIVE8CKcTMVQ4gPfhnpd++tLAO321wwmVqE=;
        b=QUawI2YzCPyR8xRE94KXXo2aFfUAhx3zDT2RFt8x4lNSUUnieU7foOWmqXj+pKxTx0
         TO1l3GvrAwbfRVTKQLTN8FdOFjtr7uyLZsJ2QEtCd0XIB0HNhe9qf41fLX2sTF7I9WNO
         PkH5+C1J/E2d9XPuol2GP0vz1Qhapa1aUpTDM9yTTOoYBYQZzE7AxO/Y4StIiMn+EiM7
         2VwClE3e4bBZptdIg+KmYP1q4rDzpZ/MqpWlY/dsPsA5QAoCRFnYSHTi0+sYdnvLTM0n
         TgvugM/nI1EToUhUO0Js5t1DYg8bGpXbzV52QIBFfM13hl/mDfo9PoJl0k5m+09I4dgw
         MRqw==
X-Gm-Message-State: AO0yUKUnuJ1LEy9Q/WPkIOHJTid9y1NfjgIh98kt/OFoFrKxqxVgPdOH
        prk3z+RTB//0Ef/SCCvLbpq7sg==
X-Google-Smtp-Source: AK7set/mHtnHjY2cm9ymS5lUjnyMD7P05cMdzN8twXG3Yom40qNsZwuqvW6/nCj/jJdo9I6WMLGfsw==
X-Received: by 2002:a17:906:848e:b0:931:88e8:d470 with SMTP id m14-20020a170906848e00b0093188e8d470mr1907064ejx.23.1679381249526;
        Mon, 20 Mar 2023 23:47:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id b7-20020a1709063f8700b008eddbd46d7esm5375770ejj.31.2023.03.20.23.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 23:47:29 -0700 (PDT)
Message-ID: <88368e85-3d1b-63b2-1f31-3a41df1632c9@linaro.org>
Date:   Tue, 21 Mar 2023 07:47:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH net-next v2 03/12] dt-bindings: net: qcom,ethqos: Convert
 bindings to yaml
Content-Language: en-US
To:     Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, peppe.cavallaro@st.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
        linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com, echanude@redhat.com
References: <20230320221617.236323-1-ahalaney@redhat.com>
 <20230320221617.236323-4-ahalaney@redhat.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320221617.236323-4-ahalaney@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/03/2023 23:16, Andrew Halaney wrote:
> From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> 
> Convert Qualcomm ETHQOS Ethernet devicetree binding to YAML.
> In doing so add a new property for iommus since newer platforms support
> using one, and without such make dtbs_check fails on them.
> 
> While at it, also update the MAINTAINERS file to point to the yaml
> version of the bindings.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> [halaney: Remove duplicated properties, add MAINTAINERS and iommus]
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

