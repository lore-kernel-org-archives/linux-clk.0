Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C372A35A92F
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333604; cv=none; b=cr7f6t++/7EqjQxfa/0mofZ0S21py2mduEyaij89l4At07iLIZTBfJzhYwLbfled+RQbC9ZS7JXAxEWNvDcouZ9T7urzLbej0ar+KnE3/3bW4b8NmcNswt12GBIhnSwU/JCdSU1kWbLP8pdtLc9DCuNqnb4QmBCeJDvbf2j5gy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333604; c=relaxed/simple;
	bh=XGDYv8+ChssJeftiwtVClAwzyktY4ZH7V/vRcYP5oVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QNz7VRldyMmltYlZdqDf/pLxfjYHDzz+E5frwsIKHLsf+XRZqAOU2ApE58PVqN3TLSSGVT98c27plKATrp1V5jCDOpb3be3iavaV5LNDONb1jaFn2tgj2uOwIMXJh4zfe/cw3A0wvEOXYh/x7HmERhXTJxe44tv8dfufq2+KhyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yg2j5Faj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MEq+Buc9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yg2j5Faj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MEq+Buc9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HAcifu2803225
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VdOaicgS1QlU9kJAG8SROo/OuWOziM8P6FqTRQFlr2I=; b=Yg2j5FajEkyzhS/n
	+2ph6RNeY1ywq/V78j8DaUgd/yFVMoXmEcRlISNXYKvdQl6s7jBImNMmjy5sGBi/
	Jcgzb5Z1U3RfKV+V1h11LbeGdK3ZmSOqOpYcZYkjojdD5udjCDrnVCUM5CjCzXuZ
	Q0PrVayx+sE+PotecvOVIHL/vHJMvREgFZQhnI/f9Ayaz/QWqWufh7CrUNBghRJI
	QdgOTEVjn4sPlCJciGGdHk6y4AwKIMO5NVQiFw6KNsudJa05kI85KYUm0mRZDtgy
	iZuPmA5G/3DIQVsyUF0EjSahjWmEhbM1oMttUxPiPuD4CKEZU0SCKkvmPI3uUmzi
	xctIvA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxukhyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:06:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70c91c8b0so334351985a.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 05:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333602; x=1771938402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VdOaicgS1QlU9kJAG8SROo/OuWOziM8P6FqTRQFlr2I=;
        b=MEq+Buc9j0EccU5+q8/tKwfqpp3P/WUKuhe7lazsbPBS8Qb/SprV8oDNE+v3Ql7pW/
         8VE7QxG7VHxmTKm+kcaN6BLoP0oMc1Ke2PfBJxnuLYewt8F/GJINAjgv5blBfBTb8+Zi
         ri84xFVeRRWJHiBgQ7dzEJL3R9EOsYiZwA28ZQBDF+Etcpulja5ARxFhliLM5qTsCQ8D
         hI0nebjIA9Ajgefw96m5jH96G9axaAo4KY3TYVeiPQL0YJGcRPtzyQcsFgvI9c7eYEWf
         UgCpPw9qisTn/fpbyJ1eNr6D4f/4nNnhgMasXie79F+GUIEtu8I8P85k8oNSPFaSJWjf
         qHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333602; x=1771938402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdOaicgS1QlU9kJAG8SROo/OuWOziM8P6FqTRQFlr2I=;
        b=iOd1f7dq/cZsE2zLaJbeC1mkmelRgTHz9cK4F8wzEwevNKDBVMuRhZGw0G6XcWNvlV
         Wup2k6ucurR+MdC41YYukRReeFzi+FNj4+nRnZbeE5zAjkOrdntr5IZTVHF9CtTO3GHg
         GPMZdMRqI4cMUAFh1PPJyXmDeaiJ4ZNmU1JPUSMcvYdamRsZINb+sEKbVBwTrK6qALre
         CjSFMgTyJUHNKnqlZWIOxL8StoYxZDh3iAPgJaTkTeaAv1iULOTlLxr5bIyCewhlar0d
         +g3iK+ziW5E/NX7mLAe1XTqjKHF5s8RrN2erB3MkAuZWg/jQlLAOouoyl9DeTtrOZH6D
         /vuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGnee3gVjGoRp4qjTKMdaiuUIGA4f/cf1rpN8XAOE5Nb6CjEsnFxMPI74y4iqlaTUEgQE+MDpmRCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXmFnz1VKSTky0FbBP5fEwIWVE9Jhy+HyBu2rbwsnMDHrulgPM
	5y01xCVqH3LHTYty0y+eWyO7SMJbhgS6wUxH+pJXxYCuFZirYeU2r25/ZXtpdckxwpsV3R6GxNi
	r1fvUyeokgHwSAwj2XkirbI+Vtk9l0/68xQ1vEv7g0LGi1AwTOH3Yo88tSGfg8y4=
