Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BBD25A640
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 09:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329644; cv=none; b=Bg+ZdqFZB1Hj0uG3tv/49gM8IGGbVT4v3OGcHs4VhIE//LDOeiaQdOBBoM3QFexkd7Kj3ONIEZ+VGqcOKtwp9fnVDYX5mQR06cqVzsnCftwSINdoLfhwDRE5KyAcHHGbb+yL5I6svStmcEWTRU8t4Xbt7W1FrXkTi6a7HJBT0Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329644; c=relaxed/simple;
	bh=N9tVBTr8t3waCPY+XEJyIKcPA9jdO70W+bS4TebOBko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5nIDmap9vVFL9n7rWOdlMRlOOUZ4t55ZIKkwpVCe4E755m4QRuXSzPX9w3ygFuKEsXAk8qV8dk5JTqVwi3JDpAusjsEIBeokgs5w1wX/Z0edyG76gFEctBwNPvOpeNyW27tjOp4rGAWBDty4BYee0KJ5Vv6eYal16li5n2qgKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgOgzu/n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LfKpyT5T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgOgzu/n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LfKpyT5T"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Z0IP290325
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 09:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g2npcCD6Za3KsV37UaG89Af0
	gmWe9hSAqlImTDYucAg=; b=DgOgzu/nM+HWA3OPIVt/o1efvSRZVWSSf/1eLkwg
	Hbz+4ixnrLozMbpkVhP2Hkvl+aJsljetNljy3PUC2UXh88rE+c2gHdLC8R2DLU0O
	UovRCqbl6qrdRcLDhs+4MlM2o32N6BKs5ZPfYi3o2U6kiXu8s3ppL1sDLGTEE13F
	0qcFUflJvP5/2ZFQ1s8WA82YGlcjYrpT6DRq5DVsNkUe94NPOf2uAge7LKAa1Hlx
	MOyhdHHoLpH1qigAHx2svY6Wo57nBQK4TY+VTcrzejPznSjgIoPINrIKvegLnBJP
	N4AnFy/zGknv8jM6BFhWRPUX8CB1J5Z6GZbyUmCuH4aYsA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881tyup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 09:47:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so158232185a.3
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 02:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329641; x=1790934441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g2npcCD6Za3KsV37UaG89Af0gmWe9hSAqlImTDYucAg=;
        b=LfKpyT5Tz1V0PwVVA3k80ArrunagC9fkHXIhk4p7MXfdYx+WfRKNFF7klP8nZ5vwwn
         cCMBpVrzL+K5uILG6Jva+coPR3rG5JQrGBmv4PRYSlOi1timULqiVA7+bAD5Fjg5sVJs
         1KVqa4od9tE3qF0MuS/GrCdeRwBkbqFqvzmiUD1CPleVEQe5f/HJFV6bpT0pt/4kWTVa
         b1fjLU3W65yqgeWlaKZ2EMqdoUfI+AdoBXfrtANhJ239hTjqdISKvKKCXSEKj6GXjJcQ
         1CJu6TJIWkSr+22YCXlmG4PNpLAfTsXQKA3xkETNP7UtNJjqjHbxD0FLTHAOJMqhICaX
         h86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329641; x=1790934441;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2npcCD6Za3KsV37UaG89Af0gmWe9hSAqlImTDYucAg=;
        b=UFqYpB8UEe6PVM6W9pM+x0209TI6V2vhsKIeHvZF6fplOWbpSnpK7RtF3fBkdvXBsa
         VWo3dgvtba3/4/AEZXu09mGTjiORQgfafNpX/WzGxK0UNFsZTWJx6S5sAO9brASGKC3v
         Kr5OYG4qcwCFbjieyECSGwyogZ7puaq6sJTM2DyVifJaoJN2mFVW8pdrj+TvJjckrtTt
         qbHGVFcWQ6B3XC7FblT4bGWzAdugMdsJH8+gQW8C372HjnSUtxFH6ZjFTbgAohhI6in4
         sxW2yWPApJPgqM2WPjiuNm0l+9wlBKCTyp7sTUeTu8Ss3jLBrUWllS/RsZzWjydFUEAW
         eCqw==
X-Forwarded-Encrypted: i=1; AKwUvBzYJcQYj/d8YCg/KcWRJllRmE0baH3YIa//VpiQandeu0azoWonVpm/SbsHD3UeAQ5IYGqMuCH7XGI=@vger.kernel.org
X-Gm-Message-State: AFuF++nOF99ZahkA/BkAReww/UK0Xf/G9fp6VK6uweq2jKcn9p7xB0Ba
	FGCzZyJqE2knLwp7pfb6xjlPSSi+wF+aEA0Fv7fQPSpakEB7Y0+A62ff2pbvUsvUTkUEutEn+sj
	/tSZdL+keBeV8EOLKykmsKS+UU73RgPFtAteiW5cD+7TpRywRMtWgquLKEd/+BvM=
