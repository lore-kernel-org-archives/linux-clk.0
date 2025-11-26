Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD8E30F950
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146654; cv=none; b=YTwjIwhHvxHeZ0htfe2f/WCJHMUj0yEBZ5s8FCVieN8mM4TvEDq+N2OqZ1D3L9/yJJkMzeMOI0W2tJRd4RvE8QU23fRQdSZNkGrivzELnW1idiTX2P0AJ26jtVLykWXa9MewU4odOgj1fI+OP/e42QoVVKs7/PTXitE8XxMl01w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146654; c=relaxed/simple;
	bh=ZEkpmNNweCkT4zn6K6CCkIn77IozJQD08tqxlmAPvoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nb3AsaZwFZ+xw/sNbST7rodqWzoyASXw47T77OpgauG7uRSXHC+a6ihq3mOTd8uQ3HlvlPFODYnOOLQ73W2WRK8fALi3Or4GseqejAeO2EE+pmCR/7O4Dm+OAaBJ41Y6ZdbXMX54cHm9tjN80ylDi0iKFwtLCUmo9r/0IO+eFGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EjB1/Yq7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bde1bzkH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EjB1/Yq7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bde1bzkH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ61lMu3587943
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tNJke/+Vud3sKKcuTIveHILf
	97q3yRMClDgXpm8Rwak=; b=EjB1/Yq7X1yKyWZcfr6hWKBcsIyo5//GU1qHlKYS
	H1/LrQprpSl5mlGDFQ9NVxd3Tbdjrj81OB0GflYHYnfp+pMhHuQgraRWrKo06PmJ
	s/AL0q7Gro6FciHBCIAOEHq/H9vKVjSPjCYYBajlN/VNZPVj+qeMxfJUMrIwqEYI
	tONqSykJwNuO17qEpDLNzhkpqFK9s/IWkAmw7XMkqMU0TdkvbwoereG5Z+cAsMkl
	bAErycITuKFh7YvCqxGbZ7goBndAbWeo7ke3D8aHunoyZQbYqfrpXOxcndUWM8rI
	xg0dYAbUkK5a3jS0HKxGNqZbhOUZypJtJUufjuzFEqk8nA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ang7927r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:44:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b24383b680so2225222185a.0
        for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 00:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146650; x=1764751450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tNJke/+Vud3sKKcuTIveHILf97q3yRMClDgXpm8Rwak=;
        b=Bde1bzkHNEEds7hTe+Qriti0Uerb1YxP6dk5bFlnHElJuI2JC1WS3WPgcm9GPJD/ZO
         L8aysdpyN4VLWuaE/O0Sfl0BptYqXpAFNTT56TEKxAQdwHeMRcFX6xsG+vY6IMQN8vlX
         Yr+bS/FOY1LvSdXZ795RxtJJZ055e2yrUeZDDgZRSu4jxhMP4U8kWV5CDOo42jw+JusT
         8OcqKFpfcI6pLcCwXy/R7sdLjPjciZKb5oVuxRKjHQZoP/3r1UxbryLnvjbvSkKdTBCM
         D5zf4S0iZt7WAeCc8hgj84AWstapMqghFKB2WFGv5MpU9eOBDUbb/MyGuSOqt27gvL9m
         JqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146650; x=1764751450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNJke/+Vud3sKKcuTIveHILf97q3yRMClDgXpm8Rwak=;
        b=nR80mzeie8L/SIBSf43Gun6KLm+MrVpP+nCK6n2UtYkW+E+DxlmPCdPWPX8/CSeItS
         lYzls5xEjAzX+g/wXNlQK/bq8N7MFtf+yE+xqqrwSqd/gWuvil+VZLD3MNTM9fLa4J5x
         8MjMWW9ooUlDelpTLxCm6IMmORa3jLeD16Uc3BWVEHAYKaPVZyzM0uucveAm+ON0hfJ0
         k6WVnDkaO4EH0HXSws98gGHBwNBkrACS43Y7+cXI49gUgZy0r/GZNIPKy/JPN8P7B7zl
         l7ka80/8AgkEqF1TkrU0Ocogx9okp8ZWEbdvS2NHjuZNXyHmm37swvNp3YQJCl/dBrQu
         Q40w==
