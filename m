Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407F9EC8742
	for <linux-clk@archiver.kernel.org>; Thu,  7 Sep 2023 15:46:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233615AbjIGPqj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Sep 2023 11:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240047AbjIGP0G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Sep 2023 11:26:06 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA0C6199A
        for <linux-clk@vger.kernel.org>; Thu,  7 Sep 2023 08:25:38 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so810158a12.1
        for <linux-clk@vger.kernel.org>; Thu, 07 Sep 2023 08:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694100329; x=1694705129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJnHQZI/YTk0Ikc8JOTRLoRDMwR3H4tHaJzcO7hfWr4=;
        b=jzfYMr5y6Osmb7WqhCNnblRkd0rzR0Bu6vfocdUKJLzTt4argqoY2k/isVZtovZBoK
         8r9cHLhKUMC7/v3DkQ6OKiNEl+3XXijqMbB/jU1QPAZSspZ9RwFaCgAgBa8NCvHxPzaM
         eKjtX9x/u8r5gDWp7TuriVhZheYOj62FQYs5Ed0gdExQtW7QOlko+cG/7Sjxf9Q9GPZp
         eKoHc3CYIfebJv619xdhYbb12qEVmZapsAnY7ZlphDkGr/dAVms1n5W71kIYN23iMExJ
         XyLqtvd3pXkfPYWGRXuDMCg7aCZ0nh20xZfRtn/A7v+6+KHHjjDoXCycHuDy+8MehB4Z
         p2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100329; x=1694705129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJnHQZI/YTk0Ikc8JOTRLoRDMwR3H4tHaJzcO7hfWr4=;
        b=SM+Y0mpStQpfrriMoizOo591g8dDSmBDSiI6WktMPOp2Bm6b0qOiiodbAvmmxfC4J7
         fdsm5kRYmQQ53IDwuyEJ7xAo5za54GoVBHQ2iAtq05EAhiVryWj1F6ikhBIUWv7S98YB
         GECzCnc7EJ/cDqShBkvANkwEFYv/U3u/Iuu4zxx1dCQ9ZDsJVygqZX53evaav4EQpNuQ
         pJOz8r6syn5UaK6pNhNPF8mx2VgURqcGCZruWauBs+NtPiWPQ8t1J3nEMGqTq1OmtVRI
         m8mEVsCm+dzVci8YsERTkqApv5Rro/tuMn1OdVd6Hj11lhDsOE+aPwKUXJ9JQadObVPl
         19WA==
X-Gm-Message-State: AOJu0YxqUn11MmkMu+gq7aNUhClSEDI21aZzvAM5iSeM3ytkj663yNDl
        4ILvphgQvyPMr+vkG5Tm4F9i0jSS2utM6V3Dc1mNba9aTAMgKFOg
X-Google-Smtp-Source: AGHT+IFDVeL1UmCZY05Tqcq76iXML1JvWmurH2xxHKxUGlpH6gpEztrZTplGKLfqwM2mDGTIO4vf6OxfxN/uzjAj4w8=
X-Received: by 2002:a25:da84:0:b0:d80:1441:9010 with SMTP id
 n126-20020a25da84000000b00d8014419010mr109512ybf.26.1694096587639; Thu, 07
 Sep 2023 07:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693996662.git.quic_varada@quicinc.com> <f7d49397507e10423b87910e88c52d5a1681f128.1693996662.git.quic_varada@quicinc.com>
In-Reply-To: <f7d49397507e10423b87910e88c52d5a1681f128.1693996662.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 7 Sep 2023 17:22:56 +0300
Message-ID: <CAA8EJpqox=Ji3cf5iBgL_QvqNZFmikiNu7bBscBYi4AsCdt9CQ@mail.gmail.com>
Subject: Re: [PATCH v1 09/10] cpufreq: qti: Introduce cpufreq for ipq95xx
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     ilia.lin@kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_kathirav@quicinc.com, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Praveenkumar I <ipkumar@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 7 Sept 2023 at 08:24, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> IPQ95xx SoCs have different OPPs available for the CPU based on
> the SoC variant. This can be determined from an eFuse register
> present in the silicon.
>
> Added support for ipq95xx on nvmem driver which helps to
> determine OPPs at runtime based on the eFuse register which
> has the CPU frequency limits. opp-supported-hw dt binding
> can be used to indicate the available OPPs for each limit.
>
> Signed-off-by: Praveenkumar I <ipkumar@codeaurora.org>
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c |  1 +
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 20 ++++++++++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufr=
eq-dt-platdev.c
> index f0c45d4..4ab29c0 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -180,6 +180,7 @@ static const struct of_device_id blocklist[] __initco=
nst =3D {
>
>         { .compatible =3D "qcom,ipq5332", },
>         { .compatible =3D "qcom,ipq8064", },
> +       { .compatible =3D "qcom,ipq9574", },
>         { .compatible =3D "qcom,apq8064", },
>         { .compatible =3D "qcom,msm8974", },
>         { .compatible =3D "qcom,msm8960", },
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-=
cpufreq-nvmem.c
> index 49d21b0..de70225 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -168,6 +168,25 @@ static int qcom_cpufreq_kryo_name_version(struct dev=
ice *cpu_dev,
>         case QCOM_ID_APQ8096SG:
>                 drv->versions =3D 1 << ((unsigned int)(*speedbin) + 4);
>                 break;
> +       case QCOM_ID_IPQ9514:
> +       case QCOM_ID_IPQ9550:
> +       case QCOM_ID_IPQ9554:
> +       case QCOM_ID_IPQ9570:
> +       case QCOM_ID_IPQ9574:
> +               /* Fuse Value    Freq    BIT to set
> +                * ---------------------------------
> +                *   2=E2=80=99b00     No Limit     BIT(0)
> +                *   2=E2=80=99b10     1.8 GHz      BIT(1)
> +                *   2=E2=80=99b01     1.5 Ghz      BIT(2)
> +                *   2=E2=80=99b11     1.2 GHz      BIT(3)
> +                */
> +               if ((unsigned int)(*speedbin) =3D=3D 2)
> +                       drv->versions =3D BIT(1);
> +               else if ((unsigned int)(*speedbin) =3D=3D 1)
> +                       drv->versions =3D BIT(2);
> +               else
> +                       drv->versions =3D 1 << (unsigned int)(*speedbin);

If you change the order of speedbins 1 and 2 in DT, you can use 1 <<
speedbin for all the kinds,

> +               break;
>         default:
>                 BUG();
>                 break;
> @@ -375,6 +394,7 @@ static const struct of_device_id qcom_cpufreq_match_l=
ist[] __initconst =3D {
>         { .compatible =3D "qcom,qcs404", .data =3D &match_data_qcs404 },
>         { .compatible =3D "qcom,ipq5332", .data =3D &match_data_kryo },
>         { .compatible =3D "qcom,ipq8064", .data =3D &match_data_krait },
> +       { .compatible =3D "qcom,ipq9574", .data =3D &match_data_kryo },
>         { .compatible =3D "qcom,apq8064", .data =3D &match_data_krait },
>         { .compatible =3D "qcom,msm8974", .data =3D &match_data_krait },
>         { .compatible =3D "qcom,msm8960", .data =3D &match_data_krait },
> --
> 2.7.4
>


--=20
With best wishes
Dmitry
