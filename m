Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5102DC43387
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 06:35:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22A9220851
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 06:35:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="GpiYtpdw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbfAQGf5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 01:35:57 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39384 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727649AbfAQGf5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jan 2019 01:35:57 -0500
Received: by mail-pf1-f196.google.com with SMTP id r136so4326734pfc.6
        for <linux-clk@vger.kernel.org>; Wed, 16 Jan 2019 22:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Wbs8Sn8ytExy9GcJegv8BXzSqkcBBzLjSZ6gYSVwpUY=;
        b=GpiYtpdw2EhW3ny+UT8QysvfalFO5c+qiXX01XqVzDVv7Su3Q5sT+iSz4K0tykHmmW
         ymliFJJwtvGJpi7e7gwCJsJTF31chLgglDVvh4Pm1LEOKK5ZqD8XGHnrU4AOwd54uMlv
         ZopfU/eU6Q2nN8xfqRLZi6yg2hfXngJwHmbFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wbs8Sn8ytExy9GcJegv8BXzSqkcBBzLjSZ6gYSVwpUY=;
        b=IQkQqQhbzDz6voFXGMSULcQPuPPPiI9k0wglvs06wxCF6vmXsxUorc/PwXfDc2mdkI
         w2AACwFmOCpDyLoQO9Qd1wEcf90BiOVr+quGoM4z6mqKuW0LsHJrBMj0SIP+/ExwEb5N
         KSHWaJ0nShtqlYe889uSbxjwDZini/BIeCxNvtTWyWOFyBlvoy4BY624gVuV6xKZ0Q8q
         fB6h+FNPQF9MIY199AsrAzYR3yI75Fpjlsck9cYYzJK4d3yAkTiNRIw09yFM9ANKClgI
         bmmGJ5XNWT+LtayaNUS3T2eOQTOvM8/I6DVzge0t1Vm62WiRhIA+bm2xU6PeMEV7MgTM
         cbcQ==
X-Gm-Message-State: AJcUukdOV8nrzwI9JLGabn5MVtFn6bB41hoRA+KJmu5h+NK580W7cW5V
        g0kD/ET6Y6yBtrylnt1gdEcY0w==
X-Google-Smtp-Source: ALg8bN4J88WRw8ANAUjBM0r36g2M8yjSyWL3CjQpu/yKdg3fmjDuFqLtrgOeULRNPMxI2UUdxtCAiQ==
X-Received: by 2002:aa7:8758:: with SMTP id g24mr13494963pfo.250.1547706956811;
        Wed, 16 Jan 2019 22:35:56 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z62sm1058305pfl.33.2019.01.16.22.35.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jan 2019 22:35:56 -0800 (PST)
Date:   Wed, 16 Jan 2019 22:35:16 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org,
        david.brown@linaro.org, sboyd@kernel.org, will.deacon@arm.com,
        mturquette@baylibre.com, jassisinghbrar@gmail.com,
        vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org,
        georgi.djakov@linaro.org, arnd@arndb.de,
        horms+renesas@verge.net.au, heiko@sntech.de,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 09/13] arm64: dts: qcom: qcs404: Add OPP table
Message-ID: <20190117063516.GF25498@builder>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1545039990-19984-10-git-send-email-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1545039990-19984-10-git-send-email-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 17 Dec 01:46 PST 2018, Jorge Ramirez-Ortiz wrote:

> Add a CPU OPP table to qcs404
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 9b5c165..4594fea7 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -62,6 +62,21 @@
>  		};
>  	};
>  
> +	cpu_opp_table: cpu_opp_table {

Please don't use _ in the node name. (cpu_opp_table: cpu-opp-table)

Apart from that, this looks good

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-1094400000 {
> +			opp-hz = /bits/ 64 <1094400000>;
> +		};
> +		opp-1248000000 {
> +			opp-hz = /bits/ 64 <1248000000>;
> +		};
> +		opp-1401600000 {
> +			opp-hz = /bits/ 64 <1401600000>;
> +		};
> +	};
> +
>  	firmware {
>  		scm: scm {
>  			compatible = "qcom,scm-qcs404", "qcom,scm";
> -- 
> 2.7.4
> 
