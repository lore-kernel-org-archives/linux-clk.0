Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836ED3E5593
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 13:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778851909; cv=none; b=cMK4Us8TkhAY4PeIRrq1UmNbxAH0w75MFdR8gnfFv6W550Tst2SU0ahcOCaA1CPtBRNQKCLUhZpSRwG4oqamo7KHfIwRA9mMG3Bq+XnBoY3b2psD+pseGx4jMseoMNsgcTjQbLYJWNeGGxSrl5eQuAlE1SzypjrRbr/AU+YCFH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778851909; c=relaxed/simple;
	bh=x3KC5gvjDTWSMf7+jkoN0GhGLGzyorgflzt4JqGg6/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUXK8EfkXbhbY20ByeqcbhIWRGoHozoeKLJ3fDJ8SnCELlfZdMR5wPFOctY0rJW4GUly95M1E2a7Bq8Y/oi8EcA8mJKT+AU3B7csXyDfQbsYOzYsTSYN1PhwABvxMjb1ffVOPhVCQLK/fLRyKZcT6hKMw6Lzyn04FOikqHhCcg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FTfuL1y4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPSatr52; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FTfuL1y4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPSatr52"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB4ULR3512721
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 13:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5wLrE+oAQthnuDuTT92AIEx9
	TsN3ufsAGSFIiE3PcpA=; b=FTfuL1y4JNRUKPQ5lNia0ICqMbz/kQUTwXF+iz6v
	uvMsvhIGbaXc6SxFbrE7Qq8k7ukd2GN9vWZqm1ylO80yOPjp3ZHcHCDigQBd6i2V
	0LgHPUQVtYMXio5MPI4wP7QP1StXTMcAjRwOJfsaho38+IN53O+0HC1j1AGIEQpA
	UFmqJISUzdWv2UoEsDkdb5yhIiLptVACn686Yn1A7yAp4UV8KBq3mb1kBIpLQvt5
	vHF6ZF10EOE3WOxOh86N8nyeQC5zhdqXdiRiURLRQj85tNt7IUDV0HSVIOHhoOF/
	/UyG9/xj0Q6pTxOfewat6/qbEMUEcWBeiwxjqb85EuAhzQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vbe84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 13:31:46 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e06cbc08d6so24790731a34.2
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 06:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778851906; x=1779456706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wLrE+oAQthnuDuTT92AIEx9TsN3ufsAGSFIiE3PcpA=;
        b=fPSatr52a3Ecjeh8+VXzivXgS1x4Fg1SoMHb7WAMYMYEYI/4QbTm+j1OrAmr/qWm8V
         pwrPAl9O850IvPKuVnG+dbHAF1DKj+pg+UyW5WEpS9zWtI1k+c52kl1CfeXMYS1iJBq9
         PfimSulJX+5zzzLPPCXgo8go7U1iC+p8Kek8+YLbL4YVkWjV26zYsz+BUQyLBvtzLyLg
         7sZw9ETPQ2SHC8P+xBFab4cb2JTO560f1BV/IX6DEvBygSovmLZkbcpHrxnREIor8nC4
         xz2VLxlPriKDki3lahVJ1dzIISx2ekeEeMPPn+7DHxUn2hifVrIugl5VssgHuCzCVQ12
         tGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778851906; x=1779456706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wLrE+oAQthnuDuTT92AIEx9TsN3ufsAGSFIiE3PcpA=;
        b=AxWk/Jj6J4J0uWkyqdBW0+/VEMHwyGf2UJtmt5zZd7XRjC++e9t015cMWCXvN0usih
         pzL4eDg5F52VdljCcbNXYrJnWTfVslLVRqME1hQN+FBLe1MIbagAtgaZlMYsowIOdBJr
         hbex4O+Wm6Izco4ZT6Bxch9+1Z9DkVt2lRQebAVyNf1u3QMKX0sJ741t50rCPE2Tv+SK
         IIyrbvdXihYFW4f7D8XFZsiUExtW5yBmK/I3ItDL9+bH32AoqPY/HIrDtNxg2ZHq73EX
         WtZhl+yBgIUOleySZ4B7lfoauh3HRWWdooHmFrDYhfkhin7TCIXBdGvdyypJydhfHrml
         g0/A==
X-Forwarded-Encrypted: i=1; AFNElJ9LBT0AybdbMQtnoYQQa4wvEKVsjA4jsFE/xE2FT2nNHfTpaOBvi32QsX4MbBm1vWS38wDxQR9sV/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcCC2vzuXx7mvvybTSw4qCZUTcTUPamKIx8AcaMvjxGanD/tho
	6CZVO2Lmq0bxOUCxxAVN8gtT8Gm+AzpXVUHYDFYuvU7uNEo1fN7M/1JE/9dZC/I46F+CSkGRtfd
	zMRGsvH6488GEbxeNLiXkTFgbJiZlJcmryOu32wre8Lo4u6UXmIZJqIqizbNXlVg=
