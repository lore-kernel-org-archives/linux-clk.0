Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF4518FC9D
	for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 22:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719439244; cv=none; b=AgpHBWJTkF7Qq1G9G3kx43yQhmNxhBc6PIQeIPtsZpVhv47Vk8ah6/SUfY5EOtFc/5mc3cb6HLhnorzytl3J3zqQFUKkr0+J+CETE003g23isMNE/k56HHPdX+6QJMPKUM8ih5ws3a0xxSs/PCdUYaW1B2jKADbhxgqT7SUwV+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719439244; c=relaxed/simple;
	bh=gvmC1346MmDk0t3iSMJUF+N7dqvo1b3jn0ulpMyO8V0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lRslpMzyHPm5ZxhgZaBbXLYf2lBOczaNWcVPrhQlynhxYCL5nrpUdwDGT0t614Voaj21R2R6JV6SwEAAtBfO6Nf4FaKbL3TbPOV5UZhRCWw0+l9v5HaXA/nqbSUwUBg8BO/nINYVM0j0I99IE9yLOi2ighRAMn2T+qOeL8BXVzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TarhnWxt; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TarhnWxt"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52cf4ca8904so2797688e87.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 15:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719439241; x=1720044041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Pj/nWr9R0o1AMKMsYJRQq0ZEmOgyeZ/JY1dSLu0yeL0=;
        b=TarhnWxtEcfmjysr7J/TmjI1WW4qcLJU/R9m7+1MgCSU9673NwetTzvJdunJXeQSw7
         80lbTGrjiqgPOnIzvrJGShYyp0AZ0+kVjWWgwxgYfJzCSuBE2xETPtjmQFINNKjKCyW9
         vj3RJeKhHNzTV2Y7Augub8zhAenN6bWuVyq30qpayheCix4+mKKuW0vJ4clJ75PwMbJi
         DHkEN/YJ6LMz0xS9jCdka9Qkyo1u49lg0b+jdaT2fcDC6f1wVMqumuXPtogdy7X3IQKl
         FZ8UWEjytg903UVWr1ohIpq7bLaoXQcDYF5FtvalcSOln1MbTUb6fqrWObzK+munKl2Y
         whnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719439241; x=1720044041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pj/nWr9R0o1AMKMsYJRQq0ZEmOgyeZ/JY1dSLu0yeL0=;
        b=JY3OaYjyecdEVAKw12NYN9+fppGCAlX0nVQhW2AAHwHQJTppDdoQFfzFcdwyRxmcLL
         hgOxaTGJeTrpMWEq3XZg4us6RmKSFxk/Wv1kSpxEJzWvGobvA8FU6Mp9KVquw0pZDAS7
         j5j4VsEdt19FDWJmbzdixEu61RPbfu6vKxZ2Ev2vZNPt6gSnDdtSmOzOUY2M9iCMxeyy
         d4eH1ezYifqSg/PCi6TkXj00hR4w4lV7mxsQMyOY5128pkD49ESi1kS4EGlehdXx/CBa
         bjlkwKns2vpP47BfgwUtHlVh/a9NjmDPLER9nT9mesBjbdokqh+PKPAbHsbq15L1NnDv
         RZLw==
X-Forwarded-Encrypted: i=1; AJvYcCWX4/s4Fqi/sPm1aFI+KFrgXkiLbS6DX1F6I+HbYYo5towoltkOoFi51dnJCIAuTqszhWPEg8Yn5NHQtKPz9qLY7J8ace6z2O32
X-Gm-Message-State: AOJu0Yy47YTs7LN45qYEY+sPKAHK23l++LCfeZW13Q7/4HszrbvRWKV4
	0xXNpjctpO64ZE2Y04wRBh1qXS54OF9gtd075yAgEYW3VJGHtVv0wsBYED9l6e4=
X-Google-Smtp-Source: AGHT+IEzkEwlSn3wePny4O5r6XyYn9tUWSErcLZK7yJB3IGNMgVAot+DNy6F2E0jNVxUeXN93S5R8Q==
X-Received: by 2002:ac2:5617:0:b0:52c:b606:2b2 with SMTP id 2adb3069b0e04-52ce0673b84mr6942987e87.46.1719439238957;
        Wed, 26 Jun 2024 15:00:38 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a725cc93794sm304031666b.170.2024.06.26.15.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 15:00:38 -0700 (PDT)
Message-ID: <9938a67b-1f6b-4955-b4c0-a9f78c55f276@linaro.org>
Date: Thu, 27 Jun 2024 00:00:35 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] arm64: dts: qcom: ipq9574: Add icc provider
 ability to gcc
To: Varadarajan Narayanan <quic_varada@quicinc.com>,
 Georgi Djakov <djakov@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_anusha@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <ZjshR0ekcn0gxwOa@hu-varada-blr.qualcomm.com>
 <CAA8EJpqENsojPQmCbma_nQLEZq8nK1fz1K0JdtvLd=kPrH_DBw@mail.gmail.com>
 <1a08ef42-b52f-4c97-90d7-e7fdee7725b4@linaro.org>
 <Zmgb+OjdBNw71sC1@hu-varada-blr.qualcomm.com>
 <176137e5-6312-4d46-97b6-c4494bc1c61b@kernel.org>
 <ZmlAdETV0+6Md8HC@hu-varada-blr.qualcomm.com>
 <e24cfd23-6f77-46a0-b020-9cb3daef6930@kernel.org>
 <Zml4RQ5R5s3mVMnI@hu-varada-blr.qualcomm.com>
 <8e32a8be-dbbf-49ca-92a1-2fe3c8bfb571@kernel.org>
 <ZmpsOdsl9AMTSH88@hu-varada-blr.qualcomm.com>
 <ZnKKjomRQtJS2ZgL@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <ZnKKjomRQtJS2ZgL@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2024 9:36 AM, Varadarajan Narayanan wrote:

[...]


> Tested the patches with both gcc and nsscc providers having
> 'sync_state' set to icc_sync_state.
> 
> 	# dmesg | grep synced
> 	[    3.029820] qcom,gcc-ipq9574 1800000.clock-controller: interconnect provider is in synced state
> 	[    3.470106] qcom,nsscc-ipq9574 39b00000.clock-controller: interconnect provider is in synced state
> 
> I can see that icc_sync_state is getting called and clocks
> related to paths with zero bandwidth are getting disabled.
> 
> Will post the NSSCC patches to get the full picture.

Going back to the original question, does removing interconnects = from
things like PCIe now make them not work / crash the device, which would
indicate the NoC clocks were indeed gated?

Konrad
