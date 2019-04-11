Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CE5C10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 20:36:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E029C2184B
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 20:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555015007;
	bh=2hZTeDPHsUZKMRSeYRQUv0YImMcbVfabacwiG/3s3TA=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=0cr6bntkcYCL4O5Nd1PuQRmqxv8MvcfMwzmNHexFwWeqV/yRqJuv+QZDbZFBlVpXJ
	 /KftYtsBT9CVyX3dguzLC9Fq+Bg8sCEWshLeEykZxYweQ1bhczDbbHvGZFvfTCX9qd
	 zBirYWBmvNUtJokaP+nenuJOuPyGOlYv7U3DE/NQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbfDKUgq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 16:36:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:55352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726615AbfDKUgq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 16:36:46 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B12652075B;
        Thu, 11 Apr 2019 20:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555015005;
        bh=2hZTeDPHsUZKMRSeYRQUv0YImMcbVfabacwiG/3s3TA=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=MKoiNZtD/gGWGVUEiInnosndNKy1rckcp/AQYRFU+e9C8fj4ihcjxQtrvad6x6QLz
         Uoc5aBAHh2GtvHG2CR3VAkuG60mv1Mc5H4PKg546hpJrsw2l3oYqK9eFaBhGCMJY7R
         1+iJ6Ks21wCxjkrISlXi1RUhoTeIks9OgOO0uE0I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190306174758.22462-4-bjorn.andersson@linaro.org>
References: <20190306174758.22462-1-bjorn.andersson@linaro.org> <20190306174758.22462-4-bjorn.andersson@linaro.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/3] clk: qcom: Add QCS404 TuringCC
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Message-ID: <155501500497.20095.1440923707925089208@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 11 Apr 2019 13:36:44 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Bjorn Andersson (2019-03-06 09:47:58)
> +
> +static int turingcc_probe(struct platform_device *pdev)
> +{
> +       int ret;
> +
> +       pm_runtime_enable(&pdev->dev);
> +       ret =3D pm_clk_create(&pdev->dev);

Neat solution. Thanks!

> +       if (ret)
> +               goto disable_pm_runtime;
> +
> +       ret =3D pm_clk_add(&pdev->dev, NULL);
