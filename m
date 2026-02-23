Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC0486337
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 13:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771852872; cv=none; b=qE3JNhuuXOfHpB9NIhIUZVwkvL5KVWI+rn7kmE3eGYrHh9FIlUgpwGaWaZkBuoBnBEBOcXpPtuGUBKxrRCdDFkF7kzc483kWdd1bYfb6bSTQrmCRxiON1orwZ0jL4a5MUxJl7FqiXOuSSoHR2+7JuyEmStDCmIKeqrlzjorSLRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771852872; c=relaxed/simple;
	bh=9OTkrw80oktO22w0uVEhhcTou6BTPF/sj5rutEaSw+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sHh40gs1z0ebYJsgRnMtqYSAJPyl6Nkc6w8RmTLyNkptnx0xWCdxCYs7J6nz+B4E4EhCFh2QXRCi4UM9Pkbq2upDIbQAlwdCZF6Cq1IyM7aCfZiki2s5NDLJJQNS/ngfo/GVpTYNICMHogVW0MMgQcTle4QhRg2OnzR8Li5w01M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQ9fJ9Ex; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yrz2nV32; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQ9fJ9Ex";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yrz2nV32"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYclU322185
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 13:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cUs2dNQrFhhZKJ8x0qt0CveP16jH+B+EkOSIm51sjNQ=; b=XQ9fJ9ExUFNOgDe8
	1qsTH4MeyvjroRoZZCmD24bSUnAmYeI2zhWSltpNZvSqErnu17QbTU+s2ig1GKpD
	D+sCN5INLtvH7hJkVA4PzheuGZpSTcXZPCafQvOrbRh6O/gYC8D1THPlLj5VDiIW
	8Y0J257UyDhfEG6ggoVYpMn/04nO2TGV0fryyrpD8NpAvTdUyJ6IsQy40zq7+IXR
	BCq60yDH2FnEMinhLNEvM2Dhc7Y9YQAUhCiF5VYJcQLGukni6OPcVvtw1k8LtW6W
	uLmLMWPy+CyRJb1wNRIF1kHwDpWCP7rQXUjtJlQQxdGUMhuEEuvq0DW8NV21iwSC
	WJsXpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y0dt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 13:21:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb38346fdbso488889885a.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 05:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771852868; x=1772457668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cUs2dNQrFhhZKJ8x0qt0CveP16jH+B+EkOSIm51sjNQ=;
        b=Yrz2nV32CYmrglJFcPfH55DX0gKzl4Ms/jMIaom+ON3+mX/KCt541vtUdmD0CnHsYj
         FzWlz0HVmIkABUfbuv+TQ1NrIFMTNgFonK5w/7hMNVRjCdP98a7ZYWJDPErxfvuKvit9
         lWlcsE4ym0y04/QUfXMjKk3t5nsdThPpn5WObi5+XCvPoERQFtYo0K0SKIIYgSAhVi0Y
         uobzqEfTLTmsTzOiFEpWIl5n9fAMYwWQmqh0idSmaTIDpN1WmrM5s8lX2IVLnQw1Tm2N
         QHdLOEgsUIHmufa3Op7xsTdZ0MiGU9cYz89J6a/o6iIbXE1mnlwTqyruFm3/5xcjEnL8
         KCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771852868; x=1772457668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUs2dNQrFhhZKJ8x0qt0CveP16jH+B+EkOSIm51sjNQ=;
        b=jmFxj1NldOTrj6BWAvwvYZU+OpP3cn+StkuarAksOOlPFaaz9LICqBhggBJz50n7zx
         +yjWDFLZLlp1m9oaj+uyrfu4Q4LfFTx6PPdOSxXVO7NCP1mDRLbXnCzO2Yxcw2sxuNhT
         RUUp6rcI0566HLQFlHiv3uYMFXv/rOMEQf0AFOb17ADmbCe4xuJJxxLhfEh4jsIYbvpg
         tGQyH1n3/uhi7/9eQ0bfwfSpjnRm3nbmhWPv2ymJOobmtnA06ptgUNYoNbYUc1uU/Sno
         GPEI1Z9Bf1mML5CvwS+QQE5JgRQrwZDa2Fm6ePOLScvnzmsY0IWJ6vPZOjtv4VJQM/0m
         NZBw==
X-Forwarded-Encrypted: i=1; AJvYcCWlNxsQyaF18HPqOLaFYt39mJZYFELUnrbBlouiOJ+54HesoV6qFdZE9fiV57VPE5cBNKk5KX+ttsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbmM/u6uvBk1xMHuwmTbBusZJvtXn/kvorYJs4+do33d6nO9N9
	eBALmLPlmLQr0Nx+ZuXIrAzmUGb0adfAFqowKv2U02d0BgL8SUqD64RyAlecM6IuDY8rDkObwO2
	o69VTCNoHeUSCgDgJqlHt95LW5j1/cApS2/InZ+Oa9n7TCKLMe8jhrM0rs6w6qSo=
