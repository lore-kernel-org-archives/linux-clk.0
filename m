Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26FF22D4D1
	for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 09:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741686771; cv=none; b=b1Z++SqXHWZfBpHJ0QXIEWjYXDHUDr7Ch6V3cwEzkZjmoDvccwSZuS77AoNoyV7F6Z3m7ups52maStyS735ur9FEPdSe46kO3295sUtP67/V1Eg3X88s+/1tJomqgZq1PJnCDZCr7OFYrT4lpSzCNH58e5UUyX+PO8fKimgrhNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741686771; c=relaxed/simple;
	bh=nLsNY9YPDYR69dHRTG9iGxlGFHroQoosjvtirmfC+Uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sIpXjjZC9d7bBuTlgJXJz3FlHDVapR2CnA7vCiPl79JE+tbMRCUPLgpE4krkhDRB61gRXUxD55Kre6FY84LhBS8xhdfAcD8mI2rNLI3h/LVCBo6R7RaVmbttMDI3Zh26UzT+wbmxdQ3RB/iuzHTvVibOK4N/3wToQuzRvLJ3O/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z4Opequm; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z4Opequm"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so1450882a12.1
        for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 02:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741686768; x=1742291568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ZF/tv/hhztcLup0wsXkNgr0yQmTV2Wsbid/49FYr/I=;
        b=z4OpequmYJIxTQH4QROctkwc/BCEgE039z20L0FIZr1A7WRRwTUFuV35fzckz55+TM
         aszYvgHJwDg7YlNb211Xhk4XiSGZ1yqle5deojhz/e8sSwbL1JvyRA+vGv49lVgHSrzc
         ElrkD5SkfKGFNS3W92i0TvhT1xH5suUK3SBjDfPZvbLaGqcFBbkvBRXVkcfCcDJMlwaI
         LFk6MTeZlKq1DJAICdYdAKQZqutyUBWCTvlfZrzp+OFTgF44b4X1murhOBuDBpMQqPNQ
         Zv+U3GYGcJp7TKV0iHRsQr9XS7e1VRUiJR2RiQfyFrFY4ZtakoUzEzzKYXh+LEz0rh7x
         7eyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741686768; x=1742291568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZF/tv/hhztcLup0wsXkNgr0yQmTV2Wsbid/49FYr/I=;
        b=sQ8swiRtKYcvOyxOj3P4rM6+8/OQ1Kz0X7XFxOQydbmpDe2dCh5XLCMnU1HVbhh7Q7
         JZ2LrIz421Tz24AZCkEEtUSHbTLF409X6cotdJGw9VHJOpOJkErJJ7LA6chZ0xxDlIDa
         MEQfIAqr1QMQBfiMh8oAS9QfH977Ap8N5GjmcfPAyHZjkdYsQ7tzyY6wGIPJwSGHPvVY
         jCaJcHQAGztNiumZsc114/5YpyJZUDqPw9dQvM9YDit5cbMzW8SjC8fuEwBJiy56iixw
         bXlOImlKgtHIMon6GUbGXNGTSYJxNwFs0D14gXi384n+2eTX6pIsWr258MMGEIIddsWT
         EGcA==
X-Forwarded-Encrypted: i=1; AJvYcCV1Rur7521dt/NFHkfFreByBF9tlp9S+4/aHaoxIJvUXZT+cpqoRCYMMzgZn6yVd5IgUZeDszvmeK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgumnWuDI3F8Ioyz60UlE0eqcYcin38LEFRVsGAaohYIjKzef3
	PzO/Uyk3MZ0DY31v1oDMLZswW19C572UPLcwYLcXZZ1Ig3zIU6qoA1UNNP9lSxM=
X-Gm-Gg: ASbGnctwEVJ3WBd5tGr91iw6+Tusl2DEIOifVZ362fWckNaQUEW/1d8UQ0UeQwRv+1M
	y4tGpnnnYTpA2c8C2LmtGg1AR7IwTHgj6mB1UvNv9H/6A5iY7CxIOFJLbw6PEeG46ImPgggtB8k
	IV9vw20oD/LiFSDiKC4bgS3Qwla0RW50P47d2KN9e2K6+nGrzSQr857m/X4cmVThwumMk/h2Smj
	cKXrTQGCHIqkdyjozaniCWOr2JadZXkCfdftMRrd4GvTBweg4VN0HTDvJwprxd8X6gJyiZn0MvN
	sdh/DTPZyvPfgBO81uJdY31IKNeuQSVUf36pxKN+b42MyMeErGrn5y/BztpYpqZiAjY/XKF7FYB
	WvBwu0FdNIQ==
