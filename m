Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24D6257844
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758790903; cv=none; b=Cs3YOo44nf5mYI+Ib5r8Ekooq8AJDEDy/JbesewjIDgUvEb6vvJEAoePSofn0EwhP+4Ljch0ndExrA/9UKWQHmlhxRqAPfKOpFbCMGTcoK+4C+E6ys240YYf1Xeev+n0S4cUb4C2qwkx9uaC3E2wYUatzTQopLFfAiadQ9O1iHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758790903; c=relaxed/simple;
	bh=yqstp8v0w5ZqvhHqs9nCFyjLloZ4iTt0o1sbH2L91Q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dg92Yp05903gC1KtLGISdc60Cm3ys7PWnW9gZQuMR7XbNtKJKQbqt+vRam0A/ltKYYavVoLuVKxsa3GFJtFcvUJBjjkIah5DBW3iGxbcFrh6fSy/nxg0MEZ9PsJ5SJpiWnyoIFx7xAFLggCW2DkpVHi/+jqq+zlFxSWRGHbAP7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KcBMAzOp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KcBMAzOp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e23a6617dso6935115e9.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 02:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758790900; x=1759395700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yqstp8v0w5ZqvhHqs9nCFyjLloZ4iTt0o1sbH2L91Q0=;
        b=KcBMAzOpgBkmgOocch8p8cFOUenehfx6DudKUPvCrNWWDmnJsQL7zcRP0O4lKi1irG
         nkyiXaIwogYr91qhYclzydOPex9sLbNcQOAbB0cEtkxJpRvNeNb+4LtDObOnFyzV6N1F
         GmILdP6DWfMDYHUr+JL/CMmZpCh7/aaXNE2tPaK+qkK5vlQQN72g8TB6nbT8Be9DgqyV
         jVYRVBTFfRjjF3NL+7yAlnZ7bVgS54yZBEZb/0fku7IZyyFuKMT/pwMQGk340yOxPMXU
         pyAOdZAWaAO6GXtHjXMTE4i9f9Cz2Kv/VmAET5PkDMVDRL8GmnxJAMAEG5uVCIcIGS3G
         lFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790900; x=1759395700;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqstp8v0w5ZqvhHqs9nCFyjLloZ4iTt0o1sbH2L91Q0=;
        b=BLCvka6Xo0RlCUDeJZhEEa11as4p8nW8bBhoE7fG8ek+z4+F/0nt1oJli4S1NV0gLv
         qGmbt8Q6DYMfJdxXLbs9i+hID5Bll3EbOFqPkLr5Bfk6hDAxv9RpwFO5e5kOySiiIliM
         78cf+K19pAelzTWpP3wcZoQ4hQqooz6NAliim7IgEK7Rr0rw3Vsof8rFZ62WVBpqBIF3
         52Hhwaa7YWYW3x0LktJdhm/mkJgSFCHlkU477dVpAm1AZhZTcnUKU8A491Y1eQEHc0X9
         Tu0nnH3WD14dtXMUrfJDIp4pIV16gJil7aUeXCbtYEm9R9h28iDRJwABWom2VC5PyivQ
         uaeA==
X-Forwarded-Encrypted: i=1; AJvYcCXKyVUTD1wTpHFa7wyq7KOXdX9AZVWi9vG4S9UgxgXPy4zGZZiu5CL36j/mWkp//EdwY8DcCwoU9kM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8zs6mL52+FXh15pk8jck5UNhrvat9KqT/3WQW7mnGUmsU6Pct
	J0P8krzUC3flZAwZ0wqnuw0elORlUI0cIR722Q4D4yjCaP/oDAZhO5xL0aMFUNr7498=
X-Gm-Gg: ASbGncuwb0Ubvx5OQ/OmMAKXWWZ0D4awWg7JAMe1Zt9Uaq0G7hivyNOv/9p+2mFKySy
	/Qf8JTZSuar3PC943qQGB+CMvIpOYqehAX8XUHcU3Y9tyE5XNfeWqffg3DFNH4uTMHBG3x+91Aq
	dLTasUfWCteKN6qJ/LF4C1rEqvpeGYL3Z3JlL1IixD2ByOcH1zl+IqyqNEur/OlkZaRneWNYrv6
	qFENZFICAZ0NUdviNvr4BZZTZ9C7DqeZwnbTUbnxprgWIPbx3cHg2SaJNqPxFGLgN0WShkPk3kp
	SESu5H4MTeLZFRvToc7QFZeovgAq6yy5CBBFYHAQNPi+vvSYklxt7Mrs758YoVkmUpZpkOYrf4b
	hqyQDCy9wy6BEfx3Cy9I0ijr338SE2sXKR1kd9AZn9kc2+gF909pst7i5Eq3JF02JsbETxSRlNJ
	pPnbbsy6bCw02LJwBTFrVTmHsWvnM7qEU=
X-Google-Smtp-Source: AGHT+IFPH5bNTpMjVvNRN26DifPNLAFoSeAoicHRC1HEEH9oRvExzs+S4YeuHSGoOiaUNTFghFYSSQ==
X-Received: by 2002:a05:600c:358e:b0:468:9798:1b4d with SMTP id 5b1f17b1804b1-46e329d1b47mr30509265e9.7.1758790900027;
        Thu, 25 Sep 2025 02:01:40 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb7203b8asm2128929f8f.9.2025.09.25.02.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:01:39 -0700 (PDT)
Message-ID: <14df3870-6cb1-4e5d-9c4d-bb8acef8c594@linaro.org>
Date: Thu, 25 Sep 2025 10:01:37 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: clock: qcom: Add support for CAMCC for
 Kaanapali
To: Taniya Das <quic_tdas@quicinc.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-3-d7ea96b4784a@oss.qualcomm.com>
 <4315205b-5320-4a8f-a707-45f5eb35ae51@linaro.org>
 <8c558ac3-541b-47c4-be4b-c9101997de7c@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <8c558ac3-541b-47c4-be4b-c9101997de7c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 09:46, Taniya Das wrote:
>> BIST == Built In Self Test ?
>>
>> Can this not just be put into one camcc header ?
> These are two different clock controllers CAMCC and CAM_BIST_MCLK they
> should not be in the same header.

BIST means Built In Self Test ?

Is this really something to be upstreamed ?

---
bod
