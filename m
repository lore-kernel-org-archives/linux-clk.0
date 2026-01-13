Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8372827F01B
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 15:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316526; cv=none; b=HdI1WocPzpDi555j/j4YfwONBksNpfTp/hz83/bCPvs+/awaSaDqJ3ClwABAqoVHeWDDywECGGkl0FKZ8WXuF8TN0lnVezUpK/hxHCJfhaPnhJfxLy6lmxpYxFQXx+w+9vA0bpIVdfcnIYq2AiF/kuf/mQ45D3xeyVd1JxKvCQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316526; c=relaxed/simple;
	bh=aClQHtbYKBV/Te61A2PAIVDGyzdj/l/LdI7EqHK2C7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n92CZu0JYyxs6vljBym7RT9NuUDE5htix6RMdfdrqybR4eyin3lQmylYQrBaFYMN6TLPslrBgHzUxqkJYeaz8ataKLiyJUOs40XRbzsoOkIKud5HcwBIKBjkB4v4XQyzwHeykUl9Bnq35z2dSOjtDyhXNTWWTNvNVMfbF0TFh88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTTwgpZd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JiBi0MY6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTTwgpZd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JiBi0MY6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DEo4771935376
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 15:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nxo/yDq4k5k6VMy4rH14W7xz
	rBuOM4vGSO0e4PAfIO8=; b=JTTwgpZdcV4lOlhSTTqJCLghW0Rqzn9THnUYsWqC
	ely1hnTUXN+dX76o5gWp/RKNDh/JYwBXb8PPTQUeUpiLbgIgOpCSijl00s/v/0L0
	mFqywxuoOgGOwP99i8S1UfmfOQZZfwve8Bu3ps+of8mC5z8afifJltznUJUk3cfH
	GJ3ofOL/GEnMpu7uv2DsU+yfcBlM3ytLH/+SyEa6WX/RROrhS+O1CD0RbUWoK4Sl
	SCEMnvNcvW1Cpz5yb3K2nZO+zUchwTMhi8dj8ftVgcVL5pNzHNGgTFkH4NZ+Px3i
	NfmvcWXzQkyl8USRNoB993En29yqZoNYDQXZP/NbsOjb0Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6cnkbax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 15:02:04 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5634817781dso5777142e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 07:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768316524; x=1768921324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nxo/yDq4k5k6VMy4rH14W7xzrBuOM4vGSO0e4PAfIO8=;
        b=JiBi0MY6Konk/iJJ+Q0qoyAXdX0KL9HVWwXUNSPZJLD4SvyTJuIMRNO+vNoWQjl5zP
         +uE0mv864ewU1K/FXE0tBr+ISxHjREY35ddJgYHyxNIEIEzpqz6dP4E/Sr/ktvClp20t
         sBte0yI7Z5o6Tq0mS/QSUuk8ahbl5+5/wUmqlNcWoueuslw6zrYPqfCRKBrzYnGPwkZS
         v6mtwhEE7C9N7sgyN0gcCbEwqgiBd0++c3HXLGFjfrV695F0X+1iwmWjUE1+ZiLLYYOW
         V9BPscGxznQhWrM0YP/Gt7AxqlE3hY4g6tJ2wVKh6vWUo9oR1lMTSPfvqoGqnoV0iqQT
         i0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768316524; x=1768921324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxo/yDq4k5k6VMy4rH14W7xzrBuOM4vGSO0e4PAfIO8=;
        b=kl1l+ygaBGzsD+jJ3uQDp+dd+0cWUeIBTesH9V6r2blRPIjVbWT8b+3GmTGUsEG1nK
         vQzMZt+DXO1r2jIxCUbIYK9ZoxN/wICiKA7nwl8b5byzFXsTGmpcRTOIlbkmHN7+THZf
         1bh/i+XABzr2pAlK2k23CRepUAJ8qwYYrqhFWOae17JN+4kyjKsWu0XyzOjR/0f90Q6o
         aDePJDRtBcEiHNy2Kc+HRcf7mw1RooBzrBApHaWhtssFNow+7kKx9Ny1zGTVKs+e3WVM
         C/Oe23/ID69cVnlDVgFXB9Y/aaxWdmHiah1OYCoatfCdWSCkbaKQk4eQFeuBbQuXaizL
         csgg==
X-Forwarded-Encrypted: i=1; AJvYcCUKy6WyFMx6vsAzV+4ExD5VwCkUxNB1RVH2fXmqT/eM/Y7fnTEqwGpoXl2cxkrOvf5bi/TmzCe1vbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmSSXQwU4CgumhNQqbY0XGru1majJ3wd/7MQaiycSZc5ESGk4S
	G7uiFIAs0y0XIE1CWHPq4m2/unD0UvHzQn4pnxcmOendqUrlF/svW/CSQZbDtCQzObmtKo1QOtB
	If0xUbuS3OyVSOA9JYvXLhiKHLpI/bCUrBrErnW/GAzi+z2GEkGYcdmrMJikGxEU=
X-Gm-Gg: AY/fxX6WKEgDdQK2Tp0i40/D2bXy+4mDXfDAdgFP8/uHjgfTQL2h2aqzIhueDVpniYM
	1ZlqTu2W6FOIZ2IvMlcqZfehzURm3QcY3pJ4fX/PYWblbqEovFgot5I11Tpku06bI/R/HfMuI6x
	0K0uFZ67Odv/wM04MKpA++E5k51TrcRXtYnci8giWihDVAHYmDaO18dGjVkBDoByDDkUbsmhviN
	VI8azrf5ukRnpfruiKGCmFkX9p9osVeSvhYUyx5bza6OfHvqv0HkiUnxcUV2Hgs/k844ISdDv+J
	cgMi6HUK23wUtQmrt778H5iwEzhG5qfo+5CDPJllxXy8LFgc9z91IVPQPwXEhZoNC0b0Q64cS7e
	HHvYNsM4hEc0mHuxh6qjtdbn3
X-Received: by 2002:a05:6122:266b:b0:563:71e1:c878 with SMTP id 71dfb90a1353d-56371e1c9dfmr2828926e0c.13.1768316522203;
        Tue, 13 Jan 2026 07:02:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhFdPK3N6Oy+o7/zQBBkYoxZpt1gQ/uvoFwqRBCuFSkyD45lMAxpPUEsCAh0c6bbEYvyFRpg==
X-Received: by 2002:a05:6122:266b:b0:563:71e1:c878 with SMTP id 71dfb90a1353d-56371e1c9dfmr2828639e0c.13.1768316519346;
        Tue, 13 Jan 2026 07:01:59 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4cfe60sm2233512766b.45.2026.01.13.07.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 07:01:58 -0800 (PST)
Date: Tue, 13 Jan 2026 17:01:57 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: dispcc-glymur: use RCG2 ops for DPTX1 AUX
 clock source
Message-ID: <2hszatsmshe3yhk3yneqxgvikr5yh6dpw3r3jcgvde7yvkz2yd@jxfb6cfroijd>
References: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
 <20260112-dp-aux-clks-v1-1-456b0c11b069@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-dp-aux-clks-v1-1-456b0c11b069@oss.qualcomm.com>
X-Proofpoint-GUID: HNABosHvnsW3_TcfL3V1lyDWr4OkY2tv
X-Authority-Analysis: v=2.4 cv=KK5XzVFo c=1 sm=1 tr=0 ts=69665e6c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UIqvOZ8aP2BlQGmZcB0A:9
 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: HNABosHvnsW3_TcfL3V1lyDWr4OkY2tv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyNiBTYWx0ZWRfXw9v3QnlfdIXR
 bMW6f6L8VUtx9wUydRgYmo2AITTcDRtUJcua3RIT/G47aJ/P5ua2ldU/TTa99EBfpMYE5ZqFW+b
 ytRY+IHtUy5b+jrHz57BmX4lLsvp0aB3imLpv7xVhgUeYsJ+5POhPrUx3jK2YABgsRd1ex3Jf1G
 DVWDZMiqE9mcsmm0dXyO0R+31FlsUJEMWzlsxfvfiaEx8YlxvoDLt9uSIEa62RQOsKN9ZdISCEg
 p5zFeiLAPjurdb0oFZ1jD0KL1H1QyiEL/62b2w1mII0Xc+4rXXQgMOBJ9q2EIyk36FgAryo1Oif
 RyQ9hO0HVVGgzXhBF/Vo4zyxi5rphrGlHrEEqjgJI/BJCDsVmhE24X4I0qIGYPArW+RTF13SZga
 3+17YYHQ7aMZpV2FiHq/XYcWOXpG2/LQMedV2F7bX4Q29AXhEvHzFMSGoWKa4d6rl1citGp3Ipt
 bBVJtQy4FyNaVM6aXxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130126

On 26-01-12 04:12:22, Dmitry Baryshkov wrote:
> The clk_dp_ops are supposed to be used for DP-related clocks with a
> proper MND divier. Use shared RCG2 ops for dptx1_aux_clk_src, the same
> as all other DPTX AUX clocks in this driver.
> 
> Fixes: b4d15211c408 ("clk: qcom: dispcc-glymur: Add support for Display Clock Controller")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
