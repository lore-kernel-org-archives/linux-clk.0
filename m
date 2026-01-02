Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFAB3C465
	for <linux-clk@vger.kernel.org>; Fri,  2 Jan 2026 16:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767370350; cv=none; b=NPZE/nQU3k9x64M4Yh8EqqP4K4Jrj91d8HaHDo+aVwbN8ki59hlMWQ+31Xgart+1s2MfrAe2eRevjh5t3GqBiYbfLUqRSMQGlHz4WFzd2kH476nh/IYhxUKu53swYi5Fj4LcXJBUY5TWda626Qvqsjbxq+UoNqakJj21WAtmOcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767370350; c=relaxed/simple;
	bh=A35t72+P7J33THiK0r0PtMx6yccnl/BJ0BFBu2PQDmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HE1Q0yxarEBVEEtkeu4VlpUcBzH1Shn6p4+mct15SOGG02QuxWtdCh4uULD7x1pqMYrOlZwbsx/CRVoe0r/gK3YMPrJtFUGxv43RsRRPCLPVK7GR/Kg8JIIQKCUMr7OQrREP22CK5p9LNWmqQKr2o8EwRMhvaG+XX0a6HaQGfbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lNSIr3Ov; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lNSIr3Ov"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64b5ed53d0aso17624732a12.3
        for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 08:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767370347; x=1767975147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4OI5AmB66qduMSpSiu+uV1kYYA9eceCn+bVW2THuqN8=;
        b=lNSIr3OvJOyLxhTbHP1hH1jzWimquHLmIYJn6nfiMnpzWUHQ2CDDHnNKU6RR20Gcct
         M8a+Fm51Zlj8i0OxcVH5vTIK67lydbLJYQdeRQ7Vf4ii9a4ho1i6X+KWuKcO7ub7B4io
         DDPDWkYfjtLSY0ollL5XRn0DeZ/MW3+/rXfg0O6pwnfq3loLBIn6cTxUq7cdnccNauiY
         qrphpGQG00QzaQRz5puYFVzA2TPttRPVAXYnv8BxdiIKwiZTbLCChIwmi4QWH+dZhYBP
         pxwwtUOeRD3kFZFd6/5nPO27PDh4XRj0oJr/XtH+bx1hgVuExdw2c2pAIgVTAi+1FMKx
         +gMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767370347; x=1767975147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4OI5AmB66qduMSpSiu+uV1kYYA9eceCn+bVW2THuqN8=;
        b=I00+HTWskTeh2nSKknRbrvIPJnj86ELrENS8UCEFrDX9iRRMKOcERJbF1pf4svPpQ8
         Fd0oPKe2NAS9qzCMJbvWpWulsvf3uIdgBhSD7ia+fNx8qcnCYdwmW+RS4p53jZ+FCKC4
         TA5BioHWghtM8oZcyOafQaqN5mRukXtiVDkjpU+/fTqg1GDUcYgvUNWSux9q0PrbYHQm
         XbDev1DN6iPBUVFY0LE2dK0VcCTZjul6AkiwROc0w2s3+LvNLhs2B7+LX0CE6B8i5SqU
         +MpCi52l1CVlxfbqvffa1GSDqeXnEHfSAoBOc7XCamgMaCpwWUp9rEYi0Zgv1kknH+ta
         jn4g==
X-Forwarded-Encrypted: i=1; AJvYcCXzlXXWci5FZBD3WQQH//D2ArJ/rihHrwiz7pquqTf01ZZqfZ5tmWvkp2R5Aofi4rix1FCecVZx8AI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yytra5kjhQKHDVy115V4Wi1oPxJI8vjaQXSpoboVofM7D3h1BXJ
	V/Y0a/o6AIwTWFLmNHLUGhcLCfx0z+DZBS2KWtgL/z4CNub3jTMJ6L7cXAG+6mKk3NU=
