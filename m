Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954BE2E401
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 05:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777528694; cv=none; b=VvnvrWlohbctTxK7Ypc2OMHzlNruz8QwjaoTdIMQ0xfoFtZNnSKvq4o0aO2IlHgRlf5X2kB7qqCCagVq1UKTboAut5Jg8AdraxWpffDR00Jwaf/sSrZWLpJj+WGz+bjJMl/4GwLWY7uaIYtYjtCZvnxAeN+1arO8hDCdb7Pt6oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777528694; c=relaxed/simple;
	bh=t9cXcyt0z2yHmYkZ44DNTIYbLWTfQIg1ta0VpGKMTk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgmvl3au3K+T890gRHdziIsUSfWZYnfatfb+irup7OxqK2E+wrK6r+scl2RrrAwSDevNEuUAFNGNNtBEw6i7WHicFC79PIoZoB+aBtXj0nHPGugaM3nhxBB4DxYBanHFaTmmUYgzWfiwrMFlxaxgXxSYaIBwwz1E29y8fEEPokg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOkdvvqF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ytz3YwLv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOkdvvqF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ytz3YwLv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TNuXu03637356
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 05:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N42TpL/Mv5cDad7xtlaN8zH2kvLnL6Ebp9znzF+M56I=; b=jOkdvvqFmg96sXkc
	yrcRaa5hLhfTvR7HWeapM3Gdcy0Xj3Q0+FgakOlknczAuXiCIwYt1b3RYqSZkj94
	BHovbkGEAoQJFlESWJXS7Vro3dZrKHAER4wC7hsv/ZTeX+nT4/H0vUdyWHbIJQN7
	c+zSCva5zBJRn24elNsQ18GMG9Cwl+PCb4xIjpWDFvFGtlGaaeV3NmHLpA6iDYIz
	XdC7DplIfrkeNYDChZXCUz2EasOdd4YG1X4VtpU5OtAvVQji1EGoe0s2UsijscHy
	ymALlauFqa9AiGPXJiBUc8aEyUIc57oh4AAPACfr9Dd1aKRxhCSaV1O1Y3Dd4uWE
	tW0TOg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duv3q1207-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 05:58:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b465bf993cso7025855ad.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 22:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777528691; x=1778133491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N42TpL/Mv5cDad7xtlaN8zH2kvLnL6Ebp9znzF+M56I=;
        b=Ytz3YwLvu2IROgnfnbmQ7VU6I1LWLcgtklkgM/rmf+bX7DfpTuLpcQvf5NQDf5dlce
         xQsJHQItvNJH8vZFzGhj9kQ1I8JL8fsu9onzUDRf8bZD52iWl7/Mk39BbBOt/1U+DZG3
         qRpRZN8dSfsIFYDaedm7W7P9TCs2enyu39UQXhPdMBszA0fDITB+BZG/S8bH5Dnnej2d
         q2U8FoRVMJB7ARgNZ19/n88s2KMhhtAHG0Q4OOAauRB+yMSSaLwgiKcuBySNNjBid5kK
         OtgOn2RRKAt45lBHjq/Y958Gt6NbyCzZtuO/mjjPyCYT0BhSzOW+dhJZQ0wVxvNiN3kS
         qpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777528691; x=1778133491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N42TpL/Mv5cDad7xtlaN8zH2kvLnL6Ebp9znzF+M56I=;
        b=Tan/c5M9aCf2Y21CXr5CsgEYS6nj8whkBId1eYY6zqiELQgoWCvQ2921wW4343lbE1
         0QQw1lhOi63VVDC6QhOrx8UFruOlHQ/r4WmDKacrLl67PJJGnFAzhv1M6f/52TXzv76Z
         EWftqjCJunfNHMFmpTeExHMKAxHY6IoVB/48cFfadrSvsW6SF9Kmqv0WvoScfRlWAEDI
         ucQAkQ7HSldc1DuOtQFPO71QQfX66T+0+iYBxZsEJuefJ9Z70pT9ClqOOGtn6y26BvKl
         OUT4woYvU7Ocd3NdluNvwbH+RDF82p2JcvU4OO5i/E1P27Y5dRYT82ntZsAmky1sUtd3
         r01g==
X-Forwarded-Encrypted: i=1; AFNElJ/wt5h8BgJUJ0DrTXmCysYpVTAfENkmqN0RCP5nkp59ZRYrFGP9OgTJ2+rAWKB1SZVqKa1wkmuailo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMT0z6sW29M29UgbBtxqL77HwbqQhKA22bHAfav8WhH5e8geVO
	WGBTv+f3zfk5h0RR8JQ8GJzmso3szPtDD7B+GwzjWZg8a3gXWz1jDxwSM7J/ZCZyuM7nHmYZeUO
	GFxPVJULfDR+K037YAk/4LBnjQaFAx9+//zYLC+PxkkmFBhH8u1e8Nu/Qy9egFZQ=
