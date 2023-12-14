Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HW2dUlKu"
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBA9107
	for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 23:15:57 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5cbcfdeaff3so78180977b3.0
        for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 23:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702538156; x=1703142956; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hyuj6L4AEIo77b1y5Vbh5MTrD0n68EvFYvH7xGhCjqA=;
        b=HW2dUlKuh5ESUmOaYRbiyzbvaDRcmFw2QlVR3dGYxoYY67WfLWhwJkf9aMmGkWyTp4
         wsNFeQinxl3D9mBay7BhlCy2dJ1NaVz9AZrFIPikHQeeSKbXfe1fEyDWI5ssjI41YmUa
         yNTIVS/g043RyNT0CLAQkdE2OmqTMuvqsOGX71IqOI51+YPiafFSHg2KfqdN9INXqu5S
         jTS+rFJoSyHZLb1R9tr32CJQe4NuFjNSmwZoPH8+8GicVX12jPv+dr3mO+FsHgrkiU5v
         0EvAoyrZIreVSge7g8N60KOjR1RlNW4Wx0JBYdrubeoRK3HqT6DQpDhyg3YNLA63WjdR
         3nQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702538156; x=1703142956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hyuj6L4AEIo77b1y5Vbh5MTrD0n68EvFYvH7xGhCjqA=;
        b=qUq0AAkMp8AclZ6wAcjD09nWmmnMT4796cVkDiHByGM2QkB6wgjOpW989oyviPEDBu
         /3UG+buUwAfTv0vaJ+e5lTEYqxq+RCNF/J71gkO4Wl/LzK2tzU5+85lBE06509+p+Omd
         9C9lbPsuTuO3H+xXlaCVxxmBb0sBdM8fqZ+MjCHKMqdNIe/oyJcMyC5WrtYJFBxpTznX
         BTiWgYsBkIM4WStKO826kXEYGeilGI4Ud27q4x9i3bGFCU5Fv70xFyBZVRyzprtzxDN0
         cL1mifiIYSQYwlQIFHZs1ShH51C69rM82aciGRWpDFejAx1B+f8HWJAIafgJeaU5D5VI
         2m7Q==
X-Gm-Message-State: AOJu0Yz6l1/lmNtDXpmHxTm6lP9DPAzly7OgJDnDGM207yTj5i1FKSTG
	0e1SMSztpG0GQCsrOJjwmrZmKgVEbRAv/DCqP2qMEw==
X-Google-Smtp-Source: AGHT+IH3+Sw3exQcLiS7Au2pmyJWOiOy946o670EL9T8G4UD/WLVLtSaMDRzk5R+ja2Q0rT5BFDKfRPi9nleUY6Lf3Q=
X-Received: by 2002:a81:c30e:0:b0:5e3:9b5f:e3f with SMTP id
 r14-20020a81c30e000000b005e39b5f0e3fmr358653ywk.59.1702538156139; Wed, 13 Dec
 2023 23:15:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214062847.2215542-1-quic_ipkumar@quicinc.com> <20231214062847.2215542-8-quic_ipkumar@quicinc.com>
In-Reply-To: <20231214062847.2215542-8-quic_ipkumar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 09:15:45 +0200
Message-ID: <CAA8EJppyd5-TQmvzRB3rBhRQtMLdu=6u5aQd5rWHitRuaJXzpA@mail.gmail.com>
Subject: Re: [PATCH 07/10] dt-bindings: PCI: qcom: Add IPQ5332 SoC
To: Praveenkumar I <quic_ipkumar@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, bhelgaas@google.com, 
	lpieralisi@kernel.org, kw@linux.com, vkoul@kernel.org, kishon@kernel.org, 
	mani@kernel.org, quic_nsekar@quicinc.com, quic_srichara@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	quic_varada@quicinc.com, quic_devipriy@quicinc.com, quic_kathirav@quicinc.com, 
	quic_anusha@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Dec 2023 at 08:30, Praveenkumar I <quic_ipkumar@quicinc.com> wrote:
>
> Add support for the PCIe controller on the Qualcomm
> IPQ5332 SoC to the bindings.
>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> ---
>  .../devicetree/bindings/pci/qcom,pcie.yaml    | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> index eadba38171e1..af5e67d2a984 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> @@ -21,6 +21,7 @@ properties:
>            - qcom,pcie-apq8064
>            - qcom,pcie-apq8084
>            - qcom,pcie-ipq4019
> +          - qcom,pcie-ipq5332
>            - qcom,pcie-ipq6018
>            - qcom,pcie-ipq8064
>            - qcom,pcie-ipq8064-v2
> @@ -170,6 +171,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,pcie-ipq5332
>                - qcom,pcie-ipq6018
>                - qcom,pcie-ipq8074-gen3
>      then:
> @@ -332,6 +334,39 @@ allOf:
>              - const: ahb # AHB reset
>              - const: phy_ahb # PHY AHB reset
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,pcie-ipq5332

As you seem to be depending on the ipq9574, could you please reuse the
DT entry too?

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: ahb # AHB clock
> +            - const: aux # Auxiliary clock
> +            - const: axi_m # AXI Master clock
> +            - const: axi_s # AXI Slave clock
> +            - const: axi_bridge # AXI bridge clock
> +            - const: rchng
> +        resets:
> +          minItems: 8
> +          maxItems: 8
> +        reset-names:
> +          items:
> +            - const: pipe # PIPE reset
> +            - const: sticky # Core sticky reset
> +            - const: axi_m_sticky # AXI master sticky reset
> +            - const: axi_m # AXI master reset
> +            - const: axi_s_sticky # AXI slave sticky reset
> +            - const: axi_s # AXI slave reset
> +            - const: ahb # AHB reset
> +            - const: aux # AUX reset
> +
>    - if:
>        properties:
>          compatible:
> @@ -790,6 +825,7 @@ allOf:
>                enum:
>                  - qcom,pcie-apq8064
>                  - qcom,pcie-ipq4019
> +                - qcom,pcie-ipq5332
>                  - qcom,pcie-ipq8064
>                  - qcom,pcie-ipq8064v2
>                  - qcom,pcie-ipq8074
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry
