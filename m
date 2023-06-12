Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860E6C7EE43
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 08:26:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232971AbjFLI0m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 04:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233121AbjFLI0c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 04:26:32 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE9110E6
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 01:25:54 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso7283847a12.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 01:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686558353; x=1689150353;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFeo7eqtN3fCmyQTtWielQM7xz42Mq4kjBmnboVmk4Y=;
        b=YOWZoyzVVDwbAwL7zO9aI6GFmBEBBC9wQoCY2lhIabksMfnsFMDM79fEBVPKV+HsmN
         KP6jkmqn2OJyj8qtAWTND9JWJ26XTj7+LKkwuYHJyaAOKk8ANE7ngVw9i6g+nJlGk6UA
         dlrLcSIKGHHPB7s1suaR0ebh0VXSNEKqFrV5TynNYVVa7Gl/hJaAHc0NVXxoi1YIqh2t
         B0DalHFUVBt7YQy9KFzoPnq+EeeAH17icsztVY30rfSR4USKqvANMY6cU43cUn+/eGTe
         gpOPASvTRujvdh+yikfdVZ5ugyVGzZD+jfPX+dXV8GBAa/IzPQouSbPsWM0TYB/GhhAS
         QAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686558353; x=1689150353;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FFeo7eqtN3fCmyQTtWielQM7xz42Mq4kjBmnboVmk4Y=;
        b=U2UhCUYDUv9WGfP5VUTV1VhXmycF0XON5UxE+iVmSOIuWL7ByNmQ/l/trTt33fKJi4
         vRL31oTZc0KGH6v0OtUM8q49bdNsOpkAk2eQBAtaBJ2y8q2LRhqvR70mPaYuky58jJLr
         gnQG/jZbmznwJ2c3gvGF4RQz33ZuLHfsWMLEtCFa0Yf44KEJf6/Ge4psatnsH4EPAr+W
         atVwX/UZO9Tj3hEQ/Y4qj5+N4VFqQjHyele96x1sIpFrCkxPiwZPMLvAtjFHTGDh8PDk
         FXG1Fh4sG7L8fZbjnvgFey0EYFe99XPPp2HYBEraKqZOxZn89XZ9DsP6sRSc0W4Of1m2
         2nDg==
X-Gm-Message-State: AC+VfDw5SlNOTKH+5Yu/LMWZbRz4gWKqiVBgJ0kqnArj5awnOid/hhkW
        hZ21z+2Xmno4y2Ckv2V5cWUsmQ==
X-Google-Smtp-Source: ACHHUZ6ruFjU1gbk4CweBHpq54i0ElmXHeNzejKSJqMDXR758cQX1R+eDjjaMHhn/Wrl6GUSQpPhtA==
X-Received: by 2002:aa7:d49a:0:b0:50b:fd52:2f4b with SMTP id b26-20020aa7d49a000000b0050bfd522f4bmr5469118edr.24.1686558352887;
        Mon, 12 Jun 2023 01:25:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u11-20020aa7d0cb000000b00514a97b6b80sm4784947edo.78.2023.06.12.01.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 01:25:52 -0700 (PDT)
Message-ID: <ec466019-cdd2-d372-b4df-5edfe530e63d@linaro.org>
Date:   Mon, 12 Jun 2023 10:25:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: Add LPASSCC and reset
 controller for SC8280XP
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230608125315.11454-1-srinivas.kandagatla@linaro.org>
 <20230608125315.11454-2-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608125315.11454-2-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/06/2023 14:53, Srinivas Kandagatla wrote:
> The LPASS (Low Power Audio Subsystem) clock controller provides reset
> support when it is under the control of Q6DSP.
> 
> Add support for those resets and adds IDs for clients to request the reset.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

