Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5501A9FAB
	for <linux-clk@vger.kernel.org>; Sat, 14 Mar 2026 00:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773447254; cv=none; b=HA7TK4tfUCfaEmyEUPktUTdJ2vzI3US5eVJkXJq/MouiKyDnOxPnd7uf4xvu6C5cMewJG9ZcqEMV23HWE0tTv4v4eAHfpXZlL1g9LsIXLRDI5lbn2UNQAltgGrUuNpIQOEPxx5dPVAFRMYOr4okMI/MFikaq9ha2XvmmB4ud0Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773447254; c=relaxed/simple;
	bh=SWQfqoxAVSVc3MG4BIFFiad+Ar7y2VBJ2CgV3JDrNWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QajeSue/+ljfsKf+LV1dEYY2S6CNsop4LvIBC6znoImu8Fj2129B4L6loWazLd25ka060cLkbwygQ2oSDrUwY3CwdJR9ehZNamYB/VTM35/MIW6ib/a2kR9vPhLhqXhb/cPQFwcndSFYFfUJAqgLBgzRXXgSivWE4JnljpkcF20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=f7Twkly7; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="f7Twkly7"
Message-ID: <31c68360-97a6-4e23-9d5f-f141abf0790c@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773447248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ryMQNhmD2GmNjWhcynx8JjeJbIW9dzR8WFdHL4mMvTE=;
	b=f7Twkly7NxETunS7DTleTLCIiq4Iy6wXgQT+rHSZwqD0EcxyjrfJ4uW6glQaUU6ujjMCxd
	/Ug3qSVkPFmA+avY8DQkbeDNdW4HMhxXXuJnLNvgxrhjNuMqCYXgsdGAlvHOzH834chVfg
	juDQiGPIU+ipLxWSmujt1Kyq7kih5vIhlgJdl6ok8lul4FpkqVugpRl0D5HmanQz8yGAP6
	dyoEqw4ZQ2FPYW7mZRetLQpWFxDfv06qnIpwyRyU7lfUV54GAcZSnmpYYr3bV/I9QGmGL7
	XU+gSubhpnuXwI6250/jbuSgazFaRqot1JkuuYCvK2w8PvqJIFQLqU45E9fJ7A==
Date: Fri, 13 Mar 2026 21:13:53 -0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 10/11] clk: qcom: camcc-sc8180x: Add missing HW_CTRL
 GDSC flag
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Johan Hovold <johan+linaro@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Dmitry Baryshkov
 <lumag@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-11-val@packett.cool>
 <36da7262-0dda-4bb1-b9f2-abd77ef83730@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <36da7262-0dda-4bb1-b9f2-abd77ef83730@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 3/13/26 7:53 AM, Konrad Dybcio wrote:
> On 3/12/26 12:12 PM, Val Packett wrote:
>> In all other Qualcomm SoC camcc drivers, the BPS and IPE GDSCs use the
>> HW_CTRL flag, but it was missing on SC8180X.
>>
>> Fix by setting it on all applicable GDSC entries.
>>
>> Fixes: 691f3413baa4 ("clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver")
>> Signed-off-by: Val Packett <val@packett.cool>
>> ---
>>   drivers/clk/qcom/camcc-sc8180x.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
>> index cd4c40a81c28..67b2055bd212 100644
>> --- a/drivers/clk/qcom/camcc-sc8180x.c
>> +++ b/drivers/clk/qcom/camcc-sc8180x.c
>> @@ -2555,7 +2555,7 @@ static struct gdsc bps_gdsc = {
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>>   	.parent = &titan_top_gdsc.pd,
>> -	.flags = POLL_CFG_GDSCR,
>> +	.flags = HW_CTRL | POLL_CFG_GDSCR,
> FWIW downstream seems to use HW_MODE at runtime and SW_MODE+collapse on
> suspend for both BPS and IPE, so perhaps HW_CTRL_TRIGGER (and a patch to
> the driver) would be better suited

Hmm what exactly would that "patch to the driver" be? Not sure I 
understood that part…

~val

