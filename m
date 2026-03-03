Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B519529994B
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 05:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772515757; cv=none; b=MlRBDn1vLBUTH2gMLU3RNIO0fobWZh9ablaIb15SC+K3E7YZpsAme2zfYJ6YHEkXslwm1Mw4I0Ar8poyDF8Oq9fVU1ojMhifd0lkmjZ2R52K5Y4gQ72VZ/XxImLVtnpf3MnM/4kKIrGxIAnDOuCC7vtaHHZ83Or7rUKl7hmFQLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772515757; c=relaxed/simple;
	bh=kMYCg7I2kPwDeCvV2K6Cv0ureERWjK8HbaaRV0rsZy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lsPZqEo33Bj+uE/TJWMFZYpt5E1VxNs1C3xTFdEkHdx+E0o7rwZ2iV4hCVpVEghf7D+NZEsVMYEs5A/z8A6We9pl39JH7BCVMdCpEwZa5lPbc1wsZeZVB2i1DmWHtKZPjXRGiQz1tr7CM8bg+gFT12dbk7ilIWubV0zbejRXuGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMzYkBoX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aZ4tMA8w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMzYkBoX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aZ4tMA8w"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622NXQpP2048865
	for <linux-clk@vger.kernel.org>; Tue, 3 Mar 2026 05:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jVvQbdfjR71xwh/hnLqQ/BK/FfNPjqN0HqaVUrwZXiE=; b=KMzYkBoX4KA0ZlXh
	WiMFJeACYavAdvQ7/yEbey4kKhxZV1eECosd+lxuIHZNVbyxw9Ok3LBbswEULrak
	d+KyQA+PnonwNdgsw6fX2737pZ5FwjbFRnx3IxTdb3UGI7bw2VSWyVHETY2PKsT5
	rCrJKHEP+/VzNJth02qvb8jUr8/gaJv93LTy2rVugS3egZHKcv2mObEx2C4767h+
	jYkoYhQ9zxHIM4z3gCZUmyHxlL3mi+KAdj7+EOUJIDlBZs0WGlPjD/m9FleLHwjA
	CWhzFpvNB9fV4ObjtLHU53n2R3c+KyGcj/5Rer9qFvTKvWbltTzl34UMlq+LQWXj
	EzeBZg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cncmftnfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 05:29:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354490889b6so19358522a91.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 21:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772515754; x=1773120554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jVvQbdfjR71xwh/hnLqQ/BK/FfNPjqN0HqaVUrwZXiE=;
        b=aZ4tMA8wJema+0o2n70HZLRWuwb+IoP/KpIjCpKEgSI1u6PKnPOa7YPaOhztENMUcM
         D65Gbr/XLQ9wdjSayjDzrIrKaWut/8nFKSF1E8x61lKG5TGPgOyiXX91SJlh7CcLeI5m
         mYp6YaxGYOwFGVnxzCL9TD1n0tKaP1wQ3KPxpts5R2xm7NLs2gHRDCF5CS0XpnQmPZ/v
         SKe08OvS0KXLNG2d0PUDOeIZKJfthRdpfUPaOb/ZwdmnWM3DBUMZPAWFH5bhtcX+i+A8
         M/Bvn+Srnayqbm9AGNEMBqrHtuM7JViY5X0V255Nw3v+udcB55I16HeyyxD7R/PC+XFH
         +JxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772515754; x=1773120554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVvQbdfjR71xwh/hnLqQ/BK/FfNPjqN0HqaVUrwZXiE=;
        b=CuGOiVaE5faf5RLth/ex1uCFrAXANEe7L0HiGg6AeDPV9/LxTMPbl7mQ+CLN9YXGy2
         JisBlAf78qS4/S1S+2ucVNwECpO1QRB2iHYnDv6beoJSJEDBebUGzGPWXvOp/R0BSRkG
         z0ysQb56Xmk7TIfaMTiwD5cNCbHfvHXvvbqgaEflgCpd1QqMaYhwLsQSK/+nJMiy/J7o
         pUGZS25T66pauSoD0+wgF4kjtcxzw4OBsdPQt8wjm2+6SuwqXvNH9KwDopAZ5j0jwE4G
         ytYj6DRlaHeIElXux8ywUDN4BoJuHQcwuRgl2Iqw3MWhWQ4LrZbMYFUag7L7Hg9Pj/59
         3YOA==
X-Forwarded-Encrypted: i=1; AJvYcCV7VrK7DJgHe1DizWMxmXTHH/CyW0gKwyuIgVZ6KQBt29tKVQwYBCzh/YKxXLTuaNg2awmRALw+vMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdbC6GM8cbgp02PCi0NNyUMXDz3S33J/7+7Rw6GDLJ+Eh5lb8f
	RNBltSRQtKia6gkoxvWAAQMjXuEwvS7Q676jcZ6jv+LNV1W/PNhIIxa5nJ2RSodK5jpm+0Mrk+4
	zGBPqesBJafrMNHKdXi/tymHzRHoU2e9zwEI0MGw08OH3if0Uv21aZG1hufDHg7k=
X-Gm-Gg: ATEYQzxh+703L6vkeBLxk5p1we9TPDnl/pANW1+MDKJQiLJ+xA02Qz4opdy9jBGyNzw
	tnbAcaRCq0EL7QJzA58n888OkEzV2f+5ryDwc0NeBXVwFamG6eDCqxo8v1IRQfEUCLr6LeF39Jj
	OgdsuL2oukFl22PoCW8pw9D1rqthceGFJmHcoeKgwp7TTPj3S/o+7L5HTwaYbq1QjBwNHT3ACAa
	xvd3lueNy1Csneys8XqpuqdS+sxcCMGkzsrgbItS98ocpNtUf7NmcfB5aFTMz1bz/WUsDjC2RzC
	t0i1RnLl2QpJKxotQ/5nTWPIThR4pRIU+QqVcaxtMEBO7YJgnI1cjg2Cqx7qPDhZZZqTBPFUm6g
	9xdj6vEe7ABJk1WCh7ShGmX0SvN3vieFX4ppa9W7pep/m/xRH
