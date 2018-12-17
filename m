Return-Path: <SRS0=zTeK=O2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29400C43387
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 18:55:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDEA520874
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 18:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545072927;
	bh=sk8Fx6ElTm62kK0UteSYWDsz3Fgmv44R4+W6c5sc0oA=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=VOpdcrSaWPK+jsqZLiAqAflVMK4YaQw3iugmD/ba5MJ1K8UUh7Tgf6lBYsRPGqgS+
	 XadKf39m9Ed1DdlhH5HUobyFUuY3kYe9CBS8VG51Uo3nb3KOxc61BeBLzPLl7FYb5v
	 2kzeDiJyzIKtMLZvPfc6Jf7E8/oo9xNn8K1Qmqto=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732343AbeLQSz0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Dec 2018 13:55:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:46550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728301AbeLQSz0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 Dec 2018 13:55:26 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58DC820874;
        Mon, 17 Dec 2018 18:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545072925;
        bh=sk8Fx6ElTm62kK0UteSYWDsz3Fgmv44R4+W6c5sc0oA=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=CTQUBd0Z2uvL7pLzclNdl+apH48OF3X73/0qThcvrRI6Ul2ryFv06VEFd6tQlrTZ0
         7abHygcdka9Qjh8i/DfkTGPJfQ2RgHpzC6b13pzY8wwN2AdKZ52ftT78osndPqpBs3
         G1Be1Nl0LVU1SAdhQOCeC8UV5GClm4ghWlqEsx9w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181215103557.2748-6-govinds@codeaurora.org>
Subject: Re: [PATCH v3 5/7] remoteproc: qcom: wcss: populate hardcoded param using driver data
To:     Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org
References: <20181215103557.2748-1-govinds@codeaurora.org> <20181215103557.2748-6-govinds@codeaurora.org>
Message-ID: <154507292461.19322.16649255647859149880@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     linux-clk@vger.kernel.org, sricharan@codeaurora.org,
        sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Date:   Mon, 17 Dec 2018 10:55:24 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Govind Singh (2018-12-15 02:35:55)
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qco=
m_q6v5_wcss.c
> index f93e1e4a1cc0..129f82404656 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -16,7 +17,6 @@
>  #include "qcom_common.h"
>  #include "qcom_q6v5.h"
> =20
> -#define WCSS_CRASH_REASON              421
> =20
>  /* Q6SS Register Offsets */
>  #define Q6SS_RESET_REG         0x014
> @@ -70,6 +70,14 @@
>  #define TCSR_WCSS_CLK_MASK     0x1F
>  #define TCSR_WCSS_CLK_ENABLE   0x14
> =20
> +struct wcss_data {
> +       void (*pas_handover)(struct qcom_q6v5 *q6v5);
> +       const char *firmware_name;
> +       int crash_reason_smem;
> +       int version;

version can be negative?

> +       int pas_id;

And the pas_id can be negative too?

> +};
> +
>  struct q6v5_wcss {
>         struct device *dev;
> =20
> @@ -553,7 +573,8 @@ static int q6v5_wcss_probe(struct platform_device *pd=
ev)
>         if (ret)
>                 goto free_rproc;
> =20
> -       ret =3D qcom_q6v5_init(&wcss->q6v5, pdev, rproc, WCSS_CRASH_REASO=
N, NULL);
> +       ret =3D qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reas=
on_smem,
> +                            desc->pas_handover);
>         if (ret)
>                 goto free_rproc;
> =20
> @@ -581,8 +602,15 @@ static int q6v5_wcss_remove(struct platform_device *=
pdev)
>         return 0;
>  }
> =20
> +static const struct wcss_data wcss_ipq8074_res_init =3D {
> +       .firmware_name =3D "IPQ8074/q6_fw.mdt",
> +       .crash_reason_smem =3D 421,

Why destroy the #define and inline it here? Keep the define around and
use it here instead?

> +       .pas_handover =3D NULL,

This surely isn't needed to be assigned to NULL.

