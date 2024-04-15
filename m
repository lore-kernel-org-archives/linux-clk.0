Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F07D15666E
	for <linux-clk@vger.kernel.org>; Mon, 15 Apr 2024 20:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713211843; cv=none; b=GrMah/KY+C0dxi9uFFcUu23uLfxpSiTijXj7jg4005dyjiFbh5U2Gbg2AAYhwKd9qUQ6QzbQ+CLMJyIxZbRO3PRZHIpN2dY68XVM3fDlVZOvA9gqsfq1t6vBshSe1Ip8+e3/IgRMDPBkBd85vpNSDKuq5TjXSaWBoqOiJ6pAgk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713211843; c=relaxed/simple;
	bh=HlV7PNxjhHZXhDEySUcwKrxlmqDtJcya54wZ5/zd6IE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=alNixvh/OIvMgkC7onPXTlfXw2AG4MRr6wcPgNfX7gDmQlvg5XUtCexwi0nAg7Z6cE+KRKMyWQblyqikb3G0ci9k8KkHRT8TqkWJISfgjkJuWSmbhLL9BiqLk7/lj2TOMiIVA/Ytt+HyJdYuqm3nsAZXMQtBrjTHNG/JA0MV734=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oZFANBZw; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oZFANBZw"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so4332581276.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Apr 2024 13:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713211840; x=1713816640; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N+78Ths3N+m/trnfB/LCX44mWfPui51vN9doYTN2NYM=;
        b=oZFANBZwkHu8WvJVRRD+CRFuevxDlhxI+A9lkRvRlSigCwdUAO6hZfxFwTWQ7u7eXB
         AlypVnLUDVa3aaGgnP7RpSVsZv+mcEQUHEG7mXmt7mDySMdaUwlq9JvfkfiaHArMI7Dr
         vKkTldcwX5Aa1iAuY5QBrEVsPuzyWkx+5nsbH2PpaeknYgiMoLk4cSTHiF0dv1vFGj6H
         2MG9Lu2ILCx7ucX1q9UMJ6kaJouIo5EMz+LNzRYWmVV/bOHD8ej6K8gu9nXS7OcumUjd
         6LaZKON0FXWLW0m3ohDAJmpX4AmRymqrQK/qrrsc+S1H+xn30xG0r7SX64FbmIwe+HQv
         aYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713211840; x=1713816640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+78Ths3N+m/trnfB/LCX44mWfPui51vN9doYTN2NYM=;
        b=GeSJrGmiNb7AC12Jktlh+9Tnn1Uyf3BPwV1T0Gn8cVRPEjUvTkTKD+6d1M2PO4tSCR
         LNSyca1TWyIYlQ6y8v875XdHhtU054EA16fHzTlo8US/ga3W1xf0RAQJxl5vV0956y3X
         7E4PCWcsuKSgrhDFpae8zQq878FmLIoH89B3TC1493IQqu9/Z+q54HylAflaUSUY+ZHP
         P8dcZzoX0EJBmP27P1uW+jBpEFcxQ3mm5xTiMmNP3UzL+pX4lQa6+mMWKGuAklc6Rn/P
         MOnO6kNPoUejandxDoko1wqhNiHlr1ECJjl/qyOVAVZEAvxFrTOuW7y1cR9lUvGHsb5l
         S/Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUoJd/5jtP5r4urLG9eQ4s8SeKoX8BspE5rrxL3Xxskm/l2kNldWSkdiCpDsXwW06imJHjmrDSpwfMqn1vVN33NupNoix3pTygU
X-Gm-Message-State: AOJu0YzhAkBmrknMBYKbLT/tSJRNSjpu7UtMu8uNBixXoW/HbfzBr1oi
	c5i/thKqcLqciVXZy+wK6uUajFXQCyA/VB6uAxwpy/1UM5EQi/huSJ5TcXdVHdN7z/TS8hnbK9f
	qT/t7dq3To6RkqW6f3gsVs7EKFJA9ovsOrbn7/A==
X-Google-Smtp-Source: AGHT+IF3dCILXKJoWIQJ/KpG+i09kWimSM1ct7OC41doCnBTN0/8ltTd5BS3mmOyeIOPSukUr96ntaZGG8MklU++vOk=
X-Received: by 2002:a5b:90e:0:b0:dc2:23b1:eaef with SMTP id
 a14-20020a5b090e000000b00dc223b1eaefmr36360ybq.18.1713211840182; Mon, 15 Apr
 2024 13:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415182052.374494-1-mr.nuke.me@gmail.com> <20240415182052.374494-7-mr.nuke.me@gmail.com>
