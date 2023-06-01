Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86511C77B7A
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jun 2023 10:14:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbjFAKOf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jun 2023 06:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232183AbjFAKOR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2023 06:14:17 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D461FC0
        for <linux-clk@vger.kernel.org>; Thu,  1 Jun 2023 03:12:01 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f3b9c88af8so712116e87.2
        for <linux-clk@vger.kernel.org>; Thu, 01 Jun 2023 03:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685614318; x=1688206318;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xkcs4FBY2IH4uDP0ChTAwfANhMPVoHA+mIZMX2WPYU0=;
        b=IzxMTmMNDL6QqmBHuED+qJBF1pSH7Q6PLscxabaALjBfya+Vc9NN5QeY4e8hhICVqm
         g0+XhtDk2Jm/xvZ8qSbhITYzsd6klovst3Nz2zN1rkN+PAyxWz/mJ889UMqMeX5Yb3RK
         uW7RT9actilECmUo71JKqoMV0zVYvZhAGUzs2b4q7WQzf7Zeov+lTjsewCi33cW9tHBm
         gVNRD3P0IRKWdyFm6qCTeXhluUkZ/HF16a6VNI7Fxqb+oaJoPLJj3Drg0ziJ2c5Vp3vW
         f8nSGsqLCGsHZypoDXGIcYrvfu6TzDpUzyeBMoAmsXgEPeOKIVTV3G+vV6SbH2lgyNLe
         kKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685614318; x=1688206318;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xkcs4FBY2IH4uDP0ChTAwfANhMPVoHA+mIZMX2WPYU0=;
        b=XFbpmlKCls9AeeGcyt/gCppu0g+uxcKUNueFetWRNPTdAlMzSk6F229126hL8tyKZd
         94OOJj27nBrPbirkeax7sz/0Yqn5b9eXf5uLU6qw1VgKvS3b81ZnjkJJ9y/kYXQ2z3zq
         Mvn81vJ8VsuZNL7/Budyrif4RF+svVGs7K6O0fxzAdISpp6APjFWJO9ymevV2ayrqU1r
         J5XQStKqVyundOSiWSeSUxcvl+0SVApSI+hpCf+9peOY86Bvv06zKiOvsyCo8y8o/ham
         j58uRWtlHbJsV1W93U062iX6cUmFETQ/vaHIXVsBTOx0vVMZv1sXXXmDzbfDmMCBDyVj
         TnMg==
X-Gm-Message-State: AC+VfDzTn7JjE/e63JsZyydo06Tf+OJQP8IFLO3lioR8uTJe764GF/MG
        Y4DzgZjQwY4EuVYKUp2luaYHug==
X-Google-Smtp-Source: ACHHUZ6Ic/CkeTNZPuoG7vOwnAK6JXh0WZ+dJWmz/uVZxjVVZtvkZjOnrfA9b50EB2MfZkjsIt0Vmg==
X-Received: by 2002:a19:f00e:0:b0:4eb:2d47:602 with SMTP id p14-20020a19f00e000000b004eb2d470602mr1000358lfc.59.1685614318618;
        Thu, 01 Jun 2023 03:11:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id 3-20020ac24843000000b004f58c69c583sm224848lfy.64.2023.06.01.03.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 03:11:58 -0700 (PDT)
Message-ID: <c5e63138-ed8b-ac35-c8a3-3a6649df7477@linaro.org>
Date:   Thu, 1 Jun 2023 13:11:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 16/20] interconnect: qcom: qcm2290: Hook up RPM bus clk
 definitions
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>, Evan Green <evgreen@chromium.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20230526-topic-smd_icc-v1-0-1bf8e6663c4e@linaro.org>
 <20230526-topic-smd_icc-v1-16-1bf8e6663c4e@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v1-16-1bf8e6663c4e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/05/2023 13:20, Konrad Dybcio wrote:
> Assign the necessary definitions to migrate to the new bus clock
> handling mechanism.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/interconnect/qcom/qcm2290.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

