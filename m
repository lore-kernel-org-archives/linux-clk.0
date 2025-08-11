Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08300213248
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 09:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904128; cv=none; b=UwmpNWVVOg/s8kd3il8klkiH8USrrfd1FIdWtIakvZEOqGndDtbK/RyGxFyimB7n6E0k1lwAIESbG2mr8WlD+hfj5/M5JN9L0mGnEVwgGUvCKr5LbBna/jh4dPz/HaPkfQdhPvLQqb5gCUlpwocr6BjEYo53dqjlBycGyQB8CCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904128; c=relaxed/simple;
	bh=K/zPVqxGg7tPN+JbH7RDbuwnwSJKsZfgYcJ/y4119IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmeFQLuNQIe5mIwaTtyTu5CQMVvx46gC3cojZbv4pMPvftJ7XNrrtR914txo/1FIGn9tflE5QNmEU46bAgwVW7c91R1sBlytpA67URSmGliQHPVmpxFbI28bE/yYEtSox9cWO5PXqLJeB3z7swmsSYJ/2cLkzuGLKovmOqMdfQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PnXipBWe; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PnXipBWe"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76bed310fa1so3354212b3a.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 02:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754904125; x=1755508925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n44ROEDa3iRmjIj2E/S0tuIP2QaLePXT+HAKtrIXfuc=;
        b=PnXipBWeA2oYugnfcYMhifxpADIJqd+BzdtR/6Btms/qY7WjTCaCaTLicn36cZCZtp
         SL6URDZief23E7YUR2GB9QKopMU7aWlVEWBTPLRVDszIDU04d90n0khK4r3RysZWVTdv
         H2CrOc2bByNGC7n8+yVXXoemyInOdZCrLLzUbvOIse1HYoo7tuM/MQbhg4fY2AM1ZLTU
         c956F3p8roLky8nVAD6fRssdntkdUilIWe6SJdiI0xPJGXFr0I1X/Twi7B+vT2y9tpdE
         8Dvcl3sFEQur2SELjc8TBmyoY7NaCN1B+yBYuEWtZ84oCSW0PgNsMTxsknebkW+H0Nyt
         OcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904125; x=1755508925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n44ROEDa3iRmjIj2E/S0tuIP2QaLePXT+HAKtrIXfuc=;
        b=nR3eZrK1+AropI1SKZeASyeIyxI4kLHaaimwfKYVcb10fTD8Qz1jECQ/erAJgENAUD
         D6qclD66Z3QuIepTza6kVHaHDbWLZmpZW1T5a7iHGBL+8DdreTH/xi+pGe4HBTBicZHa
         X9P1Nr6gTzDlPilKp3joPA/JiPl9UCs3CG6Ta/78J1o6biMZEIhPXToy88SwP4AVfhDN
         r62msE3MTTQbEQ9H7yhedq6wBxSRcZEvs4iSUZOAatH7CVsy702DB6DIAzMQo+kb2L5X
         oBTZzhllcY8MqCnxhLVWrzymaEZdlQ+bSN8VN1Sb5USOzTHrOgzfN/aoydYEB4DRJ2/Y
         r+vA==
X-Forwarded-Encrypted: i=1; AJvYcCVkKvfpsm7zeDcPoQ6FUbUJvqvB17kC8Bwzny6OxCbXu6+IQt2x9pviBnElbtbKnXBqzohb3F3aonQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAENQ147cRl5WJxW8+VSI/xmuy0PsnhOd72+OB0tSVzr8B5tae
	830GZuA49uaeG2A41Km0Sjik+cLpiYt/LBLCnmLVTFAyfnOuWIiSMBKKiLutu7oTF8s=
X-Gm-Gg: ASbGncuZbFXP1K7HoAhIVBf/KyoYminEwDhcBDLdkrdR45SvrFkpwBMsEIs1IGlSDN7
	/6bpDw5i8ATfQmn2cO/1lgCckLbQHukazYkgJzs/UhCaAxOEeLh77pFCtMv+MAfnpWEpGP+xtX0
	KzYYmunpawS9tOTEDEexOuHu+yOQP/wyYh2H73Cqso+DfzN1K+J8Lcgq8dtz6EU70VtsaQ/Jy0I
	2P9jKaVVQ+ShGbaMTICOOxNGXv/cAxsj3mHHmaVBaNeeU8CYFj5lntjJsr2yEAeHDxWOdJppiQY
	9PW0qurdlPh4l5wiusSwXYDcCUcGKxj6Knx7a9ORLN1//JG7i9r9TXn8zXh1FsPPIQIqNP721If
	47v5kFda0O0wJciyTEIM/we5e
X-Google-Smtp-Source: AGHT+IEY0nvgGQRFqL9yezJOvWADh1/cHUUmKJ7QswLrUeIJdU75UuZ8LO0U21sJdWveXkp3OX6rWA==
X-Received: by 2002:a05:6a21:32a3:b0:23d:de52:a5f0 with SMTP id adf61e73a8af0-24055204322mr19749640637.42.1754904125252;
        Mon, 11 Aug 2025 02:22:05 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b423d2f5035sm20840763a12.39.2025.08.11.02.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:22:04 -0700 (PDT)
Date: Mon, 11 Aug 2025 14:52:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	konradybcio@kernel.org, rafael@kernel.org, ilia.lin@kernel.org,
	djakov@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/4] cpufreq: qcom-nvmem: Enable cpufreq for ipq5424
Message-ID: <20250811092202.auarwnyoagebcw3o@vireshk-i7>
References: <20250811090954.2854440-1-quic_varada@quicinc.com>
 <20250811090954.2854440-4-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811090954.2854440-4-quic_varada@quicinc.com>

On 11-08-25, 14:39, Varadarajan Narayanan wrote:
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
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> [ Changed '!=' based check to '==' based check ]
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v5: Add 'Acked-by: Viresh Kumar'
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 5 +++++
>  2 files changed, 6 insertions(+)

You should have dropped this one now, as I already applied the
previous version.

-- 
viresh