X-Gm-Gg: AZuq6aI0ctOIRwvMxwKjf0ZpHhB1+HUP+Mzp0nLwIirUlhbnMfIetRMhnV7XKUH9Pau
	E8+U7wNzTJQ4Z8T6s9ljZVOb7sLZedY1pYVxZOFlfDMQnhtoxoMYOBvfld62JLPNu6yjZQlyiMS
	TKS5f3jgGD7ldaxFvX36Q6ZbMUFQbBfyqBKaNSryrPmtjRNixWhFx9TRoIV/IYCsp68+o9l7xol
	TdbxDHrziFkJkjbJC/J6EY3bWXS8W3hCYKLzqi2OZlxlaPnV12h+5y6xj7GIbZe7gr5v3KerUaE
	KuOQ3HU9Mg5zDcYYK80aHUEikcn0jaHZyWhhCy3h2t8nIhBudTKDILJaQF4vnv2ogP1FuMDgZ/5
	8n/rinIOuyh/GAFo/ksILatGQtwNCh5DL1NylwtLEGCbr5IFczr5WHUUhyNvimV2I11jpke0BB0
	XEVTs=
X-Received: by 2002:a05:620a:4544:b0:8cb:3df5:4b70 with SMTP id af79cd13be357-8cb8ca1a960mr841648585a.2.1771852868205;
        Mon, 23 Feb 2026 05:21:08 -0800 (PST)
X-Received: by 2002:a05:620a:4544:b0:8cb:3df5:4b70 with SMTP id af79cd13be357-8cb8ca1a960mr841644585a.2.1771852867633;
        Mon, 23 Feb 2026 05:21:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9b5a2bsm2628993a12.15.2026.02.23.05.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 05:21:06 -0800 (PST)
Message-ID: <8d658491-bc1c-410a-97f5-bde1a00764b2@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:21:03 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com>
 <20260220-gpucc_sm8750_v2-v3-3-6c5408564c3c@oss.qualcomm.com>
 <7dbc0e99-cffb-403a-be7a-27d1b47712fd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7dbc0e99-cffb-403a-be7a-27d1b47712fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNCBTYWx0ZWRfX87nFWAiE6rON
 Tjr3CIlgPy83c99TfUnOqf6Lo9furPTGXTH2K8H17tZdshglXwTHL9AM6bmD0jHFspkEijIysY5
 RPwRivlYboF41MczLjAzedn3nwitAqYnJM69sVUKIKnT4bKuqIdOBJpUPtNZWd49pRKoiXtIGcF
 lVrdaEpWFbfYCQSvhh1MsvSMgnpDn9ZkHcScomirUQuZm/twp57LS1fYULmYG8hEO3jdhKH7CmC
 EO9QbFCy9wG0wTvwXBPJdde5F/B2zXtzB6sAn+0YJeJwzGt8/3N9qR+L7OKFWaSlB4HHHfcXCpR
 KgN8yVu2mtf9BMDlxdsfR8S5yq0BFCYzhIi6DuuGfIXKa2GYZeGasr2i3QcJcvvkfCIE9J73sik
 cbIpvdlCj3os+ZyV3MWsVvNYeTWuUmgHHFw37brO9NzwRh20B8Rk58qYA7nJtfqbLrzkig4tKAJ
 dQaMO4+jBFiaMgTQn4Q==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c5444 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6F_KMvjuWJjJSnLB6NgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Dm_cBcXv2o98uQHKYRmFb4nvjHVNLcjl
X-Proofpoint-ORIG-GUID: Dm_cBcXv2o98uQHKYRmFb4nvjHVNLcjl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230114

On 2/21/26 7:22 PM, Akhil P Oommen wrote:
> On 2/20/2026 11:24 AM, Taniya Das wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
>> is simply a separate block housing the GX GDSC) nodes, required to
>> power up the graphics-related hardware.
>>
>> Make use of it by enabling the associated IOMMU as well. The GPU itself
>> needs some more work and will be enabled later.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 64 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 64 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index f56b1f889b857a28859910f5c4465c8ce3473b00..0cc931d0bc96e9563ce4e7989ecd4ba50bd424f8 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -4,7 +4,9 @@
>>   */
>>  
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>> +#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
>>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>> +#include <dt-bindings/clock/qcom,sm8750-gpucc.h>
>>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>>  #include <dt-bindings/clock/qcom,sm8750-videocc.h>
>>  #include <dt-bindings/dma/qcom-gpi.h>
>> @@ -3001,6 +3003,30 @@ videocc: clock-controller@aaf0000 {
>>  			#power-domain-cells = <1>;
>>  		};
>>  
>> +		gxclkctl: clock-controller@3d64000 {
>> +			compatible = "qcom,sm8750-gxclkctl";
>> +			reg = <0x0 0x03d64000 0x0 0x6000>;
>> +
>> +			power-domains = <&rpmhpd RPMHPD_GFX>,
>> +					<&rpmhpd RPMHPD_GMXC>,
>> +					<&gpucc GPU_CC_CX_GDSC>;
>> +
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> +		gpucc: clock-controller@3d90000 {
>> +			compatible = "qcom,sm8750-gpucc";
>> +			reg = <0x0 0x03d90000 0x0 0x9800>;
>> +
>> +			clocks = <&bi_tcxo_div2>,
>> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
>> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
>> +
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
> 
> On Pakala and newer GPUs, we need to scale GMU (which is connected to
> the CX GDSC) freq. Is this DT description sufficient to allow scaling of
> GMU OPP?

No, certainly not.

I see that GPU_CC on this one is exclusively powered by VDD_CX, with
some MXA backing, so the natural course of action would be to add a
RPMHPD_CX power-domains handle here. Then, voting on the CX_GDSC will
propagate the performance state to RPMHPD_CX.

Taniya, I see there's also some MXA backing. Do we need to scale it,
or is "just ON" fine here?

Konrad
