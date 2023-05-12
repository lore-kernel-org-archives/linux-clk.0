Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268CEC77B7C
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 09:20:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240364AbjELJUa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 May 2023 05:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240360AbjELJU3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 05:20:29 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1784A106CC
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 02:20:28 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-96a2b6de3cbso531835766b.1
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 02:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683883226; x=1686475226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WI1u2xkb9PqtJQUWjL66JWNoMo4VYDMfmdWYrQ5IOWQ=;
        b=WtPgo570zS6ebbv9Yc/nBC0ha79anvKxdZiQrKzJeBz+UFBiRf7ElS5gA53d/G5uWu
         JlAWsvJCmsJtdfB3/pXDS6KXWI2yro2GTJ5PSMp1OEtWJpTXA3OBfoQz74ZGMiKXJDWo
         UWv4hYTtuWaWO8+vR2eVANOz+31H0QUFknQhVgAjhmM/zcsvo3MMyGa2r2MnuZGDztuF
         fDAV3jnSvQWl5B8BDCSL305v+fgAIGu0Gc8Ty4y+Il56s6mkl1t7HkSCe5zO33aY5uR2
         qNT1rOomfTaCap5bFEwDwO/bhrlcSWAPjrEC3PR3ZqN6UZ7N/K7ut17oFh9MjyGl3VDj
         7Smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683883226; x=1686475226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WI1u2xkb9PqtJQUWjL66JWNoMo4VYDMfmdWYrQ5IOWQ=;
        b=VIwb9incsTU9Z2rp/zXBTPwOnXxjoDqtJ6Qo0BmCqx3wRRUcLur2vD6kncfx6p0FXs
         J8lY+/oLrHBSDIQmKaneImvWYA94lYmdxYDCyK/Uwgq88mhXAR8vveEPHa/fK/5KNKBS
         N8KsQwqCQwU0Xp2vkxdc4tFpKPedWH7oM6FRd4GKyY8Eo1LNFmyi9Gwgk6/5WvhED5MB
         uoPQ3lGK8XWjKZGHEi+iN/Ypic1yxsmkm+iuH81AvVS4dzbZ+qePUjo2rC0ZIuOYKbnp
         8cuHg2k9bwyxivPbkoAY++s3ur+FRJMpClIyOp4mOOAqtQKp4o9K4Rc74qWnJsNQdYOM
         Y+Cw==
X-Gm-Message-State: AC+VfDyvcLtuHrQYigDDd7ZQNk9lKLUj2sBsYaLwjcqVJggwqW0QQmjo
        /9ypj7a5Plb6Se4ecsBfhfZRfQ==
X-Google-Smtp-Source: ACHHUZ6Xn7wGH3fCpc9H/DFbINSt68g9jFaNkYHKCcHId0qutYH8EdMIv50O5lupVnLDPa+bQ+gnHA==
X-Received: by 2002:a17:907:3d86:b0:967:5c5f:e45c with SMTP id he6-20020a1709073d8600b009675c5fe45cmr16258136ejc.0.1683883226503;
        Fri, 12 May 2023 02:20:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id n12-20020a1709065e0c00b0094f410225c7sm5059247eju.169.2023.05.12.02.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 02:20:26 -0700 (PDT)
Message-ID: <7496f2a8-db87-ffec-8ea8-2f9ff7511a75@linaro.org>
Date:   Fri, 12 May 2023 11:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] clk: qcom: gcc-ipq9574: Enable crypto clocks
To:     Anusha Rao <quic_anusha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_poovendh@quicinc.com
References: <20230512090134.9811-1-quic_anusha@quicinc.com>
 <20230512090134.9811-2-quic_anusha@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512090134.9811-2-quic_anusha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/05/2023 11:01, Anusha Rao wrote:
> Enable the clocks required for crypto operation.
> 
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-ipq9574.c               | 72 ++++++++++++++++++++
>  include/dt-bindings/clock/qcom,ipq9574-gcc.h |  4 ++
>  include/dt-bindings/reset/qcom,ipq9574-gcc.h |  2 +-

Bindings are always separate patches.

Best regards,
Krzysztof

