Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8602DAFBB
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710461; cv=none; b=rQmbcaPGnVAAybOcZBPX+F4XlkR/cT/Ys+U8Z9jNO57hQiYOYo8VkmRY02Mh97wNYCMAqppnUh3jf0n8FwEtwIbi4K/oMEG3VtiWXthJE2VCxBDuu8R9a5qCxfYne7aoS508v/IZQNo8JNty/DjOfj4vnnRgE3hfQw+sIQBixnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710461; c=relaxed/simple;
	bh=2WOdzPUG5PUNeTf0BqyCqnl/mvY7CXGX0jeuTNkSMjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZEc/Z9OyaLdDxqVXW3NCst90rRWyDkmee4bEZkLPCRHT/ahXi57q/Cg514KehQJgN/UWZqp5LNAjtnehImvFhwkQiDsPJU9AF+Is2H4Dug1Lagi2kuaECDnFItl+4bh43gjMV+RCw9waWrtkwhw2Ji6nbkbkjOuQrxBLlC75K0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YY4OjkzT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dxKye+5W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YY4OjkzT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dxKye+5W"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NO1x1744993
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QeK3bJgoCKDPXj7jg82bDuQiHQZGh1KsuSqDPgEOFTI=; b=YY4OjkzTUiPvSbdl
	1AnIgnP0Okf+79VT78dFk0WDbyBRoGcm3/WWFucjPQMDVPu/yaf02NKTJL41xMCn
	7QGJaT8XuP7+kzepxFUHgXjqjsC8l/185ojfKYoexyyuqXYX+cZe4QIQgU/A30op
	wOMe5xQQAzT8NFKsNme8lrnWx9NROMNVUpOkwCSIWDM9OeT29ErqxBhxjkse4uO4
	Pur+gQ5BJp7mIEyYDZJajcPcYnCIImkzWKUy3+XNhkKs4HMPyFiRYfgBBXnCgd/Z
	MCZ/4Xm680q6rVST+8xpwIEPUBI/siMbp4CxYhdFYQK1EIRyxzho5CFjtLtxIVsX
	C3BTXA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734cnbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:20:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30ed664e368so96924eec.1
        for <linux-clk@vger.kernel.org>; Sun, 28 Jun 2026 22:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710458; x=1783315258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QeK3bJgoCKDPXj7jg82bDuQiHQZGh1KsuSqDPgEOFTI=;
        b=dxKye+5W6MUArvzURzAaAdHluvgWQQanVBYAFjkKc2iPjb0WHJYR4jhPZ0TqMTA8pv
         36jqYC6ruW/fU8/pQq4xlSiTg8iLMhRHzSIk968GkaBu9joYaHlKdB+l3Uir3U24es2Y
         Su/ASrBlkFnonyNeXRD3PP2Vuh7VGnao+T9MvzV8L4UBKDR6jj1HaJD5Ja+z4wWRL0OW
         j1c97qiDlIyuTyiCRgqMMcyxyRBlhClDE5J6cEs9Y4LWzp42jsXdTfW4RFZQ+uO2BWQF
         KDFYngl9iI4TCsAeQ/KCnWq1yFwOkjG0PDMson6fAbF/vQJyn1JzhSkC8o0Hg5qsXqYH
         /zyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710458; x=1783315258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeK3bJgoCKDPXj7jg82bDuQiHQZGh1KsuSqDPgEOFTI=;
        b=Rx5cXCWXVARSSN2+Drvq7B4/Q9ER8paMFoxSxdwHamZpQ11tdUrwdDuSvnkipUxSYE
         0genknfQEK6Jcc+/P0VZ/sFpR4GBcyjFYlXHZ+swuQ+WJp1fmArOlmCrzEnUX52M9ww0
         3l2ISkwDJGAwzIjbWNPc0TYwfyGTjl4JFxNE1KK3HiR8YJXKiyAC3ppCz9lXeu1ZVVBA
         mfd2r13mJfBNpnygyCnjffk9NLjnkBbcoPKW2zImXsYMt2WlhxWglb41oXA2L5lk2IUP
         PLEYtZG9+/mtdtlIrNNvL8MA28HQV5SPu+LtioEkOYp7danlp7M8shncbBHee5wC0eHu
         FhAg==
X-Forwarded-Encrypted: i=1; AHgh+RqQWhv13chpz3N0Q75bkSYXAfo6DWVNeBiUTLhmc8ZMig2rv/GuoxT9vb051O70jbeqhJZ7LCojbqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDTOU/Gma3I/LG7Xk1j7u+AfajGWSCB/K1hcERfOMFDJEfWjAu
	/5SbMrgaMMiKtMSIsMGJeas4wzgJsgD/GYaWm/3MyJnIU0nEf0OHW6EN0oGw5KkgmYj3uAHsMRx
	kQxWVGoGDIMohBK8y2P5H42/8VrxJz4Ijclygm9Ra4kF5ZiLOkHCBpI68p0QOAuU=
X-Gm-Gg: AfdE7clAJRfwhWI3OreUI4qt6AAodZHIf0odVJwDXi4eFAP/QxKLGthkcLxz9cE4heX
	S3XYHTLDNpo63UVR52Vpb+8KrfpWhgBfznHTtpOn200QZw51FBisx2itbJKubpLPdk5ObstBgT1
	g31X8yoAfu/69RhvZnX37I6W8EqC/X4NCnZNiSbtlwZ9ElNpMQdlRAqmS9aURXzcPZ5mdnUANvg
	1Z22Px1UjI3N5keHk62ctHDcgSwj6ScJS/9lJ19EIKvdR2njM9INzJA2rbG50yKEHXR2mACJu1c
	U2a9I0QUpCBUQyRePlpivsUAQ8Bo52CVsxPxel8S8l9sKo0doemIUm4fA316S7xueMG9Uq37oyk
	JZXvH1kYZ+y38qUNlor3d+bHL1bjT2huv27oRSQ==
X-Received: by 2002:a05:7300:aca8:b0:304:70d0:4f03 with SMTP id 5a478bee46e88-30c858d23aamr12222753eec.6.1782710457839;
        Sun, 28 Jun 2026 22:20:57 -0700 (PDT)
X-Received: by 2002:a05:7300:aca8:b0:304:70d0:4f03 with SMTP id 5a478bee46e88-30c858d23aamr12222738eec.6.1782710457322;
        Sun, 28 Jun 2026 22:20:57 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm39914896eec.5.2026.06.28.22.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:20:56 -0700 (PDT)
Message-ID: <4980d925-ec32-4632-a377-d65b9ac1d152@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:50:50 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: shikra: Add support for AudioCoreCC
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-4-7ee6b5f2d928@oss.qualcomm.com>
 <b3a0fb12-5595-43ba-b552-cbf06d1f9260@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <b3a0fb12-5595-43ba-b552-cbf06d1f9260@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oHAPZkmPiDt_067yCFA-S2WNkQh9C3vk
X-Proofpoint-ORIG-GUID: oHAPZkmPiDt_067yCFA-S2WNkQh9C3vk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX7Q46n2d4MbC8
 6gK70zxMggYefT/15hulPe1XrIHF5GZSjmyP/aAs22/3C0W7UQSMDbHXHEJvglDLs14vYBh3z9Y
 vBoL8hgldIeX1PmIWWrU0Sd3a0Q75Fk=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a4200ba cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=SiY_No2TDSAPns8i4EEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX1gvVE7l2Pzl0
 zf2cc1qzlaB9O9DlGfa2dEOl4WFBDlhlsJXkFW+wu+cFj5pTtrYyICqy7kJmdXGXMArUAyMH4w9
 YFj7dO4uf2WH0G2f4Qz5oo+oge5QiWQmAbJYEGd9LGm1f1y+wlUi94qPflJevBCk50bTK8evjPt
 NHs49RkxghU1UaubvfKeHm5eEvHTy67owGj8/GRFqQLcniEaHr1AT0dUXvwbadLBiaoXv80mkuV
 jaZ9hE8zkI698/YGeshqQiibBAFbiOO9XV6b7USyHi89+Ycpb2Ja2uew/vTiCGh9o/XgA4siY6q
 UjovuHAqqmaMOG0WyUXHJUIZhCmAaB1B62ULwwjXkh7J2YMcyvxzi1SuRYtKCy0lwexLjyGZxpi
 9lK5ubm7ob9EUALPS9AF0WcL1P5OJ5PwZcW3HM2dl4M3vy9yMBniGxfUm51c2pFU1DTRNRpY+cT
 1shqPUomrJ1s8kc7p5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290043



On 11-06-2026 04:55 pm, Konrad Dybcio wrote:
> On 6/5/26 1:26 PM, Imran Shaik wrote:
>> Add support for Audio Core Clock Controller (AudioCoreCC) node on Qualcomm
>> Shikra SoC. The CQM variant requires both clock and reset support, while
>> the CQS variant requires only reset support. Update the respective device
>> tree variants to enable and override the node as per variant requirements.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  4 ++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  5 +++++
>>   arch/arm64/boot/dts/qcom/shikra.dtsi        | 13 +++++++++++++
>>   3 files changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..0883c480bfbc80d7bead966b9ba932dee8a77bbf 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> @@ -23,6 +23,10 @@ chosen {
>>   	};
>>   };
>>   
>> +&audiocorecc {
>> +	status = "okay";
>> +};
>> +
>>   &sdhc_1 {
>>   	vmmc-supply = <&pm4125_l20>;
>>   	vqmmc-supply = <&pm4125_l14>;
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> index b3f19a64d7aed3121ef092df684b19a4de39b497..b5e3d573868a836ad5e5e8eb3024cb5fb71dbb4e 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> @@ -23,6 +23,11 @@ chosen {
>>   	};
>>   };
>>   
>> +&audiocorecc {
>> +	compatible = "qcom,shikra-cqs-audiocorecc";
>> +	status = "okay";
>> +};
>> +
>>   &sdhc_1 {
>>   	vmmc-supply = <&pm4125_l20>;
>>   	vqmmc-supply = <&pm4125_l14>;
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..f15757d52af04d8cb5540354a239127cb0d174a3 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -4,6 +4,7 @@
>>    */
>>   
>>   #include <dt-bindings/clock/qcom,rpmcc.h>
>> +#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
>>   #include <dt-bindings/clock/qcom,shikra-gcc.h>
>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>   #include <dt-bindings/interconnect/qcom,rpm-icc.h>
>> @@ -640,6 +641,18 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>>   			};
>>   		};
>>   
>> +		audiocorecc: clock-controller@a0a0000 {
>> +			compatible = "qcom,shikra-cqm-audiocorecc";
>> +			reg = <0x0 0x0a0a0000 0x0 0x10000>,
> 
> This is called AUDIO_CORE_CC where seemingly all the clocks live
> 
>> +			      <0x0 0x0a0b4000 0x0 0x1000>;
> 
> and this is called AUDIO_CORE_CSR where seemingly all the resets live
> 
> so it would make sense to split them

Yes, the clocks and resets reside in different register spaces, I will 
split them into two different nodes as suggested. This will help to 
handle the CQM/CQS variants requirements more cleanly.

Thanks,
Imran
