Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05516EB64D9
	for <linux-clk@archiver.kernel.org>; Tue,  4 Jul 2023 08:06:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbjGDIGF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Jul 2023 04:06:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbjGDIF5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Jul 2023 04:05:57 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD687E64
        for <linux-clk@vger.kernel.org>; Tue,  4 Jul 2023 01:05:52 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51d5569e4d1so5002027a12.2
        for <linux-clk@vger.kernel.org>; Tue, 04 Jul 2023 01:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688457951; x=1691049951;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kE2ue8LGVuugjUiTDaUn50VTM+JPtGA4JYDXutTtpKg=;
        b=eZ00IGtMjV0y8RSQK1G+L0JHyYMiUuhSy0hbYWjiVnQLMwCWZ/IbI42ATFnlfasT06
         UEKPptczTbQ7Ntat16D4ikwpLo7FGp/AK8n1tySnfm0X+7xc+iP0AFLN2C5pOlTy5vG1
         QQ4C+QUqhLgU+bWtJqknLZSKyr7CYJJSTxOuvkYVpCQ9HEMu1iyoWvZl8r1PXPX5O5ZI
         cwdUXUGQ4csqkxt3yfQa/Jw/F2rOpj52jNlEz2gupm5UIulDa7QRluGNlBbbO0VuZFJT
         ESv5SV+AL8miTQbyxzmzwKkOIASl9povXsUxIY+lFfj+clJh/4r49dX25wlDnBq7A+lM
         bPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688457951; x=1691049951;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kE2ue8LGVuugjUiTDaUn50VTM+JPtGA4JYDXutTtpKg=;
        b=BWfbD/Fhyvg5Kd81kTGqdpf2ygmX0jWJlameIYy6PGTCRJycEbrG2uANvPqEPSSlml
         kXVPx3RIE1zxUsZ1FHPhytYigujpthpoYVZ9wY3dvynIYRugPXqbrSGWmhkhTnH2tChh
         1jL8gTiTkj/rRJof0yWqnmjrmpBLmqFOzAHgPL9lofzXy7h4KzedEMEAGyymwe3B8A+Y
         0tct80YbBWuAXrsMcMnFbjhu0lKPfNbv4HvwSyaSWABzuAkJP7qD1qJsl9yM10Cfh7EP
         g+W3NljSCHvf7Zvb+H3V5oOdboAb6vi1Au2JL/ObTVP92ZcJx/qPgq//5BJ/3OeWYnzQ
         OaPg==
X-Gm-Message-State: ABy/qLYf6tOxPIxfdw8BVi/KPjf0QJ6hmKSHdF7t1lt3dx0Y2L4N4oWd
        sEfsttPwQxPsARz6gubEbCawCA==
X-Google-Smtp-Source: APBJJlH1b2c/hQwTCfqQugMRZr6jblfjuFAZ4XD7Ctk20k2tIjH8q2+xYaNZOo4GRWIpOQ6n7g7lkQ==
X-Received: by 2002:a50:ed1a:0:b0:51d:8971:4325 with SMTP id j26-20020a50ed1a000000b0051d89714325mr6186944eds.9.1688457951360;
        Tue, 04 Jul 2023 01:05:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a17-20020a50ff11000000b0051a4fcf7187sm11269669edu.62.2023.07.04.01.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 01:05:50 -0700 (PDT)
Message-ID: <10027cb1-ad3e-ad19-d25d-5356ef715be2@linaro.org>
Date:   Tue, 4 Jul 2023 10:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,sm8350-videocc: Add SC8280XP
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230703-topic-8280_videocc-v1-0-8959d4d0a93e@linaro.org>
 <20230703-topic-8280_videocc-v1-1-8959d4d0a93e@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230703-topic-8280_videocc-v1-1-8959d4d0a93e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/07/2023 20:09, Konrad Dybcio wrote:
> SC8280XP reuses the SM8350 video clock controller block, changing just a
> couple tunables. Docuemnt it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

