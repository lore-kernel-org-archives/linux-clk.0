Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949E93B961F
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 09:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159687; cv=none; b=G4o+Gwq5t6r10wbemzO940iLQcKe/UZ6aLZfJSYnwGjPH/kpTr6mvJLz2vES2HuFUzDBaqsKv4hsLzZUrSquWlPvM6JnuIaxaBSPxxBra2Vh4yB8IcR3V8rZpLpEoBD5XZc5ruQ1hUe2FJWg8hfywo+X0YZXMX4b+6Rl1I87CC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159687; c=relaxed/simple;
	bh=MSMc+Vupw6OBt2TRATno1Be0rh1dgFO8N5/ngx1YRBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PEGChJrp9eSHp26GPAqFX6Tzf8BLhYB/8F0ewYQp8LO7g4EoEOVP1bqSitBpDEaAG0kO56j+siAzk7ZwQrZjCDcYnGCMFggt26gbVPJct29mvb+ZcfJhIRjcydK76rgzhGw+UdEpdYT52CMwXkO1i7boaYsbACw2LCMVQa/uNnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzyBjo7F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ErkE0Flu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzyBjo7F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ErkE0Flu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6YCw42387321
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 09:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxi6YWyMlUMtQOxgVUNZ1znAX33hkHtx2uWIFxQzWfE=; b=hzyBjo7F+6LH80T1
	jScrahL/p/ngMgccM5cZfU0DYCqY/ei4+RNgaDc0WGLA70gCk91bsCXogbf93tks
	s1b9Ij0D07WdFwBskx+RBbOLlwnIRP+zN6GRbzex/mzw2RYYo1oj2VmLzWHxlPxF
	+hILN5uOi6vbTFTHd7j61elkhF1srUIf4OXgQKHleXLfdZ/2ZJYMX0icwWWyqUjh
	IdyDLyU8y5YdXqtnx6uTvu63uEal15/B4a7tI6x3wSO8stfAAjJUeGoyyIWcLdW/
	pPeactPbDoQvGmytjgIynF2xWfDCCtb08eC+EnzUUX9EsdniNcDgglSPLCzqDgVK
	2M44Vw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w24g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 09:41:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b33a19837so16723111cf.3
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 02:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159684; x=1776764484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fxi6YWyMlUMtQOxgVUNZ1znAX33hkHtx2uWIFxQzWfE=;
        b=ErkE0Flu/aRSo7nDgWfODyOAcCKjreVKmshisl5jfL9SMXpTzqNz5BmxU7UseuyY38
         MiIKqpwsMSQJVs2O6CUmOemeeFDu89S5zWCNWcbpYAGnw+9CcLCIGsqSVYXoe78OE5at
         f2+/rb+Jiu2jsNvNzeJJgEyaQoCoTpMIPVqGUmnaxwYDeeZ9wk0jYSiAwGn0MkmvZVPn
         SUTlBqB58XoWVQit8OhEl9i3sU/EJWNDGIGKZToZMmk7APFAl1GIA2EGwF6kV1/kbNMT
         GmQ82QAe4Jxq1YxZRMzrdb0lc40yKEcKCISJ/7AkRybZvKjgLvKKhXIRKum1hbQkssjB
         CYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159684; x=1776764484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxi6YWyMlUMtQOxgVUNZ1znAX33hkHtx2uWIFxQzWfE=;
        b=iwxd6QMFMbk+Rj5h1FVKn3h5E2IN2Sywb4TLSZBE6bpsRmMWIYu3kapRrFHqZBHjm/
         NeQaCmCnHZWL//33kjnVDkqLX+YXQ73059TSIR+xPrj1eh7Dvr8usO+fz1zzLWDKjkcq
         mXGiFVsp8ZSiyBTVSiBMGLrOWS2Qj6S9QHTd/e3uCnhERuY9I0hh0YYuPQWWxY3Xg0vC
         IO/rcyGWaqXQedOETKK5w9U+daYeZABJwao7oWC8UipWIf/qMJIiJnHaU336wd+wF5eX
         +v/L5TnzZ+Kwq5aTMnDAi/Ju1MpPYzQd+GsHuQaDIi+UjKhrKsr1AyBv9hTJqvULJDQR
         yE4g==
