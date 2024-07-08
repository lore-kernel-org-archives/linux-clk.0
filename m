Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA952771C
	for <linux-clk@vger.kernel.org>; Mon,  8 Jul 2024 14:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720447352; cv=none; b=KUfsBQdi+VLd2qekdCPkD0+iTzDSrYwgXj0HuTrBIKIQkL7v5kbzgBTxcKnAMsWF2BPA7Sv2Hi532M3aq80IF0g/993jUV1GG45HsBqHHMxPYXtUTZ0kmU9CGAEncdTLCin/Z8j672oeUt1HC9V8yB6K3plg7LzvpxJOB2H4IZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720447352; c=relaxed/simple;
	bh=XVI1sPWzwf0EC4+VDcRWpuDpJgYiTCP5xfU9hMnPeQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msdzFbEzEIB/aWakivHcTsVhsRyk5VUBTVXEq2tXwfGRHSCIJAX5+dbUAMYbp+OT6f8F/4G4B+rOpzLeB8MUmH7LaYBg2Qe8MVZbud38OOKnML0WCBrBFzeZilCrK2uzmLlRRhc1hr7YgTZQC0pakmOKWQOR+Kxv9G3n6B0lumA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tVyJfe8Y; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tVyJfe8Y"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ea79e6979so3179073e87.2
        for <linux-clk@vger.kernel.org>; Mon, 08 Jul 2024 07:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720447348; x=1721052148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HNkP0Bt8Z9z+t2BG5svCbmD1UB8JpC5ZP0x//z98M3I=;
        b=tVyJfe8YGkGzHJVGSURlWN9VZ58hONqqxN0DKwZWMsX0UPYJX1ZsLnuwaP//D9jh9+
         +e3k39W2siyPkpu7bGbiPPW8mo2CqCl+oX3VRgc6R4fP4KH/KMZf7RkIn8pUM1qUAXOR
         VVxIH8Zbrl9BwRE7mTzKEeTOF/9D+IPStwYwyg9aWqeTGNPSU69x5wBFIKnaCKhzUgsV
         D95+hRbsgpZ7N+XaW6EvpX+V1orwlfRexn6+QjYGeScWPVStNgWM6cugA1dmc6jU1lHF
         nV7dn5Cf2nQlC586qNCpPRHEjguZkkeGVHygnOm9HVTmp9g2AQIiPBZ5MpXFzQeaSuPz
         P81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720447348; x=1721052148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNkP0Bt8Z9z+t2BG5svCbmD1UB8JpC5ZP0x//z98M3I=;
        b=l7YAcST6dmCQoyDf4QsDCEAS6CWF5BZbAsbwuJ274eySjCBm+t/i9mh+Y/7iXscASK
         4Bf7ePHmdFO3ywXBDOEeIP/wGswZmC3wBu6WlRfFifawzU38R5cF+4W0Xy5R1Etgysrr
         YY69m/h/pUen73A1hBHP0Z4OG0hXbqi29Pyg38uSQF+fll2hxcd0K9DJ2j7qo3rhzIHB
         fCT/e7/LigK1Hx00lVx19Juz5YqFuSM4iyI8pcKekWU/kG0oTd2O/7gduChDEU3dbi5N
         b5osYo8Aa2yIINZxt6vu5edYNU9xcIbI60jOcfd9IYbO8NeS6FjhCJT7YkEvQuji/Gto
         d+Og==
X-Forwarded-Encrypted: i=1; AJvYcCXJFrYliodEHZ9gdU5VqFkn15c+WhqUg3ntDo0xVxgL6ByWOpr65LONx9CoYgOPawlw19Y8Jwt7ShUgy46WNBcmVG/tjI4gpYzr
X-Gm-Message-State: AOJu0YyzecFrbUx2zJEsyIhTwHhNSkC1nsBYT2wl3fvSWhuAjGFBirRi
	xeNHSXJ7uyCrWs0fLbPTXXMU0RlqhoVtsFcqaEad3/u7r/Q9vK6I24QovGjc+U4=
X-Google-Smtp-Source: AGHT+IF/QaQIW5rohmTJn5zHc68r4oDJHttb39KSQE+SaXaKxy3w9B6lXQX2UKAIvJTa9lxjTmfx9Q==
X-Received: by 2002:ac2:5228:0:b0:52c:daa7:8975 with SMTP id 2adb3069b0e04-52ea063230amr8500079e87.18.1720447347349;
        Mon, 08 Jul 2024 07:02:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ead695f29sm509185e87.109.2024.07.08.07.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 07:02:26 -0700 (PDT)
Date: Mon, 8 Jul 2024 17:02:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dt-bindings: clock: qcom: Remove required-opps from
 required list on SM8650
Message-ID: <rbej7rbjiwtgf4reiomtmlv3ef3ljfys5yfzypigrertylucu7@be3v65aeuimb>
References: <20240708130836.19273-1-quic_jkona@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708130836.19273-1-quic_jkona@quicinc.com>

On Mon, Jul 08, 2024 at 06:38:36PM GMT, Jagadeesh Kona wrote:
> On SM8650, the minimum voltage corner supported on MMCX from cmd-db is
> sufficient for clock controllers to operate and there is no need to specify
> the required-opps. Hence remove the required-opps property from the list of
> required properties for SM8650 camcc and videocc bindings.
> 
> This fixes:
> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000:
> 'required-opps' is a required property
> 
> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000:
> 'required-opps' is a required property
> 
> Fixes: a6a61b9701d1 ("dt-bindings: clock: qcom: Add SM8650 video clock controller")
> Fixes: 1ae3f0578e0e ("dt-bindings: clock: qcom: Add SM8650 camera clock controller")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407070147.C9c3oTqS-lkp@intel.com/
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>

You are mentioning just sm8650, but your change applies to other
platforms. Could you please check whether other platforms supported by
these bindings required the opps or not. Make required: conditional and
enabled only for those platforms?

> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml   | 1 -
>  Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index f58edfc10f4c..bd9612d9d7f7 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -57,7 +57,6 @@ required:
>    - compatible
>    - clocks
>    - power-domains
> -  - required-opps
>  
>  unevaluatedProperties: false
>  
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index b2792b4bb554..8a42e2a1a158 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -44,7 +44,6 @@ required:
>    - compatible
>    - clocks
>    - power-domains
> -  - required-opps
>    - '#power-domain-cells'
>  
>  allOf:
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
