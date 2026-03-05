Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC247396B6E
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772711829; cv=none; b=pX/FIzhFnuT6KbWBO5srCgN2YCjS3p//mzbCIYmt2wvacCFmpAde0bkw+5sd1gidnUR+YZ8pwHq2ndZOiEp+Z5a9ORrBK+sqRsKzMPJYpY1vwanlxyNvvfVKQm8vdcMbmMqS1lGMajOoGqGcAqdqXBNMtM45aXaNS7pLfKCeJlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772711829; c=relaxed/simple;
	bh=ywQR8RudpyjuQ4ua9m98nW27zxDvWYAOmFcOPd1cmuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOT2ZSvYaXaX3QvJPwcKhRMAaCTZGibju2aZsZcNYQZ4nAnmEKIFCsIJoqZsUXTjTU4Bobv/2zg8LGTichl8YhRG+LyFNFtakNnSpttgRyK1CUCmij0IhZ/UwMJE8/k32iQza0RPeSDb/TCyoKYbF3cARfwjE5H35ClM07n/gyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1Ah8Krf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zw3tP/dU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1Ah8Krf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zw3tP/dU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFvUb450544
	for <linux-clk@vger.kernel.org>; Thu, 5 Mar 2026 11:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oMWGh0Yr/4YojcEUszF8lrbKoqjtdVISzX+uaKBAjlo=; b=n1Ah8Krf1gXp4q+6
	g/cxD1bGyzwXDDudc3lu/vYT4xKZWu2lZTGBHNNFJQ4Zes9FNXk+YXGllLLWWiGE
	vVjF0r31vVkjxCrOqJy+Q7i47bb6L5Hzms6OHnBuYkjGVTJA7cFjFNv70sGGrazP
	n37wZ48ssVRMvgFwpy2Nvq9nGfrq+MS1CBFJNPb7Z3KaDTh1VZzQxBoDTryYzej/
	bVgt++Ec5IEGCB35wUrQmw0kIUwZa0glUkgzLTrOMd4qwFnnQioMfn1/fKqH8VVc
	F+st49R0lCLOQHjHNU2mWpk2sm07y0vIn+j2H1JlC22VxchsgjONRBsbvd3OwTuX
	ifSFaw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj184hxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 11:57:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a012f8ab7so26137496d6.2
        for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 03:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772711826; x=1773316626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMWGh0Yr/4YojcEUszF8lrbKoqjtdVISzX+uaKBAjlo=;
        b=Zw3tP/dUlRki4wzvk1X/Y3KEc0S0Pzv1KN83PR1PB496gVSeMzuOuY8Y6l/Wpw1Oad
         wtJs5i/NUlsz7HVo2+H8oNsNcu2CJGfQNwlFZVJIZInwhj+G/oFgPM0ss2ZA2RGhbmUf
         Ooee/03dPOfKu47x3CNkN3vwv5DGCpjDSM/kpF60zuGnseGUr53U1UY6b5dFS0KHZv4R
         AasoQ72qvC+N+e9k4tMRKvDy1yg+52hsAZoru+ehUNedTveeVa6DRHTuzrVClNX1c+6t
         QAtbsSeyiBQgV1NuLB2l/hJA1TsDNjKDYP1XcKlUu260AUXFK0599mTDxjRlLeE3nXA7
         NQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772711826; x=1773316626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMWGh0Yr/4YojcEUszF8lrbKoqjtdVISzX+uaKBAjlo=;
        b=kNH8eCZRcIqL6MlHrtGKd9q2SqvH1NI1pVj9fUPDAaq+IKPJPX54Z3FVJ6ajORBo7g
         veqnqYCaxvUkRvI7C6yE1Md+cqC4weCJ78PSA+FYgSaB5lcpUV6Bb8aH4Fs7Ijhu3Nsk
         /6O/OIy6D5LhjnkF/mP7ftq3x1BAUrLq8ByEQTsOc6fcmFVMtDtEBNlBVN0KxSB0saj4
         uFYOPxCB5a63aMMc+dRUHf5V2MlyG1TbkEVjqEi9Mh2gpyBxWr+SHthMeiAjFve/J3T3
         YA46Lw+PHBE2HcaM16Zn9lBuh/wJUwXGN9SKAB/xDjIklzSrw7Uh/Z4Orv4aqLCviJoh
         xJ2A==
