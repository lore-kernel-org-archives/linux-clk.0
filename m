Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984AC267714
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 15:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316508; cv=none; b=hgU4s+ir002jJjwpfiqLb8w6/T8jUNkoTdRgJwux5x/Yxvurs/racQ81s5NaSwQnb0aJ82yBYVrYD6S3JVB8btyDfqWNaw1Rp7mULpTMlgcd+MFySoXJd9eMSRE/uvxfh0H9J0vlPOfTzcMqwqzbzk5yH5e+8cZHOLKOZ0zs15g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316508; c=relaxed/simple;
	bh=qC0U/JrlSmEf1xoX/OXGO6rS2UwBteztm2jkO2TNsq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAMTRAmvki0deQEUK7fkRrIrtGVsuBZLyhHtw0E9ZEN2kTG3MeNcGHVUrcULSjaZzjgFEXUqtXGnu3IxCRNqvunbC0n+DaH3evt97UC1uwesaDuVwF1xh4Mrf6+Epm32dl37E30wji91B2T4RoGzWm8YBB91Tx7fs2aX+qWVmPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dirMW21P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEWNqz4d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dirMW21P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FEWNqz4d"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DBnVEs2865775
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 15:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nGMqMIXQLPssYD0xT2LvyZhU
	kqwpNFcafC9Dm+08hn0=; b=dirMW21P7XMO/W744AxQulVUbffP24IeWMXwRB+p
	39ckmDLpWlmzkyQlugNmTNkTBx+pL1nE0M2m3lNyEp4P0x0BXnWDlYDa1GSLxGZr
	ZzYggkaUsJhklKfzpqDuanCywptocLmXAxTPSius9FowXwX0ZpFHwUyMK+s7JBWi
	JL4jVe4NHm7zpy8T1kBjSOFjgEmL9wMSorRVLYm0ONVDDgNyVSMt+Mdb7h6PbJbh
	OblAtecG+Nc/9GpFs7C+BC0vuA1N9L1xtsJLX6TN/J4EtTqaI88HZkq69aA9L7CD
	HSuwCIqOZk81loGnWvfA7ExSh/+RxEV8Wsp5UsvbNPydxQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjh9tst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 15:01:46 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5636892d498so10077534e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 07:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768316506; x=1768921306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nGMqMIXQLPssYD0xT2LvyZhUkqwpNFcafC9Dm+08hn0=;
        b=FEWNqz4d3bY0u2RHWkn5c6C8s3mB5dpS4zKmqIJgOBijRDyOu2xRSNDQH/o+BmQsD3
         lOTqj1+ihI9TbC3RNu34jTXzemcCQJ3/l98/DRAUZgP0bqiP1EI8pwbE0J/hAw3CUVNg
         1FFda+6jY0v2GPU4Mm4GENgpXKPdPCWcJKAlJxEgrpkgbwuURgzCeKxaDc1BWGr9kKlV
         9a9VHE4cD+FuGyg4lQzmGc5EPlCra5rUcc2dRLNIvqlnvOtA8b+C70LRk3cPourYWyob
         wLLmT1xmUhYCnY0pNmvCLZjpBcqEkWunoqSBXygsyn3J389y+fY0wgytKUlRx6mMHow/
         UV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768316506; x=1768921306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGMqMIXQLPssYD0xT2LvyZhUkqwpNFcafC9Dm+08hn0=;
        b=Y9mpVbhNcIW+0QbWq+BoVANQCx7224skR4G0qBU6PGz3TC9BHpA6p/TFrSnGCTh2ZR
         Y2blQ7s0dxAxD8Plkwn5B1qKSJT03IHME8uFA2e9f2yCdPPScvQDBosvnvYDwjxj4vRK
         1v3b0+bZf+vAFM7h2kvh2JDCfehbIt+XN60JPlWV5JiVE4cncfB2WU65Qoso0o7VUChW
         lGvOuSNNhh1YScq4EVs8DHPFf9HiZVFlTgra8AGqXC9Qlb/PMX4V8U3l6dvIcK1FHIWd
         GG/CCtX5PzR9RNjMs0ZYgD/j0F2j85wibdju6zsjTZ0vA1C1A74BmE+HWrbUBlVorFSD
         EzeA==
