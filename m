Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AA02D8771
	for <linux-clk@vger.kernel.org>; Wed,  3 Sep 2025 06:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756882122; cv=none; b=NrycGsZSNKKlOSnFoTXMcPeJbw/7MlBF2SWK2YJjnxUdcrDkyLl9n/qOhkzby0t0o5Hji2VTqF1/0vIc//GMZp5pGdPinUBq7T6axNHetvkG82VFW4g7CsZjdYRe3Re6m8/+DHLbn04gebcY/+eoylrab4s++iG6eE0xKTKn63U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756882122; c=relaxed/simple;
	bh=QNETejy8uanB4DbCbMajxL7kyf3pgVxS5zjvtDEcMvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNELX9pdBzlAGvZdtCMrgUEVcFjY9GbbRUP330vgVmRsVLW7IJ7j0kzVY6JRkqvO50Jsm9e2BqLGGR034/jCTufg5jBPIpPmTEoncdA02Nebz89MQmfAr31HVh+JEoDqmHlI7ejIJ8eVpwf6qZCPAXuZhLiz8EupVrvm3o3fuxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rf+Di0b1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rf+Di0b1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832UYul024031
	for <linux-clk@vger.kernel.org>; Wed, 3 Sep 2025 06:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UplUJq8ROfhu7BqKPo/OWnnkm2YY2UUYgpYkcYVmLtU=; b=Rf+Di0b1XaFbFdif
	icQQ5eiVbQ5UD0xJs4i8FBpNgSfBqRE4+QzYso80duVSjDgVT/v6ySUcpAcD5Cc8
	iplX8bdJZufXXPaQlMXpjeYB3JqByU8Qyl0dgARBYYM0mdRZxJ9joSW1bZnNkEAy
	4qPTeC/lYwe+xTEJkbVOp0zBJGE7lbmqWpTI+nQfbBzvOg2D/zKNuidPudSjjmte
	heoP7/3NWvFDNwtAetTlW5L2HIk63PDn1Fp2KhWtFCCjDKSIDvcKYLYB7FvwfSx1
	kBdAyFKPnBtzh3O6pRKScijx45wDgKuH0qievbO/qSK6y0Z4901Cotvyn2glEBUB
	W9T6WA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush32cum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 03 Sep 2025 06:48:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4c724d27f8so3777021a12.3
        for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 23:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756882118; x=1757486918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UplUJq8ROfhu7BqKPo/OWnnkm2YY2UUYgpYkcYVmLtU=;
        b=h8L4TskNa2oUDsNPqrxYCRrZR+IbkQHcFjdTxNI9Qgk35M33p92FWQqfr+p41qHViL
         ek9hIhfolsNCJ6t4jAi8eueM0TDrki03ozmF02PxMoVuYt7/j40px5kYXjsGgLiD81Av
         H5xl9T4WyqLnhX9jMv0HbNLJfqktD3dYxOpXZCJIBkgJQG9RfObvF4v0xDRI25i+oevL
         YvEsRwc+RvwV4VjDfKndf8U84Oue6lU0sI1jqxjdjKKyhnvQ83dEH4b9sdd3mnz7rPo3
         RL3yfwqCGu7WoE0VjTGGtNvffcClJ8vH6UrsVyv1xmzilSe+H9h7J5ig6A1Iap2S8S6V
         8uzA==
X-Forwarded-Encrypted: i=1; AJvYcCVmdu+TzcrhF7NXESWjcgSjZxWfPI2qc/8FqNAO9hfXJBbpZkIzG9ktd8Wxhxndzp4NMIv0KaZsyts=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnVJMgnQE5sWJ699XNfxltIPnOrT54vAUYJlskT/Ow15Ye9mk3
	tIQV7U/rcZK9E3Nn2Du9jRnVk2BFWQ0PJA2dTL2d0QMidoIf6DkDQYktvrMwM3SCvOF8igPFL2D
	plprE8I91LBwWrQYZwD41kDNtausP+VVaZDlRZtBE9uSy+IloWXKyAPv4xL4ANTE=
