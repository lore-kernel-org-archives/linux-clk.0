Return-Path: <SRS0=Vpf0=Q2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00346C43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Feb 2019 07:10:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3FD921902
	for <linux-clk@archiver.kernel.org>; Tue, 19 Feb 2019 07:10:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YC/p6xXA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbfBSHKy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Feb 2019 02:10:54 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46656 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbfBSHKx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Feb 2019 02:10:53 -0500
Received: by mail-pl1-f193.google.com with SMTP id o6so9965270pls.13
        for <linux-clk@vger.kernel.org>; Mon, 18 Feb 2019 23:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yP9p30prukCzS6G6kepzPat1w38RY1jaKj0zCXMnrdg=;
        b=YC/p6xXAA6IzVT7R+eeVqXHCjmFihaBdfS4tzin2s/rq97NA1xnlEl77vRUwY9KiLE
         arLOS3A2ywK+MLXwryrWVJaFuvhuPXSvpJl87mBUq4yKQyFw788h9kf3UUkbyul0B7e/
         4tmw/GKzupuvwfbZHqN5XBGrQ8w3XZhnp6Bx2MwkGABLmNhhxX2LOmeqDUnsPDIBpaMA
         Jc+ePcA2JMjX8wzWH9MY/6Yz/53RQqtyRNvt+RUeOt8bHOrRSlz810GabsOiv7ZuXvL1
         43pJtzFwMAc6y54CY9GOnTE/eZusoHyrSXh95EFKUzq3bE97daXM76vV6P7K/AmpX6oj
         hxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yP9p30prukCzS6G6kepzPat1w38RY1jaKj0zCXMnrdg=;
        b=KnC2PNt2SDRKx9hDcJDpz+n3Tp5o+ahGVGUZocIydkJGXE9ggwh1wqmyE80fnuTTpa
         tlzi7XKO/I8IF2nHZnKt08QtZXcqOwsMCP/HxnbU7Zp/JkTfgB8oygQUMk5Fpx3Qg/0+
         s+0jKWP4IDMYzo54VQFsZl42c6IOnA0CL41VvYQnDcUYlGejHLPh3E7F7XmHFcHdI+A4
         CzrN0u3NodIluuA/tkDicbWoHp4ApXgIcW5G9XBHajkhAIT5ew4bnvvspogNNBs5Jgpr
         H0Zlx08r6NkEBhaiHV1QjXKf/CXBaj3S8CA17p9j18bojmIKI4w8rAs4Fl32JiMw77pM
         h2HQ==
X-Gm-Message-State: AHQUAubxMH/zwrRnrIoXlv7xdiRIBrm4cnSFHExiyojOEOUXSGd22d1m
        rIgC25/VeNKFOUnIk0baySXFSA==
X-Google-Smtp-Source: AHgI3IafP213bWjbD008Z9tVL0rdAo0/5ZZzfvJawQqHl0oPsYCz1QlzEXKGyRpk8FG+HyZe9LEhAg==
X-Received: by 2002:a17:902:264:: with SMTP id 91mr29803125plc.108.1550560252723;
        Mon, 18 Feb 2019 23:10:52 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 128sm22354173pfx.7.2019.02.18.23.10.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 23:10:50 -0800 (PST)
Date:   Mon, 18 Feb 2019 23:10:48 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Govind Singh <govinds@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 6/8] dt-binding: remoteproc: Add QTI WCSS PIL bindings
Message-ID: <20190219071048.GH13018@tuxbook-pro>
References: <20190202152626.1006-1-govinds@codeaurora.org>
 <20190202152626.1006-7-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190202152626.1006-7-govinds@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat 02 Feb 07:26 PST 2019, Govind Singh wrote:

