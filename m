Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC5E7E591
	for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 15:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729956931; cv=none; b=eQyCdkInnihIPbhChT8Evvdm6NwqqNQTpD2zVKZkow5hJMOMBhi+4A+G+pDuNIp2XK2Torxv2rbF3B9E1Rswt61ZkTenIW569WLvlgR8AFbKxg+6/CI4x5Me/EFoaa/z/KPwIWsxLjpqclOyqYnqOpzjEaq7JXn+kpeAirc8ELU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729956931; c=relaxed/simple;
	bh=mdQYiaomvhdpmHyQG52noyvqtrBn2stZ76chv5EcHrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1MeTk7Mg3n4rd5X85itGfgTZfC4I2t1ePTf/COzhDviO82f7/0j5lVJ/loOrZRqvdFg31pvn0gHqvxnbnFv/2nDdmsZ+45QhheHHT/JgiHqDIjJcGy9GMMYu7TwmdHbfj/+wRkC2ug05KN3CprkdD8HdadczkYq9fzG0LRMKT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NKms4BM/; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NKms4BM/"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb58980711so27407441fa.0
        for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 08:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729956927; x=1730561727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AlN9+w2bjw2QXGPj8VrPbZ1ah949/Sf5tMB1FO8k3zA=;
        b=NKms4BM/pJICbyp9gW+6u6azWUVp46b+cUrf4zGflR4ZEWTBidQg2c2xEf02mKrmnr
         TPbD8uF48JVUP7CG76VcUaWYV78Gh5gN8prnieo6myFXKHrrE+wf/6y5aeWbaomo5Dvn
         fFVE9kZ138yTlsYjQuZ0oyNIuumH8HvAosm80p5WbnJtCPmD45thb4/4QWdDZeM0Yunm
         k6TKKGHUdG9ngqqaunm6dXQSnYjIGEO2aHwyrjZQMhk9GqcEMaV3wrr3NtD3t9Rr/+qk
         ZruTwNXw/TZ8hq3/HlRIAsYYIPcg0W3WhjLgVqcDQ1v2ZlE4BeXAEzByUsosJ64TQkYs
         dhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729956927; x=1730561727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlN9+w2bjw2QXGPj8VrPbZ1ah949/Sf5tMB1FO8k3zA=;
        b=LlilnGiwgoDV9oJl75wYpjir/wLsGHPxHlPUoMAWvzLze75wryYkLjoYJHpNe7p+g3
         0LjGNo3tHUYvAKBXzayQ+kgUCTrbZMG3zg91zkPGicTkTCZVwBQp/EedpuQYwSqzkBq0
         OJEb2aa+9NgDiDYCNpo55I1BkHAPU1OhF7/8Oqoipl4rQXNSCYkT4BL/04BZmRqfTpSi
         ha6GXIjFTuQE3jRLpx8A1h7HwoGXWQQA3lnYqdD4o30+kCsjmp9wmVkC+clSKSHc/18f
         8yfCd3Gk8zpLpmZt+SwSDWfBGsYjCRBWfXtAzPuhoOQXEfY7lTwAVTrJ2vtgw5O44WWw
         Rz7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOiVRHa/cF2sl2/cqfRJADvxpH5K0Tp4BhGgAT+rayX7VlPFm/GbgqCgbt1rSnZoy1ESjfvdFTxlk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmqYnM9VNX84jAZsdjC+5HCu/jMeV0AmEHU+qBtVadX+aU560P
	XdmPYSvacaLF0pdCuXUS4M96cg5/JHTgJwgJx5QzGeVJ27jx0OhCHTNgTXAJtbY=
X-Google-Smtp-Source: AGHT+IHFYEWMXgj6VaB1nU6COZmgKL9YfaX8XVC/6HlIR/MdBPbuOqcUJzshyzPvpMz35vDw3HHtHw==
X-Received: by 2002:a05:6512:1082:b0:539:fcf9:6332 with SMTP id 2adb3069b0e04-53b348e554bmr1270786e87.33.1729956927414;
        Sat, 26 Oct 2024 08:35:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c98b9sm542555e87.224.2024.10.26.08.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 08:35:26 -0700 (PDT)
Date: Sat, 26 Oct 2024 18:35:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH] clk: qcom: Make GCC_8150 depend on QCOM_GDSC
Message-ID: <zi2wikjtiniqjukq4bgfdpnq5qdh5h2ogkp5vtc6mre4pwmoho@uy25ljyh726k>
References: <20241026-topic-8150gcc_kconfig-v1-1-3772013d8804@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026-topic-8150gcc_kconfig-v1-1-3772013d8804@oss.qualcomm.com>

On Sat, Oct 26, 2024 at 12:58:13PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Like all other non-ancient Qualcomm clock drivers, QCOM_GDSC is
> required, as the GCC driver defines and instantiates a bunch of GDSCs.
> 
> Add the missing dependency.
> 
> Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ab85f2ae-6c97-4fbb-a15b-31cc9e1f77fc@linaro.org/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
