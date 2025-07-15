Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FD9265288
	for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 08:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752569336; cv=none; b=ZtZugbj83LoV2pm2MPODvNcLnVWamqJ4K+SfzSIUvCreV/VjL3i/sYXEvu2lNq7tS/aUzuM3n4L5Wy42JGyuwYcGzaoohUoqxjitDJ95GDjPNrOQP0J4Wg5cTGb5Fa4DNJ6GmnsPmuXqdwl5JjZRfSjviwIOmlOesAqe1k6RiBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752569336; c=relaxed/simple;
	bh=pD1Le8OV0RXrqAj6LsQRy5Z5NKQWRjpP+G6eQrk5178=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MlHiEPT9B9oLYNi7d7WhrC7T8Q9ziaHj6dLiG/wR5S6Nobqp+ywaf5zuH0laG7kDjLztJpoFZF96tWQcMWEoZpwOlqjgrbxAQalJUIcCe4ok3us+UMS6Rjmf1qIs5QHR4OKtgw5HFG6C94q93qYvY8Xt3smC7TytEGbwibd+VmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ow2PVbW3; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ow2PVbW3"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso4984414f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 01:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752569333; x=1753174133; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E9mBnIKvAWdT630/iy9ORQBp2rYWTT3yVkBYpDCTfjY=;
        b=ow2PVbW3HTD+dAyI1T/07+N87D3UIC55x1rIVD/CDmW+Y5sjkV0dpW+VnMk3jfnvsK
         HJ7+suBML8Hfhk5oL/w0J+IGmf+lifIFfsgZjmXovJIF4ALZhReNOkQEVube+gECuc+f
         uDYdp7KwMlWSfWQDRGDBR117ZMFUQMMx40BLw0IKS21FnQCiFEdNb6eIdBrgclofGAV+
         sikL9Pa2Ghs2i6VVg+NEOa6fcuR4/gwuw0CH7kJ5kgLV9EFcfqGjdNAYDvv/JP89eXnu
         VeKifpUdzvmIJe1kwxGApER2Re41if8X1ya1rDQxibaSx+6S3pHJ6kabYzb/jDxNPCFe
         9Ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752569333; x=1753174133;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E9mBnIKvAWdT630/iy9ORQBp2rYWTT3yVkBYpDCTfjY=;
        b=YsWouqO7WdEb6Ublq5y3jimuEw4aUsA4nun9+s3KkbJGeuWw/PT9dg7zOU5iVfzHMF
         uJHiMr9rraRWoMV5QnFxo76/frkWaFamFQCAUzwTIFuGm6lFq0E1OEPvYTbZmJ9lNQZi
         jQAdGz5TSOLt1UlX72MaOkVqrXoVCqzkUx3oHH7RaNCQ3CGk1phg3tIcKDNMnRFcFGZK
         L9Enoc5gzYrMuWO54v/1eFc714J6Yd5rgVwBU/0odgAqX1v25sRut/rEEXij9GqjArEl
         iRCeQxoyJDCAiPcLUxnCtQYuCdVnaTIJPvVKVLnujkDzcHX/2AxEY8QsQjClExiOPc27
         Ub9w==
X-Forwarded-Encrypted: i=1; AJvYcCUVT57kPauCsP5BVzLZ8KPwVnMmgTnX92ZYAMmVIrvWjKFFtbpNc5U1rHwH6nZY+4hWbTSMrQzTzmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWm6Dn1VPmY5XKeAh0p0BQdn/rdvTJKnz4JG2HMoAgJcCh2r19
	SP7KipyQ+OQS9bboLIGDr1Fz8FPsVuZV7PVJgsi9uYbol4XrfXxyf8H1Z23oibRp8Dk=
X-Gm-Gg: ASbGncvPCrsDWKJqI0vUo6cRl9PwCqONJJFIBRsfH5UBhRJY5ckBJfp9lGTmlyBOUWj
	PZqEO5Wd5aKrUHGiIDCcXgHHMQ8InhwXu6HtvJOwBNu/pcKlxT9F+sfPItzJIrjYJzkXvKaS/xJ
	0JCK6TdmqlEX5SkGKGNciwSRXF/y1FWUb5lCKzYGE+AqihcHr9IaoNbomafD+yMJUQOSPrEdB/i
	gm1v1aZAi3rK0BVNi66qcTsPnxmgU37gSxfJbO/wNIWeNs1/0D95xQz6/GTDaeaT0Kqu3+e0cDP
	m/nN6vvbeK0teZjwHCJzen0DmnypVPTUoGX01nBjMXfYi9uXY8OH23li3wh67vsM3KBwQW1GEDZ
	wANhQ9JWX8DS+ablFkE7pjcmZAbeFT3KR+j9s7lFKAQPkCuSsI8rrApjS0HzHTSE=
X-Google-Smtp-Source: AGHT+IGJMK52kdHoKat08gh9ZxE9vJbWot+So4R3frmu9VhxvGSm01AjcQ47N5lRHMsqjgkWlHkYvg==
X-Received: by 2002:a05:6000:1449:b0:3a5:2fae:1348 with SMTP id ffacd0b85a97d-3b60a1bacb9mr1597786f8f.51.1752569332760;
        Tue, 15 Jul 2025 01:48:52 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e1e8b1sm14424155f8f.82.2025.07.15.01.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 01:48:52 -0700 (PDT)
Message-ID: <ae0a309f-7e52-4d3c-8f26-989f22da5b07@linaro.org>
Date: Tue, 15 Jul 2025 09:48:51 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/15] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <9361e954-e2c9-41c6-be4c-12b0e4f367f5@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <9361e954-e2c9-41c6-be4c-12b0e4f367f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/07/2025 07:53, Vladimir Zapolskiy wrote:
>>    Finally I believe we should contine to have endpoints go from the 
>> sensor
>>    to CAMSS not the PHY as CAMSS' CSI decoder is the consumer of the data
>>    not the PHY.
>>
> 
> 1. This is an incorrect assumption, unfortunately it was not discussed
> previously for whatever reason, good news now it gets a discussion under
> drivers/phy changeset.

Perhaps you can explain why ?

Taking the example of other setups similar to CAMSS I believe as laid 
out above we should have

- Dedicated CSIPHY nodes
- Use the upstream PHY API

I believe individual CSIPHY nodes and endpoints from sensor to CSID are 
more consistent with established upstream schema.

> 2. The whole new changes for legacy/new CSIPHY support is not present
> in v1-v6 of this changeset, it just appears out of nowhere in the v7,
> and since it is broken it should be removed from v8 expectedly.
Broken how though ?

> It's a pity to realize that instead of providing any review comments
> for the CSIPHY support series sent to you one month ago a lot of time
> is wastefully burnt on a broken by design change development.

I've been working on this on-and-off since the end of April:
Link: 
https://lore.kernel.org/linux-media/c5cf0155-f839-4db9-b865-d39b56bb1e0a@linaro.org

The length of time isn't a good argument to apply a patch but, of course 
its annoying.

The rationale here is:

- Follow existing examples and best practices [1][2][3]
- Minimize code bombs being generally conservative
   in the amount of churn going in per release cycle
- Help people get changes merged - which can conflict with the
   previous statement

Which from my reading of the state of the art means:

- Dedicated CSIPHY nodes
- Endpoints from sensor to CSI decoder
- And picking up on point #2 above minimizing the churn

[1] Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
[2] Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
[3] 
https://lore.kernel.org/linux-media/20240220-rk3568-vicap-v9-12-ace1e5cc4a82@collabora.com/

---
bod
