Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31CE21128F
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 23:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733874364; cv=none; b=MSE8kOLL1a/T4ZDdRjdJRg1HkpisdIuVm0p9Qnt+8EJydB8ENfYLKFEmE5vF0YREuaw2yBan72YHYySAxVALNER4gl/SJdNUYQoN+cNGS7KqW1catbuT4x+owGjld9GDaKTkejtzHU2wx+4BhPyTOnxVIy7MwyCqvsGT3YlzMfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733874364; c=relaxed/simple;
	bh=UwRsTVENoKuapuXoJkzI2ldmpDPY5nWtFJ4BVsBVGgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DjDpsUiS5iejWEmSHz/hZ0ULRq4tkKvPFXlRf2Pa034+YfZCdj/62rx9mPaYFDEHxpBZyE8IUv0QGdqYVHviuTMd2yozxAc3+R2bBNGLYLza3Upq/m5GFACmrHFcdhfAvAID+1JbOMGuf1W5Z5G8Ztfai3j8peHayHL0n/2ow2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BCJC79Av; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BCJC79Av"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so240521a12.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 15:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733874361; x=1734479161; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dUFQtOuHVAdyoBXRcqgtOx+EIFFocH6sZ24cVAKwDzo=;
        b=BCJC79AvvMqQUFklhf1DqqAyi1XfzuqlFU7yIEg0Hc/c2PyewNbGIsybQrnZKgW+1F
         Xd6gC9AwGKsLUNf1V/DtQ28EBvarZMlMmm+JlL0gSr9a5XbNqculYj93/7lcgJD+MjiO
         VtOcTNA3o0cOHwvbzkxGEJBNPEUClQTPD+D9HnA4HRSFlqviRRK8YybJkHgVA6lEoxGK
         dUoj0QuoEwNJazHxLz3mF4E1GIH5GGLQha5hguhKNYFHuC6YksIK9x+0MW1Wa35YrJMG
         tvk8rt8I02/IH4qVHa2lvAc8cYweRTloBsmraiZOEFkCsgpdCysX9bFdsdjfEE45z5xr
         LXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733874361; x=1734479161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dUFQtOuHVAdyoBXRcqgtOx+EIFFocH6sZ24cVAKwDzo=;
        b=HVev5qjixgC81IG3hWLzX8P4dbyXZU3BIQdi2cppFIYxWt7/fYY2LQc7O7CZTeko2q
         OLOR6E1Da6IPbT7rQd6r6ncWPLLhDyH40Ruw1dU+4drfGngrqrLWiqTttuIYRLG/P7bh
         7IkLJkU5ZkojCnSgyI5DFqfRSf/UtijT6y3rs3slxeyxnjIKmEN2ucDD+XsI7Rfs6fHR
         e+S0yHHC1/3ZCi22HyvtBL5qJ0ImZM7wiJX6PnxFH/5fS2k0jnopWxD/GsDHUAZ2tcOT
         DkfnAE0WSBAGC2BCwiu7LUb+iywQRR268u1kRg95ApH7ThkpxScq7VmL0MWQww5J40Fe
         QQjw==
X-Forwarded-Encrypted: i=1; AJvYcCVEtQNLhEkPEMeXSGQRzcKaZEJR0UJpOBCHm57qKRrlPJK6mw7JmwhzxzoCsQr7Rc9WlKewZXLwW8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG0bvV+WXSi0BiRknWBBcJsPjD09H3XKElap9grEjf/NNHTD3r
	JfhpqK3RBd4lvzmGkugdsPa8KxKGvqcZ+lOwh7aBX0dqtPGcndOIpufP7JQRFQ8=
X-Gm-Gg: ASbGncunhfEeEdGas4ARbVKkkl+GybCeb+4iYRnPDEUjiC6bguViUZdJmpIOC11Y7+A
	/eQhVjsQ6ysiSewjwmQYNwvE4cNW9IELpgh+5D0YpDYu2zS826FmJtheOnYAjyR+9nW8oSL909A
	fLsSfHonNk1rDNLbyi+yE4biGwcb59KE6VQZOrzQzVbSEdQ6y9TUzXdtbIaYh2CBZrROcuoi9wU
	N8IQW/QafaV7dVbovrSGw40mHVnrI4FsOGvLdqQE4/SojLldNJnawlA/z5wm+pRY7I=
X-Google-Smtp-Source: AGHT+IH8DOw8jFu20tYWeECEvg3iojml0rDggWVUOXEmQq6TtEKUwAtdydqgImho+auqElK84ZJvfQ==
X-Received: by 2002:a17:906:3111:b0:aa5:1d68:1f43 with SMTP id a640c23a62f3a-aa6b159e292mr58213266b.11.1733874361407;
        Tue, 10 Dec 2024 15:46:01 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62602cf3esm899768866b.97.2024.12.10.15.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 15:46:01 -0800 (PST)
Message-ID: <64bfc226-4840-4d0c-859c-b6609d169aea@linaro.org>
Date: Tue, 10 Dec 2024 23:45:59 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20241210233534.614520-7-mailingradian@gmail.com>
 <20241210233534.614520-9-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241210233534.614520-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2024 23:35, Richard Acayan wrote:
> As found in the Pixel 3a, the Snapdragon 670 has a camera subsystem with
> 3 CSIDs and 3 VFEs (including 1 VFE lite). Add this camera subsystem to
> the bindings.
> 
> Adapted from SC8280XP camera subsystem.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Hi Richard.

Thanks for sticking with the series.

Could you please implement this yaml as per the latest format here:

https://lore.kernel.org/linux-arm-msm/20241206191900.2545069-2-quic_vikramsa@quicinc.com

- Ordering of the description of the nodes should follow
   the example and the example should be in-line with:
   Documentation/devicetree/bindings/dts-coding-style.rst

- Sort regs, clocks, interrupts alphanumerically

---
bod
