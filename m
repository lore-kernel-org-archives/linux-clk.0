Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEA627BF7D
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752856532; cv=none; b=aXKUFvSddHSDWv0vkwRGgT6gkGQekJLaNzFRu4mkVh+YznFGnM8b/o4b34kW9Y+221jr6uNzY6HDNIwvQ4IzZUCoQRtdqXnfp9s5JhSIKZoVHRmK84LdNyYrJP6k88SNJUEQRMStVhjE4EBl+dPRU55HC1v9oA17WpQGqHeQ1h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752856532; c=relaxed/simple;
	bh=JIZ9xMoinVfU3CXgwb/8zdj0IfbDjnp5At77/5VO+2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vu4N848MITsG31C+Zvx+tGn8VNhydinPZhSA3GAzuHlOHdM7talMJL4jNJaIJ/rrYsd11y3Z+j8QQXKBwQx6eH6V2hBYsBsmVwLtSBLc7/G6hSLmHslotK4z0rxrQRM5DUvGjXp0z4X8R9aRdSF2He4ByNOlHg9b78USK0nSZko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NhoaoNzK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NhoaoNzK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IF1Ri0022444
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 16:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q+FCv7HkwD6+qrFx4kTNaSBcLmg/tHCCS9wRamsy6PM=; b=NhoaoNzKSJU1Akcb
	QtiQNFpJMZD21756mfUBQAbmHsGDuJOOVt5QHyZwjUC1BVpsEJdMjy9gCaZNN+6R
	/RQhNTSZWpz1tBhS2GW7aEcCG/EFLqVm1q1XrWCrFvB0wj1MI8ZRr4ZHFwpuGIZi
	XNyFana8doVObDCYZSaP+1OyaTWIVDzLgiY2Fy8JsCnLMLB/svOktAjjG09rRVBw
	/bbCTw4QDZ63qCJZxDLIXSswxIZeJCFnnWqEIcyhB+8q2xacx4tNcKAA/w9zdWsF
	cCriHqV9W+nq8S8IPBx1tpYY2pHe/VwiuTQTmseCQJeirccRhxquvwMa07yb1ERl
	ZG3y/g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsyc9ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 16:35:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74b4d2f67d5so2059060b3a.3
        for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 09:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752856527; x=1753461327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+FCv7HkwD6+qrFx4kTNaSBcLmg/tHCCS9wRamsy6PM=;
        b=tzJ6PUuWM1VcuLXR6VTvfGCMzEL5YEEs5l2rFnnTR6kNN8UhO4ojkEIYtEIqfg5I6I
         geoMCItK/7OLEJAlof2UH45OLy3fgmR3T2FtUHYk8yT+SP4/c2dEZtto4ycPPs2LO9b/
         MNUqytPTnYSr8OwWHMBTTDwFKXEBkG9jUczApm2epnFU9SVEYHgd69+6OyVjZy8gcqy1
         r0CnGqIBvcs++xYg/iF9a96JUP3pk+pXYoN9ryBLbq/ejHhJCQzY1gKNDMgboyepx02/
         fjrL5nQ0+UGRjiMEOyYlZZdQBHtEeVkCLi0AS6GUJHEtuJiH8sDYDlN3QMOLc6TQTQbF
         ZyaA==
X-Forwarded-Encrypted: i=1; AJvYcCUCqo4LWWnoCfYQaO+qmaQJlGbg2aMKxUsFSqu+p8ESFh+P++A7u6AZ4TN9pEagOrB6zykMC9bsviM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH2a2wqExoKga1Kfs9SjKv+uzsWph93mk78DG6KsdY3/Hqlx3R
	/HSVf20F7qjET2wPJ4BlClom3/cNYZAv06mkZtdSGGpo4bc8zVFeMCQZYM8dpqE7EtG44xMU8av
	WtWtsjF9zounbsnE/TWLwbo4Ra7nOYaiR6+3SxRaXJClLWO41bC+kIsSxVNKMG3U=
