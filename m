Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5918513CA97
	for <linux-clk@vger.kernel.org>; Tue, 18 Jun 2024 14:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718721193; cv=none; b=GF/llyhwKgZUgb1LXlIoibqoLNtI/BIrx0JOOVdg0uRI+GGdQ8Fp2sIttoXyIkONERTnrtrNTIbu3qS3EIGo0LMc2L8deipdYBdSwDlbJe8ir1U6Ml/qBGt4geT9fP8wt7xi1/W37DdfjfwXDVsqx7QCougkYU510Fpq7FzGsFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718721193; c=relaxed/simple;
	bh=1uclk27162No5C6YVhRORLMRgBplWKGOIFoaR7DHLpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZErCbft+Edr/FFrojIOVEibnjYYnl/3gH5tvvi0T9gG1CCZFsWCrx3BlNz6B/eGy9gi5QzWbF0MtAIyRh0lGN4/y9gMw17zB9oCvHPm3rRW4/bFmcbprVwRissc0KCoYr+xRJAFFqwgc7XNfTwOO7q1md5evR6RRDlPEaHC/O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FXXxyAH+; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FXXxyAH+"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52bc0a9cea4so4825100e87.0
        for <linux-clk@vger.kernel.org>; Tue, 18 Jun 2024 07:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718721188; x=1719325988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MeKlo2c/wPe7HMPiv6tGRU6PP+qdrCpRbKZmuqxx74A=;
        b=FXXxyAH+Me9S0YFVmz8a0E1WOy09yqJUpEbAuI5HG9MLBOnPS6dKPXI/m6vh3dZDp4
         Ea/EEq/JEFD+lCQNIC0DBBD/NKTUI98BS4nffnSbsoWdMESq88ZsFjW+nfPCfYEvRroa
         t92khjbXP4iHPbgdcVeqFbappadc1k8yGjJW/FjelKsJHj/sbwf5Rgy8rOOvL9upDH1B
         wyq6OLPP+58/spwch/aKw0Wpzil7BtHnpXtY+Ogb3QbB3bZQwWuseQsyTA8cCECdXT8o
         LtQzk5LHXWsqZBns9XEG8vkVN8S/uGRCvet0gDGNAGo+NRyNnMYUMbvmb5EgsZceNHVN
         tPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718721188; x=1719325988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeKlo2c/wPe7HMPiv6tGRU6PP+qdrCpRbKZmuqxx74A=;
        b=K4pzuZEJuaYR++m31ghCIbSAtTu72PL8BI+5c4yu5X3eUaMXQChySZYexUr+afGgy+
         3MdAspRReAC63QLMAUgBP1WZsRi61oaIKOh0BifC6/JxIvpeSQFlJUQdeMdjIC4kAytn
         36fYTvFAxHEyM38Eb9qw808wyiibclxJSsGuIicEKWm5rpR+XBlijfYPvYaXVXK9NoAI
         KPJpUf8uG6UHt6IedN5ZZTHjElt+Ymk1/eG51q7esGPaVlsrLDeYZNzAnJ4d+QPGEB7o
         IpEOg+FB8NNVsecbmvbnf3Z41zev+LocFfF5AG8dg00PBYRwgcUWz7Ns5f6ljaYtAuj6
         TKRg==
X-Forwarded-Encrypted: i=1; AJvYcCUtHgjASzNwJc02/NzcNxF07Fxwb6cDiha1krApRuy7PdS+qhe44YbRRD2NwwvLEHKqCUR0+4GJDAiy2dxg8GXt00yT2ozTCx+X
X-Gm-Message-State: AOJu0YzkqgK0+UEw+Xbj+4y/h+482VOc/vkV1jl2XALNkYyU72y3yGvf
	5MtBcgi/Za/WZp6Gy4dlgYFP/CGGhv8UtZOyG/0poQJjlc8IbJxYHdfKhatAmHk=
X-Google-Smtp-Source: AGHT+IEpc4WisyaLGnyyDP2DsG3mH6xTLPLHzgbkfUQ6D8wsp4gW1Eyt6iWP6o9lJ0JWRyoGq1IN6A==
X-Received: by 2002:a05:6512:2034:b0:52b:96b0:4e1e with SMTP id 2adb3069b0e04-52cc47d4770mr660841e87.13.1718721188557;
        Tue, 18 Jun 2024 07:33:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca288804dsm1563550e87.262.2024.06.18.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 07:33:08 -0700 (PDT)
Date: Tue, 18 Jun 2024 17:33:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: neil.armstrong@linaro.org
Cc: Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sm8650: Add video and camera
 clock controllers
Message-ID: <fr4j6gignu7ll4nhur65asj35rbsbzr3w4xtxq55jxcfcmb5nh@l6l3qyhk7qmw>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
 <20240602114439.1611-9-quic_jkona@quicinc.com>
 <3ad2d00f-6b5f-46c5-b95c-c8d68e8be736@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ad2d00f-6b5f-46c5-b95c-c8d68e8be736@linaro.org>

On Tue, Jun 18, 2024 at 02:17:23PM GMT, neil.armstrong@linaro.org wrote:
> On 02/06/2024 13:44, Jagadeesh Kona wrote:
> > Add device nodes for video and camera clock controllers on Qualcomm
> > SM8650 platform.
> > 
> > Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> > Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/sm8650.dtsi | 26 ++++++++++++++++++++++++++
> >   1 file changed, 26 insertions(+)
> > 

[...]

> 
> And add the missing required-opps for the clock controllers like
> dispcc.

Unless the opps is required because cmd-db has lower level than
required for the functioning of the device, there should be no need to
add the required-opps.

> 
> Thanks,
> Neil
> 
> 
> > +
> >   		mdss: display-subsystem@ae00000 {
> >   			compatible = "qcom,sm8650-mdss";
> >   			reg = <0 0x0ae00000 0 0x1000>;
> 

-- 
With best wishes
Dmitry
