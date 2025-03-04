Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E641FAC5B
	for <linux-clk@vger.kernel.org>; Tue,  4 Mar 2025 08:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077030; cv=none; b=iPTtPCLyrgYx5Oof2guyKkxz0kNRgF03e5f/aoRgDOMR3clk7MAxOzNcSpbOuYIdj9B4Xz9XmFH2/5kUExba02wT7piQvrbYLvAQIpKW7utbQn5TFCgDQiG4qg1YGzxo6Xod6QefDRNPtPNmLh9/cK+D8RkrrFvFdLNJ8tc3eJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077030; c=relaxed/simple;
	bh=R7n1fGRKBqdjYD7qjAK0e0Z/E3j53RSIm1oESRXE5hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODXxGn5EziZByO8IelAJX3iQAoYz0asOzRr447oZ4vqh0j2fcZj8S32Gs/426jrVgtn+ZVD3AKh+BN7GRWvZFLuPUWOO7IU0RsXl9M2RPMwlZMfjf3xjf8YsNuRgVjeuwhcOApYvryNRYfLQfyzjs0obJWadyAhfi9tgl/bEkdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oLStp+Cy; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oLStp+Cy"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54953b2c112so356712e87.0
        for <linux-clk@vger.kernel.org>; Tue, 04 Mar 2025 00:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077027; x=1741681827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exz8dJdGpu0keF2ocUHooEu3xVfMKLaveroqXRkMjFE=;
        b=oLStp+CyBpwi9PjekiWbpLhpJPiLNfBqQ7Xg7S2uBN0Nj+Rg1yRwihTXifdbumzjjv
         td1RbEZtpyK1kYB7+axVkK542Xz7uGPQVl21+WOX/JQ37efVLRmk+KSb/3OkmMunqDRI
         FeGo1oHZ4EmCyvOQX/4EhyDosAl5sAspNqU5SU8vgdTp3uwA72/qVVjMDnRtsp1Z6Tua
         xK0u4OgpgrPfSR0slVvnoK+LfsLO/C8bmbEVUgbZgCr6XTneFf4nLfyU0//OnxAj8FDp
         47jixILWSZFXZvibp5+EzbS42PIf7iALJhsjXp3mJuORpj/t5wn3OcP7Ho/uz0qHBniu
         p9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077027; x=1741681827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exz8dJdGpu0keF2ocUHooEu3xVfMKLaveroqXRkMjFE=;
        b=H12apLo7IZQ/L0manaiTmtNDoRJiSOAxaQaTFNFNhEFdLPlID8bHvj+3n8lfHgDALX
         tp89Nox/2iGrdZd6gZTDd+bYBJpfeT0GZs6yd5C/01Dt1VcXohckPBTgNo6mLbETFzxM
         3O7b4tl2wevvG6i3HMmQouJbcCHvn84lma4SPNdjbkeLrKTjA+uG+NK+PeunLhsOfhb3
         gKt0XDPp6mLIiEAN++tjjzagXwy6jQ69VI/O1wgVpDO4lbhxvn/gkq5nTgq7kpiSvXmA
         zakyQPU1fYq/Zrb4Cyex2D8mEA84zx5zDZpfm5Cveq2J7SP4ZbeI3ypGheIWP1xt+iqG
         dRMw==
X-Forwarded-Encrypted: i=1; AJvYcCXFkIdofMwrZs/a4V7cnR4sTiCi1+N6CgWqp1Ur1ODO1I472oc6ZnpXHeLCQmv0UggWkpyf7pdD30A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDDlWHJwXAPfr82ok3MFibzcKAsl7YlyIWA3lHFoRUU4X7wT7x
	Sc+KthNag0PbhdGgnNIdkDwJbMIhTJsdTtf7nQvJKDofKz4D/bPt+KzWC6VWUoE=
X-Gm-Gg: ASbGncuCndRD6G07BnzcDbsSERbp18TnBoV6G6zbnRWmV8qr9fl/DHN6nayGd391wOt
	ybsFBMn7l0KznMtJ6ziNXxs8FsxJPOQ2/mShyDfOCeUKinuBI1KbbayeCuehv9rnb498aILyO6H
	ojfUtNQj4JZtCJkqiChJifG3d+fWjvtmhnBLxWvBxT3KTGIhB9CfBDRrHwSe2ZyuwBDgNzqor1Z
	5ov7jfJ/uV33yTmxPaSsBf5N3ii8DJ65xmjYy/tj+qH3iv+SY5OQfsbssCi/M3YXAGKiIAI8gbd
	OYFa2SbU4N6NGk72qWhrZ3hfMCgYAXdxQD7NGhroxctVPaYdQBS+PUoytXo5vemZJKrVRhrdB1u
	4Tzdl1t0hKiFQmi/WCsV+ysw=
X-Google-Smtp-Source: AGHT+IEGXHdD67orThjoh+EdcaW0STtZkWcUjMqYIynw/oUS1Hi87oaWacTmj0dkEiU9M/5UUH0QdQ==
X-Received: by 2002:ac2:5492:0:b0:549:5769:6af5 with SMTP id 2adb3069b0e04-54957696de8mr1360664e87.6.1741077026829;
        Tue, 04 Mar 2025 00:30:26 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494e52a47asm1295952e87.152.2025.03.04.00.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 00:30:25 -0800 (PST)
Message-ID: <2e6a0c7e-9c24-42fb-be9a-2b73da8dc69b@linaro.org>
Date: Tue, 4 Mar 2025 10:30:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
Content-Language: ru-RU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 3/4/25 01:53, Dmitry Baryshkov wrote:
> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
>> domains.
> 
> Are those really required to access the registers of the cammcc? Or is
> one of those (MXC?) required to setup PLLs? Also, is this applicable
> only to sm8550 or to other similar clock controllers?

as it is stated in the cover letter, both power domans shall be on
to access CCI or CAMSS.

>>
>> Fixes: e271b59e39a6f ("arm64: dts: qcom: sm8550: Add camera clock controller")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index d02d80d731b9..d22b1753d521 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -3329,7 +3329,8 @@ camcc: clock-controller@ade0000 {
>>   				 <&bi_tcxo_div2>,
>>   				 <&bi_tcxo_ao_div2>,
>>   				 <&sleep_clk>;
>> -			power-domains = <&rpmhpd SM8550_MMCX>;
>> +			power-domains = <&rpmhpd SM8550_MXC>,
>> +					<&rpmhpd SM8550_MMCX>;
>>   			required-opps = <&rpmhpd_opp_low_svs>;
>>   			#clock-cells = <1>;
>>   			#reset-cells = <1>;
>> -- 
>> 2.43.0
>>
> 

--
Best wishes,
Vladimir
