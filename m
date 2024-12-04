Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214991922F5
	for <linux-clk@vger.kernel.org>; Wed,  4 Dec 2024 22:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733351618; cv=none; b=epr+mEvVs6pMuX/eIEoua9UUjs9cN14eMTWocMZdf1318XFsHa/wfJlPddRFqKkY5jI9egDMwDPSQD0iapq1HPjZmHfGpqWX7B8YhP5hlGYspr44EMA2AfF5qrPSz+qBa7qvEvDAQWx5VbtjcZe0O1DwLb5dtgFjOtpfH3xJ1kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733351618; c=relaxed/simple;
	bh=db+eBbeeOwSwRMrB+GHo1wPKEqzB3v2TTN3uqBqJHZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joYLVpAnNtnJzT/WVibwYq43cgsyKqjbDclXSUVPJD7k3aZtbTNWWNnvo1Tn9B5gSw2NZnzTv+Bu2TDyI5H5fu/jw4LV02NUB3nW2OPoZcSsGlKGkcp1lrU3jCzoV1QwrjGrRm4jcxfNO8rfTuJcwBN49SS3PU8BJi06SEXvMk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yHpxWdxC; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yHpxWdxC"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53de92be287so321792e87.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Dec 2024 14:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733351615; x=1733956415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZA+/Ynbct9XmJ/pDgZLrlz4vByV1+ncrGt31MmPRsc=;
        b=yHpxWdxCKhFt8UvkEe6gcBgdkR5GuDHe2MXgs64CQoTIDiqEINp1+IS+75jyB8JVeA
         afCCTt0k6+RKH17QUILDfBw/eEAejkeXZxIegNkX4yJc9uNoqPkehmvutVj+j1DhiZIt
         9eWH2TwzDUX7MwtZWix0atNcx52WA5tdG4C777T9IHEr1r1yG1ZatiQ+aQnR9dWMH4EN
         Qmsl4qRaDyINAWJb32EcMDgQA8W5CznsVaOVCbijX8v6x2mTD0XjfTpowHYWTR/c38S+
         mMm5744XsH5V5fL+oosf+jw5hIkyRAQIOHrNWU9KFrQAKZX2JhRQOi7mJGjiZq28xPD+
         BNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733351615; x=1733956415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZA+/Ynbct9XmJ/pDgZLrlz4vByV1+ncrGt31MmPRsc=;
        b=MTmfapWlqyL3eajWMttCByHXb8Tx+ULErucxWhGe4ANEqnYAfkDvT+aUAdAXWRiYOx
         vlq24tUkfFkOo52190bhScf8lwCFaYE/ntYdDgjDFqdquemOdVzZ+tS/7jFeArbR6h1w
         w2yqwgYkNF4wNsYmoQrOqsk/X7yKI/mOey89TdjSiE12GElOfIA7qAzA8vr6vSH41MLB
         eR1JYG07SF1SbJGA3sg+L2AKc1/qtzQHH77kydzKUv5jhPBNIyEMD+yPam8RC8RVpfd4
         5A4wW6UQEiinYeBnh87R+n0+dqiJAPfNJ7CP2e9oHRPydyfR5AQCcYpwsFGo3od9bbKn
         D31Q==
X-Forwarded-Encrypted: i=1; AJvYcCXicJyVf0UczoHkGNMcdFxIPpTeyt76bb/fuA75n0K6/Iq/jL51Cm9MmW1n2ZIN92S37jCXIZp/M9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwStQTWZ2wAK/mQUT4nLGlATOD6m1KQIctvlp9Hf3KOAvU/jxft
	gU5IioYjAv97K29encVDDtMAj7S/sbvps5LujOaIdWhLkCtPvOYDE1EandI0UYA=
X-Gm-Gg: ASbGncsKbt8ZlEfx35yucq1wto0TcoyDq+HvMgVB48WHR/3t9SDi6Bqot4J1ZG+0iD0
	HWFbPZ8QHJ9REHLnEeVu0/+x9Xw/5IbY8HYpPzQdUDEfkAAxn2I+rNK/EyZRIYIWo94vZI0IcSH
	8fjv+CJcCconIyX8TROr5qfdOuQoeHK8zm/Tz1v5773Tv5XYxP4XUIv9EY/FgM5XJ+LKPQzH9in
	OWQOqhE9fPwCtb9AIc17HyAJUge2VwijHZ9v9pF/jl9a/rC6uz99uoJeKDcFTAJEM6NW480UQN6
	AA6LEr4ijMc07BweK2ZMbSSgFq3ejg==
X-Google-Smtp-Source: AGHT+IGQS+X6xxLW7rENTxfs/AsPLqM9/viSn6e/WXTrVzgckr92jwEcQHj1cg2TaCS9ztS2W2MXkQ==
X-Received: by 2002:a05:6512:12c5:b0:53d:85dc:7c58 with SMTP id 2adb3069b0e04-53e12a3932amr6597198e87.50.1733351615312;
        Wed, 04 Dec 2024 14:33:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229bada0sm21317e87.168.2024.12.04.14.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 14:33:34 -0800 (PST)
Date: Thu, 5 Dec 2024 00:33:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/8] clk: qcom: Add support for GCC on SM8750
Message-ID: <s7kuwinorqu7i6sdhwqjftcawa65szzze2bhczgpmuqp4dkids@jsa6dthf3omj>
References: <20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com>
 <20241204-sm8750_master_clks-v3-6-1a8f31a53a86@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-sm8750_master_clks-v3-6-1a8f31a53a86@quicinc.com>

On Wed, Dec 04, 2024 at 11:37:18AM -0800, Melody Olvera wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Add support for GCC for SM8750 platform.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-sm8750.c | 3274 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 3284 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
