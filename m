Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D2833A702
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 14:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471209; cv=none; b=aLQafpBuVvZ8cf7xGPRnKWvcbw5Ww8Ii8EpdwVzFPM2END/cGvx0Mb2zbioyIviwisOSOfEb0ImXu4KA/bLtWUgaTB/aw8GytBEzutPvhwMqYKiB8ddb4U9F6rdU7XaoIhXXxL43Y7/A6WOHANgEjrITK/UGhdykzTf1MMJT2NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471209; c=relaxed/simple;
	bh=uybU3a3N0n0+jby1CmvCwk1L1SefcxFqIYnY1BYddAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VwOnq9vSlbVq6pERBi79Rv5mvymHoUBTkbHDxRfW+LzhTQQo4HjGg/MeB86ckFd0ALIIfiaXflLZnLJWhfBIAVwIm4BneylYiRpOvPwLNgx7747fCUvTfAGzL0jCQ9AtRveeNPsIT14I26Uup/7litlqMSq9fGolDd7vwM8arJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxkyfsFv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxkyfsFv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso132237135e9.2
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 07:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777471206; x=1778076006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pXYxfb1OnKvjy9v+vQDtCcuNHO3JiDi1MdrPDxdzPQ4=;
        b=mxkyfsFvPVBCUGLbQM+72bZVdnssX9Y05xc2sKUybW9xAr80jXDNfSTDWEBc9ERQzK
         xRCC7+HbSaDH3E1ZhIqdShw3xKz+b4gNCKt8Fil+TOxwDZvMWMDUn8TbJG4Zz/5J8a3e
         4HtyqCkjWIFBsw119wcUumysVqAGQqahwKVcw00SjN8PeVD+9KgGKuF1XzIyG4PtLaX9
         Vlmc8X3fdV6DDhnip+sQwp7g+TD8kSyUxXSAXjSEgiae8b2gtGab/KqJJD6EaVWkGMu1
         hkBSFPPq8NO51el2QCMJCCkm1GxEcWfPNikhslB5Kvs8Dxdr82L5+JuLlFJF3k1YRlM6
         niMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471206; x=1778076006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXYxfb1OnKvjy9v+vQDtCcuNHO3JiDi1MdrPDxdzPQ4=;
        b=jc1slz/tSTdPDNVbO4TweHqu+8JaCliJS626Rqe8epAHVH0WfO+zxwalPFHNuuCZvn
         trcdk9tOtTMasq18i+5zOdv0bvYkEfU3q0AXPIHbuOU7rOK30OI8hQ2twcYVbuOA4/9Y
         vYEoZX1K0qV0SQQRQMyxH1LytD68uqc2325HUStxT/n2EFtZ3lpizDeBl44L2akvsJ4V
         UQIcPMPZNtVB0iw9yPQMk3aTVABhK3U9X1h8XmXH+r/sD1082v4ZcAbHpHdLTkBf1eDg
         jeVINwiDmCGslQAFgXKySF5gjxxsPE6yVl8rbWjBNGeHyQsS2Nys25eOOJO6HcE34lXo
         w4LA==
X-Forwarded-Encrypted: i=1; AFNElJ+vQL7L+8qNmc+bEvSD1hi07Wqt8bjHdH76LEEypfX/YAj8JrC6A8JmnEImhnHz9ghfmk/EvhKIOxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZVA7RYrRsC0r2qFbQ2ObaISUB26eGfA8c7WgkZYIYb+pxrY8t
	mOsKHTNrEGDXZSUWWt0VxoAISv0qM/SDIl157fnDYFFBAFE7h0Td4Dy6
X-Gm-Gg: AeBDietk/bAQem0XK410PlQ6M0FZ9N6j0P1wX9UoSpl3rcd1v81bykDu3wPJiYahszI
	VYrdJhnrSL8nE2Sflo6AQrOSTn7PusOnorBNpj8GD0baYNriVbgrR3f/X3Mn8XJQSZZF8jjGKoT
	UFPKwSt3AxkHWQC4SqD0tPy7rphGkkmreU7iffEXfFcE7bFIy1/H5PthFU7M3faqEqxyl8DRqij
	lZf38Bt5LZ6PkOlCDMZKHquHjRTzluYyrZ2vg5zfWhViAcYL8+4l7OWst4deW2P9dCZhbu9BPig
	Ngf046iJhVAIeNtpbbETFIoKHYm2At+7ifMkhptjCu9neB84VaLHwZjN2yMlOz/5arkHkXu+Nc6
	tB2NJPTx5m7Idu8EtkIAtmSp2klg6I36ayMakHS0ow4FaA2DtLQbbcYF1To7Bkkvpp0rJvhB8NI
	idMIQN9LqKpVdLPaVwLE2/tpXClf2xo/okuDwABt6r5ZnUmfGIOK0VKxc4RvRe/f+i70Ja3BxpL
	Q==
