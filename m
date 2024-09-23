Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659B41990DE
	for <linux-clk@vger.kernel.org>; Mon, 23 Sep 2024 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727097582; cv=none; b=bkKTsl3/lIuKe1KvvmjdZryVpNW3nqkA2FujzlyQMKJbXU7XqZ8lW38Ptm9GtjBUTBrm+12GXXS0D6UK0KpouxkdUy8zHDOgbIZZs5sD8UkarTw1yf/a1T0eAzODBmYickWc8N+/2w9nM5YzAAnhs574jA3hWpU3uA/u83LpE2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727097582; c=relaxed/simple;
	bh=h/BEMtHgfJ7o98fvYyXlIv2+yWceMHMTagptnb1Zg5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXQPEE3kNrUM5e3bLvkAxj9eLBnSgpuF/QeZyOyzdM51MXljMvUNGh3zQTmIcy9wD6Zlmp52QjcQA36sZLdnn8nnsRoGuxwLJPAnpB2b1kmvQgy8oJgYgW19wqEJnh7XHnRET4rNQPhIjqcZGg802hk5eKgVbmdRiPiIa+JLgqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h8NwHA8S; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h8NwHA8S"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-537a399e06dso775985e87.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Sep 2024 06:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727097578; x=1727702378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kGk2orlX+fi9SeSwRZwCGAgpSwWImCEuGfUk0feNgoc=;
        b=h8NwHA8SYu29+jh1K5SUYEVF7UpFjCVuUepnDQ2bTAjCMnPgblqFhfm2GASvDJSHNl
         XFQOv5Efc9rrRST4hUc43+2aTJA9iJEX1ktTiF/uizWko349HRHc/eZCen3aDkHgEgIP
         L/oxws7rLqX5t35j5wGB1hSiCToVu0gjw+PuyDXaeYbHpI8gpXK3OxmTpZ3A4f1QS1Yt
         taXHQ0maHTVWr8Yn1cxa2KsAbUH/b3FL+B629nYVHiBFaZIh9iPOfLS6c44f+Yk6s20o
         ICGrWfKbi8se2WVSpNjFZ0SybAbanXXH63Ez4Nb8sX4wBR+S4R7PnJER5ChNDsLsLNEG
         94wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097578; x=1727702378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGk2orlX+fi9SeSwRZwCGAgpSwWImCEuGfUk0feNgoc=;
        b=espff4gqGgvkx3xbQ5psUAoohehwuy7pTB7SfXVF0Bbifx69JiXw+d+Q9EO7+Gw/9q
         a02WTkArcoHOf342llGXT6Qbdd6MLGPaJ6wl2vO8uCnnAz5WmXDH9mHEZWto0gLpU60P
         5eZ5SO90gEO4f1eSNHKjEn2IMa8nXIE4FeJ3HP2wORaIDLWWpXmULMrGVuxaASTB4TJh
         GPOI4ZdXimwA9eCFARj0jI+FFAG6wVRCwgkHqe9m+Zw4NqmnonU/5cwdLLaVbWugFrkB
         LhoghRtHKscuUakMlj0xg5xUbCzeNSRASImkkVpMbm+HEdNh/jep9AsCd1oX+u8epEz0
         RTMA==
X-Forwarded-Encrypted: i=1; AJvYcCWrswWosRfQc1gktev3ePA6GQc1GTzQd44OcXEa3VbDKMJZEOl3jZKFWZQiwdlkXS2vlInFKlMG9gA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNH02Y+VoA6C2LVE7ZqSH0FGZzpXXpmnxLncUdkW9As0tfR3Ci
	46KRLPOYOlJbm7izB5Qdr0iXW1ahv0zqqrbzRAy+zzOmP4dyDvBwhZ1Hdqjl/gw=
X-Google-Smtp-Source: AGHT+IGOBZJQI5jNN3s4SzM7Ap+2SyMdJN1H7lWTNYEIrJ6+UEojqKqP8ntoAuCXELz9jje36RoeLw==
X-Received: by 2002:a05:6512:1250:b0:536:7a88:616b with SMTP id 2adb3069b0e04-536ac2f462cmr5710269e87.26.1727097578302;
        Mon, 23 Sep 2024 06:19:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870b4108sm3276674e87.244.2024.09.23.06.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 06:19:37 -0700 (PDT)
Date: Mon, 23 Sep 2024 16:19:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, vkoul@kernel.org, kishon@kernel.org, 
	robh@kernel.org, andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, abel.vesa@linaro.org, 
	quic_msarkar@quicinc.com, quic_devipriy@quicinc.com, kw@linux.com, lpieralisi@kernel.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: PCI: qcom: Add OPP table for X1E80100
Message-ID: <jz6eqbreus2hrhxadj643ibfy3ejr5tjhkerln6sh6bsvfhaw4@6uwpabq2d76a>
References: <20240923125713.3411487-1-quic_qianyu@quicinc.com>
 <20240923125713.3411487-3-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923125713.3411487-3-quic_qianyu@quicinc.com>

On Mon, Sep 23, 2024 at 05:57:09AM GMT, Qiang Yu wrote:
> Add OPP table so that PCIe is able to adjust power domain performance
> state and ICC peak bw according to PCIe gen speed and link width.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> index 704c0f58eea5..3c6430fe9331 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> @@ -78,6 +78,10 @@ properties:
>      description: GPIO controlled connection to WAKE# signal
>      maxItems: 1
>  
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
>  required:
>    - reg
>    - reg-names

Please drop it from qcom,pcie-sm8450.yaml, it's redundant now.

> -- 
> 2.34.1
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