X-Forwarded-Encrypted: i=1; AJvYcCXKgxuELc40LzgKhU8BZ3BYqgNe5g88IIi1HV2edZo5zAoxP8Dbf+1mgLeOwOtRfQOeFZ32vbOs8xU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnc9nmVKTv35pGZWWRBYxJZKQXbFi42Fm78+nAiJVEHoRpa/tE
	A/rXUxSN59D0ngvxVRHe3VCeMDTOWgat8M8DW0GDB+L2sCMSgg9uXn6TbLWrDJlsrxci3rOzCwx
	7unTh+U1p8PJ3OqnFvGUaIxTBEm4n9KXa4F8VpQSgbC6lGCA3jecihXXfJDB8+aw=
X-Gm-Gg: AY/fxX5hJEjeDApeXvcltSMJva9km+Y+5ek+/82tjEL5G4IxnZ78Vwe2nBqTkqXtlww
	Wim6FRTjfbbus09QsoOhnJqeATq3yGp/3hHVlHRJ1cTmyEkBNTqHHhLLboU4QPNMprw40/UyNVb
	twGzjuDOa6xd2LlZz2EQ3DSsJIQD54VC/mb2hohrjVvXuV5bLOfXN3nZoPUpm2ez2M7JrYgjRyv
	5Ie1r9kEEYRWV2JC9HxkEkElJfmXqN/iemO/FiWKtmWsRQtsrmAHOKIq9yaHTXiptDBRFU4g9/5
	RxEGuLyWtHsGmvIPmfTRF+AY/IzZwYevqgAb4Octy9E+Uu6cJl8VsG6/sMtBbiMCL71AItrCNOx
	6FbhAcFBoVZwgWPMwbqO87mGr
X-Received: by 2002:a05:6122:d13:b0:55f:c2cc:50ac with SMTP id 71dfb90a1353d-56347ff99b6mr7399638e0c.14.1768316503907;
        Tue, 13 Jan 2026 07:01:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHA7N0c2TLfiXB2RHkTFtfhSWvF6d70Dgu5+htKgbpWhLK8Fo5tWvKLAmc+ZjQuS8PDYqM+3A==
X-Received: by 2002:a05:6122:d13:b0:55f:c2cc:50ac with SMTP id 71dfb90a1353d-56347ff99b6mr7398772e0c.14.1768316496996;
        Tue, 13 Jan 2026 07:01:36 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87023a8a33sm854312066b.18.2026.01.13.07.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 07:01:36 -0800 (PST)
Date: Tue, 13 Jan 2026 17:01:34 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX
 clock source
Message-ID: <lm4jz2xfhj3gjddkb7gsar6gbd4v4sskaotkg2iehtyllsdhzh@7zmtp7jpyglt>
References: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
 <20260112-dp-aux-clks-v1-2-456b0c11b069@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-dp-aux-clks-v1-2-456b0c11b069@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyNiBTYWx0ZWRfX/L8JpSDF7+V+
 L0A5XMAjZjla/KjXFIFP6uwxcMN4WpYU7PViuNlfFJOw1ZfYyFyUro408f27ep+O7MEnXWwF/Fb
 8cd0RFK4KsioP2MjGucYGkmrOhI56lsRSRbNQTL0KL1AMVjpFvXg0n7+t2DzDZMKglmAzRD7uKV
 xt1IIDHEUMpfsmHJLqbnT9O1vsLO0V4wa15GSja2hroOMXDKTpdMINZfPmo3ehuafb64xEQM0Bi
 be/bkFBZhKezakYMGWUJGMBH2aLg6yY04kAbYqxbjfW85pBHUFLbT+xrRszvTRMxjoBCtGE2IGm
 Ow/Gs1And5ryxMmY0fJE+pJ536txdEXfwPfV7Lqh2uIGMCs0qkuGAVywLas4n4uovUy2thDWj+P
 +yD0B1h+GYN23Y8QKtON+vtCVnB0M/k1ssXy0RXBYG7a85uHoH+rUkKYrusNwC1BHI9zCSswML9
 BYGv+T5R3laEvZxI3SA==
X-Proofpoint-GUID: fPjwlqOxkXQQKJN18ljJ2lTIe96l9pLg
X-Proofpoint-ORIG-GUID: fPjwlqOxkXQQKJN18ljJ2lTIe96l9pLg
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=69665e5a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UIqvOZ8aP2BlQGmZcB0A:9
 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130126

On 26-01-12 04:12:23, Dmitry Baryshkov wrote:
> The clk_dp_ops are supposed to be used for DP-related clocks with a
> proper MND divier. Use standard RCG2 ops for dptx1_aux_clk_src, the same
> as all other DPTX AUX clocks in this driver.
> 
> Fixes: 16fb89f92ec4 ("clk: qcom: Add support for Display Clock Controller on SM8450")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
