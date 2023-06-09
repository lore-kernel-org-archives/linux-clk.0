Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1CBC7EE29
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jun 2023 12:29:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240535AbjFIM3C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jun 2023 08:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240568AbjFIM2v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jun 2023 08:28:51 -0400
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCC23AB0
        for <linux-clk@vger.kernel.org>; Fri,  9 Jun 2023 05:28:08 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-bacfa9fa329so1745110276.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Jun 2023 05:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686313528; x=1688905528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=smGNflJ7bjmXBjjEtuvZGOYN45xQ1O6Q8NPK2CFlfvE=;
        b=UjUKL/p0Zv0Fjvpzhs8BqsA26pl29Ryk131TCJ1q/PMegwFwbd+H9yfB8f5qNCbv4d
         1/+ReYYrOsEfVQhsbEAW0XvFcC66rcWa14t2NUhoiP53HmP9WLfe/Rp0RbBsI3wyqvxW
         4fK7byK2S3825cKASqE0Qx8WzVWuQsLOBa5xLOJdCXgtXQ6gJMzBmZZWIqRuTs9uq34P
         oERTqr6ZXPnVKq9d4RH4oqYlAUnBhxtd0LBiRzbSBHfz6VJOZvbMx8AegnuX+X7DLnZi
         0dMzt05LkRdB3Zs527M6EWuNbKoGi30eWmzReMQDoJ5iirN2WoAOGLCsWRZO/4jrcSgt
         +rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686313528; x=1688905528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smGNflJ7bjmXBjjEtuvZGOYN45xQ1O6Q8NPK2CFlfvE=;
        b=aje8JmnKd66TDpCMttu893uExWcDN7Va6ajkDZJNNQcgFlcOJ+ZQCiWeN5HqDDaer2
         ZeLwyWlKdTZxxAFJOo219KOOp7KUCSRbAfDiytM0Txn7PycrGx93ZyjvstVSB09S2Z8N
         FhJDMvGSRhQa+NX9yV7/A0BO9S2fPaLDagAfwJDVIbpGouRMJ9jgwD3Wf2X2kqLjBdsB
         6r4IlFP72Mnv6W4WJ+8GpWO0wRIdpy7ZvEuXNOrK8xo61rjarph8J/+cQzOkYtDunvle
         CDGT4h8LuSzT7an1PhYOGXQulzyTxcs48MCoJpwkqk8VFjEmORzdtNblg1KNMraktl2N
         QYgg==
X-Gm-Message-State: AC+VfDyizBhzSztw3eJiHGiJvLX7UXdfuYKholD3NUH0LkUlD3Xl8jiN
        7wAh511nmLvjXIf41SYUGUYfiPdiE+GftGqRsBidjg==
X-Google-Smtp-Source: ACHHUZ77rBUMB96NN2jzxPTCVZ++T/qAsc1W/ugmaXuhcy0WBFOHqot0Olv3GSCeqyqa6nKWwOHh8NDE4YnEMNbnUIU=
X-Received: by 2002:a0d:c841:0:b0:568:8e96:7008 with SMTP id
 k62-20020a0dc841000000b005688e967008mr1081432ywd.0.1686313528385; Fri, 09 Jun
 2023 05:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230525172142.9039-1-quic_jkona@quicinc.com> <20230525172142.9039-4-quic_jkona@quicinc.com>
 <6e1d098d-03b9-aa63-a0bf-6cf748a0db0d@linaro.org> <7074f718-a3d5-8a03-3830-77a5a0b15500@linaro.org>
 <df7ab6f7-6c5e-9a7d-8d9b-09ff32da34d6@quicinc.com> <c60bb4d9-1b53-6c60-8b9d-13069bdff882@linaro.org>
 <1a6d46e4-7ec4-262c-dc3b-fc9c988f979e@quicinc.com>
