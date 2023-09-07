Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF3AEC873F
	for <linux-clk@archiver.kernel.org>; Thu,  7 Sep 2023 15:46:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233361AbjIGPqc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Sep 2023 11:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344467AbjIGPdI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Sep 2023 11:33:08 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1D91FDE
        for <linux-clk@vger.kernel.org>; Thu,  7 Sep 2023 08:32:48 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5739965a482so558639eaf.0
        for <linux-clk@vger.kernel.org>; Thu, 07 Sep 2023 08:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694100721; x=1694705521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWjc9Tq24L0z9SehMarme94KIq1a0OWmKWnWsMLtL6w=;
        b=HQLiZXC1eHtCEZwKpEqaVpP9w08cv9t+P/0ZqNlc7W9r3BQCL/XUHY/9viY9YxojB1
         mVX6V3aRbCf8wJWuzxJ/rmZ/pKPQgOsfpcF5S68sQYLlxf0Hhr95d1B1NZs7TmJJOT84
         4iLq75vl99RghWyxM8dKIf75sO3OLVxYieOpvm3sNiEMeARfQbtrFsdNh08ix7vhCruw
         5IgVJ0jDRmfCK/CpI7F9QFM5wPe0O0RvHw2jI0vMa4T0Li5A+smRpAMY8w9RH3fQuTIA
         9xog3ifdyGM8zDiVxqNk6PDq4E+3BEWWmFWt0xsgbb1mq4hemox98w5eESkDYmV1cYLy
         QhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100721; x=1694705521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWjc9Tq24L0z9SehMarme94KIq1a0OWmKWnWsMLtL6w=;
        b=mH2ht3u7rBuYy5d/B8B8lGsP6QYdvlRTG3m9xRxxz09iTRQyh6pKjcwZH7kENpkt2h
         vnfTMMNFN2g82DlWIu/wnOil8z1ZcLhuGkXg6H89qB3RrWMBn/NXvJHVnkVpu8FRAKcz
         oCeiqIB62Cox3el+tdDfcmtS66QpDHvJedFVCIfPINoTiUc4TxJOkd7Fdp2DbZiNWh55
         t9MsoEjmWsbjwj26Mb/RIDV3jK3BPt46sBZMaXsqTJqV7o8C4W+eiyp8iyzxFrwBtjlt
         Q/im5PRtuiSNCRgjk3OwKfcdVDVp5/u5JrDxAGfmwpy7inRZdxbwl4HvR6ydDLB9ur0T
         DTXA==
X-Gm-Message-State: AOJu0Yy9kFj7kplmsqqiLOocnWlThSWr6LAKLAllrLlYhyxUX3J+HEYY
        9R8y8G+Q1ZUQr06a5BFt6ihlE4Rq6hcv7uUuec5NEXQQOA58ThH2qy0=
X-Google-Smtp-Source: AGHT+IEfYqhUFJ1cVabsx1fK7bxKAay+z3MPpC0vnndLwwN0XFbr3Qb0Xl2nmJ3y7ZRnqy/9qAjqB1Ntotany1k2aKs=
X-Received: by 2002:a25:32cd:0:b0:d78:3b67:ef3 with SMTP id
 y196-20020a2532cd000000b00d783b670ef3mr3182735yby.12.1694095033559; Thu, 07
 Sep 2023 06:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693996662.git.quic_varada@quicinc.com> <558c6b70090ea7220bfb0b6e7d81828025018376.1693996662.git.quic_varada@quicinc.com>
In-Reply-To: <558c6b70090ea7220bfb0b6e7d81828025018376.1693996662.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 7 Sep 2023 16:57:02 +0300
Message-ID: <CAA8EJprUgcmqFeNeuFgnRkk=XUr8NjNMMzd0y7sVhOnGUnn2qA@mail.gmail.com>
Subject: Re: [PATCH v1 06/10] cpufreq: qti: Enable cpufreq for ipq53xx
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 7 Sept 2023 at 08:23, Varadarajan Narayanan
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
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c |  1 +
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufr=
eq-dt-platdev.c
> index 02ec58a..f0c45d4 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -178,6 +178,7 @@ static const struct of_device_id blocklist[] __initco=
nst =3D {
>         { .compatible =3D "ti,am625", },
>         { .compatible =3D "ti,am62a7", },
>
> +       { .compatible =3D "qcom,ipq5332", },
>         { .compatible =3D "qcom,ipq8064", },
>         { .compatible =3D "qcom,apq8064", },
>         { .compatible =3D "qcom,msm8974", },
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-=
cpufreq-nvmem.c
> index 84d7033..49d21b0 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -146,6 +146,20 @@ static int qcom_cpufreq_kryo_name_version(struct dev=
ice *cpu_dev,
>                 return PTR_ERR(speedbin);
>
>         switch (msm_id) {
> +       case QCOM_ID_IPQ5332:
> +       case QCOM_ID_IPQ5322:
> +       case QCOM_ID_IPQ5312:
> +       case QCOM_ID_IPQ5302:
> +       case QCOM_ID_IPQ5300:

msm8996 was bad enough. Can we use compat strings instead? Or make
this a default for qcom_cpufreq_kryo_name_version()?

> +               /* Fuse Value    Freq    BIT to set
> +                * ---------------------------------
> +                *   2=E2=80=99b00     No Limit     BIT(0)
> +                *   2=E2=80=99b01     1.5 GHz      BIT(1)
> +                *   2=E2=80=99b10     1.2 Ghz      BIT(2)
> +                *   2=E2=80=99b11     1.0 GHz      BIT(3)
> +                */
> +               drv->versions =3D 1 << (unsigned int)(*speedbin);
> +               break;
>         case QCOM_ID_MSM8996:
>         case QCOM_ID_APQ8096:
>                 drv->versions =3D 1 << (unsigned int)(*speedbin);
> @@ -359,6 +373,7 @@ static const struct of_device_id qcom_cpufreq_match_l=
ist[] __initconst =3D {
>         { .compatible =3D "qcom,apq8096", .data =3D &match_data_kryo },
>         { .compatible =3D "qcom,msm8996", .data =3D &match_data_kryo },
>         { .compatible =3D "qcom,qcs404", .data =3D &match_data_qcs404 },
> +       { .compatible =3D "qcom,ipq5332", .data =3D &match_data_kryo },
>         { .compatible =3D "qcom,ipq8064", .data =3D &match_data_krait },
>         { .compatible =3D "qcom,apq8064", .data =3D &match_data_krait },
>         { .compatible =3D "qcom,msm8974", .data =3D &match_data_krait },
> --
> 2.7.4
>


--=20
With best wishes
Dmitry
