Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15343BC67C
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030591; cv=none; b=cdECfGWu7KX9x9EfErnGIcQyKHI7Spd3aFhrptmr22zAFtGJr+6F05K/Lhv0aV34HI4BIdjTJj8VH9evO29tP6CrDWxIxSMptu+GijCNeeV92wzKp3rvicX2+A80Wq4x5bNWjhN3m2GUt6m1Zlc7fJiqoM/dKjkScE15Bk9ATmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030591; c=relaxed/simple;
	bh=kPMGUNNSmroYSsiqLoYTt4gz7zVsODQoZrsEYXDMkX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAAAYkXsMpnQMSKPNhdR1LIRkKwTkJyJhp7QuvpNhqaDUR9JNRB4W+i2NBMmxN84GvEBg5rY0pK3rmsR+VlVdPfbPs8SQHntlG+eWiDXFcBJ5MS+kxBbS/ILUPtGL2B31Ya73tmZ4DT6AmUVOCvOPtKq+wYtAm5Su26vL2Dwp2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLx4MBQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/Ngsdjp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OLx4MBQV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/Ngsdjp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7CBle1823612
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 11:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	szb/C/NuDvGqRRu1u78P1sc9wQPhVPl5cH0BZflLHds=; b=OLx4MBQVZcIfvtqp
	EyXnMunn34PmO6FdZqwrOQ5eJ7VdohfMBqrt1DIAgMr2uE8R3t9hM7eaLq2z72eo
	YipG+oORIKgtnonaVXYLPwHnQX3/gaAImzkd8WBfO4S9Oq0M1/zeMi6pBgzWRqvY
	wj0oPjcg3Xle7KGsaJt+w+smHfOrNCWSKTMu1i4CA51wtbDO6x7DWl9jBeW3+hF8
	mcrSBlcOojvz1YkxZZWCh6e4sMZxg6xXe6z3XnF6M7i0Il2qdAw9u2SOT2dt6KRT
	hIEgI4TMaxO5QOruwTXU4tLt/KEddekZOcaugBsK/PDF2nTLE7mkOXePdNEpfPvW
	lV83gA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqv5rtp4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 11:36:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fad7b0ae2so16641721cf.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 04:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030588; x=1777635388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=szb/C/NuDvGqRRu1u78P1sc9wQPhVPl5cH0BZflLHds=;
        b=T/NgsdjppkTMSp11a9U6JVNm4ynwClbtt+qmBTanaFnXqQizUrI7EaBBfkCZWhM2yC
         1rRH5fqrDEKMZ8qp77aCRIGt2HJ+BeY2I8flCVgAJPgObjsW6TymW+Qdsx/NPJo6Yde3
         pC/ZeGg/pqA5c5yhF5vCjjeKIzq9PjlsIC////+hKtTHQBE6b6NKYX9PCJH4+TQoxEMd
         9AmOctokE4pIF56on5KqBcWeOxOfJCiuB9TIAvr+2cHcBaM9SPtuRdxQW5PyNJtqG90N
         QxQWTNSI3kWaSsh3wgGSHsIqscdTFLViQYBnJ+wMCMiPNBzxT2OfciWMUQuuwa8ZNM0w
         /J9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030588; x=1777635388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szb/C/NuDvGqRRu1u78P1sc9wQPhVPl5cH0BZflLHds=;
        b=K+WbwXpqoDG6Djmj+8rFyyEmbyQqds/Ml93wrMZ31X5VDdvV/D01h2lc8sV/T5u6k+
         xWpaa/I9IA6fpivt+ir1kruJF2sqvAnQk4rkKjqR3SRbSRuLYhfFMQbrUF+5xYLx3MC5
         yf14J0xbEzb4U+eNf0AnX42G4mqeozd3ZVqGCekk9WX5aSxbo6pQmG96z/NownjARKnP
         kDQwkeA3PaHxLwu17zUcnYQbk+t54zZTWyWLExkGiXx3wojre+AIhrLcSAqMgB42QM9+
         9IkY3mQ6j5jll9pKF+2a0gwM0JwSHysB1buFs1tgdiW7vxqtFHpMyciP6V/nCu7K9gT0
         KScg==
X-Forwarded-Encrypted: i=1; AFNElJ8wV1TYGJhNaHE++dglcbPGHWAVTlSqahqU6eZDXzYxQL7b2qEiHlFdGAlXUP4r8nEfmifjiSkaWNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvH6w+OLjSZl6QeKJB6jlbk0qXZWOtLkll6LmtWW9mK64MQPyx
	xmSLEFfoj3BDQetNdg1sdRcqYuLm0+4lMFVMG3Phv0CL+rxgUlfNEVVBVX39iiRGpC3ysODzQCB
	QLCZih+gne7ZsZ+NNzrvNlM3orbhBuWqDiPGXU4wlLppM+yigfy9PW5DShHByvys=
