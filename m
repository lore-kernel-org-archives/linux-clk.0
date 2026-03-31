Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FFC3DDDA3
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948216; cv=none; b=pTbmLA/5u7m6ythW4wlfuKegFgQdmvNXR7XMCFFJUMGfT8IWBKLA3nptRHxQXi5IpMC/W4dOBwgJjsX2915+f23HcsLnDJ2+iscJzlLaRI9fxonMzigvMLnw4vMHDYy2os4YZjQ4hG4VpECRHtqUeX+sEhVldT0TFRWB4VqR5Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948216; c=relaxed/simple;
	bh=W6f2/brHu57FxwFBNFjV6ofetOPfVwCRNfQoK+jYaKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rHXK4C53CyhiFVOvahVD22mAqkTuueq/E2KtvQOsin8O37UHi52vDpEPZtlqV9hSsoDHrCAgs64AvjJ7jgBIYr4GWHZqKcq3kyBr7HzztrTzCq61i52OJAHXN5pMvPQneJDfyG3+4pGa6dFZO/xcbGVAnYMw7n2YFuywXXy6Nbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbxAnk8Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCO3aVdx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbxAnk8Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCO3aVdx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6a2BB2391342
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4SE2VJGw0Sj6G7Ihm7UUx/mCU5Skr+1IWCE4i3UPs8=; b=FbxAnk8ZLojmMEd4
	S420RzF2f7meVR3I/frxA0WMsAehVUoEHNsp+q9LzmbLCYYk+askcP/t8WeXds/k
	pKsWqa5FxoiVYle4DnIb+MbAtjyYNPU6gP4UQyK3/G7FEoj/1XwkYJQYOuQXeIy2
	KIzSMidCVISXdgTd6RkN2l83mQu6vjgTyQfD0r6aP5Bi3sT7x4kJPSs4fCM7na42
	Iz0rTLX9p9fme4oqx79JEuC5a7hy0IMh71WVgxCYc8MQok5l+NQcnrfDrhjtVFlG
	/W515ns7wtqDlYQHZbdbsbf9wjybi+jxyBW1tlsvbp5yf1wSD0LWkP02l6gebLPb
	pM7mFQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7krk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:10:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3568090851aso17322278a91.1
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948214; x=1775553014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z4SE2VJGw0Sj6G7Ihm7UUx/mCU5Skr+1IWCE4i3UPs8=;
        b=UCO3aVdxHLqROXThGBm/6RH29r0efRlwZJb/Y2F3uG8pVtFqeEXnpEjF1K+urfHrfD
         +DCm66Y5C0W3uppfhxu/Ohy1WUtPzwwEITlebe5ahszFe+5GzPkCXS65aCOeMpKXvb44
         Bx3guw2DgklEC8IXrC4oC5G5s99ubBY4+6K/v+S8y6FeRWYA3E3LZqWpwdagbqMao+Fe
         GST7HBD3WqQ+mOzowE1YvNOb6LgLQNu/8tzLwEQYVnT2xWuEQhfm7eQY9h2bKrpeHV2V
         gdlsa+GAhJb81sWsFw96MS2BbkbSUHoJvkVC3VwQyPYfXuojPjNnI819GhMmGG6gY2hc
         zjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948214; x=1775553014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4SE2VJGw0Sj6G7Ihm7UUx/mCU5Skr+1IWCE4i3UPs8=;
        b=AgbXrrcEy0QJTdE5uqJko40yaNNq0p01ugtSBar4Y0tsip9+k+1CeP92qS7Ue5TzrE
         LbfGXi1WFk42MSZN+sJ8P5PHFMnzPK1dF3mYy4P41lY0f7J3Mj+RNqN6IxEC9NmUVGfd
         V+7PTgKUrEmjRNiYn4/FXKZ67s3o5j/YibOBojmM2EsKWgzU+ZLlT3RbQq3Ptxpqs8Yf
         orLjbHIA832PAu/Oxy2bT066ivOpe/6F8lp8i7Ri70flj2VHL4SJ2WHfvliF0/9TRhu3
         Ah29vxySe7YYVF4pCQJaSBcQ0q+SSaS0UT8ZVpeyyjwXAs8lLkurFBBYltvQu6LFsiqR
         1tfw==