In-Reply-To: <20240415182052.374494-7-mr.nuke.me@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Apr 2024 23:10:29 +0300
Message-ID: <CAA8EJpqY1aDZMaeqBULEOD26UeGYbLd8RsA16jZw7zXJ7_oGPQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] phy: qcom-qmp-pcie: add support for ipq9574 gen3x2 PHY
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

On Mon, 15 Apr 2024 at 21:23, Alexandru Gagniuc <mr.nuke.me@gmail.com> wrote:
>
> Add support for the gen3x2 PCIe PHY on IPQ9574, ported form downstream
> 5.4 kernel. Only the serdes and pcs_misc tables are new, the others
> being reused from IPQ8074 and IPQ6018 PHYs.
>
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 136 +++++++++++++++++-
>  .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h   |  14 ++
>  2 files changed, 149 insertions(+), 1 deletion(-)
>

[skipped]

> @@ -2448,7 +2542,7 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
>
>  /* list of clocks required by phy */
>  static const char * const qmp_pciephy_clk_l[] = {
> -       "aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux",
> +       "aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux", "anoc", "snoc"

Are the NoC clocks really necessary to drive the PHY? I think they are
usually connected to the controllers, not the PHYs.

>  };
>
>  /* list of regulators */
> @@ -2499,6 +2593,16 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v4x1 = {
>         .rx             = 0x0400,
>  };
>
> +static const struct qmp_pcie_offsets qmp_pcie_offsets_ipq9574 = {
> +       .serdes         = 0,
> +       .pcs            = 0x1000,
> +       .pcs_misc       = 0x1400,
> +       .tx             = 0x0200,
> +       .rx             = 0x0400,
> +       .tx2            = 0x0600,
> +       .rx2            = 0x0800,
> +};
> +
>  static const struct qmp_pcie_offsets qmp_pcie_offsets_v4x2 = {
>         .serdes         = 0,
>         .pcs            = 0x0a00,
> @@ -2728,6 +2832,33 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x1_pciephy_cfg = {
>         .phy_status             = PHYSTATUS,
>  };
>
> +static const struct qmp_phy_cfg ipq9574_pciephy_gen3x2_cfg = {
> +       .lanes                  = 2,
> +
> +       .offsets                = &qmp_pcie_offsets_ipq9574,
> +
> +       .tbls = {
> +               .serdes         = ipq9574_gen3x2_pcie_serdes_tbl,
> +               .serdes_num     = ARRAY_SIZE(ipq9574_gen3x2_pcie_serdes_tbl),
> +               .tx             = ipq8074_pcie_gen3_tx_tbl,
> +               .tx_num         = ARRAY_SIZE(ipq8074_pcie_gen3_tx_tbl),
> +               .rx             = ipq6018_pcie_rx_tbl,
> +               .rx_num         = ARRAY_SIZE(ipq6018_pcie_rx_tbl),
> +               .pcs            = ipq6018_pcie_pcs_tbl,
> +               .pcs_num        = ARRAY_SIZE(ipq6018_pcie_pcs_tbl),
> +               .pcs_misc       = ipq9574_gen3x2_pcie_pcs_misc_tbl,
> +               .pcs_misc_num   = ARRAY_SIZE(ipq9574_gen3x2_pcie_pcs_misc_tbl),
> +       },
> +       .reset_list             = ipq8074_pciephy_reset_l,
> +       .num_resets             = ARRAY_SIZE(ipq8074_pciephy_reset_l),
> +       .vreg_list              = NULL,
> +       .num_vregs              = 0,
> +       .regs                   = pciephy_v4_regs_layout,

So, is it v4 or v5?


> +
> +       .pwrdn_ctrl             = SW_PWRDN | REFCLK_DRV_DSBL,
> +       .phy_status             = PHYSTATUS,
> +};
> +
>  static const struct qmp_phy_cfg sm8250_qmp_gen3x2_pciephy_cfg = {
>         .lanes                  = 2,
>



--
With best wishes
Dmitry
