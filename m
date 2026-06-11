Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364DE3D5241
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175204; cv=none; b=LpbgbQWhpQrppFp6Gb272r5sP/P6Lk+So66lJG7suXvAxvgQoaOaDZ6diIBW5dCI19JNeIpVXD3CbUsjPVFnhfY3EtsrN5/umJ9IzJs5o7KKCQyy7YVxN64RHgALco4Nuv0+dMUS2zgoXnSuTUaS8RhCKpHp0t5rS0gJmBsl0e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175204; c=relaxed/simple;
	bh=BJDKUiivYZYWopkDeJb+zwRxy3QE3nD0PUSgn8cPFqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hKLvOdqkdjj1j4eu7iRMrNm7MUNccgQ1PWCxupdWcv+fWuvWnRc8kaLX1MEhDoC91B4OSK6CYttgq8EWNfYgDtVE5WAe+t+14jX98Y4si+4bFA9upWshPmsZTt+pdMMjyLfFbMr6yvD7o2iBFhhDwMGXJ44sGqJVboKFoYWP090=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tez7sVvj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hpWd25uQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tez7sVvj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hpWd25uQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA0uQ0304010
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 10:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5H/Mo3pv6k4BUmxPdQoFJDY6CLXDilJ24ACCV/rNsgg=; b=Tez7sVvjXKMJM597
	h/kSafLPdTUaO1+veECvcjPcM1sBbSbD8KDbzODU+DjHuZKRkVA+NlWL+AzA40dZ
	jvHF/LYX7AfASoqj8R1xtI2G33Z2FC6lRZmK3N6u8hHKZIjIbtaBj9PFpOJPU2Hz
	BxP/1uUUC9UHdpEOZU9dVR1vD1UBEiW2TXE6xNdEoyN1NU3IZji7qNg5eMazBvSA
	RRkK2BfWUnD6HQXBXC/bpp98G7zK6smAVmPV2Fu4fPlyfUL7AGoHKI1FzYSmWH56
	ARi/aEyArsHIaMD8YN3JiqFr89AuCcUURt2wPB+OO/m0DzwwFo7eaUhxETRAB6ua
	tHiuSg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5gav4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 10:53:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d98b76d12so5538704a91.2
        for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 03:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781175201; x=1781780001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5H/Mo3pv6k4BUmxPdQoFJDY6CLXDilJ24ACCV/rNsgg=;
        b=hpWd25uQ6EPUSiXdQMn6i8LQSD5yP7Z5EzfpLozq5KDgFP8maf06wzgx0qlvansYOt
         e6vuWNUHXzNwvRZqbCCO5C62cNO5lR//nEtD1c8sO/TppniiO9EthllXCgdABzVDf5j/
         L5QZRKls8cXoSwivcl4aKkFNKER/3pWdy1kQ03jVA/OljpEiR7rnkideicHHZWw5eTDH
         FcAnDm28XgXEgHTqhQ/INu48tS3FpmKbEtsDJT07sR9gP4CI6rmhlHb0OoLTIUgGbWB0
         5Uz9Ds5X5yA6meLwh9DbXWaw/Hi5baSO5VHx1SJ0jxxw9hjSDeTwrwOAWzd/guYUiIQ9
         IVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781175201; x=1781780001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5H/Mo3pv6k4BUmxPdQoFJDY6CLXDilJ24ACCV/rNsgg=;
        b=fFRfn4NR8i+0l2VfHrFYwKHrq6irXCAiHb2qU18qO/tHZZe7XdqrJ5PXHgu4PqzZPe
         bH1AOOXwhJ04TlmfLLDjRUI1gq2OE4jfa/HOcmEC+cTfOkWbgfLYgGzBxLj+/rG4TemP
         mYeMRdtTknEmtnofbmDMprtIaHA2MIbjRALoewWDLS4Ej+kuA3ystgILM6THp7UDZMgp
         UR7Fgf9gdt1tDXI2kXr55DtXheF0p5ydFXJBlKHlEubzU+FaKOV/WcHElO5gDiRFAL0k
         kkpGTDQ/3OsUngh/UEM22s24SXwN1ZcAs/5x/Ey7HMEw2UL3HnM9pFbeC8J04PuYBvdu
         nFRA==
X-Forwarded-Encrypted: i=1; AFNElJ+dH+z0tg32GVvSs1oYoSM51j4/dMUas6F4+BBiB+xHHOtHiatef1aHXubnusbo1h7s249Ef/Ltq70=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGfaW4n408r7bDGEB43H1cC/U9YvCIWewu5O0QZ37o6eenw0ce
	FPlxd+J++V5Dk9aXJBL8cJFrnEpcMjMLbcmo8Sgyl6aYTMkIGmMXNpPp33kdx3x3E+c07xQv899
	vwaEFFJzSHQx66UoKpLcMiyjvcXAzg3z83flk5M+jRNv444iChkvxwaF6VUism70=
