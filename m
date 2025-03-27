Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8DF18D649
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 15:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743089318; cv=none; b=TgRfN6BQzsr1ymqqhJE7vEyYPHaaOqvYv0YaY4D1RSjszpPn+hNK2BTxI3WWoV4dNn7/qcCEhul63Cog9kdlG+4CXpQpLgAPSv7ZqyhfscT7pXyFLIqBOsieBO6w1zUM5D5S3HSPPDYoci1EXwvSupwLqrmwGjXuzVs+SX+UReA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743089318; c=relaxed/simple;
	bh=1/Xh1YTj3T8SDNh7s5nflXDE32vsD7ydzcDzfXrzX/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kr9luBVfxFuMzYQKj8kqNxOxstyyfrMiAylMn6kX3BNA6xAcnmECVuwxRSuB0/X+awwko4S+weKAHoi+xOYIEXECUrloRLkEdzEc9NEpwNilLn4BrO38QdKeufaNFOrKZ56VzNi4EBbVS5PID8UXLcl7VAnzBJDf/pG6FHj94l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sb0Urkyr; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sb0Urkyr"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3913fdd0120so695860f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 08:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743089315; x=1743694115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DE06nIo71/Mq528QWhpVuT3dqschnPU18VT092l6miM=;
        b=sb0Urkyrcr2wBewLD7s+rGL3gBBfpOjilCMkQG+PGENV4qpH2iSTIZKkp6BGxIQKuS
         GhG7JORwl1NZHTe2QTWc2CT8NVAODcIj4v1FKUYWjgmTI+FeXiBlfnSV5HlKEEA8I3VF
         PoHJWy3qPxnneigS66CwpfMemvlVg/kc4giMH0wzVG0NRPonqycLq2uUsgseFpIjZRGz
         0eMgriHzuUWhGMBkMVYvQ0jA62ZdQVpuqrigrIBa/EU8S1ToAgcO+m5Dv5Kj29uQ+VYV
         BUpz/w7MeLZYYfP+m9mVuQvSn72g2UrQIagXr0bRgwDSA6J+hdvyC0k10WCSmKTXuYCG
         EUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743089315; x=1743694115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DE06nIo71/Mq528QWhpVuT3dqschnPU18VT092l6miM=;
        b=j4om5KKCFx882WWjZs0suFH9QIbEKCzTdrzYhszmnZ2IOEPSPEmXyBs1IuRBuyV6qz
         fuOPGI9ZDaiCH6IuB+BuUZY+/hbdYX/JSHl69y/ELOYTcIDH3S8upMQacIIZ6YyWzWJu
         MXL0lUN56yXBRr90lY8VxmuTorxm6Zz/8jNcXYdqtChHlxoH4S2ViXf2ipNxvt2yD2RI
         +4icHnia6MFc/bJz1IT6wQUgKBz6AXUG9wYZZ9blzroX0OQf/fjMOxBIebUl8TTbJwaw
         ZCasbM20qHQMaotaJxqgfpF3ZsEUzqs3OHsz+jO9krCtjH+7aMmih5JnLnpL/s57KpMt
         zQNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBi+GY720Ig/gjcocz8SEZtv4Yile2r6mI4ftmDbVdDxzVkjw5teVXjgbAPkedd7OaMjRiY03r2ns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0gHmDbqHpnI6NVxAFUUmr+dK0WY8MJ4SdNdicbE1knBRYMbZM
	a6W7fmDsqU0O0p4067tk/yWm0qND50/d4VfIVfAUsHp6WyRfiDbPnq6Cddz4L44+lKWHNxpl1Y2
	uMKQ=
X-Gm-Gg: ASbGncugejK/TkWaT6kW9lICkWqV7xZPBK2JyqzW13dFbbosS9IzOtqItfNFUVttkI+
	K8vdpchVSpqQ9mEUfplLvauYl6nIrCmirEfeiXy/uZ0BsFvpmceC1ZSLqbvQnJhqrO6GzYDcRe5
	ZVaMMH7SWa7fHmPFQO6iLOMo1qxLFofpqpxHEilVY/BCj4Py+1RX0Y303pjOtOtVmIQ7ykNETme
	vnqplgM7hw9AIZABExJxjMnPr1BTYkq84YsvLPDaWfpJGPscw2+lHSJ386hSEjIPkn/ev84ODZq
	1UoCdgO5dZS87grTbEHPgQ6z8+aWeLnWL6ojUbctiAh87oEKJqYVjzkOYHTtW+JsX3Qch9l+wkf
	jlu/7ImdXtw==
X-Google-Smtp-Source: AGHT+IFNIkqkO/Sz8Zoq2RlgMDHLZQ4+HD+omJCdCjySdmnror3V45qCoIHUI3fPbTVEMJl1bOlNow==
X-Received: by 2002:a5d:64a9:0:b0:390:db07:87ea with SMTP id ffacd0b85a97d-39ad17704c4mr3242572f8f.34.1743089315216;
        Thu, 27 Mar 2025 08:28:35 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ac67970a2sm10007035f8f.16.2025.03.27.08.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:28:34 -0700 (PDT)
Message-ID: <c58b129c-1c83-44f3-bd52-13cc24e50cbb@linaro.org>
Date: Thu, 27 Mar 2025 15:28:33 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/18] dt-bindings: clock: qcom: sm8450-camcc: Allow to
 specify two power domains
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-3-895fafd62627@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-3-895fafd62627@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 09:52, Jagadeesh Kona wrote:
> -      A phandle to an OPP node describing required MMCX performance point.
> +      Phandles to OPP nodes that describe required performance point on power domains

I believe we are dropping "Phandle to" generally as this is a redundant 
statement.

You should also pluralise performance-points.

.. required performance-points on power-domains

Other than that

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
