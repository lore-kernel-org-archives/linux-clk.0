Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7FD4C9F
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 12:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743079919; cv=none; b=CS//83392K5dx91zodXCQgjuuKwDuGdrsXunYaajzPBLqrW3qUlk4T0wQchSKiPt3fHqj8G+EtqMXf0hen6sdLAWDtAH0WDqdrqcq5BIPxzzlQbJYWsNCNnl5ZEHen+GU3ry0ENdtIH53CbqalYJ78wt70uNx+wG2ckEV3NpxRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743079919; c=relaxed/simple;
	bh=pRLWHIKpxAtnCsh/nWytTFegaJTWyktX21VnT7GCvIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Awd5i1otWMRUusWsq8VJ9na9ZyqRUj/rS9Qouj5gYczhBqPxO5e4FbyPQreGQpGfiEpRfEcbkETV50V4YPjS59WmJdp4y5EsN00Dsq5ia9tAvh2eYEzfRUwkNmm4/2SScPGpirRnqDSOZDkBW6uKvUKWVlpJh0Yv1UHQh3Fl0NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAOtRGf5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAOtRGf5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jEEb005955
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 12:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZBCOV1uS/N7q5vX7EpjTo/9T
	Wfdmz7+2VNj9q/T3SCs=; b=gAOtRGf5Nzmo64jBZiIHDDs3YAc/W3YAzO5z9R/h
	XNhqWje1P/Hs+azhIs2c6Na1UYsaAWm5ovfGaZa1zaqp0VrWMy4+/IWTVNqiLPON
	6mfk74eUNZdx3Ki1YKlvzjuuYfBDm4sVTTHBkvJqhCnBVISB1tULL8rfmQvIZGOW
	JdMLLyL1WYC/FBKGUOs55Biu1tpnK9JBwYlfjDzJPIBR+RTJBOTnJZYIGz7dHadX
	khKxpY8vxhrm+8sXk1BE4DjB090m3rgMHyAO0JY35t2HfxMtU0Hgbp9R0nf7D8rZ
	qpl8C+aiTIMCRvW/IkSxOGLg2HADmj6Ohzj2NVqd/DFR5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m7nf5ajx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 12:51:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c3c5e92d41so154843385a.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 05:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079915; x=1743684715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBCOV1uS/N7q5vX7EpjTo/9TWfdmz7+2VNj9q/T3SCs=;
        b=SlYivvXuMrX9ypH7ROCY/kVOEQhcasUH9wefNVo+fKGPi37YEagVlheDK783eBd1Rz
         zjC8bo/s4NCfhHWTDI8DFR2OzllC0xPF4fuh2ZsBO9j3t20O7xfvL5jN5TzEzkBazoug
         /H7UjyNzK+Vjn7uv5FgHuzVktdGHDgIAXiBTJrZ8wXeOOVDgvICQyk8wetQXV79xlGgH
         2cDWxjtzjtrK7rlcLNvpYGmzYkzZ4k/Ea1PIyIu3irVKIiIVppY9A8S17MGLAaUD/gD2
         5JNB7/Pi/TpCVdLsWq5+m/PHOM+oLjL1/WsoP62HGHAYJdowozqAFjX3hhBb9sJUFqEk
         4yIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiLQ1DlNwF77NP9OgdL+wYFNLB5UAakWo6YVaZPKX7rj29ITWNsJundRlB15E2R0X+/XXVFG86T84=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo556xtxoIIfVgqvB4A+Qbh0ZQwBQ5g5r0KK57+BW4ZjqJPRlM
	2jzmuZi0CLPW+jpmishwP9RAVIc89mhDxVIovrRwFKIho5D6SfufMFaoJ6QjNw26ocNI9riFQML
	3Th6MLr28gwUGFvcDDH4zT/RphaWBjlEOsPyh4r158bH2T2qGWhJfcmQfoaA=
X-Gm-Gg: ASbGncuEz6RjyyGOcXi+aZ5J7/hn9DCTpOagjIV5YTRtb2aZlxWhxn1jwjH+/i9QlkJ
	t2Z4WHEBry2vCuEEoW7OGn00PLg/rvGzJ19YAU9rNXOguWon+4b0yPF+6k6pcrgd48qE0KMMdqB
	IOvSRSMAS7xUftMrSaXF3nN06KMXewmB6iirPPazyVDMjGCaqpoR4c4aIxtQ0JF5WJN0ow5fVHg
	ih7vuidUtIaZBAZQbk5OOEkSeL3AUUuapW//Wa/32O3BTWK2y1eegdtpo+Xzo0llTq21cq43lJC
	XOAfAwKEZkostf4a0nhVr7mqwQEnOCShOhiPhYDLo7Le/kyQ3CjrnnC7GcBRZ3+kr818XElZ5H8
	gDS4=
X-Received: by 2002:a05:620a:3721:b0:7c0:c3ea:6982 with SMTP id af79cd13be357-7c5ed9f1e39mr435497485a.14.1743079915415;
        Thu, 27 Mar 2025 05:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuF29Y3nfHrrwUHt/LBXhkbdI4Z2Cs7fMFZYNi77Mai7aCOVA5UqjiL7PGwH+dL5lO9sti4g==
X-Received: by 2002:a05:620a:3721:b0:7c0:c3ea:6982 with SMTP id af79cd13be357-7c5ed9f1e39mr435492985a.14.1743079914922;
        Thu, 27 Mar 2025 05:51:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647b468sm2073129e87.59.2025.03.27.05.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:51:53 -0700 (PDT)
Date: Thu, 27 Mar 2025 14:51:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 07/18] clk: qcom: videocc-sm8450: Move PLL & clk
 configuration to really probe
Message-ID: <bqhjxv5rrho2os5tswhl5pjn3s7gbdsuebnadptfaiml2dgnt2@aac5t7c4zvfc>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-7-895fafd62627@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-7-895fafd62627@quicinc.com>
X-Proofpoint-ORIG-GUID: K7aj2lhETxqfLOLQlRy1a7ESS-lThiCw
X-Proofpoint-GUID: K7aj2lhETxqfLOLQlRy1a7ESS-lThiCw
X-Authority-Analysis: v=2.4 cv=IMMCChvG c=1 sm=1 tr=0 ts=67e549ec cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=CXQnK64LRHhqnx0rWp8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270089

On Thu, Mar 27, 2025 at 03:22:27PM +0530, Jagadeesh Kona wrote:
> Video PLLs on SM8450/SM8475 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enable critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configuring
> the PLLs or enabling the clocks.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/videocc-sm8450.c | 54 +++++++++++++++------------------------
>  1 file changed, 21 insertions(+), 33 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
