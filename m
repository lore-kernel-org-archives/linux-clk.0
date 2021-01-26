Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2EFC433DB
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 14:05:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FA7722B2C
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 14:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405685AbhAZOFd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 09:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405572AbhAZOEs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 09:04:48 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8B2C061A31
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 06:04:08 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id v1so16227517ott.10
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 06:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MsK4CaeZUuQbxzldo8dFAj7Ip1Nra/4PEZy0IWNDwKA=;
        b=oJDgbuOkCoz6zAvL2MLojuABQE1LnOHQsv8Sr8dJJkZmRIJW4fT+lBOiWCHwFxgyXl
         f5SppIvh70EKm2GeJyfWlQ5OA7825I/pCJhXVsP0EmZKDWarGYzCLE4YFS4n44X63N27
         CuzTTDKuisrWcbigIqWkS1qeGfiDC76d2VkFbKyVzkzUgTqKWz8lqCKQ0drBWS9ehbTi
         ixyXptqL0Wa8G7XtYbpibYb3mZr2LJbpj5/Uxwy2/qnrdXTXSg77XIk7N1xvgWp6euQ4
         jEXzA2BR8T82RcTsXX0Gr8l2vemy9hL5H7+O+sZKFrEyDvKrYauu0QHcsbcqMQXMc7Qd
         vaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MsK4CaeZUuQbxzldo8dFAj7Ip1Nra/4PEZy0IWNDwKA=;
        b=BzeJzo9q4z48+LSmvzpRwrkzBUKD+YbaWjUN4AVDe7tihGM3+90A8w0/MKByKtL1tJ
         RrXyLr0XKz2desMmr3syLnIpGKWeYW5SCj5Xl1Mes0zrCjlYV3b7p2qiuemhSM9hbykQ
         tiBSOLYGX2nO75ztWID0Cx5i/h/OzEt9yutoh0AyUbKsZhkvNSHiGX4i8huLjeyJPit7
         W7iSntGrMItBgL9eED7eW4WwLl4CAuFXowskzmYErk8HdyTch78z79G1q0LQpY8eIDFZ
         bGhrjqZ0UgZ4/bFTUV4oq25amtLRrF30V7zhhq+UGNSc72vJsx13YK1z1NH1WJz9JqJ1
         ZnSQ==
X-Gm-Message-State: AOAM532C6E35WDQ0UD9/9DnDcXwAdiwZpR3VwJCSDRAiwnGKB7n3e64n
        Y8YgFiTnrCfvSo48UxDjkiPkdA==
X-Google-Smtp-Source: ABdhPJxX8nY7QjrZBeaPXb5VbSrI1X+GKXGhNuDRRN1eLhvoaMkZFItzLc7hvWzb53yTMa8LtnmSMQ==
X-Received: by 2002:a9d:6c90:: with SMTP id c16mr4106448otr.177.1611669846924;
        Tue, 26 Jan 2021 06:04:06 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 186sm3853267ood.6.2021.01.26.06.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:04:06 -0800 (PST)
Date:   Tue, 26 Jan 2021 08:04:04 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 18/21] clk: qcom: clk-rpm: Remove a bunch of superfluous
 code
Message-ID: <20210126140404.GF1241218@yoga>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <20210126124540.3320214-19-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126124540.3320214-19-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 26 Jan 06:45 CST 2021, Lee Jones wrote:

> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/clk/qcom/clk-rpm.c:453:29: warning: ‘clk_rpm_branch_ops’ defined but not used [-Wunused-const-variable=]
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/clk/qcom/clk-rpm.c | 63 --------------------------------------
>  1 file changed, 63 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
> index f71d228fd6bd5..a18811c380187 100644
> --- a/drivers/clk/qcom/clk-rpm.c
> +++ b/drivers/clk/qcom/clk-rpm.c
> @@ -73,62 +73,6 @@
>  		},							      \
>  	}
>  
> -#define DEFINE_CLK_RPM_PXO_BRANCH(_platform, _name, _active, r_id, r)	      \
> -	static struct clk_rpm _platform##_##_active;			      \
> -	static struct clk_rpm _platform##_##_name = {			      \
> -		.rpm_clk_id = (r_id),					      \
> -		.active_only = true,					      \
> -		.peer = &_platform##_##_active,				      \
> -		.rate = (r),						      \
> -		.branch = true,						      \
> -		.hw.init = &(struct clk_init_data){			      \
> -			.ops = &clk_rpm_branch_ops,			      \
> -			.name = #_name,					      \
> -			.parent_names = (const char *[]){ "pxo_board" },      \
> -			.num_parents = 1,				      \
> -		},							      \
> -	};								      \
> -	static struct clk_rpm _platform##_##_active = {			      \
> -		.rpm_clk_id = (r_id),					      \
> -		.peer = &_platform##_##_name,				      \
> -		.rate = (r),						      \
> -		.branch = true,						      \
> -		.hw.init = &(struct clk_init_data){			      \
> -			.ops = &clk_rpm_branch_ops,			      \
> -			.name = #_active,				      \
> -			.parent_names = (const char *[]){ "pxo_board" },      \
> -			.num_parents = 1,				      \
> -		},							      \
> -	}
> -
> -#define DEFINE_CLK_RPM_CXO_BRANCH(_platform, _name, _active, r_id, r)	      \
> -	static struct clk_rpm _platform##_##_active;			      \
> -	static struct clk_rpm _platform##_##_name = {			      \
> -		.rpm_clk_id = (r_id),					      \
> -		.peer = &_platform##_##_active,				      \
> -		.rate = (r),						      \
> -		.branch = true,						      \
> -		.hw.init = &(struct clk_init_data){			      \
> -			.ops = &clk_rpm_branch_ops,			      \
> -			.name = #_name,					      \
> -			.parent_names = (const char *[]){ "cxo_board" },      \
> -			.num_parents = 1,				      \
> -		},							      \
> -	};								      \
> -	static struct clk_rpm _platform##_##_active = {			      \
> -		.rpm_clk_id = (r_id),					      \
> -		.active_only = true,					      \
> -		.peer = &_platform##_##_name,				      \
> -		.rate = (r),						      \
> -		.branch = true,						      \
> -		.hw.init = &(struct clk_init_data){			      \
> -			.ops = &clk_rpm_branch_ops,			      \
> -			.name = #_active,				      \
> -			.parent_names = (const char *[]){ "cxo_board" },      \
> -			.num_parents = 1,				      \
> -		},							      \
> -	}
> -
>  #define to_clk_rpm(_hw) container_of(_hw, struct clk_rpm, hw)
>  
>  struct rpm_cc;
> @@ -450,13 +394,6 @@ static const struct clk_ops clk_rpm_ops = {
>  	.recalc_rate	= clk_rpm_recalc_rate,
>  };
>  
> -static const struct clk_ops clk_rpm_branch_ops = {
> -	.prepare	= clk_rpm_prepare,
> -	.unprepare	= clk_rpm_unprepare,
> -	.round_rate	= clk_rpm_round_rate,
> -	.recalc_rate	= clk_rpm_recalc_rate,
> -};
> -
>  /* MSM8660/APQ8060 */
>  DEFINE_CLK_RPM(msm8660, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
>  DEFINE_CLK_RPM(msm8660, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
> -- 
> 2.25.1
> 
