Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB5515AD9C
	for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2024 08:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724833894; cv=none; b=meWR7G1UzhDx3utrVGn1gV2Db5ePsXL8MuhYtHBatIQ/xVcl6Vd+ZIn6WVqhn6mrUtspKU7jzG8fJBmqiu8VhOrrR+fe+u3uuYzG7ryEJZtwXv7mMtYPncH6//GABXwMfDudGEcELt4GmZVX+zoueg5+4evFK53D3mwC5z4PwEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724833894; c=relaxed/simple;
	bh=gjsYJdp7ScKwKcIE4Uu+ggF9Axf9/49wqI34k9cojGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUxCruB6bL4265D4JHOITZT+5dKllv6aEpbxH6vWj3SKf0+NwczN0dqmKHc0Rtn4eL31h7aNsOJnjR4UUsqXV1VmuSlDIhWZuoNoWpfUDYgC1+r8xK6qg8NAuJUEfvHDbdPoYMEedZk1F69o29QWx0UVd+mIJ7ieO9F58wwDarg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Od8zZ/85; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Od8zZ/85"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7a81bd549eso503739366b.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2024 01:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724833889; x=1725438689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3c7NVkKcmxAMyio8/L9pzMWp9IJ9Pqc+LaOhJRGv9yg=;
        b=Od8zZ/856Oi5TpVaYDkGZl1v7MlQe3rFlqAlgbHVyhBtC3AVHUpmdIL9uoWs7Zo9NN
         C0nuKtBEDyzTsyNvFE5g21D9KdDAEC68W2xKO10WIOMAKx3at6fJxLgXF+x3S3wKkKgv
         GDCZD15PsJvI1pt1tZRT9Fd+4P1icFD8w86cos+6iUnsCSnfbpB38eqhFN3szRrZ7GvJ
         IZLyrpllE0i+06QLhXWIH4g1uC9FAHOHBmU6eMil/w9F5wOqQKGHJ1ZBp5OJLCTiPP57
         c4XzMTtVG9zbZgZOxv2AjWc4aEupisZfBveJasUjec8PlYgrO9cj16QqxhXTDy57mvDf
         O8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724833889; x=1725438689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c7NVkKcmxAMyio8/L9pzMWp9IJ9Pqc+LaOhJRGv9yg=;
        b=PddHbGVZ7dw70NsD3RWyySG2yBUvR88wvjXPXjF/5/59slrg29x89vsSwSciUyWnE7
         ZKevld0hSpKMX7uJq7GZ+1QQe65qAljVsHwGEJjUQWGACJD8aToSnPipYFNJInh6P40Z
         vhMuMeAZXj3G61AsR5j4S0tzGqyNO0W4Ui52hMpoH7pahJUWuhQMXobeQ2t7kdX2HpVZ
         PqU2oVw8c3IBlcdTix4l2HSklmf6pmIags6SuhOdIDC5c4gs2oYO0+j3zCNChxomzgqK
         FgGixkKRn/aLfYvf6njHvwBSoCTSQLIOP5o0F3DPx81Z3YylIUF5UGAEnbav14Qb8It/
         ozKg==
X-Forwarded-Encrypted: i=1; AJvYcCWIOAbLxd7S2CF+iBh7jWmDSCb9XJ0hFJHrUMjlrO5bRzW1ub5LGmLsbt3/fdLSl+DNRc/mfLVqPLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCbXPF6b64oIaINFIYFoppDHTDskANCt3G09EOaEFMdEeKstle
	KD0rK9y5HJcvhm0N6wa5bS7SasXW/geOeDUZnwugbmFcW4esNodFbB5rke9qPy8=
X-Google-Smtp-Source: AGHT+IGObeLl3j0bnFYb8shzD2k1t7YBRB0S+K2t7vP1NBHH1oO3NjvEy1RtpFlfZhpgj6jiJ48fgA==
X-Received: by 2002:a17:907:c0f:b0:a86:c111:cc35 with SMTP id a640c23a62f3a-a86c111cfb5mr901917966b.50.1724833888846;
        Wed, 28 Aug 2024 01:31:28 -0700 (PDT)
Received: from linaro.org ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549d10fsm212595766b.54.2024.08.28.01.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 01:31:28 -0700 (PDT)
Date: Wed, 28 Aug 2024 11:31:26 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Diogo Manuel Pais Silva <diogo.pais@ttcontrol.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	"abelvesa@kernel.org" <abelvesa@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"EMC: linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] clk: imx8qxp: Defer instead of failing probe
Message-ID: <Zs7gXhohOyQ/abOf@linaro.org>
References: <DU0PR01MB93828B0E6808E33C608BC0E29DD32@DU0PR01MB9382.eurprd01.prod.exchangelabs.com>
 <AM6PR04MB5941651E3920794104B3D24F88D32@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <DU0PR01MB9382F1AC496F22A20C074BDE9DDC2@DU0PR01MB9382.eurprd01.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR01MB9382F1AC496F22A20C074BDE9DDC2@DU0PR01MB9382.eurprd01.prod.exchangelabs.com>

On 24-07-02 08:10:44, Diogo Manuel Pais Silva wrote:
> When of_clk_parent_fill is ran without all the parent clocks having been probed then the probe function will return -EINVAL, making it so that the probe isn't attempted again. As fw_devlink is on by default this does not usually happen, but if fw_devlink is disabled then it is very possible that the parent clock will be probed after the lpcg first attempt.
> 
> Signed-off-by: Diogo Silva <diogo.pais@ttcontrol.com>

This patch doesn't apply cleanly.

Please respin.

Thanks!

> ---
> v2: change from dev_warn to dev_err_probe
> ---
>  drivers/clk/imx/clk-imx8qxp-lpcg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> index d0ccaa040225..7bd9b745edbe 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -225,8 +225,8 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
>  
>  	ret = of_clk_parent_fill(np, parent_names, count);
>  	if (ret != count) {
> -		dev_err(&pdev->dev, "failed to get clock parent names\n");
> -		return count;
> +		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
> +				"failed to get all clock parent names\n");
>  	}
>  
>  	ret = of_property_read_string_array(np, "clock-output-names",
> -- 
> 2.34.1
