Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC05619FA92
	for <linux-clk@vger.kernel.org>; Tue, 27 Aug 2024 11:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724759064; cv=none; b=CTjiPZ+ZbjnZ+8324k8b95gkpuDzW/s+sIksAAOoe9QBGHwE/P6GVEWC68WB363GRxB9YwrHfrzCGxkhXj1pS1vHXVG9/PWtA254jde1Au/Ko4HdOCD6rYJINy2/Tq/wbz3ujdkxwHcw1jgSFa4YpjkgvBO8MwPeJm8RJfK/SvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724759064; c=relaxed/simple;
	bh=M5U58xavEfJS9Jq3NPUxRrcl06l5is/NdCI503mKL7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MSrvaFCh/KgzJR9d92vH7ZWo1JJ3e2N8F7MWkelkJ0V8DXW3Jk/ReaFNs5hnaLL0v/6/2K8+skJ/ytCaSaassm12KuHJzUXZrFwlPDklQxDglrSIL/Ye3Fxxu/MxPpNox8CkkZHhIoyAPtXJZH2V/k8MOE4vclXnGsHKON0T22s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u5QNvds/; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u5QNvds/"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6cdae28014dso15622657b3.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Aug 2024 04:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724759061; x=1725363861; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HbrPQE8jRD81MclT20thBdKrMQOQNi57XSGQvxTWTS4=;
        b=u5QNvds/XVIi+SZ5jk6z8LK5MUJqbWdLoBza2GyDn8T9Frefwg4uc1Rw56BqGGG6UG
         HY+P+1VqR8gNzCIgE/ac3S6bTYAmCgDcNWNImNQHHYaLm1u1O/UoB/sy8ItlT1zvUqf9
         GK1GIJ5eP1XTWgUYcy23izncuTctjhkdcR65BpHj8JP9hDhiCXz8XK9dGOdMIJltWrQU
         DffhrPxk2aGT7iJNYpD7qqP0H8AI+UW2o2GyxYsSUN4dCLXkHGTsPEGq6StsgRRH/36y
         elb8GBpFocwNlBwzQmeG/myFbhWnkPSC8KMyjeufpbo+RN2O8nb9ltzVHM2cIZicnkIK
         arWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724759061; x=1725363861;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbrPQE8jRD81MclT20thBdKrMQOQNi57XSGQvxTWTS4=;
        b=OsehrUNkXbuH6HUkLbYkoHFiyFUMRtpn9pwY03w4fd/JsMuHXGrWXfTrMXmsYrTlLX
         OmnXETVC5y7EJobrZsDwcTw05/XhtF2ofZso0PWarHUWu5gHteBoXZm0hXbFruwoiLLo
         TOh79LKGvYioWDHZ7mdEA9NTCEk220jbbRyXYh8NdQVx6SyWAeOYKiy7MIq3kED+6+p2
         FCEyKeazEaMyk0HIp0vbvrg0DHIuwjCiwH0t7eowolwFSReV0gRcKC9LjWvvTrtj/uwl
         vQ7X6O4zyamxiGV+EZ0dfvLbxqb305Mep0nKVwc89WEvjpvFwYuJ/O0hEeG2Js0B5aw8
         Vg+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuRlIduT4DFd6oOkDlzRwIGXKn+6DPZFR5XSID/PENnvgAJQ7MoPMS8CNmhUZ3/CzZXddC3RTl3pw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLIm1d1+YT3iuim7am6oIg1AzosxcpkqnFrhpmRhBc3aY557oL
	JDZLAkjaTQAoyCpi1LCobpUnLWyAccU36g0h0vDsdMtKBIoRzgi7rHP5Bp4WZ3whI5W2ECP/rLg
	Ns16LqpigaE99lnvdUcLSwM8S69XGes7ne79Ubg==
X-Google-Smtp-Source: AGHT+IEFbOl3EI7OwCA2RA3WFV/8KK9lP4+cyNXB+PQIqHygNosqXZpSCOmLNbYe18abw+wdIinxpT2b9VOQqGYfq/w=
X-Received: by 2002:a05:690c:6c09:b0:6ad:c9bd:3812 with SMTP id
 00721157ae682-6cfb3fde15cmr20895397b3.17.1724759060653; Tue, 27 Aug 2024
 04:44:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827063631.3932971-1-quic_qianyu@quicinc.com> <20240827063631.3932971-9-quic_qianyu@quicinc.com>
