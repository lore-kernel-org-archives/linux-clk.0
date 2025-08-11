Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663822777F2
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908440; cv=none; b=U0TAYjwfjKnvsExHAnEayleOtCPl4S95VCclvibX341wSW4RFmH0A/tgDzmKuqSaKGZft3ZiwlTah0lxJ9GxujbP/MTEXMzo1c/51TVQSosNzYDRVVdstGujQdTUOhGWNBBKCIUk9SDfM+0YeniInX682Vc31GaBY7Fs2cCrNcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908440; c=relaxed/simple;
	bh=n6bYWBbuvYgd7Of4AkNGNr2HVdrMAtKaVoR0TN1D2LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LA0TOPveZ/y5UPzawfMQQ7m/KlvhEJ7A4qlM7u9c6cVl0ppEkKGe9JgWg0QplYkw9ez4h0JRAzMgSegfZRKSC4HxxSCTAEWNrcM86y6cl1DWM2U3/bmyQUoRDGRyI6jIbrs0dfBED3xXQ7CD9I6YSjJiVrD3tHF72ctCZynreqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aj2ELdzs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aj2ELdzs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dpeu021817
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=Aj2ELdzsgekhYgRt
	ClktyV2PtJ2CPU1+yHxzLljbB7VL8jO6/Qu75jWuF4fCwLZRtRfpwD2z+8UHaQlR
	F91dHXHznoR/VAZnbcxOhAUWozo1E/eSg7+hcF4UbaaP1SS8dX3A3ul8wwIvfskb
	kAQKD2pNqF5Ooj94/JJfwt0Adj5BvQ99j7X7bZlnKoz6n05iJ5U0uT2yhvQsERrj
	OPufcVYx7EdUIj9e+yP6ogpa/JGZLbfNiHq5zeUzmzO6ksgpYxhYFm8dXIuLIxOM
	ZaqxieeJm4j532hLK/vWcm7CSL9NeRS7c2KyCBW+NCpiuXBPao/WoB81t22D9wFK
	aerQIQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g406a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70941c8a17aso12941996d6.3
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 03:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908437; x=1755513237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
        b=U2Ijs+8jXRhi81g/nMrXXi1kD/c8Cc59glA0bgPtuC8zdarG0gkJh01ivwqvqq4y1S
         IYBoM0GVngGQMu1Xv/B4U4KU6XMPCi4bni60evnbmxeiNFYb3CmWXUv0Bay44xDdnEKn
         s24RkZHZ0kO3gzH+KcGZWqM+YW53E6BCia9eIAFVpi4/76FJa4InNoDysClG+DuF2kU8
         AmpZu/hM9fYI6CViycSsLs+gzs/vu8HaEGORqUrxD1Jxr4s7qbHMvx1cysHZu/D5VyGO
         s80aU8gOmCvCz3CqKFT95e1rZ3FCwLb8A6ttBoUbHSEmRBxdFG2Z63DGa92brBvEL2va
         IB3Q==
X-Gm-Message-State: AOJu0YzhlDsHWWcUD3Edab4rQ5PZ70lEJngiH3oNzFvMfzMUEBHj5YRa
	rEeFmrsl+y9Rjngu2GaBxtX6pJ5Ub1OnLsSf5nS2e53wbihsRSSaJ5mMA4CYbuhzytz3fanDcmm
	sCMYhzyA2QEbXJQJ7n7HineeyuXn07MJBLo6RcjN0xXrPVnkdNNONNdrhrP28abs=
X-Gm-Gg: ASbGnct+OksDvb1X8Q8KdSYh7mF+0nvoZ6dhsc2bVXFiLgznzgiuBS6Bbn4ktobYZYy
	Pzfudt5OZe2r8CHuGDKe3MHiTbAU6gFyS4bL9mBSXVi0ekYTtnyTBfClbAiQNJIOCoysUDRlwEY
	i4cwtdC2v6wC8viYe6sLR6MvsqgyKtyh5Qeb320AEMJoAh1fT7zjlT8nuZbcd7VEerL35smSscT
	rGdiCH0+cDM8AgaUV8XYuPs9dAmA8QNE8HQFi/APtg8uqn8H64EFeVDpeuyefvPvwOp+pg6M2f8
	OD4SiiRt71pK/FcfaKcDKviglW2y9yAjkwQd6OwrHvIi5NqQG/P7N2IpH+BYSFhYcuOzV3yQK+2
	wK0pxE+dWLwjdo9xm/g==
X-Received: by 2002:a05:6214:21c9:b0:707:76b6:2135 with SMTP id 6a1803df08f44-709ac152639mr49721906d6.4.1754908437531;
        Mon, 11 Aug 2025 03:33:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZPUcFhvJ+o3XZIPZBMeA11da0VhO9plin+aeS/4AZ3/QDcw95Q3QsJu+fTZO17e7WElJo9g==
X-Received: by 2002:a05:6214:21c9:b0:707:76b6:2135 with SMTP id 6a1803df08f44-709ac152639mr49721596d6.4.1754908437064;
        Mon, 11 Aug 2025 03:33:57 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:33:56 -0700 (PDT)
Message-ID: <1442a1f1-8cba-4f63-a9c8-85118d728365@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:54 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/msm/dsi_phy_10nm: convert from round_rate() to
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
 <20250810-drm-msm-phy-clk-round-rate-v2-1-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-1-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=6899c716 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX5eOSxDKvqK3P
 JVsDGSxyH3N1lBPvFgihedvGMZrOFG6skvKcWlJVKBb7N91Hj6PgCzp7Co52AazH7qP5uCI9qWb
 sFqwCqVTiM1ReQbUJcemomCpjOgx2Gp7G/JAW79TvbAD7zyawKbxgQ+NXHFVCP1xIU4psJNTih4
 3P7JKWjINclxlD7czduL78ku27avT5gXCTt8AU4q6OD1r0GaWFR6egu8ztWv4iZUnuIuUFQT7IY
 UdSGiaTo/MxohEkvsx/I2eBRl0rokPQpfqi+z0SnVtSP3ltfUUSBH80XMFTQ/BATwlr0HVDtlmH
 z1P6PHtFrr4J4iH1buSHvMRf0V2uZ6mBcFMVOFe7lFY0wp9OxxN6/6oSMUEpzf1ZPsTpA0bvXUY
 QxvvONOC
X-Proofpoint-GUID: XFDW-M2vhIZsKyE5YHx77mBJfw7tMI8F
X-Proofpoint-ORIG-GUID: XFDW-M2vhIZsKyE5YHx77mBJfw7tMI8F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
