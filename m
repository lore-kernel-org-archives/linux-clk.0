Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F002DFA34
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 09:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754905498; cv=none; b=R78Pkb4H0anDJS3odgCSGag7xqo4iR5lqS090iuT5IYNqQc9UYK9kXpYWIWVcn8SHB2mYECFGNLd3bVJgd9dknAcEjGfziemKegc3E9XMhs1M6JGggmc6YZhq9O3FeOR1KqY3sfYCTju/rACatUgB1LUXuwmSps2n/+M6VoUyno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754905498; c=relaxed/simple;
	bh=oOOiZ1lqQ3eCOyBC4RUT7MgiecSXIg9A00t08CokTII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsdnddwmwGgc/In8NpyPXN/11WmmLM7av6IIwyXpnif21RGFNQDAyTNE/ZZ75ZLp7LijzfRy//Rw4FaO3HRmsRoAHDfps3CFN/kyyAwB0RTzpA67C/3LEaVeHkEhdQHFYOtMjwTUBi2cEBMVK7P004nm+cy2LKpuN0hIhW4S7AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZrwLBJ6q; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZrwLBJ6q"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-240763b322fso41918875ad.0
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 02:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754905496; x=1755510296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nCoqLwhb4uI1eEgHGHZ1KDRkXmPyMcyy/GtcB68Vpww=;
        b=ZrwLBJ6q7CR54OXI8khFF0A7T9EvvhJqm8bNzTCmHhQxhB5I1RzlII0tr4ntCdXqOT
         AT3/NaTk2MlnB74BaNkVEA3J8v49Q3ArhLAWPIflcd+ddvRHrRNz+22Jeevrqm4No3dl
         //huOxbZ/ZiD0I5pw4ta9kNgVzjXecgTs9qVtdS2KLgEYlEvzghBIIUFTSWkpIeJvxaq
         ZmbMfJP3FAwZBKnCSpM22CpmdTngGgwWyEcLO3BflUjc+X5mAo81X3NAUPK8G5s0IK4S
         ObSN8QVW5oJuJ3tVHCpkeCRJEbs/7AWiGDQM4kGrlLIxUWCdItro3L8dOg3Hy/1021F4
         GXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754905496; x=1755510296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCoqLwhb4uI1eEgHGHZ1KDRkXmPyMcyy/GtcB68Vpww=;
        b=sE/MEUWchxRiA/fcr9mhsRXHDjniRb5Wg0t/lzleu+7eHr1Vksb8iqGX4htUsIe7vu
         T9rFkJ0OdgvHImahyL5X90MWoASH6gV8s+u5xUdXuZxVu/Vt7USBWyUdcgzoln2mO8f/
         xxF3kxHHdTCAABmmeWuQJ37n+lFFCKnu8FuB2Uj9ej4DGzc77JcGr8TIjjWPRJjmNXjL
         nXyzDmyWCngoz/jG1YNy4knPG3qHjZaEx2u3biXtTXZ0vnrt+NEPEn8I2IgeaAdwriW9
         KZ1X4JwkNnP1RXeuAXu3/AN2BWbAjpUM/JSVWgJIkp2p5QjUifxcwEbohF26ynIM2xmJ
         UxFw==
X-Forwarded-Encrypted: i=1; AJvYcCU+Eo+zJXOrHm92UoEfOFcSSf3fVJo0hbTT/HIZbzp8tj/KpFM6ouVV7MawpBqCcLS/0odsq8MNqh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVuo0XtR7oTpDuB449+jdL3XafhuO8oOlCKnA7FdeZTVTt+tTm
	VYwTIaFAUp3EmzuD+UVO3CdofTAt7J+3Xlmem/Z0GVyb6m2XFoJlUT3I4HkcrnY1yRY=
X-Gm-Gg: ASbGnctRB8dHfSY+PQTN2+W0D+I9N4/IARJybcBCR4jH4jNhz3aEQngkXG4B9pzLNsE
	Li1u/pEolSpKp2SC/XenO+HobXVjHDXhUB+Di4CIYM9uKCmKqHZZ1DG+bCvKg4/O2qn2xJE3jt2
	RhoikbrarufFf2YPjHpqJw1ehouMfYa7Hs4Lnpxz0zqlzsPcXSuNF88MJn/hs/BQsEH642nYrgz
	B4B8OGucn4EfOIqF9kyrc2FS45d+8gS/nNqIrsFQsDWMQm7ZeT1EIZCqgowKLbNCKuC2sdF9XeK
	D0c0fy4ov2AQysknABXJmg28N0wq21R0B/1AJXTK2tyM1vIJJatMMZyPfuWW8F/0tcgRoK91nUR
	W9fmIILtyuheCwALS/k5e06NP
X-Google-Smtp-Source: AGHT+IHx6GR2e/+tS4c7qDRjnWjAYpd+pizXL7vvtruA+7iTSso7twvaaA2D0cifsUCnt3e92ef/zA==
X-Received: by 2002:a17:903:292:b0:234:f4da:7eed with SMTP id d9443c01a7336-242c222bf2fmr179458745ad.44.1754905496369;
        Mon, 11 Aug 2025 02:44:56 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32102a559bdsm15486233a91.1.2025.08.11.02.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:44:55 -0700 (PDT)
Date: Mon, 11 Aug 2025 15:14:53 +0530
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
Message-ID: <20250811094453.qvlpwwpmkpdyauzu@vireshk-i7>
References: <20250811090954.2854440-1-quic_varada@quicinc.com>
 <20250811090954.2854440-4-quic_varada@quicinc.com>
 <20250811092202.auarwnyoagebcw3o@vireshk-i7>
 <aJm6ixlMamgX/+bV@hu-varada-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJm6ixlMamgX/+bV@hu-varada-blr.qualcomm.com>

On 11-08-25, 15:10, Varadarajan Narayanan wrote:
> Sorry. Should I send a v8 with this dropped or is it okay?

No need of a resend for now.

-- 
viresh
