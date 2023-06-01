Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F4DC77B7E
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jun 2023 10:11:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233302AbjFAKLc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jun 2023 06:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233752AbjFAKKh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2023 06:10:37 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722FB1AB
        for <linux-clk@vger.kernel.org>; Thu,  1 Jun 2023 03:09:56 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f4f3ac389eso716081e87.1
        for <linux-clk@vger.kernel.org>; Thu, 01 Jun 2023 03:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685614195; x=1688206195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YjmDK1b+XgS1XoK0ZAhZVvk8JhEZlZQYOJoJbk6aMT0=;
        b=MuvRCjFr01vo+CuxKOXEZNxBxAoboas5MWksj7h4GcC3kKcjl8lnSbwOp1HbUzqcQt
         gQRhXHnc8oYeAbrbQkcZcrpLCwAWGD/r6nqP30VX0mWx4ZBxloTNiK/47eyiLS48XX5v
         NgdPV8a38GGe5BQnip98I+qV5aMK7qjE+gOpVYvTfHL2JEsjoBIeRAnGiaBhgW1vYVjw
         GRaMXaI6nfekIB7GBZ7sGQ3mlPH3oYvuD/otjy2mUGDqDix63ZWmFsAnfAyQeFy+Btjf
         mwniab+uHPcwDqh0MFpB6i8GEmXS5PntomDTWcDSFcjTswOHA/keVHbdKae2sLbUR6dO
         tJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685614195; x=1688206195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjmDK1b+XgS1XoK0ZAhZVvk8JhEZlZQYOJoJbk6aMT0=;
        b=OPnSiipPeEyrDDGNUrD5fQ+6ayZgQ8HH5qbmHmRR5ZaZJql/jlSrpg9uyizCInDSor
         06LgS1FaBkK0NzU/XxNdaCwFlnxPFV9ipsYrP/+Al7d5IL0ikF8LGxE9RRTIY8zD2CZz
         OJbuzW7OyduOGW+E45DGXBIL+oP1MkVkEWna7ofzJ2k2/jtEzqJm8J1CVLH7Cpe2XEpl
         8bXdV47wqP7CGVk95T8HW0JyuxjEsdum4FxoSOXZhQsJNlcT/alKB6zYjEOmoPdHAUqA
         SSNXc4zS5BbGTo3w1mqqanJK8G8UkuXxHTeLZIC1nDqNN8X3wHloeImRonWddBVq1iDy
         /dFg==
X-Gm-Message-State: AC+VfDzAKeQB2wodxiDd99gKUmEw1dHuluFHNAPlSFnpiT1dMaclPkWn
        Dye7qlnkmZatvyL5e1ryUqxm4A==
X-Google-Smtp-Source: ACHHUZ7wxjgqTSQ2q1mTGKeArEjxyfrGjPY2wTE8udgediz4XJ1hoFe5fDIy0v8ItqjNxXdBvNXQoQ==
X-Received: by 2002:ac2:4435:0:b0:4f3:b4ab:d0ee with SMTP id w21-20020ac24435000000b004f3b4abd0eemr924066lfl.42.1685614194676;
        Thu, 01 Jun 2023 03:09:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id m3-20020a056512014300b004f517c21ef0sm669797lfo.82.2023.06.01.03.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 03:09:54 -0700 (PDT)
Message-ID: <1eab0512-5120-9dd5-30e9-1e8f0c2f541f@linaro.org>
Date:   Thu, 1 Jun 2023 13:09:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 14/20] interconnect: qcom: msm8939: Hook up RPM bus clk
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
 <20230526-topic-smd_icc-v1-14-1bf8e6663c4e@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v1-14-1bf8e6663c4e@linaro.org>
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
>   drivers/interconnect/qcom/msm8939.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

