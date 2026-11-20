Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170336;
	b=GVFGrCG16DDZL4FlmRpW+7edGIo5jXEoNdxSob2H22orslAafnTwx6nrd7nRJCwXxOQB
	 lrN+fbmJAr43QLFKp4GDT2LLR/Ah6hSQXiSH683wsL9xltMVDs9YyhidM7OISXu9Jbdqc
	 Xn5pmK4i9gjeBsV0Ox3R/qSZLzDho0uyX3/6wZjCRN3gKqKijIOOH43DyklZUXExhzBkD
	 as//D5G44sWiphEI6tYkeIvJATQYJdy65O53N/v8SZ4dnWzcYYn/CWd8zpnLhsp59+d3t
	 YwAwwCHq5g797gUdO4SRsBqv0a3o5AfoDHbGGidWSY6SY2ZpHNNEY9zW1GRKShqZ1mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ut2hNOaaHrPSnRNEPnnWVMx38OMkQ2B8AQgyQXg3fHs=;
	b=3YoFFrPnPoL0WcHv5yxYcPS6xcrFmFLZacfNMOz635KvQpFKgNMwyE9v+ZVF+IKCE+Xs
	 4nkoqvOvRHwk4nDWM4UjeGFXSj8805mtAbIi+7dJYUbykWLCOXKQ2v9qokQ7PSYFsfX2S
	 4j675nEwweWT+g+OJEk/Hy78Q5BxQK9YdgvSIweHSlvzpQUFuXQ1i4BocHbTxwDWNgNFx
	 PAeo2/HwC22pgZ/MC5GolnxfNnOhI9s1WODngaumpWW3wPI5ew+sNFI0UgPqRay88F6kf
	 wMLoVi5HH+rLbIX00CA4wWWFtcD6hMGMw38DYMEtrpNwDjOVMwdQBp3Vad0jpUnZTcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fCE5KFU9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NTyexNf1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80793606A32C
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80793606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fCE5KFU9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NTyexNf1
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7esOf2019464
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ut2hNOaaHrPSnRNEPnnWVMx3
	8OMkQ2B8AQgyQXg3fHs=; b=fCE5KFU9/fiQGgHvP6sDlyxnB6IZwJbzQRfIffW0
	wSxG/UCKvCPEKDU461gqG26UxpP2qR+GUI1WowSvGonHtz7gjyq/O590nUOAlPlJ
	Z3dA6MFygSM/CoL0pAJdFwOhpsbVhkikqZ2zBMZL8ixJeYu9elsouXsCMQRglsb1
	d+K1em9x4BN0wGYb7cLifA5k/Ay7Bv0m6noHCraE6CGXIE1IBXSQuXiE9XbCeJT7
	fHF7gC8A6MTTQDFDwW5Y283IoZnGZUM6HMwMAAgYV60GYfNz2g8cSD71iSNMdG7S
	4vKqBO9DH+JdOARjJZSmvyT2Y3cUCZ6x3vA7IjsWl8e2PA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9a0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:25:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-921273a6cacso11875626d6.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 02:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170335; x=1795775135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ut2hNOaaHrPSnRNEPnnWVMx38OMkQ2B8AQgyQXg3fHs=;
        b=NTyexNf1+I4T/0Ml4x+nZRITzoedO2QcI516l3KaK8YBRWubLzCOpKgZVI1wcesPUH
         myZhsZR3NIYsptSOgo0Y3OXascRBtUCpFKEhJsCY2KDUltNnEEtpsrEJoIaL7hyn+Kdu
         dknRt0DevO74l5EgRfoaS2qt29IKcvr1Y/P/+KGpmJMoMl2k1Gst9jbLU4nd7CU9FTfS
         cB+QK3u7ZRcfVh/YnWDpxE4dinCTxMphPKHENM4QqOg1eeKBTZDhUAbpUEkeLc8+Ty33
         FsJHjTy6et2Xofp1MfTD0/laH60LTOmE2aYbfbpYdloTv+W7+IXUS1kftO2OaKw1+BJ4
         aOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170335; x=1795775135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ut2hNOaaHrPSnRNEPnnWVMx38OMkQ2B8AQgyQXg3fHs=;
        b=W7UXm1tm2Y7+/7pfmjzC81uJAMDXNv6ZfYkTAN3jjuJ/+1rzKQkv1VlLlj5bMamx4v
         vVQ8Kn81wlLuXNTOM5bdKozDYhagdaxBU9cOX6ND3QC4rY8OgZfqYY8P1MgeIlis2mxC
         /zcS71kk9e7WT1webXZl9bsVprD3KcTiDx53U+hL/thSlPtr0E9C6ZRFLD/gk8t9IzNX
         azCIjpieu3YKJgJ7LUMVwyc8DN1rDTmgXFEfwmMd1HlY/Zqz0kUbEtaikQtg4bCr8tG0
         36OGQAcTGFfCTZ7SFMy5P7BJbt+j93uX388PLc/AtmX8G4mhfEkdVTZ4L2Wd4kjIJ37m
         ENmA==