X-Gm-Gg: AZuq6aLJhSS5KNsxK7ODfeTpjJPecYGafRIFFDBNYoszGOi4qbdRyOHQZ7Y14Ehyeso
	IshplRJvsaJPehrvMRfvT/ETZJCuX6GkNxHpBPfz1zaC42Te1q+kfovS5B1dzDu743pEgL6l+d+
	WNj2s/QMyEKZj7dm9TkgmCNj+q4OdJa0KX5L9KOkrSKM9w7eeW0gM8I3ta3GXmoIeBhKHzGsSlX
	/PvrLqrbVKLYDmaLEWJJfCkvTbiA/cRFHvnzUCg/ZVajTdGQboGFoPXarCSyqHhvw0qQ2yWDEgo
	DFmHwb83tvxGhTpz42v0XgIbGKN141HLBUyKFmCcFj8nK+IdlwGCP+awD/E0fDKIukDpskXZ7+v
	iqPMZ9qibz6UVX5uuKyJMUXum34XcsaR1Fh8NkuN44LnAkfpsaaNBLdUZ7DuvOK+12TuTlZ9kwt
	HlpNk=
X-Received: by 2002:a05:620a:460d:b0:896:ead2:a657 with SMTP id af79cd13be357-8cb4073e264mr1339104585a.0.1771333601811;
        Tue, 17 Feb 2026 05:06:41 -0800 (PST)
X-Received: by 2002:a05:620a:460d:b0:896:ead2:a657 with SMTP id af79cd13be357-8cb4073e264mr1339100185a.0.1771333601372;
        Tue, 17 Feb 2026 05:06:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bace3fc4esm2497219a12.0.2026.02.17.05.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 05:06:40 -0800 (PST)
Message-ID: <1658ebc4-e8a2-4fd3-b587-918884181d49@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 14:06:37 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom,glymur-dispcc:
 De-acronymize SoC name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _HqZ_npaxWuGn7hVd_CAZ_FQf66wxAP-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX4u0Ez4+kHU3c
 igwbqJ84KgmlgisLkVU7iZe6YumAj44jScARXMdETM422LdK99hcAMBZ/PjadQN1XVzBPOLP1pt
 L3d19rBtII3AtzQeuezdHQ7AYZaLrfmgrvGznynJVJS31w8ZJtTFY6fPUuUOSfY8DF+4/W5zaIq
 7TawqyNB8qrUkRfm6nf6S+q2yZSUjixK4kJ3zOJdNP5kmXIBVDgE1vZ5qVw+ClflKagokCOIHvE
 3swp6TFtR/18ixeJFM+1Ky5ig4YsxNyOiN7WCFOEpOyCnNdMovFEx/55APJhU5dvO8xCwMx0+KZ
 ftdebQ+3FgWlDXY3RGsAiaew3wd4nxfhKkMyAThQhOkPv9BuhQwnQTlBkMOtbvGFq2wk6VVjuzS
 pyB/oWx1/fx93WgPWEAzcYiZkb+7PBbcS2p6/orgq7wRFYYYjREpJuIIn5PGtPxEzznWdEextQa
 YT+JtT8rZU6hf+u/w0Q==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=699467e2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Rh8BIR2qzSpX2dRZ-WwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: _HqZ_npaxWuGn7hVd_CAZ_FQf66wxAP-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106

On 2/17/26 2:00 PM, Krzysztof Kozlowski wrote:
> Glymur is a codename of Qualcomm SoC, not an acronym.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