X-Gm-Gg: Acq92OEupItjCRY5GFPvAOzVs7TwXMdB5GHErZIdyZ9xiZ0k+qMKDCpZDD5gxewB7ar
	dUaO3KBep2eVvXf3NiDnOY8bFKmuwI7UE4JjeilaX9zfQaA0IwRaZrFmmiHk2uyojFAFJNswTs+
	rGkfPMHCezuFsEZXYr//ck6LyuTgBwiMWNMkQK6sL72eKsOEzrPXkHvQaquF+jNW3awAwoqG9DV
	b91tLsbfU6M++GKHuVbV2wEedbOWHuxuM1rYOrKhxppMsY1MkOBGC4x4OLc4OfDHIkLS4f4hYsV
	R3ZB74ujhBCfl+Hqk2MYUStwL0W94N38a5HcnqHGKuaPJUkmUyrtWp2OHO8x9nz0exio+TG0UT2
	hNicgrAlUsrIUPtJwXwxl7NMD1bR76Qc4iytyCrGMr/llMl5eXPGkHfcN7bww+3vD3G8dT+3v+z
	bnHcvQfkeVNnVxX7mMS2QiwO5H4idBj6bwp9vyMjLIcHVsCw==
X-Received: by 2002:a05:6830:3809:b0:7de:44a5:51d1 with SMTP id 46e09a7af769-7e4ea0818c0mr2309417a34.7.1778851905591;
        Fri, 15 May 2026 06:31:45 -0700 (PDT)
X-Received: by 2002:a05:6830:3809:b0:7de:44a5:51d1 with SMTP id 46e09a7af769-7e4ea0818c0mr2309325a34.7.1778851905111;
        Fri, 15 May 2026 06:31:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cf0a5sm1313704e87.75.2026.05.15.06.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:31:43 -0700 (PDT)
Date: Fri, 15 May 2026 16:31:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: ipq5210: Use icc-clk for enabling NoC
 related clocks
Message-ID: <5zdmbj56ndi7nrvdqadinrf3sneywft3uaplnoxugp5zetsfbj@5hazmuzyfz7u>
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
 <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzNyBTYWx0ZWRfX/gcrlIMpGWwF
 WgCcJoC2I7uJLWZyMWHAU0ueafU5YaD686KdWd0wKGxVJ1uQkxejoRpuVoFMXjYt/uCb9l2MgYU
 0YDiiSpVFuNsOjDN//cqRJ+3wD4t1k89c7tQaHOeORwurcpzC04qi2usob3pEPQPBDBOl76je34
 JQEj/PU+1Ol0/3E3BxMWFcBtM8RRA2ol8RgyHiQWVpbYOo9yHm3Lmt2XLq+Zntbpvvsqy8Pi99x
 hIjK4ski/62i9/DLbX5HtjWX2viGW37lNNWIwOCMwahw7urtPD1WS1xBAA6DOz058vhrcSElLny
 NTrwNDILHJpmiOorOKBLwq40Qlm0h3NTNQqo+GME+an75J7LosQUigcM5IeB6MPncldyQygYJHx
 8YcwnC8dXLHKysex5/1LhCik0CzCqmf1jwd8R9Jh6DIN1tSCyV5oaV/caOT1Tu7bt5cYbtyq1IR
 Hdl2s0hdvrMxod4aG6A==
X-Proofpoint-GUID: cRd4NgJt2m_4Viiee-zgG3tH5j3G36pB
X-Proofpoint-ORIG-GUID: cRd4NgJt2m_4Viiee-zgG3tH5j3G36pB
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a072042 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=8eC56JA1x6P3gbDAbPwA:9 a=CjuIK1q_8ugA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150137

On Thu, May 14, 2026 at 09:35:36AM +0530, Varadarajan Narayanan wrote:
> Use the icc-clk framework to enable few clocks to be able to
> create paths and use the peripherals connected on those NoCs.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-ipq5210.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> @@ -2642,6 +2657,7 @@ static struct platform_driver gcc_ipq5210_driver = {
>  	.driver = {
>  		.name   = "qcom,gcc-ipq5210",
>  		.of_match_table = gcc_ipq5210_match_table,
> +		.sync_state = icc_sync_state,

in Kconfig:

select INTERCONNECT

OR

depends on INTERCONNECT

>  	},
>  };
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