X-Forwarded-Encrypted: i=1; AL+hErHbZ83/LE70qvcVSjgABKSg3eJtRVaDwg2vz02GcXA/QLyZ3D8I6Kuc1Di/c3y5+1CVXVJxBKV1vMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8E2DKWg4kDQ5fA2MVLk+IGvLAGZTFVWyAlHZmvIY2YzNmIi88z
	c1YNJ2m11uW4VRqwrVm1Oodb4bJaYx8MTRYgjprLRJFfk+sOIIevnPVg2HnObLTp+0dFYJf+Nh5
	oVd2g2NRYLhZx+JZ2G5x/ZXz7T4feIssYFoxAkqvgRuyrImi+KEeBMs8j70WCiBg=
X-Gm-Gg: AYBFou22fRy+Xn6eoyqlZLY0P2UAUwBtXWjW1UVC3NTU6jNzQOc7btDlVDy0IdBvPRY
	rz/l17QOeM4vvgkaofNhjLKcnYs6O2ULMn+Odgpn//ezQQmBZyzIwO7dnRkU/N2U+HKuKxPMcA2
	DmSLaTzkfZ/SKRBy1YJFoPKogotbDryqvPvV0mT0o7cxSmHD3jLaMKCV4YevTKk2NVoVzk55pER
	dAfpcjd1QDDTrj5/kjkEyYMZWRch/s+aSHgaNqFJosT57cPZAqN1Uj59d6EskKNlfNNrtPOrOyt
	8au2D9RYS32VnRUrTrtMXbXDKtvjuEFTZD+EDfuYL8ZyYewaJtc8FHXCxFkUYO29/xKjTf1OW+p
	dnc5J08YuSNLQfVE9XRD2CUhTBSPAh0D2yAD2qJsKdT4NXpsDzG9pBeTVi6nEXYgT
X-Received: by 2002:a05:620a:1725:b0:93e:48fc:aa88 with SMTP id af79cd13be357-949bab1293bmr416731685a.44.1795170334560;
        Fri, 20 Nov 2026 02:25:34 -0800 (PST)
X-Received: by 2002:a05:620a:1725:b0:93e:48fc:aa88 with SMTP id af79cd13be357-949bab1293bmr416727885a.44.1795170333921;
        Fri, 20 Nov 2026 02:25:33 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm118841265e9.10.2026.11.20.02.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:25:33 -0800 (PST)
Date: Fri, 20 Nov 2026 12:25:31 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: hawi: Constify known static data
Message-ID: <hxvyvbjlv2k7fiqndvfhrgaec3355bnla7i5fmdiwkucey27zx@x7hzvv6cwpq2>
References: <20261112154357.271072-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112154357.271072-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b00201f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=l5ae-HWxQjlzd3G8lioA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfXx3iS3xL9X+LP
 TJ+g7/G3xloR05NiQ2QH58TYX4hgDk5NbI7uNvFZUcrpp5tGXY/j6iwvL/OraDZfRYCttClZuhJ
 AIpKR64dLlzxRR6hIfhO17+J2ybYZqY=
X-Proofpoint-ORIG-GUID: tcK1nMIQ5NrivzJCBqLLCphbw4L8VMTJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX4nFItwf4XuZB
 F6SpsEREddjDxMdFyNMMyRSfnrnp0+D0+MLGsLi406FXUPZ4bYD6HIOH9dJ/LxsWiDyBPzurAvG
 IKEqR3pjVYzYO2r83gQCGXcCRicTcTGuts3tmsJdkoN/DUGLw6Esoz+6c/9we9asfB09lsusOVg
 0FKj3PQcfPsIWJbEXG7ugqf/u7uYTY3eFlEdE3fgYyedAgTjiLQlHGXqTNzGzXLwMMKhhD2awGs
 xBU3PQakieJg64u/CrIj7rjgedNCicWhFvAUR6O0XhKPwK2ff47N6pfUzcjTRjT4faCfRp6opqi
 qX96tzWf8uMwEVdCdDTFPnJh9MktRDRd+apnQOn/ZjJz4XAoNEXc5385vWDuy5dbN/H6ym9MuqC
 mzNrTCTJ+DsVrAtfDBDkMe94vBhirKd1U7eF8NC5uZsVMDtwm9GlVaV+sufQgZPPusA/dUgVXv0
 DMpQU9B1GHxptR56zfw==
X-Proofpoint-GUID: tcK1nMIQ5NrivzJCBqLLCphbw4L8VMTJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200041

On 26-11-12 16:43:58, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
> are already treated by common.c code as pointers to const, so constify
> few remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
