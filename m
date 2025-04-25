Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8632405ED
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 10:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576588; cv=none; b=KtES+Em5evIIhpYQI0t3MuXrko8iq7qYjNq7CyomIZlhZVIMM/st5uFlWWFeghXVrMHCwxskUPXmeYWtwCRNQYRPJrFZXPX6Pjhr/8YI6FHAmiCS+uT0pfpcGg+Hms4W3IIb5+T6rmHvvZ4xC1wHZsSSQX6X3LMyckWLKpAqAlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576588; c=relaxed/simple;
	bh=snacv77pZfe5A1XSPfj1ume0murIRa0n+2+ekqhAw5o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QLlZfdmjIJsfEfBaXj3L0OcNPiUZRO3r529OI21NQ2BbbUXr1ixBTbKeCBT91a6EEt7t6T+j6Q+kmCfzfN3qt0xbeUGWBN/lY9YTjMWgpq1yxFagXdA4u/qRHrTAeP4Q9sH0tCxVuYORg0N5A8RYHE3Z9DjEoXeGBafbHPhlvX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YWsmV+Qu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YWsmV+Qu"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso2337321f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 03:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745576585; x=1746181385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yiqcPsUnb+5szPwlE5nf6K7tTtVvGKeKUMKRvRKeadE=;
        b=YWsmV+QurCgBDS5F3DYp/ETmAgQNsYHYdPS3/yBg4GRl2ZX/i/GJN5ohRnrUMfVO8z
         LCVmgtpXlxdc90uMhs3dZ1FxOvRxc3pEOyJNskcrkS2K+sIf8E/GpjQf7/k1Xl1GLr/o
         hi+BxXJ+5GqRH+2BCzK6iYKP1spzfoWgLaAh/MlNj8FICuXvdIguTyfkWxOLhI/12Csu
         Qc+U68Vc3XXK3WsnX1zKqeud8XBgFGkXbrNDsfanC/57O+LMjrJeh9QxNohqiJ6A5u25
         /7P0PQ1NdmYgIv4BZjzEJKEE1Wv9IfbbPqsP7B+jgpU+QNN8GsWCdN1rO3aWmIPPV+a/
         MDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745576585; x=1746181385;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yiqcPsUnb+5szPwlE5nf6K7tTtVvGKeKUMKRvRKeadE=;
        b=BAPVrGctMMm00wFz7CyQXCdEh097AeoQYn1Y2yy8XQVBMvTsGA2z6rSfOf+RJb8SeU
         rZgkN/ff2Xx1J+iU96SQJmit9aaCrsiF3BhxeEUZxuQveFkA4/oSLS5I6dpnBP5hNn1B
         AWVbH3RByiHQbKzq2zITC23A1nNCs1eY6siyKPoSAyDQm2kIGG6C8ZmzbpKXE2feYsY5
         eC0CDDA1eI37hwH6MhRROZ4WUGFM6xCfA1JYz2sKPQwBMGW/7qucdIJ2cV/pCn3HOeY5
         CHyCtdhMrIM3aGw5SrgmCRY+dcuz5cLRWBPlMZ85CdDFdHKXkDCmeLP2srw6/SEdI6eD
         /Qmw==
X-Forwarded-Encrypted: i=1; AJvYcCVNPbnZGPuKmT/D2j8oZdL2h1xbRHo/7RfwoHzthWRTw7rLsXjb+Lsyd65+nTNiqSfIAcGnpR1FmFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzImU72qUWVCZNHZltr+j3dCsDBqqHX2SZV90BrkwYA3udzTlH/
	8YX+tVaK6kiecjdemJnn/40CuV4dHz7B/q4dJMLCrksJq+8Lbe3+jZrORTejy3o=
X-Gm-Gg: ASbGnctsp6Dj1H6YPmW5fo+TeQwZAzxwZhDxvAhB76rDADc19VD1K6xKINCoNd9MFmx
	4P4qKwLdo3lFNSyEupiEK4CRKKqbPS/LrRF1mgNWov1dp5jfxqjWxED/jwtbWXTSA75gL6SRner
	NsOyQtX8HWXhYUhxzqOCwliB97L3Keoya398BOz6FOQ1bTIQaXgEnWl29Tu16ArdJE69/VIcC+x
	611omJ6Ynrcka2JravSmeGb9Z5dQZCTlhoN4SgsxKurBtxMzMsT2cW4O5+FXUS1F5S7jOn8Fw1n
	l5vdgxjCXhbdl+fQBbG9B3futXEMh7xK/ycmaEmiVZXSLS+nqYJU5FdrQI0ZAq0qlUA7+vUcRTz
	a4/5quQ==
X-Google-Smtp-Source: AGHT+IFy63dQ2XRXcyQqYQm7otc6uGHPPriKeUkLkoP5aXyqN85KOXE6hcyqC7mH/ytf/6kCDWZKiQ==
X-Received: by 2002:a05:6000:2481:b0:39f:6d3b:f136 with SMTP id ffacd0b85a97d-3a074f10c98mr1298955f8f.41.1745576584983;
        Fri, 25 Apr 2025 03:23:04 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46a49sm1909638f8f.61.2025.04.25.03.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 03:23:04 -0700 (PDT)
Message-ID: <4345b6c1-f0d6-4f77-a635-9d8c1cdaacb5@linaro.org>
Date: Fri, 25 Apr 2025 11:23:03 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add Qualcomm SC8180X Camera clock
 controller
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <H56Iba_grof22uzTtGCI-APhiDAGSejNod6jsSVIykm9ijaaj7PWqyszShCEGjIpM2wCLOn4a3Vfb8Hjziqklg==@protonmail.internalid>
 <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
 <621d8556-f95b-4cbe-809b-864417f0d48a@linaro.org>
 <b96f8432-132b-4c16-951e-718e91ec52a5@quicinc.com>
 <f74d8b50-35a1-4ce8-bfdd-4c90782b8db5@oss.qualcomm.com>
 <b74d90d3-2a85-4853-9843-6a6f22720587@linaro.org>
Content-Language: en-US
In-Reply-To: <b74d90d3-2a85-4853-9843-6a6f22720587@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2025 11:06, Bryan O'Donoghue wrote:
> On 25/04/2025 10:35, Konrad Dybcio wrote:
>>> The dependent GCC clocks are marked always on from gcc probe, hence 
>>> did not mention the dependency here.
>> Let's do what was done on x1e80100 - describe the AHB clock in CAMCC
>> bindings regardless of how we handle it.
>>
>> This way the DT represents the real hw dependency, but the OS takes steps
>> to get them out of the way (and then ignores the GCC_CAMERA_AHB_CLK entry
>> because the clock is never registered with GCC)
> 
> Ah yes, this is an always-on clock isn't it ?
> 
> But in principle I agree, the DTS should just describe the hw as-is.
> 
> ---
> bod

Pleasantly surprised to find that's what we've done for x1e camcc

20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-3-edcb2cfc3122@linaro.org

---
bod
