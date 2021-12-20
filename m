Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0767C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 20 Dec 2021 23:40:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231852AbhLTXk1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Dec 2021 18:40:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhLTXk1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Dec 2021 18:40:27 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A32C06173E
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 15:40:27 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id d1-20020a4a3c01000000b002c2612c8e1eso3535616ooa.6
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 15:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IfBD0poswQleNgL1djW83bNzCVv6Q/P4s8iNGStEPw8=;
        b=fi1gtgXVSQc1lAAMPzRv/NLfrbeTm3UfyRL3sbNtFSO5QosYVI/HnSyjvVq10TisG6
         sRm5juw3M7Jfv8dBG/VhScPlfJgAtD0Tw0QRXYMuU+bg0+9/KvJdWl6LmQs9o05ogDEY
         PD4rcIuL4mSJXxiHQsCCOSVvzGrUH9Ozwc6EGgARmCjNGrZoaer8/embc0iR6F7+CaOm
         WbecrNLy74w7hqiGBG66Y4NBOAdWGHeH7mQI41Agw6aAvr9T6s/8pVQ2N4cCJngJJBLH
         jN0BjgQDtv4C65Oi09MzYxUBGzquLhgNQdWT987Lx9TGxfnfv+5K66h+os1EL8HeQKPM
         0QsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IfBD0poswQleNgL1djW83bNzCVv6Q/P4s8iNGStEPw8=;
        b=zISDSqlUt+A6/g9FuwsxTuIGsAIX5Uqrk2WufIC1IPn+t9RN1ol0mWMtD1sZb8AE2Q
         fZBM8Oo9PEkvhEglNWGEFuqv9EPNU7QHzrhlViKdWwn/q9BOyiDcSvRXspRh011AMFOZ
         Jq8halPeIu88Rfz+38pbxUg7js2Do4+O6SGSQxIlV/UId4ZgC8weELe9a0IR9k34BabV
         AVPLWRQexMIC/NwADmMyaK4MjkZcYbEfvBLbO9fJfs+XzEUUH5aXlisWwP7Cyb6NvdCN
         PULRgb7ZNSuqsgCe/yB622gST+jjWbMhNTMiwKpyYggcjkzfTmimrMNekPBklWiPB0Vg
         9QtQ==
X-Gm-Message-State: AOAM533BWyr0XXlBiktJnHkmN2PpObVd1ecJkZqb78dcnEezHHINY7FA
        QPVxCWmTLOTylE5K+GZ7hcDbeg==
X-Google-Smtp-Source: ABdhPJwh53hhyKKfomXWnVYDN2dH7I0RVMHHKs61Qk8CtgZkZCgQGGB2P6zYoGJPCd042CYzKMqNtw==
X-Received: by 2002:a4a:8701:: with SMTP id z1mr322018ooh.68.1640043626248;
        Mon, 20 Dec 2021 15:40:26 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j13sm3731715oil.42.2021.12.20.15.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 15:40:25 -0800 (PST)
Date:   Mon, 20 Dec 2021 15:41:34 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Mike Tipton <quic_mdtipton@quicinc.com>
Cc:     agross@kernel.org, sboyd@kernel.org, shawn.guo@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-qcm2290: CLK_OPS_PARENT_ENABLE flag for
 rcg2 clocks
Message-ID: <YcEUrtQuJ5CGF2RW@ripper>
References: <1639994084-25447-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1639994084-25447-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 20 Dec 01:54 PST 2021, Loic Poulain wrote:

> When a rcg2 clock migrates to a new parent, both the old and new
> parent clocks must be enabled to complete the transition. This can
> be automatically performed by the clock core when a clock is flagged
> with CLK_OPS_PARENT_ENABLE.
> 
> Without this, we may hit rate update failures:
> gcc_sdcc2_apps_clk_src: rcg didn't update its configuration.
> WARNING: CPU: 1 PID: 82 at drivers/clk/qcom/clk-rcg2.c:122 update_config+0xe0/0xf0
> 
> Fixes: 496d1a13d405 ("clk: qcom: Add Global Clock Controller driver for QCM2290")
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/clk/qcom/gcc-qcm2290.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
> index b6fa7b8..9e1d88e 100644
> --- a/drivers/clk/qcom/gcc-qcm2290.c
> +++ b/drivers/clk/qcom/gcc-qcm2290.c
> @@ -674,6 +674,7 @@ static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
>  		.name = "gcc_usb30_prim_mock_utmi_clk_src",
>  		.parent_data = gcc_parents_0,
>  		.num_parents = ARRAY_SIZE(gcc_parents_0),
> +		.flags = CLK_OPS_PARENT_ENABLE,

This seems like a correct fix for the obvious problem that we might end
up invoking clk_set_rate() and clk_set_parent() for these clocks while
their (and thereby themselves - in a software sense) are disabled.


However, clocks that downstream are marked "enable_safe_config", may in
addition be enabled by the hardware, behind out back. As such we must
ensure that they always have a valid configuration, we do this by
"parking" them on CXO whenever we're going to disable their parent
clocks.

Upstream we handle this by using the clk_rcg2_shared_ops, which will do
exactly this.


