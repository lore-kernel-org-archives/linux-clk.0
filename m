Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9802B264F9D
	for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 21:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741730041; cv=none; b=IurQuGu4/3/X678jybLjJ6W1T/Ba9T5C34/Bavop4WskG9/xqbbrM0y93bj0cyqtN2ET+iXc9ry/IVYBMOH2ctf4h3RP4TjhHUxEr0INczxY8YF9qahLTZ3XA/gO+QTvPRc3YOmDU6RG9+U8Xq7e8G4r3ArqSD/2pKd3I2yg5UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741730041; c=relaxed/simple;
	bh=ZgzE4thBCoSTa+dcViXPcQn5/G3IUHp1o/3wzyNpJ6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BwDT0Srli8yedhueEDaGwNmW3ZkXXax2pu9ZC30fZOmNLDj5uiNaWF757POu5RYsv/Inuj1XXiK74egHiRFUbNlcrqL6Btki3ysQTBosVq1/qCdxzaGFhBwLY0bibxNtKngEjqXh8zo3HHotjsC9gTKbDn14AZ6l+5h2Prvb+jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f/yhf+Ow; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f/yhf+Ow"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30b8180f111so3861491fa.1
        for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 14:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741730038; x=1742334838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X5gsB+0yYh8xE9yPNlTczFYo/dqiaFhvnnAdkeUoWJg=;
        b=f/yhf+Ow6qLnHeu7fpBARK6iQQyRmHWvFObl/a0hci1teamJW+UNUazoTQxxo7esNl
         arQvnfnn6Eq+GUuglGzFjCRxlPy3bGNrmpA7ZWCmnuNPB9lsq6CTUuQn/n6i1o4XdJpZ
         WYP7WVSZou2lt+5F8OHTinmJSjsNNe/IaaQ2XeS7BNvGbr4MUehdokjGbMjXFobxE1qL
         cwTYeXwwdp9u+Kz/q5/1SuPIPxv3hIvJwvOTEHOTzO8tYdmtCoYFq/nw8w7PxTh9YWrg
         R25eUG17re6Scd0jjMyQ6S5xoM6tAYGXlJn4JyxKoFswjSCyDehZf/Dg9nsICyE0UNn+
         wQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741730038; x=1742334838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5gsB+0yYh8xE9yPNlTczFYo/dqiaFhvnnAdkeUoWJg=;
        b=iPmxnftJPyPQR+zCv2awh7r6i1JzUGy4VOqujvHK/xoNKCuWkrJIqlIIZ3daopXID/
         hRgFhqfWruhmihML9RQTS2iTl30/6YKllPg4CI27UBrrjay8dwtquQG3lMBBNdYQgZJe
         vkK2H+DpzIc5EcDRBTsU+UtRKEQk3p2HejXsAQGK6FRyEb13SVWXTwQYMpaMYXUTQ8Nx
         n7UMSmyJ292LJ+lsDR0BdE63FN+su/86TkazhJ2g2cmRai2bQt4u1ZfLbP+zGxvIZ0Yz
         ZuNRmmBJUYB8Lo9GaLUHA89K7k1ZQUUHDnMjZCOcyxOR3T9tKsct49xIA0mMrpMh76Rf
         Ao+g==
X-Forwarded-Encrypted: i=1; AJvYcCXgtbg/dCg1Z3aBLb/PpivMpOvR5D+djbUuIjXPT75rR2mboUwZFOk3g3wQC3wQU6GdVXAHSLB3i2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxApXchoPqIsfcpZQ6yc9hepBMI8ERf8P9Lt+pVzbVbO+NA1GqZ
	rul/lxumj/fN36OeE6kA5JTBfyWCFyLzYC3T0zcoUREQQNl+GlqmF0NPNOfFyps=
X-Gm-Gg: ASbGncu9R4tlNL3s5nnHcvoflAbSstSIuboKip2ZjuvQ1JFmWw2oHQ9HjOLVmCSJFt+
	cqCVDHx2WghcF37i0gAqJoSpA9ht0b5w6vBQlFHGhLFTrnoKTsDZuzxGFpPXhTNkGlRoqPT8E/c
	big1TnaLxL0QxbyevdG3SwMPu2oZONzt+LJs3gB45v3dcLUeGBeiFqVAbBT/TqHUxP3EL564vhX
	XSR0PlGroUte7RSRXOuYSXkz8Bu8nkCc9trrEtTMIGNML0lxiYY+n8V4j4oGu6esVKAKLYqpYHo
	ADvitbFomtlnET9wBVME9pFTVc5gHIC335eRP57gTLW1FbtjwLC51MPEwTV9HIK1t8HeDSwOKyk
	XFvv1dGBkuuvdQRzRqPBFH916G4u85Z9FJg==
X-Google-Smtp-Source: AGHT+IFMqD7MP0QO68gqxLROvT5NFpnEwxTOzpskeLzkJrA9xPbwOTw4OmpOx0RaAr9lWptyIlaMyw==
X-Received: by 2002:a05:6512:3b10:b0:545:6f1:948d with SMTP id 2adb3069b0e04-549abacc9e6mr613771e87.7.1741730037032;
        Tue, 11 Mar 2025 14:53:57 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae462c6sm1910515e87.4.2025.03.11.14.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 14:53:55 -0700 (PDT)
Message-ID: <70d6acfc-739a-4c0a-9087-77e16c6ac989@linaro.org>
Date: Tue, 11 Mar 2025 23:53:49 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: media: Add qcom,x1e80100-camss
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
 <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-1-c2964504131c@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-1-c2964504131c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 1/19/25 02:54, Bryan O'Donoghue wrote:
> Add bindings for qcom,x1e80100-camss in order to support the camera
> subsystem for x1e80100 as found in various Co-Pilot laptops.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

<snip>

> +
> +  reg-names:
> +    items:
> +      - const: csid_wrapper
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy4
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: csitpg2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +      - const: vfe0
> +      - const: vfe1

Here I'm a bit lost about the selected ordering rule, I kindly
ask for a clarification.

In ASCII the underscore symbol '_' goes way after any 7-bit symbols
including '0' and other digits, but this is violated in the sorting
order above.

The expected sorting order would rather be like this one:

   - const: csid0
   - const: csid1
   - const: csid2
   - const: csid_lite0
   - const: csid_lite1
   - const: csid_wrapper
   - const: csiphy0
   - const: csiphy1
   - const: csiphy2
   - const: csiphy4
   - const: csitpg0
   - const: csitpg1
   - const: csitpg2
   - const: vfe0
   - const: vfe1
   - const: vfe_lite0
   - const: vfe_lite1

> +
> +  clocks:
> +    maxItems: 29
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_rt_axi
> +      - const: camnoc_nrt_axi

Okay, there might be some explanations about the underscore symbol,
anyway I would appreciate to get them, but here it's definitely
incorrect, it's very unlikely that the symbol 'r' precedes 'n'.

> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb
> +      - const: cpas_vfe0
> +      - const: cpas_vfe1
> +      - const: cpas_vfe_lite
> +      - const: cphy_rx_clk_src
> +      - const: csid
> +      - const: csid_csiphy_rx
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy4
> +      - const: csiphy4_timer
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    maxItems: 13
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy4
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite0
> +      - const: vfe_lite1

Same as above.

> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: cam_ahb
> +      - const: cam_hf_mnoc
> +      - const: cam_sf_mnoc
> +      - const: cam_sf_icp_mnoc
> +

--
Best wishes,
Vladimir
