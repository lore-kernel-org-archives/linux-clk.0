Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388C921884A
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 21:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745615201; cv=none; b=sSCyzUs8L0+C1AFuuW3t01QenshspPC5UodeKnS3YhmadCvBCs1/6vtSg0ufT4BgD6jzg7k26RIpNEtwfgsCdWnsKdSwuBwdnJPOTVK9O+NLvhrTXGyBd/oVtJqtl+XFRqzSB5QTN3YbsP5+IfITeZtIpJ2AddA5ehsUQE4bzK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745615201; c=relaxed/simple;
	bh=JxPwV9RN/TrvkttuKLa/6dUXo2D0QhD01ILVdfvCR9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X5QxOuI/yzmkCTEhxGBh1mc7x7idwJYhVQzpyBzFHjD3f9j8fLDDM53kRvameFZPwzHmhC0H55nAY9neUifulDWhJtjQkae0NfVmDx+W8kcKk/7uIc8oWSFLKulWPZ7XOh+A0ahxbgeoD5LH54eKtD6oS9KU5S/yb3acRr14zjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLiAfY/3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLiAfY/3"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaecf50578eso415376366b.2
        for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 14:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745615198; x=1746219998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hJSViueIlkywPb1dDkM+tOQg3Rq/RtJifu7KCMpkkjw=;
        b=SLiAfY/3zy/nBvPh2AwEot8ZjqvAlLgo59CcRUdC/ajyNpQkyhbgYWdhdnzNeDg6so
         YABYDKbJ9udeaPnO2y9lNYEenGGFpXXcn0Ba+8P+NqP+2Sd0O7Smo+OXE7ivtgzLDMcN
         9DMyI5okiZluoHvR/Glxpm2kEO2sQUFqubGR9ZOSb87ZSyJfuFQEqz+3tJKn9nt6VNwe
         UT+OvMkUBtQw0sQSM4KAD5RTD5f8+14OFao3Y8hbjsqygPeVnP+EPtZMqeZE7RGzy69S
         kznm5NR8YVJd1zC/m0S6b+82rWhLjKuL8aB0p0alOYXP8tNtUtioRUMtb6KGEvSBdwTo
         GCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615198; x=1746219998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hJSViueIlkywPb1dDkM+tOQg3Rq/RtJifu7KCMpkkjw=;
        b=QNPpwD/AIv9qwmtamHoWHA8Qw8SmOo/MVBgfgq62EoXP/hZRFUCOHDUCwnup43t0Qk
         yTlykmbdyaNlozer6QeBTCqHK5IBhpAR51kqBscosWfn/4K8v9ZN9l0XyWFdInPnDS/t
         sL6dRib06vShYKuPo+eq8W02aUDatcT1DWXlaTmq93Tpys2gcr6XyjGV97vbqXp5YkXJ
         7ZEAWIyEvaeFhcWhEirjmqyuE8MYJpQXu55tXQaY90PuKok9BX8YY74nq/ykPzUYm7Vq
         ZO1yWnHp34+RkZL03i+CpQCv14ov9c3MYwlJSSV4IkefDwjondm9abeM9LGBztpnvSq9
         nk4w==
X-Forwarded-Encrypted: i=1; AJvYcCVOUKTvu1+g/nogAdVzzLy/KCQCzCWfmixMHAN90KVuOe2S86/PFZSmWfjE2cHT9+opgzY8w6Z0kK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YywjCgDimk0WwlspgkgjhUnq4zISIukg3G8ku0B1e3Vrt3iabP7
	h2WafZ8RcTQ++pKUtdk3ComrdD4dQ9V6uXor5isJjdmxsoWM8VakPbV1YN5Qz+0=
X-Gm-Gg: ASbGncvAtviMEfm3nEHtOyq75WAZP/7nKSMWTQ8no+h0q68vsKs9SI2OPX1QWeNL5h2
	dSleOCpk0Lgsp6xUEo9gt27l5I52U2JBJGDt3kuSpyVtETSaqn1TNJygNcmEpAAFUuSf1Uz1R/a
	x7ltfpBgiaq2qPuwePDxNUoQ+E/d2CImEc/4G2lFigxMXkGkW2rY6CRkdjv7CzLs/3Q4RPNQO2M
	E7lzu9HUTvA3/bV5pA4CGs/HboEHVxLlroQcaa341it8r8naFvHvcxgHOgl3a9fHquW+/po2fKM
	U0lWHzcj4D08pqIkhAVCg3MugrbXZbjWbA2Z2TVZzXV6xN2FrtO/aM3l6xGahcl/dfN9N2vTtt1
	u5G6sfw==
X-Google-Smtp-Source: AGHT+IGoNP03/XEhQmgiGugXT7Kubo8eKyImPsEDnz3PTHi9TCSVIYUFM2j7d3vzwbsmvsEDl1RFXw==
X-Received: by 2002:a17:907:720d:b0:ac7:eb12:dc69 with SMTP id a640c23a62f3a-ace7110bb7emr383246566b.28.1745615198360;
        Fri, 25 Apr 2025 14:06:38 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf9a47sm190854466b.104.2025.04.25.14.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 14:06:37 -0700 (PDT)
Message-ID: <6841b51f-a4f6-452a-b5f4-c018ac2ec94b@linaro.org>
Date: Fri, 25 Apr 2025 22:06:36 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] arm64: dts: qcom: x1e80100-crd: Define RGB sensor
 for cci1_i2c1
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 linux-media@vger.kernel.org
References: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
 <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-6-3fd4124cf35a@linaro.org>
 <d0b3a631-e75b-47c7-a98c-6158507f1148@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d0b3a631-e75b-47c7-a98c-6158507f1148@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2025 22:01, Konrad Dybcio wrote:
>> +		orientation = <0>; /* front facing */
> This most definitely needs a dt binding definition instead of a comment

That's standard somewhere.

But now that you mention it, it should be a define not an integer.

---
bod
