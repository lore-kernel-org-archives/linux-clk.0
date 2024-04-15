Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163FB156652
	for <linux-clk@vger.kernel.org>; Mon, 15 Apr 2024 20:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713211506; cv=none; b=EGsJn+AZsho/ubay5w6xVWL0gY938Y0NUwN0DzvuHhPxxXTnf0rNUo64qwm9tSuWnMLa4cS6v3TxU1pQBpHX4rnUNcdesZAZR/7WlalfhocqH1HbHNeJGehCuvpi4kx9q7OutspJ0uQ8dQGnQgHkRczqAd1oEFG7DekklCf5J3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713211506; c=relaxed/simple;
	bh=nV/5Zy5i9dFykq8+Srtuq9aQoYYGfbts8T748v9Xj+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3mBqRLpqlh2M+Sg3DtasKHJsnZ5LotVF0etozDUedm4PR2ysF+etD9XpO5RcXsI+gcl94eLRt6H0yAtjfQiYOQmThyOZHapt/pq8qoRE2QblBPJd6xhO7JPW4ColULxgisuksPA4uUsTRN4sGNKlDd7lArJVTyoEAKs/99D7xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uC4jN2nQ; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uC4jN2nQ"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso2374371276.1
        for <linux-clk@vger.kernel.org>; Mon, 15 Apr 2024 13:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713211504; x=1713816304; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pVkD3jsw1msmtxQF4rlyHtOM/X3ToEYL670E+U4G0es=;
        b=uC4jN2nQ1hgGZSSPU6ZZQ5nvKsHXISZFT9X0mUHfKxj9AfKJcn5MnuULTFs8OSpzKx
         UYNfr8tPyhl8Y83NlrTMIZ6gviJKVQnac0eJuiLcI8xuwxPAk3+Yz7Iq4Uo7Tm3WQFLL
         QHbABbJoeu6Tqt/nwGEJNFYYCWM4WJGdK4IfHyZ5b0218BIKE9HIE8KOD0gv3vem52gk
         KxKd4vP14H7RyPdVf60yqSGrSdw3aJ7jFPbN6TxY2iWzQcVde0VL/HHurvh2rHgZGP1m
         njB/KZeppUj9WueUe/9M4SK0GY10t9aVOkHBS9yyIY7HdDxWp5JOzcWeS5L6h3EnSRFW
         4s2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713211504; x=1713816304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVkD3jsw1msmtxQF4rlyHtOM/X3ToEYL670E+U4G0es=;
        b=MSHb2zWffeBo1ZuICJssm0ACS5sGCB9QCXXitiIu7nGpY6V+GCrH2++tDVisNJZiKT
         qEwL1GHHq/SbMOIGiAvUgdQOHx8BLMg4sEjvdIOmr/WY0vdhehEzE+3nXwM63wDWelCX
         Rdq1PThDg6ij1hLdaWYB+dMDzUrbC3VY86j7GGlAeoFOsoqHVIleqJjunBKy+nTpxCST
         VTKiC8EOmRFRfxSKhixF9sZCpo7qRWWsHIhMrPqzxZ8Pfy6OlhuZNesrvJvFKfmd3wBV
         v4eNfnYD1CXM/sGdUIa7PDab9Rt/gV62Z0MZn+wriFU6RKPkpKUtWNVTlULcG4wbZZfA
         9GFA==
X-Forwarded-Encrypted: i=1; AJvYcCXQuaRC7QGbe1bp3sZmyf0rVZmp92ccrHDym+c9fxjtRD7nJtyG8GKgjHJ7ta9nEKfXLfasYEA04O6vIxbMDdCNjER5g+mJ/K1P
X-Gm-Message-State: AOJu0YxWhRT+zFxm86df/hTJ8euP/qrn+lLqYbU/My573U8S791pi2bD
	0K5p0ivOf6dthvmsk44yotgWjUCLmATEeEyQZSxLHyKzfigRqd2ZdYc8daL/rSLAQRjAcsHWW3R
	XjDcXUAcDqO8Lvcqd4ukj4jxL0oiL+xIOL11sKg==
X-Google-Smtp-Source: AGHT+IF3Mae4SNhDlErp9j9yGTNWys2//EJwilymG79SRLAHm+Fa1djrn4pEPWZZFliwe11Jn8vFW2dJFT9lgX1FVfM=
X-Received: by 2002:a25:1942:0:b0:dcf:bc86:1020 with SMTP id
 63-20020a251942000000b00dcfbc861020mr10239771ybz.53.1713211504061; Mon, 15
 Apr 2024 13:05:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415182052.374494-1-mr.nuke.me@gmail.com> <20240415182052.374494-5-mr.nuke.me@gmail.com>
In-Reply-To: <20240415182052.374494-5-mr.nuke.me@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Apr 2024 23:04:53 +0300
Message-ID: <CAA8EJpqKWJBqDUacE0xTLzxny32ZTStiRgXsd2LBD=Hou_CRBw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] PCI: qcom: Add support for IPQ9574
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Apr 2024 at 21:22, Alexandru Gagniuc <mr.nuke.me@gmail.com> wrote:
>
> Add support for the PCIe on IPQ9574. The main difference from ipq6018
> is that the "iface" clock is not necessarry. Add a special case in
> qcom_pcie_get_resources_2_9_0() to handle this.
>
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 14772edcf0d3..10560d6d6336 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1101,15 +1101,19 @@ static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
>         struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
>         struct dw_pcie *pci = pcie->pci;
>         struct device *dev = pci->dev;
> -       int ret;
> +       int ret, num_clks = ARRAY_SIZE(res->clks) - 1;
>
> -       res->clks[0].id = "iface";
> +       res->clks[0].id = "rchng";
>         res->clks[1].id = "axi_m";
>         res->clks[2].id = "axi_s";
>         res->clks[3].id = "axi_bridge";
> -       res->clks[4].id = "rchng";
>
> -       ret = devm_clk_bulk_get(dev, ARRAY_SIZE(res->clks), res->clks);
> +       if (!of_device_is_compatible(dev->of_node, "qcom,pcie-ipq9574")) {
> +               res->clks[4].id = "iface";
> +               num_clks++;
> +       }
> +
> +       ret = devm_clk_bulk_get(dev, num_clks, res->clks);

Just use devm_clk_bulk_get_optional() here.

>         if (ret < 0)
>                 return ret;
>
> @@ -1664,6 +1668,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>         { .compatible = "qcom,pcie-ipq8064-v2", .data = &cfg_2_1_0 },
>         { .compatible = "qcom,pcie-ipq8074", .data = &cfg_2_3_3 },
>         { .compatible = "qcom,pcie-ipq8074-gen3", .data = &cfg_2_9_0 },
> +       { .compatible = "qcom,pcie-ipq9574", .data = &cfg_2_9_0 },
>         { .compatible = "qcom,pcie-msm8996", .data = &cfg_2_3_2 },
>         { .compatible = "qcom,pcie-qcs404", .data = &cfg_2_4_0 },
>         { .compatible = "qcom,pcie-sa8540p", .data = &cfg_sc8280xp },
> --
> 2.40.1
>
>


-- 
With best wishes
Dmitry
