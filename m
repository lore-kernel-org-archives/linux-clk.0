Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFE0C433DF
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 02:16:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A499621D81
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 02:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602641800;
	bh=42E3KgsXC8dH9rso8TURVBVFNR9JiVlIPxE0XUzrkHw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=e0P8Yy8ljOVZnZvrhPGR8OFAYFbhsOQ+QNy8QGZYOMaPdFH1JCDim+AOq94Csmrkx
	 a/DCzuahEyo1ZN1YRbTHwtU1j+JeEPnQAlZFioxkCH1udW94wQ7J95HkwI3N3z7YUw
	 tG4dgwF0fCfCwyAV8NPerQa+9cAxhankJkyGaWWQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgJNCQk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 22:16:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:59242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726981AbgJNCQk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 22:16:40 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88AEB21775;
        Wed, 14 Oct 2020 02:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602641799;
        bh=42E3KgsXC8dH9rso8TURVBVFNR9JiVlIPxE0XUzrkHw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AZKQUJGwRAddE+3qOEbM4UZB1LlDxZQR8mQFiJvyCKCVICRSc93QeD3YLoEmC/HOC
         LKeFhXVgoaWlzLkHDKHKIr60N6jlHN5c1k8dihyTYEVbTjQX4Awotheiw5Inw7/pcc
         P3p15HCz0hcDwuEbBehvKA2mmi+y6BZ8j1Q6hZKI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201005225914.315852-4-dmitry.baryshkov@linaro.org>
References: <20201005225914.315852-1-dmitry.baryshkov@linaro.org> <20201005225914.315852-4-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v1 3/3] clk: qcom: dispcc-sm8250: handle MMCX power domain
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 13 Oct 2020 19:16:38 -0700
Message-ID: <160264179823.310579.6191463434860127602@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2020-10-05 15:59:14)
> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-s=
m8250.c
> index 07a98d3f882d..3941054a7b07 100644
> --- a/drivers/clk/qcom/dispcc-sm8250.c
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -963,6 +963,8 @@ static struct gdsc mdss_gdsc =3D {
>         },
>         .pwrsts =3D PWRSTS_OFF_ON,
>         .flags =3D HW_CTRL,
> +       .domain =3D "mmcx",
> +       .perf_idx =3D 0,

Does a perf_idx of 0 mean off? Or just "not off"?
