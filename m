Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3C63B1A3
	for <linux-clk@vger.kernel.org>; Sun,  2 Jun 2024 13:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717336183; cv=none; b=fc4QC9HY1uqabvUdCbLGrkrEu1LmYtq0DFq0n3t23ZRzGuGZ8uJtI/heoyPjo3P/sBommgY/nHVFtWVhpcKEqveWeEeAQ8XZjn7g5d82PpVi3ciOhGhsShtOHj79iCKTD93VbffBYIckCtL3De/UI9JbL7h00g2xsR/AQ5WU9A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717336183; c=relaxed/simple;
	bh=OFBLy/93aDcasO+7L2Af/xULO+GOP6Ah177EDibhun0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtvSeohpbFqWrgdTf6cKyLbP8BaMytj+RLepDV8vza1iI2ZsWEPw83WsR6t7AWTWF1/ioeJ3r0zB3ecRK/Tx8AbPKKGw27iMENI0ClmNtl7pjBA63HxJ+9IswVSdH8wWCR3qhGgvEdRXJnHglPJJF4WlR7HVIxc6rapIzCiKjq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LXR6BTbH; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LXR6BTbH"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52b976b5d22so409910e87.1
        for <linux-clk@vger.kernel.org>; Sun, 02 Jun 2024 06:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717336180; x=1717940980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RK+gSspnDvIjQ8g7XKh+hwU9n45tiCyCGsEgB2oOglo=;
        b=LXR6BTbHkE/GeQ+iE/7+lWWLaUBANMlELk2e8im2xKHxF/7032gWxpWpvWS1jAUaOs
         +LLADlmTl/n/uAKsAk5V6AfL9GGI0rEL2htjnDmoRac2pRxucAsx7rn2FITgu1qXLHkZ
         ydzR7dyMWCa5S95WE24E2Uijk4BsdONj1Axc4COCna3k1MFVwfMWF9bDzJWUUP+dRuPo
         oGcNHrLtL5EzvPiz6kWnvD4h7lMoXWTZLxlAwO9mQJtplnpTcbO1yFQ17VqCoAcKqk5V
         dZFDFchgbzL5iBR+d8dFq2UpDZ2a0zPsPt12ZP7/cWR5b4mzEFnm41CZhgY1n3CLMDro
         vGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717336180; x=1717940980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RK+gSspnDvIjQ8g7XKh+hwU9n45tiCyCGsEgB2oOglo=;
        b=LwvVfRxdTM+Lxm8rSpf/HrtaK+ffgRLvDvpKjmgwR6s0QQdxoVDxIvwtIjjE1DRwxd
         he7Z8oywUQR4ofv+pQrWrQv/KmjmmUrTX/x4D6kmv7Y72tpnGSUcCH/dIDMiciuV6ETS
         P3lSzopPkYncu6NtVbCiGG7xtoTqXgagCcwJGlpuLpoRbaeljOrdtO62Ov02a2CAez/N
         vFMJ0fobKwwWTOtg8NseWiBIL8Y8wrFN7K5hd+msM5Rcmp5RUPdsLIX7U1Mys7UQFpni
         he2hHOWSMKHEZPLkPBEnS4cP7+e5WW+YeqsEkhZPNKwu63QaMGgzZDoD4ea5qzGBF5jK
         o8WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF1xGp9CmlCAQNDQgGPF++pKuksVxVd7PIkSWAxXDXfbz8xwN0QxF09MccAOpcTXrNHLjVRtogxEwzM1vskEFalajywibMzQgG
X-Gm-Message-State: AOJu0YwR/d56PF6upA1JgikC+o/mVuXS6DSnln26eLSO4Ksun4cn/YOX
	/47XHdWVA5cpCVWp2v3VZvXxCEOp1SmdSDh0OO4rIqumyMs3MECzYzi7EVYgyH0=
X-Google-Smtp-Source: AGHT+IFHtYW/9mmf4mBFaBwKb2/rlrKnB1nEhfK0SBxsg0mk+z6IYwfe5eM8PmYnq+8HBzEZeU9iBA==
X-Received: by 2002:ac2:4246:0:b0:521:6c38:6949 with SMTP id 2adb3069b0e04-52b896dab8cmr4494872e87.45.1717336180547;
        Sun, 02 Jun 2024 06:49:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d8e557sm956327e87.297.2024.06.02.06.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 06:49:39 -0700 (PDT)
Date: Sun, 2 Jun 2024 16:49:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sm8650: Add video and camera
 clock controllers
Message-ID: <fxh3urdpdugkdgqureddxurgusqrexomi2v4h77enm5ncvoa52@nkh2p7e6dsto>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
 <20240602114439.1611-9-quic_jkona@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240602114439.1611-9-quic_jkona@quicinc.com>

On Sun, Jun 02, 2024 at 05:14:39PM +0530, Jagadeesh Kona wrote:
> Add device nodes for video and camera clock controllers on Qualcomm
> SM8650 platform.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
