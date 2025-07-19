Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F64748F
	for <linux-clk@vger.kernel.org>; Sat, 19 Jul 2025 00:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752884224; cv=none; b=sHY6l169HxGw+QhXK12p+Y3Y2ELESFRMg8y/CJU5bCge+7yCRGLbfJ+DwJJT4WyqKhcRkbYIu5+bKPW+0kvq74R3D3NBXDslBO5y+EOQXr7kPUY3rOEhgbsXzslw4s+a07qEmCeY4kfL0B0hZHQTaldtcEIQBETc1BodI9/QAl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752884224; c=relaxed/simple;
	bh=Lh0eZCPgPq794kh8u1sZbkVoI2rhofVGnEq+Pvobvzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZQvhQ1T7KeoghZgekUUAEItdTwpnpBvvlzrdgqnDtD8h0RfmBLT2vNXAohfF4jW8x6PriSrvVYA7oRxoJTzq0AnKw06YLVLGVeogaHh5hJZsGeNw855xBGs8TMsLyyF6KR45kmbzdqkV2KjstZbK5gazy9/N1Rw4jtRU3bwzXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogcVf+1M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogcVf+1M"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IHKLet007196
	for <linux-clk@vger.kernel.org>; Sat, 19 Jul 2025 00:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nuzVlXIUuXiwaB1rXnj3/BisM57GE6oPUvR/VRrQ9ko=; b=ogcVf+1Mi2RJjWsm
	N4/bxGhDxJWgZEmBOPRgtXkG6XeX0sqcmyGhMFNYk+olWF3MPuliVDBYQRQfFtIZ
	3C/k+l68y/QjhuoTTllfs6oDHg4syZVN9BBwe3VaPqYIvKnmdfY844ZEcOZWnTPo
	uRGU8a6h2Xk7ATsmk8MMQBrsNPmRGh/ThBgtZ74HevpdHxQeRR+2rfI5nxZDgc1t
	1XEXuLaqG+h26EhrHWTDlu5xTJhwBVJakYvvZ70dlilfV9v3DTRZviZRt8yZO70z
	jjVRYENQmAaetturbXa+O3691tdeP8ROS8SsxPjww+iyDdOBchUDb9HEfXTAfT6c
	pCAlOw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfcaee9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 19 Jul 2025 00:17:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31cb5cc3edcso1926534a91.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 17:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752884220; x=1753489020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nuzVlXIUuXiwaB1rXnj3/BisM57GE6oPUvR/VRrQ9ko=;
        b=U42rxjr540eLrC6srvepAukQ3+vT+95OLHlSKF+spzuIv6nRvRafR6Yvv6gu+LowEh
         Q/l7OiGgMGQElFYtwMLiLKR9ielnRzSDIqNfkg3AzhrXL8OGY0pylxmhqX6TyRia/Kqn
         UnqApBAdLTtys50/+8kb38dTkPcbjSxE86772A2SsGln9f5kPDVg9Ysffv104YHnq1Es
         r3t1pLMIRk6LEIjofjCZ62pQBeI9r2imuvBko4TTzkdGj0yJ/S53N1S7oO4h1WAMQOwo
         s9eURZVqq2fZQN1F4oqwll7aIZ8qAl7oAJgbgMfN9yXXomt8wlQN93stjnpvUlgUXep6
         RSTw==
X-Forwarded-Encrypted: i=1; AJvYcCVoLlXaawHY1bbzlsy84NbHDr60WnX32kzHrXNAhZvVpMr56E9TSLe5dJnj6nop+sHR+INzlC/ymvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYELgqaPpjZe4vv5Sf3/ttxjcGyZdmWOjsQ8gk8N5f38nXTrsV
	H9Gfl1kDglj71bBd9IhTGPuwyuLh/TyRMpuA0YP4Dxmj1Zm6RjQ2d7y5G/ADDhLclEHcXpqrWkW
	ENm7cTVMqQxWf5ZIVUPad4zQXC8bu4aG1JEhoy7H3VZBGrjMDYWwwDMQrsVZtEcs=
X-Gm-Gg: ASbGncucCXGJgROPgQyW4LO28mqG6eEvFi71c9kbOMZMUDGrVW7T23GpcTO2y2PDkgz
	NYLP/dBCML3PBB1c7ve13r8MvOm0HX5vxCLng6Lkfbe7AjjeB8vZygvepap8jb5xsOseNC2Hm7H
	VPnKW1TwkMQ7uxtLqxzxBpCXVnlIdGv9OP+BRAn9uoQa2bm/h1jm7khHvEmOlSOtCUyE+eLHGpw
	GuadaSTGD0JS0PRVrdUQVtAUMxBfGbC58kjnWTMLYymCw7yfwH1SCjuncD5qVU+KAta98AUHgCV
	JKrlkxQf03rqDp8vN29rBwD+p+8Zr1W+0Cl/BgMIc5Y6LS4U2FgKEGSAqZowsYGW4Pz0lt6WSTa
	RcfBy38WUpqlwt+vBp/dcWQ==
