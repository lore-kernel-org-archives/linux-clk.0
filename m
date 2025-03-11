Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D7322576C
	for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741686564; cv=none; b=cjywY2jfsCGYkYZlDfKXYsQKJhJeD8MmvO0XB73GRgB3RsHWFUuAEbd9Jh2lLQq7hV3LRGfRBxdu2lFY/hrBcXkd+RiGGkDo/OK//sZS6CHDQ/rJCcvGC7EzjddPwSB7PPgQw/pwga4gEXvaWVuzR5l2nM3OoV1GNzExGcB5FL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741686564; c=relaxed/simple;
	bh=KV6VloN+Q45Gc0+a2tH993aFZT/8shI0EYvvt/qm3II=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hzF9M5zgUFW8GXltS7SHNJlfMttPQk1+0ArhAXZXNBJBHpQn/jPsqqVErN9ervynNjvwU0a9O6GdJH9quNHlXpaFXDdbefUjjaKJMnjfvcp11KKeD1e03AN72mFrKjMQk/ZBY7RCOc/hiAgQNcsRQXIvWldtN7rEzK2vSYnoGZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=COiNW8d+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="COiNW8d+"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac25520a289so683180766b.3
        for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 02:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741686559; x=1742291359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GyMmo00MijQvv1nIo9XATusemS0AEgh5wL246DTX9fw=;
        b=COiNW8d+IXRt4v4+eisTKawSg90sP+OEg1cN5/f+/8AUJQk9G8sOLQV1+csuymsrj/
         tNCY6lIw8dUQS5xRt6PNRIJhq6b5vvzWsHjyjF6aoPCXsfNDfIRD9KGjqOACVK8mUkLQ
         6fkHRc9nAZyi8dWLhGkFGj4kBKT2XibMnb5HBBAwZqd8mx7eneFCS/EkGM3gbmu0fPPq
         C6uKTOD6umPUQ7izZnRME4jDTj4ubWmdISqTi8rwLAKzw3De3qpGdA8jh1I/iu/COtEB
         cSBw3f/CIhqPIUfO/aanG5qYO81D/UXH3UOmSiB2bOYrra5UU0FG4MzjS0Ezae3Zy3ai
         xp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741686559; x=1742291359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GyMmo00MijQvv1nIo9XATusemS0AEgh5wL246DTX9fw=;
        b=Y3PPqSV+mjrOIMsvajXJlkX46yN8YnQeAJXLEqsNshpxJCVSJg+IJqWdRC+x2uL4Dq
         Xe7o6bSHqPsD1oDZdzD3LQrENRpVhxq5xWF1kKPHdIhNAcHISqLi7mLqqX/En7nyWFpz
         2XAX9LhVx3LfxsGsGa2J1VRbiXMjZ/8NqL+3Azsg+gPy0Kn0dn0jd0LKKiBeemyfhKNe
         3FoEvBQuoPt+SJiVVNCrE4vOY3WRqpBFrs1EcuPu3X3qpHM/Xhd5vzAY7G0r1//iZsEb
         Fjae/DV7eseZGQLq8mDxQ0RlmX3sdHL5NvvkFsJMMtprDPIRIDHYtrvibNfayMJDG5eU
         vtBg==
X-Forwarded-Encrypted: i=1; AJvYcCWuDpXzuXYYylervZSOL9FpzyOgbh6z74gF5ryTIGcpv6CAXYDJ7Q52WKfuUjcNCA7BvtmPq2Hi8X0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzyeE51fCm40+IlDnuQlMKFqvaXC8ojKjRl/M+s/xtOV+5zpwr
	H3SDK6Gk93tF8kV11YY92oXL7Ey6+uO2CggfVQ5/Z4PTg5r9hKjcPVBNdrdbMZQ=