X-Received: by 2002:a05:600c:c048:b0:48a:6268:18a9 with SMTP id 5b1f17b1804b1-48a782dd8e3mr77937175e9.13.1777471202791;
        Wed, 29 Apr 2026 07:00:02 -0700 (PDT)
Received: from ?IPV6:2a00:f502:160:68fe:a26c:adcb:8da8:2? ([2a00:f502:160:68fe:a26c:adcb:8da8:2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216eecsm5409919f8f.9.2026.04.29.07.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 07:00:02 -0700 (PDT)
Message-ID: <05df6383-5325-4f88-9638-22bc2d7a768d@gmail.com>
Date: Wed, 29 Apr 2026 17:00:00 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 07/11] clk: qcom: gcc-msm8939: mark Venus core
 GDSCs as hardware controlled
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
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
 <9kBbj8Jr-f6eqC6XfnJPf3gKQD-3WfzXgzl4KEVKhRZlW2_GftgFBsijqUgEvGcgmeFqPwtVquMmibHUMaR_sQ==@protonmail.internalid>
 <20260427-msm8939-venus-rfc-v3-7-288195bb7917@gmail.com>
 <0ee6bf23-17a3-4a7c-93d2-276e97cc3a14@kernel.org>
 <1120b76e-3c98-4f32-821f-baab667dfc38@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <1120b76e-3c98-4f32-821f-baab667dfc38@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/29/26 12:18 PM, Konrad Dybcio wrote:
> On 4/29/26 6:14 AM, Bryan O'Donoghue wrote:
>> On 27/04/2026 18:58, Erikas Bitovtas wrote:
>>> Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
>>> device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
>>> to these GDSCs to indicate that they are hardware controlled.
>>>
>>> Venus core clock cannot be enabled if Venus core GDSCs are switched off.
>>> But since they are hardware controlled, they can be switched off at
>>> any moment. Vote for the Venus core clock to enable it later when GDSCs
>>> get turned on.
>>>
>>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>>> ---
>>>   drivers/clk/qcom/gcc-msm8939.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
>>> index 45193b3d714b..420997b00ae0 100644
>>> --- a/drivers/clk/qcom/gcc-msm8939.c
>>> +++ b/drivers/clk/qcom/gcc-msm8939.c
>>> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
>>>
>>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>       .halt_reg = 0x4c02c,
>>> +    .halt_check = BRANCH_HALT_SKIP,
>>>       .clkr = {
>>>           .enable_reg = 0x4c02c,
>>>           .enable_mask = BIT(0),
>>> @@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>
>>>   static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
>>>       .halt_reg = 0x4c034,
>>> +    .halt_check = BRANCH_HALT_SKIP,
>>>       .clkr = {
>>>           .enable_reg = 0x4c034,
>>>           .enable_mask = BIT(0),
>>> @@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
>>>       .pd = {
>>>           .name = "venus_core0",
>>>       },
>>> +    .flags = HW_CTRL,
>>>       .pwrsts = PWRSTS_OFF_ON,
>>>   };
>>>
>>> @@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
>>>       .pd = {
>>>           .name = "venus_core1",
>>>       },
>>> +    .flags = HW_CTRL,
>>>       .pwrsts = PWRSTS_OFF_ON,
>>>   };
>>>
>>>
>>> -- 
>>> 2.54.0
>>>
>>
>> The downstream opts to put the GDSC under hw control, which is not the same thing as it being under hw control, its up to you to put it under hw control.
>>
>> So you might want to be more conservative especially given you have a problem getting the encoder and decoder to run simultaneously - I might try parking this patch and then see what happens.
> 
> i.e., Bryan is asking you to replace HW_CTRL with HW_CTRL_TRIGGER
> 
I tried to revert the patch and replace HW_CTRL with HW_CTRL_TRIGGER -
both result in power collapse fails.> Konrad