X-Gm-Gg: ASbGncsA55l5+K9e5Bzc/7yMyEIXZRgXhwFBjkPa3H1JBnUHhj4bAqJ1K8gJ7vkfdC8
	+qYvX95Awv997L6WiAQ+aJUMF4i2wVfMA52F0EiNuNU/mMbtE6ZEj+lreVsUzaGGeX2FBzd3ri0
	w0ers+PkOGsKgkYXvQ+EDor8kqPJK0sxm49crEyOAvMYBmTpsd1xiYV/Y7gXj4xrk/6M9znmzyX
	EgNrmEhPQX0eYUM6FIW9LKsW7e/6XpZZtUSM85TqhWACXeY0xY5HjSCbzUk//qp0+hAwkzOXcfc
	WSmz1rofsV19zuq8z6L64ielw7vy4d5+6eHuIypuqDlRcyfhqfzfNcMSUqEdk0kgwXs6
X-Received: by 2002:a05:6a20:431e:b0:246:291:f62f with SMTP id adf61e73a8af0-2460291faf9mr5149352637.49.1756882118056;
        Tue, 02 Sep 2025 23:48:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIxL5LJvIslpakw4KnTomsCuBiD9Sug0ns2e208gVccm3vzwjO7n8Sz0L59v8OSUoEfyQkww==
X-Received: by 2002:a05:6a20:431e:b0:246:291:f62f with SMTP id adf61e73a8af0-2460291faf9mr5149314637.49.1756882117530;
        Tue, 02 Sep 2025 23:48:37 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.24.116])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd092de08sm13657435a12.22.2025.09.02.23.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 23:48:37 -0700 (PDT)
Message-ID: <0ec3b848-3fb0-4522-af1a-159fd7dc5dd4@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 12:18:31 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: qcom: branch: Extend invert logic for branch2
 mem clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
 <20250829-sm8750-videocc-v2-v2-1-4517a5300e41@oss.qualcomm.com>
 <ecnfaig4uqlgvvhcadh6pofe7vmlx274gtaabmop6w4gggtjkw@ry3pudcp3hx4>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <ecnfaig4uqlgvvhcadh6pofe7vmlx274gtaabmop6w4gggtjkw@ry3pudcp3hx4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfXzcV+OEHatO2U
 W2eBW9GU1o1zmC1PavBVSI4WgV5FKy20MqvD7VTlFswPoAPrBahoYIkJ8JnFcDSh3J/Se4PIE5h
 Nt8gP3XRPcaByRGSNImtCi+yJUSlXHKtcWnf7XcA9Fdo7MmoVOuu7Dr9/1PMzoe+N9kG7BMkWyp
 DlOsnu1DtswtJeIrPbtPpzdrhK3hgsBdX0l4+doCe1W5Y13xkYvyDxpJ2nSeGqPaZEq4muRUJ0R
 6I9j83eiWU544LfxmJ2JLiXRc/LirUryvYo8WLDA6Ttg3LhIUL87UVFwP0BeRaqA3HqOqGYgXin
 IeSnqYdUvFN7uzA5aROWAmG4Yab+wfYGYQnPcxPEzN6BNtAJsRHjysIE4fiNBWcWXqW3AGdIRra
 jhpQ7/K/
X-Proofpoint-ORIG-GUID: KTvol85pj_xcPBr5tZ1z4NpGz-FbK3eU
X-Proofpoint-GUID: KTvol85pj_xcPBr5tZ1z4NpGz-FbK3eU
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b7e4c7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=PZ7RaY4/qyhr7oYTfvPPhg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=04NQbcWpfGPlwerc6EQA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032



