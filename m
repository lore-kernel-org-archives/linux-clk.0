Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016D91B1424
	for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722432605; cv=none; b=lNppBRJfCbTeAQ9797Z7c1Gx6OoSFMf8vrfJ4g88QQ0vaR3B6dLhYWRzuIyDgoSVVhcKDAIKaVBcsfi/qjTd9A9jjXwqJQT6kwj4OJi2BvWY8vsUUq1DD69s2rr/VcOALzh+/ko9G4jfWlVZoUF8uHkTfdQWMgrcaB2DW+f8BcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722432605; c=relaxed/simple;
	bh=TryEV3yA8sFKaSQ7T/iEgFWFIg2FZ89jJhsb0Zgqbi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtMwTOH4lW+tVIL5AtOe/woKhsvMOBpR57SOcEafQ2WQpV+xH5bFhxQFeXc4ICRGXdGacoOoOtEXzhT8DF0XVfKW75iEFEfTgUWWWM+lUVbFmPbAgIBMYEO/WNKDwcVlVKbL4Jb7Dy8IxJhRtMacyxN/9+TmjlLsRpyGcA8EJJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VMrxPYkX; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VMrxPYkX"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ef2c56da6cso67444621fa.1
        for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 06:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722432601; x=1723037401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9LAEsWWHOaUu7e2ckya9k4oMqGrC/8Bo8kmjtXWGK3c=;
        b=VMrxPYkXxs9XESjVBGQTDo7FmU9D0B2r1wANyB2IgilvpkYxHRZtUxLOrH1ZqJpWgP
         mbpdW2X2OBo0VQdguq+2vdia2nXtPecspt2v/PlUknHAS7vCkChD9tPteDdw+Yei9PJk
         /2/MZqv3CjluyR1FJ1hQDZgfULzKuA+CxN86WJ5eJEDNrOGaxlWZkgI94HwzXjdpb+S3
         hCHFrI91NN4wsILGxELijBboCFAhIxuY9RXwRfV7kJWwryCxTpJS/PgVmIu/4gUyfDhV
         qgc5/7MAbjkD9vJmVNTJAbDtHbM+vSymCXzy0sxCo+mc6YPC62VlC7Zk4lNDBpyHhVzD
         OmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722432601; x=1723037401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LAEsWWHOaUu7e2ckya9k4oMqGrC/8Bo8kmjtXWGK3c=;
        b=tpkkj+rypJLpammdpSCR84H00hhsqBbCxpBADSxv8YTxCRFn4M25vJGhNH2l/Wv7kE
         elQWLRAo6H6vKkIwHNGXSwlL1T9MHRD/3EtRAvV3dlCoaMyFikumDpn8QSFpX0u30BLh
         4oP7BACL+zzaJrBApc1GVtiu4E8tIQlSLLewXp67Dvn5enb3qwewnx9WQPT+DcB5Nc7Y
         F+KuNfWHTwaulpmrFsfyP24WvxOWzWkuoaEBly6KoDnYc9N0dag9Qx6GWHwaWDKxNmXa
         KX8vUBe1hl9P01PVkl3LbtoJ/9mV5zRi3eXNIgpho5Ar+neLk5cy6Eo9DvIq0ToCk7AR
         cTgw==
X-Forwarded-Encrypted: i=1; AJvYcCVPHI/zbCpfBO8Tm0kWcX5nx2y/IdMzhx7WSrGLaKQQOJoDir2xXyPsjju7uego/cX5++Fjb56jZczfgyxpljlNc9q3W4ynWCWJ
X-Gm-Message-State: AOJu0Ywf7R1i/IcQ/Zv4hoD2pOMTmC2KjPFp8zodZB7Bstb+wmrQ8ApF
	9YOSnrux4Tac9AFjk427KT1awbEl9+K4QEaBYmnP1ih9IDKkwTFyN8yXzhS01/o=
X-Google-Smtp-Source: AGHT+IFhu3uk0FBLVkWyOnfiEusFw+fqZbcmDHLa23kO7nJ3nPVkV2aj02bD2oZHCvbGNofksWO2yQ==
X-Received: by 2002:a05:6512:b10:b0:52c:e556:b7e4 with SMTP id 2adb3069b0e04-5309b2707f5mr10695014e87.15.1722432601169;
        Wed, 31 Jul 2024 06:30:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd0a6esm2278743e87.65.2024.07.31.06.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 06:30:00 -0700 (PDT)
Date: Wed, 31 Jul 2024 16:29:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, stable@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH V3 5/8] clk: qcom: clk-alpha-pll: Add support for Regera
 PLL ops
Message-ID: <5tzuitj6zeqpua45dzabpaaorx6q3x57eiipgrku6lttqhpkaw@zevn4bk6pi3u>
References: <20240731062916.2680823-1-quic_skakitap@quicinc.com>
 <20240731062916.2680823-6-quic_skakitap@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731062916.2680823-6-quic_skakitap@quicinc.com>

On Wed, Jul 31, 2024 at 11:59:13AM GMT, Satya Priya Kakitapalli wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Regera PLL ops are required to control the Regera PLL from clock
> controller drivers, hence add the Regera PLL ops and configure
> function.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 32 +++++++++++++++++++++++++++++++-
>  drivers/clk/qcom/clk-alpha-pll.h |  5 +++++
>  2 files changed, 36 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
