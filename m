Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F016A420471
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 06:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664910; cv=none; b=ZupWncRrkxUFTa/RROyu6/y68/fVBmFcCoPaflgw+c8oDRIDR2T0+ASfATabC6j7n0hjMgZQLrqAGKYVLsaOOmU4TOf16/3lY83YI8yyQ7RUQOlSVLMB38/Itok798+CgFM5+dz7jAZ5EEPKBJd6hvJxDQpCRD2KkK6aLWsbWr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664910; c=relaxed/simple;
	bh=F7/0IZeeOkzFjM7LZzyFzgxagNv0Sd5Yz+Yx/xeaSUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZfRVL7k1L51NRxaAJN72YOPQwzdgAZuzr1f4nR+tU/xIfbqDJ/3pIjqCeUA9Vk/kA5xhJC3EEzeFktVHj9yzUf8m+iXdlwHev3NDZ8liF19BqfX4YylZBvZFPAm1CgP4cYf02PFcZp3a0X/n8QHMAPr/Ju4FX2C9Lep3s2AOLwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZfI66UMa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4dXK5oX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZfI66UMa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4dXK5oX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T6onGZ054107
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 06:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZSsa/ltcDiL56w1jFFIrM8y7FhlwxFJZTIphcSdJpr8=; b=ZfI66UMaKQJVqu0h
	3MOfB7OdWNiJXGesysBezRcUcr/Dd9HNYZrgrFVc8XgWj01cMlwKEq9BACjWnFQG
	KSkWr8KnbzK0uezN0EkMQgR3C3189kUg+zGjY7AtL7EVKax0d9ByGleDrY7fbGUE
	vRihdbd+yV2xo+xwKDj7OGFXXaJtAogDRlo/RB2NR6FydDVCeQnaKL0LVWyKCrP/
	dmZCadBHuiA87oBBtiz+qsDhS4KXT/3Mc56lfDVWtnw0Hpqa4d4KG7YpdLT2mqtQ
	zAmIOeMnKfTlT/uKNTfoWtWMO8L7rwvg2yZ8izI7j7+gJThFITGiksb6hntM2szC
	iIjU5A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h08e0g0p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 06:55:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1a439db36so2318112a12.2
        for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 23:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790664907; x=1791269707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZSsa/ltcDiL56w1jFFIrM8y7FhlwxFJZTIphcSdJpr8=;
        b=I4dXK5oX5MyuhwpDawoo91/R5cAnAS5mcVqo3ZWfuSVCjXAA16n33lCxZiUG59+GHi
         526js/viSU1fsTQ6vDzugq9JG1717h8MlrIe1i04e37JlIYF6Pq5me2OOcZlSp4U6QQg
         ATdGut8IrZZYIYzEcxmxnWmMUeLpXmTwKh9RrNZc5DoUlX9RPgkWCmbJKWuRMpnpbGGJ
         BedtANYZ/bgTrJ/sDtuyw8WCN0PHKJV2/JCQ2MXqdnCwYEmhujuL1XsViVqnOAuYonh+
         3KugepAsr9BhEkGOuPp9+YYfm3aEOSWLk+jd6GmfqDHtlDRJXfW/xXQ2/Ej7wklQF+eJ
         qXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664907; x=1791269707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZSsa/ltcDiL56w1jFFIrM8y7FhlwxFJZTIphcSdJpr8=;
        b=W6NsikzkWgnU10eMml8ncDCVKQxugwHfuYbqGnnARpk2boE4YPYrJgyy+zx/qZWagg
         vL1twIrLnx7q53zzokZ8xwal5zHH5V+cqwDHeMYWOkFJwg/tTmof7n1sMp0JixVSs/1X
         OBZmHVh7HrLkrmazKTfhegivpLHQ6KzaPgv5XDMc3H0b24TAPsebsByh/93DB6t4rBws
         usgFWBtulc8/qsXLAPqqalBZ3myJgKqPioaqJda/R1ZH5qgIA1vY1EOkC4ItD1miZT3J
         e1iaIyzvbgXw7PxaxtaisvJwVi6QSfzbaH3VYoClJe5+BpBjLIsJPmCFckPAQUbfVjM/
         supQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDSjyvhO6s/RNr1JHG0Ap1mINx23CBpLsdqVDneYOzLLWpD4CDh3iTuQhbpUuFJ1a9WRS6FT8EQhQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpl9kIohd6M6ncv1jV/7NTy/tSB3lG/adTZ2Ze3dtcqD8g8VLj
	/uFa4MZe7uwjRJYct6fgZrUWwoMflY1sUmNG8EbdEi09EJifjKOl9LgNx2dV3cUOBYyGr0i/HAw
	nRBAbQYpEcO0KGMscOk0221jf2NhQ5qKcOaPoDo3IRvjKjjc7VUZzXzOByQiW0jg=