In-Reply-To: <1a6d46e4-7ec4-262c-dc3b-fc9c988f979e@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 9 Jun 2023 15:25:17 +0300
Message-ID: <CAA8EJprx6=QztOHi_18uqcGK9WnhkQJ_WP9TyKrsOT=WgKdRaw@mail.gmail.com>
Subject: Re: [PATCH V2 3/6] clk: qcom: clk-alpha-pll: Remove explicit CAL_L
 configuration for EVO PLL
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
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 9 Jun 2023 at 14:50, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
> Hi Dmitry,
>
> Thanks for your review!
>
> On 6/1/2023 8:13 PM, Dmitry Baryshkov wrote:
> > On 01/06/2023 17:33, Jagadeesh Kona wrote:
> >> Hi Dmitry, Konrad,
> >>
> >> On 5/26/2023 9:23 PM, Dmitry Baryshkov wrote:
> >>> On 26/05/2023 12:33, Konrad Dybcio wrote:
> >>>>
> >>>>
> >>>> On 25.05.2023 19:21, Jagadeesh Kona wrote:
> >>>>> In lucid evo pll, the CAL_L field is part of L value register
> >>>>> itself, and
> >>>>> the l value configuration passed from clock controller driver includes
> >>>>> CAL_L and L values as well. Hence remove explicit configuration of
> >>>>> CAL_L
> >>>>> for evo pll.
> >>>>>
> >>>>> Fixes: 260e36606a03 ("clk: qcom: clk-alpha-pll: add Lucid EVO PLL
> >>>>> configuration interfaces")
> >>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >>>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> >>>>> ---
> >>>> Oh that isn't obvious at first sight, nice find!
> >>>>
> >>>> I'd suggest a different solution though:
> >>>>
> >>>> #define LUCID_EVO_PLL_L_LVAL    GENMASK(..
> >>>> #define LUCID_EVO_PLL_L_CAL_L    GENMASK(..
> >>>>
> >>>> lval = FIELD_PREP(LUCID_EVO_PLL_L_LVAL, config->l) |
> >>>>         FIELD_PREP(LUCID_EVO_PLL_L_CAL_L, config->cal_l);
> >>>>
> >>>> This would make the separation between the two parts more explicit
> >>>>
> >>>> however
> >>>>
> >>>> config->l would then represent the L value and not the end value
> >>>> written to the L register
> >>>
> >>> Yes. I think there should be separate config->l and config->cal_l
> >>> values (and probably ringosc_cal_l, basing on the comment in the
> >>> source).
> >>> Thanks for your suggestions. In all recent chipsets, L & CAL_L fields
> >> are encapsulated in the same register, so we feel it is better to
> >> directly pass the combined configuration value in config->l itself and
> >> program it directly into register without any additional handling
> >> required in pll driver code.
> >
> > My feeling is that it is better to split it, since these are the
> > different fields. The value .l = 0x4444003e doesn't mean anything per se.
> >
> > Three values are much more meaningful:
> > .l = 0x3e,
> > .cal_l = 0x44,
> > .ringosc_cal_l = 0x44,
> >
> > Not to mention that this way you don't have to touch pll configuration
> > for the existing Lucid EVO PLL. Not to mention that for the Lucid ole
> > PLLs the cal_l and ringosc_cal_l values seem to be static (0x44), so
> > there is no need to put them to the variable data.
> >
>
> Sure, will keep the existing code as is and will remove this patch in
> the next series.
>
> >>
> >> Also the evo pll code is currently reused for both lucid evo and ole
> >> pll's. Lucid ole PLL has an additional RINGOSC_CAL_L field along with
> >> L, CAL_L fields in the same L register. By passing combined
> >> configuration value in config->l itself, we feel we can avoid all the
> >> additional handling required in PLL code.
> >>
> >>> Just a question: is camcc-sm8550 using the same PLL type or is it
> >>> some kind of subtype of lucid_evo PLL?
> >>>
> >> No, it is not the same lucid evo PLL. It uses lucid ole PLL.
> >
> > Then please don't reuse the clk_lucid_evo_pll_configure() call.
> > You can add a new one, which will handle L/CAL_L/RINGOSC_CAL_L differences.
> >
>
> The only difference between evo and ole pll configure is extra
> RINGOSC_CAL_L programming needed only for ole pll. We can achieve the
> same with clk_lucid_evo_pll_configure() itself by directly including
> RINGOSC_CAL_L field in L configuration for OLE PLL's.

Please don't, that's all I can say. Those are different fields. By
looking at the config->l one can calculate PLL rate. If you overload
the config->l with CAL_L and RINGOSC_CAL_L, the purpose of this field
is gone.

As the CAL_L and RINGOSC_CAL_L fields are static, just move them to
the clk_lucid_ole_pll_configure().

-- 
With best wishes
Dmitry