X-Received: by 2002:a17:90b:5385:b0:31a:bc78:7fe1 with SMTP id 98e67ed59e1d1-31c9f42ea51mr19843818a91.18.1752884219759;
        Fri, 18 Jul 2025 17:16:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZU0AEoPTJMZYugSgAQPqMLAHd7s8fV5oFYzAqjw2f8AX6fmugw7QfAMkMHVcutfa9ueugdA==
X-Received: by 2002:a17:90b:5385:b0:31a:bc78:7fe1 with SMTP id 98e67ed59e1d1-31c9f42ea51mr19843760a91.18.1752884219178;
        Fri, 18 Jul 2025 17:16:59 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e5b038sm1959290a91.10.2025.07.18.17.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 17:16:58 -0700 (PDT)
Message-ID: <1b385a59-5461-4c28-855e-d2379c2a8173@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 17:16:56 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov
 <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-1-72ce08285703@oss.qualcomm.com>
 <unwinuwoft6sfczcjlqq5kijss3ttggfbobs6ydw5c2lkmndc6@7c23jntiprob>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <unwinuwoft6sfczcjlqq5kijss3ttggfbobs6ydw5c2lkmndc6@7c23jntiprob>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDAwMCBTYWx0ZWRfXyGSkN49gWSdu
 /X+BPc1SIjOGAPbpmG9Wc+sZVDlD70oCZdOPrZgJqsWCJeO2fEya3S/qW0WyfitahRBVStJ018k
 0zea641knPMYyUo4QiHBqUMtkaRmjiPYouZL7pUX0f4jP3r5qvxCO/g3LdoOuGJqOZsO+7KLYFg
 xVWGbhicaPgmiLTgBqiYPnwLterNkKl+b+THZ2JzMIfF+NbidYEVB0nAiu3JHjLBM5hFSbSyUwr
 jGIbqx5rIaNzMFumBsIernMLZWF9vvc8gQ0s6U8CSmR/I62JgUtu2R46muHFyhIuqLRcnSQaDPT
 Rrm2QCqkex9JLoM7lM+sp3fw0QvoR/KnByqyHnzAyI9xUqt+uZ663gPwl0a3UIn6h4LAEn0NW7M
 Nlh247H5j8k7MPw8ASrpqwUeqTvKiqA1yv/D0I6EnuT1W01toiVAi6wNEP2kZTm/qGhWH0Sx
X-Proofpoint-GUID: HkqebdXPdPeIR1GBoGClBwP5-InMomeN
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=687ae3fd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EOe-Aop8_12Esa9JHLYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HkqebdXPdPeIR1GBoGClBwP5-InMomeN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_06,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507190000



On 7/18/2025 2:13 AM, Dmitry Baryshkov wrote:
> On Thu, Jul 17, 2025 at 04:28:43PM -0700, Jessica Zhang wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Please fix the patch subject.

Hi Dmitry,

Ack.

> 
>>
>> Add x1e80100 to the dp-controller bindings, fix the
>> displayport-controller reg bindings, and drop
>> assigned-clock-parents/assigned-clocks
> 
> Why?

IIRC issues with the x1e80100 dp-controller bindings (i.e. the reg 
bindings) weren't being picked up by dtschema because the x1e80100-dp 
compatible string wasn't in dp-controller.yaml.

I can add this to the commit msg after moving the 
assigned-clocks/clock-parents change to patch 3.

> 
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/display/msm/dp-controller.yaml    |  2 ++
>>   .../bindings/display/msm/qcom,x1e80100-mdss.yaml          | 15 +++++----------
> 
> Split into two commits.

Would it be better if I kept the compatible/reg bindings fix in this 
commit then squashed the assigned-clocks/clock-parents change with patch 3?

Thanks,

Jessica Zhang

> 
>>   2 files changed, 7 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 9923b065323b..4676aa8db2f4 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -29,6 +29,8 @@ properties:
>>             - qcom,sdm845-dp
>>             - qcom,sm8350-dp
>>             - qcom,sm8650-dp
>> +          - qcom,x1e80100-dp
>> +
>>         - items:
>>             - enum:
>>                 - qcom,sar2130p-dp
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
>> index 3b01a0e47333..0e699de684c8 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
>> @@ -170,11 +170,11 @@ examples:
>>   
>>           displayport-controller@ae90000 {
>>               compatible = "qcom,x1e80100-dp";
>> -            reg = <0 0xae90000 0 0x200>,
>> -                  <0 0xae90200 0 0x200>,
>> -                  <0 0xae90400 0 0x600>,
>> -                  <0 0xae91000 0 0x400>,
>> -                  <0 0xae91400 0 0x400>;
>> +            reg = <0xae90000 0x200>,
>> +                  <0xae90200 0x200>,
>> +                  <0xae90400 0x600>,
>> +                  <0xae91000 0x400>,
>> +                  <0xae91400 0x400>;
>>   
>>               interrupt-parent = <&mdss>;
>>               interrupts = <12>;
>> @@ -189,11 +189,6 @@ examples:
>>                       "ctrl_link_iface",
>>                       "stream_pixel";
>>   
>> -            assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
>> -                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
>> -            assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> -                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>> -
>>               operating-points-v2 = <&mdss_dp0_opp_table>;
>>   
>>               power-domains = <&rpmhpd RPMHPD_MMCX>;
>>
>> -- 
>> 2.50.1
>>
> 