X-Gm-Gg: ASbGncuNgprN6bxjCLu/eiMlYfauNdxn61NIMWYZdTNH5+vsIr9ywpEHFHXqEZA4N7Z
	RFpZuAzDcAbJm0Xg9wvJU5FCUrv/l/t/ylB9YC+mpPHwCrchF/liVTJSPEngn8rHp6yr/Kb0hE2
	LefR9rkUpHmpteZo7SuYLiPTbi6R6B3qKVgXOQF2BQeWU0sUO0agJGHxK8qIeg3Dlc2U/2dYPRO
	/Z2tilJSo0DJ7nkYy3/uFieyWwAxm5fV2SQ+S7XfoSd8n/nMK+HgE6zAJIMvuRPqpS/bvuoDNrm
	/61GhyyoMUHIR50KtWvcmOIdYlWrieNG5Gpyq0q0vg7q2spX/RlLfshfKtS/UdbseIJGyOs66rK
	V1cCKG8P9UA==
X-Google-Smtp-Source: AGHT+IHSU9UltopReIg2YEjALsfLf8gnqE6qARMGrK0Hc/6wePY9JUwYhUJuhkZKJ1tEBgXuDF7aVQ==
X-Received: by 2002:a17:907:3d9e:b0:ac2:cae8:e153 with SMTP id a640c23a62f3a-ac2cae8e645mr70428566b.4.1741686559193;
        Tue, 11 Mar 2025 02:49:19 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23973af6fsm899839366b.100.2025.03.11.02.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 02:49:18 -0700 (PDT)
Message-ID: <46b6dbf4-0d2d-4165-8657-7bd8a1329d61@linaro.org>
Date: Tue, 11 Mar 2025 09:49:16 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: qcom,sm8450-videocc: Add MXC
 power domain
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <lpuuYz9cjRQ3qc_0ZqUQk6SgCgfQ-lSt77HDAxGxNN9oGAQqORCJR2-DVUNcGjyeCqn7QKuLsElBbNDRjGQ1IA==@protonmail.internalid>
 <20250306-videocc-pll-multi-pd-voting-v2-1-0cd00612bc0e@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250306-videocc-pll-multi-pd-voting-v2-1-0cd00612bc0e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2025 08:55, Jagadeesh Kona wrote:
> To configure the video PLLs and enable the video GDSCs on SM8450,
> SM8475, SM8550 and SM8650 platforms, the MXC rail must be ON along
> with MMCX. Therefore, update the videocc bindings to include
> the MXC power domain on these platforms.
> 
> Fixes: 1e910b2ba0ed ("dt-bindings: clock: qcom: Add SM8450 video clock controller")
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index 62714fa54db82491a7a108f7f18a253d737f8d61..737efc4b46564c1e475b02873d2dc124329fb775 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -32,9 +32,11 @@ properties:
>         - description: Video AHB clock from GCC
> 
>     power-domains:
> -    maxItems: 1
>       description:
> -      MMCX power domain.
> +      Power domains required for the clock controller to operate
> +    items:
> +      - description: MMCX power domain
> +      - description: MXC power domain
> 
>     required-opps:
>       maxItems: 1
> @@ -72,7 +74,8 @@ examples:
>         reg = <0x0aaf0000 0x10000>;
>         clocks = <&rpmhcc RPMH_CXO_CLK>,
>                  <&gcc GCC_VIDEO_AHB_CLK>;
> -      power-domains = <&rpmhpd RPMHPD_MMCX>;
> +      power-domains = <&rpmhpd RPMHPD_MMCX>,
> +                      <&rpmhpd RPMHPD_MXC>;
>         required-opps = <&rpmhpd_opp_low_svs>;
>         #clock-cells = <1>;
>         #reset-cells = <1>;
> 
> --
> 2.34.1
> 
> 

The ordering of these patches is a bit weird with this binding first and 
then the rest of the bindings later.

Also switched my linux-arm-msm email recently so only got the first 
patch with my RB in my Linaro inbox.

Suggest as standard practice when you get review feedback to CC previous 
reviewers on all patches in subsequent series, especially if you are 
picking up an RB on one of those patches.

TL;DR please cc me on V3.

---
bod
