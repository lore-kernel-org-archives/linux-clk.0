Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C9DC5479D
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 21:22:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbjAKVWM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 16:22:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbjAKVWK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 16:22:10 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F073DEB
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 13:22:09 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id s25so17387125lji.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 13:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SpkJwobKqiU8nRFVkZb61TqjLeUFLzQFi5sevtGMDks=;
        b=RXhl8Ldw2vRfpC+jkbVadTGg5irX4Ld2rQFjwPM5/DBN6AUXUNsgo7WMBw8u9jozdw
         BY9YZNf4Uj8GCHhaFjFLk5Ry3m+ISerezk7P8aOAmA+iihm8GX6Ei2y6FWIwH+6HEf6y
         dxfHjuIGyNMGqmPqRr+ScVRagKo4V4M9Y+SpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SpkJwobKqiU8nRFVkZb61TqjLeUFLzQFi5sevtGMDks=;
        b=YSDLREIQ9wSr4XuEcm5HYv4YYwapT3b+ePCPJarUmU8DXxMzeih9D/2+etjewHPse7
         GRWByj1pjgo9FGEioUh6uHp0yMeFzFaIlS+f23b/kOdxRPRK2lflUbYPFdBtQkzc+2WF
         ltsLjaTTqGZd0QrU0HRQh8PK9g86AKLzVWGJawEo/qIdtw4mNo1Puiib4J3F51i38r5p
         g285oHUW2i63K86d8ZQ78q3B4SLQ9es4x5tZZhkGQZN8+NHg0R6Bh0+zqXnjUoZ8NIIo
         wJy8AZ7ZIP2UCU4Z3uIRmsoUSBiQSC+UIhEi0qe7XUuCrJ6vRHuPX/QAF7ypn+EJZSF7
         DrKA==
X-Gm-Message-State: AFqh2kpGTPhpEBWlWX6dFzOUpjBFAFV73pN0asIy5oMDeCy4WFBxxq8o
        gOrdTEveKggsJE38i+p7NT9e+qi+xsCkNgBHY49ezQ==
X-Google-Smtp-Source: AMrXdXsm6J64WrN7IaY8xb8w+IAY7QTQY+mwkhaNgAeX7Fe/qfFEa6pRbLSCSiNPEVhxwTepH259F9DaiY/EV4/qtZ0=
X-Received: by 2002:a2e:7e12:0:b0:27f:b665:df51 with SMTP id
 z18-20020a2e7e12000000b0027fb665df51mr3900070ljc.277.1673472127618; Wed, 11
 Jan 2023 13:22:07 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Jan 2023 13:22:07 -0800
MIME-Version: 1.0
In-Reply-To: <1672849297-3116-4-git-send-email-quic_srivasam@quicinc.com>
References: <1672849297-3116-1-git-send-email-quic_srivasam@quicinc.com> <1672849297-3116-4-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 11 Jan 2023 13:22:07 -0800
Message-ID: <CAE-0n530eE5Mwcy0nZxAKW99BEpRts83eChDCrerjgYQopJ9EA@mail.gmail.com>
Subject: Re: [RESEND v3 3/4] clk: qcom: lpasscc-sc7280: Skip qdsp6ss clock registration
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, broonie@kernel.org,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, swboyd@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2023-01-04 08:21:36)
> The qdsp6ss memory region is being shared by ADSP remoteproc device and
> lpasscc clock device, hence causing memory conflict.
> As the qdsp6ss clocks are being enabled in remoteproc driver, skip qdsp6ss
> clock registration if "qcom,adsp-pil-mode" is enabled.
>
> Fixes: 4ab43d171181 ("clk: qcom: Add lpass clock controller driver for SC7280")
>

No newline here.

> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
