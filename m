Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A85939856
	for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 22:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718920937; cv=none; b=d4V5E9xs0kt45P9OnfiyH85okDXPzh7MfyBh/oRHXu8pFl+1NcUmsdakqa9fH3QV3tHMrZWTdF/NEzchkUApoWICU3Nz1EVWimIp2Q2xHT89FhD9kjsjGFY9SxIEmzg9yFDO4nrGgM2PNAAefrbpy7BeAy5S871fXqhyDnyKyZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718920937; c=relaxed/simple;
	bh=cVyiizOMpbxPQwsjbb6rA1f7tDSv/WNh3+4LyrUGEPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPNEa0ybaKes1PLWq6e86EcYZFoMXBDKTl/CA8edxsRbuM/ppH2PZ6bL2k6HONYP6wY5iXRZ3RlmNNN/pULCe9rF1/G7kNGD98z9y9i3LsLT4QfqTCGY2bcRgVIIu9JTHGPjwJHOlkEe13GCK4jqpQWBblttMScYlVP9EQMv7io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vurjd+Ie; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vurjd+Ie"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52c8c0d73d3so1445252e87.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 15:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718920933; x=1719525733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6x5JCj3/cyNXFKJV+WGiz/xYC6JqEgOZmnqVyLRPaAE=;
        b=Vurjd+IejdZcBWL1hbFKz/gbYUzpMGFixKx9DCvgH5W4QouPZVhaiP/8d7Tk+aepZx
         XqJxDywzZ72MdjdtKUzf+5Q/wHm9h6A/BZjQHzDGHMNl5Z4ghSsvZ9xIiiDog8hEmxjk
         ONW4l0yxwzHIlISK/MgKAxiLVfdY8cU81ym9RPgcHsxtvC1a66aHl3kn6hFXqDGfCcue
         Bv11krrpVuxstBhZQdz7P0lTCLhgXlyDoXyHEBLIpVpXd+ecDAdbEZL5yCu8cWlKMtTu
         y+LX/eTN/zmRjH6JsjNip5hz7Zh54nKxhqDNnyUfntM6tHOklRdaRtLOc/D1wGvhQ9cF
         LPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718920933; x=1719525733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6x5JCj3/cyNXFKJV+WGiz/xYC6JqEgOZmnqVyLRPaAE=;
        b=RbpsxCiYp5G+zjzZl/Q6siWBnMM998zmoJcaSUo3eD4Jo0y3mElC0ljjOh0X3oq0t5
         bCBByz6uCt1Ko0lBMHYw2jDYtwVGuxWAI4gV2izqR2Kf4bRU0Yo8yRjk/O9pSDUlKmO4
         hRMd+EA1LIPtQ1FGr7pZhG4TSVu8S3gBy52nnp4sGtCqsv3v+4dxlTjdNz4++OSpmFo9
         vwT4niAf+72MOjEQ8MXzcXVOVKkIlK7NWMgGrYYLaXxY+K9AScokcAUNeRap8xbcK/tn
         ET8lvjVcIrgSFYrd8yGCiFyQLotSDQB8Qg+xNIep+vuru2sdmBAICumwwuh0yvaE5Iw0
         uC7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVynVkF1/t2lJvK9+412F1P9SmASR3WYHftRds/ngSz0DuVeyVdhv7nmIF9sjjm74Gs2c0XO/4/dCHJMpEQeGWZXO4pDkN2zSXe
X-Gm-Message-State: AOJu0YyzmDcG5XVc9EM6V5qyE4L23jXx64JNonCyOfAjUjOs/2y8ZKha
	4XtTftErEEldg8j/Ke4wTWbibfho9ClukcAluc+RIRH/MxNO7T6JUyftYWstXhg=
X-Google-Smtp-Source: AGHT+IFQmq8YG3yD7xXewOG2w2nkOzpMucoN+8L5aSkle3PekvPaef/va0KGBf0ODMADUcswyxVPDA==
X-Received: by 2002:ac2:5f87:0:b0:52c:d639:dd4b with SMTP id 2adb3069b0e04-52cd639ddedmr40338e87.23.1718920932622;
        Thu, 20 Jun 2024 15:02:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd64496eesm6739e87.253.2024.06.20.15.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 15:02:12 -0700 (PDT)
Date: Fri, 21 Jun 2024 01:02:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chukun Pan <amadeus@jmu.edu.cn>, 
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 1/2] clk: qcom: gcc-ipq6018: update sdcc max clock
 frequency
Message-ID: <gps5nwdwhf2mnjfvae7gnnahtiu53tkqkoqsip75xfrabls7b6@zhmhihx7vhxo>
References: <20240620150122.1406631-1-amadeus@jmu.edu.cn>
 <20240620150122.1406631-2-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620150122.1406631-2-amadeus@jmu.edu.cn>

On Thu, Jun 20, 2024 at 11:01:21PM GMT, Chukun Pan wrote:
> The mmc controller of the IPQ6018 does not support HS400 mode.
> So adjust the maximum clock frequency of sdcc to 200 MHz (HS200).
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Fixes?

> ---
>  drivers/clk/qcom/gcc-ipq6018.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
> index 7e69de34c310..6c764e3e2665 100644
> --- a/drivers/clk/qcom/gcc-ipq6018.c
> +++ b/drivers/clk/qcom/gcc-ipq6018.c
> @@ -1617,7 +1617,7 @@ static const struct freq_tbl ftbl_sdcc_apps_clk_src[] = {
>  	F(96000000, P_GPLL2, 12, 0, 0),
>  	F(177777778, P_GPLL0, 4.5, 0, 0),
>  	F(192000000, P_GPLL2, 6, 0, 0),
> -	F(384000000, P_GPLL2, 3, 0, 0),
> +	F(200000000, P_GPLL0, 4, 0, 0),
>  	{ }
>  };
>  
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
