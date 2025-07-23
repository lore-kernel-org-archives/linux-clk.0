Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E752E7F22
	for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 13:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753277644; cv=none; b=qCRyfBaH+OQ+E/hgxGKZ1P3VDJAUt57t7TAWZ3WK6qT+VtQQn/RVGRJ4w0XXzIfONEOqmvHWfE2EJpNsS4ceWTOsTshPlG3J+kKdXNOXPdfYvl18vDAUcOM4oYoytX6cWmJISLEOPFfZ6eLTQlA75G58VQzuVZkkK8jbDxDI4UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753277644; c=relaxed/simple;
	bh=I/HwupANQZNrDN72YfoYISTR/jnhtFvcCce7OTyzEPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=D0lIGOPeL8HGBZMxZslG9LbvkAZS0wVhOuoDNNP5zsCPZcFApbC8nV1CBfPi1IFgE7PXwQl7Tl9lDE1+DJnwZrh0NFlf3VlZrDgMxw+V4A5mo4kBrJalKL8aOQocaMQv68URdyX6TQnk7EM9zXujMoyXq7N88HJ+ROJgdygEN+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQUR6D7s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQUR6D7s"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9KxE9005629
	for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 13:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cErycuEc1BPG/yLEfc2IRSm6016iTOA8t+hzUspH65U=; b=QQUR6D7sbLdLbO7d
	yk0ql2PNHiYYPDXcKRtlvJXdUeyMAX3dfjIr6QyFopjtEXCHWPxIDnXR5/PG3mPi
	5Se8D9MZ4f6/CRj8oe2kwsJCm2aqBIzXcdwcc2Xxyyc78f+1DHRFfmKJvE+uBHAG
	4gSa6iBRSdidOG3jn8QLG6w6DtK9dRGg7Ey92LLo1V5kwUnOgdSXDVRzGU3UL/cJ
	PpaVEhWllGgwv7d5V0tJLBkuv6UIDh2k3QBC0bM+1i5ZK2LYp35khqrADTVs24w4
	ules2YRfLEqpH4phg8zWziSpbgKWdnXSCnqmlD9x2HWepMHdeAkbMiFDOQX7T/Me
	kJNbjQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ubtxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 13:34:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4abc1e8bd11so16003271cf.3
        for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 06:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753277641; x=1753882441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cErycuEc1BPG/yLEfc2IRSm6016iTOA8t+hzUspH65U=;
        b=ajptd9c7jwBGUe2rhuveR+5o604J0JNr4U9otef/XD7N1mHnJ1I9rivbHf1/qtmdNx
         HrJ2RMDTIlQc9hUhaBV35FciK/u25tP0l8gIOo3Q8iW/P5MgIVkVwvuicMJ26Xy6N6xz
         Meyg5kp9xYURlIwkhNjMAoh5KJSIRrz+N/u8HkZgWn+7YS/irEE7Y+VflKHxt1jpYZXh
         cLOIus0I5FjVrJpZMuAZWyKSILxhwrz6bQmQb7avFHk+To80caaHCzk+1nTVqamG5UP8
         0SSKTAzeEbxMosVudq5oNMVOzGXcGGuaoWYS4Yq0cdmWUj/y/wINGHt5/zNBwJC22JFM
         jjUg==
X-Forwarded-Encrypted: i=1; AJvYcCWdmG82xJ0Jv/eSRxrdubMbybN4nsI+sy0y29ds9jpxzfMJMpXl+6RDV1xQflBKrkVEP6XlIIw4DmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy99qH5x7PtfvqyiSl+qJP6imF2JE5T/i8MUsPBBvsgelolpfVb
	vJRol0Aps+oZI6/cO3sblLCef/SAVvwgi8R4FRWCUI/XEAN9zcHbuo3huWlWsze/QpJKxYMY2Rs
	IhwYB34YCeqmrWebKRtT3CzSKutccaK2oRZvhEJLbKvR7zk7ctZYtGFRfCho7N50=