X-Forwarded-Encrypted: i=1; AFNElJ/ziHN0vheE/XGL5nCW48dju8CRZr5k98i2MCKEndxdhGIa6ARI4LRnduUHbFHXdcDmNrXjRzrkqx4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj6OCxXTbBMzu0Z3YRIT+jo5RE8gxBCI3n7TwY1/hCs43u5WKc
	RBnPqA4FELj1FDyP3nALPE1jFhH3oIiziMlGRyXAKXPNxuXInhFubpyW54kvUc/3YHd5eHjLM7E
	Vr5oaoKdPlWEreOpBQyjjxCxgTJtaaBwu33phlarzyjb73YlNlUGfGi6YmfjRkqQ=
X-Gm-Gg: AeBDievExI7lHCecc550A7uN4sSpXJrZbgUu89+a5a+w0A998aSL021bQzRs99sv82n
	5YSNJ983l58tprnua374TjM8/nnfN214aMxKG1JYdUlY2lOCLw/UGAa1BjmX02xMBtlgJncfM2W
	yrZCgDshiqc+U4Q9cL1dNNb/PY3V0Pr3ju/ShJvyMIjooebY0/fXCedBfmgIzwZvXaAQQ7+U6M6
	9QLc7Jq73q7TzhBfta9OELVcp1KQljV/8mQo8iK2XlYqII2p06dTYsnFzNOebsPFxr8fANGwlw3
	nXz9EBc26MUsMLsbK9L3yTZP+dLokXQW5AVzc3IjvCG/s0pdLzRRb5ZEr5IWxXXTbduGGYOqojr
	/I8edNk+4XqYkmAz7BDlcssDuPBz4N+H/iG/0fibFuyIKZn7t2BNmeJo2gLw0qA9VuSIfEgdm+D
	hayK/rSHvpjEPWhw==
X-Received: by 2002:ac8:588a:0:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50dd5c4f080mr171301271cf.6.1776159683842;
        Tue, 14 Apr 2026 02:41:23 -0700 (PDT)
X-Received: by 2002:ac8:588a:0:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50dd5c4f080mr171301091cf.6.1776159683256;
        Tue, 14 Apr 2026 02:41:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c89fasm384601666b.49.2026.04.14.02.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:41:22 -0700 (PDT)
Message-ID: <db41fea8-8738-42c7-8575-ddaca999620b@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] ARM: dts: qcom: msm8960: huashan: enable Wi-Fi and
 Bluetooth
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-10-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-10-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vDDUiBbZB435I9K7elU3tLvbm5QlD-a6
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69de0bc4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8 a=6yk2MuD3qlwx9g5reDkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MCBTYWx0ZWRfXz0PR76DuHS+l
 fWtNcb0o4u7OFDB2HZu1CcN8ehercg05vV1qRug+joPFjLwrTXJs9u16e3ac2nVl22+xmtwKmma
 lpDjK5P2o3TjqPMoLADeR/RTz5UZVMR/I9qgJCn4sDBHClBrrl+o+QNray4+uidxPZfrSp82Fm2
 XYcbfr32DMEBmcIVZsLg8TbTpTKHNgf2J/7UqDYZkTLF9J+4zxeZQlqBq9DvvQ5/WDe2Xyf6D9F
 +7Xo+n26cpGYcQIaW+dpF4LjwOJlhDut4TODd05PdK/PCUw9Pi7m4NVXeAeKF3RsWjSZ+CWDtg/
 zb2DFj8MpjaaMQNAXZ1NtY3JqryQ3kmN55+eePW9dCPOfT5eM3xQQkNjIgU8f/weMi9w5FULSPt
 z4d8GHB5yS7DLdrao/saG+8aGmVY9bVzSaSD5A2zIjR0AyLuTQhkkRTDdXmL4ixLqhLmsK5TsCM
 yupgn0IboUMecprM88Q==
X-Proofpoint-GUID: vDDUiBbZB435I9K7elU3tLvbm5QlD-a6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140090

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add Wi-Fi and Bluetooth support for Sony Xperia SP.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
> index 591dc837e600..79fa9bd038f2 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
> @@ -95,6 +95,25 @@ MATRIX_KEY(1, 1, KEY_CAMERA)
>  	status = "okay";
>  };
>  
> +&riva {
> +	pinctrl-0 = <&riva_wlan_default_state>, <&riva_bt_default_state>;
> +	pinctrl-1 = <&riva_wlan_sleep_state>, <&riva_bt_sleep_state>;
> +	pinctrl-names = "default", "sleep";

You can probably move these pinctrl assignments to the SoC DTSI

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