X-Forwarded-Encrypted: i=1; AJvYcCWt+jhUKpdvKzq/gtr/vApqShzC+oOmuyxA5NtgbAFMvxzb9WHPTCI04rBTtlg31PgnrnnUDKtzPfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlXzLUO649VeJPGZRSAA9efxmaV784r4bpvJ/XfATIP/zH310N
	kBzZSlqDf9UhuoiEXKOH7QzMLncEqAdJeVBKVpihfchzlySjBnDBhS6oZMqzY28WODU2qdnuGOs
	JnDp+epV9S2vPQvfyUUu0g+pxhg7XhVOYf4vHFXRs2raWPGNb8k3rKtCYaEn1aJ/GzKmUm1M=
X-Gm-Gg: ATEYQzwLmjrFSzQhHnmmpZ8/hdWBjAZGWK5w0IfweVY7elj2yGChiew0Zpj/FHNDtUr
	zgF+Lyxb4bms0I/mHxp/RCGYO5lDA8MbP0zFkety/X/EpDMNPYEFnQAZouQBR/TGufiRMnQeW1D
	sgG+EXbXZrUy3nW9aZEl1r4Y0zAybqcB5Z6NV7YRtV+CENqidx88mq5/S/CyLiGDSftCzqpobiQ
	jVB6rl3aIcuwvzLLKPHwW9m/Ih1RXxUsX/JFSJ/2tSBzJP/IGFaqqiTjrb5w02s2Y5BV5TnOA3Y
	H3gNdg5hjfXJeaDJNPmww0eHjlWR6WQeAALXzAn0ZNtPhFu9ukywoipGRZHVwnMsRw+X0XlXBLo
	20Szl8eFvproRK0gNIw39tfIBTSGNJ3AUjnEWgQ1+hpT3oqyWzA==
X-Received: by 2002:a17:90b:558d:b0:35b:9720:98d0 with SMTP id 98e67ed59e1d1-35c2ffa8265mr14652334a91.5.1774948214108;
        Tue, 31 Mar 2026 02:10:14 -0700 (PDT)
X-Received: by 2002:a17:90b:558d:b0:35b:9720:98d0 with SMTP id 98e67ed59e1d1-35c2ffa8265mr14652306a91.5.1774948213675;
        Tue, 31 Mar 2026 02:10:13 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2426896edsm105916705ad.34.2026.03.31.02.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:10:13 -0700 (PDT)
Message-ID: <d16efa5d-2213-4875-9351-de08adf903e3@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:40:08 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EHA_T PLL
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
 <20260330-clk-hawi-v1-6-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-6-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfX34U/XyFr51EA
 mUvq7swI+PrE7KlN4BIemUWfDRxfUXbCnIF6FHAO2HMwSxcwFpXW6CnvM7PbqndJVgLr2dbqrqJ
 HnABbyCde3KVYRVIosAM5HefF07KXvgdLSG2c33ty5XxMwFeqIOHSXB03j9OIhP/BMyP9aAM/1J
 xEIpQOLcbfSboWj/Cf4E8qiZNlORywUrL97Q+98xyBZjWLjc0+cBj83Vku5ue15DkT3676sf45W
 805SOasjZ35pU0ZoFI0RDkbKb/MOD8fmWgVep6dYxIn1uge/zTP+MZJUbJSuxs3SnNdjRQ/SWgY
 UCBAghOHL0Yaread4t4bsCAHZE7hzu/lCiato4iMbwFaUJCd7LI4Pmv4GfyVfzinxPd3mQbMdSY
 RLmSEU8BjELNoMT+LLUyP6fuWMp8jrwTV4J4JTgOG495p2pgTuvdYycaMzmjzM30HTwFf5EVj+x
 P9b9s6311QtHobjoqXg==
X-Proofpoint-GUID: 13GZ8c3X6HHllg3ZnBNuzoSFI47PndB5
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb8f76 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ejiLYX5kVw-NK1-vaKUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 13GZ8c3X6HHllg3ZnBNuzoSFI47PndB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310086



On 3/31/2026 6:05 AM, Vivek Aknurwar wrote:
> Add clock operations and register offsets to enable control of the Taycan
> EHA_T PLL, allowing for proper configuration and management of the PLL.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

