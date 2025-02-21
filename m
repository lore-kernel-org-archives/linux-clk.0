Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4744A433DE
	for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 14:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740147079; cv=none; b=HYxyjUtPDE7lTKPHUwZ2W5RMjo4VeboFDTZK9HlSKfKAFe13ESqGWcRLCuoYsH27++Tzd3UFu8vUj/bIa6US6xgiu+7rDjuV68EV6Glx9HBGPbI6eMeNiqr0I9aUKOiReScfrm1V2aAINeRZaCjM9PanG/6pRi6WvUgbf/bqVro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740147079; c=relaxed/simple;
	bh=do6kcs4VaPfIUQ4XmVGLCf5JoEMWdQCupCtvTEi3S3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/j55IWuGgqitEJozt7g80IPzcCzf6dhU7uxQafZOpyfl3mvfe04PrMMskWYoeBcGKH62mNdMqbbjzv+2En9uL/Z0szpP6ynCrlPqHKbVNL0vh+KS1ZRPa9PzgaXnff0l75c7aCmhvDckXRjwajD6ABAnjo7J1JcCCBrWCKJMF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wL1U4wty; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wL1U4wty"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30a2cdb2b98so21315841fa.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 06:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740147074; x=1740751874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hY7q6HQ4FQaZazAg7YSbphco7l3aJQzJCtoIpLMsi3M=;
        b=wL1U4wtya6qYKibQKOux2flP/Bg1V5rUVdUF4O1fKqQuN0Qg1TD4ASdQLj3uuUOexf
         xKjcjzaK3my1TwFT2hfjeUg4O2zjRUs94WtO73opBGSGyBqlv77yZNGCP9i0TdLN81SR
         ZoxroCsZmF3ZNuv4T9LG2VgHdOgFkocDmVtbrjZRFZT939BdKVNpHsBPIqyxsTTJi5km
         6e/l/g+ZgqnKbQM+M4Llci2HbW6sy6TClvGyBUumVPXhtf3iJHROaRUAJMew3Tkd/IDH
         JVC4asgE15HzAOodofBHJEm+segKyvYZcKXDUpWSpOEe/noYpX1iCsx5jjFRd+/kRFKH
         4cTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740147074; x=1740751874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hY7q6HQ4FQaZazAg7YSbphco7l3aJQzJCtoIpLMsi3M=;
        b=vSDqBcGXVBwdFwtxo5HYme+hY3XYGPcoKJkoK8CqhXcQjkSZdXrD8ekCpT/nc/lt5f
         wkrQEfXcHZ44xwez+9ibyFuI7UyNwYFAAgM5sHUsd2UMZ6InMmHgXtXNzaoaLlMoACgJ
         1TkkfjQrROu+4qIakLwYQlAQmxs6DxHi6vYhxdqaBgqZJADgurazCRvLdOXVcXEISl0t
         PSsgWws5V8VaOMIsLCSUoXydp1B9mLniR5lnGK+nlI1vtOg0v8pTHzDyUR7hGFCosHs4
         VJ90g0aU6JbxrSjxQ/1777xBo0XiIQV/VENpBeoqpFe9kB92daOWTeNFmcfHdaA8Y0A5
         8YVg==
X-Forwarded-Encrypted: i=1; AJvYcCWcUFaQC5eaf6dQa7TIXIARsMzXV+ib1CdH9EvvZktcBgtCwEDq777I/KPeAJ2J4qwnj5FYBR3tXDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YySmLobcApgysNE+5qm2VnawJQok13UNRsi3xamEyhPKHASwUZl
	CPcC3cEHPWIMQvuNXYp7aamg7IARK+Bmn5wxe4jC5HzsLkITviE/Jauyk6RIp2I=
X-Gm-Gg: ASbGncuSVTegaH1S/0Mdz8S6H+H5Uij14Pf14X4F1hCYUN8ck2ui/Um4r50trfxpGOM
	GEVEApgGGu69SOviLNbHXmALSP0CKylVGPVQ186XfOopxxWccewIqKRcEZ2VAt8dyciGUB0JVOj
	610BVn4gqsYmBL0Z0fUU8MyfAfMOVIKg1HRDj3p4Hvmm/u3Dv5TxmnoKS67qwSEifcExQ8mZQH6
	e3gdHKcE69vjPgOTAlIQ7OYeqRL9YhhWAnqiJCvUwZn4yTAKO3PkHm0PC0skdbOc7ELUtj2ObrI
	dy6mQKYaR4bWRD0O0+uenPwfrnacTJR61zkaE57LptS5guPvOIKdTX5gRUOCdm7AsDarh5Jp/6N
	dsLA1Xg==
X-Google-Smtp-Source: AGHT+IF4YOFfa5Kt8R2qRuDLGtHoO3z4a0J1rMxXFbaWLFLtIOV4Chzyik4Qt1FBw4hvpqQhKIqgvA==
X-Received: by 2002:a2e:8202:0:b0:30a:44ca:7e72 with SMTP id 38308e7fff4ca-30a5b20dc6dmr10079311fa.24.1740147074062;
        Fri, 21 Feb 2025 06:11:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a3a6d3dcesm13384331fa.67.2025.02.21.06.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:11:13 -0800 (PST)
Date: Fri, 21 Feb 2025 16:11:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 02/10] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
Message-ID: <ljfgljuhlpkjvqwomhvq5l6giihqv6h5nzswncaqgelvjycgew@bcxjrgbj3lts>
References: <20250221-qcs615-v5-mm-cc-v5-0-b6d9ddf2f28d@quicinc.com>
 <20250221-qcs615-v5-mm-cc-v5-2-b6d9ddf2f28d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-qcs615-v5-mm-cc-v5-2-b6d9ddf2f28d@quicinc.com>

On Fri, Feb 21, 2025 at 02:50:13PM +0530, Taniya Das wrote:
> Add DT bindings for the Camera clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Just noticed. I've never replied with this tag. I've provided a comment
to the v3 of the series, then in v4 this somehow appeared. Could you
please comment, what has happened?

> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-camcc.yaml          |  54 ++++++++++
>  include/dt-bindings/clock/qcom,qcs615-camcc.h      | 110 +++++++++++++++++++++
>  2 files changed, 164 insertions(+)

-- 
With best wishes
Dmitry
