Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982C02820D8
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 06:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747290539; cv=none; b=aEvt6+UY09Z5plR5beH7maRvNzDcsxOqkhu9jG2q8uogwbbruPq3Ge0GwInUYPuqSuUUO3xvRjLV2RHeQf0jbdvluKoem3ScDQNZ6gmDlAv4qseFoGgWchnwy2jpTo0dnjE10YPETlQXNjaMsr4mUOuyzMbzI+pnuOGQ5Ke/0xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747290539; c=relaxed/simple;
	bh=00AV94dG2ZcGMrm+oEM6uxQ3vNHzQbtkKeRhT356qXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rm5uBDgs2ciQg9fUVq54fog7i0wr4Pgs6FKq96+z7Wga5xflz3PJQoTm2ykhfqidwhxwatYTRZTdr/xbS5yUcGDCFQBWYUi6g9P25AC7ZD/kNdin8UiRgXywo3d6rcgWYAeaNsr3EixhL8DrC+J3uUgMMFJa+j6i8rZA2a9noDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=djxWEGz8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="djxWEGz8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so12680435e9.1
        for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 23:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747290536; x=1747895336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltzFKNmbLblqGQ8qkM/SiBLYExEz5st/fzGa1uhJzPM=;
        b=djxWEGz8EOHzllt9drcA4a2TkEtmrQnBzk/C9HJ0xrzdOdjyysxoiG4hv/ZA2BkQei
         A8J+QtR4pQPHBBH/7cpjcpoq6Ih6nNrZcxeGXThBilvG5VBKu6dZ+2L6hcQwBaGYTHy+
         YzholSNzE0kG6mgOvaJgUox3KyEWn+e4xqW8/NiE33TdTS6qnYnkfGkdCtTu0zxj40Gf
         ZnytTbEq02cAGz/pZ5CXtXfwU1xa9YZIhCXcc+Iicu5bnVN6psoTQtREwiX1KTw7sJTq
         4+/0i49vuF2r0J2MkVIePzY7TLnT0VpyzXhYk4U1AcScNEEi3H9M8Oarr7Uf5MW9RfE8
         4xzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747290536; x=1747895336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltzFKNmbLblqGQ8qkM/SiBLYExEz5st/fzGa1uhJzPM=;
        b=kaHs3dnADuoql1WZtfIVCwejiTT5AX/D3JjOJN0AX4l3exuRf4mqQtGFQxJYQUhgBH
         wzr+v4Hg69W7LjcS4+UFMpQ8bnRvRznQQOyyB6W64Ei28usQ+38D6iVobXhssIWi2FNs
         K6gWetl06WmjPCD5F7r7rod2MV2XCjmttQXrUI8WcWZVpQ790hDirZ+IIyfYZTtdvtfF
         1vbo8jSdsuI6DPCHeDUfKmSQBP/qrvoBoYOkF01DwANICjPTnUGIBESkv2GynUDQlEdl
         2nlHRZG6daMPlLwD1aFdW1KdvrrE7RWGMwkC3Kvab9KA+UCmMemd+3uFh6hsfNb4+N/v
         WbbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoXRxwH67aR75AtEfUN0R/DXSQZ3+qjulPwjMf+EGzfnNgSRD/s7+coMyh9Vd963n1V0BA8AnzdTk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz57jFAIHHo4T0gkGC9VirS80t9MhXEs5Ai/Ox4nXdCTeLkADSE
	up3Tl61xbshfYjl4d1ustRz/Loqg/P+l5QBdo1202iP5KOEAfxpOjbeHOJF65TI=
X-Gm-Gg: ASbGncvOaObwOhbLgLGDLfcUOgar4WTbi8PTdqQVfmIcMgVbNXc3fsgoMga9SvEHDp9
	Ie9OA/t1+7idbZXTa66SlZ8FWwgcfvshx3CL0QBEhRpAcFHzfc306/Jvc4Or3ITYVHGtnHhUcCP
	5Zjbu4jxtMs6Tik330Ld5QOb7LAVsjRrNiCFunke2DQ+WOAm2vFS6UGbDWPv4rzCx5s6VRaGkjx
	UDP24neL8kpRRcqzAeIWYn0TqLArwkqmiubNM+0m0mDwchv6AdYG3/MOHDHEMipOhZH1eQbYiQh
	Y7pSBc6XpZwGLERUMOc8scebUrgyvU7WKp7iOFxja6LEd6hw890kz+dsJUcI4A5ojHNemYLG/WQ
	gIYmilfIy4o3W
X-Google-Smtp-Source: AGHT+IHPjN36nPIAFheoxSJeMD7QVqgCVlEcC9j4OaPSYI+l7JvLUZZ3UyCX1An8LX7/LhBBB/f7Gg==
X-Received: by 2002:a05:600c:6814:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-442f84c7cafmr20169815e9.3.1747290535806;
        Wed, 14 May 2025 23:28:55 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951b62sm58204595e9.22.2025.05.14.23.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 23:28:55 -0700 (PDT)
Message-ID: <e6f8bf0b-4a17-494d-96c8-7384f9426ff7@linaro.org>
Date: Thu, 15 May 2025 07:28:53 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/18] clk: qcom: common: Handle runtime power
 management in qcom_cc_really_probe
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-5-571c63297d01@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-5-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 20:08, Jagadeesh Kona wrote:
> Add support for runtime power management in qcom_cc_really_probe() to
> commonize it across all the clock controllers. The runtime power management
> is not required for all clock controllers, hence handle the rpm based on
> use_rpm flag in clock controller descriptor.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
