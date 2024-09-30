Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EF817C219
	for <linux-clk@vger.kernel.org>; Mon, 30 Sep 2024 08:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727685798; cv=none; b=FzkPBK8VNAWCLMWLaQX0R+sJHnMryAy6p/O47CYn2jjin6z4REyeKH3QejOPV5dwfsNfiROM0MyDULT9EzNVKjg1UUz7pO7uiFMh9/pUr1FTF5c9TVkDYBGpeAPgotbUYVSwZkYPIB5kYa9dN01f7Qb/jj50ae35TI8r1EVd/oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727685798; c=relaxed/simple;
	bh=u/Hlf+zXHRGDPVK0pqQYxpZ8KaChJ70atyetPvNuwu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lesj9egvRMJxWOZu8CZpGsuelVLV3K3JxrcoIiY/ylsEu8nfDwubsbYJPouRIwBLJ2I0TdKOVcNQZh2J4ZFEmrLY07oR8+mh8PD+dcBd9HVnejrq03LQ9d93sFNdkQjQTQMLsJESPB4JwKmoKTTV6wtpB3R5w+AmAaYv8yPXtEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RP2EStk4; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RP2EStk4"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5398f62723eso200660e87.2
        for <linux-clk@vger.kernel.org>; Mon, 30 Sep 2024 01:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727685794; x=1728290594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k4NAWPmjNPYkmusJzkJ7wkfek3KORLL4wcikp5OsQO0=;
        b=RP2EStk4X/Ag1mv7miG8jiGHsVvOnGv8eszPM9+tYLnITQ56gKJ+vUUezBFeEbPlUR
         gu5tJQTfKdBigVsk1RHffiuZSfXLZoD3MoZqjF+ZUOlmSBY7+whjaqutdAugsrP6iCbX
         ofw0UQnr5T6i8BTngRkHu2OGm5hzdcUaYow950mH/bMJpnMkGUrKF2EXA/maQ4BeE9NJ
         +io6yAEuVP8YYBRCjRIZvTLZ3TAV3N6Wnp/I1kwhhGIGLeL4iGmXQciWQNayRsC534+8
         vpZ0VGcd9bI3OS285SgBtmmhOzlWuLFkplIfh/Vg5r+6BTeWMXo/wroERTqIO808uXP2
         T5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727685794; x=1728290594;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k4NAWPmjNPYkmusJzkJ7wkfek3KORLL4wcikp5OsQO0=;
        b=VbsPQWyCL0Q2B9+WpSh7Rym31CzvyZlwfMCE7cEFv2oleK2GPNM2H5F6KH5zqyT4SI
         5GoflJeUslGKGqIOCyxoMwSH37HKkZZsbljuGhYeNvrp6eEOxjPfGJ91e27M9onYsPkG
         3EYVVh3qOqDtHM7yiBKok4xTxCz6DWRk0zldqVO/q5GH8QeWscms663Z64GPo/KzG8t6
         3/qj8srjycJDFDZLdTG7gi+POwWNBzWBS5d8+xwRvPKvuOfLJ0smyjv2E8SrrxgQk2q6
         J1EAT3NgKapld0aelYihTX3ClufjEP/JoXVJA3F/yWEwltGvTMAwRgVxlt0Ea9FAnJCP
         HgFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFlXrf62NPYhzAK/VjkVOaGRZGBoBo8PJ7AjVxAGAH12HAED6aEBWwHacui71xv+ZZgEVavmgbbW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfxIus0ltgK7ATvaHW8NMqUThhbLQo4kiQDeLPq4D0b5apEbcC
	Yk3jpJH8l27eCSecpsQNTib3o0uhYrZMP5uB0EHItOyWV0ea8tSbC7YdDQEURtk=
X-Google-Smtp-Source: AGHT+IG2Enj9PsmvL9L1IwvFblCS0bQWt5hYPTEU3fS+wCddhij9k1pM8XG7cl8cjBoSProSlI4oSA==
X-Received: by 2002:a05:6512:6502:b0:539:8d9b:b62a with SMTP id 2adb3069b0e04-5398d9bb68cmr707544e87.9.1727685794513;
        Mon, 30 Sep 2024 01:43:14 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd539e7sm1183156e87.22.2024.09.30.01.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 01:43:13 -0700 (PDT)
Message-ID: <62528cd4-a5b0-4991-bba4-49cac161a895@linaro.org>
Date: Mon, 30 Sep 2024 11:43:12 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8550: Change camcc power domain
 from MMCX to MXC
Content-Language: en-US
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240927103212.4154273-1-vladimir.zapolskiy@linaro.org>
 <20240927103212.4154273-2-vladimir.zapolskiy@linaro.org>
 <a5540676-9402-45c4-b647-02fdc2b92233@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <a5540676-9402-45c4-b647-02fdc2b92233@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Taniya.

On 9/30/24 08:57, Taniya Das wrote:
> 
> 
> On 9/27/2024 4:02 PM, Vladimir Zapolskiy wrote:
>> Any attempt to enable titan_top_gdsc on SM8550-QRD fails and produces
>> an error message that the gdsc is stuck at 'off' state, this can be
>> easily verified just by setting cci0 status on:
>>
>>       cam_cc_titan_top_gdsc status stuck at 'off'
>>       WARNING: CPU: 6 PID: 89 at drivers/clk/qcom/gdsc.c:178 gdsc_toggle_logic+0x154/0x168
>>
>> However if MMCX power domain is replaced by MXC one, it allows to turn
>> titan_top_gdsc on successfully, even if MMCX is remained off according
> 
> MMCX is absolutely required for Camera Clock controller as it is the
> main power domain. The access will not go through if this domain is not ON.
> While I agree that MXC is also required to be enabled for GDSC powering
> up, but the below is not the correct way to handle the condition.
> In your case the MMCX could be left ON in hardware and that could be the
> reason for the access to go through.

Sure, it's the most probable case.

> I am currently working on the necessary changes to address these
> conditions where a clock controller (GDSC) has multiple power domain
> dependencies.
> 
>> to /sys/kernel/debug/pm_genpd/pm_genpd_summary report.
>>

If you find it possible, I kindly ask you to check and probably correct
the reported MMCX status as 'off', when it's 'on' actually.

Nevertheless the work on GDSCs is kind of dependent on DT bindings
description, I will send v2 shortly with two power domains as the property
value and a new property power-domain-names with "mmcx", "mxc" values,
unless you have objections.

>> Fixes: e271b59e39a6 ("arm64: dts: qcom: sm8550: Add camera clock controller")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>    arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index 9dc0ee3eb98f..5c07d1b35615 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -2846,7 +2846,7 @@ camcc: clock-controller@ade0000 {
>>    				 <&bi_tcxo_div2>,
>>    				 <&bi_tcxo_ao_div2>,
>>    				 <&sleep_clk>;
>> -			power-domains = <&rpmhpd SM8550_MMCX>;
>> +			power-domains = <&rpmhpd SM8550_MXC>;
> 
> 
>>    			required-opps = <&rpmhpd_opp_low_svs>;
>>    			#clock-cells = <1>;
>>    			#reset-cells = <1>;
> 

--
Best wishes,
Vladimir
