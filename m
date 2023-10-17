Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98385CDB474
	for <linux-clk@archiver.kernel.org>; Tue, 17 Oct 2023 16:57:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234911AbjJQQ5r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Oct 2023 12:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbjJQQ5q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Oct 2023 12:57:46 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD09A4
        for <linux-clk@vger.kernel.org>; Tue, 17 Oct 2023 09:57:44 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40839807e82so783675e9.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Oct 2023 09:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697561863; x=1698166663; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u1ClCw7ik0QFiMV0GzYa9kALOXJru7vc9VzqBic4bFs=;
        b=td1GDO26RtqMRhiLfimvnflN6/I0to9K/IZA0BPe7Xf1ZJ7eB5rc2QoFFisQX+ZN7M
         upOtiWpj0ULZqFrkfGjwgknkSJz9fZTEn8AWjirKvX8KLKQonGvjXC85/Wdqtv10zHzW
         7wl6BeH47ZPmnCPz4iHuhr/sWMpbvSy7RgXtufkGPROHVj1bw5OrfOT9GT1ntj2A+HJq
         AmobRsTSg3ZYYEYNsnzRaATPYrFeSZYOy7IPf4O748H04tvbxPwec50HwIXIGrzLEo7B
         9gq6+tvTVeqH+U7XoaACV+t5qKFdpk7rz61xx0WQQu6LQTNjN6s6XArvZdb6Dy1PzRYw
         uDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697561863; x=1698166663;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1ClCw7ik0QFiMV0GzYa9kALOXJru7vc9VzqBic4bFs=;
        b=xQph3MgLF14EL7+Y8IZMxEGqLsLY52H0a0p7BkuAzEQYIE5US3aiDg607fWte+AInB
         xo5HWUTsGWCtUnTE3V1ovHv3+JOf27AHPSglbjnYJZeE/fZ0fKYK98cD7tRQTN5uzCzo
         HXZa73KCHJ/ux+vfr/H3ayips7k8VKC7GvvFECI57lZ94X/AMx4BFIHLk4r5I9yOGEgh
         Cxz2X6yapMmxUXTXcpKmj/d/QN02M4yLDX3tOsgIIi3+DaSsjwNifH20TIDw1spFQk92
         YPedxFOs2AQFxgT8TiftfZTSqL1KoohBu0TFNUz+INSvUg95McQwIRl7tanP1IXZUvfs
         TtKQ==
X-Gm-Message-State: AOJu0Yyykc8bB+5vRqGoUnTUwpBuFtir8lNYqIcD9wqCQF4XkF1rIEev
        CiWMrozhQPcYGV97GCT0iNJJ9SoKk2zDphLILy4=
X-Google-Smtp-Source: AGHT+IGRWpaXq1H2ZUzMk1TMdXan3XiSmH4NBZj9fhdDlhHnRMEz4cQ4VR4jb3Pa0Wr/hhLH5DDMyA==
X-Received: by 2002:a05:600c:1c84:b0:405:784a:d53e with SMTP id k4-20020a05600c1c8400b00405784ad53emr2091687wms.20.1697561863238;
        Tue, 17 Oct 2023 09:57:43 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c234300b0040813e14b49sm1752232wmq.30.2023.10.17.09.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 09:57:42 -0700 (PDT)
Message-ID: <2ebad3aa-acde-43ae-b849-0a72a1ab2494@linaro.org>
Date:   Tue, 17 Oct 2023 18:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gpucc-sm8550: switch to
 clk_lucid_ole_pll_configure
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20231016084356.1301854-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231016084356.1301854-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/16/23 10:43, Dmitry Baryshkov wrote:
> Instead of manually specifying the RINGOSC_CAL_L and CAL_L values in the
> alpha_pll_config.l field, use the proper clk_lucid_ole_pll_configure()
> function to configure the PLL.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
