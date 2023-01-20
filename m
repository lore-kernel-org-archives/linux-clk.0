Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69E5C38159
	for <linux-clk@archiver.kernel.org>; Fri, 20 Jan 2023 22:23:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjATWXA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Jan 2023 17:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbjATWW6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Jan 2023 17:22:58 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ACFC881F6
        for <linux-clk@vger.kernel.org>; Fri, 20 Jan 2023 14:22:55 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id ss4so17344212ejb.11
        for <linux-clk@vger.kernel.org>; Fri, 20 Jan 2023 14:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u40lzikLYg8795MWGyZBi7bwhQii+L33u/S3JKTaugk=;
        b=ESgagTDuK8jSiPbu+Ai9FCHEOTYjWomQsYOXTTLU2J5X4V4d8qZp41FsOGZV8C12O+
         S8fbxFvBN8SylEl8SIGj1wfw4JU/pVcmPwgxNlGQU664xNabbZpF6hX0obOGn7jhOApB
         aA3ddyVVZYiJMwr23CSfTu+FLbGjol37zU4SA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u40lzikLYg8795MWGyZBi7bwhQii+L33u/S3JKTaugk=;
        b=GaZUHtKXUCCnq3fAZHVLJVoMhf7T2MAVF/7Se/iTMAVxZlnGYJuGPoua7JnPzLWSv4
         OrE1Es9xzF3AMU6epvEA1Aa4F4SG8n8D8ioN4/oeSJRuxDGydlZGDkusL1c6AZb7LCa0
         tnx2k0ns9BLUlkKMGil5BnEj4ZpBeax28Ob6ULayn0KhBNtYTPDE8SNUgB4fKMYX5VL2
         rj/kwaYfcD/zA4YTf7m/36gcRYwuRoAXAte6IIluSv+G+28V9yIfRCJOgZrOsrsIHpXP
         5Hvw/NgHjKVRCa+PlvD8UDNSD0g+5FJ7oeepa/AYDx6PBN4xPL7zwiy2oRtmS0AQyVP5
         aFYA==
X-Gm-Message-State: AFqh2kr2euGtFIMukIBeUHIXyrlZ+Lpuce7OH/mpVddknM3c4K+i/8tF
        X9pjFFe/OAqihyXpNcSjafejAxWAGIwU34kxX2OEtg==
X-Google-Smtp-Source: AMrXdXvi+q4N11ckSl3ko5OuysgYr0HNnL4+xkrwtRQS+XGLTRH4A3QSYJ1uluQHlog8S2oM6XeSb+378hY+Bqe5Hmw=
X-Received: by 2002:a17:906:ae56:b0:86c:fe1:b97f with SMTP id
 lf22-20020a170906ae5600b0086c0fe1b97fmr2246086ejb.388.1674253373621; Fri, 20
 Jan 2023 14:22:53 -0800 (PST)
MIME-Version: 1.0
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
 <CAPnjgZ3MQ4E_3n_Z881QsdO-zELPkLaCm0cOFwz6Fds+u73OWg@mail.gmail.com> <4f63a3e0-daeb-5b6a-f998-681502dd7abf@linaro.org>
In-Reply-To: <4f63a3e0-daeb-5b6a-f998-681502dd7abf@linaro.org>
From:   Simon Glass <sjg@chromium.org>
Date:   Fri, 20 Jan 2023 15:22:42 -0700
Message-ID: <CAPnjgZ1Cw51q=nHrqv5YOr4SFtZRWhgv_X=mSJ4vgAT9dJjvuQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] clk: qcom: msm8996: add support for the CBF clock
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Dmitry,

On Fri, 20 Jan 2023 at 15:18, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 20/01/2023 17:08, Simon Glass wrote:
> > Hi Dmitry,
> >
> > On Thu, 19 Jan 2023 at 23:14, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> On MSM8996 two CPU clusters are interconnected using the Core Bus
> >> Fabric (CBF). In order for the CPU clusters to function properly, it
> >> should be clocked following the core's frequencies to provide adequate
> >> bandwidth. On the other hand the CBF's clock rate can be used by other
> >> drivers (e.g. by the pending SPDM driver to provide input on the CPU
> >> performance).
> >>
> >> Thus register CBF as a clock (required for CPU to boot) and add a tiny
> >> interconnect layer on top of it to let cpufreq/opp scale the CBF clock.
> >>
> >> Dependencies: [1]
> >>
> >> [1] https://lore.kernel.org/linux-arm-msm/20230111191453.2509468-1-dmitry.baryshkov@linaro.org/
> >>
> >> Changes since v2:
> >> - Added interconnect-related bindings
> >> - Switched CPU and CBF clocks to RPM_SMD_XO_A_CLK_SRC
> >>
> >> Changes since v1:
> >> - Relicensed schema to GPL-2.0 + BSD-2-Clause (Krzysztof)
> >> - Changed clock driver to use parent_hws (Konrad)
> >> - Fixed indentation in CBF clock driver (Konrad)
> >> - Changed MODULE_LICENSE of CBF clock driver to GPL from GPL-v2
> >> - Switched CBF to use RPM_SMD_XO_CLK_SRC as one of the parents
> >> - Enabled RPM_SMD_XO_CLK_SRC on msm8996 platform and switch to it from
> >>    RPM_SMD_BB_CLK1 clock
> >>
> >> Dmitry Baryshkov (8):
> >>    dt-bindings: clock: qcom,msm8996-cbf: Describe the MSM8996 CBF clock
> >>      controller
> >>    dt-bindints: interconnect/msm8996-cbf: add defines to be used by CBF
> >>    clk: qcom: add msm8996 Core Bus Framework (CBF) support
> >>    clk: qcom: cbf-msm8996: scale CBF clock according to the CPUfreq
> >>    clk: qcom: smd-rpm: provide RPM_SMD_XO_CLK_SRC on MSM8996 platform
> >>    arm64: qcom: dts: msm8996 switch from RPM_SMD_BB_CLK1 to
> >>      RPM_SMD_XO_CLK_SRC
> >>    arm64: dts: qcom: msm8996: add CBF device entry
> >>    arm64: dts: qcom: msm8996: scale CBF clock according to the CPUfreq
> >>
> >>   .../bindings/clock/qcom,msm8996-cbf.yaml      |  53 ++
> >>   arch/arm64/boot/dts/qcom/msm8996.dtsi         |  72 ++-
> >>   drivers/clk/qcom/Makefile                     |   2 +-
> >>   drivers/clk/qcom/clk-cbf-8996.c               | 458 ++++++++++++++++++
> >>   drivers/clk/qcom/clk-smd-rpm.c                |   2 +
> >>   .../interconnect/qcom,msm8996-cbf.h           |  12 +
> >>   6 files changed, 591 insertions(+), 8 deletions(-)
> >>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
> >>   create mode 100644 drivers/clk/qcom/clk-cbf-8996.c
> >>   create mode 100644 include/dt-bindings/interconnect/qcom,msm8996-cbf.h
> >>
> >> --
> >> 2.39.0
> >>
> >
> > Could you please tell me which dev board this is targeting and where I
> > can get one?
>
> This is targeting db820c, which is available from arrow.com. Note, this
> patchset is related only msm8996 aka Snapdragon 820, it has limited
> applicability to msm8996-pro and is of no concern to most of other chipsets.

Thanks!

>
> > Also could you please point me to the SoC documentation?
>
> https://developer.qualcomm.com/hardware/apq-8096sg/tools

Which doc has the register descriptions for I2C, etc.? I am not seeing it.

Regards,
Simon
