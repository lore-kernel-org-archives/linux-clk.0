Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E6BC04EB9
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 14:10:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E92022082F
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 14:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="F9JB56gr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E92022082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbeLCOMC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 09:12:02 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54861 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725918AbeLCOMC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Dec 2018 09:12:02 -0500
Received: by mail-wm1-f66.google.com with SMTP id z18so5982400wmc.4
        for <linux-clk@vger.kernel.org>; Mon, 03 Dec 2018 06:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zZLk8OmqJ8tdp8dvej57iykCxTP7RI8TbT8Mq/Ra6EE=;
        b=F9JB56gr0Mba7VFYiPL2xBI3z+b3JiIo3uXGrjdemRF5odFNmVOmlJY7JcczKVTy+L
         NAwKvNpnznsu3bDTXmm1nxN2XM89sYHGDvThaUhsueFi0TU+Xb3bCGFU5NL6awNoqafi
         a/+8DabGJf1f2zqlSM7MAV4n3ucpbgSrVSj7+ed1O/AVs0tzSBh2j8N/+73iYewnwJrJ
         LAnd5UBpgUPrM2PNk9PqG7ruV0/rKcYopF1kApF67npX3JWmdixuIvHGYfkxy3M83NHf
         CZWNzq2CYa7NegY+liAY+7N9I61gAOmAEvXYusPQS7UfqRFehbSB1czSSszeA/tZWhLN
         tMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zZLk8OmqJ8tdp8dvej57iykCxTP7RI8TbT8Mq/Ra6EE=;
        b=gtxDZgLQpi3wY67R7lYMdfVtY5tZoeiKpKRENKP/B6rajlSQtd12XPtEmTTJ729MFb
         B9JY25SC5fA7h6jY0Hi1eQ1g4GBTmyuxSGgpfUaghQxpgALIXWcWq7R+XQNKxfG1oAdo
         2hypTbxg3SZ1DJBeeDOzIBAxq5EoEWTVJXJtEeXwlsPVI5/CkI/3WT9xnc7FqbXqGUf6
         qYSe8uuKM1rv66p0X9CmQPOPoCpC+qGxeNxpCiay4TSzxfUey+j+HYRw8DPBiAEQlCxn
         59ghkVGqLHxsEC2QvrOMLoKxToMKpgQfmn1kaKRAebCz102QUaZdv3ZYC8YHXZdioR8H
         LI4w==
X-Gm-Message-State: AA+aEWb/uJ/rIhAHJe5k4HNY8yypleqSoCJXUnK+nuOh6u6SNAICkoc3
        IsdEq/M99Su8A4n8/58TsawoGQ==
X-Google-Smtp-Source: AFSGD/WdVTNfm5/h1habuLkaCXtA3/WY/BNFDBLQuNgXIuwTJTSBGrhkPWSAwRH9yS4f31oZZqDfSw==
X-Received: by 2002:a1c:f916:: with SMTP id x22mr8841691wmh.87.1543846250914;
        Mon, 03 Dec 2018 06:10:50 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.gmail.com with ESMTPSA id y138sm6956398wmc.16.2018.12.03.06.10.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Dec 2018 06:10:50 -0800 (PST)
Message-ID: <921f7fbc2091cc7973645d18a5c7e6257a798b4d.camel@baylibre.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clk: meson: add ao controller clock
 inputs
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Carlo Caione <carlo@caione.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 03 Dec 2018 15:10:48 +0100
In-Reply-To: <20181203131850.31388-2-jbrunet@baylibre.com>
References: <20181203131850.31388-1-jbrunet@baylibre.com>
         <20181203131850.31388-2-jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 2018-12-03 at 14:18 +0100, Jerome Brunet wrote:
> Add the clock inputs of amlogic AO clock controller
> 
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt     | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt 
> b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
> index 3a880528030e..c480db8f4793 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
> +++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
> @@ -11,6 +11,11 @@ Required Properties:
>  	- GXM (S912) : "amlogic,meson-gxm-aoclkc"
>  	- AXG (A113D, A113X) : "amlogic,meson-axg-aoclkc"
>  	followed by the common "amlogic,meson-gx-aoclkc"
> +- clocks: list of clock phandle, one for each entry clock-names.
> +- clock-names: should contain the following:
> +  * "xtal"     : the platform xtal
> +  * "mpeg-clk" : the main clock controller mother clock (aka clk81)
> +  * "ext-32k"  : external 32kHz reference if any (optional)

While chip like the AXG have only 1 external 32k input, the gx family appears
to have 3 :( I missed that detail when preparing this patchset. Please hold
on, I'll send a v3

>  
>  - #clock-cells: should be 1.
>  
> @@ -40,8 +45,9 @@ ao_sysctrl: sys-ctrl@0 {
>  		compatible = "amlogic,meson-gxbb-aoclkc", "amlogic,meson-gx-
> aoclkc";
>  		#clock-cells = <1>;
>  		#reset-cells = <1>;
> +		clocks = <&xtal>, <&clkc CLKID_CLK81>;
> +		clock-names = "xtal", "mpeg-clk";
>  	};
> -};
>  
>  Example: UART controller node that consumes the clock and reset generated
>    by the clock controller:


