Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C995C433F5
	for <linux-clk@archiver.kernel.org>; Mon,  6 Dec 2021 15:41:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1391057AbhLFPod (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Dec 2021 10:44:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390489AbhLFPm1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Dec 2021 10:42:27 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA430C0A8870
        for <linux-clk@vger.kernel.org>; Mon,  6 Dec 2021 07:26:47 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id i5-20020a05683033e500b0057a369ac614so14031120otu.10
        for <linux-clk@vger.kernel.org>; Mon, 06 Dec 2021 07:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/+S7xZ/J/Lmw5RKCZEGldriwwUmxNSdBbdaMcU/rL8o=;
        b=JmSlfFhAT0/2mdCUBUSKhokDy4aXZggCgULvDuVT0DFsALxohzGGyH6jrWWjXvqkll
         R6UedoyhN40oSn1MuRtFP1CWBHok1MXxma3mBMmAOZor3Gqr4xL5OU6lmVoR5iKQtMHu
         CjXuhRxoEKIPk0nI+0wAHGC+VrTY5JZQ9TjIdtFc2q3CxwyGbXIeMNyYE2/ShMy79mbe
         IRfXJl1CD8JjiwDYSZZ0TqqKGTgl256Hqxcr1D6J8YLNEhUEi/r39eTsttAAN0eB2gf6
         9m8QEREPUzxhgp9r5cUZrq+DB3hlqWTziP4HTkc8Te9etDJAvfFVebIQhe0NdqGv2BPG
         U7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/+S7xZ/J/Lmw5RKCZEGldriwwUmxNSdBbdaMcU/rL8o=;
        b=a1iOzzwIxoVy2sW+99pF3bt2Y7ltoYlC3KjF8avJ2dBwOcWmvBUifiPy5BzJ7pAiVs
         ltfnUZBMl3qhCH/mNbb5fnAqYsmXVbYStq3c5n9vw9hamAPiYuDnRCl2OuDKzWK7agKl
         lsAbOXcZZiUtPke47+rYCfsCk922h8yrz4bX2uQY/W5kJshbmm+ptiVcAzJjoyqNWrIV
         qmZdudusXPmzCGP9lyUgZFGmA4wTqK1Vlq3hMEn1/rOvtnXKBJKO+vArrrWlZh71ubFB
         EK+/QsoV1bOeI7J4wnLj1m1+8PyOpFYqNFRE6xRQ4pnerJ1SNzEK32BgTEa8v8clF2FT
         /dPQ==
X-Gm-Message-State: AOAM533Fiwowikh9mgOXV+mVFhumsKMFB4d7hvnB2aufY7JLwsE9CWYk
        7HXrcgC7PZXoPQdI+YhrUfESeg==
X-Google-Smtp-Source: ABdhPJzA2CSSjQl/Lw0cnPULTz2iuoU+21d0RxySX2OUR0bgAghgm+7NcJcalSV9XX+Q5S8BltbO0g==
X-Received: by 2002:a9d:f63:: with SMTP id 90mr30482398ott.268.1638804407124;
        Mon, 06 Dec 2021 07:26:47 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bh12sm2770172oib.25.2021.12.06.07.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 07:26:46 -0800 (PST)
Date:   Mon, 6 Dec 2021 09:26:44 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: smd-rpm: Drop binary value handling for
 buffered clock
Message-ID: <Ya4rtHSS1tLm7Gbi@builder.lan>
References: <20211031020715.21636-1-shawn.guo@linaro.org>
 <20211031020715.21636-4-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211031020715.21636-4-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat 30 Oct 21:07 CDT 2021, Shawn Guo wrote:

> The buffered clock binary value handling added by commit 36354c32bd76
> ("clk: qcom: smd-rpm: Add .recalc_rate hook for clk_smd_rpm_branch_ops")
> is redundant, because buffered clock is branch type, and the binary
> value handling for branch clock has been handled by
> clk_smd_rpm_prepare/unprepare functions.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index dd3d373a1309..ea28e45ca371 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -189,10 +189,6 @@ static int clk_smd_rpm_set_rate_active(struct clk_smd_rpm *r,
>  		.value = cpu_to_le32(DIV_ROUND_UP(rate, 1000)), /* to kHz */
>  	};
>  
> -	/* Buffered clock needs a binary value */
> -	if (r->rpm_res_type == QCOM_SMD_RPM_CLK_BUF_A)
> -		req.value = cpu_to_le32(!!req.value);
> -
>  	return qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_ACTIVE_STATE,
>  				  r->rpm_res_type, r->rpm_clk_id, &req,
>  				  sizeof(req));
> @@ -207,10 +203,6 @@ static int clk_smd_rpm_set_rate_sleep(struct clk_smd_rpm *r,
>  		.value = cpu_to_le32(DIV_ROUND_UP(rate, 1000)), /* to kHz */
>  	};
>  
> -	/* Buffered clock needs a binary value */
> -	if (r->rpm_res_type == QCOM_SMD_RPM_CLK_BUF_A)
> -		req.value = cpu_to_le32(!!req.value);
> -
>  	return qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_SLEEP_STATE,
>  				  r->rpm_res_type, r->rpm_clk_id, &req,
>  				  sizeof(req));
> -- 
> 2.17.1
> 
