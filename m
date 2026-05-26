Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D0E3C5539
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 07:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779238; cv=none; b=miTq4FAL1pyDRZWtU4jqWAMcSW9vZTh/odo4AsjFQKAtCqvbi9CG9pm0TmzHJp19QA5gcdWd7/L9F4A6tMk5hyfY7cdPjieXr9DXneBBBBBOVEb8asYGLMMDD/+ZAIXJTKVhNFVWQHUYbgWPX+rEhu1MI+0n5HEvW/naffm7SY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779238; c=relaxed/simple;
	bh=hA9nsEvPFqbMIaleKcdvo8RJFFOUhGhAUa/aGYy974U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g3emMoBCpHqlIpiLDEtPqM/psJsBqgPeTfvJSuSyjbaIYqxAYiFVm62uPyziAFz+N+UvaRUJVyX32crkdXHV8DwYx0JWVUA5m+CO76sh+fF1tDwExPa4xYnpsO5K2GpylMp1GJsHjtxNs/bedypu7Gcp0o8FcfVghIBQixG9hyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjTjcTFr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jwq3WY4G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjTjcTFr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jwq3WY4G"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q1LnPq3603963
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 07:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YcCxTBhI40zNt5pIvZxjXe5DAlPoAygl+nUjTjWRGtw=; b=QjTjcTFrs3rK3har
	rh9Grnfg5Esuvrc8gj/V2izwjrXwLKdhCgEv6uLlIcjRLXfT7rhXq0c2soLN+9AE
	RmTnIrSYgiDcz1giUHtfbe9sBw0B30hP5IYNi4YHMgFLVdXYNQlKp7CPTWvI+2JI
	/oo4c4t3NlVVRM0+f8MQIkwHS6sjftIHhw+IgzqIPwrZ1OABXfjIQ9Fofjgoi+uI
	TiaWOTRtf73AlSZk5TBkFvAWHdWLcU/70y8fzw2qYcYEVza1TRyvotYjEOYbuFbH
	0pe9nx12LoojX6LiHIcTdl8e8TJ+gmxiIwC4OpoTylB9sOprySF6rSdNW8W1VfZt
	O187qA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqjr31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 07:07:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c82ba4715b6so11135098a12.2
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 00:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779779233; x=1780384033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcCxTBhI40zNt5pIvZxjXe5DAlPoAygl+nUjTjWRGtw=;
        b=jwq3WY4Gza9aVed+GaKhtxMKkl4deZoZQH7p+KTohijNYxQckKmUagJCLiWFZUwUTV
         Nm54XsKwTPp2+hA5npof70D20zafXfg15D+laYPYEOB4IX5tJXB4Zhp1XMNMj+9C0ENf
         /Fs/4wWyJwnqJ5HOQic05kkaCFqhr68MQuaCE4vg1t/5mYWpSu8j1HCxRLB1w5Oa9adJ
         dx7iULWfN+HRXWGyRCrPLiK9BdbVP4+YM5paiSV7p0L/rQ0Va89lufArje0RsTaI8mTe
         HhJ/u32SohLplKkU5BWDfatRZWnymp3S3S97Mfv8cYd8Eg1LIHFV6cdIOgI9+IgOYsnZ
         noCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779779233; x=1780384033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcCxTBhI40zNt5pIvZxjXe5DAlPoAygl+nUjTjWRGtw=;
        b=EkI/ZHtyAbjZxFRovYgoAQyXDMb8yZZTZl4Bha7elE7SL8hhgcmkFMp/0if4fb6fNW
         TTO1Rispw4LpKyUcmujj3yNO7nlhRl3scDu47SIvNuARnZw/9epC7cjcMhortvvuT2Ks
         0dopoC5RJLOAvQfHY28/4OdETmZrX9scXzCvY5+i/mKcP3q5GQWD5cTHxgGFyNOd/i5p
         zTmBITBcoph8pzArAUp0ispcZnFK/ICnlwyn+mPg22nrbebb/JLMyzZ5pg7+0qJsQTX4
         RBVVq3PTRgxuCsij5iqbMCIsGdFPAt5EyD7pMEnqoJr8+XIGNSBSP1UkmYA6wRSwpokW
         Q2MA==
