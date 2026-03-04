Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498E32F6560
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634447; cv=none; b=fuUp6qCTZr9eDH1eN1qZWN0o7k4FDmK/NqTd/NsM5JHJUd8pgoPumvSMQhMKucQdpurpLr2kBEWtbUmnJSuz+vL18iNbx/xMLxECr9W6BXZckPexCQULUUi3NyfF7SYadFRWVZ0pVPT1uaiNdDFRA99lFMUEJTe7fIJPfTzT0SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634447; c=relaxed/simple;
	bh=X3ZaJ0LNZVNI76xxVzwU2RW9kMNSkYt18E0qUs9W0c4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZlpHMHtMZTsKhNcs0E10+vlfy3fNMY+sBpG+lbDxIat/Nz1ycVGqCd/P2e4je5iuZcxXenjBvwUDsMUF7LrzEy3oWPANQdmbuf0k887OPPlKTXcDnX6OF7dVCpJdQry4Eg5osWil581qSYprNyPikuc9NndqdVR2gAnFdVpeD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4awoh13; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ni5UKYug; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4awoh13";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ni5UKYug"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624E0aIu029424
	for <linux-clk@vger.kernel.org>; Wed, 4 Mar 2026 14:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNr9JA5YuNaCKrbAutm8L2NMYLudyOtYm2CQ8UJlx3M=; b=o4awoh13uF4S9GcW
	pdX2qIT1Nml38lTfW0evqvYezh+8OGzVQe3sydGxBL9xklRJgU5AkGnq0808Xo8D
	Q5XmfYGNV0HttakPDdo9VUhozYyr+fX/D/nGh9HKK6Mb7wjbmIL7Q8bmiQEolitU
	8w9NtyMeZJyuMeVaJmVss6vh4Usd6iA8Fj0kPwMX5lmn+tQG7eeDavDfaHsGjvWd
	LO0/sXHkdsEA7sndqCAiWnMjgrA1SGz6LTuB53QFqOr/Ko4ou9rG+3RGi2mPXPfx
	AhgO0dUAIq0K8lYL24oqEp5bL0zv5w6WxAW6T/bQogNHrtoLe+cUvF3GpRv5sqF0
	IJT5Ow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpp4fg31k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 14:27:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a2eb984so4902762285a.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 06:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772634443; x=1773239243; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oNr9JA5YuNaCKrbAutm8L2NMYLudyOtYm2CQ8UJlx3M=;
        b=Ni5UKYugHc+zouzMi1U63iYzlcygmfDO1jvepkFhA2sUVLrRgrASzYJgbZE4xbjmph
         XPNTAoQLHMJFfi/v3/s3XupcEwNMGvdJ5ED0elfH7jdNOxRMSXyM6z887xDM9JdCrQ21
         bM8LLnRR5MOzaAlOPKfhbwNFHYtYz86kDoJnK3UV/N+Dj8LRXuc7i9y3sG4A9qb2g6tS
         67KLh7yjSSGvL2cHMn1yV1+CtZe+dImVC2DTrqdFzMC++M+t12zoUCVLS+VzNj/D2UYA
         j2mKfgDXkUBECp4ZSfxNGvVjZDCHLaUmsrBi7ufRP/AixSixc1n9FkknjOZH2fq0BrXN
         g9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634443; x=1773239243;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNr9JA5YuNaCKrbAutm8L2NMYLudyOtYm2CQ8UJlx3M=;
        b=JdA4R057i4ugAaDVYjbF1LkuI9QornO5xIiM/HgL2llVus0pdVshgSx/Ws8NkOlfWB
         7tbbWxDqzLckkQ6shw7INbj78kNe1DYVn8vTKovhvqg2osaIwGGHcE6MmPPONTMdNsZh
         NT03+e7/x47EAWtKEi6v3dT6tpZFlrHMJ14tz+QVTn9cgw+FkZoBREYeZ2asgirHHpEF
         jYoDnLLweQ7O5bVi3asfTEHBg+ZvfMwuD/KCpkjcCrlQ9jPN11/8MV20eaoCOsHZtMAX
         GELyiVy9+LsHn7zFeThsGODH9A2S9MOkBM6T2y/W7Z60Ed8yIRUcWZKQO3ekQB6E2fhu
         uHTg==
X-Forwarded-Encrypted: i=1; AJvYcCXqPz4f+kXHUkAUTeV+hAEIxrnjf2jgy7h+J2l3l7XqgBcg0r8+j+zO6bl2EUImA38Aap6X2Gg0nmc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2FFrYL57x3jtechMjGXGqY7GfMNjmcjErehK4PqDWoGMZyrka
	YMcDu6Lh0lGrk8tKNd1EFAl55M+krG0YKCsWl/jkW/uIyd5xyHQ1i+S11vZivdYNAQphF2V4+s7
	lVUgfmg+qf70KhvfUn+eQPC+EEwf52zHFcIElsVUaG/QWCFKOpsmzOzTADY4lLZw=
