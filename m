Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC1D294A1B
	for <linux-clk@vger.kernel.org>; Mon, 28 Apr 2025 17:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861967; cv=none; b=Gf2DP43NvxfxwmZjIuZyb4BoySwXVTQw05v3oCDA4CZN3JQN8NeFgaFCuTvTpFDZubuXYH9tNLPJkcfjZr7bc4r44IRdeV5W2PEDK4ypZ6yIybO/xsNExrlnGRwV2KzppfeosGhnR4jwtYABRBr1gyPG80HH/Q9uhKLUQC4ZSxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861967; c=relaxed/simple;
	bh=rMdgH1z5b0XG645DmwX7UvsPvQa6FdO63A/yWAGC49A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGFsQ5TWHC9fvYiv2VHHvLEMR7VBEpyQqO3SZQ6Es1YxMfZ+79JO4j7hb0DJjxQ74YqsBATEyjmGH59nt7Xx3O7MojMYDgUp3RcsX+WVF0hwElP002FbE5iL2QGQhYdWSaWS7umvOx7dqk50ZsXk6Ur67UQexZ6Z8u/s0f01WI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRn34Tw6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRn34Tw6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9n3g8018506
	for <linux-clk@vger.kernel.org>; Mon, 28 Apr 2025 17:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mI/HiKaz9KZWlPThwibrKI2Qv9tQ/yegSAkRcgBvHnw=; b=XRn34Tw6gst9RdeJ
	WRCDsskTUaVVsaraYKEiEir6D1c1Tm2kuXswuytZ3MrWZIyA9OK3GnxAGvSBjqXe
	hVKaud5gZJi61BobRXh2aowP0CzI/0NAmquMIzoWvNDa68WRpy2AseZhQCBVtqlI
	m4bb4q+62IqeNJentXx0RH4cgprsupH8p66kKk2paZ+x1LBE14FOpZXqJsh+PfoW
	chxayRC/FfciaMYTlcaVPpD438D7UNJrsKbCzwK3wQEA3QXaEXvDd0kRx/Kd4myF
	rmPq36JDPhgvo5+XupUotSGrYwAE5fJrQwG74UzE8INacgyAEXiMCY1L/XuOjkAm
	bW354Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jh70q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 28 Apr 2025 17:39:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b0e0c573531so3097925a12.3
        for <linux-clk@vger.kernel.org>; Mon, 28 Apr 2025 10:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745861963; x=1746466763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mI/HiKaz9KZWlPThwibrKI2Qv9tQ/yegSAkRcgBvHnw=;
        b=iONuAnfJbP4hrUoy/k/nK+hTQ3+UjAU/VJXS5ut4edLVHROFdYTVv9EjDovU6YrKoo
         94Gp2wD7jXw/BfmDdkyYeFAHOeMxDvjJ2rgOnRra9rYLcj40/dgDuA7Ah3RBfyLsqBSd
         /C7H72qmGNtLMtCfKEDk3pTi9FK4pxZtn/yz5G9tY82ihJDDkIFHRpXx/kSo2dNVY0/l
         mJVieklsGQpIsMeJ+dHJZz3BRkJygkKB/sghyiln5My3WYqMNDkSvagvsjP9AmAGq4dT
         gxy+TGvR5TFkzUGrFsRbGBArzNa/NRw+aT76c8+JNfkAiehic+7GAjXhT5rCrb+OXhlJ
         0+0A==
X-Forwarded-Encrypted: i=1; AJvYcCUVtgiqx8/ksJ/yNI/rzDu7suAeEjZXz+tn3S0NVB6F13qElH3jckPW3MW5OgxhcJRSfh2TT0dTNCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAGYCU3MSgjP1uJ5ciYcRC9GHb1Bu8SyQXa0eMjyEMs4xZKm7T
	aSXGLDglsP5mV1+LvpUdhqq/hN08fEWKrnPprybi9UU9yBB9W+Q3FC0+kTDYwznN8i9qXWAks1F
	jzJcalSfyZi1pmenRtj0Js0qRpdpUkmEcIcyCb5zFolN5g0HTwpC7oiir2YA=