X-Gm-Gg: AeBDiesgcphuZOMNxoPkgiA9SoQP4GTOIj5Ojd2+TZaghujnQkev7GC0LHoYjc/BfLS
	ygL3ZebengdNU2ag11YOzUti8k9vv1MM3Pob8Y0GknOXUbG9mHG9spRo/3TgXA8N+DeQmX6fvrA
	Gf/ANanoDijB5e2k+y5g4mmGQpF2uJqWdXnrm+tARGTTAXKFKeBpvcnInU/u9nOYfrvSwgT5wiZ
	OW+1VWpsvEU3sl4eMVK2MsaOMvHVitYBjoyiVC1cGGQE6WTcQkrZdkOwUq1lhivR2WJkfSGTc/I
	H8GT85qjIt9IuJozgxHkksMs90kFTzbb5uZJZccfggFokbhcOTihBNqfpgLOyFU+btYonyr1/M3
	a4ExUPtFNWOckmv5dyOT/H8jpKe+rUTJrXY5Gu30cgnuZ7H3/v6r79lYtU92vonYA
X-Received: by 2002:a17:903:1248:b0:2b0:b290:f2f4 with SMTP id d9443c01a7336-2b9a24ea28bmr15442365ad.32.1777528690736;
        Wed, 29 Apr 2026 22:58:10 -0700 (PDT)
X-Received: by 2002:a17:903:1248:b0:2b0:b290:f2f4 with SMTP id d9443c01a7336-2b9a24ea28bmr15442195ad.32.1777528690235;
        Wed, 29 Apr 2026 22:58:10 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98879e08bsm40357295ad.30.2026.04.29.22.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 22:58:09 -0700 (PDT)
Message-ID: <d007856c-e853-4ce4-a9dd-3b4de2531cd4@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 11:28:04 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: defconfig: Enable CAMCC driver on Qualcomm
 Glymur SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
 <20260429-glymur_camcc-v2-4-0c3fd1977869@oss.qualcomm.com>
 <f9148fc8-31ca-4400-a12e-630c80db020b@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <f9148fc8-31ca-4400-a12e-630c80db020b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TiBeYYi16oIZMGOSwYn5nlzG9BUVMQ_g
X-Authority-Analysis: v=2.4 cv=dOyWXuZb c=1 sm=1 tr=0 ts=69f2ef73 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_KhGAaAYyJUefK6zY6QA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA1NiBTYWx0ZWRfXy5e8igL2jyPb
 A6nwXgIB0hZ6wmfk3pdPE44TScYmLGGo6BUagm309ZqtQgrP8MVoXMEPoX/AdJXOoIUe2HgWY7U
 DsnwWfUqcQ6DqYSNA0BvrXZ3oH7gr1U6SwlPqj37fiQcdelkmD3IuHFVhgQzHZYSkTVeKA5EdbO
 UNVmjtQ77Fnr8sHF/heExYdlAkRvxECaLom40FP2XBbFA5LasznHWHtsBnXW+Y9rX7tbZPknCvG
 V4GKBvX2zzJWRDisHgW5ZTit8u6ZIvvskOiMF5PLDaQO1CY2tVvT8MrHfu9aqw7GTgmxHUwpblP
 LE1UoaOLZLO1VeSb73LxThq2GAmB+o/JQ6CtSTkR/5SQ3MffTddxYZX61t1IzqnueasriylF9n9
 sm1+boQMEpqBSdcBOVe7MmRnPsZ6msCHdzek31nZfg646V2eXK8J97l7sN29ogKqCZrqKRTRot6
 qT3I82HLmzOXvgNAlaA==
X-Proofpoint-ORIG-GUID: TiBeYYi16oIZMGOSwYn5nlzG9BUVMQ_g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300056



On 4/29/2026 8:52 PM, Krzysztof Kozlowski wrote:
> On 29/04/2026 16:14, Jagadeesh Kona wrote:
>> Enable camera clock controller driver for camera functionality on
>> Qualcomm Glymur-CRD and similar other platforms with Glymur SoC.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig | 1 +
>>  1 file changed, 1 insertion(+)
> 
> This change should be dropped instead. I am removing all Qualcomm clock
> controllers from defconfig.
> 

Sure, will drop this change and update it as m in Kconfig itself and post
v3.

Thanks,
Jagadeesh
