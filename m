Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C891C22318
	for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 07:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724918013; cv=none; b=k5dsPthhLzaY2aSvZjGHXZ24GWzRdBT3xRa1UFBRziBR5kUh4z+inDf7Eigo3NTtXO/Hu5v1pqRtmsSCUjVF1HlBK8kHFaoBXKlqM25h/0F91sFyVqTlRVMZwVzixgLKsXq8nGeVNHQAfFX3WXzR6S/b/PQkMAnUP17QZbG+Ki0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724918013; c=relaxed/simple;
	bh=W3a7fcWo+PgBtFPMvzXW2DFGxj1QeaatlOg1GiAuNAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abvhlvv5ItkLfE6ggM9KxYsFNuDRpamGwfxawaE8sjqVpClIQsdLcftJG5p1Feia4YC9W4t80j+smDLRdShyuLW+kN1/RggHCwDcHhDXknkLgtyApY33pNpCyug0JxpgQCLGTg9lGK3vusdDd5v3WMro1uic0drYN7A5C+3tn/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zo3JL890; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zo3JL890"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42bb885f97eso334015e9.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 00:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724918010; x=1725522810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=InYUyDiltHfYnX1zRpFtWut+hZvc9QSePUy7MTBnp5I=;
        b=Zo3JL890FP4MaLYz0qiqH5FwtBQfy6cmsAOIumaQBxs+pivCLnGCAsEIYGzOoRzUAE
         GTnQgpUBjB9IfwZrMq+N/E2xyrWhRELw6B8AEtBMsJyfAD0iBVWmHgsb1f1NUOsK3haq
         Qk+bmgeLbW1mJYf5a9p2qFL2FSLkwc6AofnDilxJNEizgbBE6KIU+K0s3aB8AGKF15Hu
         Gegzvpp1yYbf2cTrP/UjAvywBFCjPfKGPj1GTQPntP52MbrzQctAPmomgdf0FBZoXnI0
         pQGo+wkkN0TQEL9OtGNFWWPZSa2KBFcxyULgsFeMNRD9n54cy0F7Y/HgdDmidavXEgUH
         PJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724918010; x=1725522810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InYUyDiltHfYnX1zRpFtWut+hZvc9QSePUy7MTBnp5I=;
        b=OSaSohG61FrzohRZgrpLDwd4ssPQON7Hya9ENbbNZAzU5Bp2l98KJpGp2JeMbJj7a/
         kiHiLwxsRpL7MRJyYP81jvOrrMy4j0qC8CfKwsKSIClbY/7dwHL6MN/ObERHTGgUbVso
         IKbw6YMPArwAglJlY3grTvpCptfZGB9DxH9HpJRvCrYzILH00mcH17Tfb9LM07212ndQ
         mdAv3aLo45yMYQwR+h7k6WYHfkWg9UQueDlpQDAq0vDq+pqFbpiOEas1wnE3qJPNBoHK
         vJKemAMkrs3JEC78qCRbdBF2vEphJ3TesWn9F+vk43ZaQt54++6h8/2Nr6kH9aj9lX6N
         E08w==
X-Gm-Message-State: AOJu0Yw8MRrGi6wP4gK5bWIpw+QN66UouwHTRBZSgV3nepnzjQxFJhsM
	4htV+dclBoAfJiAi/5g8HSrh0+P6phIViLrPg9mhlyoy9jo9k8KOhUh4zCX05ak=
X-Google-Smtp-Source: AGHT+IG36wbd/M5Oo2bLRecVz+d/tZ6IYaPfKGqL9VUz1yj12FPMnhEBY5MgAchFiPL25jDtKrOvaA==
X-Received: by 2002:a05:600c:5025:b0:426:64c1:8388 with SMTP id 5b1f17b1804b1-42bb7461abdmr5020065e9.17.1724918010053;
        Thu, 29 Aug 2024 00:53:30 -0700 (PDT)
Received: from linaro.org ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4aa22sm733789f8f.7.2024.08.29.00.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 00:53:29 -0700 (PDT)
Date: Thu, 29 Aug 2024 10:53:28 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, abelvesa@kernel.org, peng.fan@nxp.com,
	Wei Fang <wei.fang@nxp.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 0/4] add NETCMIX block control support on i.MX95
Message-ID: <ZtAo+B0XOE558+93@linaro.org>
References: <20240829011849.364987-1-wei.fang@nxp.com>
 <172491778768.2521946.17064463983702008243.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172491778768.2521946.17064463983702008243.b4-ty@linaro.org>

On 24-08-29 10:50:16, Abel Vesa wrote:
> 
> On Thu, 29 Aug 2024 09:18:45 +0800, Wei Fang wrote:
> > The NETCMIX block control consists of registers for configuration of
> > peripherals in the NETC domain, such as MQS, SAI and NETC. So add the
> > NETCMIX block control support on i.MX95 platform.
> > 
> 
> Applied, thanks!
> 
> [1/4] dt-bindings: clock: add i.MX95 NETCMIX block control
>       commit: 4b78b54762dbfc2f22f28655fa3cf6f5d50de197
> [2/4] dt-bindings: clock: add RMII clock selection
>       commit: b4f62001ccd3fa953769ccbd313c9a7a4f5f8f3d
> [3/4] clk: imx95: enable the clock of NETCMIX block control
>       commit: 42dc425fa8b5be982bcc2025d5bf30be8b26da86
> [4/4] arm64: dts: imx95: Add NETCMIX block control support
>       (no commit info)

For some reason, b4 ty thinks it's OK to mention this 4th patch as
applied, while it is obviously not.

I only applied the first 3 patches.

> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