X-Forwarded-Encrypted: i=1; AJvYcCUExodEBto4V06Pd+h1XZmTJG88YbsR1VVBekAtS03/y78pBgIoz6hZFJ60p2u13mJIPe03T+5iXZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzevhvgYbWvgj1D9dWLjxG8JpQR5OpgmGqC88XEVFCuTgdFwzPd
	8wgaehRTM5U95p279h0UNut+DSibG+gRw4dXnA2/iQS/DWxp/B8A79VHFnysw7d0bkMhok6eltD
	i3K7UggJMq35qhxOd+G1qDOZVXZHe51iFHqNuKlAdE9AYOUujXWpOhSTCk5bbk54=
X-Gm-Gg: ATEYQzxWy7/iC1b6ndoxB5YLeV3qWzJUw/MAHg+rRGfA502VK3Ezxspq6Y0ruCK4syH
	kqXkDQus2ECj2i38i4wzG/OUmJOjYJYYKcQrKbKfO+J6cmxkyWU1yqnF0a6UGGbGjGDz72B0gRd
	Ab059QBmDKSy7HJ/H95ng6nWRi4ENYZa2Z4ecbF1unrSCluLWmQU9bO4JZhrP3gMKePOF7sgwoS
	RQ39MfXhh4hgwCsXNUTRX5sk8e0Bth7dOFXU6QLA928ZSm2e+qTe4CAZrj9aEEukq9Vf3kb6ig5
	epVVqb36DleANKApOgLWc30DflljjKdcRLpmB1AoJWFDDepv+KXkBbhpWJTxo8clrpx/ONNo9Eb
	OFjr7dolCRn7TiDNbrmbccB4efLC0OBAararlLhgB6gazUQtBljYM8xTjebOfCTT1wXx0u76bdL
	ksznc=
X-Received: by 2002:a05:620a:318f:b0:8be:6733:92b1 with SMTP id af79cd13be357-8cd5adbad4dmr523868585a.0.1772711826304;
        Thu, 05 Mar 2026 03:57:06 -0800 (PST)
X-Received: by 2002:a05:620a:318f:b0:8be:6733:92b1 with SMTP id af79cd13be357-8cd5adbad4dmr523865885a.0.1772711825797;
        Thu, 05 Mar 2026 03:57:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9410131465sm68249966b.42.2026.03.05.03.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 03:57:04 -0800 (PST)
Message-ID: <c37b0fd4-afc6-49cc-a133-7f8334a16cb6@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 12:57:02 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] clk: qcom: videocc-x1p42100: Add support for video
 clock controller
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-3-dbbd2d258bd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304-purwa-videocc-camcc-v2-3-dbbd2d258bd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jyWfrZgn7Bt6a8DGcDkp2RXsGvusuQCQ
X-Proofpoint-ORIG-GUID: jyWfrZgn7Bt6a8DGcDkp2RXsGvusuQCQ
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a96f93 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rAeN3jnYVyXTJrfZgKIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA5NyBTYWx0ZWRfXypMOm2akT8LK
 WjidQAX33KwLI6JYFaKVhf3hGaRgp6rs7W7KYLRclZU1OhTfXoqYiuY2cWH+k3TKCxOw7r5vi2Q
 525Zufr8nLkaiyA+EP9lJ1EAPiyESNr8H0NaCPrBOQv9ffmd8XxNydo04q4Y3yWV99mDIf0qgGg
 ygUluKEAQLwon/Wh3b0iOv+0mMh8lkWH+i/dOiqfGVROggDbJzGAcsZHSJWXjjE+Wic6cZ3Rw0k
 HJgCKWQ2BYystQsCFRAoifuG9NIbp3urZXrS4N8I09EuDb5Z5IVl7sazp1exnlx6gVnPmpEkK+z
 Y3uyLrVV79MeIFZ+zU+khQoHjgH6ooiD5HaB7smyV+Seljr3f1VjxPIKPmVDeNmuYDwkcOiahAU
 BY7vnndG1Hh1+tBjgUE2bGv9P7Fg5tye4Wnzhbn2P8ikW2gjtRPLqEIYwCb/Wq1S/c5bk4PG3ux
 +msYaXRiN/kCn20O54A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050097

On 3/4/26 6:40 PM, Jagadeesh Kona wrote:
> Add support for the video clock controller for video clients to be
> able to request for videocc clocks on X1P42100 platform. Although
> X1P42100 is derived from X1E80100, the video clock controller differs
> significantly. The BSE clocks are newly added, several cdiv clocks have
> been removed, and most RCG frequency tables have been updated. Initial
> PLL configurations also require changes, hence introduce a separate
> videocc driver for X1P42100 platform.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