X-Gm-Gg: AY/fxX7YnM81sDZSoDRTQfuDzLtSnO2/4CDo06dzxNmf2jPgOF5RLJ2lrqDbelb9XIf
	UrgjYOtxD8fdBSJv7fBVbpgYC7BsFea5NKX7+Ctw2C0ivhEx5NcL0D0nRofwQxybXtCtDr1q7EX
	0MH3i/wCMR+ndfcZSE8mYa3csorWISY83C1cGUmwEsaMVmCHzZp/Dj+yg/zXdQwHgP/I4bokALK
	XEBC0R6e+bvpPlrRCaf67JrHvp/8krqwN2mQyjP9oSJRmKd5T35kQZF+R7G0Xl3/twXXlyNUAAL
	w6lBkje1QGambZ/Fe0vSeDfQMUV63hHyZQ6XyFrbS9klYX5Z80AVtDXRSzw56rBggFQgfIDwskL
	sbBahMeMlZPoAurpkQ9PZLM4Cw82f2LtkaRjW3Kqr+DQIYWhORwToMDqeFsi41UWhiJXoXQMQuh
	MyLbpJBVc/sDx/uGluh64S40TjUZI+kkGU1MY6uVjfqUFDBbRDS2OgQPgzTRV04eNGxpvVO17n5
	xFL1+Qi4OI1MSU54p6NH7X3lwRiYe0Hr0RxwlMKm3mqGRfG4XyEmW4Y5zmtH0GE/XoCmPm0+d03
	Sw==
X-Google-Smtp-Source: AGHT+IESWMc1pykl64PwMUjGSDroNt0/f6UpLiv1+jR6Fh6mcw8KuhQ43hJt/pKDo1Lzvm3WbQAlGw==
X-Received: by 2002:a05:6402:d08:b0:647:a636:76c with SMTP id 4fb4d7f45d1cf-64b8ef1840fmr36319065a12.31.1767370347030;
        Fri, 02 Jan 2026 08:12:27 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159ac90sm44003079a12.29.2026.01.02.08.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 08:12:25 -0800 (PST)
Message-ID: <df5e0f93-4594-428f-95ed-42fc3465eef6@linaro.org>
Date: Fri, 2 Jan 2026 16:12:21 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski
 <brgl@kernel.org>, Shazad Hussain <quic_shazhuss@quicinc.com>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 Melody Olvera <quic_molvera@quicinc.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rajendra Nayak <quic_rjendra@quicinc.com>,
 manivannan.sadhasivam@oss.qualcomm.com, stable@vger.kernel.org
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
 <a42f963f-a869-4789-a353-e574ba22eca8@oss.qualcomm.com>
 <edca97aa-429e-4a6b-95a0-2a6dfe510ef2@oss.qualcomm.com>
 <500313f1-51fd-450e-877e-e4626b7652bc@oss.qualcomm.com>
 <4d61e8b3-0d40-4b78-9f40-a68b05284a3d@oss.qualcomm.com>
 <e917e98a-4ff3-45b8-87a0-fe0d6823ac2e@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e917e98a-4ff3-45b8-87a0-fe0d6823ac2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/01/2026 13:57, Konrad Dybcio wrote:
> On 1/2/26 2:19 PM, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 1/2/2026 5:09 PM, Konrad Dybcio wrote:
>>> On 1/2/26 12:36 PM, Krishna Chaitanya Chundru wrote:
>>>>
>>>> On 1/2/2026 5:04 PM, Konrad Dybcio wrote:
>>>>> On 1/2/26 10:43 AM, Krishna Chaitanya Chundru wrote:
>>>>>> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
>>>>>> can happen during scenarios such as system suspend and breaks the resume
>>>>>> of PCIe controllers from suspend.
>>>>> Isn't turning the GDSCs off what we want though? At least during system
>>>>> suspend?
>>>> If we are keeping link in D3cold it makes sense, but currently we are not keeping in D3cold
>>>> so we don't expect them to get off.
>>> Since we seem to be tackling that in parallel, it seems to make sense
>>> that adding a mechanism to let the PCIe driver select "on" vs "ret" vs
>>> "off" could be useful for us
>> At least I am not aware of such API where we can tell genpd not to turn off gdsc
>> at runtime if we are keeping the device in D3cold state.
>> But anyway the PCIe gdsc supports Retention, in that case adding this flag here makes
>> more sense as it represents HW.
>> sm8450,sm8650 also had similar problem which are fixed by mani[1].
> 
> Perhaps I should ask for a clarification - is retention superior to
> powering the GDSC off? Does it have any power costs?

In retention you'd expect any/all registers to remain powered, such that 
configuration changes persist through your own power state.

So any PLL or other clock marked as critical would require retention as 
would any other clock register setting you setup in probe() initially.

TBH should probably have retention on all of the clocks as a default..


>>> FWIW I recall I could turn off the GDSCs on at least makena with the old
>>> suspend patches and the controllers would come back to life afterwards
>> In the suspend patches, we are keeping link in D3cold, so turning off gdsc will not have any effect.
> 
> What do you mean by it won't have any effect?
> 
>> But if some reason we skipped D3cold like in S2idle case then gdsc should not be off, in that case
>> in resume PCIe link will be broken.
> 
> Right, obviously
> 
> Konrad