X-Gm-Gg: AYBFou088FufgCijkQZH1pbflQEaHq3hmkUPV7PCiud8TpYP+eR0R+8gY5GndADR+8j
	qoclmOZRfYV3aH7dRXfSUEkcC6Tf2GYyeA+P5MN/GyL3mUQMPLRWLrEvG4koPXxweCBfDquVPvB
	QhMMxs+VLY37u6LaeTthttg8wMvtq2PVw8sA9oKgtkl//mGde9N2M1VCtv4qYa63gftnZJs+NXY
	onpvOB22CJ+hAw18o9q/APP/ZqE6curRXTdoKHF31eZHgha4DB2s2jcccS5RYABO74fk2p4C6I6
	1M8Odnj8xWC2wiZkZP1RFayuRDEemjYDYyoQ7Z5+H1/zFp2900Xt21OhzI76EEu9P0b/5Inug3H
	HpoaKnhC+VC9hEInja17krzA3gyJf32zwEwd10cuBjaoUcoVR0p+mlVfbtUFUu3GbsvTNck7ufI
	S0+Uj0dngIgWn4moax3XCF
X-Received: by 2002:a17:90b:288c:b0:3a0:d651:3958 with SMTP id 98e67ed59e1d1-3a0d65147dcmr7560086a91.30.1790664906884;
        Mon, 28 Sep 2026 23:55:06 -0700 (PDT)
X-Received: by 2002:a17:90b:288c:b0:3a0:d651:3958 with SMTP id 98e67ed59e1d1-3a0d65147dcmr7560071a91.30.1790664906414;
        Mon, 28 Sep 2026 23:55:06 -0700 (PDT)
Received: from [10.79.116.189] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49804220fsm3713170a91.12.2026.09.28.23.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:55:06 -0700 (PDT)
Message-ID: <ef5bc89d-3915-45ac-ae7e-da0aa1976c96@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:24:57 +0530
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
 <97fd5a30-9469-482b-be0c-0ed6da6424e8@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <97fd5a30-9469-482b-be0c-0ed6da6424e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfXy+uBN9kCgMHI
 4SbqSAe/r6+ExqjPnzjsFe9t9lc5GAvkEwH8pFCAbx4LSaisliLVUro507nzhvZO5xLzm3mv/C5
 0svaR0nfhc3qWPR98RQaSVwRy8Yumho=
X-Proofpoint-ORIG-GUID: iHhEeXcWlkPj89C4chZxr5eZAcR4Xarw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX3NR8IrKOHfso
 VOWvq+sEZdTL7nJYrpp+IOamjYUjZoi4XGuh+cGWEWhO6iSYdMbDvLkGwlfhKIn/RmHNVjgWAwN
 N6JoFRxdX4geLSYZXpwMHO27nNc7KXqhlXGGIdO51uGDmD1zqIeSuUdq7oLQT299hM3AmOboDSZ
 HE4mJlTytkuYSojJsMGnsZYdwaExVGtsJhpFvOy+HtE9CzRCo/CqNQP7XvvMhCikLlZx0Qex6Km
 jPRCKVhLxvAlMGtsNzN9a8FiXwZ9UMV2h1Wc1zZ/SnlHI+hSmJlLzS7mlBj+j6cI5QYTAHlUcLL
 smIMQ3TimEagwR6dC1TkV3O9QcYtBxzj5FrvW6xFdsxXQ/D/V+kw1JzWVDAe+4PRIkPX2ko3Xvy
 6sYAgqFI//fUlG4xmYi6qlTR0a+KRFDs4ja8YJm5H+ap7qxoHqjP4S3EH0gm2lASqezhNOywADC
 TQg9wlSMShuRsaxNwJw==
X-Authority-Analysis: v=2.4 cv=WJ7qzXsR c=1 sm=1 tr=0 ts=6abb60cb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PaPtSKYIirbzHVDMbN0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: iHhEeXcWlkPj89C4chZxr5eZAcR4Xarw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290027


On 9/3/2026 4:27 PM, Konrad Dybcio wrote:
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
>> +	soc: soc@0 {
>> +		compatible = "simple-bus";
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0 0 0xffffffff>;
> that's just "ranges;"
>
> [...]
>
>> +		qup0: geniqup@9c0000 {
>> +			compatible = "qcom,geni-se-qup";
>> +			reg = <0x009c0000 0x2000>;
>> +			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
>> +				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
>> +			clock-names = "m-ahb", "s-ahb";
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges = <0x0 0x0 0x0 0x0 0x1000000>;
> likewise here, you don't need to precisely limit this.
>
> Konrad

Thanks Konrad for review.

fixed in v6 : 
https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/

Best Wishes

Hardeep Sharma

