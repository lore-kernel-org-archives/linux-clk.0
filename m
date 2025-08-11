Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3202101AE
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 09:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754902973; cv=none; b=n/ulIxMCwOnnd+XpzSmqvqcxU2D6SWU+E0PGkGNjw6VNClJDF+e8zeDslHUw2LKHa2cVVwDr+EJ9QAoUJNpDih6/zZ+WdGfFhBw5HW1Msf5v+WqcAAHG0fHvOKQbt7Ji//1qRXogvNVt6PJwnBifubXRKk7xDH97q/0FbuZJ43Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754902973; c=relaxed/simple;
	bh=tdgwIQdJG+orKkZyHmIqAu1docbT/zmwkliWXBBtmGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuCSfNEd1oRTPIqjCjP8K7ioYVoqT3hfWi97TVkDsCGsciJ9Twr9xF8Susozqp1pRA6p4W/NkEmUA9oo3JXyy0Sw2OP4QllC2mu4SUnWhzLM9/6HNNzhLecNUnRvLcSPDhhQfcS96//OanogXr8ZAu/Bg4Cq7djacfVergJhLKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfYtt73T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfYtt73T"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ALqfh9008276
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 09:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdgwIQdJG+orKkZyHmIqAu1docbT/zmwkliWXBBtmGE=; b=FfYtt73TZBF5+9/z
	qDBn8YF/XFOCvLK8+/qPa/2rX2ieN8UifIMXB6c0XGgtZc1uOHxrG9sMzXaVOTMW
	ODfXLj1cqgiE94V7Sea1ZRVhXpTDS/YT6vK+Yvf9qP58EoLphFNO4V/PM5YrTbWf
	FafAbgxCz2Qt8Yw7MP+UTHtXhHT+jMd/ERgqL2Zs9FTpY1iCxL63eu3dJfUX9Lvn
	ZNby5h2tNk1xx+IBNHTohCpm3kk82W7QcvKl6CL1SXR2Ar9b2D8DTx7Dlc4J1rRz
	koCBHRw1vEqu+UufFE7wk4xUFFporON534+10M3shJ38oZofnfetpOYD09MFP//G
	+w1TSw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxq6up9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 09:02:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af23fa7c0cso12196701cf.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 02:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754902970; x=1755507770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdgwIQdJG+orKkZyHmIqAu1docbT/zmwkliWXBBtmGE=;
        b=o8q5fi8bafRT+XPRMrM1f11hBe89eYxryGoCaohC/+a6AB1/mhs2YLszbZJ+x5K0t4
         wSdB6MhXIVS5JoPY1cIRNxeLUoqnvJ8lCcM61VcO3v8RrNEn20NhQaSK6u4/GqJCk4sH
         PPnI/1G1jnfWDnBBDF1WvWmOwzR9B1GlsFiV/TvFaqalrJZ5fDku0QbGRUQz3By1TeGw
         NKT2dZv2frwKyVREJpMsNjtm+VciE4xopl7DBw0m5Q0tHHO0wb1CP4tOP31dK3q4/X7Z
         qFQhb1XYBW0YpQIZpevvDDkVNZoonIaCwiqvcM0MTdFwfahux5DYYOSbk/3O1oHnDQGC
         OnzA==
X-Gm-Message-State: AOJu0Yz5Sm2gi8PxUgkU81RLMJdQ8FTUNfw3M0X09ZNQh2cJCJvNo4tQ
	TlDO9PBky2qjWZ6rnesj5uPphCSV5gJDX+9uwT2A9RJv57WC5ZivueAi8wYMvRaL5au9DPwrOMp
	FMRmiUCDfTsraodqJmGYFe7luvsC8frYJ8Ggkrizq151oUDymHGNTU75aTc2w9BM=
X-Gm-Gg: ASbGnctlIfy461MEUBOKlymaN6DtsadLF/ors7D+rNRygyUO9wqLo30MG1BYhiDv76W
	AzmhAmXLjyQEodFxUq9Z/cjOGWNIdkVS8i3q6f3uWNDtnRrrWfWUdln02WVlGYbDylSFq5PY/02
	gFkuQrglyuP3LZaVLLVZ/DWFDO/cpCILbPVDe4EoIRzZujpzOT8aUETVxA8eQHpQGKoFJMcv43F
	C6AL9xvffb6FLoaAL0rpyKqroBmvXOMPIUhGDhyIqR44Agv4i8DZ8fAdfYOMUe1cPxPA1bwzAqa
	2aW7yTXknQUxPiqDRMRjxZnQhJ9CfTfoe4P2Mnm74b+wAVZ7lL9Ns+cowWjvwNBIzjiMdm2w8Te
	UyoxHnZY7dOajfvdFKQ==
X-Received: by 2002:ac8:5d51:0:b0:4a9:9695:64c0 with SMTP id d75a77b69052e-4b0c1b28bf5mr48920861cf.8.1754902970261;
        Mon, 11 Aug 2025 02:02:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5TWRviyLEMQPzvh4QVbqH5jPy1ZuqxzZtRDTRJ9JxfjUgmBuPx6tAaaAYzS0THJjvJINbNA==
X-Received: by 2002:ac8:5d51:0:b0:4a9:9695:64c0 with SMTP id d75a77b69052e-4b0c1b28bf5mr48920671cf.8.1754902969784;
        Mon, 11 Aug 2025 02:02:49 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0afsm1977783566b.117.2025.08.11.02.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 02:02:49 -0700 (PDT)
Message-ID: <d00689fb-8074-48df-ae95-bcdf5e756111@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 11:02:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] drm/msm/dsi/phy: convert from clk round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyOCBTYWx0ZWRfX5KFfAzQNM7UD
 Qj2GK8i6zi7XzbIRitOcAmnT+pMRGoC4Mujq6VY/6t8R6lIOq7rEEMJDkfM66NRKOft8uliJOaT
 D9mT2A/VDTpc6UsDNXeeQQNXIwCa4XOkXn0c7i8MJoj2MOBe8P8YaBbD0iHgCMFgrAvUdr2Ga4C
 ASlSxMp1yo6W9bf2JC0QfAflJw2uoJ8wOIAXMOvibCV4lB5ay+BqqzoMFKpnS+vyhPT8uGMVSUa
 OKbFuFqPxz3EXRhynzzn+7noHCxmpjXegR0cuSWoaIHKyHwYrr1mw5qMXi9ARay978xVIkczRH7
 HRQYxC+lIg+9XiYmxELgAxOCv+yXI6CoY1VMZRs4oei2ol8PAlwFKnoeZfuNLifXGfO07gwOASK
 m6GxRraV
X-Authority-Analysis: v=2.4 cv=QYhmvtbv c=1 sm=1 tr=0 ts=6899b1bb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=aS93HcZ8ji4XsMPHnqgA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: bWaBtGM-hzYGGzf2QMyWtpGl5D_m6q-u
X-Proofpoint-ORIG-GUID: bWaBtGM-hzYGGzf2QMyWtpGl5D_m6q-u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090028

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the drm/msm/dsi/phy subsystem using the Coccinelle semantic
> patch posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
