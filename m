Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7555A165F16
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 00:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772670802; cv=none; b=ZGahbyfHTSK3uPAcuFoZj9tGfthhLjRJCed175s+h0YG1wCBHk6A/AWt0vpxQUgRAb7ULD5U5whz8yc98gVettM4d6ZfduNnNtZw4rf4Lmc0SmCnQfuDTfpslcT2gfh8bs2b3/82CtQQqP79nqyJhvedBM5vK+E7UAcjeglDo30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772670802; c=relaxed/simple;
	bh=Y0jfqBQVatLtNuRSdbQ1VmzHYmO74D24CSlx9dTBF+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lk5X6zNSOSsrVBqoxswPWWDhNpzshGJXOTl1Uoz8A+ByYvMM5q7MOX0FXhcn8Sdd+bYJ94YMnTdH6tisKlp1jMu3lv1xUHVrSlFeQrw9A4y2nhgVtchsUBTBnOW9LVua88UtNk3/EOsNwjSBnIFT1lKzCmNobHPKOnTZnycru/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPNx7E1H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/ABlgAi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPNx7E1H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/ABlgAi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624K9f5W2050144
	for <linux-clk@vger.kernel.org>; Thu, 5 Mar 2026 00:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D9mKbU7aWwckv8b9CxSJssvN
	s6rUpcRIxYBgm7x0puU=; b=XPNx7E1H5jVwmVL0ka7/Q8hGcx+2YkxaDvNhNGPd
	WYnQJx4Pnjgakuay2wXPMHZ1qD4j++XC09+k3S8Otk3NrCV/qnW+QJdkzy+2IHOq
	F/f5d1Dq9SkJ3QDis/rNAH2FZZpb/Fx3RgG/quUmYvGUbjaLK4bmdcv8wlxtz3Uj
	Cr7XAAirM7hnIKqeRBMpNa/lMxOOyd8zurn0jR2OYs9SqTmIEsKK4cxkrnxJK4gC
	1H1vBUeXYAV07SInikLzhKv4fHx1TSxPp3af5BEKDtuBn7dHdMesXabDvoN6f5v2
	CG6XYhyK5jO7pAneURIGPCbpgq95ntPy4WJJLJxQMOKHQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb0jvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 00:33:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5075d3ee219so420616321cf.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 16:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772670800; x=1773275600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D9mKbU7aWwckv8b9CxSJssvNs6rUpcRIxYBgm7x0puU=;
        b=L/ABlgAikLFfsMteLIn+bHkD70vEyA/FERByBGmJeqmvS8ndhs3M66TB144LEAcuGB
         sZ/ak0YO8eEs/A2lkWlceux/pcmxC7WUW5GPfbrpD87kXVpoYOPQ+DR0s/Ze4I671gHJ
         mlrcnXV/g/cf/8LkCdLsRIW/gSXa25iLaaXK/FKqz5P2lhFWfdaXJJktW3G1uXkhBCT6
         S/WI8sJkiBs2ld97DJunH37HAI0ZsxW3wEOCy3ZUHjHZT0sZz6GS4v5dFxoaWh5UwG78
         J3D4wEdUv114VBh6rq7HQxhDJ9KgwXWX37oIAR6z4gaaXBwa7dY/PzU6ntwGapgnV7Vh
         pqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772670800; x=1773275600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9mKbU7aWwckv8b9CxSJssvNs6rUpcRIxYBgm7x0puU=;
        b=xI6yJh5qY2tzmzn89fc/vLmAL/gYtyxLdEwKrQYOvsoaL8xZbp4VNKsWLqq6ieMt3K
         nDIMohNiJnf+6DYeX4vXe5wUwWWeICzQaKdcrRqSbg0BD0PcH5V3G9G4WmWvrYSLyunB
         GN+Q7aqjH1h/ggWOkvIzyyoJyAur7XOzzUOKDERPBzR6VCEZynL6IGIstCs85Q06si9J
         hCyWZmBweKsqSG1+aEB9miVT7lXNsxErx6Yroe7fklwfqJE+XrdfCMu/m+L0Um3P3q2T
         aIz3+GMkDwkgxrVm7zPasG64zoT/UcrbmWCWdsojEiOBPeisfyMGI9ERleMRSc6ZOWj6
         UAQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+Rlk0yNuwiSMto4ZG9wCUVDul0ALgVDxO3iI2chWZW3C7IMuyl/wWY9o21kJz1GkCqZyiVrNasik=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK3v1FE0Odry6G0VpL2wXga0mGWlU5IFn43osPFZjFZRX4eOhH
	wHvVZKSrBfMYMtS4tcnqsjls4A9vHi6Hmdyhh0aSHoaBCMoTgrC7CsMNon11Y3kgq2SC0Y2kmBZ
	fXDiB54H2v1PGUwyWwgpmeTm5JVWBtgCRraHFs9vF+6FtvNXz+DCvVCxlp4uGSvo=
