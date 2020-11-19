Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 035C5C2D0E4
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 13:08:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93AD122242
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 13:08:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PG79Cd2+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727214AbgKSNIE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 08:08:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgKSNIE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2020 08:08:04 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5563C0613CF
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2020 05:08:03 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id k2so6420970wrx.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2020 05:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NAAhUY2tM6ccKrXkcBtqk0m/OvCIAeKgaA0HqteL1I0=;
        b=PG79Cd2+DS87+UbCdfN6jpDWbVaod5BtQSjCj61EzVjP1VUK8LXCEXI/PeFKyjY/S4
         tQItAEndiGIas89tJp1G9dAT9S0ezpFd3rYXXm0O0rwZ3DJMGdERGeEwL+3HuWs6pVei
         ebjNS73aTYfXhFb428Z8Dr3fnlB2vlKX4DYf7xbsmC9IWgnR5H8u5eGGol3mV/bBXEIK
         xIIvL3rNv3vRIhtOrPgQew4ff0EsMtlUxYYaltDJARQh1rOyrxem+m6oVDv9FCxXXGZM
         dYzR6hePTiS9Fighpzk0ve2L7/YM2uGquWEw4F4SNBznfhowNeIMMAI58kbiIz3X6i8P
         +S0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NAAhUY2tM6ccKrXkcBtqk0m/OvCIAeKgaA0HqteL1I0=;
        b=KSHvlbkbZGlUWzYOTWa8oPqB+6nXzDQYy+cMyzcWLdAOHHGbZuCUuqRrTZPgxFgvV4
         9EFqxSS5d14A3FUZO743OXAmOL8ttZRNNDSI1o+Mmsxn9TAxqCGIiFV8nCGz+CUNSYir
         AXuBedw+NRJ9vgkHF2VFlQuRugLSZRO4k+pFOQjTdFj7VefqxS6sVhkcOAWNlZWcSGGy
         zxitvIgKBOOG7FwA1mtV6GnRVdGUV6jSw0uFjZ6T/ZhBzoHHcqvhVdhYY/6tD2ZLvoKv
         SV5eG/Qi/6UgmtUsb0pgnlBvyWRIcXdds/jSzZorkZ2Ycrds0VoZAUS2fVeM51p/TGZ3
         UoAg==
X-Gm-Message-State: AOAM532kX6z5PdYCv6VGqLyeoeiGlQqBbMlm6aMV0Ln2a4y0nea91BLM
        HeiFXk23e+nXSMzaZJW01VM=
X-Google-Smtp-Source: ABdhPJyRkQNmzdhTeBG5EQU3yUtO88iu9J1mhAHp8khiEBq3vwcR16ROHW5b/4pH2X3bgBm1H6HhSg==
X-Received: by 2002:a5d:634c:: with SMTP id b12mr9938661wrw.130.1605791282471;
        Thu, 19 Nov 2020 05:08:02 -0800 (PST)
Received: from debian (host-92-5-241-147.as43234.net. [92.5.241.147])
        by smtp.gmail.com with ESMTPSA id e6sm9440028wme.27.2020.11.19.05.08.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 05:08:02 -0800 (PST)
Date:   Thu, 19 Nov 2020 13:08:00 +0000
From:   Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/1] clk: imx: scu: remove the calling of device_is_bound
Message-ID: <20201119130800.boyqn4rtczq4wcvn@debian>
References: <20201119114302.26263-1-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119114302.26263-1-aisheng.dong@nxp.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Dong,

On Thu, Nov 19, 2020 at 07:43:02PM +0800, Dong Aisheng wrote:
> The device_is_bound() is unvisable to drivers when built as modules.
> It's also not aimed to be used by drivers according to Greg K.H.
> Let's remove it from clk-scu driver and find another way to do proper
> driver loading sequence.

Greg was asking to use device_link for this issue. Have you tried something
like the following: (untested as I dont have the hardware).

diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index 5b3d4ede7c7c..9ae6c768ea05 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -25,7 +25,7 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 	u32 clk_cells;
 	int ret, i;
 
-	ret = imx_clk_scu_init(ccm_node);
+	ret = imx_clk_scu_init(ccm_node, pdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index d10f60e48ece..e834bfadc2a6 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -151,8 +151,9 @@ static inline struct clk_scu *to_clk_scu(struct clk_hw *hw)
 	return container_of(hw, struct clk_scu, hw);
 }
 
-int imx_clk_scu_init(struct device_node *np)
+int imx_clk_scu_init(struct device_node *np, struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct platform_device *pd_dev;
 	u32 clk_cells;
 	int ret, i;
@@ -173,12 +174,12 @@ int imx_clk_scu_init(struct device_node *np)
 		 */
 		pd_np = of_find_compatible_node(NULL, NULL, "fsl,scu-pd");
 		pd_dev = of_find_device_by_node(pd_np);
-		if (!pd_dev || !device_is_bound(&pd_dev->dev)) {
+		if (!pd_dev || !device_link_add(dev, &pd_dev->dev,
+						DL_FLAG_AUTOREMOVE_CONSUMER)) {
 			of_node_put(pd_np);
 			return -EPROBE_DEFER;
 		}
 	}
-
 	return platform_driver_register(&imx_clk_scu_driver);
 }
 
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index e8352164923e..14e2baf14757 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -13,7 +13,7 @@
 extern struct list_head imx_scu_clks[];
 extern const struct dev_pm_ops imx_clk_lpcg_scu_pm_ops;
 
-int imx_clk_scu_init(struct device_node *np);
+int imx_clk_scu_init(struct device_node *np, struct platform_device *pdev);
 struct clk_hw *imx_scu_of_clk_src_get(struct of_phandle_args *clkspec,
 				      void *data);
 struct clk_hw *imx_clk_scu_alloc_dev(const char *name,

--
Regards
Sudip
