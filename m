Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E4316A94F
	for <linux-clk@vger.kernel.org>; Fri,  5 Jul 2024 15:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720192962; cv=none; b=SaxdjobOcCBhGBaHtAZ4XZ91EIOuC7pghXQ2JxqT9X8qzUpsRDmoM6RfWJUcqWl8xmGo1ZhaeP7R8MvfN+mn62WcB/sxZMCquAXW0l87uY7JiF4c51xzesy5OYxHob/fqIFywYBpI4UZr4t3udEpITsIIkAWIaTtCgb3wuJLoyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720192962; c=relaxed/simple;
	bh=trJVAE+RoP6EF8CN/xKUOAM8YNg3UOFcO1h7+fE37nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCdx+AVzWid6X96JmG1acbVYn3jApAg60HAnzxxI83eURFalrade3wmbM1/IWMTvioNLgEJ/3cI7a3Pf9iiSDyiviujw1iIWoXropopVYhDLGdC3mVkeZ3WEwkk9DBw65cdU+csXOVfLJZabBDCoH+qlYhmJ8AeRlTTYJENPL0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o95CgpEL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o95CgpEL"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52e99060b41so1817335e87.2
        for <linux-clk@vger.kernel.org>; Fri, 05 Jul 2024 08:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720192959; x=1720797759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kmz4n3surT4p/OHHh6hdGsaM434nVMtYZWz8qb8y2SQ=;
        b=o95CgpELKoEDhtNHxvAsAQuDSpccE1y2pGTOr3mIckfDfGWtdMadf6sTMelf7wDeJ6
         VTY+bCgjAspUSHwl1WNLCv8VwN7qx39MKa6ZVgHB+L+hab9PIzzgtOcCRiLdhTtoroYf
         nehamwYDHxwI0tj8Ueu0j9au7KsWmt1be82c8WLPB2IEaAeoX1hdZHXj5pW0QlL9A07l
         AkQxCFCKsx2GrFgVPZBWPqV1txlURW1v2WHKuLbQXEuj8cJ77zC0Pm/ppMthaeepxLJA
         jfJLb8Xx1VfKnGsghu+/eIgO76Bu4DWx+4pqMKhXSxsycPjLyhTGOn59aC8GtZTalnL+
         E2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720192959; x=1720797759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kmz4n3surT4p/OHHh6hdGsaM434nVMtYZWz8qb8y2SQ=;
        b=PnD5GgiD/Ec0l0TxQqAa8DKRObaDGCh2l7Gn+k2gSEK5LFNlwPZy1mq4UltXYIy+Ok
         vpX0WvlFHBznLyMJkwhb15gDoFpgnrq9zdKdCXbMIHM7ayWKxEdCGYmkx+TqsEfnUW9t
         HS8jPXHppVs/0ZR8Qs30tRADlfCltYOzwyBboHtQo7n5v6nYr7b+JQFQSuq5G+trAvZ0
         sgMLyjiqRK+kn6fafTh+WYOU59fwDmd3DoEujveEGfC5UYSDTxewmOfzJmmKYgp8U4H9
         YlluspSU94JKvg5fB/TiwmSkUfEHjXjoQL4n4va5WQAXj15p50ne+5wHQp1a/00bIxvu
         uIAg==
X-Forwarded-Encrypted: i=1; AJvYcCWd79g4irL9uN2HukW/t4w02+KrDduiTiXxYdqZ4/pLNkHCJUqtNvNGD20a1q3ViDIIXNpK+FsZsMKE7j0/mRcUFtoz2C6PFSAg
X-Gm-Message-State: AOJu0YzNd/fIC+Co2r6Reilmt5ZrLzTYf5XwOnrC6KYAUX1pKpbUhepL
	4KQcGCdkW2csdG+oJEbLqqSPaYtRqCNWDnhCMM+8tiZsCClOTzC/ECE5u9/EWLI=
X-Google-Smtp-Source: AGHT+IFsOPop7NoEBw9W62eV4h2oCjhPQSgPNuUyP622wEHU5yauItIykX1Sp7uujTy9ASdfeCs+YA==
X-Received: by 2002:ac2:424a:0:b0:52e:9ecd:3465 with SMTP id 2adb3069b0e04-52ea06e3b9dmr3233467e87.57.1720192959393;
        Fri, 05 Jul 2024 08:22:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ea268bf31sm497432e87.110.2024.07.05.08.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 08:22:38 -0700 (PDT)
Date: Fri, 5 Jul 2024 18:22:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ansuelsmth@gmail.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: kpss-xcc: Return of_clk_add_hw_provider to
 transfer the error
Message-ID: <eeekgt77qzq2hgh4xes2gnsuwjftt2movz75uosllhqtir3xyl@zcpx35q6zvpe>
References: <20240704073606.1976936-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704073606.1976936-1-nichen@iscas.ac.cn>

On Thu, Jul 04, 2024 at 03:36:06PM GMT, Chen Ni wrote:
> Return of_clk_add_hw_provider() in order to transfer the error if it
> fails.
> 
> Fixes: 09be1a39e685 ("clk: qcom: kpss-xcc: register it as clk provider")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/clk/qcom/kpss-xcc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry
