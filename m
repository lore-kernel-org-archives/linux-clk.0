Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA80638B139
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 13:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149613; cv=none; b=kabRzj9jCT5QqCKyvEroRW5xU1uDOCXi682zriAXZ912UK+dxEaKhVj7CVLo57izSX5La3q4WddAVwA1Se+knH3Bax3y9kLPp0d7ijhGmQO/7ysU7BoIWM1DpHffv19+fHl5cXXALndgU5/YAQuqicdEbH/jddqC1GT63GtG7jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149613; c=relaxed/simple;
	bh=ohlf204PBPyGkfGsfwjB4Rhue1MGahmTmkrmmngXz/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSgYGs04bf3oqV7z77y8EKJa5lpREKEKBfup9i0P3Rl3Ycyg2vHWpIkuVaL1S7ujtae+MAsJtIo4DzLPHZdh9si7YajSmyQbSCv8jH5fWnzecOc1L5FUq4Rm7qm1mHnGa5WDSrtTYTLPKhio1jQtBK7UZKd/PCvtvrtGSpsKdiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jyx8zu5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XaCZ9SFy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jyx8zu5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XaCZ9SFy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACb62p026003
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 13:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eyn73kUkWiqNnNNT+/vwQ6yPvEiwRA7Z6RtRnIDL/oY=; b=Jyx8zu5kysUx+Cqa
	7c56vpi/wpeqlij6PFjnhpoEuX14b6StAUMOmacLO/swlipQIPFjA+HfrgrXTEM2
	6iiM/eJ5dyn0sOb22yxvon6OaHtTOZ676TXrmprqa46Ce0t+aBtFjuIZ7sfgxM1U
	FEDF0wU2Le+W7Ogd61pXyWGWIvVRhwZdRqrwm1sv0gc4VpzoJPD4IG+8K824zvIO
	GPazb7z0oEnjkaBIUTtI1vkelif/OunGwI2RTRD2WID2Ny0ScMWRtxY0ZBiLvqNV
	U7sbwuIAAggzXnuU9S9PzZPzejmtKHO7W3pRwOhVrfBCKqgisNiVEie5pbz2wqJH
	ponhqg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5nh31q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 13:33:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8e89d19bso114206785a.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 06:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149610; x=1773754410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eyn73kUkWiqNnNNT+/vwQ6yPvEiwRA7Z6RtRnIDL/oY=;
        b=XaCZ9SFyl00xYz6U8sTaltBtOVzcKW26pkWcOMhFYuZozth/8irrtUZZE6KBvWK+eq
         wEMmO2I8qWi76dvsORHPAGtaUu/bh/ys9MPCxvR2QaXQVgy10mS3scXJ9Z7NQo+gm4xq
         fVw9Qi5DcD8oayAUb84DjUGbHLvUwSZN5keixgx7E3pyoSU2M4qzMPj310R5iySPrZfk
         0C2STpJfn+j6nx/KKqDiLD2DYnh5xIS9/pzVk4uHl6BLNTyBi6+sN/78zJ9l67dlN32P
         nLf1Le6LdmL86IVayyzb+P3+pg4XjamiX/mOfm24k1xLlr8WvXN+9aeiloInvd9xTeBP
         NVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149610; x=1773754410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eyn73kUkWiqNnNNT+/vwQ6yPvEiwRA7Z6RtRnIDL/oY=;
        b=pMSSsbqjvvPB901CZNN+/8lU/yCSFsX+vfaRNjUQ/kBz6g1ETrkPmSQsPD+hv03jZt
         xTNYyEyvdhzkrL3qOOPsdp7QqXx2jG7JV2KUdqu1iM5aJLcxUYLsDv6DPZJXel9X+0+Y
         Y6dwYP19aoFRFDTVuUUfDt5lUh1GIcpojvS0SOCvF4cXv5pdOlGJobP2q09ob2jac6wf
         3o3jjip0wuy6IrlKLpKZ/+OavOkurdHIZbluHH747hp88g+E99F4qHPDOlONy11XrbRM
         h/EeZFkBUIAFTzXk4l/ozNuTfMZCsXHINWRU8iPkYw5nQYNROM4y4zOFCt4eVh9vGXrC
         I5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCX7pwRhTK5O1d457dD4d79dEspdMHEYw0a+YY/n7adk0bnRL6OEhKIORjv8nd0zSOwuTgW+DXZgJTI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0xe+QrvQJ2uyOrf+/3q9q/JPK6R192jIqEJpSRcM8xEntOcvS
	ViA7c69NKtnbtOPTwKj0AcIlIuyTGyG9HhnPGBhHzs+6Hm0XSdUAOG1GnehGXs8pUEHnKC0+NR8
	nAd0GE0ZxuJ/qPMYvSOi/bT5cOGJtfwUsrYZYvwBGFCWRgvWAhmU8rnxQH3yYspQ=
