Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A411CDA3E
	for <linux-clk@vger.kernel.org>; Tue,  5 Nov 2024 10:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730801261; cv=none; b=UFHIiNbyTv47r+QwnsQKFR/KRW8B1zVp1/0rYUsJyZgdPO9/zHKaZCDEleE1Hn+Rj4YMt4X9I/jXccZ4swUVMko7QnNtLvkOj0htOeh91MYxv0jaSlUcINovdwTj/XZm5TsIYnSAVa+iqUzlPMExNR77nla2BhHT5OYFScrTo/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730801261; c=relaxed/simple;
	bh=fMtVEswXzC5h0ht8PJ6ORa6R3Il+UFZzE6yMyxF4uK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDP/5HOAGxg78ZmmRIA+njIncL7Zz7aB25+LsFGBy2x1jXmiJLR4jD7jmdPFCKLkBZD5OzViV6UsawgjtyHv/oZjNlW9el8ivJ/d6BpGJ3srWaWO3c/WxY8YT5rbH0NRdypSTlgd7RCStn+TUXpFLR4y/TfgXeAR5V8VQxymKAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XVAsz3nq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XVAsz3nq"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d43a9bc03so3581416f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 05 Nov 2024 02:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730801258; x=1731406058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E7TL1aMhlVG35XuLTulpAPfQcuFiOt/1WGf0Exilyv8=;
        b=XVAsz3nq/SJa2hBXDKAUfLEIcYODdevA7eJPyepboD8e4f/jKIFL7088xetwT3/lP5
         jctEge40SoYYSQSnMf58QjSMfUNGxH1/SoNx5tEcrxrkUZKybGCOgXlU0kN5RFo0oCC3
         Eqpo31JA4vXv8vPd99xojW6U+5VR056Q8e01wa/bGNbk6wmNYimeznngVEtGjJRkXz3a
         nCAQMlA4Pat9Hy94ic83ydr9XqYfeinItH+jmgK5j1y/CXrtjX7AI0E+oY0NPbctVKFn
         vuFIyCVhyEPmvdCernTit8Sd089DjzeayUQWgikhtUpAVVHPu6s6iHSS0+VuiB4j1GQO
         QwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730801258; x=1731406058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7TL1aMhlVG35XuLTulpAPfQcuFiOt/1WGf0Exilyv8=;
        b=hWPmYjnYbvelCa1f2+fNL2BWtmdoBmSU2aAekVZb3/g5y9Cjn0vhQCLkPqXJZjAhgl
         fqOUD0c6azLLsLR/RaOG/ng/b6cRaneHPzB2cjP2RUFmb4Ow8/f+nxNY9daNcr2lqMla
         /nPu2A3O+rBB4OLnS2fFla+3OdUs9libfQLY2mGFz5n52gCwvUZ8sy+FkF+g55c1nB80
         MN4gkGvTCHUrK7jATSHNXkRJzXx9HJItQvQ9ALbZPFsFBqa6x85srkZoVnptzYAzNuGM
         dobvNGBTnGsNIGXqiLtsdopClzmb4HpMRjDxjO6By/CpIa1OEMrMZR2/QK+jNT27Dx1R
         Iogw==
X-Forwarded-Encrypted: i=1; AJvYcCWCC+j7+ffj8SWPSidJnIaGsr6/KV+phT9p0nFpFw8i4XltYecKcbnxkqGvpF1LzzQJXb03H5Xno70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx390oAMdDj2mFlIkhq3tbcZkpc2r4Q+8W2IOgBjTZ2z2s5pZv0
	71RzPaIbAEAuxw98TWghn76Jxtcc0Fq/U4yfXc4h/u8TQkZ18iLY/6fAWiqc9l3Bm4MwhljeL71
	X
X-Google-Smtp-Source: AGHT+IFp08JA0sHI8ryKAEOQoPYhek9FFboXi5bXBWo6t1LSCZO8zzE+XPeA0LtcLtKu29uatyq4ng==
X-Received: by 2002:a05:6000:383:b0:37c:c80e:d030 with SMTP id ffacd0b85a97d-381c7ac81dfmr14041359f8f.53.1730801258179;
        Tue, 05 Nov 2024 02:07:38 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e7365sm15483147f8f.54.2024.11.05.02.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:07:37 -0800 (PST)
Date: Tue, 5 Nov 2024 12:07:36 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Yang Yingliang <yangyingliang@huaweicloud.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shengjiu.wang@nxp.com,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	yangyingliang@huawei.com, bobo.shaobowang@huawei.com
Subject: Re: [PATCH] clk: imx: imx8-acm: Fix return value check in
 clk_imx_acm_attach_pm_domains()
Message-ID: <ZynuaPjwYHSWAeAY@linaro.org>
References: <20241026112452.1523-1-yangyingliang@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026112452.1523-1-yangyingliang@huaweicloud.com>

On 24-10-26 19:24:52, Yang Yingliang wrote:
> From: Yang Yingliang <yangyingliang@huawei.com>
> 
> If device_link_add() fails, it returns NULL pointer not ERR_PTR(),
> replace IS_ERR() with NULL pointer check, and return -EINVAL.
> 
> Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-imx8-acm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-acm.c
> index 6c351050b82a..c169fe53a35f 100644
> --- a/drivers/clk/imx/clk-imx8-acm.c
> +++ b/drivers/clk/imx/clk-imx8-acm.c
> @@ -294,9 +294,9 @@ static int clk_imx_acm_attach_pm_domains(struct device *dev,
>  							 DL_FLAG_STATELESS |
>  							 DL_FLAG_PM_RUNTIME |
>  							 DL_FLAG_RPM_ACTIVE);
> -		if (IS_ERR(dev_pm->pd_dev_link[i])) {
> +		if (!dev_pm->pd_dev_link[i]) {
>  			dev_pm_domain_detach(dev_pm->pd_dev[i], false);
> -			ret = PTR_ERR(dev_pm->pd_dev_link[i]);
> +			ret = -EINVAL;
>  			goto detach_pm;
>  		}
>  	}
> -- 
> 2.33.0
> 
