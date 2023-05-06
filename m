Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB645C7EE2A
	for <linux-clk@archiver.kernel.org>; Sat,  6 May 2023 11:08:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232129AbjEFLIN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 6 May 2023 07:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232138AbjEFLIK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 6 May 2023 07:08:10 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C32114680
        for <linux-clk@vger.kernel.org>; Sat,  6 May 2023 04:08:07 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-559debdedb5so41484777b3.0
        for <linux-clk@vger.kernel.org>; Sat, 06 May 2023 04:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683371287; x=1685963287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j5XlcbqFrzQXxIYxdf0VxKIx0ZoUFzqDbvv5tK0E9jE=;
        b=cNdP/pr/9KcytvLHAV2KR7Egci52zCTCKkiPfBelrMkxfVg2Xrji0fuF9zAV7yv3vg
         hs5EOpYp+wSYnwJCPDcDdrTmBGWmO+CHCoMHp4mo6VBaFvPm+y/NSFnT6bXajfjMmtuz
         ojWMmcXun5Fqk94LvGIUcYHfYQRLtXQ2YhVZpXjl9MQmB4w/DAPX0TWFS+tqEs+VIwDQ
         RVGBIjOgPqNOSXkXTNs7ThOqqZv3rPNZjJhrH6weBkHpICKta7n9r15dF/DsuyhmJoUf
         2e+2Uqg53HIDmIXS5+OpDq139GlOVBHCnD+yI1MrIu9gCpsjL57l1AKEN7e5JbFRUk+q
         zNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683371287; x=1685963287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5XlcbqFrzQXxIYxdf0VxKIx0ZoUFzqDbvv5tK0E9jE=;
        b=N0MNzcT2PnT2aeOicyXi7kxmk84GgnG3jRkhbI19cQcS7WOOsAsYoTAF6H71UIOVDu
         WBzGrzFXtLLJeQpAJNoiE4sLWUO87isFTl3D0Xc7KudQGTTh5HbybowiJXjLBfn5ju39
         u86GQ/Tgmw2WgqIgVNbwj1EyG8W+Wv9lQx62ezWVd4nFvIt6F/tJVFB73Gc7iRKW2lpM
         AIWZ1wFOZe8aMFwToxF79YpCauJxc6qAHH2Ii8oHCEV7BXf56377mxQRGRxqJvX5BU+z
         WtmJPxPWehKEoA7sBknEjpNzUhqC2+jGAD4pMsgjZHAT5I2uHk6b9r2uc4oEzq46iD1o
         7ohA==
X-Gm-Message-State: AC+VfDyT+G0KQ8bLlsEAzXO+Ydpadi01rEwQcUoz/NeKCYuHWAqvpXd2
        BblM9tfkiQ7bK0kIO/g82jT6JTIBOFYaG8Jy90IMhg==
X-Google-Smtp-Source: ACHHUZ6iGINkfuXu3mA7YpSLZ0z+S5X733K8fJ48YS7ZTvxkCFk9w0Uq/7dKFQuiu1WU6SIM6RHjU1LUAVNNM2nfp/M=
X-Received: by 2002:a0d:cc09:0:b0:55a:5870:3d47 with SMTP id
 o9-20020a0dcc09000000b0055a58703d47mr4375122ywd.26.1683371286931; Sat, 06 May
 2023 04:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683183860.git.quic_varada@quicinc.com> <8894bf2c44eaf4959c7a1966b66229e6cf5cda96.1683183860.git.quic_varada@quicinc.com>
 <CAA8EJppvj2nzqwdsC+Xct4cJg2-_yPpiGDELjHJG4HyAH3zGMA@mail.gmail.com> <958fec66-2978-1d45-baad-c735fab85108@linaro.org>
In-Reply-To: <958fec66-2978-1d45-baad-c735fab85108@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 6 May 2023 14:07:56 +0300
Message-ID: <CAA8EJpqEk=dQkChFh3HaTuTpO3wsebS8_p4RH-1_JrWoS_HbeQ@mail.gmail.com>
Subject: Re: [PATCH v10 8/9] arm64: dts: qcom: ipq9574: Add LDO regulator node
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        gregkh@linuxfoundation.org, mturquette@baylibre.com,
        sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 5 May 2023 at 22:26, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 5.05.2023 11:29, Dmitry Baryshkov wrote:
> > On Fri, 5 May 2023 at 11:23, Varadarajan Narayanan
> > <quic_varada@quicinc.com> wrote:
> >>
> >> Add LDO regulator node
> >
> > As this LDO is provided by the PMIC, it would be nice to know why it
> > is modelled as an always-on regulator instead of the proper PMIC
> > regulator. Up to now we were doing this only for the outstanding power
> > rails like CX/MX or EBI.
> (which we then stopped registering as regulators and started
> to manage through rpm(h)pd drivers and the genpd framework)

I mean having regulator-fixed s4a on sm8250 in addition to the CX
genpd, because some of the parts really expect to have a regulator.
But anyway, we are getting away from the subj. Let's wait for the
answer from Varadarajan.

>
> Konrad
> >
> >>
> >> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> >> ---
> >>  Changes in v10:
> >>         - Add LDO regulator node
> >> ---
> >>  arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> >> index bdc1434..1f5d14f 100644
> >> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> >> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> >> @@ -60,6 +60,13 @@
> >>                         regulator-min-microvolt = <725000>;
> >>                         regulator-max-microvolt = <1075000>;
> >>                 };
> >> +
> >> +               mp5496_l2: l2 {
> >> +                       regulator-min-microvolt = <1800000>;
> >> +                       regulator-max-microvolt = <1800000>;
> >> +                       regulator-boot-on;
> >> +                       regulator-always-on;
> >> +               };
> >>         };
> >>  };

-- 
With best wishes
Dmitry