X-Gm-Gg: ATEYQzwL2lmYUC3N/KaAaVnIXTTUBnczlTiNTo1e0vVP8g8Kb37Fraj4TPkmCAEHgFg
	DJ49NUA1ZeVV8zakgjVFWjo2h56CP1ib3rl4kkrWyWsxI32Gqb0DVcj3kOOv81oSMmEjYLwqeIq
	fTfMiBWmatBQbG7rZMJVfHx8orC5VXVeX0rfNcflpEIeed8kKvK3CswM1pfXZ/3inHMmbhxsgha
	ndNHi5CsGvrL31/sHJRPjOBbYHvHhsPmzKHCWGreWeP/bbW5ycqn2ofxoeljc5s0pxJq+eaJL5j
	rhgLhcKjIi0Fjm3T5zBsbU/cD2MZy8Ai+liI3HDepMFmAdgQDzNNzeTW7YBxExLVSdJkRVW6+oi
	1rubPDaH5kEv44MEWVFWq3E0RSRTCuQu1fUmPtRGa9mTyvsvh06hES5JsXjzn2mGVHxqfhSxTtb
	Vgi23pwQeJvTxO9W0yLMfvj3oXUTttgsHv1q8=
X-Received: by 2002:a05:620a:44c2:b0:8c9:fb26:dc78 with SMTP id af79cd13be357-8cd5af7ab1cmr249590285a.40.1772634443530;
        Wed, 04 Mar 2026 06:27:23 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:8c9:fb26:dc78 with SMTP id af79cd13be357-8cd5af7ab1cmr249585585a.40.1772634443033;
        Wed, 04 Mar 2026 06:27:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a2ecd6596sm2363821fa.5.2026.03.04.06.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:27:22 -0800 (PST)
Date: Wed, 4 Mar 2026 16:27:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] clk: qcom: dispcc-sm4450: Fix DSI byte clock rate
 setting
Message-ID: <failhjdmtrtns6h54qwzd4w4aun6hjhao5uirv2636kazqqfki@brumrojsc7id>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
 <20260304-topic-dsi_byte_fixup-v1-4-b79b29f83176@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-4-b79b29f83176@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: v92WyWv9BlBMhHi3yBuH_4XRICwvOMPU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExNiBTYWx0ZWRfXwUF8m85/jZhd
 gcUSS3rbCM+PmlPbS8h8S/ICFoGQtJvZbDfcA2GyYs5/lxx/KmiyYyAGATsC/ZxloGADFo1bwe4
 y7E0sWqGp7crR/+qvenDmsAc2NK90o5WgpS9XbcD1h3PCPn5G05kKVudutDZde1D1/BeI1Fz45g
 D4q/pPgqQ2Gy0HoZTJcvNC/Qj6jifsDGAW0JyTjHjfKpbzUj2Ijt5RuLTZ8Y3901t1b8gMBrC23
 hLHc+jXvLsDfkVE3idE9FjfDXK5ikzZTLY74KZ4JIxy8C1rnvGl1a+vjzPzi/L8dmxOOgSyNQYU
 Qnvcdh3msnrxlYg43ljGF+K7UXqJ4hA1GFfvcDfZaT1HRCeZmYwwcm4z/8UyFiLEiOOUr82FORk
 HGkzVZ64j6l3lNSJuvZz19m3TsdQe5l59T68axv4craStPVnLd4XceTX5PFeJFNb0u3nk8zGTX2
 OHYZoKIXCWQm/s1Ci0w==
X-Authority-Analysis: v=2.4 cv=CdMFJbrl c=1 sm=1 tr=0 ts=69a8414c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=P6JgDz5pW-ke-mV79CEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: v92WyWv9BlBMhHi3yBuH_4XRICwvOMPU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040116

On Wed, Mar 04, 2026 at 02:48:30PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The clock tree for byte_clk_src is as follows:
> 
>    ┌──────byte0_clk_src─────┐
>    │                        │
> byte0_clk            byte0_div_clk_src
>                             │
>                      byte0_intf_clk
> 
> If both of its direct children have CLK_SET_RATE_PARENT with different
> requests, byte0_clk_src (and its parent) will be reconfigured. In this
> case, byte0_intf should strictly follow the rate of byte0_clk (with
> some adjustments based on PHY mode).
> 
> Remove CLK_SET_RATE_PARENT from byte0_div_clk_src to avoid this issue.
> 
> Fixes: 76f05f1ec766 ("clk: qcom: Add DISPCC driver support for SM4450")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-sm4450.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