In-Reply-To: <20240827063631.3932971-9-quic_qianyu@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 27 Aug 2024 14:44:09 +0300
Message-ID: <CAA8EJpq5KergZ8czg4F=EYMLANoOeBsiSVoO-zAgfG0ezQrKCQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] PCI: qcom: Add support to PCIe slot power supplies
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, vkoul@kernel.org, kishon@kernel.org, 
	robh@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, abel.vesa@linaro.org, quic_msarkar@quicinc.com, 
	quic_devipriy@quicinc.com, kw@linux.com, lpieralisi@kernel.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Aug 2024 at 09:36, Qiang Yu <quic_qianyu@quicinc.com> wrote:
>
> On platform x1e80100 QCP, PCIe3 is a standard x8 form factor. Hence, add
> support to use 3.3v, 3.3v aux and 12v regulators.

First of all, I don't see corresponding bindings change.

Second, these supplies power up the slot, not the host controller
itself. As such these supplies do not belong to the host controller
entry. Please consider using the pwrseq framework instead.

>
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 52 +++++++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 6f953e32d990..59fb415dfeeb 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -248,6 +248,8 @@ struct qcom_pcie_cfg {
>         bool no_l0s;
>  };
>
> +#define QCOM_PCIE_SLOT_MAX_SUPPLIES                    3
> +
>  struct qcom_pcie {
>         struct dw_pcie *pci;
>         void __iomem *parf;                     /* DT parf */
> @@ -260,6 +262,7 @@ struct qcom_pcie {
>         struct icc_path *icc_cpu;
>         const struct qcom_pcie_cfg *cfg;
>         struct dentry *debugfs;
> +       struct regulator_bulk_data slot_supplies[QCOM_PCIE_SLOT_MAX_SUPPLIES];
>         bool suspended;
>         bool use_pm_opp;
>  };
> @@ -1174,6 +1177,41 @@ static int qcom_pcie_link_up(struct dw_pcie *pci)
>         return !!(val & PCI_EXP_LNKSTA_DLLLA);
>  }
>
> +static int qcom_pcie_enable_slot_supplies(struct qcom_pcie *pcie)
> +{
> +       struct dw_pcie *pci = pcie->pci;
> +       int ret;
> +
> +       ret = regulator_bulk_enable(ARRAY_SIZE(pcie->slot_supplies),
> +                                   pcie->slot_supplies);
> +       if (ret < 0)
> +               dev_err(pci->dev, "Failed to enable slot regulators\n");
> +
> +       return ret;
> +}
> +
> +static void qcom_pcie_disable_slot_supplies(struct qcom_pcie *pcie)
> +{
> +       regulator_bulk_disable(ARRAY_SIZE(pcie->slot_supplies),
> +                              pcie->slot_supplies);
> +}
> +
> +static int qcom_pcie_get_slot_supplies(struct qcom_pcie *pcie)
> +{
> +       struct dw_pcie *pci = pcie->pci;
> +       int ret;
> +
> +       pcie->slot_supplies[0].supply = "vpcie12v";
> +       pcie->slot_supplies[1].supply = "vpcie3v3";
> +       pcie->slot_supplies[2].supply = "vpcie3v3aux";
> +       ret = devm_regulator_bulk_get(pci->dev, ARRAY_SIZE(pcie->slot_supplies),
> +                                     pcie->slot_supplies);
> +       if (ret < 0)
> +               dev_err(pci->dev, "Failed to get slot regulators\n");
> +
> +       return ret;
> +}
> +
>  static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>  {
>         struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -1182,10 +1220,14 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>
>         qcom_ep_reset_assert(pcie);
>
> -       ret = pcie->cfg->ops->init(pcie);
> +       ret = qcom_pcie_enable_slot_supplies(pcie);
>         if (ret)
>                 return ret;
>
> +       ret = pcie->cfg->ops->init(pcie);
> +       if (ret)
> +               goto err_disable_slot;
> +
>         ret = phy_set_mode_ext(pcie->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
>         if (ret)
>                 goto err_deinit;
> @@ -1216,7 +1258,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>         phy_power_off(pcie->phy);
>  err_deinit:
>         pcie->cfg->ops->deinit(pcie);
> -
> +err_disable_slot:
> +       qcom_pcie_disable_slot_supplies(pcie);
>         return ret;
>  }
>
> @@ -1228,6 +1271,7 @@ static void qcom_pcie_host_deinit(struct dw_pcie_rp *pp)
>         qcom_ep_reset_assert(pcie);
>         phy_power_off(pcie->phy);
>         pcie->cfg->ops->deinit(pcie);
> +       qcom_pcie_disable_slot_supplies(pcie);
>  }
>
>  static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
> @@ -1602,6 +1646,10 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>                         goto err_pm_runtime_put;
>         }
>
> +       ret = qcom_pcie_get_slot_supplies(pcie);
> +       if (ret)
> +               goto err_pm_runtime_put;
> +
>         ret = pcie->cfg->ops->get_resources(pcie);
>         if (ret)
>                 goto err_pm_runtime_put;
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
