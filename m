Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8FFC001DF
	for <linux-clk@archiver.kernel.org>; Thu,  3 Aug 2023 13:10:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236131AbjHCNKu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Aug 2023 09:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236137AbjHCNKa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Aug 2023 09:10:30 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2433255AD
        for <linux-clk@vger.kernel.org>; Thu,  3 Aug 2023 06:08:48 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b9cd6a554cso13515411fa.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Aug 2023 06:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691068067; x=1691672867;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ULZh00shqSbFq5grqktN6+UDr7p6MpFnwW0/QE5bbfg=;
        b=sLdx/pJYVtKsg1914OnlGaU0lQSpV9t8Qx9rathAPQshDkGnZmDQwacremsrENT7jL
         TvV3cWkI7aq2/GTiZmYrMfRv/cOBlmDqXwfXxs3jrjHuE3pGZOp2+zndbf/WE+MUA/zj
         TtCg2ON4AE7/VRnQ1nd5arOZQW/BGLvXyeRqvwRak4D2W+Atzq9p5/2k9NyA0X4NEwXF
         IqO5roXHJQtUvxi2AX+wzVKsWiJPfKNthSZdRMXdy1qapagX/9q2fw5EnKD+E+vV9H7o
         4dOPjvSDMz4q4EGBAGjwVbfgtoxAnhZe328VNEmw25x8AhO+teAc4YvSF4qIDMJIseVK
         ClKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691068067; x=1691672867;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULZh00shqSbFq5grqktN6+UDr7p6MpFnwW0/QE5bbfg=;
        b=krVar4diIPehOPUZsrpCc9xg8cJ4kulrO5zEsSlNX+iPml1COWeTa37g/LKpcid/8Y
         k+9X6uty3RriQpThisAZwQcdPXwbh3dR3pH/gqLmqR0RNZJh0HqR3bDU5qjn7K93IYkR
         zB5tkeuNqhr7HYladSoTcpb/1vOgbRvoaE1H2Jak6TF6qOF1w4DK8Xvuui8cTmvs2eSj
         HF/3fty0jjncUoX1bLB/pzaUdAOk5P4F/uVQFvI3HGw8a3sIP8r++KXFAaeLl06qyHYe
         FaSg9LeUuf9s2ZLaWKzIqaxk2G/+tqjIvNGgKqkAZPH+I5J4fSo5I4MJ2L6v0171u+Ae
         YCng==
X-Gm-Message-State: ABy/qLalX0C+7oZLtOZhQpPLMTQq0eFRHjqsRuBrMtI5OAJZUosfwiwL
        AhIzNSQuQChWZLkSNu6vEIlnYQ==
X-Google-Smtp-Source: APBJJlHBhIkn4hiSwGB7dHFwA4x10f32wnddawjsgW3guqIEX0NirLgVtLxRbYeE+3PkWHqpc83xrQ==
X-Received: by 2002:a2e:a312:0:b0:2b9:da28:c508 with SMTP id l18-20020a2ea312000000b002b9da28c508mr7519833lje.31.1691068067412;
        Thu, 03 Aug 2023 06:07:47 -0700 (PDT)
Received: from [192.168.1.101] (abyk53.neoplus.adsl.tpnet.pl. [83.9.30.53])
        by smtp.gmail.com with ESMTPSA id z16-20020a2e9650000000b002b1b92910c8sm3175586ljh.86.2023.08.03.06.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 06:07:46 -0700 (PDT)
Message-ID: <e598e278-8be8-13db-a11d-ae650cb91774@linaro.org>
Date:   Thu, 3 Aug 2023 15:07:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] clk: qcom: lcc-msm8960: change pxo_parent_data to
 static
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     andersson@kernel.org, dmitry.baryshkov@linaro.org,
        neil.armstrong@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
References: <20230803082125.521849-1-yangyingliang@huawei.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230803082125.521849-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3.08.2023 10:21, Yang Yingliang wrote:
> The pxo_parent_data inroduced in commit bac4675a4d1b ("clk: qcom:
> drop lcc-mdm9615 in favour of lcc-msm8960") is only used in lcc-msm8960.c
> now, change it to static.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
