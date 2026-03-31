Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A02B3ECBF0
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948391; cv=none; b=BH9OoR8qOuse8WwLekrf9Yc5TdOdigqz2HsHhntBlJ+l9Ul2ykhGSM4WrFo+ey6tiRfT6vA47vf+Q/2fgzyX3PUDRwXmXVvi9PurPch80PUwajyJaGEGu5K85n6J/nhnexp12prsrTTuK2Er3I4QqJAgFjTmXRHQsAnYIE8zj+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948391; c=relaxed/simple;
	bh=Bdo8nbx3rVkNTL5HDnpcpago/e2UR44Mc4Mq4d7wBRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C68kd3/zYUCQKIUDBNU2+U4tC7TNwIdxb3gYAaQg2qapuPsKYXc4RukDQwyrtc2iGe1FcDVXQOy9i1XQ2KOcMkqKPmZ8bMsnEMj1mlxBg2lxbXnR044RCI0V9T2Sl5Tt0+2szutrMb7bkzPQBsYJvfPd0dZLDMD5J1v2KW5tH3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAtSHiVd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+PLGMpO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAtSHiVd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+PLGMpO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V918hs2761505
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MXPuiGB6wexoK9zZ14N4Shw9zVt1WFOElMC+KTHD8k=; b=DAtSHiVdRmd/EIvS
	btT2wXWxL3qxeTzHq9TDsePKtAHXsKPJZVC4wtCHo9SB5z+Uj6M5Svt+svXCG8YM
	KlbPrhNAP3j69zFYb3AYTeT90IsPAr600rhJbgzdfgTt2K4DrG0v1y2OHNIqD4Pp
	N7lVdnZUByL6Z4uKkOT2qV4vattaW8of2mygwyPYQZKMsHtAvUwydeZpqRkjp1kR
	gqvmG9Jjk7Z/E3Ai83OZ2muNL5UR9uARiCruyVHJea387W40yC9GlxqUUgpeGHdB
	00ANadrHfTEJaLVOEdPoMiuWhuGkpMyOCtzdTRJja3KYg86s1/nb7DdX6rjslbWs
	7htmUg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b9301jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:13:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a782029b7so4068273b3a.3
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 02:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948388; x=1775553188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4MXPuiGB6wexoK9zZ14N4Shw9zVt1WFOElMC+KTHD8k=;
        b=G+PLGMpORUzSK7iGAnHJ7j9u7pzJ2IjKXwDkQrSK+WHGtvQzRp/eP6NeOLVeYU405d
         AMDAh+2190oH1z8ghL07pmUpv+DYgq6jp3W8fC3NJZcys6Bk6Wbgb0BU7Dzn4mhE7u3D
         ekRqEKbASXBMsFmO4+FjMK7A0jNqPd5bwN6V5KYS3pgvEf3rN+zszxek2dx0UVvbQ/Kw
         dGrwlsr1UWMBcuUkTVXdbFbZfQSvw0qd6kzjMun/RIbKx/0ssBNkmvgFl4pKPR5zTTGH
         HdL49K63771ek5XHPib2JSjW9rLqNi+fyiDuQcpRt9wWYjeNLohxQ062LbOGJGN6ORoP
         2oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948388; x=1775553188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MXPuiGB6wexoK9zZ14N4Shw9zVt1WFOElMC+KTHD8k=;
        b=gzKGxgI2rkQLxB7HKggbCFTUZ9sLwmj+heGEbL0KyrzEKRIodhM99UGzGBcvhrEoUI
         rJgZThUN3j9gPXO8qwqdnFSFaonftJhdwV8Ok5Wji+RWMxQZbQ6LhI+OtBQeRevzRlOv
         qTcGU9ykLZIEjZaAU1aeCdMIkLZQSYS/YoLHx4gFjK6ESnrXIjiYDX/o8K+e/vhVrtFV
         r/PZFXOL751jUvJIMFCK1QdEDw0Twj3AEZ7izoamnAKOtoaDFkpR+hJleW2LFSMTKkOB
         Gjw7HjV8LphhGj1X6z6imckmvKlkp+sSPvuEqfUi+cx6wfJ9jCFqpvrBiy4WR0U60MCY
         V9ig==