X-Gm-Gg: ASbGncsurxT/ziYER713Y/nfjj58GwkYWiUx6R9fn8yBkWyLmjnguYXyB0PfyU/lkuF
	+Grfm2NJ61B6pgU0xhWaVOmEY66ykN2mdzzsC9/rfUvMcPlnu8H3I+mARh6IkzzUeyPHuJaOfqj
	PzXJcJNnsUM9AN4OGTNMKxFth+UCZiaLnuvrJEBccT0zkM5faIGGyxJMkKhKs7R4XVp7qXXgaaz
	bG6ofwTkAfBqEEjgvX3ty7PsQh0iLD4Ev7Q7beHjk4YlvE+cSByZeIjBxn5rDmOlw+K8ZoEieqC
	wbCBjs7kpzIHhIp4Kd1cwrFDLEN6ji1pMbJhZu7B
X-Received: by 2002:a17:90b:2750:b0:2ff:784b:ffe with SMTP id 98e67ed59e1d1-30a220c47c6mr285894a91.11.1745861963250;
        Mon, 28 Apr 2025 10:39:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR7p2L8d/2GX19iNf1giRAg/eaumctlcwhuhNojkhH3I0ZDBZ89gVbUpJkpWFzmeY2sqOP2Q==
X-Received: by 2002:a17:90b:2750:b0:2ff:784b:ffe with SMTP id 98e67ed59e1d1-30a220c47c6mr285857a91.11.1745861962896;
        Mon, 28 Apr 2025 10:39:22 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.26.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76cfasm86047575ad.47.2025.04.28.10.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 10:39:22 -0700 (PDT)
Message-ID: <59c49a34-5bf3-4f10-a98b-bb63dfd58f40@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:09:18 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: dispcc-sm6350: Add *_wait_val values for
 GDSCs
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
 <20250425-sm6350-gdsc-val-v1-2-1f252d9c5e4e@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-2-1f252d9c5e4e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0MiBTYWx0ZWRfXyBN44okx7A18 OMPIguNMNEw02jt7VfLy96IaLiQVNFtF3PAJwLiuA8V8tkLdgpKbfJqRVpYvCpNkwhCX6rp5IZk djz5QHpvVeWQ5Szcu/ZXlJM+AfDShqHIe3yGPxLk5f+jstyg8cmf53ZPbXRFZYVX/Gq/Ntm1bA+
 dGZ8a2AmkbwVMWELdty16Vb8kof6wF6WivMjatb6vDRmT15jcfZKEserHK8B4X8t5FuMZpGu/lW dsDp/sIQYDA8u7XPmqA+mLuZYnN3a+dq7RwRHyvFJid7K9i73t+Tp7eAnrfzKxIUUrNPvc1Cw1j 56WIxFeKVrhuKKPUFOog11hGDZfvLpC3G7eGSNwSpgRMq0VU2CDdVraqO5DTWQRSzTegz0A/Wa9
 YjU6OBisaUt/hdN3jskYa5Ib8qEHDgbqO+quPDTrgKvvakXoj/55PsDLr0IPkezi0VNYFMLZ
X-Proofpoint-GUID: mMMRmmJ9lhtt5CKxo5trKnLaMwjhA_aS
X-Proofpoint-ORIG-GUID: mMMRmmJ9lhtt5CKxo5trKnLaMwjhA_aS
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=680fbd4c cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=Svr01UFivMFfsnZ9dZkWgg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=COk6AnOGAAAA:8 a=6dQnf3u2Ryt8jKbU0REA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=Soq9LBFxuPC4vsCAQt-j:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1011 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280142



On 4/25/2025 5:42 PM, Luca Weiss wrote:
> Compared to the msm-4.19 driver the mainline GDSC driver always sets the
> bits for en_rest, en_few & clk_dis, and if those values are not set
> per-GDSC in the respective driver then the default value from the GDSC
> driver is used. The downstream driver only conditionally sets
> clk_dis_wait_val if qcom,clk-dis-wait-val is given in devicetree.
> 
> Correct this situation by explicitly setting those values. For all GDSCs
> the reset value of those bits are used.
> 
> Fixes: 837519775f1d ("clk: qcom: Add display clock controller driver for SM6350")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/dispcc-sm6350.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
> index e703ecf00e440473156f707498f23cde53fb7e22..b0bd163a449ccd2b27751e32eb17a982facf07d8 100644
> --- a/drivers/clk/qcom/dispcc-sm6350.c
> +++ b/drivers/clk/qcom/dispcc-sm6350.c
> @@ -681,6 +681,9 @@ static struct clk_branch disp_cc_xo_clk = {
>  
>  static struct gdsc mdss_gdsc = {
>  	.gdscr = 0x1004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "mdss_gdsc",
>  	},
> 

Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
