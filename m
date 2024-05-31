Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389AF140395
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 09:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717149449; cv=none; b=ZigkfpGUrVYlnYf+Yqth/7fqFs9fPym8D6gEP4XYsRkTWpbIK1Z03rxAhH/W4YDkjm8ha068nLnQEj4EQkf1pdLhjoiw1/G+3zXNWT/jjoK+KbARenPzoceVrNcV0BNqGVcpCxjEgpiVXb9b7AS3UnhNQ3A/8B2yn24CVsV99U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717149449; c=relaxed/simple;
	bh=4iul1q3ziIOX4wY5BACqR46WFpTvG+YibLwVl5LAicw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PwFsoPJE7dSu/8ky8PMyVXJ8zIE5XJflMCUJVhmQIGz+zE/lfaO8g98v/Eal/l0J+aU1NyJ4V7u9KlvWbXOjaCv19yCG09ZoykGPtDDcldHIgp1wNNWK6Lak4+3vgxDdtPOJCbOIHlIdGrc+z0eP3bpQu95IPj+DSeHu0fFO1B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=er6rRmMl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="er6rRmMl"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4202cea9a2fso18010505e9.3
        for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 02:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717149446; x=1717754246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zkveM/ok/B9KQXMo0hmfn8Y67x6J5zcR865X6iF0u0o=;
        b=er6rRmMl2LkBkmcT7nBk9/MX/Yk3zoJQIuphVtUCa4Cfk5I5Q/gObF+24MD2iQ5zu3
         W5LAf5YGcXHoiIJK3HS0VFzljELP4ohJXXRPLPPj9ne5WGzbA69n5Vjh1+BlCKQJ4NE2
         F2cHsD9q9JRexTiDqBw+CyhUWR4OYj8Rm/64JCNqZSIDPxCifA8MmuDavvtu3Yeca74i
         DZbxK8Yuz6hl4oLvjJWqSwH4B0gGr5XhTA31J8PdJ2EaBjm1kDsWpG21K+X02ttdOCDQ
         vvrm0SgtPqrDiVRsJsqihFI2mBGKtrtd0GJov1b3CXnjS3ECI5vTRjs7MCypJuigqekF
         AYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717149446; x=1717754246;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkveM/ok/B9KQXMo0hmfn8Y67x6J5zcR865X6iF0u0o=;
        b=EYz3SGcBo1Mj6mT2qAnPCLtWz/xSphV8X0CtEYQLM6olpq/IKlgtCRJnLEhzHxHvWp
         KU2q44sCaSXROs066qoQwHc4pYb6w+jEQ41OMFRADlzdN+zIysvFdBaTfuGbS2D/v9k1
         Wm6+IF2pk9MZtyzFohB5eAwdXnx82lQ3rhoGv0KSVYHgzi37cwP3bvcrImL5QaX8yyG2
         uz21/uUMO6eRyxPQeCalJCe0MwUVrTQN0ukByP7e1k3/0NmVdtYjhAyQTWsBCiixGiaS
         5xbrY5Avof1yQG0RQ1DPSqBOeaq6CZvnK7Jtn/i+BnhBKY9DXmARYplBxtMLuGol3CPv
         8EvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrhVzarudwEP31noVfWzVp7XXvHVAUTze4Z7MdVqiCya5tQK9PJP4dPDQ6P2kKCFcsJ/E2al5au/jWB9lKK0906A7oTHM2+ppc
X-Gm-Message-State: AOJu0YwnufLAydibvGU6+NgRGJyb9WhRFeKIU/haF+9sN7xys7LVkK9Y
	2/vwcTG2alwXYh8srK/PdeeOrax7T+5gFSOrjKm6KuzrvzsHfq0H8z9CSsRzPCE=
X-Google-Smtp-Source: AGHT+IHTQ1hR/BQUMwp3djjYDVdMOJaNgVwQKEJOHeGWl6RO0X8dVmGLWaXJcIff9nsM4YEm2ZAinw==
X-Received: by 2002:a05:600c:3595:b0:420:2ca9:1b90 with SMTP id 5b1f17b1804b1-4212e044239mr10830835e9.5.1717149446529;
        Fri, 31 May 2024 02:57:26 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b838b83sm20265575e9.10.2024.05.31.02.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 02:57:25 -0700 (PDT)
Message-ID: <b9118c0e-93b0-4920-9107-42bc7c274472@linaro.org>
Date: Fri, 31 May 2024 11:57:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] clk: qcom: gcc-sa8775p: Remove support for UFS hw
 ctl clocks
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, quic_jkona@quicinc.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-2-quic_tdas@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240531090249.10293-2-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/05/2024 11:02, Taniya Das wrote:
> The UFS hw ctl clocks are not being used on SA8775P, hence remove
> support for the same.
> 
> Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")

Please describe the user-observable bug you are fixing. Commit msg
suggests there is nothing to fix here...

Best regards,
Krzysztof

