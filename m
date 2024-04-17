Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFD86A029
	for <linux-clk@vger.kernel.org>; Wed, 17 Apr 2024 07:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713337593; cv=none; b=BOu5zZn1ynD7Uyt+X9n4juwzSVo/D9X3xvudAwUEdWHL27g7Jsd5ZeRtukThe8EASqv4n1yW6eYCFrfq7ze3U/OtUDSYfAILNDyc1y9NK2y34WG651ulYzsmstNlzxspR4ypGFdN0DjtMnegn4czK8ybwbOA7QE3i2G9yb74t/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713337593; c=relaxed/simple;
	bh=TOB6vp87U9Lnnn2dsE4owyfBnMI3t4WxK3sGEUGR9XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkjCp84EnqpkjD7UpAgUEk9QlAonZJRE4SCVRwqcdmGdbpQzCYpKRqhQjl6FxrZzAo7XK8Lij7Om4TDSJ4BS6C/bKKgJbu299FWWfQ9SJE5ZQ/nq0iJKQhGEoXSs9YWiEpm1eqwf6tQEEOau1BiM3s2ySk8W4Ie/sQDGsilEIks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RUgCveJ6; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RUgCveJ6"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6eced6fd98aso4732592b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Apr 2024 00:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713337590; x=1713942390; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Id9wk8bOD3jpvQHQWy0txCOh7lELBvXiW74KprcLKWE=;
        b=RUgCveJ6QvF6PTGt7ORkajy1ZJT0hzUkS+VzTq0m7bBQK76HZD6gOQfWlXzMxBhbbY
         6x15t1OU4V+r5YPUekLHJ64SYD7wEfqxTaBzGk2tNM1GUn7K9bccuat+UlGjxUFuo4Op
         V4BySagYccoRpTJM9+hwiOpYzwb/iR/Cfds4JQe8RB9Dol9V8UHbrCEkGRCyNS8Jbkz8
         kHHkcV9LP3cuEzXtc7YN+/oSRq9X96dQtLr9oWF7Nbm61cXZDo2hLmZBZwGjFOONYuo0
         /Vhvd39mDdN6pZhYZ7/L/XkqqzYgChHFUNVwlFGav0SZCUDAKCAarm8BKlUWp/J8nx4a
         UzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713337590; x=1713942390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Id9wk8bOD3jpvQHQWy0txCOh7lELBvXiW74KprcLKWE=;
        b=UYmMHQA/SQ1GRs0wEC5B6FjsPEP61MLDF6fEHdqGKtSRMAIoWp0IV1W6CPiuB6UBdu
         nAP9r2HP0HhgLf4UKQ90dTKN6QGkjJGRevHn3q0u0sDh5NfHWr5+9R5GFAJCVFjhUSqb
         jqKUmYNGesZhMYLfirZsE4ZjqtnPe8RrqC3sj1QHhs6HKxTngMDGOYMeRS7rRod9l7Uq
         FG7xx6iEGuJErrdKR7NkuiSY8S0aqdCiYynVT9gTBOxWzX/TxrvWFU/O1OUgAtigZMc2
         FuE9oOdu5fGOIiqVAJXQu3AqcF1DZz6sJMvsebC1NMGdniK0jJxSwrefDvq1fNBfMHL3
         q5hA==
X-Forwarded-Encrypted: i=1; AJvYcCVGAYajv+HjQyK3kizF5BCfucdSIsymRODYkOQrra/YS8tl57LRTmBT3ABUeoiME5yxWEZJExiNCCoqAiTQHWWihPaS/nbSeRAT
X-Gm-Message-State: AOJu0YxMT4uvNMW/rLToJR1rnXOo4e2pKZxZ3meiUAgDI4aK3FxRkgw7
	QmvhehbWsMmWa1z3AVR6CEYJwF6IEEwrrk594dYbfCBe/t0uNELFDwuOMQ55Cw==
X-Google-Smtp-Source: AGHT+IH83KUdU6BtzRYL1t2NbRvI4qrrCGxtRd9cEdm+JtEHXxziFKFvGoFUMzWi78eYTsfdqTGaMA==
X-Received: by 2002:a05:6a21:3a85:b0:1aa:755f:1746 with SMTP id zv5-20020a056a213a8500b001aa755f1746mr911915pzb.22.1713337589983;
        Wed, 17 Apr 2024 00:06:29 -0700 (PDT)