X-Gm-Gg: Acq92OHcscBQf3VCpwoF5iubpBTBwwKuuCyYmh9Ccr9QwhWYKpAlAbbG4jJAZCpKq5N
	s3UcWSccjP04n7woTFxPYezocprZvFB1ZP3G2a5I3mFduanL5Q/XAGY5ewuKS2s33rP3zQXYhHH
	kshfdj4sZMjLVIhcXbfQ4HdyQ5xjdyDgqoT0PxDBn2iP+b60raUnmQ8XYxNqgORAgz1o0fyWFlN
	mgs/oeAly8M/1jw7VVdHGjmT6fO/RMnUsQV55YaVkw9Ht5raIbLqcCBv7YaRMvht0ovORLIBDQR
	eLtqkYWtacBHAntYxYgK573pN3zM8oE6w4uyWGxjYAM69bWSb8sb50nbCmIvWDar1hZAUNc5/8t
	PaSvijgtsSdvbq5a74aSfvY+RZJA90cc6SKLfVUbtN0SHWdlG6lg3RV9VXkU=
X-Received: by 2002:a17:90b:4d84:b0:367:b819:2214 with SMTP id 98e67ed59e1d1-377a4ab6f54mr2587768a91.13.1781175200941;
        Thu, 11 Jun 2026 03:53:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4d84:b0:367:b819:2214 with SMTP id 98e67ed59e1d1-377a4ab6f54mr2587743a91.13.1781175200493;
        Thu, 11 Jun 2026 03:53:20 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843383197e5sm1663475b3a.52.2026.06.11.03.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:53:20 -0700 (PDT)
Message-ID: <31525025-333e-4845-9dfa-df68a3df3752@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 16:22:35 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
 <b86e9f5f-a7ec-489e-829e-6e07c62841a3@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <b86e9f5f-a7ec-489e-829e-6e07c62841a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwOSBTYWx0ZWRfX6sNwqsP+POPw
 Ovtp91TlY0iKXcfLwSQ6sZZAcSdzKerzy9JfWpRJMeJPNx15gHj6zm9Rf+fU9/IPbIISonPjL1X
 4pN7DjAQ/OgGZ0wstnUL1lnyj1TfIZcUZjafRxVAQgCf2PRH2xT7GxVtW1JWMORu1CkWbEZDWGB
 CAggIP3E45SNLvXOuCY4GdtkPdL3Wb9cPuCtWJak7jdduoDLCBIyu7w34JJp7Wfi8g9xjcK33XK
 mXPI9U3OgoG5Ocgw131Fs4ITgUXlkrcD5JVvaadgraBf78nz+VbiY1knRPo0dTrlXFRYFvanf+T
 L+2fnKEDlEnylNVydLd5Or6rHgSgIZHTqmjz7TN2YCcROVaQDG/6z3s1qBo08SdzWvLLL15OVyL
 19zAsoGMcuuWsnQ6SPx4p964kDVrHlD+5u3Dc5ZbPoMZX6j8wC+PSVu0vZFXW07zUIFQ4V9dHwO
 Bp6p715z7ITY8hYoAFA==
X-Proofpoint-ORIG-GUID: FiRioq34iGy2DAwlbU7QiS7sF7_Xm6jJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwOSBTYWx0ZWRfX37o0VRyxKGVD
 trh0I7cRe9GHabrgNl9RZV8xDKFzn3oWUJOD6Of/csz1Sn3fQVogphyopMWmxX6jalYnRUu0ROy
 unGiy9Fp8SLpnv6LUXQtRpr4tAklmVc=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2a93a2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XXr5AoNkCxhS8z1Gjs4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: FiRioq34iGy2DAwlbU7QiS7sF7_Xm6jJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110109



On 11-06-2026 03:10 pm, Konrad Dybcio wrote:
> On 6/8/26 2:21 PM, Imran Shaik wrote:
>> Add support for missing RF_CLK1/RF_CLK2 clocks on Qualcomm Agatti (QCM2290)
>> SoC.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
>> index 103db984a40b950bd33fba668a292be46af6326e..0b624ed4715c75042b92ec49c073b281533cace4 100644
>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>> @@ -495,6 +495,7 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk2, 5, 19200000);
>>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk3, 6, 19200000);
>>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(ln_bb_clk, 8, 19200000);
>>   
>> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk2, 5, 38400000);
>>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk3, 6, 38400000);
>>   
>>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(cxo_d0, 1, 19200000);
>> @@ -1262,6 +1263,10 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>>   	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
>>   	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
>>   	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
>> +	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
>> +	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
> 
> Is RF_CLK1 19.2 MHz (with the other RFCLKs being 38.4) on purpose?
> 

Yes Konrad, as per the hardware connectivity, RF_CLK1 runs at 19.2 MHz, 
while the other RF clocks operate at 38.4 MHz.

Thanks,
Imran
