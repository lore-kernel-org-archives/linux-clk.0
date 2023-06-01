Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3397C7EE23
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jun 2023 08:42:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbjFAImv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jun 2023 04:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbjFAImu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2023 04:42:50 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD3DE7
        for <linux-clk@vger.kernel.org>; Thu,  1 Jun 2023 01:42:46 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-3f6ac005824so4889351cf.2
        for <linux-clk@vger.kernel.org>; Thu, 01 Jun 2023 01:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20221208.gappssmtp.com; s=20221208; t=1685608965; x=1688200965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOHClv3EmZ5BC3wC17xcl4hTpc6sk/oBTzMD5jV9A1U=;
        b=T+fEJ8MlR4KHrrWHZaVkuXopdtCLepCVfBAECMwZjmqdNEwNC6Bgag4lvkdnJttjqG
         kvPSAHJclDqCmk2FjFHQ8uyCRrJL2PaHeluGbzlQRi2NqgfZZVRdL0GQ0LwzKQ3jHmnZ
         v/AFlGwYnGklHBhYx7Fn/2CeFAkzTYucPr/j3zZXXc3msN9KyfKR3n1sZN09ALFhkdW8
         dVL8TVf7xu9Nohbt/DNVjnHEaW1Ys4IYv5QQBOnhZZBb/KSkKorVUDMf6CjnuKulVZvP
         cF7QiDngi14DRKbYW9qE4Ls9dcr33RkZHy8U8iT+bt0YF+2buWVR7Vqv3UeL86eGGN3M
         B2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685608965; x=1688200965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOHClv3EmZ5BC3wC17xcl4hTpc6sk/oBTzMD5jV9A1U=;
        b=lZZhOXBI6UfhvNezVMLojmJmbVMiTA+Nq3Rd5T04+OvTINVFMmnQY79o7hqObUqmLA
         Wqz2KTDO+ELw1E5ka9939hCrVIyHf/SPHWKRhnHFYyKdH9O2JsLXBsxXePmyMKSVwEV6
         Eulxudb6QPvHcKXXNVeITVcj8ezzMb16rWwjH1eb/RsSv6/SJOc7pps6QRLLMeSJQ6Fr
         CCHL5uJTpd0KmLjX7aa1Nbhb3dd5SEGb10099TlpExHr9wr9wXO74D56c/yUZ984x6Q3
         bRBJxvqyxH9hrNIyQ38jdqI9UG4yoVEkQCbxGNXPQ5+/32c/egchG8BQBAxMk9JBCBr7
         GjxA==
X-Gm-Message-State: AC+VfDx19786OGeyC0+lRJFNFOHiubzoZqyhJoFoI+08M6hWjXGndRL5
        rZOfD+jwyDwg51InHqBUlzm1liAf7BS1a01RBMYzIA==
X-Google-Smtp-Source: ACHHUZ64B9aPj3MnaxAoV1VqJcmNXpqutdESG4B/ynheLTITdb7rBWLgFOJzuXb75zVf3DoZRlJQepZrwBTnxNF+Mtc=
X-Received: by 2002:a05:622a:58a:b0:3f6:b151:7db1 with SMTP id
 c10-20020a05622a058a00b003f6b1517db1mr9299207qtb.62.1685608965598; Thu, 01
 Jun 2023 01:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230531-topic-8998_mmssclk-v1-0-2b5a8fc90991@linaro.org> <20230531-topic-8998_mmssclk-v1-1-2b5a8fc90991@linaro.org>
In-Reply-To: <20230531-topic-8998_mmssclk-v1-1-2b5a8fc90991@linaro.org>
From:   "Bryan O'Donoghue" <pure.logic@nexus-software.ie>
Date:   Thu, 1 Jun 2023 10:42:33 +0200
Message-ID: <CAJB8c076FOXDzCzYWmzfm_PF6UieYx-XMwAqUBHTc+UubjYu6g@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: msm8998: Properly describe MMSS SMMU
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, May 31, 2023 at 11:01=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linar=
o.org> wrote:
>
> The MMSS SMMU has been abusingly consuming the exposed RPM interconnect
> clock and not describing the power domain it needs. Put an end to that.
>
> Fixes: 05ce21b54423 ("arm64: dts: qcom: msm8998: Configure the multimedia=
 subsystem iommu")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/=
qcom/msm8998.dtsi
> index f0e943ff0046..a4016085b750 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -2737,10 +2737,10 @@ mmss_smmu: iommu@cd00000 {
>
>                         clocks =3D <&mmcc MNOC_AHB_CLK>,
>                                  <&mmcc BIMC_SMMU_AHB_CLK>,
> -                                <&rpmcc RPM_SMD_MMAXI_CLK>,
>                                  <&mmcc BIMC_SMMU_AXI_CLK>;
> -                       clock-names =3D "iface-mm", "iface-smmu",
> -                                     "bus-mm", "bus-smmu";
> +                       clock-names =3D "iface-mm",
> +                                     "iface-smmu",
> +                                     "bus-smmu";
>
>                         #global-interrupts =3D <0>;
>                         interrupts =3D
> @@ -2764,6 +2764,8 @@ mmss_smmu: iommu@cd00000 {
>                                 <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
>                                 <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
>                                 <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                       power-domains =3D <&mmcc BIMC_SMMU_GDSC>;
>                 };
>
>                 remoteproc_adsp: remoteproc@17300000 {
>
> --
> 2.40.1
>

I think you should split this up.

This should be two patches. One to describe the power-domain and
another for the removal of interconnect clocks.

I guess none of the multi-media connected stuff on 8998 works ... no
venus, mdp, camera - which would surely fail without the multi-media
AXI clock being on..

Anyway please split this patch up !
