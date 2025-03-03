Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692351F153C
	for <linux-clk@vger.kernel.org>; Mon,  3 Mar 2025 23:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741045926; cv=none; b=BfVSsbbyH62woPIbjNeS+dtCC8dIiyBZZieYD1bPcHztbged0BjRaqOQMj0y/+Jt620MjPr2pIFLKzE/QPWi6pgge5AgFR8m3gyif9ACY4aTTrWq2E5pPCfzacjSMZJzrINEYZXDYapW/srwwbay2uSxDgw6r6pH5I/slo1dVQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741045926; c=relaxed/simple;
	bh=oIoGneK3UeGIUTIlDf4KvKMqAMpwSNXiYhvuFQnjiiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkDFtRUPOQXjahjuAN3WvosUFmYAJ5rX7+Vf+rjw3W3TYujfdb/UckUOoALIKyQoCbh6PxK0n3Wy6ilAi0npsKa1PfMizHQTjwfQ5oofybQ5YBhvZ1lUG4y4cRkXe/ez80oNn9pPz/hy6Wf9FUt4Ubn2eC/R2WPgyH/lpyo0ARg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uwOkxCHK; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uwOkxCHK"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bae572157so22105341fa.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Mar 2025 15:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741045922; x=1741650722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2n5w8pShYE8jYi0hvqZwRKlhrBdNHQSTgdC19YmKRiQ=;
        b=uwOkxCHK04UPTqEcQ6DU1M39Ye2IkIm6I7G5M0mdQ66JtrxfEWYP/RZ3AW9J3GQ1f8
         4Lj45jA/hEq6ySFSP1Pb+nrodlS3B4GN9Cq+vrB5mb8DQFiCJINlBVeHb7TrRqRqEkkd
         3hxzXeSd/HMAt3vNxcpgHRg2uBXYAtmxSR7mHRM7lgnHMAdgCN6Pu0P+9iP5J3/Jk/lw
         CZta1w6+gWKKn6Dw/z483XOJeFnqGN4o5LgrjsYjkj25x09iEsBXN1SSAklEYtzjj597
         zXKstTTN1AJO88Bo5Em/eXxQIAMGx6Ktfcgi491mnppi++ZS7qltjNN9xbpf5tllgb83
         X2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741045922; x=1741650722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2n5w8pShYE8jYi0hvqZwRKlhrBdNHQSTgdC19YmKRiQ=;
        b=FQFAHEodtK8f2AHVk0k6eVKwS/i+X9WSbDXrvqP9biS4qUM+mSgQS/TZ9odpvKVKAS
         Gi7A/shwjc9KPLyrv0+9V0QbYofPPUUkol7A4qPDs2zK/tT2f1U9s4N8eMew5bWaSnFs
         du/rflofDcSe8n8stnDYoNLr4s5apUEjPkMOuGtqJ0TNch+k7pUvAghuQCPhimaRy7h6
         nSEVXllTOd/PxWn9DDquYBqv5ajB6Z9OGz5VDD3yy41cu9udTsK7Ozg68G5rwZ8h6yGO
         qjtbbcO9EgAunyDyiP3tVzy099pWDzy0sdTZeaxd6hTQcBArYy/bYB9++6jpRZx7AeaR
         9gDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWOApAe1xhcxaI+hCjq7nXt712Vj5X7pqANW+ADnZjwQ1bMYzB0/Tazc63SVkBQPQiRRhh3hHVnso=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUfTHByafySAB6PfhsEHIbPVpESTosmCbedhmBAuXihKg1BI/J
	82Hx+HCkV7K6c+oTYMJKZm+2A8cjoylpiVYYTGu2jwpOxjd6gStR6bT8xAyInt0=
X-Gm-Gg: ASbGncuI9ltGScmA0QyLqO/Vo74rsKSW+nkdbyoGzzku3WqtHkaaFYcT+b0iKtVRdHN
	ZgyniCsgGivNDBb2+ixJjoUWA3i8NbqXZHwg7myiCe7RV8UE1o6TLEViPSYeQDDR+p3v9/WGZSN
	U+vXQKQrVyZWpVtYofVYBkANzsQZpxU4JZ86jPtbMc8GdrOx4CiKARxjH46izK9iRwVTtLoGV52
	Xlfeh/fmDTN7vY2DZMGTL6cGk46uERaUjBQbkxwTUo2xvPBVrtAE6jlaSBijMyD4l0aD2by/StH
	6ZKAbunWzBlVy7GfHxgOpjlEQsusEv0VhCgihDRJ1043VczUDXYk06AobDpZK/YwgGVWorkOP41
	mTk/x0M0JiaKHAoOsN6kj4jy6
X-Google-Smtp-Source: AGHT+IG3xHqjP7zA+YAYgWJyZt0k8hzZjqRHbgURZmqSE3LkmE73kUYMjjbwKv1sJmuR3k/fg7H/Qg==
X-Received: by 2002:a2e:be8e:0:b0:30b:bfca:bbe3 with SMTP id 38308e7fff4ca-30bbfcac3ffmr16343571fa.6.1741045922539;
        Mon, 03 Mar 2025 15:52:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc7b379f6sm2108401fa.19.2025.03.03.15.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 15:52:01 -0800 (PST)
Date: Tue, 4 Mar 2025 01:51:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: sm8450-camcc: Allow to
 specify two power domains
Message-ID: <4uuvboq5yfvdbqxd2oreu4bxfqyqegzl5uahgchw7wzlkyduyh@spjzrsef5flg>
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303225521.1780611-2-vladimir.zapolskiy@linaro.org>

On Tue, Mar 04, 2025 at 12:55:20AM +0200, Vladimir Zapolskiy wrote:
> During the tests it was unveiled and later it was confirmed that SM8550
> Camera Clock Controller shall enable both MXC and MMCX power domains.
> 
> Since power-domains property is not specific to MMCX anymore, its
> description is removed.
> 
> Fixes: 9cbc64745fc6 ("dt-bindings: clock: qcom: Add SM8550 camera clock controller")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index 9e79f8fec437..d7fc9e5a2d20 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -37,9 +37,7 @@ properties:
>        - description: Sleep clock source
>  
>    power-domains:
> -    maxItems: 1
> -    description:
> -      A phandle and PM domain specifier for the MMCX power domain.
> +    maxItems: 2

items:
 - description: foo
 - description: bar

Also, don't we need power-domain-names now?

>  
>    required-opps:
>      maxItems: 1
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