X-Gm-Gg: ASbGncvZgRQw58fBCYhQ7L4nOlMoWMYX1eFYhpvbfUfBJ9MdWM5D7jE4twTF4lEiNnk
	ChHsHm6BeAqEFI+fQ6ca52JfyuZJiGjWLXu35SxNjsQuFBPYvX/4sKTp5Iq3gCgdcYh69TOIp59
	3DQYzmWH9zgvsgXKjVojzjwLt8gYAcWP+AWDH6jRcC0g/a3H9x9Vj3mCwKvpfIg4HqWs8W6d7iN
	ae/qdN77JYv07A6pXgxaWXIIdVG45QLRhS+30NaYnc5jJJCcsG5DN1MP0ry5AW7EuqRSbj7s5Yv
	9Dv/4hQWQZzR+abMz0A9dC746Z0umvN6DwA4wUEc3Eia8o9rqaBC3NvB+hUvvce9NF/RcbxM3KR
	lr2t91TgtOznmdhB7Zw==
X-Received: by 2002:a05:620a:48e:b0:7e3:3c61:564a with SMTP id af79cd13be357-7e62a1da96amr124748285a.13.1753277641266;
        Wed, 23 Jul 2025 06:34:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzYMNLS1GUA8u7+fQK+6rKxw7iDDU93TXDtPnP5+2dDFuZKetwr7kiUpYLhhOQk9KpRqg1Eg==
X-Received: by 2002:a05:620a:48e:b0:7e3:3c61:564a with SMTP id af79cd13be357-7e62a1da96amr124746785a.13.1753277640829;
        Wed, 23 Jul 2025 06:34:00 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af244a659a4sm236451266b.22.2025.07.23.06.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 06:34:00 -0700 (PDT)
Message-ID: <277971b8-09d5-444d-b0eb-1e658b68029f@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 15:33:57 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: ipq5424: Enable cpufreq
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        djakov@kernel.org, quic_srichara@quicinc.com, quic_mdalam@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250723110815.2865403-1-quic_varada@quicinc.com>
 <20250723110815.2865403-5-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250723110815.2865403-5-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=6880e4ca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=R0CBZZInQid6lz33ABQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNiBTYWx0ZWRfX4kS0HomjEmzm
 wUuAzrWAZsfT/6eLDXxPXBZLW3zlQ+SegJwrsTl75LFc3kJDuZ2JUaL3LMMO1lnD9OmvekWh5ev
 WkwyKq91NFBu0E3EpRfLnrLU6iIs5wOUv+9tdeUQ6SmHnq25DrE8BVplyH9+3N2HM8pUEM/IcHH
 rn0iVvzSwtwiXbf813gx2WH8CQs1dN7JixeMj3V8X7DU0h1Pd/12mWdPlCA/8ZobSZoyQDHHuyN
 d+JggSPHQGOTp8Tmy62ebfpY/4Dby8oTgoUFj2HIpQ8c6FEtBQaSk+a6deiK2sDBAag9TGGFj7N
 QmC2gMczQZQhH/E/3A/MJO5+ciMX6xCgXr6lfReIB2SFzHcg2/GKxzogjAPU3cjLyhNUujqWGnp
 eYNpENW1YP5A4M0iRfeB8f0PsQrO0xpaVcwHLkzaN2Cx8mSLUFF1NhcTByo7DZ4Y8mtzoSSi
X-Proofpoint-ORIG-GUID: CsfHD9w8KHnSZV4HLLrlghnKUkms-Jp3
X-Proofpoint-GUID: CsfHD9w8KHnSZV4HLLrlghnKUkms-Jp3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230116

On 7/23/25 1:08 PM, Varadarajan Narayanan wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Add the qfprom, cpu clocks, A53 PLL and cpu-opp-table required for
> CPU clock scaling.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> [ Added interconnect related entries, fix dt-bindings errors ]
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2: Add 'interconnects' to cpu nodes
>     Add 'opp-peak-kBps' to opp table
>     Add '#interconnect-cells' to apss_clk
>     Remove unnecessary comment
>     Fix dt-binding-errors in qfprom node
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 65 +++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 2eea8a078595..39d394f49789 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,apss-ipq.h>
>  #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
>  #include <dt-bindings/clock/qcom,ipq5424-gcc.h>
>  #include <dt-bindings/reset/qcom,ipq5424-gcc.h>
> @@ -52,6 +53,12 @@ cpu0: cpu@0 {
>  			reg = <0x0>;
>  			enable-method = "psci";
>  			next-level-cache = <&l2_0>;
> +			clocks = <&apss_clk APSS_SILVER_CORE_CLK>,
> +				 <&apss_clk L3_CORE_CLK>;

You exposed the latter clock through the interconnect framework. Now,
every set_rate/set_bw call will be fighting for whoever completes first.

Konrad
