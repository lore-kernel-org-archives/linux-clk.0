Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65DA1D9320
	for <linux-clk@vger.kernel.org>; Fri, 13 Sep 2024 13:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726234685; cv=none; b=aYx3TrGp5vLknWKTsTAI8RP8NXotEUqx7ZqIhpl9VMYHvnDcKN8Y3gu/p4SUrG4z8iUaqc31DdVVYNPsfONYkdBmwebTJmxzLrTTtmnCMhKvO2MRTrUFNeAyhJ1BYsTRcw91ZaynyPwf3Yr7Y+s50m3PsyCvt6ieYR6SQYQ4jVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726234685; c=relaxed/simple;
	bh=PWgO44z09ebmgMtrjRxx7dE2A2UuqzUQ+JDOYxYQtpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6XyF6k8rrgZ1LtFFNGSjlucVCc6UAFQWalOt/+aI/ho7C7B9Rkzge6oehRMROZXMKH13yfBfmhwFsStWLamEcuazxYzbLQ8nIsUG8jvgxvxpV826t9cbtoU51IlZDCJt7TMHfK8ZDlhvlblPzWUOE/LYMa8QLOHdDcw8ccu228=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uReTE3yz; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uReTE3yz"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-718a3b8a2dcso744111b3a.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Sep 2024 06:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726234683; x=1726839483; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BI2hDmwwKJCOx3VYE7RIwF7HNSiMnl3DjwM5Z3iw39A=;
        b=uReTE3yzkZMxJLBygzZm/+F/nhnRqFeFBsbDzCE/xZ1J8G9UaS9JJQWBJR3T2CFXnv
         qjPTlIKJAm6mcY12Ir4dTyqCmiZIg+ltlf2e5BP/VtWXuf5PjGoeKE46T5EuRg2UMvqL
         jwX0nN0i+1B5tUHtkuiNN7SjG+uWSColIzBuMNtRTs3nFjegHBNnLDKNdQ9qhC1gx743
         pKhYFPM94EcvRjtPQgIIdcWnz4GbueuxEsLZkyMz0g1O0rP8K+4WATRYRyj2g0UaMi95
         YwoG0Rsq1apHNEpdgIxTqKtjDCzU08PkrCGWO1nsbk4jy26WxkcUQzkwLO3c5vn148EI
         CIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726234683; x=1726839483;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BI2hDmwwKJCOx3VYE7RIwF7HNSiMnl3DjwM5Z3iw39A=;
        b=EUzKcySNoXwkYSDyaUZcQNzMMkBsT6rJ4JACdGtM+B9VUPrK1RFtkoJUkpekPkMrvi
         eVo2nVnZuKDTuZGxUivuiMYBeO6qabakRU4oDYRRXBsnUfHvyJOnr21JRBC4QHPRIglR
         SxGLREw0CziIuIhogTdyCPQrbK6COiXjnJ8sMetH2fKFj6pvUypJXPM60eEW0kvoOkCR
         NAhuHAFnIyuzIRAxhgjcbAPpHCTjzUon7YLb/DGIRBdvLhKWF8GUWse7ap1MZSETys76
         KuPG9xXM9lxkSQryTjiqCEWsMcX8Gfakk4YIBOJOPvLRIna4FnTRBYf7I13wIWdZA6UY
         wdfA==
X-Forwarded-Encrypted: i=1; AJvYcCUEA06BFr1ZdKIS29WxPLC//XV1Aw1t5fMRjHx3fa2hdwLJT+sugOiL7Mh7lKzSvOPgZFgQ8RZFCZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdYPcq1iVJHT9EdF3hQNvZ3UGMrFKAUqpf5yjpLdV+iNL3aMGZ
	nZRBx0J49i/3vyQNFGkAdW37NMVdUAQXOeT2k+0beHFZd+6u6ymLxLNHsicIQQ==
X-Google-Smtp-Source: AGHT+IHkmtRHQ+rUmoFYCE/1t6yyLL89sOdatHoosm5maSEtNzYl+sXUvxBNTHJPrww1u/l+DLihkw==
X-Received: by 2002:a05:6a00:1ad3:b0:714:17b5:c1d9 with SMTP id d2e1a72fcca58-71936a2f094mr4539801b3a.1.1726234682735;
        Fri, 13 Sep 2024 06:38:02 -0700 (PDT)
Received: from thinkpad ([120.60.66.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090b2c3fsm6095724b3a.165.2024.09.13.06.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 06:38:02 -0700 (PDT)
Date: Fri, 13 Sep 2024 19:07:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	abel.vesa@linaro.org, quic_msarkar@quicinc.com,
	quic_devipriy@quicinc.com, dmitry.baryshkov@linaro.org,
	kw@linux.com, lpieralisi@kernel.org, neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document the X1E80100 QMP PCIe PHY Gen4 x8
Message-ID: <20240913133751.2yegqbobvfzbogxc@thinkpad>
References: <20240913083724.1217691-1-quic_qianyu@quicinc.com>
 <20240913083724.1217691-2-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240913083724.1217691-2-quic_qianyu@quicinc.com>

On Fri, Sep 13, 2024 at 01:37:20AM -0700, Qiang Yu wrote:
> PCIe 3rd instance of X1E80100 support Gen 4x8 which needs different 8 lane
> capable QMP PCIe PHY. Document Gen 4x8 PHY as separate module.
> 

Nit: please use 'Gen 4 x8'

- Mani

> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml    | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index dcf4fa55fbba..680ec3113c2b 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -41,6 +41,7 @@ properties:
>        - qcom,x1e80100-qmp-gen3x2-pcie-phy
>        - qcom,x1e80100-qmp-gen4x2-pcie-phy
>        - qcom,x1e80100-qmp-gen4x4-pcie-phy
> +      - qcom,x1e80100-qmp-gen4x8-pcie-phy
>  
>    reg:
>      minItems: 1
> @@ -172,6 +173,7 @@ allOf:
>                - qcom,sc8280xp-qmp-gen3x2-pcie-phy
>                - qcom,sc8280xp-qmp-gen3x4-pcie-phy
>                - qcom,x1e80100-qmp-gen4x4-pcie-phy
> +              - qcom,x1e80100-qmp-gen4x8-pcie-phy
>      then:
>        properties:
>          clocks:
> @@ -201,6 +203,7 @@ allOf:
>                - qcom,sm8550-qmp-gen4x2-pcie-phy
>                - qcom,sm8650-qmp-gen4x2-pcie-phy
>                - qcom,x1e80100-qmp-gen4x2-pcie-phy
> +              - qcom,x1e80100-qmp-gen4x8-pcie-phy
>      then:
>        properties:
>          resets:
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
