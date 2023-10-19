Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBBDCDB483
	for <linux-clk@archiver.kernel.org>; Thu, 19 Oct 2023 14:08:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345961AbjJSOIY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Oct 2023 10:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235416AbjJSOIX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Oct 2023 10:08:23 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01AC5185
        for <linux-clk@vger.kernel.org>; Thu, 19 Oct 2023 07:08:20 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d9a6399cf78so742966276.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Oct 2023 07:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697724500; x=1698329300; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tn/F8o/e5g+CaRAdyAq1gtw+JfJqdGScBADInd6iQVI=;
        b=iQCuOnLdHUvX/uGzWoRrrpS5R+3szQJRR7Og9ReypjB5+d3Fxhi8JAR/kuptzT9gvR
         bSmO5SKB8VP1lYEAEYj19/JqwZKvEy9imYVOok1z181c+hu6cgd6gKCb7iw3GweKmiqA
         HercoOvM+HqBHxJ8PxAcCqUxV7qcSu9LsDX8aYTzImF+V6jp2j/ygySDHQ1aaIRLtxIF
         FjE9FBg+7xzjIFGFqw3Yd/6XHXxsRhWUttD73HTfurz0WzMYrH0kS3BxhafoV0EyBiv2
         uMLDvI+A1ORyoJZjehtc0zldF/oVQRGr8HUv1iP6veUa9TtUeQRJGXGgiUoJ8BeRMd2c
         NTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697724500; x=1698329300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tn/F8o/e5g+CaRAdyAq1gtw+JfJqdGScBADInd6iQVI=;
        b=CEwcX71aWBWYZv4OpOm0+nmYemZUDdgxG/ez6frPX7qO5jnw09xd6i/BM8tJuSjnut
         Ko+Xy+KqQgjalkNaS+Etqgty6esy9lfQ1xZDWF2opveXRX8WbBKvjW/1St6NQ9k/u6ED
         1Nln+gDCVoujr0fVBELhDNXOs6mb8zuUOBabrdoL57so6E0NQMaEAldbjLrAS1Oj/qYc
         2HnnnNgnPye2Y/Ng94iov0KZtuyRQGjgyV5DodGKrhxOWKrkhbwhrj1FYvBqc/A3ADA1
         1SUzJ40qXoTI07u6gD+9uUTkFVXZ6hm+G6Vx+dUaESHmZOpms67a7gp3Qv/eKmfxpQP3
         5rNA==
X-Gm-Message-State: AOJu0Yw2C0Zm68o7cKwMCFk4k0WqzvHGdGzGbAC6JNVDu1Yo3vDo/mKQ
        yQjc1PSp41QSUORR/Qzi3cnTbOZxzHFsfaHw1oqKPA==
X-Google-Smtp-Source: AGHT+IG/mrmUX35BBmoQAp5bc48eTYOn5e1DBnNGvJopYm45PRsEmhY1lpboqPwPq9YQ44ZSsybWD7ZZPsAeM+tOXY0=
X-Received: by 2002:a5b:b0e:0:b0:d9a:d9dd:bef with SMTP id z14-20020a5b0b0e000000b00d9ad9dd0befmr1581625ybp.3.1697724500149;
 Thu, 19 Oct 2023 07:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1697694811.git.quic_varada@quicinc.com> <c7bfa2233ce4bbdc326e8aa1967cc5efd1f89932.1697694811.git.quic_varada@quicinc.com>
In-Reply-To: <c7bfa2233ce4bbdc326e8aa1967cc5efd1f89932.1697694811.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 19 Oct 2023 17:08:08 +0300
Message-ID: <CAA8EJpqfOjGp+FYCxfkFukvZ+bRFytvSFO+nvmMBn6heNpRraA@mail.gmail.com>
Subject: Re: [PATCH v4 6/9] cpufreq: qti: Enable cpufreq for ipq53xx
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        sivaprak@codeaurora.org, quic_kathirav@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 19 Oct 2023 at 11:43, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> IPQ53xx have different OPPs available for the CPU based on
> SoC variant. This can be determined through use of an eFuse
> register present in the silicon.
>
> Added support for ipq53xx on nvmem driver which helps to
> determine OPPs at runtime based on the eFuse register which
> has the CPU frequency limits. opp-supported-hw dt binding
> can be used to indicate the available OPPs for each limit.
>
> nvmem driver also creates the "cpufreq-dt" platform_device after
> passing the version matching data to the OPP framework so that the
> cpufreq-dt handles the actual cpufreq implementation.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