X-Forwarded-Encrypted: i=1; AJvYcCXqDC3LkYdsT+CeIaJIeNdh8sV4ia1sjVWUSGpfcRfBd5r7636ajzNwzFl8x7y6EWP4HiiBHTaJTc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyptB6hiGuRvIFG+dd6SecXHKfDkDylzLsors655O8zCJ3x2ikD
	73+vCHFs+/moQxGZeo10FmJvq+MK0X3+GvKdaIAS68ptPZXmi0LuGgcy5JXFtY/d9OtnGljbaJx
	B46sEt/nNNLlUyvF9pWUFnXDnyKZ+5XsZpkyz/nt51K3vEc882M0blhd7x1m6VdE=
X-Gm-Gg: ATEYQzzYzFFFwBn/EiHMg9gskWRidsPcdWtZ9M0w/bpm982ArkQ2MEcjq47IWiYKsrC
	iXtlz+lTWjNVCSdVlhKJZdh0FqpB/9xDQoHnj1sdfYBJ2/v9o0MzMfT9EFOxikLCnNYRVyjvQGn
	vEGS7svIVbcD9Dp6K4ZGmB+WsckypUzfy4Gcfk4EEVQ6+LeI80v2zO5x31PklzwwJ0X94POhfHV
	vLE4A5fjJmzdKLKFWTIim2jIA2D/OanHEh5mzL0Ad6nHQ78Tf5uvNkgCKgyKQcB//MlT2MCgq1m
	iGI/HWB/WjVkalrh8Ubel+nVkwHET1OFtanWGqNkq/7+Ho4xTU8PnCJPsjVCj2eirTy5KdkOsgt
	VR6Bh//ZJqIufMOR6WScVPxUAzCQg75Dxtjcyn2X77Z8U1eRiog==
X-Received: by 2002:a05:6a00:299b:b0:82c:2205:507d with SMTP id d2e1a72fcca58-82c96025997mr13153917b3a.36.1774948387602;
        Tue, 31 Mar 2026 02:13:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:299b:b0:82c:2205:507d with SMTP id d2e1a72fcca58-82c96025997mr13153874b3a.36.1774948387127;
        Tue, 31 Mar 2026 02:13:07 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843db09sm11106538b3a.7.2026.03.31.02.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:13:06 -0700 (PDT)
Message-ID: <aeddef2d-2d61-4fd7-b25b-9eec8e2fceaf@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:43:01 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] clk: qcom: Add support for global clock controller on
 Hawi
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-7-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-7-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NyBTYWx0ZWRfXySwYA7TMbnSq
 Nnv+Qz9KSlQz/NUZXhb1spCwgiR8UGt8BxMJBmdvIrGL+LpPQ+X1ZKtKJiC/DaHP1JlTi06JMOx
 cLLYSLNHpXzGnBG0QiF8PM+FDwj6XAkXsim1vFYG8vABUsQyi2g49CWYOGudl7/JT6WeVnFMMR7
 pXHnGzl8pWSKlYPSjAFuhx5Bz+rzPy8ru2JT/SwssdGRoLup2Zo9CsiDtwEs5Pxg2xrHdFT6/3k
 jnYzRdwFJFGT+81yiYzluoXqHiZwCrK3wFw6/Qic3bbgM4pKG2PSY0aBNBFpgCZaU7cqKWzgVHb
 x7q52j1nG5HN5GcAUTJSxptoS0qieIdKarh96XTmAWjawEs9Or2CnEEwTClxNxXoXZz35trbBSz
 j9vbY7KpehLqElK0S73sF8KlD9A1YOHVsoRtaKKuBdrSUbrd8AtnsSGcvKhu5tdF12h8rWQ5gro
 K5ssFb5e5d8wlu7oWqw==
X-Proofpoint-ORIG-GUID: xwwio_aUf5KfEnB9H9wKBtEr---qsmU4
X-Proofpoint-GUID: xwwio_aUf5KfEnB9H9wKBtEr---qsmU4
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cb9024 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yIexR1LhTexBxIJ9UtoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310087



On 3/31/2026 6:05 AM, Vivek Aknurwar wrote:
> Add support for the global clock controller (GCC) on the Hawi SoC.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig    |    9 +
>  drivers/clk/qcom/Makefile   |    1 +
>  drivers/clk/qcom/gcc-hawi.c | 3656 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 3666 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

