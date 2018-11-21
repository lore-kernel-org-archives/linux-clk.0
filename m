Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBCDC43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 07:55:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5224B21479
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 07:55:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lY6A3g6L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5224B21479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbeKUS3Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 13:29:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:58838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728220AbeKUS3Y (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Nov 2018 13:29:24 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F3932145D;
        Wed, 21 Nov 2018 07:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1542786957;
        bh=xmgs5jEykR6MMQMnHig695RQ6oo8y174x/KWSMiMi5Y=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=lY6A3g6LBc+HX1kV4oqVIELVtRLoBVspIha/kH4FqdlaVAkstn/a9/LNACgVt7BIi
         YqA6gHE+yQnXGD5oCqDMMJU+avjTl3dytcOgnM6VFaXla5q686tZcRLluK6U3ym1yh
         caUaYc2bUsk8oL9mbIY4TaLf9VCrIfSQV2ZV4mHA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Jordan Crouse <jcrouse@codeaurora.org>, mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181119234706.5821-2-jcrouse@codeaurora.org>
Cc:     andy.gross@linaro.org, david.brown@linaro.org,
        rnayak@codeaurora.org, okukatla@codeaurora.org,
        tdas@codeaurora.org, linux-arm-msm@vger.kernel.orgi,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        robdclark@gmail.com, freedreno@lists.freedesktop.org
References: <20181119234706.5821-1-jcrouse@codeaurora.org>
 <20181119234706.5821-2-jcrouse@codeaurora.org>
Message-ID: <154278695664.88331.10782074133486994793@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 1/4] drm/msm/a6xx: Remove unwanted regulator code
Date:   Tue, 20 Nov 2018 23:55:56 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jordan Crouse (2018-11-19 15:47:03)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gmu.c
> index 546599a7ab05..51493f409358 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -646,9 +646,6 @@ int a6xx_gmu_reset(struct a6xx_gpu *a6xx_gpu)
>         gmu_poll_timeout(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS, val,
>                 (val & 1), 100, 1000);
>  =

> -       /* Force off the GX GSDC */
> -       regulator_force_disable(gmu->gx);
> -

I was going to ask if the regulator header file was included, but it
isn't, so nothing to fix!

>         /* Disable the resources */
>         clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
>         pm_runtime_put_sync(gmu->dev);
