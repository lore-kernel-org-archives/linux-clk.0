Return-Path: <SRS0=VWtO=PX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BDAC43444
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 18:09:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90FF420859
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 18:09:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="aHNcS/Fv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388678AbfAOSJ0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Jan 2019 13:09:26 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41364 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388673AbfAOSJY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Jan 2019 13:09:24 -0500
Received: by mail-pf1-f195.google.com with SMTP id b7so1671289pfi.8
        for <linux-clk@vger.kernel.org>; Tue, 15 Jan 2019 10:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y6TTB+eemP3Hcp3LaqkLpOf1lv5h6166hexbAp+ECE8=;
        b=aHNcS/FvBF2LrCqjiWo/PRfEg7GV17JJZlC+Mg+xA86EhSxF2ZJpr0/gVpBOqAeifB
         nK9l7O2MeV7H0vc/mJfHUJ+sOgHb3l7g45byhlNYWBhEAt684w2bN74HJsFVLz/gl0fs
         8fFIrL1L3k1/jhYyzyoj8P53j+xSw+iSnre0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y6TTB+eemP3Hcp3LaqkLpOf1lv5h6166hexbAp+ECE8=;
        b=uNQyZ8WhDAiXNFsFD6OejjGWzFdXRdtrbISrleC7GYZN/TEprMyRR+/fz69MAPUgKp
         JJO4UowFiinOzB4y6k6Inz4u3lFOydiH8b4tq2pi1OzFvZbhK/iNzuje6Bk/K6nfpyUZ
         tT2YXphbgNHwdYsN0hy8qjpdW5yQlE2apx9oWGTHYtSXa5sPVsurgYYBtTAhAOO2yspg
         ERdcY1pEN0j6/zyfdX3iFI+AZovUshrJzlJSMmyrj995BiRDJxbYXyeG1Z0MBzB3ODp0
         ynrEgBQpEO5A+CoxG3679uPI7+bRWN0DbzqUTS14u6LDfJp+J7Wzi4lm3nJpCCV306W1
         IOng==
X-Gm-Message-State: AJcUukdCUgxOos3YkMb7Yx6wD3xWO+hdvg0/kDjc6nItS/FDGATt5eZI
        c86wXG0r6Ozz8V91ZtnP6Jt3Wg==
X-Google-Smtp-Source: ALg8bN5MpOg+sPL+2BhEZEcoaguE29O+MUxOJikzSIHVRvJgrr7eBampLHGORRICe6dhy75xBEWubw==
X-Received: by 2002:a62:f907:: with SMTP id o7mr5228103pfh.244.1547575763679;
        Tue, 15 Jan 2019 10:09:23 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z191sm4372963pgd.74.2019.01.15.10.09.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jan 2019 10:09:22 -0800 (PST)
Date:   Tue, 15 Jan 2019 10:08:39 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org,
        david.brown@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        kishon@ti.com, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: phy-qcom: Add support for msm8998 usb
Message-ID: <20190115180839.GC28907@builder>
References: <1547483771-5334-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547483771-5334-1-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 14 Jan 08:36 PST 2019, Jeffrey Hugo wrote:

> USB on msm8998 utilizes the QUSB2 and QMP phys, similar to sdm845.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt   | 5 +++++
>  Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> index 41a1074..6061b6f 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> @@ -9,6 +9,7 @@ Required properties:
>  	       "qcom,ipq8074-qmp-pcie-phy" for PCIe phy on IPQ8074
>  	       "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
>  	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996,
> +	       "qcom,msm8998-qmp-usb3-phy" for USB3 QMP V3 phy on msm8998,
>  	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
>  	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845,
>  	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845.
> @@ -42,6 +43,8 @@ Required properties:
>  			"aux", "cfg_ahb", "ref".
>  		For "qcom,msm8996-qmp-usb3-phy" must contain:
>  			"aux", "cfg_ahb", "ref".
> +		For "qcom,msm8998-qmp-usb3-phy" must contain:
> +			"aux", "cfg_ahb", "ref".
>  		For "qcom,sdm845-qmp-usb3-phy" must contain:
>  			"aux", "cfg_ahb", "ref", "com_aux".
>  		For "qcom,sdm845-qmp-usb3-uni-phy" must contain:
> @@ -60,6 +63,8 @@ Required properties:
>  		For "qcom,msm8996-qmp-pcie-phy" must contain:
>  			"phy", "common", "cfg".
>  		For "qcom,msm8996-qmp-usb3-phy" must contain
> +		 "phy", "common".

Odd indentation.


Apart from this, you have my

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +		For "qcom,msm8998-qmp-usb3-phy" must contain
>  			"phy", "common".
>  		For "qcom,sdm845-qmp-usb3-phy" must contain:
>  			"phy", "common".
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> index 03025d9..fe29f9e 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> @@ -6,6 +6,7 @@ QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
>  Required properties:
>   - compatible: compatible list, contains
>  	       "qcom,msm8996-qusb2-phy" for 14nm PHY on msm8996,
> +	       "qcom,msm8998-qusb2-phy" for 10nm PHY on msm8998,
>  	       "qcom,sdm845-qusb2-phy" for 10nm PHY on sdm845.
>  
>   - reg: offset and length of the PHY register set.
> -- 
> Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
