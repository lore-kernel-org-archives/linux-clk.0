Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B90FEB64DA
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 12:15:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236076AbjFNMPu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 08:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235509AbjFNMPt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 08:15:49 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF26E19AC
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 05:15:47 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-bb2ffa1e235so534460276.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 05:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686744947; x=1689336947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=55/nVUjAe3kftXKJEUpN7nG2cfw0uKndOnoUPQSV6Gw=;
        b=VyuXxjV076FsT93Sunqcst/aAc+DFYWlyu/IMsraar/EkbmiC6v+LZ3/F+TGTmqw5x
         ZwEDkC6qEUzri9juUGjpFIK4n7cHOYTZjz4/iqr/eSV4Mqn/lQIgG0lYBj0VAMBsBvGb
         U6y1UpgDlLXZQkzFkF081qoIr+ktd0GjF8A1wYpqqmnuJuFY/paV+FXkx8a323qgYxNm
         JLI4TRszNXqkNer3sEiv5nIPmM5MCqNC05nlQW4KJaFE4MSKR0QB+4up8Y8eg0gmHgmI
         N2Miq4X4kvGhthFClR0LHk6xx6ljchVHIb6Xy/++1TjcNvCAD7JbtyC/0OUMB6z8wPfV
         zlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686744947; x=1689336947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55/nVUjAe3kftXKJEUpN7nG2cfw0uKndOnoUPQSV6Gw=;
        b=IbbyJUE8eiyKx0vVAfzRgX81B4zVp8a2kjV6xRtaUS9ktBfCocr+a6K6cj8fdUoE9t
         xE5MJrwmpc/40C/eBh0PUeXXkarc9/XAi4NPPcAVumeB2SuiXok3XNqPpJF7yYkErNcT
         JWl9Mf9yOxLwA2Uzkplr16dlV0JyB2jkjorOjMUb05Yk6PkfFPNQPQS4GbttA3R8XO/E
         MqOvy/1gFnD7dm5/MTMtzRsR8VGz3904WzjmZwqwTkuYZ6sdvDFL8FgmkuZxF/cExAIC
         dMHZuHjfLTDzxzVlkLSIrsfjpUwB9+4tBZvdYE+oukpzKsFDe/tNwmykWmDP5aK6wulG
         NHaQ==
X-Gm-Message-State: AC+VfDxiNxE0gP4yHsSI+TWL9QlqHH938v2qYHcmhBGUknraDnnv64IT
        oL40SqPFT+SFZ+1AxyhjCYkSU9P362+oHvvoeK+4yA==
X-Google-Smtp-Source: ACHHUZ7uBPqKPm97WjovXTHOVSFF4sbT9v4QmyWMXZhio5KMprW1Ik1o/gsrgR0jbFtxLEartKsgvGUD8Y2pd1SiSr0=
X-Received: by 2002:a25:6911:0:b0:bc7:afaf:539b with SMTP id
 e17-20020a256911000000b00bc7afaf539bmr1634780ybc.43.1686744947043; Wed, 14
 Jun 2023 05:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230609115058.9059-1-quic_jkona@quicinc.com> <20230609115058.9059-5-quic_jkona@quicinc.com>
 <8d1ead23-8361-7943-baba-baf20d16cbe5@linaro.org> <a3652f67-3e48-db33-1dd2-c17abdbdae41@quicinc.com>
In-Reply-To: <a3652f67-3e48-db33-1dd2-c17abdbdae41@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 14 Jun 2023 15:15:36 +0300
Message-ID: <CAA8EJpqjAkdnU+WXoPJs2m4OSZQe10D=Y8nUAofEoEfV139VjA@mail.gmail.com>
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: sm8550: Add camera clock controller
To:     Jagadeesh Kona <quic_jkona@quicinc.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 14 Jun 2023 at 14:56, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
>
>
> On 6/9/2023 6:22 PM, Konrad Dybcio wrote:
> >
> >
> > On 9.06.2023 13:50, Jagadeesh Kona wrote:
> >> Add device node for camera clock controller on Qualcomm
> >> SM8550 platform.
> >>
> >> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> >> ---
> >> Changes since V3:
> >>   - No changes
> >> Changes since V2:
> >>   - No changes
> >> Changes since V1:
> >>   - Padded non-zero address part to 8 hex digits
> >>
> >>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 15 +++++++++++++++
> >>   1 file changed, 15 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> >> index 75cd374943eb..4d2d610fc66a 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> >> @@ -5,6 +5,7 @@
> >>
> >>   #include <dt-bindings/clock/qcom,rpmh.h>
> >>   #include <dt-bindings/clock/qcom,sm8450-videocc.h>
> >> +#include <dt-bindings/clock/qcom,sm8550-camcc.h>
> >>   #include <dt-bindings/clock/qcom,sm8550-gcc.h>
> >>   #include <dt-bindings/clock/qcom,sm8550-gpucc.h>
> >>   #include <dt-bindings/clock/qcom,sm8550-tcsr.h>
> >> @@ -2419,6 +2420,20 @@ videocc: clock-controller@aaf0000 {
> >>                      #power-domain-cells = <1>;
> >>              };
> >>
> >> +            camcc: clock-controller@ade0000 {
> >> +                    compatible = "qcom,sm8550-camcc";
> >> +                    reg = <0 0x0ade0000 0 0x20000>;
> >> +                    clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> >> +                             <&bi_tcxo_div2>,
> >> +                             <&bi_tcxo_ao_div2>,
> >> +                             <&sleep_clk>;
> >> +                    power-domains = <&rpmhpd SM8550_MMCX>;
> > I see that both MMCX ("mmcx.lvl") and MXC ("mxc.lvl") (and MX, FWIW)
> > are consumed on msm-5.15, with the latter one powering camcc PLLs..
> >
> > How are they related? Is that resolved internally or does it need
> > manual intervention?
> >
> > Konrad
>
> These are just different voltage rails, camcc clocks are powered by MMCX
> rail and camcc pll's are powered by MXC rail. Consumer drivers need to
> take care of voting on these rails properly based on the frequency of
> clocks requested.

Which rail powers registers of the camcc? Which rail is required to
read PLL registers?

>
> Thanks,
> Jagadeesh
>
> >> +                    required-opps = <&rpmhpd_opp_low_svs>;
> >> +                    #clock-cells = <1>;
> >> +                    #reset-cells = <1>;
> >> +                    #power-domain-cells = <1>;
> >> +            };
> >> +
> >>              mdss: display-subsystem@ae00000 {
> >>                      compatible = "qcom,sm8550-mdss";
> >>                      reg = <0 0x0ae00000 0 0x1000>;



-- 
With best wishes
Dmitry
