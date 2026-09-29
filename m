Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E61E39A800
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 06:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664668; cv=none; b=pE/K0HZTGUS1wz2e0UMTDJt8jibmycZm+Kq1ycubZJgexYeTw2gYNu5bRg3cGGCyA3LaghnQv3OMu5dnNHfZNY/ci3fYsgVUflqDuNRVizEOvMOK2nr9H7ZznaOWpKJGfUCCjFtd67JeeP/CHh9pFZP1ddOoA73LNI04YdnKesA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664668; c=relaxed/simple;
	bh=xBcsERAGMD9eGee+SFf8E3U4t25wa6AVynACUUStgmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWPqiu7MJM8dv1Ue9hwJaNr3HMCXXpI1njiptwXH4lULtcoXGBSMFzEdW4UGGLYy2qCYWbABWiILoipyns+QuII6R7vD4ClQSZSOTLQ5qv+nlOHMjEz1sb55YRRN73EPsb4IBQ5tBujSimZ2NeCKdLA5+DKeyA13QWLsenPmnLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nn1oTJqZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=atOMOI3L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nn1oTJqZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="atOMOI3L"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Ll42775234
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 06:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ETLrKADipHnQ0SvOXNNqJhUBO4FGwFDlpJ1cHVM8gQ=; b=Nn1oTJqZKgpL34gB
	PYd6lvc9jUtOrzbjx11pTeoFrNmIxW0en6/g71KyXJ39sqFDHbGo+3m67xNCmTpR
	2mgvv2L2qO/RtMmJ1afjOzAOjbv+lTkgTSS38pdoSBL3rvCe/ZHwegTryIPfDtZH
	SCZ9v9e/+7uRFb55nJlWPu+65DCT8HKA61N4fHPjCWg2biLYIIaNzWCY+sX530EH
	KYg+SFS+785CLIpvlQBejGqM9Li5S6vI2b76hHK9tPk8eU/siHnaW3vMKyQm4Wq0
	ndPKEVAhMCVPJw7dUNvyPVjVPBKiKY7/OfcDss5JTGsfnIhKHo/phICgg6f+R6kk
	JPbsUA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw22n80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 06:51:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-880babf652aso648303b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 23:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790664666; x=1791269466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ETLrKADipHnQ0SvOXNNqJhUBO4FGwFDlpJ1cHVM8gQ=;
        b=atOMOI3LzLpcYZDBF1czx7FzQ14ZzzWCbOUmsuquyWyjXWzqYRyuS/dsjAV/OKN49H
         nb4UbPHuz1qteIL0m6OJPc/f9TrrXSC7dyiwxsxTsD4VJgP++6MG3Pdy2LeQxwwTNUzW
         MhMH5jZIMT1csecNWyypi5JtbFmdvgklfU+BEQ+HQybPLrLEBfMbpmpfP4NQD8XOEnM4
         FaPx+mWd8lCkvOeGXUrzbz3jG8tf/lVwVs9ze85sSfMDJAxn1rpUQlRjsO3bHuUCWTLb
         YrjiHpMj+9xCuVaojgieWvGEVydTD4deFqPT/TnF+AFIDF1adV4UQpxXcsHMUvvXs0uK
         g3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664666; x=1791269466;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ETLrKADipHnQ0SvOXNNqJhUBO4FGwFDlpJ1cHVM8gQ=;
        b=JGMdwsKERxr1/lWsk4KQrUWHs4mvklyrzfD826OVZrsqpslhS76xJJ9L/ROv1AvHlj
         y1YohzYi8Lgx7vTARPT7ak4bg/h4X254l3xe2/bxSQIlTR2p/MEszfveV1Y7sF6laf+Y
         5ZxSF6XRtJTKc5n2VrG8e1UIyBMQ1R3v/n255kxDCkEtXWWn8fLTiGob9h0j3DTmLlY3
         mh0PQH8a1TmWbf2vqN1yJzZT+7p3/PuPV9fOkb3MEuFdXQMRW6+d3ieJ9rn04hys0iJW
         8g4ObgrlcmqeqFhi16hXKz8seyt+RCsc9E/0a3NPUIn6x/UL8E0jt05VrObcFCQZuDBc
         ZyuA==
X-Forwarded-Encrypted: i=1; AKwUvBzzAOpx/kUYgT4EWhvfbJUoJ/zr+ZlR+pBVv3aLyG89CFlUHlyETqLxVWhtITKH474Mtj6owdXeMyA=@vger.kernel.org
X-Gm-Message-State: AFuF++l3lwnbfkNiXs96Qd0MheglVIqrROxDJ2FKRMUzoIPnDxIMYFn+
	93Vmb6YxlyGTvxDINbgSR/OTCMTX9huhGaS5ZO+Rq5nEwWEAU+cKeeVY3PP8Q8JItelJRpA+37c
	KRIUhOdUsdgIlZXSlzF+ozm4bT8gxx89catoecj7ccWHdlAv1ObxbTcLdQWPODug=