On 8/30/2025 5:47 AM, Dmitry Baryshkov wrote:
> On Fri, Aug 29, 2025 at 03:45:17PM +0530, Taniya Das wrote:
>> Some clock branches require inverted logic for memory gating, where
>> disabling the memory involves setting a bit and enabling it involves
>> clearing the same bit. This behavior differs from the standard approach
>> memory branch clocks ops where enabling typically sets the bit.
>>
>> Introducing the mem_enable_invert to allow conditional handling of
>> these sequences of the inverted control logic for memory operations
>> required on those memory clock branches.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/clk-branch.c | 14 +++++++++++---
>>  drivers/clk/qcom/clk-branch.h |  4 ++++
>>  2 files changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
>> index 0f10090d4ae681babbdbbb1b6c68ffe77af7a784..90da1c94b4736f65c87aec92303d511c4aa9a173 100644
>> --- a/drivers/clk/qcom/clk-branch.c
>> +++ b/drivers/clk/qcom/clk-branch.c
>> @@ -142,8 +142,12 @@ static int clk_branch2_mem_enable(struct clk_hw *hw)
>>  	u32 val;
>>  	int ret;
>>  
>> -	regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
>> -			   mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
>> +	if (mem_br->mem_enable_invert)
>> +		regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
>> +				  mem_br->mem_enable_mask, 0);
>> +	else
>> +		regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
>> +				  mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
> 
> Please check that your lines are properly indented.
> 

Sorry, sure will fix in the next patch.

>>  
>>  	ret = regmap_read_poll_timeout(branch.clkr.regmap, mem_br->mem_ack_reg,
>>  				       val, val & mem_br->mem_enable_ack_mask, 0, 200);
>> @@ -159,7 +163,11 @@ static void clk_branch2_mem_disable(struct clk_hw *hw)
>>  {
>>  	struct clk_mem_branch *mem_br = to_clk_mem_branch(hw);
>>  
>> -	regmap_update_bits(mem_br->branch.clkr.regmap, mem_br->mem_enable_reg,
>> +	if (mem_br->mem_enable_invert)
>> +		regmap_update_bits(mem_br->branch.clkr.regmap, mem_br->mem_enable_reg,
>> +			   mem_br->mem_enable_mask, mem_br->mem_enable_mask);
> 
> This creates assymmetry. The drivers uses mem_enable_mask in one case
> and mem_enable_ack_mask in another.

Will try to use the common mask.

> 
>> +	else
>> +		regmap_update_bits(mem_br->branch.clkr.regmap, mem_br->mem_enable_reg,
>>  			   mem_br->mem_enable_ack_mask, 0);
> 
> And here.
> 

Will fix here too.

>>  
>>  	return clk_branch2_disable(hw);
>> diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
>> index 292756435f53648640717734af198442a315272e..6bc2ba2b5350554005b7f0c84f933580b7582fc7 100644
>> --- a/drivers/clk/qcom/clk-branch.h
>> +++ b/drivers/clk/qcom/clk-branch.h
>> @@ -44,6 +44,8 @@ struct clk_branch {
>>   * @mem_enable_reg: branch clock memory gating register
>>   * @mem_ack_reg: branch clock memory ack register
>>   * @mem_enable_ack_mask: branch clock memory enable and ack field in @mem_ack_reg
>> + * @mem_enable_mask: branch clock memory enable mask
>> + * @mem_enable_invert: branch clock memory enable and disable has invert logic
>>   * @branch: branch clock gating handle
>>   *
>>   * Clock which can gate its memories.
>> @@ -52,6 +54,8 @@ struct clk_mem_branch {
>>  	u32	mem_enable_reg;
>>  	u32	mem_ack_reg;
>>  	u32	mem_enable_ack_mask;
>> +	u32	mem_enable_mask;
>> +	bool	mem_enable_invert;
>>  	struct clk_branch branch;
>>  };
>>  
>>
>> -- 
>> 2.34.1
>>
> 

-- 
Thanks,
Taniya Das

