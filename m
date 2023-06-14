Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DC3EB64DC
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 16:52:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236349AbjFNQw3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 12:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236405AbjFNQw1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 12:52:27 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9BF82137
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 09:52:25 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-98276e2a4bbso107620766b.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 09:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686761544; x=1689353544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=93h10qPxQUhCWZsq9GNFwkRNOXrYmgM5sQHpq9Nnwq0=;
        b=OcDgmVQTb39elSJQ3DLmTv08pk7LLdp8T6plF83V7J3tkb+qPgy2LiSZjXeGsmNiiV
         e8JG+V/zDYxG4e8sU6HZlrWNeUQq0K/wPMRrabHgn+pEJpwEYSp//A13VqEo9y9aMYpL
         yK44GTPFgMDScRFcTgS7Nb5M2aIwJyZnAfEcybwH15jCh5RQ9R+FDp1ezSOm3y3wVi8/
         MfavcdNa8B/LUbHZQiz4zLYKJN0E7EoBfJwizELKqAiQompQ9sUNis8n8osE9hk7GNIk
         A08pVSxAdZgKTP6K4bL1pQ4FO6k7ZcpW72OaMxceaJZHoTfZzXN3sPFhWLG1JNwRw8tV
         fPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686761544; x=1689353544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=93h10qPxQUhCWZsq9GNFwkRNOXrYmgM5sQHpq9Nnwq0=;
        b=IT1L/LApdsLbCvOF1QThPhSz+XkOpme9oqPP122SsQdl8cqnqpIIJL1Iy2kNRvae9q
         TCT6i9RJmN8TPkHSeBDV4sW/EQXopeC9D+cRMbBz2yp6EcTbLB8ymf3zbU9ToToUNK1I
         FgHgjZP48BGVuz8FqiSgNoQ/tAHnNKk9DbN5Sxd9xAYAbbbvHpE5RIW7ffSUGANeLtOK
         aAx60lyTUMhU6SGBD5CLimFErR+GJbgjczy0VZ7nMT/eXsAfwyHRlU/Hj+xTKeduz6fJ
         iZkAGdq1p2drdiBYp37iCVkMbgvBYQ0z+wnDfNvHXbsb+8F+eJbfiwOoQ38rF+57pros
         QBkQ==
X-Gm-Message-State: AC+VfDxuadckwKj2bXi2PJhHyLI2dTjYed9WREAqXF6UYbVEt242WAaj
        +qjPaHglsmzGUTBYBHoQ4oI3Fw==
X-Google-Smtp-Source: ACHHUZ7seUtdRaPNhJcbNFjaVpjz06zUGeoXziNRnEw6XLMoz2kG5Kdg8S/1LnZd4jBEvV2JwUkP8g==
X-Received: by 2002:a17:907:16a4:b0:974:216f:dc36 with SMTP id hc36-20020a17090716a400b00974216fdc36mr15745759ejc.17.1686761544428;
        Wed, 14 Jun 2023 09:52:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a19-20020a17090682d300b009775eb0343bsm8278595ejy.79.2023.06.14.09.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 09:52:23 -0700 (PDT)
Message-ID: <7c7ef961-cb5a-ee70-6ec1-7c6afe22c87b@linaro.org>
Date:   Wed, 14 Jun 2023 18:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 01/22] dt-bindings: interconnect: Add Qcom RPM ICC
 bindings
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230526-topic-smd_icc-v5-0-eeaa09d0082e@linaro.org>
 <20230526-topic-smd_icc-v5-1-eeaa09d0082e@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v5-1-eeaa09d0082e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/06/2023 12:22, Konrad Dybcio wrote:
> The SMD RPM interconnect driver requires different icc tags to the
> RPMh driver. Add bindings to reflect that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

