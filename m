Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925FD1AD3EB
	for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722432717; cv=none; b=ORcVpzGS569Q+RFN05W4K6b7bD3S/DYPAOn0S9VR231sR2ADb/hMhUH3o3ILNVDVjlOV7Z+XFbgjm2fbeDpw4eUSxmmt2d6lH1xH50sjs5Y2eCESMV1Xz4sHXsV31JnzSHaFedw4Xpetu1t9Umg7Wyz8L8F/WtUuRQnJye7iBik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722432717; c=relaxed/simple;
	bh=P2Zc2kRlUTzQWuiLdA1pFWHC6xvaH6zfnCz8JHSEIs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HK8TxO+zTVLu8eG4xsCiVwabmpSokGxMX5G1y2+pit8Lg8S44RFYxVPbWO/sLjwqlOimQnidsoFdTd7u3wohuJMveFqH95fKEDuWirV01vZu+5XVC0y+cyjYh0kjnXHiIUBoGKEzO6O2SG0Cekiakk4LddlBePzmoQ++Wuenj1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wZEP2s1J; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wZEP2s1J"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52f04c29588so10209297e87.3
        for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 06:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722432713; x=1723037513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mu/jrHV9aX6kTVP3aSVpeXFR1odPgGfcDv5EihSzkVY=;
        b=wZEP2s1JDOHjfRaoa3j1T/vvA/AMIAw9Byv8YAx8c9708Qk8BjIjIdnL+1nYleLwDo
         hXNGL4VoorUaCgD/5kQNDjf7S9GMUuvrPQMeQvI8USqBlmgR8y5ywkPmGfouP8tBOYRS
         T0T8o9yGlLP3YuFjWXDvpzYzETN6wOHBUO1F3Y1DU22JdVGNm7Uh070c0Ksa2Huhj9zA
         eXvALTbveik9vBeQPxJbXEtkHRWzlN/whkwGWp09rxRHLFVpx7f7F5Alou2+Gra2/r+A
         ihZZOgzffHWxXRboxaFcqPsp8Ajn2Pk+iClxkAV2V7hhfal5SoraVk+4gpXX4JlnkP+s
         D6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722432713; x=1723037513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mu/jrHV9aX6kTVP3aSVpeXFR1odPgGfcDv5EihSzkVY=;
        b=mwObGPhIfR2/718Z6evwT/uqx1ttR2sQMFULd3V3X4UDj7jJwfediWFmeXexsK6PP7
         p88Omew1WblmOCxX4Qort0nymqLscx73+ESK7/lBCIAKwWHgCD+b7baQ/oQ/xU1Io3BQ
         WgzagG4ddUCt4InMVpuoUZN1zih38hQnQ6nt35JgFcAdFCzNujV+yAfIZ+A8aF6r+DZA
         czCalVZco5MgKQV0ZvYTVeui5Hd6eDyKRVeu4BTE9NgnPu2pcylNyUOZO+ui+bp6JdzX
         MnAZfCvZurmEgp1oRQDWbK8MBkE/JDSRLPmbNTDrx4jzf5uTX7E03uxKuWO2b8sLg1uz
         UhXA==
X-Forwarded-Encrypted: i=1; AJvYcCVd0FYU57Ewu78ejuRP/WKF5vSZqbdbhnt4pWTU9eJ1zAOsAR7qfOZEIEVuBYexg1q9VdQqRM/9O5Zy9XTZlSe3qS/kNlz6JWjv
X-Gm-Message-State: AOJu0Yyw57MHqlS+zBifh/TEvXJCnfd3r0kBifRIVpddL5fOP7ptb2cT
	A7L0sqZn1mwUIO7Zq/PqdNZuVGIgUuLC2HNICVuD4CagNdlM5P3dmD0dWDALH6c=
X-Google-Smtp-Source: AGHT+IF9yysuesy1AWwQPiU83pnAbyqHjqnagriUsXCkmX5PJrirOfJMTi1oEuRwoiTJE5k2d+aUKA==
X-Received: by 2002:a19:5e16:0:b0:52e:7f6b:5786 with SMTP id 2adb3069b0e04-5309b2d9ee6mr7399994e87.61.1722432712551;
        Wed, 31 Jul 2024 06:31:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c2ce6esm2242763e87.267.2024.07.31.06.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 06:31:52 -0700 (PDT)
Date: Wed, 31 Jul 2024 16:31:50 +0300
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
Subject: Re: [PATCH V3 8/8] arm64: dts: qcom: Add camera clock controller for
 sm8150
Message-ID: <dlrkizo76pr57f5ijdxb65u3mz2arfs376cpalpv6j6aphmk24@4f6mrbxujyke>
References: <20240731062916.2680823-1-quic_skakitap@quicinc.com>
 <20240731062916.2680823-9-quic_skakitap@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731062916.2680823-9-quic_skakitap@quicinc.com>

On Wed, Jul 31, 2024 at 11:59:16AM GMT, Satya Priya Kakitapalli wrote:
> Add device node for camera clock controller on Qualcomm
> SM8150 platform.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8155p.dtsi |  4 ++++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi  | 13 +++++++++++++
>  2 files changed, 17 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below.

> @@ -3759,6 +3760,18 @@ camnoc_virt: interconnect@ac00000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		camcc: clock-controller@ad00000 {
> +			compatible = "qcom,sm8150-camcc";
> +			reg = <0 0x0ad00000 0 0x10000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_CAMERA_AHB_CLK>;
> +			power-domains = <&rpmhpd SM8150_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;

Is the required-opps necessary?

> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		mdss: display-subsystem@ae00000 {
>  			compatible = "qcom,sm8150-mdss";
>  			reg = <0 0x0ae00000 0 0x1000>;
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
