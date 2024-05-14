Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0855E374FF
	for <linux-clk@vger.kernel.org>; Tue, 14 May 2024 07:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715671507; cv=none; b=kaQG2M7oI6wOF4W96JSLDKLhBIZvTXHEmhceepGVJM8t4uAK0rdaOh/wuTe+k/csrftgg8OxHMZ9TAqrd9Y7il/g4ZQ7Lh2cSvQ5OBjEzoJikRgCJzkPnD5sQIzKcLhocddHz6lfNrQGP8NpvFFFIs3Rxq7UikuyfU5HXD7qOSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715671507; c=relaxed/simple;
	bh=MrsK/SOAFyvJ5rW6noiqY2i2AWXHF7hXaxT2Iuly1Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbOkW4z+/Fdz+HqajQecD5VEY0N3K2HtOy3729/pD1Fd/9byfYacLn4TLMOwKY/bqzm3iPlc3Srs8fDVXEkfupbXkSp8xuQRyvYAv4IyUx74Ygx4L7HDUBu/+xw7xXpwx29eMvrD01UvN9oaYcNE6Pka6MPg6WPcx5KfpbgRfFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VFnuYnPi; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VFnuYnPi"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59b097b202so1117056466b.0
        for <linux-clk@vger.kernel.org>; Tue, 14 May 2024 00:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715671504; x=1716276304; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JB+Z0CRSJcLUU9yXDS+6zp2SY8ySyHlLC8dbiqLhtlQ=;
        b=VFnuYnPijUKB5OvXDY4k+InVPo5hmPze9ahmz5tkhJUqO7fsoeww5VCnnSCFttYCwU
         zcRnuUzTc0WaHbUp03SF28XAAbAaMvDY77hYTr8pVB2nCUfgwtZmN3hb7S0uNp0FrE4R
         ogOw1rNBSlcUrt6HzNMJEkq1qwAANH0bZMLBpyPvJKg6NdkctCoNbx5ieROcTDHE9ZOK
         OYbZ8tvx8YLKE/mHQ6yz4+kg/ch95kQuL7LmmsSZcuUg5VemintQU+s42IkTSIAbcZvV
         CwBdjJrFz1/eroLQ78WGb3KhYpTLgy7vpJXolTI140gMdYwsmZKxccYLggzpmEgE/Kww
         oKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715671504; x=1716276304;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JB+Z0CRSJcLUU9yXDS+6zp2SY8ySyHlLC8dbiqLhtlQ=;
        b=C/ale/d3HO1StIaLobyT2IEcmQYrXDyhI8JFgAH5IhDoTkRh7dGQ2NZYNuk6Y62Tnb
         M8IeNQ96/bQId249kMGMPUhXxIt3oRmKluslWldnmakwbSUYKEbv+FFCUgqlai5YGmGa
         YHRre5XArMr5sIGZ1S7WSuyn/UyE6c8V8sth4fvb0+CkzuER7oQSik0+TIhyvlxvvjY6
         n4R+w8E/qoTCa2YrI7uZ/BhuIUlcpl838jYiLKMeB1qerAzU8cBY4STpTcccq2Kme+9x
         yje9SmQ9cBoDcBVCzLhP9imELrOsvfH96gwo5eEHC2mjngVyGwAlk4SjYYUicsph51UC
         x8bw==
X-Forwarded-Encrypted: i=1; AJvYcCWOIahnu1DBrhQBIl9amHdG0sd1m5TrJAn5GQ34x46kSMojBt8Ov048CVq5B3cWIBFXgmb1BrlxrvLoiI3vugYysbkg5lLNTzYr
X-Gm-Message-State: AOJu0YxTAZYerYpcxzIwXvZQhlBJgsjes+kY1/aeL4W30JbhCUiLod67
	Y2dJj5MWfaGVquit+66XlQxOuhiSNoBqMtr0mvns59aj+h3gW7KmrHZ28/843A==
X-Google-Smtp-Source: AGHT+IEQTQ5t33iG1QpTljAk13ZjKCJq2arLVGhz/pfUDhGt2rL8ANrYeLV7xamqA3YFh7dM+6YrzA==
X-Received: by 2002:a17:906:ee86:b0:a59:aae5:5840 with SMTP id a640c23a62f3a-a5a2d6759e5mr1063776566b.75.1715671504270;
        Tue, 14 May 2024 00:25:04 -0700 (PDT)
Received: from thinkpad ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d2ecsm703097166b.16.2024.05.14.00.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 00:25:03 -0700 (PDT)
Date: Tue, 14 May 2024 09:25:02 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devi priya <quic_devipriy@quicinc.com>, bhelgaas@google.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH V5 3/6] dt-bindings: PCI: qcom: Document the IPQ9574 PCIe
 controller.
Message-ID: <20240514072502.GA2463@thinkpad>
References: <20240512082858.1806694-1-quic_devipriy@quicinc.com>
 <20240512082858.1806694-4-quic_devipriy@quicinc.com>
 <b3199f40-0983-4185-bd0c-2e2d45d690ad@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3199f40-0983-4185-bd0c-2e2d45d690ad@kernel.org>

On Mon, May 13, 2024 at 08:48:19AM +0200, Krzysztof Kozlowski wrote:
> On 12/05/2024 10:28, devi priya wrote:
> 
> >  
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,pcie-ipq9574
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 6
> > +          maxItems: 6
> > +        clock-names:
> > +          items:
> > +            - const: ahb  # AHB clock
> > +            - const: aux  # Auxiliary clock
> > +            - const: axi_m # AXI Master clock
> > +            - const: axi_s # AXI Slave clock
> > +            - const: axi_bridge # AXI bridge clock
> > +            - const: rchng
> 
> That's introducing one more order of clocks... Please keep it
> consistent. The only existing case with ahb has it at after axi_m and
> others. Why making things everytime differently?
> 
> I also to propose to finally drop the obvious comments, like "AHB
> clock". It cannot be anything else. AXI Master / slave are descriptive,
> so should stay.
> 

+1 to drop the names.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
