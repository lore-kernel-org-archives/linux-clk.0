Return-Path: <SRS0=Vpf0=Q2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00036C43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Feb 2019 06:47:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB30C217D9
	for <linux-clk@archiver.kernel.org>; Tue, 19 Feb 2019 06:47:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YnB4YPl2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfBSGrz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Feb 2019 01:47:55 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40420 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfBSGry (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Feb 2019 01:47:54 -0500
Received: by mail-pl1-f194.google.com with SMTP id bj4so9936532plb.7
        for <linux-clk@vger.kernel.org>; Mon, 18 Feb 2019 22:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=e982F3huh7P5GAgmVvDHs68+i1sG8xs+0l0fiOJ/c0k=;
        b=YnB4YPl29ThFVwG22uQCro4LJ/6WpdyNIdNsaYnkEosobIMjPezo17/gBW8V1QF3Bn
         0tpw9KYaUAGgRxcGl2pQ8U2sQmMGq34pPonhim/0EjuOwkafJUa45+BmMJAL519ZiWm9
         uNRCIg+3xbube3wk3d61ZnTPoGAOpuwXsFODa48oMoIj8sThDZkFk+HdpMXcmpF/BaFE
         Pd0Iuqy6utzlanLtn7plxGxakwG7Ln/kl3WkbcNvRp1ih+kLccIkXo2MRD0eSmmU/Cm6
         QMOG0HvNnlHCoUo/5PO4N69ZkyTqww6VWCG7MxZGQoJNOyxy4MGd6EK+HWMngdf6TAUr
         6PYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e982F3huh7P5GAgmVvDHs68+i1sG8xs+0l0fiOJ/c0k=;
        b=S92ZlnCDPJitVhky6yofJJaRs1r6aqleBVYCAX8pSvz8disBqmlgGHX7g5RKPYluUt
         H3nKjaXJbIq+5z0Xee+EHDdKjWvT9buKyt0JQbLUqjuwSzJS9My5Q03pFwaALfY4Tm6t
         rmpkwWbsp6EkCwdUWqQjQZ9wKLdbbowPcf21TD9cE9bBxlTTib8dihJV3L8zzifdJjoD
         Cq2LCNOK8KzI3CDe6VIJNqoaToRpvG/1UJgUGVQoNr17kUCKP7ha3aKHzG+OYNIBWPNi
         JibJSZbMe7QeGoKvlFM8IBXdZK5OTI9UkvWTJ8WPYZbgfksOFA0v0+hgSpNrdHrZqIMf
         DKQg==
X-Gm-Message-State: AHQUAubEl9UoYCvSzTku08Hpj9X4czyf2Qw97k9hmVYM96Oim8U/2f3T
        3LVlG4m7zsSEb08hGKuDU/3VJw==
X-Google-Smtp-Source: AHgI3IZ34F1ghbWhX7RDFspd/BFNsPn1eNJ8Aan8+QtV6Bk//TkpLmUnx0tZMgQJ9R1xCPlEskzeHQ==
X-Received: by 2002:a17:902:8697:: with SMTP id g23mr20380189plo.30.1550558874098;
        Mon, 18 Feb 2019 22:47:54 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b85sm14531824pfj.56.2019.02.18.22.47.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 22:47:53 -0800 (PST)
Date:   Mon, 18 Feb 2019 22:47:51 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Govind Singh <govinds@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/8] dt-bindings: clock: qcom: Introduce QCOM WCSS
 Q6DSP clock bindings
Message-ID: <20190219064751.GE13018@tuxbook-pro>
References: <20190202152626.1006-1-govinds@codeaurora.org>
 <20190202152626.1006-4-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190202152626.1006-4-govinds@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat 02 Feb 07:26 PST 2019, Govind Singh wrote:

> Add device tree bindings for WiFi QDSP subsystem clock controls
> found in OCS404 soc.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/clock/qcom,wcsscc.txt | 26 +++++++++++++++++++
>  include/dt-bindings/clock/qcom,wcss-qcs404.h  | 25 ++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
>  create mode 100644 include/dt-bindings/clock/qcom,wcss-qcs404.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt b/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
> new file mode 100644
> index 000000000000..e9e222e1022f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
> @@ -0,0 +1,26 @@
> +Qualcomm WCSS Clock Controller Binding
> +-----------------------------------------------
> +
> +Required properties :
> +- compatible		: shall contain "qcom,qcs404-wcsscc"
> +- #clock-cells		: from common clock binding, shall contain 1
> +- reg			: shall contain base register address and size,
> +			  in the order
> +			Index 0 maps to WCSS_Q6SSTOP clocks register region
> +			Index 1 maps to WCSS_TCSR register region
> +			Index 2 maps to WCSS_QDSP6SS register region

We have the remoteproc node describe the QDSP6SS, so I think we should
omit it from the clock controller.

> +
> +Optional properties :
> +- reg-names	: register names of WCSS domain
> +		 "wcss_q6sstop", "wcnss_tcsr", "wcss_qdsp6ss".

The scope of these names are local to this binding, so there's no need
to prefix them with "wcss_".

> +
> +Example:
> +The below node has to be defined in the cases where the WCSS peripheral loader
> +would bring the subsystem out of reset.
> +
> +	clock_wcsscc: clock-controller@7500000 {

No need for both "clock" and "cc" in the name.

> +		compatible = "qcom,qcs404-wcsscc";
> +		reg = <0x7500000 0x4e000>, <0x7550000 0x8012>, <0x7400000 0x104>;
> +		reg-names = "wcss_q6sstop", "wcnss_tcsr", "wcss_qdsp6ss";
> +		#clock-cells = <1>;
> +	};
> diff --git a/include/dt-bindings/clock/qcom,wcss-qcs404.h b/include/dt-bindings/clock/qcom,wcss-qcs404.h
> new file mode 100644
> index 000000000000..df2d6b696136
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,wcss-qcs404.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_WCSS_QCS404_H
> +#define _DT_BINDINGS_CLK_WCSS_QCS404_H
> +
> +#define WCSS_AHBFABRIC_CBCR_CLK			0
> +#define WCSS_AHBS_CBCR_CLK			1
> +#define WCSS_TCM_CBCR_CLK			2
> +#define WCSS_AHBM_CBCR_CLK			3
> +#define WCSS_AXIM_CBCR_CLK			4
> +#define WCSS_BCR_CBCR_CLK			5
> +#define WCSS_LCC_CBCR_CLK			6
> +#define WCSS_QDSP6SS_XO_CBCR_CLK		7
> +#define WCSS_QDSP6SS_SLEEP_CBCR_CLK		8
> +#define WCSS_QDSP6SS_GFMMUX_CLK			9
> +
> +#define Q6SSTOP_QDSP6SS_RESET			0
> +#define Q6SSTOP_QDSP6SS_CORE_RESET		1
> +#define Q6SSTOP_QDSP6SS_BUS_RESET		2
> +#define Q6SSTOP_BCR_RESET			3
> +#define Q6SSTOP_CORE_ARCH_RESET			4
> +#endif
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
