Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433BC271A94
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659091; cv=none; b=Ar0IvUiEk/yPGIMX96gGkuWGW3vdrLBCZDJd9pMdZ2Xmt3/XWIF7J2ZFHYxA7Og/W8jWHTKVZTZNdFngEWg1cK5HQvhh25A1pFRrN4FWPLH5XLKaEB4K1P0LxbQIcrUREF+QBoFkZe+cn/caPWEoMjZa+n2ngNJuwa/u2ifXL6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659091; c=relaxed/simple;
	bh=esLUPOOWx2BE2RIaFwDSmG6sMCM1hS+EmMydfYN/tsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xfyi1Ewe/ZgSnc+F9jCW1CEpzs0hQen8vnQfXN1NxvaJ+/TX1TkbpISsE3POzE4Z3gQMcPkGgPLWMvnZSVaS35fqZjuzI2eio4AQLHxLDIAle0t6FEmrD5mMyj0Viv3ejDnEOGgYENcZyYSdLlBYq9bigs6iLxYrwWkXBU+rSi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDIKhuKb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9+UaOTH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDIKhuKb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9+UaOTH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64bTU662927
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 11:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7XllX3Ebz4hppz9fzI1VP/5MLoDsPPNQg3TBzEGzGm8=; b=cDIKhuKbKcmjkPnj
	4BNlBxp8U49u3fT5ASTNQ7cvUI3DMFWh+ZQyg4wgV0bIHzFX4qz5vZ2D+dU3fa6c
	MnHm3RZx/YHLWHwvUL7wyc9rxqSpMae3t8Bgyvx1lOe2VHqRjhIB50l3BviFHZCT
	VlO4ECTTKXfy+d+9TUkLc6Ja0w1a3DrgWjN3cZ61A/5D0c9wLa7Mxw/ArkjAbEzk
	GOXofH9sxZvUonU9iP/MJcQprQb2tUkjsyd9LZPUJD+eR6oMHZmflCr/4TgkQEVU
	8Cs9uGV3dhfMpcw7tpjjyDYnpcXZAHAt9sNI24MqSlMWirJbCZREdUCYztRiudej
	RvR3GA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw043nb7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 11:04:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b04db6c138so20351555ad.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 04:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773659088; x=1774263888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7XllX3Ebz4hppz9fzI1VP/5MLoDsPPNQg3TBzEGzGm8=;
        b=P9+UaOTHmskQ/xyDq/9ucmJGG9Stk3G/vMGp+bNWq+v+o55zkuxUngB4+ja4sUg06r
         WMjmIU8wSpw4R9Bj553uf0z+JCdCOx3c4jNfalKbMgQ0Dx/N7MDWkb6PQdCZNT4j/IhZ
         qwG3S3tZzuQMY+9RXQjmtUPyUUk1PWJIkMDbmQmejDy/Hhepj2DyYRI7rQ11BEn5uvUY
         6TH5IZnrDA/YGbWXSVpuvzob2df9C+8sVUELdYSZjln7Ar3sezKtcpHMyAZeJZToelGE
         1zuhSJ4cDqDsL3Ak3xttq2tz3YEUmXSyhjv2Qvu7K9vidWUvN3HSGyK1mdjAiY3HBGMg
         evSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773659088; x=1774263888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XllX3Ebz4hppz9fzI1VP/5MLoDsPPNQg3TBzEGzGm8=;
        b=U7EnQZdpP+4HxmP6tLCoDUyiCn6I+Qj9ieQ9i38EBb5NYOqpw2Hq3VLE9XWiVZeABu
         BfYEPsQQH8vK+UY4iMpLaGIGcEIXvTh+c+riDKVLfKff9I3hgMO2toUhJyhHb22PLNvp
         cXbdr9c3dxi/5bDV9K5w8vo0yniZeKBg3n4jNgHPhkYUO7HRVGGSBpAhD4b3CCywheeY
         jTtSjRwPbi6pbIhTkgjdl9+6IDFAYDa/+a87Jeo2rgIRLJPhXFGAC7bub7uYRfq5rYMK
         FAmODLYlejP1o8DT8Cwt9xsN5ViWbpmZmPoP89vsQVGEPCDStSK1syIX5FLiYk+1FjxT
         tcFw==
X-Forwarded-Encrypted: i=1; AJvYcCWPF19IuBf5EcnXxxuDPyWUNWynPe59qNklj94A1FlkoEAda2X+enW3ARVLQ7r9nskWpZzj0FrGP6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7WwUWRj+V8jIUdh3d5t/SOaEUDDyftA1+mggQP6ChqMRoY52i
	n7rTp2drBX5/gwiIC0ZHWuYt8MRHyaMuUKpg642hFRtQU82ue/17f2jHD/4jkjJOjTvGm4Aoz6z
	LqbCUDIZyrXlfGCN7D6Taw6gnGEI0xVcpkOiPQ/yVxCAcAxExBMSD92lRdAPlZk4=
