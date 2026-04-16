Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4E51514F8
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 16:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776358659; cv=none; b=FbQQ64758BsR075u5CZs4R1WLQ9/+U5DLuu8KhiI2WtskPozzlHvkxZ7xhnxXmxzAjdClQT8Y43v/YUVTmlgs6GgsY3A4IDhTX/RmMvV7oJQ3iaUvj/OqIlKvjl+R+yqvImrkyf6UNW0AHJWXf9ZeXEvPT3Cl7lXeSOwxSmER6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776358659; c=relaxed/simple;
	bh=ZQzEC9KPPF/hi8gDo0hur4Qe56bygpOXxw15KXDnxAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3rfAtPpB2jO1GuQz2Vkw+Gjqtw7Tg6iAqO8XkgAafPYvIpDdidmlx4/GmyHJYVvTNyXnCXJvpoF4LJQUuyJCcqJ8QlxIucisIs/ZAtvk5y/U2iIbCxH+GoL41re7T4tqssfdkMIbIhIYrqi/zcYM57SdnBjFUGQyrtieLHVosg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/MrKT6O; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/MrKT6O"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38e7c3a2deaso38431421fa.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 09:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776358655; x=1776963455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GwdYD3XnjJtBgOU3arfJQiqPM7dBusbX3FMwNNhUQFc=;
        b=A/MrKT6O9oD6Gfu2xmuZDFlnBZTe9Jk/sv7bT4sc+7K4ZbAgwuGa56iA95WpWk8z/Y
         E+v2A/H73A1sI0mubI0GSwIcVMuBIZMtaUT/l+FHqTR+g51zKNqsWM4oUriPaUtzNB1a
         2PCDLQnOpAQbDbBiacp3laaM0SHVGtMUPhPosJWmuN5Z3s6CzLSAM2cQ4t6i9VdWqKoN
         IikH+pcAqGOKGLZOPVqs7U2kZ6WVzyQb8rVJF4EDMKOAF4j5XOp6zYwQj75u0LZFRwMm
         PbhdwrTPJZAsuYiq76tTuuj28EInyGiKeNwbr022Kae5Nd+0NIYQBP8gjE6eav+5FgtK
         ehUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776358655; x=1776963455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GwdYD3XnjJtBgOU3arfJQiqPM7dBusbX3FMwNNhUQFc=;
        b=Btp+5cwBF76raR1ajDs44MQhMBuRnuoOIksCC6Z/b2g6Ss6hGyQdpUULxwvyZ+PHjy
         FyRLvNz4h6wwYQI7AXlGW5OgEGhQBxavD7XqOPB/gx2/0yLWXkRQWEhbs1gsHY9hyBfZ
         kYwc4OJfWcEHLl1pRC6ZaYREbVCnQZJVeflbSf2K9MVZz389X5pL+lHZWk+EFnB1kDVE
         1NvViTP+7UPGUjVQJ8IIcu4G/iBNrEzJ19FBZn5BpNHiKpVQOmjcMhvRlhQyFVBBzd9E
         rXqoKeHFieUUC9mBjN75n1c3hSJL0NLMuPGfgDn9r4eRCwVHRim6eEQBkYtN28QfG6tB
         +Bqw==
X-Forwarded-Encrypted: i=1; AFNElJ9ICGaOg+Z1dUsgiOI6nMidaAJe9q7JccfNbTYMs0ZqSPrQB5YFlyirzW/RfmuItZpFeXEuy9r/+T4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxPIkAKC8Oej4uPqFTUKx+B4rcw65YFwwm+SscRJT5rDgp98+a
	yQbnMAfctkKPWGsHPDdPEu5HvRrP6DiBdL1QBnaA1bKxPmZhbu9nbIu9
X-Gm-Gg: AeBDietZspFggqdJemkOdaiHXt4dmkEPRaTeBto6oiAnZzq8RcvcN2cAP6YQw+QeH4L
	a807UwLHyO5a1h7IV3L6SRpiSBzUC9hQ/7xK9XFmnFYA7cJvV4JLQy9xlEDov0d7FRTYuxKfhYG
	DYIqqTI4L3rMmW6RINXa9Pa1ss+Qa/SKanmq7tLFDaaqY0VZmZkhPCYdHktnVmfxWqLb07zcKB7
	ARy6mcTykYro0lTFLUfF+ouq/upBJDX0Zy710ycIh2X/dqOkMdQG+S+45pqyFrrlROHsd4qBgmC
	wBCzz7uyApai4caBcvLewMvv4rYrwgFcrPTXCgHlg0mLD0u004J7kpzyQgVZRVc+FbPssiXhtx9
	oI6X+oURWXme3hiLWpnrp1oLnL5VP59sql77eu8HDZpTEQcfAZ00UsRGZWZhsR8aqIBleobt+j1
	2BC8Z0mtIbiUCoiMl2xmLgkJMcPOLQF/z823KySnzPis+HmMpQ0iN0nK0Pe8UJ53k2
X-Received: by 2002:a05:651c:985:b0:38e:21bb:b2dc with SMTP id 38308e7fff4ca-38e4bf67cd6mr84783971fa.32.1776358654514;
        Thu, 16 Apr 2026 09:57:34 -0700 (PDT)
Received: from [10.29.244.82] (m-37-0-167-201.cust.tele2.lt. [37.0.167.201])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e9ec6b35dsm12269011fa.37.2026.04.16.09.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 09:57:33 -0700 (PDT)
Message-ID: <ad482bdd-2fb5-432f-be1d-dec25d9cbf5b@gmail.com>
Date: Thu, 16 Apr 2026 19:57:30 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
 <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/16/26 6:17 PM, Konrad Dybcio wrote:
> On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
>> Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.
>>
>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
>> index 90e966242720..231a3e9c1929 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
>> +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
>> @@ -267,6 +267,14 @@ &usb_hs_phy {
>>  	extcon = <&usb_id>;
>>  };
>>  
>> +&venus {
>> +	status = "okay";
> 
> You need a firmware path here

When I tested Venus on my device, it loaded without one specified -
msm-firmware-loader creates a symbolic link from modem partition for
firmware. Additionally, none of the MSM8916 devices seem to include a
firmware name. Has something changed since then?

> Konrad

