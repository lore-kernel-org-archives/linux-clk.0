Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7A07E76D
	for <linux-clk@vger.kernel.org>; Sat, 12 Oct 2024 05:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728711409; cv=none; b=GwrV+M6IbC3O3k8/2Q8gSGiZgURfVGW0OpbED4Sw5IufM58rj87kcerxbtL3LiDb/YtM5/vqluPrLZwuHDF66iJ+LJ0AC3iZrKn39QvI5trVJYuIMO2C4eB0GtWeC4cHHKd/XJTXXKu2VkgxbGws7zFgdahg0+TxkHpqFOsmrlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728711409; c=relaxed/simple;
	bh=id6bl7x2+/RADHJgpgSgWPIftbgTDqmwOH9HR9CntpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lu/8QVoXGQOW1ICjeql4D49auA8Ywy5Qi92MeB6xDqjmBSf2HeZx1OnUL4Ly+P2F78R5ONCNKieRLiknV96mnOc02eYzd+jnGzpAT0sfpyMnUksylXzktyzkLqHl3JekYBL0yydfYMf4iQX3TTNYY3IPzTJSfqw6O0R+pXEadlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fe9T5oMg; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fe9T5oMg"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e2a999b287so2212488a91.0
        for <linux-clk@vger.kernel.org>; Fri, 11 Oct 2024 22:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728711406; x=1729316206; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MjQuIV6kj3VfwRWddXnrTlmwecAWDBUJYA1PrNxHudo=;
        b=Fe9T5oMg4fjcyqgrGozD/NgYo8G4IIuNAJnZeWpGTeWI5nCPy0IDjuNomWDTPC/ynt
         3/E9WmqGi8I40NyC0C0znvyW+F3betQRryykUfvz36TiW5ou9zP9RdaUhPyoQ6PkvAeG
         cC1MguNIwZv375x6cShNNep2nHrMZlJmspz1NPTRJDJHXDNLaRYggmG+O/60z0u0xeTP
         msPU8UMwb19VrEkfLY7zT0KlIuLC1/g1PEsH26w72+Cn4sOFeFPd1kdoZ2xs1R5LwK0Z
         xZwxLhjNz8xMFMlpVFFUFcYJuPKNpXkshh74rF8mLs35ANGAEZvnIv2x+Qql4+4vIovr
         jfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728711406; x=1729316206;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MjQuIV6kj3VfwRWddXnrTlmwecAWDBUJYA1PrNxHudo=;
        b=TLdZY7e5cu9AUVb62t2r146rDUpePWnjJU45UUdBZl6w08taXzDB2B5q46LPjg2vYQ
         Ch2I6zVt/7bByKGIrtWUPriiYF3k7+Oext99i/01qdFER7/zUtKXODPnqPO4ju0sTwb2
         FvVB2oG5Bedagbt9L40BSBupXg6bhFjVf9UcmByLhOb8ogu4RRCgYLaKsu3AwYzLNxoa
         pUVmfbpADZT77EMQo4svgnx29gE6zM7ebqR9qcp97Y1tUVb87pqt/VO8nuOu4ysVBrNk
         VobTBfo4QOCEKhopf33KxmxLmN8AZtQvS/8gkqA4S1efdbXnufiFTrRNR04N/OFaCl1R
         lXFw==
X-Forwarded-Encrypted: i=1; AJvYcCWmdpqBK8aXq0hlcOjrjOfih1OwvDWcIHS8i5lB5BEi7nRRGWI8xo6HA3yWasffMZIAeI7lr2N5Pxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUY3zgeea9Qw7atE0q5D0M6l8BGBn3DdlGoR9ZodNUSjAaLvS7
	CxtzAnhyElQ+I4l12IyKK2PzZA6aowJD4VRZShdkXNVKpgcIVpYm3lhpZwqDkQ==
X-Google-Smtp-Source: AGHT+IHqiyyz1xhjY6vqhIqY84FxPaW6G2o/VAwjL/1LFjW/xaek+9WCg+PZY5ymNnouaWkyvQGCag==
X-Received: by 2002:a17:90b:893:b0:2e0:a47a:5eb0 with SMTP id 98e67ed59e1d1-2e2f0da8051mr5652417a91.38.1728711406131;
        Fri, 11 Oct 2024 22:36:46 -0700 (PDT)
Received: from thinkpad ([220.158.156.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a36417afsm6683894a91.0.2024.10.11.22.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 22:36:45 -0700 (PDT)
Date: Sat, 12 Oct 2024 11:06:37 +0530
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
Subject: Re: [PATCH v6 7/8] PCI: qcom: Fix the cfg for X1E80100 SoC
Message-ID: <20241012053637.cu2eyle6d7gbqsth@thinkpad>
References: <20241011104142.1181773-1-quic_qianyu@quicinc.com>
 <20241011104142.1181773-8-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241011104142.1181773-8-quic_qianyu@quicinc.com>

On Fri, Oct 11, 2024 at 03:41:41AM -0700, Qiang Yu wrote:
> Currently, the cfg_1_9_0 which is being used for X1E80100 has config_sid
> callback in its ops and doesn't disable ASPM L0s. However, as same as
> SC8280X, PCIe controllers on X1E80100 are connected to SMMUv3 and it is

"...connected to SMMUv3, hence doesn't need config_sid() callback"

> recommended to disable ASPM L0s. Hence reuse cfg_sc8280xp for X1E80100.

"...and hardware team has recommended to disable L0s as it is broken in the
controller."

> 
> Fixes: 6d0c39324c5f ("PCI: qcom: Add X1E80100 PCIe support")
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

We need to backport this patch to stable to fix the L0s handling. But we don't
need the previous patch as even without that cfg_sc8280xp disables L0s.

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 468bd4242e61..c533e6024ba2 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1847,7 +1847,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>  	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
>  	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
>  	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
> -	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_1_9_0 },
> +	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_sc8280xp },
>  	{ }
>  };
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