X-Gm-Gg: ATEYQzy8Yg0VSBxZ1fI/nnoxjZnFbmWzlwLkSebTbb9VqwDS9hWiiMlWJzk5O3dJBBr
	CbPE0JSl+Tfxa/67gqwxJe4xRzrZ4qAipuHBcfRMlGHqImeEKExGcHGOLqa3D0baHvuvvPFIHbi
	mrRGAaXl8q0qWp17r5Fvle4IhIJNBM3jlgfVR12L1lXiBobjrTJo0IGQgEGRdY8tLV4Z7YjgQDr
	BGhkF2AScEEj44DKxEI+IG2QRpz3ETPoJeOg3lhMzNz35G/YIRz3jZyFx+tbn4cmPkYCxIQtqFE
	S5nWcu4agrkZ/AkQLqt+yPGE1qEWTLx9KZEppD4gk/luDGNN6AYPq6MbTFbXxoIGJsF65QpjR9m
	U1yQrktHCArT9lTDYUovuNzKhV1tJ4pWyCkuEGpAUhbO6Oa+aEiy06FjJCmkAICuL0iRlJcU7RS
	St1Xw=
X-Received: by 2002:a05:620a:25d0:b0:8cb:3fa7:c4f0 with SMTP id af79cd13be357-8cd6d42bc36mr1491331285a.5.1773149609978;
        Tue, 10 Mar 2026 06:33:29 -0700 (PDT)
X-Received: by 2002:a05:620a:25d0:b0:8cb:3fa7:c4f0 with SMTP id af79cd13be357-8cd6d42bc36mr1491326785a.5.1773149609479;
        Tue, 10 Mar 2026 06:33:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f18902bsm477819166b.61.2026.03.10.06.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:33:28 -0700 (PDT)
Message-ID: <2f4f298c-5fc0-46e6-a1bb-4c37c21786da@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:33:25 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com>
 <20260305-gpucc_sm8750_v2-v5-3-78292b40b053@oss.qualcomm.com>
 <67922413-af8d-4e75-aa49-079889576a73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <67922413-af8d-4e75-aa49-079889576a73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SVP0hP_OQZ2-EYmOtWZJVN9i5fIkO--T
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69b01daa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6F_KMvjuWJjJSnLB6NgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: SVP0hP_OQZ2-EYmOtWZJVN9i5fIkO--T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExOCBTYWx0ZWRfXxJTGvHHQl1Sg
 yWr4GKPG3RtQ1pQca9OW86vRfrlZGSgyikGRAghrTNFPig59AYrOqF5UK3qVC56MIMi1HQErnUS
 nvRvOi1zu/XnWVd/51Yc+nlgD6IfVO5Lpdw8H0np38jZE2aJ789KEoc2vs8TCDZcfmfkLWwZUH+
 ASWzSM68OI8mZ85VquLm6HTra3HYwSn6AoaUkt2XpAcfp5r9Zc9kOrvGTz7/w2FW+mVELoJ7zXk
 BnREeUapQBdumN+2210WunZn+OI7VVQLDs77fjTwWFfn39hzuvii+peH/EcD1qLMo3g1JycEM5V
 cCgwHubnZKjbvolWQi74vrqsuINMh6JPzraUrfki9u7SXdhl4DjGZiuc1PIC8qRmO1QNgRzWS19
 unX4iDyTdcdJ/EcDl4i70tAu86lZII6LtOOtxdSURoCgUfrrGeU2EPm1kgj8HpslhPNXwf3W8Cw
 dUsl8YUpcBHPqBY+Meg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100118

On 3/6/26 10:40 AM, Akhil P Oommen wrote:
> On 3/5/2026 4:10 PM, Taniya Das wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
>> is simply a separate block housing the GX GDSC) nodes, required to
>> power up the graphics-related hardware.
>>
>> Make use of it by enabling the associated IOMMU as well. The GPU itself
>> needs some more work and will be enabled later.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 68 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 68 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index f56b1f889b857a28859910f5c4465c8ce3473b00..0e7a343297e3f5d7a8189f50726dc6279078c21c 100644
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
>> @@ -3001,6 +3003,34 @@ videocc: clock-controller@aaf0000 {
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
>> +			power-domains = <&rpmhpd RPMHPD_MX>,
>> +					<&rpmhpd RPMHPD_CX>;
>> +			required-opps = <&rpmhpd_opp_low_svs>,
>> +					<&rpmhpd_opp_low_svs>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>>  		pdc: interrupt-controller@b220000 {
>>  			compatible = "qcom,sm8750-pdc", "qcom,pdc";
>>  			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;
>> @@ -4515,6 +4545,44 @@ tpdm_swao_out: endpoint {
>>  			};
>>  		};
>>  
>> +		adreno_smmu: iommu@3da0000 {
> 
> Should we move this node right after the gpucc node to sort based on
> address?

Yes, this might have been a rebase artifact

Konrad
