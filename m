Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB778EC8747
	for <linux-clk@archiver.kernel.org>; Thu,  7 Sep 2023 15:46:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232876AbjIGPqo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Sep 2023 11:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245047AbjIGPZ6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Sep 2023 11:25:58 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD3A10FD
        for <linux-clk@vger.kernel.org>; Thu,  7 Sep 2023 08:25:34 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d80089712e5so494047276.1
        for <linux-clk@vger.kernel.org>; Thu, 07 Sep 2023 08:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694100326; x=1694705126; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RbK6fKvS9Fgoje98ZfydB5ImVNxTq9WKZiMHsHIMJYc=;
        b=w0elKDKrnGLw98bZv7aLtJ7kVmHjcWQpxiX35OM7R2OvpWrc6TJNsTOgSqHvcBPpAI
         bm0jC2w8jbidbz4tskh+3JSTUCzkUz2+W1Xt4g9i++m9k0s2R3yKgrglzqUuakZFiTmP
         6bJLqJG2Vw1emh0jsqbAMh3s7Ar5/cWjkR9JKZcKYNzNf1qcSF3vtI8Q7Eyq70c+vxkP
         FIhLjwkwgycrhzYWRUbd/lRzTaAtqAad0cyzt/gz7S3e3Zbj4jOouhRIqNBZbgf+jbrM
         j/KXGRuc8ruSlGNmLX6rhbeWzsyCl/GYlgMiLCexiPkyJsFqgL83HD/1CZcZelKd2uoq
         miOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100326; x=1694705126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbK6fKvS9Fgoje98ZfydB5ImVNxTq9WKZiMHsHIMJYc=;
        b=eJJyO8eLPKnADq/JR5pKgEz8a9iY01SJzBPCFBhu9OWQczTiXKEwxqVg2iZQIAhg9r
         w2LmhGBllZjEZ3ohH4v/+Nz/BAPBAV0gDH0n/SKQoXvwS5rZ+2GFPS1dQYNUD+uNUuue
         zSOxrdrRLmCB+m5g1LUmFSMxajRPdgvHre+L9dNbXAXaUVwBcdahV4t1cBRMcm6ebTiP
         yBLAXXT0aqgFx/qyEbFL5DbPfqYGESopYkCFzMF0p6DmMncqeaJxWY2zrdzW9a5rTgvM
         KSkcXFYze9HNNaIZ76TN2AIMQeLFFWgtvQ6q2vhqEBtl17cQ1XrGFXBDL0E5T8lZzwxa
         Zl6Q==
X-Gm-Message-State: AOJu0Yy/IeJbarmoMfx8/JJgkWxT0B+50PW90/ZkjT/8MPQIvX2ppAQm
        dD0tdslCJUIyquXPAdXtN0UrZNXRWR7dScXHHsGCUac9PQXS+/dS
X-Google-Smtp-Source: AGHT+IHu6D0PjyoNN/3icMZDTJRryJCp5e4gDUZ/wy83CohE7b2nsJzK7Ge1NIZAUgYV6LutVWZGRWBUmBFmeDVHGrc=
X-Received: by 2002:a05:6902:154d:b0:d72:8a65:394f with SMTP id
 r13-20020a056902154d00b00d728a65394fmr3971430ybu.18.1694094049986; Thu, 07
 Sep 2023 06:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693996662.git.quic_varada@quicinc.com> <543183ecfba929683c1b8d7ff24d75df489ef0cf.1693996662.git.quic_varada@quicinc.com>
In-Reply-To: <543183ecfba929683c1b8d7ff24d75df489ef0cf.1693996662.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 7 Sep 2023 16:40:39 +0300
Message-ID: <CAA8EJprSHCx6TQ=-iEV6L55b69yYKANCJmGSqN+YVSv1dSCAqg@mail.gmail.com>
Subject: Re: [PATCH v1 03/10] clk: qcom: apss-ipq-pll: Fix 'l' value for ipq5332_pll_config
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     ilia.lin@kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_kathirav@quicinc.com, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 7 Sept 2023 at 08:22, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> The earlier 'l' value of 0x3e is for 1.5GHz. Not all SKUs support
> this frequency. Hence set it to 0x2d to get 1.1GHz which is
> supported in all SKUs.
>
> Fixes: c7ef7fbb1ccf ("clk: qcom: apss-ipq-pll: add support for IPQ5332")
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