X-Received: by 2002:a17:90b:51cd:b0:356:1f96:9fdd with SMTP id 98e67ed59e1d1-35965ce17f9mr14084409a91.33.1772515753688;
        Mon, 02 Mar 2026 21:29:13 -0800 (PST)
X-Received: by 2002:a17:90b:51cd:b0:356:1f96:9fdd with SMTP id 98e67ed59e1d1-35965ce17f9mr14084387a91.33.1772515753194;
        Mon, 02 Mar 2026 21:29:13 -0800 (PST)
Received: from [10.218.28.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm1103599a91.16.2026.03.02.21.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 21:29:12 -0800 (PST)
Message-ID: <5de8797f-a131-4ad5-97e8-005b751bdad5@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 10:59:06 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
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
 <8d658491-bc1c-410a-97f5-bde1a00764b2@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <8d658491-bc1c-410a-97f5-bde1a00764b2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Br+QAIX5 c=1 sm=1 tr=0 ts=69a671aa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=e-IyLFVPmCgX-Kw4_c0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 9EbwvKqSefW3Lvi2PmfvE0-kOuQgSihB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAzMyBTYWx0ZWRfX45OLPr4COT/Y
 N9jg/MlnVfA6q/rZ2vb+Nc3Z6D6yTdm0usjwacJuh0epFwgtP79S8dHJstRygCQ1ruorH6pNQg2
 /J1MBmhHf4xr8sJCt+H+Uk/o5KhtSutR6pYhqg8T36XrBryxflbCvybvHIVlJheT+iOZT5SkIy5
 8JfrJ16pYUpoUsakOXyE1eCu6GDT73LnLmhfLK5iBFu2AtOfQbzurC/jRpZoSChzPVknGMDWBk3
 e20RawdfNLPjxLcXGC0bpFLIX69rnLtCymFRzp3z5rSdRhKgI7kX1AXp3K8cQQMS2CM3sZP1J66
 cWXXn+qyaVR+MzDHpZZeyk9CO7oujKofc2ytHFgocLDpe013vxTsgvM1SSwcGixGKInqVILE/Sn
 NYibBZJt9h3nrFKD7ezDMhe5LUEcFvrj1e9fj4UENnrlwSoecHEfCYB4l2BvNYF7X44e3MxHQ2v
 8Wx69dtv+65tEwHstyQ==
X-Proofpoint-GUID: 9EbwvKqSefW3Lvi2PmfvE0-kOuQgSihB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030033



On 2/23/2026 6:51 PM, Konrad Dybcio wrote:
> On 2/21/26 7:22 PM, Akhil P Oommen wrote:
>> On 2/20/2026 11:24 AM, Taniya Das wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
>>> is simply a separate block housing the GX GDSC) nodes, required to
>>> power up the graphics-related hardware.
>>>
>>> Make use of it by enabling the associated IOMMU as well. The GPU itself
>>> needs some more work and will be enabled later.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 64 ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 64 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> index f56b1f889b857a28859910f5c4465c8ce3473b00..0cc931d0bc96e9563ce4e7989ecd4ba50bd424f8 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> @@ -4,7 +4,9 @@
>>>   */
>>>  
>>>  #include <dt-bindings/clock/qcom,rpmh.h>
>>> +#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
>>>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>>> +#include <dt-bindings/clock/qcom,sm8750-gpucc.h>
>>>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>>>  #include <dt-bindings/clock/qcom,sm8750-videocc.h>
>>>  #include <dt-bindings/dma/qcom-gpi.h>
>>> @@ -3001,6 +3003,30 @@ videocc: clock-controller@aaf0000 {
>>>  			#power-domain-cells = <1>;
>>>  		};
>>>  
>>> +		gxclkctl: clock-controller@3d64000 {
>>> +			compatible = "qcom,sm8750-gxclkctl";
>>> +			reg = <0x0 0x03d64000 0x0 0x6000>;
>>> +
>>> +			power-domains = <&rpmhpd RPMHPD_GFX>,
>>> +					<&rpmhpd RPMHPD_GMXC>,
>>> +					<&gpucc GPU_CC_CX_GDSC>;
>>> +
>>> +			#power-domain-cells = <1>;
>>> +		};
>>> +
>>> +		gpucc: clock-controller@3d90000 {
>>> +			compatible = "qcom,sm8750-gpucc";
>>> +			reg = <0x0 0x03d90000 0x0 0x9800>;
>>> +
>>> +			clocks = <&bi_tcxo_div2>,
>>> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
>>> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
>>> +
>>> +			#clock-cells = <1>;
>>> +			#reset-cells = <1>;
>>> +			#power-domain-cells = <1>;
>>
>> On Pakala and newer GPUs, we need to scale GMU (which is connected to
>> the CX GDSC) freq. Is this DT description sufficient to allow scaling of
>> GMU OPP?
> 
> No, certainly not.
> 
> I see that GPU_CC on this one is exclusively powered by VDD_CX, with
> some MXA backing, so the natural course of action would be to add a
> RPMHPD_CX power-domains handle here. Then, voting on the CX_GDSC will
> propagate the performance state to RPMHPD_CX.
> 
> Taniya, I see there's also some MXA backing. Do we need to scale it,
> or is "just ON" fine here?
> 

MXA is required along with CX and I will update the bindings accordingly
to take care of required power domains.

-- 
Thanks,
Taniya Das