X-Gm-Gg: ATEYQzyrpuA0L9tBz5PMILwgn0J6tCqE+UD0J2OE2e5UYU2/g9tpwDqmTqbxGJeQP9s
	InNR05XJz8tu++uqP/Zg7YxpjydkYHEVialpWs69IK0R9jlvuYmV+MyYdRQWgDll3D4umZxa7Wu
	wRJ7gR5JoOg4LEJG750QhLMyXD12p3p4d1wMXChQ+pFiu2QQEhGqG+Ysjy93FrDMBX+3MgZ3Bii
	zOS1gyFJWUzDV2WC3sfhsfYLEMP+lFcgeXW0iBSi5jET8RMmw6dMjabmVf83/VNUFixLHFJZsv5
	2rKwiJ9wjm2dmv/5JZtvKqmLRkWFRFw5oOqsNqUQq/1Tlp77wZbXjzQvzZjqwrCeiVHIuKEgjs0
	ACtfGULuznoHtJRuouc5whwWT0mf7JK4lsdo5RCWpfPeKFGS6/35g
X-Received: by 2002:a17:902:f60d:b0:2ae:5bee:f0fd with SMTP id d9443c01a7336-2aecac81c51mr139277515ad.51.1773659088516;
        Mon, 16 Mar 2026 04:04:48 -0700 (PDT)
X-Received: by 2002:a17:902:f60d:b0:2ae:5bee:f0fd with SMTP id d9443c01a7336-2aecac81c51mr139277275ad.51.1773659088059;
        Mon, 16 Mar 2026 04:04:48 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee1e3sm112165905ad.44.2026.03.16.04.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:04:47 -0700 (PDT)
Message-ID: <737eae95-1e86-4ee6-abec-5e313a18f078@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:34:41 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: milos: Add GX clock controller
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-3-00b09ee159a7@fairphone.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-3-00b09ee159a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4NCBTYWx0ZWRfX/b3yo3TaGuea
 KV9i1lDa7a+jqTLK1PWVCY04TcWOoRynf27hX8UeTEeK0uJUYLmUH1qAQBDROO3Xpfcki7ULqVy
 ojxmVlk2xzBhOuEduXVKK3YsGi0G+cnDARBbFWb4b822pyCza/Sbrb1iNWflgLuR6YtpjcrVpC2
 48jaFT5sU/SZNJb/IFpjMdXACsu2V0/dCbRhHG2795+qceoVAqqPgY3RN8bxLnJx/S4tIfnLFZS
 uPRUXt7Z4hVS7FKLBffNpGI+s0CZz11G1T6CXRilEG8pE/0DialYzyEAyRavplhnJLzrlSEYErA
 5iE/Uh3p+dfLpzlv4goYH5qA+Td99QHlxqOjf8yiRav/jEJtpb1J1yDiW0mP3RG23BFCxz3Ft6a
 lZmZV72vN8ctWVQBT6izu6ez+TXQh+xkYAYjXzSqVWYSv107WZtY2uJQWIyo3JPJFzOb2rHf4/B
 XAxTjvXkCtMmkrSIgEg==
X-Proofpoint-GUID: QfRuiN3cYRLrN8dXGDwrqRPIhDfzJe05
X-Authority-Analysis: v=2.4 cv=fLs0HJae c=1 sm=1 tr=0 ts=69b7e3d1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=fneQyfJuBaBqRE5tITMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: QfRuiN3cYRLrN8dXGDwrqRPIhDfzJe05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160084



On 3/6/2026 7:18 PM, Luca Weiss wrote:
> Add a node for the GX clock controller, which provides a power domain to
> consumers.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index e1a51d43943f..621f05820826 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -1224,6 +1224,16 @@ lpass_ag_noc: interconnect@3c40000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		gxclkctl: clock-controller@3d64000 {
> +			compatible = "qcom,milos-gxclkctl";
> +			reg = <0x0 0x03d64000 0x0 0x6000>;
> +
> +			power-domains = <&rpmhpd RPMHPD_GFX>,
> +					<&gpucc GPU_CC_CX_GDSC>;
> +
> +			#power-domain-cells = <1>;
> +		};
> +


Reviewed-By: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh

>  		gpucc: clock-controller@3d90000 {
>  			compatible = "qcom,milos-gpucc";
>  			reg = <0x0 0x03d90000 0x0 0x9800>;
> 