X-Forwarded-Encrypted: i=1; AJvYcCUcZShRB0CLV4KhgQaA0m30vNSqlWvVUCoOcLJTdKfnwM3aa4yNApgr095hy2ozvqyB45gtxSuqUBo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2S9h3jw9ViDZqSBmwu9tvEqfS+DwREpxFPIyKaeFH0vl/jlu3
	+7cJc/H7543MeBMha2Q787LPAbUH5qJmSEjjiPSNkt8ywOZdV0B7ck7NJHIlmv15f/ycRM22CHi
	7AdYBzyHpb2+QbYZPr9sJCEZDQdxByOA5cVue2u2OG44xFGrcmG84iy7rfIzDTrs=
X-Gm-Gg: ASbGncvh/y3WL4d9tB2EyX+x2c+dFSon4Lpsky/sTjO+VjxZCsxFU9ym9Q4aZ3iyNQg
	+Jgjt6DCcfqWIxNea1jEJQDsbFv3oLH7x810ivwHpX3RCaUAcXEo6tzocfzgmeSggKP94arhuly
	EU8n3gZ9+jK8q6NUweSUrtA1e9otWsn1MupFdDh183WjWxu1ueyFeLVbEL00uKn54i/hB+E3hMY
	avUW6sOhAFjhglDdQicUIyqSsTs2kIX1cgPHb4LokTGCJOgSTMV5hOV5p/vPJgKKCPzL45vXkc8
	gbCwJo8hJoERtRjno2Pgo+kZJnVYCkBER+u0J/4eV0N8NSMb50+k2uopCBE4IY6DoWI909CZqTe
	p3/EuCI/jtfA801yxCluOEUwIO6qp3XlA/hMC1ln85Yw/cuxXcB2YRO5ilhUi2eJrjvTs9ILtZh
	qrTRvfLUnsgFN/0jlyL2hdZvs=
X-Received: by 2002:a05:620a:1a26:b0:8ab:58d3:6030 with SMTP id af79cd13be357-8b33d4a7520mr2283468285a.57.1764146649807;
        Wed, 26 Nov 2025 00:44:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfreOGAEsPmRqrbfxr2mWsnEvi4G1uQMuG1JaWI/3dNaieR4hyxv1CA6T0RtS406icSpfPTg==
X-Received: by 2002:a05:620a:1a26:b0:8ab:58d3:6030 with SMTP id af79cd13be357-8b33d4a7520mr2283466185a.57.1764146649377;
        Wed, 26 Nov 2025 00:44:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db86bb3sm5682381e87.29.2025.11.26.00.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:44:08 -0800 (PST)
Date: Wed, 26 Nov 2025 10:44:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] clk: qcom: gcc-sm4450: Update the SDCC RCGs to use
 shared_floor_ops
Message-ID: <6cdfi3fgdiujfj4jkxdpjx7fnzieri4ohefcc6dedofwvqysjv@zktuj6oniboy>
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-3-9038430dfed4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-3-9038430dfed4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=P9Q3RyAu c=1 sm=1 tr=0 ts=6926bdda cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dq7s6ZasQgOU5SFiZ44A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: SZN1ByKNDTFsjqaVCEZp4x36C1DOQPiM
X-Proofpoint-ORIG-GUID: SZN1ByKNDTFsjqaVCEZp4x36C1DOQPiM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MCBTYWx0ZWRfX6ba4j7Lpb0rK
 w943ISjEN9GroRiYwN9uEvJlhkTToiNqNzhX60+d0MD3NctDccgr6cbKp525o/83ejOR0DLW4X1
 RimHHRqEVDKUcnm/B77XI9klHRSUPNIr8PTav2epY8GvlvtoqNa3QzvYTHkPSfs5nst54hrqJts
 T8AbFXVyTMQk9X3NGuGvk37gLVRc9EQxvzQ9bRotwFt2WBMluicfGlE9AVp3VIANWWjURkLkswJ
 3oEXAldVi4zgyCjbobYSzly+bpBEB+RdzJSYI5r32N+CaUFw5cK98OQIdGzMIWmopphByrKUtT6
 mfpZ5Ryd8rjPgLBrN6X/UT63EzhZyE77V4TjUjyFGqyqhS8Qfn1yjWV5ui20HSLrhCL1y7NhYJ/
 ZMYChIpJrafb6UWVTr5js8VE2jHNog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260070

On Wed, Nov 26, 2025 at 09:45:52AM +0530, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: c32c4ef98bac ("clk: qcom: Add GCC driver support for SM4450")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm4450.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