X-Forwarded-Encrypted: i=1; AFNElJ+UtPgEBm1znAV56f6hFyW4oZrq5xRkG1vziKobnkoJcYS8zFvzXT4Sue/5BUezwDpHxv3eHjoY4ts=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4tl8+hkYjoC3IvVu49cIOBKNW1M6zmLX6L9GegXIKydGEoOC6
	97Q85E9JA08JF7dP8YZUSpLMerj2y+cA5pzNN2r6L47siY5fRMU/x0x2463xCaP1K8QOrdegKRL
	WkfdwwMNqgs67ffYqOOcw0rd9gtPmXY4KFY1KqrWK4WCSEziW4lZ/IW38hi99IXA=
X-Gm-Gg: Acq92OGK+PPdeSR9YWC7eoO0bZ4onWzWkeKdEoITgq7v/291dHnaaHKSDGeig+am4Yq
	O/8htDpCPoHxLKt5VLv9HD3AsBPbz8eBm5fcBdnsHjwELhJjqq2MRNLP8FGcydot+2VPD4u230X
	PNq3T4PYfiO3ocgp7qvcerODVU3XEGHxPIzH2iEZw54Ylb008AUqKIyZQcKzc4jyUuCSEYui9kc
	Yazkxrs7kIGjnZbwVg+jy4+x2zBef9tq6I8eDyRK18pAlGklekGQi9/kVK7rBKiq9KZMR6OM+AX
	6QPb1b6LkD/I/qAr8cMGF2WFKz6iweqNIMMh6lQICt96VYnylgX0Oe6EOKyvng0N22w99tACGsM
	QjOoCqORIOm2Sa4YGLnld0P/EBQr6hLHOofjVRFXyLYpe7eiz
X-Received: by 2002:a05:6a21:3285:b0:3a0:adc5:52c1 with SMTP id adf61e73a8af0-3b328c4cbf0mr18666815637.11.1779779233232;
        Tue, 26 May 2026 00:07:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:3285:b0:3a0:adc5:52c1 with SMTP id adf61e73a8af0-3b328c4cbf0mr18666773637.11.1779779232727;
        Tue, 26 May 2026 00:07:12 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb3083sm11332846b3a.43.2026.05.26.00.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:07:12 -0700 (PDT)
Message-ID: <51c4edd9-ab60-4621-b7cc-af32729e3dc1@oss.qualcomm.com>
Date: Tue, 26 May 2026 12:37:05 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
 <dyukhyihftgrm53tdiugcfx36tfngelm3hi2otpxy4pzdiwlsm@ixh6amjmeglm>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <dyukhyihftgrm53tdiugcfx36tfngelm3hi2otpxy4pzdiwlsm@ixh6amjmeglm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a1546a1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=wZGdkmvsolkkRd8yDogA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: X71B1-FFqPN-hTukyaLygJN-biuoTKsU
X-Proofpoint-ORIG-GUID: X71B1-FFqPN-hTukyaLygJN-biuoTKsU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2MCBTYWx0ZWRfX3LFRYfY85aZ0
 OQTb67INNBv/MhIb5R4bQnQhoU78bqth3kgIm+jLs1e5L4GyT+b5PyyZsFZlFQk8S/7vM/qXAxh
 kBWJ3Z/iVZo0qvINBu+KSKIEXF9FNGjjDjhPIYDidW9I+B7+U8MdqDithaY9+XliMfqG3ADR3W6
 YLXAA2/fPA60oWyku2aU5D0ng7yJFNzuYG+PFt52NWLwhWICgDfCj74BeiSYtk64LCFg3YqXaMN
 3p3j2/PpRJVOAMwCkiiUbYrseWLfnPDqwBPRuDm31KISaMdRD5E329xnrgCBj1icrIkFR2nE6wS
 kzBqr7Qun/lw07u7lRzFJhITAWdnGlt+f9gMHqfbTrCfSobQa3VuMnuunCo+a5yElTczj+1JwUe
 LzklsMvmWySZiafETf4/CVXKbhk1H5v3+PROS4U+75VNWS+30sFHin91oWCPIKnecrvq8xxqMyQ
 hXeloMkVqIZ6ZpI1RdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260060



On 5/26/2026 11:16 AM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 10:59:44AM +0530, Taniya Das wrote:
>> The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
>> registered as standalone GCC branch clocks.
> 
> , otherwise .... what?

If registered as normal branch clocks, they may be gated, which
breaks access to the EVA clock controller during clock controller probe.

-- 
Thanks,
Taniya Das