PS. Unfortunately these RCGs doesn't allow us to reliably implement
is_enabled() and as such clk_disable_unused() will skip parking the
unused clocks and continue to disable the PLLs feeding them (if they are
unused). I don't think this is a problem for the clocks you list here,
but we certainly have a problem with this in the dispcc. So this is
currently being discussed. For now it's expected that booting without
"clk_ignore_unused" is "broken".

Regards,
Bjorn

>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -710,6 +711,7 @@ static struct clk_rcg2 gcc_camss_axi_clk_src = {
>  		.name = "gcc_camss_axi_clk_src",
>  		.parent_data = gcc_parents_4,
>  		.num_parents = ARRAY_SIZE(gcc_parents_4),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -730,6 +732,7 @@ static struct clk_rcg2 gcc_camss_cci_clk_src = {
>  		.name = "gcc_camss_cci_clk_src",
>  		.parent_data = gcc_parents_9,
>  		.num_parents = ARRAY_SIZE(gcc_parents_9),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -752,6 +755,7 @@ static struct clk_rcg2 gcc_camss_csi0phytimer_clk_src = {
>  		.name = "gcc_camss_csi0phytimer_clk_src",
>  		.parent_data = gcc_parents_5,
>  		.num_parents = ARRAY_SIZE(gcc_parents_5),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -766,6 +770,7 @@ static struct clk_rcg2 gcc_camss_csi1phytimer_clk_src = {
>  		.name = "gcc_camss_csi1phytimer_clk_src",
>  		.parent_data = gcc_parents_5,
>  		.num_parents = ARRAY_SIZE(gcc_parents_5),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -854,6 +859,7 @@ static struct clk_rcg2 gcc_camss_ope_ahb_clk_src = {
>  		.name = "gcc_camss_ope_ahb_clk_src",
>  		.parent_data = gcc_parents_6,
>  		.num_parents = ARRAY_SIZE(gcc_parents_6),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -912,6 +918,7 @@ static struct clk_rcg2 gcc_camss_tfe_0_clk_src = {
>  		.name = "gcc_camss_tfe_0_clk_src",
>  		.parent_data = gcc_parents_7,
>  		.num_parents = ARRAY_SIZE(gcc_parents_7),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -936,6 +943,7 @@ static struct clk_rcg2 gcc_camss_tfe_0_csid_clk_src = {
>  		.name = "gcc_camss_tfe_0_csid_clk_src",
>  		.parent_data = gcc_parents_8,
>  		.num_parents = ARRAY_SIZE(gcc_parents_8),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -950,6 +958,7 @@ static struct clk_rcg2 gcc_camss_tfe_1_clk_src = {
>  		.name = "gcc_camss_tfe_1_clk_src",
>  		.parent_data = gcc_parents_7,
>  		.num_parents = ARRAY_SIZE(gcc_parents_7),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -964,6 +973,7 @@ static struct clk_rcg2 gcc_camss_tfe_1_csid_clk_src = {
>  		.name = "gcc_camss_tfe_1_csid_clk_src",
>  		.parent_data = gcc_parents_8,
>  		.num_parents = ARRAY_SIZE(gcc_parents_8),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1008,6 +1018,7 @@ static struct clk_rcg2 gcc_camss_top_ahb_clk_src = {
>  		.name = "gcc_camss_top_ahb_clk_src",
>  		.parent_data = gcc_parents_4,
>  		.num_parents = ARRAY_SIZE(gcc_parents_4),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1030,6 +1041,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
>  		.name = "gcc_gp1_clk_src",
>  		.parent_data = gcc_parents_2,
>  		.num_parents = ARRAY_SIZE(gcc_parents_2),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1044,6 +1056,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
>  		.name = "gcc_gp2_clk_src",
>  		.parent_data = gcc_parents_2,
>  		.num_parents = ARRAY_SIZE(gcc_parents_2),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1058,6 +1071,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
>  		.name = "gcc_gp3_clk_src",
>  		.parent_data = gcc_parents_2,
>  		.num_parents = ARRAY_SIZE(gcc_parents_2),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1078,6 +1092,7 @@ static struct clk_rcg2 gcc_pdm2_clk_src = {
>  		.name = "gcc_pdm2_clk_src",
>  		.parent_data = gcc_parents_0,
>  		.num_parents = ARRAY_SIZE(gcc_parents_0),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1220,6 +1235,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
>  		.name = "gcc_sdcc1_apps_clk_src",
>  		.parent_data = gcc_parents_1,
>  		.num_parents = ARRAY_SIZE(gcc_parents_1),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
> @@ -1243,6 +1259,7 @@ static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
>  		.name = "gcc_sdcc1_ice_core_clk_src",
>  		.parent_data = gcc_parents_0,
>  		.num_parents = ARRAY_SIZE(gcc_parents_0),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1267,6 +1284,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.name = "gcc_sdcc2_apps_clk_src",
>  		.parent_data = gcc_parents_12,
>  		.num_parents = ARRAY_SIZE(gcc_parents_12),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1289,6 +1307,7 @@ static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
>  		.name = "gcc_usb30_prim_master_clk_src",
>  		.parent_data = gcc_parents_0,
>  		.num_parents = ARRAY_SIZE(gcc_parents_0),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1303,6 +1322,7 @@ static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
>  		.name = "gcc_usb3_prim_phy_aux_clk_src",
>  		.parent_data = gcc_parents_13,
>  		.num_parents = ARRAY_SIZE(gcc_parents_13),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> -- 
> 2.7.4
> 
