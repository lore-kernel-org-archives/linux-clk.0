Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03ED28FA89
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 08:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753864138; cv=none; b=UjAt7tlxlf0reMw3l4f/BdEdpwzMGrO6KRZ3HbZiRfe8KIFttQCbbT7CdTrQiHbALlYXrljsigke2lYnouFF/KBiQ9opV8NfGZgW/yts5UHmkxZ/vIgj1dRO/22BZgB6nEZ7JLYuF7+7+40T2dH5MpevDEtYZxdJCmlqppsVR1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753864138; c=relaxed/simple;
	bh=1r0lsiP6NFGnYsSI+kcsYV+APIoQCHOYgWvbuEVB5cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLjyxdtXI9ujUQI4b90ZwRPHW0ps1m0J/4uJsPz9xEyn1tUwn+LYt3+tFV3BOPJDS949lsKi9roEQ4YALEWsqvWrktjUMspPFYe0AtO6QNGxDisJ8KJdjm2DELXrPEXh1r+jrEn+VxE1PAdEwp8w2bUVQCY05ErvRae9qazXb5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJIXC2ee; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJIXC2ee"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74b50c71b0aso3790826b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 01:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753864136; x=1754468936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YerKRYt4LpxD7mnuz6omSbAb88Gr2Tk54H8CGOtbvNE=;
        b=AJIXC2ee0SLyJg4Q7rmt/K04rQ/yuITaF6KL8bseDIpuRbI2W0d/3ixxVAOHw8xEdW
         YWBMFkxY87FCAzPgaGwOZjnPZVlnQ74f7sY1k4vs4IJs9xTYHwwAdSIQNW8ZDofma8vk
         vYQlSo10TV+y0NGravTM/AaBE01YQliLDXahIrVn9dhrgeBF+HXmNokTJmDeg6HulHDI
         0Ni1OfVCFC7S990O7phwaibR6bI5zurNwL17z7NJXZ7AtMI7rSmVlxfWunhS+rqTLMDU
         qRviaKbc6rJ72M6nF4fY0vp6zp+HYVHj9bliUBTKu/Jd5+FZgVp8bnMqhM5267E+EQA7
         isuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753864136; x=1754468936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YerKRYt4LpxD7mnuz6omSbAb88Gr2Tk54H8CGOtbvNE=;
        b=nmD6DBT+hoKFBXmnmU1elxPB5yoj+OHJyelmsaT4Zq9LY2MGIprWhfHftnhNxLpe+O
         BAyvBEeLtOnndmEfJxwnrNS1Rgxl4zZq0148hNjyLbVllQrSQAA2nxZ1as6uy8Nl69FG
         q4Of2VIIQ3WE7LXdU20A/XBP+gRd4TBno6nNsB/NiwXpux1xazXbJ+pbuL41IFR8a6LU
         c5v0XIoMKV7T1vUrWy6moEOmFIeFVbePa24OUfLdNrcP6yQGaHLNOrK7c+M/IWOu0VLg
         V7RNrikpRlwQaT+6SQ78V3Rhog0Ee1tODFAYXYWLAp/Uw1JAmO83ODHfC/6Qt9yMtOz4
         Zs3A==
X-Forwarded-Encrypted: i=1; AJvYcCWB9uZKh+TP2sWQbyffPIxMgxwD7KP2uCiQ8c69YthijiOfbvo4xSx0kwTtHM9QdISREFSEL6DQ0H8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2c3Ea8oFO+9LwR2/AzoMTuGiVi5tbqiOzlku5aClaQq6rnCzX
	Z8XcYaL2+UjUblpS8aKjTWGPIp3eQUZn6e9ftWEjZWm0mzMvgLbBo2+zBvE9d68PoLw=
X-Gm-Gg: ASbGncvszPAhzZIjma4naY84vJKHKvYTe3hRfAgANdqXVymsJW0Ov0n+ZDBU+SOeDcO
	pOzrCoCc6h54YFwnl0flGiiLCvkRi9djwKCb+M2t/EPpQ15p1AwG1DDtC4F+IulcXM4fovlEr7v
	YUr/1r6r898QYAXn+yXcvrqipdSsIaf6w4JaFWTF9/RB6QXsLPdMES0BPSvpUypM8d1rXJMwiB6
	ZSv3hFclW+b27XXG0lz+XDNO9V71o9xQHMC7Wo5+tQ4PtvdHuUucwvFH2jkPUPQ3GUdOf+OIcXt
	tBJ6XRwkguGgcCzLORIKQVmtKREYT9qeauvyjd/O/9nMFpcgkv8NZiuH9fJajE3p7pA5BI4GY3v
	qYqsZVG1x7LVVhXOI2taiNYg=
X-Google-Smtp-Source: AGHT+IH0CJhtgQb6pIChZ+X8XZwoN1ESWodJscR6CHa9EpEX0lyC2wpKatW0FkXPKTJsPAVRZjuF7A==
X-Received: by 2002:a05:6a20:9389:b0:232:87d1:fac8 with SMTP id adf61e73a8af0-23dc0eba14bmr4486339637.40.1753864135839;
        Wed, 30 Jul 2025 01:28:55 -0700 (PDT)
Received: from localhost ([122.172.85.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76b8d37eee6sm282359b3a.60.2025.07.30.01.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 01:28:55 -0700 (PDT)
Date: Wed, 30 Jul 2025 13:58:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	konradybcio@kernel.org, rafael@kernel.org, ilia.lin@kernel.org,
	djakov@kernel.org, quic_srichara@quicinc.com,
	quic_mdalam@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] cpufreq: qcom-nvmem: Enable cpufreq for ipq5424
Message-ID: <20250730082852.oxy3tjjtdrykrzne@vireshk-i7>
References: <20250730081316.547796-1-quic_varada@quicinc.com>
 <20250730081316.547796-4-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730081316.547796-4-quic_varada@quicinc.com>

On 30-07-25, 13:43, Varadarajan Narayanan wrote:
> From: Md Sadre Alam <quic_mdalam@quicinc.com>
> 
> IPQ5424 have different OPPs available for the CPU based on
> SoC variant. This can be determined through use of an eFuse
> register present in the silicon.
> 
> Added support for ipq5424 on nvmem driver which helps to
> determine OPPs at runtime based on the eFuse register which
> has the CPU frequency limits. opp-supported-hw dt binding
> can be used to indicate the available OPPs for each limit.
> 
> nvmem driver also creates the "cpufreq-dt" platform_device after
> passing the version matching data to the OPP framework so that the
> cpufreq-dt handles the actual cpufreq implementation.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> [ Changed '!=' based check to '==' based check ]
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2: Add Reviewed-by: Konrad
>     Change speed bin check to == instead of !=
> --
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 5 +++++
>  2 files changed, 6 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Lemme know if you want me to pick this one.

-- 
viresh