> Add devicetree bindings for WCSS non pas remoteproc.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/remoteproc/qcom,q6v5.txt         | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 9ff5b0309417..1fe8e9f72204 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -13,6 +13,7 @@ on the Qualcomm Hexagon core.
>  		    "qcom,msm8974-mss-pil"
>  		    "qcom,msm8996-mss-pil"
>  		    "qcom,sdm845-mss-pil"
> +		    "qcom,qcs404-wcss-pil"
>  
>  - reg:
>  	Usage: required
> @@ -153,3 +154,63 @@ Hexagon, as it is found on MSM8974 boards.
>  			memory-region = <&mpss_region>;
>  		};
>  	};
> +
> +	remoteproc-wcss {

I'm not sure it's useful to add another full example here. So some of
the following comments might not matter.

> +		compatible = "qcom,qcs404-wcss-pil";
> +		reg = <0x07400000 0x00104>;
> +		reg-names = "qdsp6";
> +
> +		interrupts-extended = <&intc GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
> +				      <&wcss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +				      <&wcss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +				      <&wcss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +				      <&wcss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "wdog", "fatal", "ready",
> +				  "handover", "stop-ack";
> +
> +		clocks = <&xo_board>,
> +			 <&gcc GCC_WCSS_Q6_AHB_CBCR_CLK>,
> +			 <&gcc GCC_WCSS_Q6_AXIM_CBCR_CLK>,
> +
> +			 <&clock_wcsscc WCSS_AHBFABRIC_CBCR_CLK>,

As with the previous patch, I don't think you should have both "clock"
and "cc" in the name, just make it "wcsscc". But isn't the actual name
q6sstopcc?

> +			 <&clock_wcsscc WCSS_LCC_CBCR_CLK>,
> +			 <&clock_wcsscc WCSS_AHBS_CBCR_CLK>,
> +			 <&clock_wcsscc WCSS_TCM_CBCR_CLK>,
> +			 <&clock_wcsscc WCSS_AHBM_CBCR_CLK>,
> +			 <&clock_wcsscc WCSS_AXIM_CBCR_CLK>,
> +			 <&clock_wcsscc WCSS_QDSP6SS_XO_CBCR_CLK>,
> +			 <&clock_wcsscc WCSS_QDSP6SS_SLEEP_CBCR_CLK>,
> +			 <&clock_wcsscc WCSS_QDSP6SS_GFMMUX_CLK>,
> +			 <&clock_wcsscc WCSS_BCR_CBCR_CLK>;
> +
> +		clock-names = "xo", "gcc_abhs_cbcr", "gcc_axim_cbcr",
> +			      "wcss_ahbfabric_cbcr", "wcnss_csr_cbcr",
> +			      "wcnss_ahbs_cbcr", "wcnss_tcm_slave_cbcr",
> +			      "wcnss_abhm_cbcr", "wcnss_axim_cbcr",
> +			      "wcnss_qdsp6ss_xo_cbcr", "wcnss_sleep_cbcr",
> +			      "wcnss_core_gfm", "wcss_bcr_cbcr";

These clocks should be listed in the binding document. And as the scope
is local to "clock-names" there's no reason to include "wcnss_" in their
name.

> +		resets = <&gcc GCC_WDSP_RESTART>,
> +			 <&clock_wcsscc Q6SSTOP_QDSP6SS_RESET>,
> +			 <&clock_wcsscc Q6SSTOP_QDSP6SS_CORE_RESET>,
> +			 <&clock_wcsscc Q6SSTOP_QDSP6SS_BUS_RESET>,
> +			 <&clock_wcsscc Q6SSTOP_BCR_RESET>;
> +		reset-names = "wcss_reset", "wcss_q6_reset",
> +			      "wcss_q6_core_reset", "wcss_q6_bus_reset",
> +			      "wcss_q6_bcr_reset";
> +
> +		memory-region = <&wlan_fw_mem>;
> +
> +		qcom,smem-states = <&wcss_smp2p_out 0>;
> +		qcom,smem-state-names = "stop";
> +		qcom,halt-regs = <&tcsr_wlan_q6 0x18000>;

Is this the Q6 specific TCSR and not just the primary TCSR?

> +		glink-edge {
> +			interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			qcom,remote-pid = <1>;
> +			mboxes = <&apcs_glb 16>;
> +
> +			label = "wcss";
> +			};
> +		};

Indentation is off here.

Regards,
Bjorn