X-Gm-Gg: AYBFou3EnqqAlQvUqEwC3Mj7la7fnTGJfhH/zeDq7+0PuvLmn/fFY3LXXQ4RLdOBKd7
	ORhsTgc492ca0uHz1/Sjsu/ztyh1y4KqpsTcTNlwEgW8HEOXaJJX2PNacGQTWdOfB34u6cTt+Gz
	wt3yrU9EJpuQVKhWtJCfFn4UQUOzAYWwrTRTuAwS3tquYpLxnuIHXJ125JBr35334CXd90gRnwz
	klDxAia1H3Uq3QKnJ3eT3fG3S61S9PNCe8+3AKQfJDebWOqU11Px9TADxdfPKpuP6uJbcUQ0Mcm
	gyDTnET7sb3wdxdb/FSmGoekHWSOE6lupgdETW/T1ZRF7lZeSUkogKIr5o3IdvTcT5qvlA1p3b1
	XJeHNoyBEZ9NX1+gqItzc46ao9uxYrL3YkjauZp1VYVJoz7sRpaH/uR7gwOiBAGcjp2TCSiJkoD
	T4gsmFq2jEvc4Exa1uiydZ
X-Received: by 2002:a05:6a00:2d25:b0:881:236b:748a with SMTP id d2e1a72fcca58-8855fb8b546mr1025621b3a.16.1790664666075;
        Mon, 28 Sep 2026 23:51:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d25:b0:881:236b:748a with SMTP id d2e1a72fcca58-8855fb8b546mr1025611b3a.16.1790664665618;
        Mon, 28 Sep 2026 23:51:05 -0700 (PDT)
Received: from [10.79.116.189] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e28d7d23sm258534b3a.56.2026.09.28.23.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:51:05 -0700 (PDT)
Message-ID: <186fbca3-3676-492f-9c8e-fc7a75d5ead4@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:20:56 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
 <1a167d6f-2dce-4d06-a416-9fd1e25c69a8@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <1a167d6f-2dce-4d06-a416-9fd1e25c69a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb5fda cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PaPtSKYIirbzHVDMbN0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: dVQnNkdpdNXbE8K2fn7TbxHhy4CkExlf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX4qgvCBtX3cwX
 8Q8qA8xnjMksn8o2k45/Paoq95mfycSsirzJ04DZ7QtaNxNJ9SqpcyGORVWJz4mx4DDloiaNQjL
 H0ZMi88vrzDn32xDq+sWMQnFwKU7LrxsHabp//mk7nOAIpxY2KoUhSn/rMTyQGRr5rBjW3zFwXG
 fLVT4tRxywVshCmyknouQoPfC9C7Mvx1TBSSbgcCO9laSokkBb71S9VT+yz4UsWlmFKGq4uPAGy
 PrAt11Sq2peJUGTEfPj5UPhOFbyqEsVXZPpjBAWo4MTP+oyBj0Nps+Zb9D7tQ1Xs2PekZ962ZBn
 W+lpC4rsggnwVvFrEuNiSDNQUMeT+vy3hWxGlkZpxpYiegxvkY4QT3jd9V2uqK4ru4WG9MWYfpW
 kXPcCTRzdCv6LlvxO0ZfokGODwT9cQ2jEtrXmVSVgjg6LG/lT2ZQzHqVmh1m8ywdYoK2uW08ToH
 F8SQwDnsWza4e0RXAEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX834IVgalktgQ
 3hKsAy4NEoHzgS3pZ5DahK8SfCHoa8ZialdGpEl27JMPIRYGnRd7l7VdPudC8utbj1lGBZLGAG4
 jQLWHPvnMSFpjEnyB1QWPnhWTX/ClcM=
X-Proofpoint-GUID: dVQnNkdpdNXbE8K2fn7TbxHhy4CkExlf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290027


On 9/1/2026 9:26 PM, Konrad Dybcio wrote:
> On 8/27/26 7:51 PM, Hardeep Sharma wrote:
>> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
>> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
>>
>> Peripherals included in this initial set:
>>    - Single Cortex-A7 CPU with PSCI idle states
>>    - RPMh RSC with clock controller, power domains, and BCM voter
>>    - GCC (Global Clock Controller)
>>    - TLMM pin controller (110 GPIOs)
>>    - Interconnect (aggre-noc, cnoc-main)
>>    - GENI UART console (QUP SE3)
>>    - SMEM, hardware spinlocks (TCSR mutex)
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
> [...]
>
>> +		pdc: interrupt-controller@b220000 {
>> +			compatible = "qcom,kuno-pdc", "qcom,pdc";
>> +			reg = <0x0b220000 0x10000>;
>> +			qcom,pdc-ranges = <1 148 6>,
>> +					  <9 156 2>,
>> +					  <17 164 7>;
> GPT reports you're missing a whole lot of entries here and that will
> lead to the wakeup GPIOs silently failing.
>
> An old local script suggests this map is correct instead, but please
> check yourself:
>
> <1 148 6>,
> <9 156 2>,
> <17 164 7>,
> <26 173 1>,
> <29 176 1>,
> <40 187 1>,
> <46 193 6>,
> <52 266 32>,
> <84 249 1>,
> <85 256 1>,
> <86 315 4>,
> <90 43 1>,
> <91 45 1>,
> <92 154 2>,
> <94 158 6>,
> <100 171 2>,
> <102 174 1>,
> <103 23 7>,
> <110 147 1>,
> <111 31 4>,
> <115 175 1>,
> <116 177 10>,
> <126 188 5>;
>
> Konrad

Thanks Konrad for review.

fixed in v6 : 
https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/

