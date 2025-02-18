Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D9126B968
	for <linux-clk@vger.kernel.org>; Tue, 18 Feb 2025 15:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739893271; cv=none; b=XZPZUgMaQq+1tZozn2r7iKry8xcmozLDsKfaIMos57UBwU9Y64bB3d5nSHYcOarht6BPK9WdLPDMLX+xYi7fLeYy4s/esS4dRbzDAU54J0i/aN28YHPk5UTGqw2vHo61ZBUVbmVKUVvyFT1XVB46Vw+ZJtTrutltaoifJs+bnNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739893271; c=relaxed/simple;
	bh=2lp8XQ80q8YzfZF+FMF8cPlkqzqEkoCXL7zcnd5prZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O2b+XaCuYbiUviDucXBt86VJObDFU7HVfWxiWuTiJn5KXjwffhKUdwRjVHzU1461ffMF8COGTr849xPiiTbeQzPsgIO51lKYVyv6dEx5n4dIa+dVB+5TddZSpNNfkojHgbUtJYoMoYebjP8V/uRfng6h6X910HxNXiSu6kiLQiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=z1zSPrkR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="z1zSPrkR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43998deed24so3247665e9.2
        for <linux-clk@vger.kernel.org>; Tue, 18 Feb 2025 07:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1739893268; x=1740498068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Q30dDgKfgVMd6trtVKX22J5bpFlivRbZkay2aGYd+k=;
        b=z1zSPrkR826ZNcLA/4xd8KolRGXCF0HWxsyHcOKLSP9YqAJkV8wWuCWVR30KXoLBsl
         24/wUZmXzbFUb9C1MJqa+zsPpHb/0hIr7b/hOWabK5wLxFZUJPJvlYQjZ/N/h64Qx4jV
         kVT3BXo01H0mdXrGtC9LIl/pruabPD170d08KTht+dqXzo8pf9DblPLDjiWN7z6IrcE4
         2yBMFiwwmkrxF+/qy9oVpYXduSNqRoWaaEznHZVLFBJf+I3N6luf/Y+SKmOc/qm+gR4l
         KWL7nNjug9xUY88BD7p2jHIoWFC6RVznjzge+OQvR4dbauBVJgzeuD8mJZOyQxD/3IuY
         gr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739893268; x=1740498068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Q30dDgKfgVMd6trtVKX22J5bpFlivRbZkay2aGYd+k=;
        b=K1azWFerEMXVl0ltyLAEWkm0dX7Jn0g1n9G1D0GNuY0Z08golYVD+FxNsIPwnLAr34
         Fk6pL5O/U/ioWA3Z5atIekzmVwMdHGOLKyQqk4mpTv8zIQYRvcxo2RGpT0XaDHLuezg9
         rk0dWaan6aaRfF3d3wmFIlt8/p5NhdY2vMpMe/VQsnwz+nFsjUostmygn2E8ucSCdrGI
         D4YWd1roEe0ynG8AabB/IcjMIf/p1MOdwgESWOFSiQEup/FHBqOFLB/nDuwyqHDo6tg6
         c1s/bIU+ZCFupGFzLp92zlEM7RWyav93Fa2E3GXB2fb2YLS+C/+WDNJRkNlm/U992Rcm
         y/rA==
X-Forwarded-Encrypted: i=1; AJvYcCW/deBrdUhet1Rodh8+L8T2pe8kdljFuVsqBBfCr1iMRyA+j7Z8+tWRcxo78YwsJ/+qWWBzmtxe9G0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC0VqgUMXVWZjoieI5C9wAALGXrLJyAZpjBv6PoQOGULTI/Zte
	iBXWI8aR72O7OLJ7vW6qqqhqQw4CraxuY9LvWKcIudTAAOjsnqS6ytL/BWrLtoo=
X-Gm-Gg: ASbGncviWZ+2HIxxdLBTBsR5vJUhvEXJp98POqsb7r6vItHxCzpt9eEM81/Hx9X12tP
	bPrA3DgWSSvLEoV3N2bphYN5EP+9uV2uohKH135tSYbqR3dnJwFWwCd0JY3Wz7jM+XjkVbIAx8b
	+B00X7PpqzP3/ND9hURNWmSbZkGnAFFNqvxCt+zUJM4h0QVO1K01bC2W23YYfYlZ9woZwDV9TGD
	Agt5MR1IZVUxuCGS+e4saz2iHhMXvQpKAOb3/soZHYxQS0fC5qVH+76iHWD/5QMV8c/X0pSktSS
	zQmkHxCTpCSMm8e+EYGcM9jYdOdi4YsJl2ykFMHx/OsqQDJA2I+m/PineRc=
X-Google-Smtp-Source: AGHT+IFgVQ/HTJovzYkHnF+vnnWUMuB0Qc49CucuSwBa0CgxZYS3J4v1QXbcy58eSkagjvpjaclFuw==
X-Received: by 2002:a05:600c:1d95:b0:439:8829:aa69 with SMTP id 5b1f17b1804b1-4398829abd0mr61277115e9.17.1739893267405;
        Tue, 18 Feb 2025 07:41:07 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915785sm15777430f8f.58.2025.02.18.07.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 07:41:06 -0800 (PST)
Message-ID: <72c01aae-33d1-45f8-94ce-b0fcfe4fec00@nexus-software.ie>
Date: Tue, 18 Feb 2025 15:41:05 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add MXC power domain to videocc
 nodes
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-5-cfe6289ea29b@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20250218-videocc-pll-multi-pd-voting-v1-5-cfe6289ea29b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/02/2025 14:26, Jagadeesh Kona wrote:
> Videocc requires both MMCX and MXC rails to be powered ON
> to configure the video PLLs on SM8450, SM8550 and SM8650
> platforms. Hence add MXC power domain to videocc node on
> these platforms.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 3 ++-
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
>   3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 9c809fc5fa45a98ff5441a0b6809931588897243..4f8dca8fc64212191780067c5d8815e3a2bb137f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -3136,7 +3136,8 @@ videocc: clock-controller@aaf0000 {
>   			reg = <0 0x0aaf0000 0 0x10000>;
>   			clocks = <&rpmhcc RPMH_CXO_CLK>,
>   				 <&gcc GCC_VIDEO_AHB_CLK>;
> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
>   			required-opps = <&rpmhpd_opp_low_svs>;
>   			#clock-cells = <1>;
>   			#reset-cells = <1>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index eac8de4005d82f246bc50f64f09515631d895c99..a039ae71e1b7bba8124128d19de5e00c65217770 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2889,7 +2889,8 @@ videocc: clock-controller@aaf0000 {
>   			reg = <0 0x0aaf0000 0 0x10000>;
>   			clocks = <&bi_tcxo_div2>,
>   				 <&gcc GCC_VIDEO_AHB_CLK>;
> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
>   			required-opps = <&rpmhpd_opp_low_svs>;
>   			#clock-cells = <1>;
>   			#reset-cells = <1>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..32af2a0f7a0030f155b7d8c93faeffa384a42768 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -3524,7 +3524,8 @@ videocc: clock-controller@aaf0000 {
>   			reg = <0 0x0aaf0000 0 0x10000>;
>   			clocks = <&bi_tcxo_div2>,
>   				 <&gcc GCC_VIDEO_AHB_CLK>;
> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
>   			#clock-cells = <1>;
>   			#reset-cells = <1>;
>   			#power-domain-cells = <1>;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