X-Gm-Gg: ATEYQzxfDJEfk1UawJccIOQ1gSNoXUqN965uUFu1oJ0nIAePLN8IxCF72kwubJ+AFVQ
	ARz48txGN6FIBzQoBX+8ZUxPq1Cr//rxPe9dZZNvNWGTTn0O0ZAB39Z21P2ucgs+E2ZHQMLPuJR
	D02EW8oBHvgVkbboDbr8BZAS37z4BsgQNDkAs6Eu4xIWn5dXjwEqm1wojVn2IQdE7j1j67du4Cx
	Hw2Ma/LLLZIkReksOBO5p31OxqZI26IO5KfG+ySPs8ulMrjvqqANt1kIYYfaXv2lWKuLeARSmJz
	CmgVGziG+aULZHTas/rzBEhm+31k6awOm7zJK0jwvgpM+BhBWFxGhvXDdptXeAgWnmL0m0A3kzG
	9sUXwVCWzv1JLR3pjadbwJ3r3POizCBcSbzb2fFzfZHIg+C/7JQhTxe+oiKIoTo7A5PNbsEOgCE
	myyQyXL8he1i95wGccAmSUDRP5TzxUcnU+R1I=
X-Received: by 2002:a05:622a:144e:b0:501:40af:96bf with SMTP id d75a77b69052e-508db43b8d6mr56480331cf.68.1772670799751;
        Wed, 04 Mar 2026 16:33:19 -0800 (PST)
X-Received: by 2002:a05:622a:144e:b0:501:40af:96bf with SMTP id d75a77b69052e-508db43b8d6mr56479821cf.68.1772670799187;
        Wed, 04 Mar 2026 16:33:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12358ef25sm1631204e87.3.2026.03.04.16.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:33:18 -0800 (PST)
Date: Thu, 5 Mar 2026 02:33:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/7] clk: qcom: camcc-x1p42100: Add support for camera
 clock controller
Message-ID: <2byedzh5w6ymnoebve74a2a7oezgich25wdh4pdsqmvv3jvpkf@kyk2gz5khibe>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-5-dbbd2d258bd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-purwa-videocc-camcc-v2-5-dbbd2d258bd6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAwMiBTYWx0ZWRfX3cQgdQTuWmBT
 ib92sq64CCcv5mt67zpBSsr3SpSoAwKpzyUte0ZwWgoSxSY9b5cxx1nuwGzaN0knXSU8bexITP4
 3qW5qCZLvjufDEX1at2ed1qXaI+VMWpiaBTnZTcqTWXEsoA+mVBHzCE5tEkQGeTu7eXTsRMotBA
 G4fVr6dSZqYTfR/Hqo4F1lcVmnOwaTc06+5Y3aUyKHquiwgQDfOOV1efjg4UGcr8B1de/P417dO
 ZYVsyrh7dD6rsB03zDNAsSrLjSeTLBWhgb3S5dAkuHLhMuz/Jo11R7oanMRv1iB66ARWpwLgu5k
 gAHefm0YdAWTytdD/5/syyYYhDIFKkZEF4z30OTlKQEN9Ok9HVzniBlhWa3VxRnqeRQrHy3SzAC
 CR6AMiUgoE18ju2kowZ31/mCrfC6nIfTm2ZHqWMp1kPYnbefiTBQD77cloTSS4ZYXsVz5UAIYMa
 3T+FIj1oxiIMA3mGtLw==
X-Proofpoint-GUID: -YzO5IssOKPq38MDLMyBKaAFDKNYyLMZ
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a8cf50 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VpPMKPZmRKeoA34dWXwA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: -YzO5IssOKPq38MDLMyBKaAFDKNYyLMZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050002

On Wed, Mar 04, 2026 at 11:10:55PM +0530, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on X1P42100 platform. Although
> X1P42100 is derived from X1E80100, the camera clock controller driver
> differs significantly. Few PLLs, clocks and GDSC's are removed, there
> is delta in frequency tables for most RCG's and parent data structures
> also changed for few RCG's. Hence introduce a separate camcc driver
> for X1P42100 platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig          |   10 +
>  drivers/clk/qcom/Makefile         |    1 +
>  drivers/clk/qcom/camcc-x1p42100.c | 2223 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 2234 insertions(+)

I've cross-checked this against X1E80100 driver. The main changes are a
drop of IFE_1, SPE_0, and two PLLs. However it also:
- uses hw_clk_ctrl for several clocks
- uses rcg2_shared_ops instead of rcg2_ops for several clocks
- uses hwcg_reg and BRANCH_HALT_VOTED for cam_cc_camnoc_axi_nrt_clk
- uses HW_CTRL_TRIGGER for cam_cc_bps_gdsc and cam_cc_ipe_0_gdsc
- uses non-AO clock for cam_cc_xo_clk_src

Are all these changes expected? Are any of them also applicable to X1E?

At this point, I'm torn between suggesting the merge of this driver into
X1E driver and ack'ing the current form.

-- 
With best wishes
Dmitry
