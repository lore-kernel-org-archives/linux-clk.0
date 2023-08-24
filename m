Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7CFC7113B
	for <linux-clk@archiver.kernel.org>; Thu, 24 Aug 2023 21:05:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjHXVFL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Aug 2023 17:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243647AbjHXVEv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Aug 2023 17:04:51 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 421362109
        for <linux-clk@vger.kernel.org>; Thu, 24 Aug 2023 14:04:26 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-48f856b04b6so128171e0c.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Aug 2023 14:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692911065; x=1693515865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WkoUCmzk6kpY7dtKJHiHxStqN+h+r9LgpuChyH7uCV8=;
        b=Hm2mieTK64nboBW6aRDOHQOMRRpXIfJjIGW3+Nv9NG8xf5mb8heB4vdn2340LFcpgR
         o1i49N8Tm7UgFcncyiLVWoSz+64AuBzDoMFOJFJNXpItMuCzYTts+L3F+xwNmqRoOaHr
         FBeRTvDfOQoGomZIXHrEwHdqQMowdho66xvGMvF2AdGC+dUnTag6Vr9FzD4clIJFDaIf
         4vr+e8Jhh97YA7U+Qe1mGtbqzd78RWaS1a/ao6aWz0HEZfOLQidTlF3Oxod6AWCmUTrN
         HC32zsfCq9IycW6DFH+P4edvqOCHamN1NYOJDf2QnMZBC1cAFobUuZ3wgvydSTzu99Et
         WDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692911065; x=1693515865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkoUCmzk6kpY7dtKJHiHxStqN+h+r9LgpuChyH7uCV8=;
        b=GC1ameCD5y1dDub/ZQYz5rEpQt58e4pH4ikVbtt5S0RUCzVFTuu6XdruEKfBDSswlQ
         cVNYDlEoleZwZ057lHucSEWKRMcTrHqmEki0o3j6eTtRQEV+pg3bJAsZfL0QjmjHE4oA
         gXGqcVJ3TFMNH/+5X8ka4DmxzddH0XGlmdqKMfXU0dpNHocVGq+uZ+xgk1GHEljZZs5T
         gTeaDrH39DY5TqZ6F6d0VaUxOvLK25HRI91T7iOhL991uAT/yvsLEBHYKUoqLaWSp62Q
         i71Xh5ky5se/DpeyazD2yOBcdCL59iRjYthfUHlqZH3dYTSJYqaXvY0xKnykjdqiKQlR
         sDxQ==
X-Gm-Message-State: AOJu0YzVB5iuK0VK1kdLSJgm9yp+pPR6TF9wvzD0tvCmiJ/j6i9zWtuy
        YG5d076W9pY8s3YpkudFNuu21EA7VDd1tU6jaAAoSQ==
X-Google-Smtp-Source: AGHT+IGeJ7/r6a9gBrmT0pw+udF19ySh/nVFMaDVPBWMqeCt+B+Sx87zxPTnpBNBUFQEk0Z3KZmLmA0nHnEvVUN9N88=
X-Received: by 2002:a1f:e643:0:b0:48d:1cf0:f3c3 with SMTP id
 d64-20020a1fe643000000b0048d1cf0f3c3mr10466825vkh.14.1692911065190; Thu, 24
 Aug 2023 14:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230824173410.550126-1-quic_ajipan@quicinc.com> <20230824173410.550126-5-quic_ajipan@quicinc.com>
In-Reply-To: <20230824173410.550126-5-quic_ajipan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 25 Aug 2023 00:04:13 +0300
Message-ID: <CAA8EJpo=ZDmoMDyfHEZV9Ng6yM=Z2SdTyPSG246AmLKVR0-vwQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: qcom: Add GCC driver support for SM4450
To:     Ajit Pandey <quic_ajipan@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 24 Aug 2023 at 20:36, Ajit Pandey <quic_ajipan@quicinc.com> wrote:
>
> Add Global Clock Controller (GCC) support for SM4450 platform.
>
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-sm4450.c | 2898 +++++++++++++++++++++++++++++++++
>  3 files changed, 2908 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-sm4450.c

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


--
With best wishes
Dmitry
