Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635C817BB3F
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 21:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719005056; cv=none; b=kQq0or9fAX8XpRZfAjE7Or+8w4VU7sQz+pNySQP3wn1teSJFm7OTbrSX/gzv5AIPxLwizdyQYb9idnXOuyiWgLOSJAPmBt/5U24PVA0gZko9Jh9jKb2GbpPuoI+b9f4pNXar7E/Q8w0GC7p8JmA1p3OV90Ww3mzuuxvZFXyvcQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719005056; c=relaxed/simple;
	bh=djuSz5mFeJ9nLAAgzN9ybob+36I/5RNb9wb3vaUsk4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MokAcjkCVfWkvRCWv6WFM5Fpryc64hKvUnB3S49YojP2NuFXuRYaGri5TwXAitpdKvplfHdp1zfIC3b0WC04LQ513utGG1OmT3Ab2DiInMa9vDrts1Tim1SgoLou+w0l8N92ptLPoD8WPYWTwB94y+Vce62wlOQU66ZVYo1ZYyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xtr8C8Sc; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xtr8C8Sc"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ec4a35baddso19248221fa.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 14:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719005052; x=1719609852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R7G/EKqKrp2dVyxr+tqg9qnQl8cmiv7vTyvsidd4q/0=;
        b=xtr8C8Sc0mYgc0rY8AkmgJ8MS57UnyDrbxZZG20KjF1S8dFbGl8/1yZx0BZQvC51vq
         F3pNheYncvetlTgGXP3WCGbj02xYfeKmLWBFXeyFCnexWnZOYz8WBBHvSuoQvn7g2ENq
         jtZ3Z9G0FJKD1QoIqJ3ibT3u6h7xQXAwCukBCKcdYWyOfIudD8u+S7VjQe++W+zDIYKF
         9FUIkR4y8kNq+12e6rLhdpile2c/KGU63JkfyVaHl9YqukB8qLZ5uTvbTv2jQhei0chf
         auB76JSU4BoJDbyr4jXHXwBHGWHwJ53u/HWJxJlM8qb/k7yVXN/GTayrqL5RlRWBXa9A
         YgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719005052; x=1719609852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7G/EKqKrp2dVyxr+tqg9qnQl8cmiv7vTyvsidd4q/0=;
        b=Z7Tf50ji5fHcw6EZuS4BwI7I8U18X3KlEcrgI0t0CdyZWDvvwc6laPG8IKg3eSWveW
         PuocE3WTAJCz7nJRerJqVfhFcsJuTntN1NzxY8VkygZ9K7mDhpokE58uji4BmprEZzDZ
         www2CauzUaAHGh6PdtbNtwluZ+ZyHFXxY4mFhbmI/IeOBemdniLYdotvKquKJYLTswBV
         +yvsvjCLRfu3n/rWzxXwcWAiPh/3nawZWj7/cfFSrSvKuh731FwErZbuaiFQbggjQQBL
         biTIlTyfua/Ax6sD4V8Ob7ZCs605oCQxpB9Co4encno3/ebZlAwQF9HT2p5HqItqlZkT
         Klbw==
X-Forwarded-Encrypted: i=1; AJvYcCU3GE+YFaOhNqe1F7Tc1aT/tskBz9wN6JYIism1HYNX9gJ3knFJ48S1Tk8IlJxxMP/aU39s2yDb6EjryVOKRa12+WETin4HM1C+
X-Gm-Message-State: AOJu0YxCrlWjgGaOn55YikXxcn0zIgklQbE7W3oe0MG4Yhx1TTddRiue
	5/mrkLKkrknkBmfBGCdNtwJutNwhXdPoWnCW0br/t2KQDtdghQ0LBRsI9yauh9Y=
X-Google-Smtp-Source: AGHT+IF8Z/Z3bLdGw7DYlN4GVLk29Ytc+7dRRyw60VtQPf9tmMYsoq5/am5uEr53+Gxt2n5uAi1Qig==
X-Received: by 2002:a2e:b2d1:0:b0:2ec:5540:4332 with SMTP id 38308e7fff4ca-2ec554043d1mr992491fa.0.1719005052412;
        Fri, 21 Jun 2024 14:24:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d708582sm2926301fa.32.2024.06.21.14.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 14:24:12 -0700 (PDT)
Date: Sat, 22 Jun 2024 00:24:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: sboyd@kernel.org, andersson@kernel.org, bjorn.andersson@linaro.org, 
	david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, 
	robh@kernel.org, sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: Re: [PATCH v9 0/8] remoteproc: qcom: q6v5-wcss: Add support for
 secure pil
Message-ID: <62bf3lmbj3gf23x7rgmzhfa7gmpjmwelhspy66j326pudjqlqx@k6owdffe55mz>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>

On Fri, Jun 21, 2024 at 05:16:51PM GMT, Gokul Sriram Palanisamy wrote:
> IPQ8074 needs support for secure pil as well.
> Also, currently only unified firmware is supported.
> IPQ8074 supports split firmware for q6 and m3, so
> adding support for that.
> 
> changes since v8:
>  - Rebased on top of Linux 6.10-rc4

Why do you have so many dead email addresses in you To/Cc lists?

> 
> Gokul Sriram Palanisamy (8):
>   remoteproc: qcom: Add PRNG proxy clock
>   remoteproc: qcom: Add secure PIL support
>   remoteproc: qcom: Add support for split q6 + m3 wlan firmware
>   remoteproc: qcom: Add ssr subdevice identifier
>   remoteproc: qcom: Update regmap offsets for halt register
>   dt-bindings: clock: qcom: Add reset for WCSSAON
>   clk: qcom: Add WCSSAON reset
>   arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
> 
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi        |  80 +++++++++
>  drivers/clk/qcom/gcc-ipq8074.c               |   1 +
>  drivers/remoteproc/qcom_q6v5_wcss.c          | 162 +++++++++++++++----
>  include/dt-bindings/clock/qcom,gcc-ipq8074.h |   1 +
>  4 files changed, 212 insertions(+), 32 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