X-Gm-Gg: ASbGncs2vABVAkVVvFAc/kvAF7zfE0WYlyYfAmSmcmusphDSwLR7/4EkNSPj5eVmDeT
	m9NLjOamcAEdBfPCcuqJk7k/+AnxwnBEFyieIBM8ztojTV6QWvKTNjboPTdjTHTSM35xzpLnP6E
	cK1mO4UPiHlb7hN2uMEDRuWMdcPCOYlHwTbWSqPG0MDJ4sA5nj0CdfELMdcprisRJcdRL7YXnpm
	r1rKIjTEtb/SsbAeOzzEkRaq9+uOTCL5kB1fPAI4+1V5URcTV6ESYfaz9lAH6HYjO4pftf8ilN7
	LdhZ1BB+1umkkjqgoq+d7S5kmWFgBEFlv25Rt0T6BuY1AGyZXRaIS4SOG6kZmItgs/u5WRPOml9
	uBGdqm20LGN0CqVN+yxYRiA==
X-Received: by 2002:a05:6a00:928d:b0:746:2591:e531 with SMTP id d2e1a72fcca58-759ad3fd6c7mr4875759b3a.12.1752856526660;
        Fri, 18 Jul 2025 09:35:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpJdGGb04b1zgB3LYTPMKEjCApZSDmJlhHnLK3elKs2bYz3CTwcGlcNi4RQNCJ8k70hGHcZA==
X-Received: by 2002:a05:6a00:928d:b0:746:2591:e531 with SMTP id d2e1a72fcca58-759ad3fd6c7mr4875709b3a.12.1752856526010;
        Fri, 18 Jul 2025 09:35:26 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb157b49sm1516420b3a.96.2025.07.18.09.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 09:35:25 -0700 (PDT)
Message-ID: <12b8b26c-f0fe-4b83-916a-7ab3c466c269@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 09:35:01 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add MST pixel streams for
 displayport
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
 <20250717-dp_mst_bindings-v3-5-72ce08285703@oss.qualcomm.com>
 <5647urec3xivzw6jbkrcomizkutryte6l4uskiex7ji4tqnmxy@prjrintmtyyk>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <5647urec3xivzw6jbkrcomizkutryte6l4uskiex7ji4tqnmxy@prjrintmtyyk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzMCBTYWx0ZWRfX83+pRVLvQBE+
 s/fJCiU3tMbNKsTuw7nOWegvTDdwcp72aHTKVH7zfUnlechrVStmwbJq2JRyQh5aPISsjnh9cxT
 tJelvd6HdbkPT8LWyaPib5b5A953ENFGMvboUkvOxIuYvi/nLIizip7qRT+cxkCfDiK0TcihhwY
 kGdUf1tJEknpqxIDY6bYTDM0HCRxNXiXOf/HQkY32L7yQcT10DBrhX5iuM8jfTAG5OrnofjG2Rj
 bvoTVvDq4Jf+VQAZVqvQxbfAfdZEHjmhAO7zUMSCt6MzQ4OSSmumsfFi2yYT3vrwjFqrSTP9YyM
 e5jUaayQlc9E8FeasKUGnM7NcZv6YLhhdwsuNmx9tLhfobrVPfijsgGT5/VHigqBazMFofp+EMo
 e7IfVrZX12P3C60BXCMtupnSmgNtUEH4wleY9ZDgcAzDApt+5J4nkq7KUNhVtBo9tS/2hbK/
X-Proofpoint-GUID: 0Q9oQFfix1FNZ6Ff4HguMa3G3JfjzPyj
X-Proofpoint-ORIG-GUID: 0Q9oQFfix1FNZ6Ff4HguMa3G3JfjzPyj
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687a77d0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vsadNqCes-IXc-NRwyIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=768 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180130



