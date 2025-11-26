Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA1B30EF6B
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146881; cv=none; b=b4n6vMyH0BH9zcN+7WzQfiJHmcf4HelvTgigDTsttn4eAwN05TErFI0fL1imjwlp6nOwF53Hh8sGaHzdUIr7HZVCvXtWjbobqbYQSckqO68aMKkeqAB7fDB0wFJYw0c63JzDD0HQacLx+0MymXOwnndx0c6y8MFtyStpSNy0VcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146881; c=relaxed/simple;
	bh=OQO6HBAEnnltAyp8dQvJsMSoTEOGp2D+YuqjsCWdyP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NJMK8Zhp6XecTWra0Tulzb6W11mzmtSMWWtyUDRspnWO6/F48D68puh5m5sXBfevBTQWvWXPj9H00qwWjaKl1Ry31Cb8u4GNZwtlvmfPSm59lYqZ+Qa5zjVKuFtwCdxj+w5AUBQqTOmxTfDLGoVlaNvu4UF0gPNy1wF3s4Y7lCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcvbPsqn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGPRE+Of; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcvbPsqn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGPRE+Of"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ2TCu23706613
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SdNwImC3LzJ2ki+TuzKvgUAdcuqua8jMxzqhHj6xwiY=; b=pcvbPsqnzoFQcFS6
	EOb0qnqQUW4q1aME2bdTSfFpi+9mj3dH11z1qJs/EQf4AKY9wdJXADhhycsfe14A
	9YkrHoogbneEuftWJMAgRU+1UGa2esFloYANlioo+KnI2JXRxeubGwd0lIxAvMSY
	bNv77oQjJhix1LI0y38QPytsG3h7Wb9zEjbA2Kj9UBWXdAj2EYWNxP6Err0+Pt+B
	gQPZGXlz8PEnMC23NhQi1fJtdVMdT+TVlblJTsObAipIm/mKsRBPz7bOGiVPzar5
	FwyuVwB+/ZbdAicb3eoZaE+V5gyXKYe87xgp0dxFJ98QSqy/BX+7DMpPgh0qLSeU
	PHWqKQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anduftrmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:47:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297dfae179bso167295415ad.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 00:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146878; x=1764751678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SdNwImC3LzJ2ki+TuzKvgUAdcuqua8jMxzqhHj6xwiY=;
        b=KGPRE+Of33jNeLYgYg7ZHFc2B/PmliMRll3BIebUJf8/uRcq3wOo2VO1ZuvnHBbU7i
         tmLSy+l3UHOiOXiVFRwUpx0zhc6GiT9SRcKOwDTm0waue56h2YayLtsUKZka0mtLISeU
         fRI107Jlxh46oWW8vbPbXMlC5LptEmM3W6YuxS0t7Ytv5JX0IkyUhBO69Wv1BGaSDnhJ
         C+AWlNF5SJdiatVuGfMyIvzHZkrLT1hesyx3Qj/zAh0L6KZIKzDbzXa4NeuM20B1h30Q
         n8gJbRFo28m+ZP+nYwCvrqGGtm0vA85obaMqqf6QfVbpggotRJ/I0cF2jC+JHnZXLNa8
         xdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146878; x=1764751678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdNwImC3LzJ2ki+TuzKvgUAdcuqua8jMxzqhHj6xwiY=;
        b=qv6RRb02qiwTmk9HNvnum/fZwwsCqSzIT0FjSTTiTYD01fLFpKtz2BGLnKfvKNAGL0
         BvNPkUdh8KEcODKcwsFq2A2QDaqWBsnJU2d3SdxeXOG2nBdtV35cbJsQ5nXJ3eMl5yWh
         8iCm50jykudQHUucx+fRCGfRzy383eIW+ptgQJ9CKzKvjKXjBWkRoh7gviNEfwooRfgy
         4TnTtEHFA3O0Nc+h7qbPlXe+wgemhPKfmFVHmz7qk/s+dcvJEcFA/maOmkxzjNT4mQWa
         mR+cL+331airM2/3AEH0CzvH0M8RyOekrS2yEt2hXJp9fy5ARcyIdmZGxIRLq9KxaZa2
         WIiA==
X-Forwarded-Encrypted: i=1; AJvYcCUBlDlTvmd0eyPGLNW6OT4quNJ+b8vU41bsjB+rofa0alvbWt7sWG4Fu4W8cSNkQS8+4SpJ204i9ro=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuI4oGjwEU4DFRVRQzGwbkqlLwJXNIqW8Z9ZDWCCtrlR5+0EGJ
	EfTNZow11hdatXX4mIfv+mIxiw8Fg6yX34xh9coeA7HS9+MvFLXOftGRS1VFRoRrliDHnt5utIX
	CcKy4m/bWjKGAfiCpCti2DYHlj3xloK8aXZdQQ+JNDVjMbI87TKe/waepIEISpyk=
X-Gm-Gg: ASbGncvPV+1x65ua1SEPbTZ8/zUA4pHtvpJgsGBJiJV4ka3PEEMgqfIpve7KKOOM1Hu
	o5QZ+R5jajgKdI9ufalhR4xAN5KvjoYIF3jCvrGSfuaLf4sad2J9QuQyNMxx9BmuoT80q8IONj3
	WSMLII4/8Ak1jDmyggl+gFn+5rXMOka5WYUVMSlVSUd6iTbmQ7km6J9EQ0fld1u9yC+iSaKsXYw
	CoCpXEfCreJjxmfL/+8rfpm9TMnXEZmIi0qjt4HZzv2hrRJi6D+DL3fKllElYpQNCOGZpDIDstz
	X129XdUpToA54UgXKtm/3u48eVqHDHRJzYWC7ySUN5Tqje8OhNptZN5d5ceohzTs3AMuRr3TKO6
	bvRoy8oL1WhjQqp+Q+wKFfNyvozgF9z+Jzaus
X-Received: by 2002:a17:902:ce8b:b0:297:d951:b4bb with SMTP id d9443c01a7336-29b6bf77d62mr241566425ad.47.1764146878297;
        Wed, 26 Nov 2025 00:47:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVmau5uUwIIeMRGSzBCslxSBKu7684G9SeqwfqC2P7iNQUqvcR/lsx7cZCAq5voOsme39tAQ==
X-Received: by 2002:a17:902:ce8b:b0:297:d951:b4bb with SMTP id d9443c01a7336-29b6bf77d62mr241566045ad.47.1764146877840;
        Wed, 26 Nov 2025 00:47:57 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2bb7c1sm189940795ad.99.2025.11.26.00.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:47:57 -0800 (PST)
Message-ID: <738b895c-4b65-48d5-b802-b758652ddbb8@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 14:17:35 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: qcom: gcc-sm8450: Update the SDCC RCGs to use
 shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera
 <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-1-9038430dfed4@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-1-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=6926bebf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OtGAF3PL-3b91V71RaYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MSBTYWx0ZWRfXzVE4CWOZ04ZO
 Nk0GR2M9/FegAt9QPq9GY52fYgAXs5DjJg6aFzWw9z6sQ6Sm58VoIJg4XmKDSt4WecnjLWNpV8d
 yuUa83OWsGooHzGWDakkRNSXHewN8XRRQzpdk+yxO4R5xdtmmRGy8CBCZDpOk0vcY7tt2kyKcVc
 gF7MV8aTAeMBzC27CE/HR3asP8ji/w8wcal1Qllgpqp7krCj0/UwezmHr2ed4TfY3+A3vwYVXqr
 ALCmrNvfBjWbaZDQ+F3SpsMB/WrEiVAISec3aFdvE/3UD7R3/8KAkYIheoywyteK4G3kmHg7HDX
 SC6FvWlTNPc99EeGzgzH+Nwz11xNTLbatQH/wuMIdZmVz2K/x+Fq9yuhR7ytCHlVy/GOksZ8MuI
 MNDfJ3x42MhNBvDMQfRuek6r9xGudw==
X-Proofpoint-ORIG-GUID: VH9yFBNdimFiHncwUmwYjmBKRrzhP4Yx
X-Proofpoint-GUID: VH9yFBNdimFiHncwUmwYjmBKRrzhP4Yx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260071



On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm8450.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
