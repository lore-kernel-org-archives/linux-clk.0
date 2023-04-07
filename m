Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632ABC76196
	for <linux-clk@archiver.kernel.org>; Fri,  7 Apr 2023 21:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjDGVs1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Apr 2023 17:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbjDGVs0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Apr 2023 17:48:26 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4930EC664
        for <linux-clk@vger.kernel.org>; Fri,  7 Apr 2023 14:48:25 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id h11so48945343lfu.8
        for <linux-clk@vger.kernel.org>; Fri, 07 Apr 2023 14:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680904103;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DllG90e1WWVTHQdAKRkXXv+zJvR74w4Quq11ghlPJtY=;
        b=OVyB1bAFGN0vaGLmVCCfIH5/O4EAIz104DNP3AiG1HqDZ6ggD45bD6puMR+66SwJSK
         4ZUAKjMTvJqwjpGxxauYTX3B3Qsy5NOfW3GSp6NCJY1Dbq0SiP8vRE2nv87+iJxdV3Ff
         b4b2Gr4tI95SF2pvloDwpvasMCAXEcUsELAo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680904103;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DllG90e1WWVTHQdAKRkXXv+zJvR74w4Quq11ghlPJtY=;
        b=Nm0080QHw0Vi9r8GiudQpcIM9RynJiq0AwS0ZnT5dEtgkDWx0e3bLxVmwlbljTac4P
         +R0WaW7/sovgKuxQoqtlB0+ohyIR3BzpjJUd3d0GSBRdNjlgoq9G5b7CBAiLALa13eac
         avh/Uy73t+5qISz1xHWM6vHqrjxfwpxSggdQ9CugWJar1bHtOZG1EUlhH53ooRvMrku+
         uoWXifCyGmZdaNB2Nu0L6GC94liEP7Q8k7XFpZpWchX+XF4h5cnMBwXegBdFFs6whZV+
         dSFNwsuYZNMyNZ+c0RPgeoXzSmYm+AQdFJK+qo+6vMbWwOr8eqq7QxcdB0qkGqO6sswi
         /NGg==
X-Gm-Message-State: AAQBX9fVHkZE0QuVcoCZV3O9lmWce2RzTYypN+cbj8CwRroC4351SNv7
        4ei8dN9ApckZAFJRSVyHHZ7uqXBuoR0ZjdxaM3Y18g==
X-Google-Smtp-Source: AKy350Yu9m9x8GYDbA/5kgPKVUoE6uvF5g/lH6PO8SorwlwARoXyVdIMeX0FCOQzbIDqgqm+YxpKrwGoFLvyzeXjW/I=
X-Received: by 2002:ac2:4c14:0:b0:4eb:eaf:aa00 with SMTP id
 t20-20020ac24c14000000b004eb0eafaa00mr1109097lfq.4.1680904103550; Fri, 07 Apr
 2023 14:48:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Apr 2023 14:48:23 -0700
MIME-Version: 1.0
In-Reply-To: <20230407092255.119690-4-quic_mohs@quicinc.com>
References: <20230407092255.119690-1-quic_mohs@quicinc.com> <20230407092255.119690-4-quic_mohs@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 7 Apr 2023 14:48:23 -0700
Message-ID: <CAE-0n539B++ynhR04xEDiszz7u718QGLyN4KukrPE3ya6_m9Zg@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] clk: qcom: lpassaudiocc-sc7280: Add required gdsc
 power domain clks in lpass_cc_sc7280_desc
To:     Mohammad Rafi Shaik <quic_mohs@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, broonie@kernel.org,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        quic_visr@quicinc.com, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Mohammad Rafi Shaik (2023-04-07 02:22:55)
> Add GDSCs in lpass_cc_sc7280_desc struct.
> When qcom,adsp-pil-mode is enabled, GDSCs required to solve
> dependencies in lpass_audiocc probe().
>
> Fixes: 0cbcfbe50cbf ("clk: qcom: lpass: Handle the regmap overlap of lpasscc and lpass_aon")
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
