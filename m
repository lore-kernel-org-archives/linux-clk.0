Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0050C225416
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 02:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627163; cv=none; b=u25Oba72z9K7xjNtHbfhb3lx5NnKaKVgG76QURFwaMilpX+FSxwctwJ8o7WZMfdcuq2wauX4Y5euuiVAmGPpy0PoM3EFix3/oeDJnKQ1Hcr9bASqtysfvK549vfTbRZcvAJWYcYRIv6FYM3zgxmWPZwHp42ZQ/9xxj1C069yjqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627163; c=relaxed/simple;
	bh=BQcrnhOD+3qE8FiRPtfDJnFsWEWT/8bXthBG10EF93k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nE0Dg1m/8SoSPlCXlOVYgF1TrvtK5hISQDuO6ld8WztiFbdJoj9NqsybDnY1r4s4vJGCHYvLdsW9Dat6TEnc2ILzo4Ce1UJOC3y43o37jaE/SV+MS24lVcmzRXcfaNsIkjYWNopH9NvCk3FKcpdk1PQxbysXxAyUu5qm2DzPrCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m/IdOsT6; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m/IdOsT6"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a13591f163so589273e87.3
        for <linux-clk@vger.kernel.org>; Sun, 15 Mar 2026 19:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773627159; x=1774231959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHkOl/Uu1nTEL4sNDJ/IClFdBsre4C93u65zu7fcy90=;
        b=m/IdOsT66HFGOx66Jg92b8WTr8EmskiFU0qpsgo7Xh6KSyKB96VfTjkBAolyAwRFr/
         TgRX7e6ChN+zZUi32vcOk3QQ1Py6Z8nMbiZKBZr7pDpNWUNr3CtNohde0p/sMnCxlUf1
         jEErf9c0yfNvUwVlK4N6Qwt89TqHaYF6VuF+SdbcAMAmrg4Eb1xrIG9c4vGuIMVvYa9N
         SdyQu+kldap3i5D+wIuwfwtQGOa1EakmBVS5RIZkvTxCTUEBiBCj6gH0LMp23SOcaeXm
         Gjq3wwFuLSJRV2A42U2Ke1XaMKQhm0cH2T6I9h+TyE3KSpAJCcYOwDbnJKVtOJf3CwVT
         klZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773627159; x=1774231959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xHkOl/Uu1nTEL4sNDJ/IClFdBsre4C93u65zu7fcy90=;
        b=qaalkqTFviv0kTtRyoOXZrIc+h5IRLi4ZvJugUpmLTKYGYET0z0NAZSsk3VW8dD4xT
         kMhWtEaBN/Fqh8hQA5kQU/GAz9YPyqWp4bn4H5WosEQ74oWc4rVmvJD2XDkmcFjggen3
         8/9CJ96rYYP2qzhqSfZ0UJwrnZIXm2kCsxMp0ofXNHYNdI0WqxaHQmdWfTE2e/80vtAe
         IAmwb5wjIt9QAVaOc00TVJkB1ikMwcrDNiXWwKB+1IdDPVkmC4j0nAjI+mF30Hf/PYv/
         pjjrNPg2aawv/i7eUoj4RWn33U2bgLbu1b2DmocpG4R+1O6pyMkqkR6Q9PX+PnvAjxe5
         6cmA==
X-Forwarded-Encrypted: i=1; AJvYcCWoIji3fEVXAKhILoDRemhth5SfrLbcse/4yC/LIjhz7KZli4JamkARfkyLW9XJv3K5CzWCdf/vK9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxduWPFyX68H9I1a5fWSnlAN3+N8obDzY8tds7/hbulXXIo6bPW
	XQ28fMUEfDn8kjSy4offqR5jF4hIQWIp+bQThjyqqstqHOeIZ2jPP8M4rP+NSydtMes=
X-Gm-Gg: ATEYQzyqxFdwqAFUme6/cl48aAdly4TRmup94ynavl4sJuO0spHdHD4F20guNDnwcLS
	2SBJcSSBuO1JQ58HwYfWFTFRbwbdPG1R+AN+9MFOOMEmE5aBrIqJCvUBIqIg2kh/AuPqZX0sXNE
	mb7Bhs3RQbS+nnFLWL698RhdauuaAKRhCikk6dFPGWwiQXxAAebXvnH+kTACLL6zxMablhe0LIr
	68cp0/bPiPLOXFzTy+nywFV61pUXAZ+tKYliqrFVVGz4k0SZcuv9lZ/hihVJYawTI/8+okT4qau
	ayFGYbDFx5aSKTTJq3ZwfRDAIvBXhZ+4mY8G9JHdyiyeA1eAWOFwKCOZVTN+lZxZNbL27G/0NIn
	UQ4oVwp2ojPQwYN8/CAlfmDXvGfJMgQdnfUQIcxOjQfG5gnOypMIuruKPha0wFUyVVhfChCPVDe
	uF8iUnfiv8xZSNr2OQ7PfZp7V+za7I9WeisXI38gZU1eLymg9wAXiM24I+YLK1yMDiX7yFueRH7
	8YeCw==
X-Received: by 2002:a05:6512:61d2:10b0:5a1:1329:5ae5 with SMTP id 2adb3069b0e04-5a16271283dmr1318112e87.1.1773627159134;
        Sun, 15 Mar 2026 19:12:39 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636982fsm3108394e87.78.2026.03.15.19.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 19:12:37 -0700 (PDT)
Message-ID: <cca53190-ec16-40ee-ab4d-7bfbc1f082e8@linaro.org>
Date: Mon, 16 Mar 2026 04:12:35 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/26 03:02, Bryan O'Donoghue wrote:
> Add "simple-mfd" as a second compatible string to allow child nodes
> within the CAMSS block to probe as individual platform devices.

Why are there any child nodes representing platform devices?

There is no necessity of it, please use a layout similar to CAMSS CCI
modelling.

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 2d1662ef522b7..b5654ef71bd89 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -14,7 +14,11 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,x1e80100-camss
> +    oneOf:
> +      - const: qcom,x1e80100-camss
> +      - items:
> +          - const: qcom,x1e80100-camss
> +          - const: simple-mfd
>   
>     reg:
>       maxItems: 17
> @@ -191,7 +195,7 @@ examples:
>           #size-cells = <2>;
>   
>           camss: isp@acb7000 {
> -            compatible = "qcom,x1e80100-camss";
> +            compatible = "qcom,x1e80100-camss", "simple-mfd";
>   
>               reg = <0 0x0acb7000 0 0x2000>,
>                     <0 0x0acb9000 0 0x2000>,
> 

-- 
Best wishes,
Vladimir
