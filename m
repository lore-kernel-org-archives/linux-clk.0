Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E781F4261
	for <linux-clk@vger.kernel.org>; Mon,  3 Mar 2025 23:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741046019; cv=none; b=iUBpaQdhz8kQY6wiu4R6EfYRBLN0VFJRgPFbcvKe0z/gN5wW2p1hhBB6pdMXoHKxSaiVXjqv+o/fmM/RPV362Xv6X0Z3OphU8HgPO+jH6stMMZihrpmCQqBGNNfkk9lF66zArzTIShmfSq5ys/clFSRdu+vgJcqiU3k5aK3KPU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741046019; c=relaxed/simple;
	bh=HWajZl9m4a1UKexoSEJtNSGCRxlp6IrjhL0YFHDl+eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWGzKA8ND3xhNDhxICpVqSzlIWTIRrUvDoyXCO0bdSS+xJ/VDKpBbdfv1D3c74U8JuqcwCSLq50seByp1Rmwcsa5Ff8WfqhQKbInEhvVOoWd1CCT869WALWkdAHLmlvHoocr5oh0Z+UxKNCqdjhEe8yjhyfvCQqH7COGxNubO2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kkd25SYE; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kkd25SYE"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54958009d4dso2929714e87.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Mar 2025 15:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741046016; x=1741650816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sf6fUtrPbo4KPSrN8bROtgOQM/aO3Tc+YsXBGb4Iutg=;
        b=kkd25SYErv3qMv+2OFcVaQ7dXYQiGNr4VnJ+7cdft7+oCuJwyhwZ3b1iQDwiV7C0oN
         KHn/CddIJEiYU1tDKEDHKMH6V9RTEzyg6isWpp4F65fBytrFEF0EnMr/49X4g7cVjSbJ
         iIy1JMHwwEt9Qg2phLoMyXQZ4DXkFn/G5ZYDqbVHfYOG4gJfwSSDiAdb9yqC7jBlUTqU
         gFzp3NrIfJjL72hwu4o0R6uyio4tvVUeXlAMKKAPF+bthz4MNeV0UiSpPcWbAwhf4KYX
         bJUUVSfd8xA9QddJ+tzcH5BZ8MUznk2YMuhhh/RCLgTeHieWkX+lnT3OA8d/66N+oNxu
         JG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741046016; x=1741650816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sf6fUtrPbo4KPSrN8bROtgOQM/aO3Tc+YsXBGb4Iutg=;
        b=lda7OBsHzcG0/9Ajb9l+R0ryCgLd769+1DIsYp/nGJrGVCU/VOCL5HSDqxq6H7Gcsg
         xjRmBMu6mCRfN8+6t5+1aByKBGLI33FY3tFKlG7S8YxH2aMGMQscDtpC5RwE2u1R2ROc
         ol0VbyitqDzL36SLfm6TL++S9b+vqsLHn3RLo8KNsbW/t1IytH2Uq2uPSZ771sirSBxr
         dgxm1JfTmqsp+9KxE/M3VVUoDhyFznzUtTLitZz+8gpLQTQs4QCeW/Yk4U/XThufxk/6
         JNak8v4jFAxLvoWZHlBySlWZxNJyoRtfzFgUJJfgb5+Kn+vFsYj1YbrWol6G8khDTKBQ
         bcNA==
X-Forwarded-Encrypted: i=1; AJvYcCVxHRz0wXy1sw1/wC2+L6C2DDZPPSfV/vvd2624AEp+ulF8CLVR0dEFWAXir9gWGcem9R4dMREraKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtryDYqbpnhVmeH0v9E8j/2IRrb9pqIEjeDWPEzO77PWzxOZif
	aG5CC57txJeIE1ZOueJojuE7O1wJQ32XCtfVyViE+l9mDyX5sU/GskwNzWhW/1U=
X-Gm-Gg: ASbGncv3vcUuKFmxOuIIxt2E7SKDT2rQ59C/o5Ort3EC/GyCA8eVHQmqrLSUVmy1p0M
	AYiuti53BPmlXtJBwKW6LdugapXRtINJa50j1S2Cb3Y5o+WS9HrrYR2C1NegEugmFh3TtA9mXz3
	X55eqKFDdt67sOomvbqLpdpEUnqYst/t4g92XozkB7NSzqGtUWmcFWmP2Vev42YsOqBiUOq1S+x
	MPbmB9UoPIFqJYIbUnGoQ5UkugZlSWjPgvPRFmh+Q4UvY0vvwEh4CHuumBUvlqBiW+ANyqDadu3
	Fe8Wch1+5CXgz4r2+VqW8y4ljvCQgYBSOcs+U8wP008i1hqiN8Zwv+04TMZXIJF/LJ77flCRk/I
	a4Q1nEf2pCJFvDZ2NahH2q7jG
X-Google-Smtp-Source: AGHT+IHYbdfvfcKjb82FdaHImaxikNWTWiiwXZ2Lv/t9ESp4aFqk5YhtlXfIUFM2FhGGeY2XZUhNhg==
X-Received: by 2002:a05:6512:1106:b0:549:66c9:d0ce with SMTP id 2adb3069b0e04-54966c9d3d8mr2837350e87.28.1741046016202;
        Mon, 03 Mar 2025 15:53:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495305bcb5sm1088540e87.45.2025.03.03.15.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 15:53:34 -0800 (PST)
Date: Tue, 4 Mar 2025 01:53:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
Message-ID: <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>

On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
> domains.

Are those really required to access the registers of the cammcc? Or is
one of those (MXC?) required to setup PLLs? Also, is this applicable
only to sm8550 or to other similar clock controllers?

> 
> Fixes: e271b59e39a6f ("arm64: dts: qcom: sm8550: Add camera clock controller")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index d02d80d731b9..d22b1753d521 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3329,7 +3329,8 @@ camcc: clock-controller@ade0000 {
>  				 <&bi_tcxo_div2>,
>  				 <&bi_tcxo_ao_div2>,
>  				 <&sleep_clk>;
> -			power-domains = <&rpmhpd SM8550_MMCX>;
> +			power-domains = <&rpmhpd SM8550_MXC>,
> +					<&rpmhpd SM8550_MMCX>;
>  			required-opps = <&rpmhpd_opp_low_svs>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