Received: from thinkpad ([120.60.54.9])
        by smtp.gmail.com with ESMTPSA id a21-20020aa78655000000b006e6c16179dbsm10134759pfo.24.2024.04.17.00.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 00:06:29 -0700 (PDT)
Date: Wed, 17 Apr 2024 12:36:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mr.nuke.me@gmail.com
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 4/7] PCI: qcom: Add support for IPQ9574
Message-ID: <20240417070616.GB3894@thinkpad>
References: <20240415182052.374494-1-mr.nuke.me@gmail.com>
 <20240415182052.374494-5-mr.nuke.me@gmail.com>
 <CAA8EJpqKWJBqDUacE0xTLzxny32ZTStiRgXsd2LBD=Hou_CRBw@mail.gmail.com>
 <3cfc26e6-5587-d4a2-f217-1a30169ad1a0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3cfc26e6-5587-d4a2-f217-1a30169ad1a0@gmail.com>

On Mon, Apr 15, 2024 at 03:07:02PM -0500, mr.nuke.me@gmail.com wrote:
> 
> 
> On 4/15/24 15:04, Dmitry Baryshkov wrote:
> > On Mon, 15 Apr 2024 at 21:22, Alexandru Gagniuc <mr.nuke.me@gmail.com> wrote:
> > > 
> > > Add support for the PCIe on IPQ9574. The main difference from ipq6018
> > > is that the "iface" clock is not necessarry. Add a special case in
> > > qcom_pcie_get_resources_2_9_0() to handle this.
> > > 
> > > Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> > > ---
> > >   drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++----
> > >   1 file changed, 9 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > index 14772edcf0d3..10560d6d6336 100644
> > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > @@ -1101,15 +1101,19 @@ static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
> > >          struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
> > >          struct dw_pcie *pci = pcie->pci;
> > >          struct device *dev = pci->dev;
> > > -       int ret;
> > > +       int ret, num_clks = ARRAY_SIZE(res->clks) - 1;
> > > 
> > > -       res->clks[0].id = "iface";
> > > +       res->clks[0].id = "rchng";
> > >          res->clks[1].id = "axi_m";
> > >          res->clks[2].id = "axi_s";
> > >          res->clks[3].id = "axi_bridge";
> > > -       res->clks[4].id = "rchng";
> > > 
> > > -       ret = devm_clk_bulk_get(dev, ARRAY_SIZE(res->clks), res->clks);
> > > +       if (!of_device_is_compatible(dev->of_node, "qcom,pcie-ipq9574")) {
> > > +               res->clks[4].id = "iface";
> > > +               num_clks++;
> > > +       }
> > > +
> > > +       ret = devm_clk_bulk_get(dev, num_clks, res->clks);
> > 
> > Just use devm_clk_bulk_get_optional() here.
> 
> Thank you! I wasn't sure if this was the correct solution here. I will get
> this updated in v4.
> 

Please rebase on top of [1] and mention the dependency in cover letter.

- Mani

[1] https://lore.kernel.org/linux-pci/20240417-pci-qcom-clk-bulk-v1-1-52ca19b3d6b2@linaro.org/

> Alex
> 
> > >          if (ret < 0)
> > >                  return ret;
> > > 
> > > @@ -1664,6 +1668,7 @@ static const struct of_device_id qcom_pcie_match[] = {
> > >          { .compatible = "qcom,pcie-ipq8064-v2", .data = &cfg_2_1_0 },
> > >          { .compatible = "qcom,pcie-ipq8074", .data = &cfg_2_3_3 },
> > >          { .compatible = "qcom,pcie-ipq8074-gen3", .data = &cfg_2_9_0 },
> > > +       { .compatible = "qcom,pcie-ipq9574", .data = &cfg_2_9_0 },
> > >          { .compatible = "qcom,pcie-msm8996", .data = &cfg_2_3_2 },
> > >          { .compatible = "qcom,pcie-qcs404", .data = &cfg_2_4_0 },
> > >          { .compatible = "qcom,pcie-sa8540p", .data = &cfg_sc8280xp },
> > > --
> > > 2.40.1
> > > 
> > > 
> > 
> > 

-- 
மணிவண்ணன் சதாசிவம்
