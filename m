Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56E9C433E6
	for <linux-clk@archiver.kernel.org>; Thu, 18 Mar 2021 02:11:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CF9B64F40
	for <linux-clk@archiver.kernel.org>; Thu, 18 Mar 2021 02:11:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhCRCLU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Mar 2021 22:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbhCRCKv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 22:10:51 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AECA1C06175F
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 19:10:51 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so3782097otk.5
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 19:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/eUcg0X5VUIePvtm+rdhKH75GAS9jZwtwPgS7YKHJh4=;
        b=b3nH3tDdN6X9tWCkrPUmCz++vd43nsDG1G3j5JbHwl6XFrsbO7gGrrL1/PKQh0030A
         wQVARi9iJnT1vjyfQSrdODBjvhBqq9z+PfPSH8utKDKg3TYjc3OOiQXT161GLJSbsnac
         3s/1Du4xl65YzutMvV3RVExp89e8n3tqOL7zPBUXHlJ/SvXVGWXCZE8AhbbxQsjDd9Uj
         +zc7fakqZffWVDmMkRyDp4Q4bnOOmn3Q6yZv4jQsoiGsIt0dxh3HiB/6BhE/00zGwH09
         wCMxIh8/sCnuIRVPzmj1H4MNJxoQ7QSZpRzqUfbcdUDPJNgC5Hq5xr+DHMNsO4vkZ5+N
         E7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/eUcg0X5VUIePvtm+rdhKH75GAS9jZwtwPgS7YKHJh4=;
        b=U4eQs0Qgge7dWMqZ2/2p62x5AcTMc5KvpjjtLWMr+HBVWKNUyJKNfJaT6I2H7F1XWV
         YP0CAutbCUUou/pCzGMeYAnuRsVZtQB1K0mRjYTaWSI7Zry4vF5MepmqkDJVg/ALN/HG
         2xGOapKF6/dbdjZrzINmgFzyk7s0PlN9sshMTBSILI0V1Rh/mFLplNYYB0dlg1RCfIzO
         RAuFVRFCE+DWDXWRVnodQtlq/CkZmYws+KVWBObbahSs+O98d95bWxJyUtks2/AaCh8G
         I6m4Q403nL3va/d9VE7+fF02ryei1LO8ELEHUkeUpMz7N0AU4VO7eqSOlplxHaheViiP
         yZOw==
X-Gm-Message-State: AOAM533BQtLjB+EfqHqxz3TDJpsGWO/z0uzvcEMXc8FSB4+tN8fCyjdN
        AuwE2ITxsswp8a4HSDBx02rtBw==
X-Google-Smtp-Source: ABdhPJxvDz6D8BIG2BMVUDnZ2a0wHB9Fmt2Gr4GiNu5pqGK8tryq0WsnLEcjBGUNoptBjTCzf/kcCQ==
X-Received: by 2002:a05:6830:24a1:: with SMTP id v1mr5361822ots.119.1616033451092;
        Wed, 17 Mar 2021 19:10:51 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w16sm162442otq.15.2021.03.17.19.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 19:10:50 -0700 (PDT)
Date:   Wed, 17 Mar 2021 21:10:48 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Cc:     sboyd@kernel.org, agross@kernel.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org
Subject: Re: [PATCH 2/3] remoteproc: qcom: wcss: populate driver data for
 IPQ6018
Message-ID: <YFK2qL+/50L7+LKV@builder.lan>
References: <1611940320-24830-1-git-send-email-gokulsri@codeaurora.org>
 <1611940320-24830-3-git-send-email-gokulsri@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611940320-24830-3-git-send-email-gokulsri@codeaurora.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri 29 Jan 11:11 CST 2021, Gokul Sriram Palanisamy wrote:

> Populate hardcoded param using driver data for IPQ6018 SoCs.
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index 7c64bfc..bc9531c 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -965,7 +965,7 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
>  	return 0;
>  }
>  
> -static int ipq8074_init_clock(struct q6v5_wcss *wcss)
> +static int ipq_init_clock(struct q6v5_wcss *wcss)
>  {
>  	int ret;
>  
> @@ -1172,7 +1172,7 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
>  }
>  
>  static const struct wcss_data wcss_ipq8074_res_init = {
> -	.init_clock = ipq8074_init_clock,
> +	.init_clock = ipq_init_clock,
>  	.q6_firmware_name = "IPQ8074/q6_fw.mdt",
>  	.m3_firmware_name = "IPQ8074/m3_fw.mdt",
>  	.crash_reason_smem = WCSS_CRASH_REASON,
> @@ -1185,6 +1185,20 @@ static const struct wcss_data wcss_ipq8074_res_init = {
>  	.need_mem_protection = true,
>  };
>  
> +static const struct wcss_data wcss_ipq6018_res_init = {
> +	.init_clock = ipq_init_clock,
> +	.q6_firmware_name = "IPQ6018/q6_fw.mdt",
> +	.m3_firmware_name = "IPQ6018/m3_fw.mdt",
> +	.crash_reason_smem = WCSS_CRASH_REASON,
> +	.aon_reset_required = true,
> +	.wcss_q6_reset_required = true,
> +	.bcr_reset_required = false,
> +	.ssr_name = "q6wcss",
> +	.ops = &q6v5_wcss_ipq8074_ops,
> +	.requires_force_stop = true,
> +	.need_mem_protection = true,
> +};
> +
>  static const struct wcss_data wcss_qcs404_res_init = {
>  	.init_clock = qcs404_init_clock,
>  	.init_regulator = qcs404_init_regulator,
> @@ -1203,6 +1217,7 @@ static const struct wcss_data wcss_qcs404_res_init = {
>  
>  static const struct of_device_id q6v5_wcss_of_match[] = {
>  	{ .compatible = "qcom,ipq8074-wcss-pil", .data = &wcss_ipq8074_res_init },
> +	{ .compatible = "qcom,ipq6018-wcss-pil", .data = &wcss_ipq6018_res_init },

As you rebase on the reworked dependency, please sorted alphabetically
(i.e 6 < 8)

Regards,
Bjorn

>  	{ .compatible = "qcom,qcs404-wcss-pil", .data = &wcss_qcs404_res_init },
>  	{ },
>  };
> -- 
> 2.7.4
> 