X-Gm-Gg: AYBFou17seaczosJyt52G9ORP3M2qiCcq9MNklNdbCjKBJ3jP8FVB5x+Adn2vyml1JA
	GDZM4WDBDDCQsFnT0ssduLRweC6PxusmiTC2WSbWBKs/M50q+C/ngxcMqpsHtBa+GHBMRTxDE3b
	k5CzJ4X+9odBt0z7OIb8k729UtxouE0bF+YGQqheS58HscTKFca18ybkOLa0KgfuKJAjuza4zXz
	crMCeHoH7N9sukj5mXeKWUSL6dID/sxMlAoh4YwmXFaWqCzxLxCE+ERwkqmzkNCoPgpf4CseaJQ
	V8bj/zA5ZnPCupfiD9+lGk1gvWNco5p04knCq9AD7uxq4Q2fMggbEF+UslTgh7QpHK5GT0WiqS9
	VUUYIYMzL6Zcm+zg=
X-Received: by 2002:a05:620a:26a5:b0:939:ff85:8067 with SMTP id af79cd13be357-93c43d7bbf9mr341795685a.30.1790329640608;
        Fri, 25 Sep 2026 02:47:20 -0700 (PDT)
X-Received: by 2002:a05:620a:26a5:b0:939:ff85:8067 with SMTP id af79cd13be357-93c43d7bbf9mr341791585a.30.1790329640010;
        Fri, 25 Sep 2026 02:47:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5ce4941sm133878925e9.6.2026.09.25.02.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:47:18 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:47:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8750: Fix videocc clock inputs
Message-ID: <3l6v5idon2edkritzyqlmvdjn5ijt3lytp656sxicfnqah2rga@o6plxiv5d53u>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924161152.1162301-4-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab64329 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=aLDl0Ji0BZWZ-61YdcQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOCBTYWx0ZWRfXz2CDZBaERlJa
 ejAC9ZAVL0EpFcLDzKMmR41HjrMMi7OlaVRhxJWRapCUzkL9SFxKK/ZaudUe4UTdPmn4D8O8zWx
 h8wq256vTzonqAzmbigLnuiVfLlB0ezQAPdoScGLSeN/jiZAg96J+jPhQLHS3EuSwnyvV0tLram
 b2mgVmcsJUwGN/TsejJmVSRas5PJMSrS3ret5d79GR4s839AHkExzk6dLdztkInC0knAfp7ffZF
 uc8C8iDR1v26ak8ZB4zNbYc3L3HtHWfeS3ItVY8pCotoTZPx/hWRgxSQhHwTS+h23vQUxR3fj6h
 z6A3n0h0Zn6FsVgY5ZYhqq2FbaoZHkDFPdlwIkDFl44JfnJCX1MnKL5RSl8Ml7kkJuYi0wDPNZS
 3SsDm9rQEw0rYFVsqN5JVolS3KpMUW3MN7vc0GKzP60GeU76jqPaWrLGzyjWgVTznw3Pnda8/BB
 9pnqw9vFnEZKa8djeCw==
X-Proofpoint-ORIG-GUID: rkjyRzYaXlV-hs6gfpR7mkXtecfARx9A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOCBTYWx0ZWRfX3sazoGFhx7Tl
 wmhj+7j8CJP4zVANvuFV3Ub+Xy5eMkq4oViMdppsfOlRR458g2JRdTIeRAmMdr4yj46//Z15+yi
 QN7mf3FCCw1zlfCzV3OxX/V1Ad5rg+0=
X-Proofpoint-GUID: rkjyRzYaXlV-hs6gfpR7mkXtecfARx9A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250038

On 26-09-25 00:11:52, Shawn Guo wrote:
> The videocc node passes GCC_VIDEO_AHB_CLK as its second input and stops
> there. videocc-sm8750.c declares its DT inputs as DT_BI_TCXO,
> DT_BI_TCXO_AO and DT_SLEEP_CLK, so the second input is the always-on
> board XO rather than an AHB clock, and the sleep clock is missing
> entirely.
> 
> The missing third input leaves video_cc_sleep_clk_src unable to resolve
> its parent, so it registers as an orphan clock and cannot be rated.
> The AHB phandle in the always-on XO slot is not resolved by the driver
> today, but it implies a parent relationship the hardware does not have.
> 
> Pass bi_tcxo_ao_div2 and the board sleep clock instead.

So videocc can still function properly without the GCC video AHB clock then?
