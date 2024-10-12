Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0364012C489
	for <linux-clk@vger.kernel.org>; Sat, 12 Oct 2024 04:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728706470; cv=none; b=c05cLQjKd34GNT/QzMeEjswFYC2I0ucdr4Jfzqq0eI05Ivu6/+jePXJ158kDJn2yZv800rRoL/PZR0D6nXyKQaoxXjeOW0PeXdliU957pxL8sgHKItQYslm7wxqMy+Ha6V4W8srBGpWMJlQV9uKd2M7ASONbPZ4Ds6MO6LpHndw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728706470; c=relaxed/simple;
	bh=SuTMPHuKCPfjSdaSBGFmOzbjda4a5abih9KxQ1+GEnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpQNOJgsqoDjr57RE1Dv20ee/daoEs5plsLBmKLHiQWrtYGfs8IIDEKqHJFiRHchDx6y5ZLXhDLaSgoUuTv2fh4NX9Ob1YAwsyPWWZDFEVJz/1/PPzfehIESDOX/WxBmlPNka+SohRc03Vhe3GqnJofWc2Kz3YWrP1lImZOX8w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eRWsNrf1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eRWsNrf1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20c693b68f5so27782385ad.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Oct 2024 21:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728706467; x=1729311267; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RJqJylDUeKhlaDFX6bqWWTyQxNxM099zR8Q/xSAgz7I=;
        b=eRWsNrf1emWuZQoNuj4A8ALElGTFmiBk3FPBwfxicVn364myMvC3qXOYTdQDlp34Vq
         o77BfUbxTQCqjjJpvp+RfL/Zpbxfgq0442uE5PEdTMH+CXeBVWMeu5TKcvtj1Z2RPk9R
         JbaW9fraV96i8KzvfA9Wlt/T8oi8KZKaMqLfJhFwBPN5qNjzqHRMN2rGyPg+eBauHQEh
         mDNwpdYPtwqtEh40YE68WgSoK1I8a61aPzCcjGTAIfWecXkj7Y6ee0tH1ZQmUfsNKVjE
         wovUQD2GpQYmCKIoj7wBxqGErRke+VoIYXCgYeyANe9gpzxSatVL+WBuOaZKgNlL13vT
         rIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728706467; x=1729311267;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJqJylDUeKhlaDFX6bqWWTyQxNxM099zR8Q/xSAgz7I=;
        b=wugW0CNEqFZ1Njx3w9wDAZI1HXx/AuG3VaCV+fFEc2gKPDw9NB9PWKWYWVdbxAYZ1A
         sHadWgOUQgPLzyAa2SlOjQt7sbAZRquTWs4/Txn9iHFrp0g5/53/HBkHN7jzDvI5ITSv
         KFu57FS2cKYf4YVT6W8kKwvneXFhhMk9+8JG3rJXE0diqwjVuEYa28i/sa0Lk3SaEZkb
         KHX1LRMTE2K6EJMHSMUymGaQheb5mpzSLwjAZMR61HIKC5dv/i9HW/MvpQSEPvduwIxn
         S+iY1Z5NCbLr9Vaidgmx8GXrRakDuXo9BY4Ft3gMoLL1Fx/q55Wl/yhiqDX+OT1HO9ck
         jGEg==
X-Forwarded-Encrypted: i=1; AJvYcCV1sfoikNzIfsLgTgX6/6YZ+NzGUmQgmMmcsQ1YGbPYlsJ/xjneFRF3Vmrhje+DJzqyKL7OJvh5mLA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvw1LSxkl14F1E3T+l2TCSxgPWOA+EOB8UgRqPimF5oPdExpdK
	DGnrPVBybKCWLmCCYxmj8ijVDuzaDFMxg4WPqa4wAkw7kiAIeJVxygE7zIpVUA==
X-Google-Smtp-Source: AGHT+IG+BMnbXVlgycfAEQ8uJvs3Se6DUQ9wtZpS90iXCykE8vg47B3NvxzG9M8NmLIkK1/Q56WHaA==
X-Received: by 2002:a17:902:e5ca:b0:20c:8839:c515 with SMTP id d9443c01a7336-20ca16c5a89mr72940785ad.56.1728706467277;
        Fri, 11 Oct 2024 21:14:27 -0700 (PDT)
Received: from thinkpad ([36.255.17.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bad991csm30855765ad.55.2024.10.11.21.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 21:14:26 -0700 (PDT)
Date: Sat, 12 Oct 2024 09:44:20 +0530
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
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 1/8] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document the X1E80100 QMP PCIe PHY Gen4 x8
Message-ID: <20241012041420.uwcnzmdcm6kcjho5@thinkpad>
References: <20241011104142.1181773-1-quic_qianyu@quicinc.com>
 <20241011104142.1181773-2-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241011104142.1181773-2-quic_qianyu@quicinc.com>

On Fri, Oct 11, 2024 at 03:41:35AM -0700, Qiang Yu wrote:
> PCIe 3rd instance of X1E80100 supports Gen 4 x8 which needs different
> 8 lane capable QMP PCIe PHY with hardware revision v6.30. Document Gen
> 4 x8 PHY as separate module.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
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