On 7/18/2025 2:20 AM, Dmitry Baryshkov wrote:
> On Thu, Jul 17, 2025 at 04:28:47PM -0700, Jessica Zhang wrote:
>> The following chipsets support 2 total pixel streams:
>>    - sa8775p (on mdss_dp1)
> 
> Uppercase chipset names.

Hi Dmitry,

Ack.

> 
>>    - sc8180x
>>    - sc8280xp (mdss_dp0-2 only)
>>    - sm8150
>>    - sm8350
> 
> It's very strange that SM8150 and SM8350 support MST, but SM8250
> doesn't. Are you sure? Your patch contradicts this.

Ah yes, I added the DT changes but forgot to put it in the commit msg.

> 
>>    - sm8450
>>    - sm8650
>>    - x1e80100
>>
>> The following chipset also supports 4 total pixel streams:
>>    - sa8775p (mdss_dp0 only)
>>
>> Add the appropriate amount of pixel stream clocks for their respective
> 
> s/amount/number/, it's countable.

Ack.

Thanks,

Jessica Zhang

> 
>> displayport-controllers.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi  | 34 ++++++++++++----
>>   arch/arm64/boot/dts/qcom/sar2130p.dtsi | 10 +++--
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi   | 10 +++--
>>   arch/arm64/boot/dts/qcom/sc8180x.dtsi  | 20 +++++++---
>>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 72 +++++++++++++++++++++++-----------
>>   arch/arm64/boot/dts/qcom/sm8150.dtsi   | 10 +++--
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi   | 10 +++--
>>   arch/arm64/boot/dts/qcom/sm8350.dtsi   | 10 +++--
>>   arch/arm64/boot/dts/qcom/sm8450.dtsi   | 10 +++--
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi   | 10 +++--
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi   | 10 +++--
>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 30 +++++++++-----
>>   12 files changed, 167 insertions(+), 69 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index 45f536633f64..2c85eb2fc79a 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -4237,15 +4237,28 @@ mdss0_dp0: displayport-controller@af54000 {
>>   					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>   					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
>>   					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> -					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel",
>> +					      "stream_2_pixel",
>> +					      "stream_3_pixel";
>>   				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> -						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> -				assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
>> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
>> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
>> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
>> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss0_dp0_phy 0>,
>> +							 <&mdss0_dp0_phy 1>,
>> +							 <&mdss0_dp0_phy 1>,
>> +							 <&mdss0_dp0_phy 1>,
>> +							 <&mdss0_dp0_phy 1>;
>>   				phys = <&mdss0_dp0_phy>;
>>   				phy-names = "dp";
>>   
>> @@ -4316,15 +4329,20 @@ mdss0_dp1: displayport-controller@af5c000 {
>>   					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
>>   					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
>>   					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
>> -					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
>> -						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
>> -				assigned-clock-parents = <&mdss0_dp1_phy 0>, <&mdss0_dp1_phy 1>;
>> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
>> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss0_dp1_phy 0>,
>> +							 <&mdss0_dp1_phy 1>,
>> +							 <&mdss0_dp1_phy 1>;
>>   				phys = <&mdss0_dp1_phy>;
>>   				phy-names = "dp";
>>   
>> diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
>> index b0e342810ae7..96090a948ade 100644
>> --- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
>> @@ -2139,16 +2139,20 @@ mdss_dp0: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index b1cc3bc1aec8..48b6a17dcea0 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -5012,15 +5012,19 @@ mdss_dp: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   						"core_aux",
>>   						"ctrl_link",
>>   						"ctrl_link_iface",
>> -						"stream_pixel";
>> +						"stream_pixel",
>> +						"stream_1_pixel";
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>>   				phy-names = "dp";
>> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>> index b84e47a461a0..ca188c7f1f26 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>> @@ -3233,16 +3233,20 @@ mdss_dp0: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_prim_qmpphy QMP_USB43DP_DP_PHY>;
>> @@ -3311,16 +3315,20 @@ mdss_dp1: displayport-controller@ae98000 {
>>   					 <&dispcc DISP_CC_MDSS_DP_AUX1_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK1_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK1_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK1_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_sec_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_sec_qmpphy QMP_USB43DP_DP_PHY>;
>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> index 87555a119d94..11ea2fa0b853 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> @@ -4338,15 +4338,19 @@ mdss0_dp0: displayport-controller@ae90000 {
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX0_LINK_CLK>,
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> -					 <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +					 <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
>> +					 <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>>   				clock-names = "core_iface", "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> -						  <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +						  <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
>> +						  <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_0_qmpphy QMP_USB43DP_DP_PHY>;
>> @@ -4417,14 +4421,18 @@ mdss0_dp1: displayport-controller@ae98000 {
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX1_AUX_CLK>,
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX1_LINK_CLK>,
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
>> -					 <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
>> +					 <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
>> +					 <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
>>   				clock-names = "core_iface", "core_aux",
>>   					      "ctrl_link",
>> -					      "ctrl_link_iface", "stream_pixel";
>> +					      "ctrl_link_iface", "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
>> -						  <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
>> +						  <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
>> +						  <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>> @@ -4494,10 +4502,12 @@ mdss0_dp2: displayport-controller@ae9a000 {
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX2_AUX_CLK>,
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_CLK>,
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
>> -					 <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
>> +					 <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>,
>> +					 <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL1_CLK>;
>>   				clock-names = "core_iface", "core_aux",
>>   					      "ctrl_link",
>> -					      "ctrl_link_iface", "stream_pixel";
>> +					      "ctrl_link_iface", "stream_pixel",
>> +					      "stream_1_pixel";
>>   				interrupt-parent = <&mdss0>;
>>   				interrupts = <14>;
>>   				phys = <&mdss0_dp2_phy>;
>> @@ -4505,8 +4515,11 @@ mdss0_dp2: displayport-controller@ae9a000 {
>>   				power-domains = <&rpmhpd SC8280XP_MMCX>;
>>   
>>   				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
>> -						  <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
>> -				assigned-clock-parents = <&mdss0_dp2_phy 0>, <&mdss0_dp2_phy 1>;
>> +						  <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>,
>> +						  <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss0_dp2_phy 0>,
>> +							 <&mdss0_dp2_phy 1>,
>> +							 <&mdss0_dp2_phy 1>;
>>   				operating-points-v2 = <&mdss0_dp2_opp_table>;
>>   
>>   				#sound-dai-cells = <0>;
>> @@ -5669,10 +5682,12 @@ mdss1_dp0: displayport-controller@22090000 {
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_CLK>,
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> -					 <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +					 <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
>> +					 <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>>   				clock-names = "core_iface", "core_aux",
>>   					      "ctrl_link",
>> -					      "ctrl_link_iface", "stream_pixel";
>> +					      "ctrl_link_iface", "stream_pixel",
>> +					      "stream_1_pixel";
>>   				interrupt-parent = <&mdss1>;
>>   				interrupts = <12>;
>>   				phys = <&mdss1_dp0_phy>;
>> @@ -5680,8 +5695,11 @@ mdss1_dp0: displayport-controller@22090000 {
>>   				power-domains = <&rpmhpd SC8280XP_MMCX>;
>>   
>>   				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> -						  <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> -				assigned-clock-parents = <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>;
>> +						  <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
>> +						  <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss1_dp0_phy 0>,
>> +							 <&mdss1_dp0_phy 1>,
>> +							 <&mdss1_dp0_phy 1>;
>>   				operating-points-v2 = <&mdss1_dp0_opp_table>;
>>   
>>   				#sound-dai-cells = <0>;
>> @@ -5741,10 +5759,12 @@ mdss1_dp1: displayport-controller@22098000 {
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX1_AUX_CLK>,
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_CLK>,
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
>> -					 <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
>> +					 <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
>> +					 <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
>>   				clock-names = "core_iface", "core_aux",
>>   					      "ctrl_link",
>> -					      "ctrl_link_iface", "stream_pixel";
>> +					      "ctrl_link_iface", "stream_pixel",
>> +					      "stream_1_pixel";
>>   				interrupt-parent = <&mdss1>;
>>   				interrupts = <13>;
>>   				phys = <&mdss1_dp1_phy>;
>> @@ -5752,8 +5772,11 @@ mdss1_dp1: displayport-controller@22098000 {
>>   				power-domains = <&rpmhpd SC8280XP_MMCX>;
>>   
>>   				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
>> -						  <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
>> -				assigned-clock-parents = <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>;
>> +						  <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
>> +						  <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss1_dp1_phy 0>,
>> +							 <&mdss1_dp1_phy 1>,
>> +							 <&mdss1_dp1_phy 1>;
>>   				operating-points-v2 = <&mdss1_dp1_opp_table>;
>>   
>>   				#sound-dai-cells = <0>;
>> @@ -5813,10 +5836,12 @@ mdss1_dp2: displayport-controller@2209a000 {
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX2_AUX_CLK>,
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_CLK>,
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
>> -					 <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
>> +					 <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>,
>> +					 <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL1_CLK>;
>>   				clock-names = "core_iface", "core_aux",
>>   					      "ctrl_link",
>> -					      "ctrl_link_iface", "stream_pixel";
>> +					      "ctrl_link_iface", "stream_pixel",
>> +					      "stream_1_pixel";
>>   				interrupt-parent = <&mdss1>;
>>   				interrupts = <14>;
>>   				phys = <&mdss1_dp2_phy>;
>> @@ -5824,8 +5849,11 @@ mdss1_dp2: displayport-controller@2209a000 {
>>   				power-domains = <&rpmhpd SC8280XP_MMCX>;
>>   
>>   				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
>> -						  <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
>> -				assigned-clock-parents = <&mdss1_dp2_phy 0>, <&mdss1_dp2_phy 1>;
>> +						  <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>,
>> +						  <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss1_dp2_phy 0>,
>> +							 <&mdss1_dp2_phy 1>,
>> +							 <&mdss1_dp2_phy 1>;
>>   				operating-points-v2 = <&mdss1_dp2_opp_table>;
>>   
>>   				#sound-dai-cells = <0>;
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> index cdb47359c4c8..3a21a2e2c04d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> @@ -3894,16 +3894,20 @@ mdss_dp: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index f0d18fd37aaf..fc7c610c15d2 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -4774,16 +4774,20 @@ mdss_dp: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
>> index 971c828a7555..6a930292edd3 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
>> @@ -2872,16 +2872,20 @@ mdss_dp: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> index 54c6d0fdb2af..b0680ef30c1f 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> @@ -3431,16 +3431,20 @@ mdss_dp0: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index 71a7e3b57ece..226c457338d9 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -3545,16 +3545,20 @@ mdss_dp0: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 495ea9bfd008..72c63afe9029 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -5388,16 +5388,20 @@ mdss_dp0: displayport-controller@af54000 {
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				operating-points-v2 = <&dp_opp_table>;
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> index a8eb4c5fe99f..e86b6cb20096 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> @@ -5306,16 +5306,20 @@ mdss_dp0: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				operating-points-v2 = <&mdss_dp0_opp_table>;
>> @@ -5389,16 +5393,20 @@ mdss_dp1: displayport-controller@ae98000 {
>>   					 <&dispcc DISP_CC_MDSS_DPTX1_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_ss1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				operating-points-v2 = <&mdss_dp1_opp_table>;
>> @@ -5472,16 +5480,20 @@ mdss_dp2: displayport-controller@ae9a000 {
>>   					 <&dispcc DISP_CC_MDSS_DPTX2_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_ss2_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				operating-points-v2 = <&mdss_dp2_opp_table>;
>>
>> -- 
>> 2.50.1
>>
> 

