Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C0D2C033B
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751641709; cv=none; b=P9O7pjUZ6zTFwNsclJqi7JCrbmNWjaCZwH5KK9vr9lynmfsR5s7bthBbJEieFpG6A3aosN+jgsPi1ODcn4Fb8+wsfDuJ2vcLEn+96mLeHQQVt8t3DDlSyOTi+c0ZOtM3v0djsThDD8l/XM4bl4trypJZExgVWOu+dUyu11IbvVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751641709; c=relaxed/simple;
	bh=z99ypbhgt7PRN8CNu5zmUrW+s65R4pj9X6lJOs+6Kxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KJd/d18uz7Ow3AbL2vZyHpfeSUBtokpXFocmFopOGFt2M7wS4RmLwzITckCg0iGctTqiooAzpusbQxKQSwfZpw124RW/AQHQlMhCP/+IWEKQEWiJsdnrWbTR1m80sjdd1idxPvccsGJzRbwvFBINthwJghjDd+NPK06781vdlPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TsGzQbFF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TsGzQbFF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso6501505e9.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751641706; x=1752246506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5JRqGvyBumH802l+nR1KOGYBxhhomQIR/CQn84+0wMY=;
        b=TsGzQbFF8RL+7dmPk+WF6CWVnx1xG0MJ+6u6RX6i+R7FRtfg1YT8QqsElhddbGaYgz
         dTqIl751+WFPl5LWNw2W8qTDA1gHOWAZnSZDBOSggvfy/PunxJpl9+4W5q/tQCqwJH5Q
         joPiAYwHwOc9VJeRTYXARvIPuY6koX9soZm8IpG8N0mV6gggwqcjz6ZfhKTyr0C2G8oy
         eeOeB9CGobcrcnjrStG52jJ2HUVa/9ss7B71yw5gnArgGVUBecKs66tt35bd/i55G+EZ
         b7yg9ZLKv4TYEh+h5Fb23zzFzqza9KSTlat/OzpKE1SmfYErxn9u8gVjzWnQrxUNp0Bw
         eCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641706; x=1752246506;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JRqGvyBumH802l+nR1KOGYBxhhomQIR/CQn84+0wMY=;
        b=t8lRKsv3t7arVCVRb5Q91J2mBMGYU7uKJ+yxnWoML5OTQ1K2cWFSvOiQzrD51TrsXp
         ZB1MEyDq2XRlgEEppuTyXqTlKwWAh1FslXjS3T0guDpF6Pp93UgcFosWeoLJOFTVcdF/
         y1SbDFuWmXeuz+iucuVl3rsFIByglv+KvMLz9d9th+AMiuzW5SRFrsAmz0vqBUcdhAJe
         NR/TAJPPFXE5c2mo3tbUVVnn+KqvPD3S3+pLzejLBqVw3ki3gHLK5NDCEGaU+Gdg9VEb
         ZvEP/SyX5q2+wQ3y8V99IOZDzrktvXwGeUrbMLvNRjizwwKNbtbuXBN1n2LCi/lpP/pL
         yZsA==
X-Forwarded-Encrypted: i=1; AJvYcCUnjvOS0bapiBR946FXr5zZYmOxVsrowk76Y/hmL8u41Ql8bKUrOPX9KGNwMmn2f0Mu9bhQvKiJx8s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb53cAt2cxEU370s4JkCRHTpq4/kBS9Y9rhM1xa8ai7DBAPtxr
	xTzi5Ntfujd/kzicoDeLb1zeOWHqjEfK1aRwCOoBTEf01VbZY++FSMqh5lygqsRsoOY=
X-Gm-Gg: ASbGnct8qxnb2Q6Kn+7pswLy9m8vYAIWi3YJZoi8SfQHooix8532vI8yFxS9scxUZl4
	GU0ZlsvR19fmhmki3FJvvNxVjZ9hNWZMR80tc/TeyopAkawjNYAsigrCV1VJT0QwIKqVKzfWzL9
	jk0ciaRJKTJeVbqLhYq4DY2FAOupnjojhBx8fSyZMl3jiu+UpMc7NXtIWCGrBs22Ec35zLMK8Um
	EAsUffTGKd7UHPfBwD5ngbMZIR7V1qTriZKwv6M/8LUsP5wmThCe8NdCulyXgARK0u4iSfj4O9A
	IObwecJf6m4YUfKjpn+WG8ZsqjqGyFDvuMQb4lPhJefusgUcwqVp2u9K92G6beaGVFLJQoDJ+iH
	uiJEg2+NFKIi64RbCp/x1Ct8fhUk9RElPBM0E5g==
X-Google-Smtp-Source: AGHT+IEhXyWUKZBqJ1/rbt2q/CXsfjI081WY8MKxoJLn03mwHiCnJ6/2m4+MnYAdB1lvJU/vPxvxlQ==
X-Received: by 2002:a05:600c:4706:b0:454:a37a:db67 with SMTP id 5b1f17b1804b1-454b4ead1c5mr30539075e9.17.1751641706107;
        Fri, 04 Jul 2025 08:08:26 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454abea60d5sm37229795e9.1.2025.07.04.08.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:08:25 -0700 (PDT)
Message-ID: <93a1f14f-ae25-442c-b495-e66c74193d06@linaro.org>
Date: Fri, 4 Jul 2025 16:08:24 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom,sm8450-videocc: Document
 X1E80100 compatible
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
 <20250701-x1e-videocc-v1-1-785d393be502@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250701-x1e-videocc-v1-1-785d393be502@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2025 18:28, Stephan Gerhold wrote:
> X1E80100 videocc is largely identical to SM8550, but needs slightly
> different PLL frequencies. Add a separate qcom,x1e80100-videocc compatible
> to the existing schema used for SM8550.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index 0d99178332cb99d3f02f50605e19b9b26e3ec807..fcd2727dae46711650fc8fe71221a06630040026 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -25,6 +25,7 @@ properties:
>         - qcom,sm8475-videocc
>         - qcom,sm8550-videocc
>         - qcom,sm8650-videocc
> +      - qcom,x1e80100-videocc
>   
>     clocks:
>       items:
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
