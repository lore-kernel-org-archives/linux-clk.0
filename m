Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F43296BDB
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 06:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691206; cv=none; b=EIa6UdsIOII85ssj69IP8sLzOWw/LdpvoTBzWQRSrNxQwNJgjpMaT9w25mSZmSptRUMILE2OA/8XkvDIAOkkE4YkxeZo0wp+xmfBCsY5Ck5vM9H/u6sZCMUDMjMFfeLBuRSSlcTcIv0SN6+2jdzKrbj/clDxlP7kIiYPrgLfLwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691206; c=relaxed/simple;
	bh=vhrvQ9dwq0ppIGuIa309wg4+kuzVIOdkYprPCJQPGJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=myO1pzSWcfIjqZQ5n2alsK6Z0pkgL2DiBJFM800h7IPg5G/NytNC5ACMz5FKVFo1fPC5N99wnIeO/g6stt1O9tKpWyfphpWavvXm5WzYV2a+m79x/nW1boqJ2kctyjquGxl59ieiL6CzqxxJilQtlRNPmylrc5QQ6YnQlsKVc6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pYPtjXOZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVwGxuxN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pYPtjXOZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVwGxuxN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BpwV1193245
	for <linux-clk@vger.kernel.org>; Thu, 5 Mar 2026 06:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8TIHuv4Fnv6rdxui6Fmzo4+u4z36yJPLBHyAOUxU9hk=; b=pYPtjXOZIek0kWUd
	fUty2YMRt5qNAlUvL+tteCLxkJuQi6aOGgGmAfwW08Zo4BHaiHbtt9Xjz5Z1KE+z
	p9jekd0UdThbDo1E5SxYteGw7Eyuv+WYEg/46aHNpX/TaPkQARl7NkPV2ZqsUJC7
	oa0BGNb03zWRXH2PuTJx8neLF2gcOMc8JLPT4rXbrq20TxYUAFg/8y1Nss3DYQL6
	vQSNkeOiVEQMnFzySOE0j+iY45aGfqYsRkYuINE5c5yR+KztLPM756bdjcsk+hIy
	/Yi2Bl9Zz5UDx036pNMMmya1CF25UShd4TtHYb6Aw/GB7hsCJUDdVbB7TVDiE0TH
	yrJswg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpqwga8sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 06:13:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae4f27033cso40998155ad.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 22:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772691203; x=1773296003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8TIHuv4Fnv6rdxui6Fmzo4+u4z36yJPLBHyAOUxU9hk=;
        b=TVwGxuxNlF4R0KDC6CLPWpKL+CcHRampNt6GAmk2txJG6CMVJojYIjArzKxNs5Rnid
         EQv4ok/dWqZnGwpnxgQjcwzGnvjc9ENg/gn2iX83xa8fQRJebIFp1F2fiSl23o9hi6I1
         SHMm2N3+S/vrfkLNDAqMfW2ssYlGLEM/bg+PwkNrKBW8jkR018Y+EEeG5JB1QPKDR2qc
         g/pc/xDd8fFLn13ol0SbaY/leVjJSmCmCSVZA54BinKeE4ODwsrFWnpralZH1Gqs++ZX
         rA3tnaIfZWiOzcrEhi43O2Pv7mtsIF3cEK4j/yErq85cTK8ntJ6G+ZKE/64pSTzXMbOv
         R8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691203; x=1773296003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TIHuv4Fnv6rdxui6Fmzo4+u4z36yJPLBHyAOUxU9hk=;
        b=aMURlJSjq6yW2jKQiiCgAF+7Kd6iw7QBM/ItYh0YOL0iNLUAVhAbEPqbsQGrHrj99f
         ARFLx0Ll8323OSOzMTedooiGub4dVDRL9TUo3WgKbLSg/NmKi0ulA9rcwUVbG1ojFWrI
         lTeiO3enB1DcDMml89fAwqGPxK3VJ+zGEAREQsTcH7VzsNlQ0RCh/aX3Ui2dgDlc6kO/
         rHj+Zk2Sa84jcVeeYEvWWNe4QM+m+ilmAlqH7yl5v7jNQ9w3nRnt4Bqx2F9dsOUJ6k82
         +u35z79i5RopD6rNXZ6x1eLHvGfXUrm8zpDEB8v1Kr5oKVxF5asda71ZoRrURVzykpAz
         vyPw==
X-Forwarded-Encrypted: i=1; AJvYcCWnm4k59RnSPdrJ8UzZNPuPO+ZrMoSQ5km269lAL5JY7aJgbyDf2yRvKzVnZQ+U7l8g7dDwzX2Y2rk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjEI6U1AGVFtu4UXtoKF5qFFwq2+naICFFTtbSYfpkAffn/zn/
	7ShMFbg8BJAJUKw6hk5piaBVloADA6vBRW2O7k56Vi8QvbS8n9UoOcWugfmyjY+EN3baFN0jnQD
	odVcjgwjMoe3OqY5DI80b3AyrUinXKPr3CaI37a/rXhDiCsufSvsL9+VJlH4PPXc=
X-Gm-Gg: ATEYQzyUX6JBzkGNQL+VLocpJb/BaBdd3GlAbARzWVUwbe/fsqQjOm9Tqysjk5Sg3Ii
	KCSP5yWBXZ/E/M5ibdDGkoYke+zme96stLNJjgJV4MPudzBSEVgV/4s4/MvvzfSuwxRVHGIhBlA
	1/Bb/BC5oX1Jdfdxmo214ykScVeogaBQtt/aOJxYC130mDRt87B8QmDxm2d08WmsvSiVpRvKr6N
	q3wkQEYMIYHuh6ejsdMIAx/x3AuxBj505YuB5UVPmMjc8uIwagD1oXAcOc/y0FNbptN2uhcXQLg
	AwMclIzuWZrOED1LStrj5rCi8Co0ZMWQg8XaaAwZH8ulqPi01xQcVX7iLbJEtYtvXteEDftf4XS
	SX0U1tmTErOsUpfVFvMJsSG87VGRLbNsFYCzwL8LZdIvf1FEqXA==
X-Received: by 2002:a17:903:2ace:b0:2ae:6b54:27b1 with SMTP id d9443c01a7336-2ae6b542ec2mr49745715ad.40.1772691202864;
        Wed, 04 Mar 2026 22:13:22 -0800 (PST)
X-Received: by 2002:a17:903:2ace:b0:2ae:6b54:27b1 with SMTP id d9443c01a7336-2ae6b542ec2mr49745435ad.40.1772691202331;
        Wed, 04 Mar 2026 22:13:22 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f283sm213061495ad.49.2026.03.04.22.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 22:13:22 -0800 (PST)
Message-ID: <828866b0-d36a-4818-b070-221b63bc0d0f@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:43:16 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: dispcc-kaanapali: Fix DSI byte clock rate
 setting
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
 <20260304-topic-dsi_byte_fixup-v1-2-b79b29f83176@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-2-b79b29f83176@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bdlmkePB c=1 sm=1 tr=0 ts=69a91f03 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=L1D1Xunng2Nf-P3W2EkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: yvLdLB9go15bBUMJL6xhIZmJnLM3gxb6
X-Proofpoint-ORIG-GUID: yvLdLB9go15bBUMJL6xhIZmJnLM3gxb6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0NiBTYWx0ZWRfXzyTsURPh33eA
 8ZMbTvnjOuZdyjjQeGMiCmipEOxktZBsNV30MwkfdOfquzjOtGmYie7SuFGO23E0E/b5N3fuUO7
 KpObnj1icqBeX/SFi0UXA7WSAp7bRLQBWUWpVOcRKeE/IaZt3E/ci0twiOQDdAGCzqgvIPZvX9i
 6CJuBZEoRW+dG8W6s24zvNXU76uP4B+c7rTRMZKJF98+riwzQUz7V5+a0POWPcQQN3i5YsehBv2
 pKH2cj1C8C31zziPi3WQHxbcPr7ujqX893Bfssrq963xqyravOxhy61ouCVl86tD/bDYUGnSa9F
 Q5L+1jcm1jYbfoFtlcFc1tSy2Scsa0WNdr0h4XoKWrV+IGFXGjOizJgAbm1LStwvnRfhbPVz6B5
 0IbBgT6LVYLVUxb+2UULcNE7s3dospc1lo5JM7dGpg8wEDFDAme2ly8nYY1n0qpwhsB2qZoYOpR
 8dUse0jtQDYlRzZWYLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050046



On 3/4/2026 7:18 PM, Konrad Dybcio wrote:
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-kaanapali.c b/drivers/clk/qcom/dispcc-kaanapali.c
> index baae2ec1f72a..c1578cd07041 100644
> --- a/drivers/clk/qcom/dispcc-kaanapali.c
> +++ b/drivers/clk/qcom/dispcc-kaanapali.c
> @@ -800,7 +800,6 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
>  			&disp_cc_mdss_byte0_clk_src.clkr.hw,
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_regmap_div_ops,
>  	},
>  };
> @@ -815,7 +814,6 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
>  			&disp_cc_mdss_byte1_clk_src.clkr.hw,
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_regmap_div_ops,
>  	},
>  };


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