X-Google-Smtp-Source: AGHT+IG6wdrtlqlUK8ocfVYESFcp2EZz+04YizUsNmVH6H7aW+YxVtNC5WSrYqNq8D4ssmWWnCf6Kg==
X-Received: by 2002:a05:6402:4313:b0:5e0:6332:9af0 with SMTP id 4fb4d7f45d1cf-5e7631ef0c0mr3354166a12.14.1741686767933;
        Tue, 11 Mar 2025 02:52:47 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a7176sm7953213a12.35.2025.03.11.02.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 02:52:47 -0700 (PDT)
Message-ID: <5a45fd25-74ed-46e3-b0e3-5adf92b5e9f7@linaro.org>
Date: Tue, 11 Mar 2025 09:52:45 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] clk: qcom: Add support to attach multiple power
 domains in cc probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <CMTYKKilQJYeHUYYKvlqnwv4Q2P-58Ic1v1ndS9HQ8Yhq2xpHuNThibFDjXDEQ1PyNbx__f9BVBr0peoTUdvPg==@protonmail.internalid>
 <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2025 08:55, Jagadeesh Kona wrote:
> In some of the recent chipsets, PLLs require more than one power domain
> to be kept ON to configure the PLL. But the current code doesn't enable
> all the required power domains while configuring the PLLs, this leads
> to functional issues due to suboptimal settings of PLLs.
> 
> To address this, add support for handling runtime power management,
> configuring plls and enabling critical clocks from qcom_cc_really_probe.
> The clock controller can specify PLLs, critical clocks, and runtime PM
> requirements in the descriptor data. The code in qcom_cc_really_probe()
> ensures all necessary power domains are enabled before configuring PLLs
> or critical clocks.
> 
> This series updates SM8450 & SM8550 videocc drivers to handle rpm,
> configure PLLs and enable critical clocks from within qcom_cc_really_probe()
> using above support, so video PLLs are configured properly.
> 
> This series fixes the below warning reported in SM8550 venus testing due
> to video_cc_pll0 not properly getting configured during videocc probe
> 
> [   46.535132] Lucid PLL latch failed. Output may be unstable!
> 
> The patch adding support to configure the PLLs from common code is
> picked from below series and updated it.
> https://lore.kernel.org/all/20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com/
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
> Changes in v2:
>   - Added support to handle rpm, PLL configuration and enable critical
>     clocks from qcom_cc_really_probe() in common code as per v1 commments
>     from Bryan, Konrad and Dmitry
>   - Added patches to configure PLLs from common code
>   - Updated the SM8450, SM8550 videocc patches to use the newly
>     added support to handle rpm, configure PLLs from common code
>   - Split the DT change for each target separately as per
>     Dmitry comments
>   - Added R-By and A-By tags received on v1
> - Link to v1: https://lore.kernel.org/r/20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com
> 
> ---
> Jagadeesh Kona (7):
>        dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
>        clk: qcom: common: Manage rpm, configure PLLs & AON clks in really probe
>        clk: qcom: videocc-sm8450: Move PLL & clk configuration to really probe
>        clk: qcom: videocc-sm8550: Move PLL & clk configuration to really probe
>        arm64: dts: qcom: Add MXC power domain to videocc node on SM8450
>        arm64: dts: qcom: Add MXC power domain to videocc node on SM8550
>        arm64: dts: qcom: Add MXC power domain to videocc node on SM8650
> 
This list looks sparse.

- camcc is missing
- x1e is missing
- sm8650 and sm8750 and both also missing

If we are going in with the knife, lets cut once and make a 
comprehensive change.

Could you please add those platforms and clock controllers to your V3 to 
save other people having to do the extra work.

---
bod
