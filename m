Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8870C43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 16:39:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0450214C1
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 16:39:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDbqHjok"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0450214C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729859AbeKVDOi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 22:14:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:57940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727100AbeKVDOi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Nov 2018 22:14:38 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 89E85214C1;
        Wed, 21 Nov 2018 16:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1542818367;
        bh=cq6DlEJTlXIwJh38mvB/0aD9l62C3pxPbYtStqk46W0=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=fDbqHjok/wvG8bLLqWUki2qDqpzud4WPdeqsVQTvt+OuuxIJo3BegObyV/zbsXGeB
         iV40iR/O74LfJfh5CaTxnFFT1JlJDDjEkJqjefYttUS/CaGCR7HrhekaTSMR+hl24b
         RbSxdCeGfccQIzm57+WMh+bm1dMCANlBCRMxM/Y0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Loic Poulain <loic.poulain@linaro.org>, andy.gross@linaro.org,
        david.brown@linaro.org
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1542712496-24941-1-git-send-email-loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
References: <1542712496-24941-1-git-send-email-loic.poulain@linaro.org>
Message-ID: <154281836688.88331.15272268636530295586@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] clk: qcom: msm8916: Additional clock rates for spi
Date:   Wed, 21 Nov 2018 08:39:26 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Loic Poulain (2018-11-20 03:14:56)
> Add SPI friendly clock rates to the spi freq table.
> Today it's not possible to use SPI at lower than 960Khz.
> This patch adds 100/250/500/1000 khz configs to the table.

s/khz/kHz/

> =

> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/clk/qcom/gcc-msm8916.c | 4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm891=
6.c
> index ac2b0aa..7d9647c 100644
> --- a/drivers/clk/qcom/gcc-msm8916.c
> +++ b/drivers/clk/qcom/gcc-msm8916.c
> @@ -544,7 +544,11 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src =
=3D {
>  };
>  =

>  static const struct freq_tbl ftbl_gcc_blsp1_qup1_6_spi_apps_clk[] =3D {
> +       F(100000, P_XO, 16, 2, 24),
> +       F(250000, P_XO, 16, 5, 24),
> +       F(500000, P_XO, 8, 5, 24),
>         F(960000, P_XO, 10, 1, 2),
> +       F(1000000, P_XO, 4, 5, 24),

Does Qualcomm have information on these rates? Have they been tested?
And did you measure these frequencies? The math checks out, but I wonder
if the hardware can actually do it.