X-Gm-Gg: AeBDieucmNIphSfpsJQExmrYhdP1SfpfIogEpXWyoaKI5s0iJZDHCCWhV0X9SHi03Xz
	In3Ve46g5MZV52QO9+mZGjO3MUEpNnoyarjLqWEij4Bd7S2zJkljj9I/GrCxWv1HMOB4GHCaSDy
	YbMPsm5sXvKab8B7xjRiqM4nUxRLtIfPh6eshDvILZhfDqHdK8I/NzSzM4nTU9mSd0wOf7UP/K0
	zVh93W3jHJNDgf/RlLO47qouXx4AAT+9M3xZGUbPs5LYXMHy2XI8mhDCKAfzDYWlWhz2/lWj5hO
	Swv+V8AxnEnr+/GZPupn7ffHS8+kerZjbK6Zz4gmvil8QmNRWzyo63W+2yVmqpMHX2CUJefLS5+
	FPgdndH2+XYBpBOJrieUkFxOjDN7dN2bbHdNJOIgkEmEVOMHRptmHm+cQWMPZ0SibC5WBkmsZjn
	IUUnSMhwmo5MFWeg==
X-Received: by 2002:a05:622a:1f88:b0:50f:bfe3:a04e with SMTP id d75a77b69052e-50fbfe3a765mr119513751cf.7.1777030587702;
        Fri, 24 Apr 2026 04:36:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1f88:b0:50f:bfe3:a04e with SMTP id d75a77b69052e-50fbfe3a765mr119513231cf.7.1777030587197;
        Fri, 24 Apr 2026 04:36:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe836sm4924815a12.3.2026.04.24.04.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:36:25 -0700 (PDT)
Message-ID: <cb1a8f75-2161-4273-8ee0-6d36058fb2f6@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:36:20 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/10] arm64: dts: qcom: msm8939: Add venus node
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <KV8KCGTrLcQnaBrdbcO-8yqIObRcqYTBQgEYv3TaeT9dT0e9phTPowW1fza6BV9LfqNc6ZORybdss4WGdvnUTA==@protonmail.internalid>
 <20260416-msm8939-venus-rfc-v1-4-a09fcf2c23df@gmail.com>
 <ac54d018-78e2-4f8d-97f5-3cfdb5151aa0@kernel.org>
 <717459db-479a-4a68-84d1-a718c8ba5a54@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <717459db-479a-4a68-84d1-a718c8ba5a54@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LqiiDHdc c=1 sm=1 tr=0 ts=69eb55bc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bAtGagR5AAAA:20 a=KePjsaevwCBX4e1EH2wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: PjPGWKJTBGXQICbv6-mAsEn2P1Wcrx9f
X-Proofpoint-GUID: PjPGWKJTBGXQICbv6-mAsEn2P1Wcrx9f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMSBTYWx0ZWRfX1nHfqg3FOqP/
 DbNQ3qc699LhqxkNfInDXzWjMtkU9ztFAvMKkfVElWmkmoZj1kRA5kid3hpRuLyrqz8MXJvJl5T
 j5YAsCQdTa0sU4BQcBR1WEFCmdplIwZeeRV8XNsvZ2Mh6kgb9QROsFaC1BLw/liQ6nX0Z2vakDZ
 44abj2Hxwo94GT47p4LMxcXc+0Bfqe0k4+bZMhf8rdBo93XmiXDMXllWRsSmRDfn/dTQXUlhlRm
 jCBSDScogTKvJRaaKKRw/6IIlR7lSQZRKq7+Rs/DmXH0f1oIfDlApKw2TY34/S98/WT7ZnYjKfr
 IaChLb1fuLn0WXWuInULm5+ef/MfNJmrW506Zj9Yc0UazNEVAsaV0x1EdfYCOkdZnfAHhDNRQch
 FUdrxcdzT+g2WAuPF08euBwyx3UFq5WG9BgC/6oToZhYyZw67dkJikJo1+HnYYy2spzW5HiGAEu
 E/CEmy7Tldv6i89uHcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240111

On 4/18/26 5:34 PM, Erikas Bitovtas wrote:
> 
> 
> On 4/16/26 5:31 PM, Bryan O'Donoghue wrote:
>> On 16/04/2026 14:43, Erikas Bitovtas wrote:
>>> +            video-decoder {
>>> +                compatible = "venus-decoder";
>>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>>> +                clock-names = "core0", "core1";
>>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>>> +                        <&gcc VENUS_CORE1_GDSC>;
>>
>> This doesn't make sense.
>>
>> You have two cores => assign one to encoder and the other to decoder.
>>
> 
> This way during decode only one of the cores gets powered up instead of
> both, resulting in power collapse fails.
> Core clocks and power domains can be moved into Venus node instead of
> sub-nodes, like this:
> venus: video-codec@1d00000 {
> 	compatible = "qcom,msm8939-venus";
> 	reg = <0x01d00000 0xff000>;
> 	interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> 	clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
> 		 <&gcc GCC_VENUS0_AHB_CLK>,
> 		 <&gcc GCC_VENUS0_AXI_CLK>,
> 		 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
> 		 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
> 	clock-names = "core",
> 		      "iface",
> 		      "bus",
> 		      "core0",
> 		      "core1";
> 	power-domains = <&gcc VENUS_GDSC>,
> 			<&gcc VENUS_C0RE0_GDSC>,
> 			<&gcc VENUS_CORE1_GDSC>;
> 	power-domain-names = "venus", "core0", "core1";
> };
> 
> And then they can be powered up regardless if the session is for
> encoding or decoding.
> My first question was actually about this - whether these cores should
> be powered up only decoding or for encoding as well. Bus configs
> downstream signify they are only for decoding:
> https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L1589
> https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/Documentation/devicetree/bindings/media/video/msm-vidc.txt#L35
> Unfortunately, I couldn't test encoding on my device. It appears to be
> broken.

Do we know whether it works on msm8916? (+Stephan)

Konrad
