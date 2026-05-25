Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484E537CD35
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 11:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707284; cv=none; b=IEzSTffYAZTeew8OkPSbM+E8SCpN5ls8DZRMqXnsWOUfal0eB4ejdZfl6DQx087e8Im4pntl8sK/85FVK9CeYyZP4GbZViggTOfUjfKqCzip7814xUcv9Pd6ehDsu4BwXhDxX/xJ7beijUj5q2zyRu2VEDo17j3JHxRBFg72IQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707284; c=relaxed/simple;
	bh=SRrxAHl1aPSl0RA0gCDQFT+KIos9pY4JXr0PnQa3AZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ea/i28A3NuY5B1ZLbklUKnxEc/mKeORSK7L6obe7ZvCpsC0EEgg8EfnfuVRMAfAVieA3HuSEe5Y7ACPzD2WbLBTYeibtxXKVSFZnw9gdL+3cJrAQ8pAFyl8WKABrza1A62TD0CIx7xoqf5r+O/QJ1KdUY2ap/4nL25QNeYsPS7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVS+dLy/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HdgKrrDE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVS+dLy/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HdgKrrDE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PA4cqK2146016
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 11:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BQBUQK+ERcgosuGR7NTC0wOZ
	R9xugN2ow/YBjTyK1Iw=; b=XVS+dLy/RFtu826qPtQMuxk+BHyD5ZXsASq4GYvG
	1UhkAaRZLGsZS1qqo60dlz+3TKh0TzAi0METbxd8pdlrtVv+XkxXo9f5XgSGEp33
	PQGy8s0G436YEymGx7nlWEQhA7U+E7r/zybdER/dTe/2pZCzf7KNSXOxQZl4uKVN
	xJDF6xqEXG5+TL8fkr8lfDSkl+DF7E2ZEie2mV261jkg9ZPZ9rIofjtsvYNYlr8y
	E8l0tHGmzbyVD+jAGNRwMc633sdcFVgqL0l77S8ZkdEtcWyrwwepctsdTGCdcHSD
	lCq4ZOYOv8UvfWLcXDDVr7mZapD3d47NCnF9OO1wxVLdxg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv06fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 11:08:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95f5daf2d5bso13248376241.1
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 04:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707281; x=1780312081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BQBUQK+ERcgosuGR7NTC0wOZR9xugN2ow/YBjTyK1Iw=;
        b=HdgKrrDEwuJ+TgFxbfLUcDy4AyJuCqMYjsBS8iqc6JOVVcrju0dwIPz/3KSZ8fTzTV
         PIZNg5GR6iS8OvcYihZyyv6K/5B4ZvGUFqhT3UpMGplN2cl1tgqbzW0yxLm+Wy5gjfj6
         hAr3oWCf6oq30SOWpmauOqJBbGUvVdJaetAHkVeI6AfHebQ3bZtKb+dBqI7930hgGU0I
         0J7XIypMYqsKM+PxNbMT8mfFsOSDXYSE7z0C9MVp28Nfj8Q0MhzlKXYKMcKHoQWKTT9i
         +YUCPCse+71qidb15Zc6Hy+rZdhSuhO2ai0XDujQBTpTLbs5dmiA2B4V6txDIoTAuETc
         IwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707281; x=1780312081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQBUQK+ERcgosuGR7NTC0wOZR9xugN2ow/YBjTyK1Iw=;
        b=PtP8DP7a5dKDNgArr0CCwJQCPcUGO4YwziixovMSp3R5HVM/9uTYyIy0r/Avi1fNmQ
         cGALIqgqSrYFK2gPmEjILQXL8uJg2EPInj1Fc6ZM6tSarq6SoVzIiWSB2qFo/KTBcMe4
         NT3a4/wc5RdqlMFcIUYcZcEWtSDMJqHsPNKCiFU96LnpzlmDkcCs+J+3RxbaupPEx2fq
         UvzG890QNE84Fx+1/6uAnOu5DvMn3tKAYvRbjEsK+nMAja46GfoSDzHewtSu/elX7Y9W
         /saM4IV50FCxO6hCLr/1Ogxy0pPC5tgqsS02VhzViofMVvi+dCRZz6wwU/WsgmvUkUUN
         oxDg==
X-Forwarded-Encrypted: i=1; AFNElJ8hNkHy2EDtZnXbsyEfiR8ItvDKVlAoLCdOI9tzk1SEQL5fMMF4rbm8KYUA8DCI8XMEXe7aEKZRngs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV20wE4UKE1QLY9z69EwyfpRYMKU9Ac4tCR2JAEVqFlCqhWnKK
	7o26VH+DbaWHcGWkjQbXsVcghkbgZfiQXfI35DJNUhulnhhHZL04f/ZugxOoQqMu87IIUIt+M4F
	QKnT0ClKlvVhRmB4trDDTvb9lWrvc/teptKkL4rkNgflUssBPByE+/+PXQ1gaWns=
X-Gm-Gg: Acq92OHmFCmFS94q/GoIXaEVOY4epFk7rhkTZqKc3aJYuIic8AHHOS0KMvDnqX2ZeEd
	nEZY+q2Q7EZKvEs05nH2FaT8enyD4rhXCVVZ8rQGuTRisy+kQ1A2xtW/1EJakgR9RuTjma8fTTz
	7lrJynqGQQdyKrwmo21jL7r1PrNWfMSsffM7XDCAODiQ7JYkUUm/ENvhxvhvO8Xh5VvzFqCB0ZA
	eE+D+qR+enk8bp/Oy0/v4frbOoK8W4bVx9+8mQ7UMIR39vA/M3w9mavZhZTdOQONw0x8s23cyx5
	54aN3V3lQp3tGy1KMKSB5ulyTIaphdz8P1fN5wA87TTbyd72TiuHRnn8WgcS/f0KthcFsB9bPwy
	dH4LxlcV07/xg+gkiNUKkDnl+M4KvQDHmAJ6vBI8GNBMT6n+hRI6gTtfF/RUsxifgdXL69y+6Qw
	gUivSZocAC+YQ/kUPjX4FGdoR1arSs548YUTU=
X-Received: by 2002:a05:6102:4b87:b0:632:d8d5:291b with SMTP id ada2fe7eead31-67c8451a9fdmr7416024137.30.1779707281655;
        Mon, 25 May 2026 04:08:01 -0700 (PDT)
X-Received: by 2002:a05:6102:4b87:b0:632:d8d5:291b with SMTP id ada2fe7eead31-67c8451a9fdmr7416011137.30.1779707281261;
        Mon, 25 May 2026 04:08:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf4f1csm2578738e87.70.2026.05.25.04.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:08:00 -0700 (PDT)
Date: Mon, 25 May 2026 14:07:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 5/7] clk: qcom: gpucc: Add GPU Clock Controller driver
 for Eliza
Message-ID: <kmscrht56ljnkntponlvzuumxgdm3d5s6ttye4hwtq3uaykwsj@z3pyzcib7pk6>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-5-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-5-a1d125619a5a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExMyBTYWx0ZWRfX4V71i+PklX3K
 v04I5Ja0b9dXiz1Zs0DDqY7IhKypeKajgGPxqqyDAtC5iNCpBG1XGsD5ClzLremFEXM6+2c3SUZ
 JsE/ihImVaMLoNtX0wAiB64KZU38D41H/QMH3iNVg9IPDQz129lJ8iZt4L0Vcw+Ltbxjxj5PTfa
 CR4zXs9JpdZ6WOAuGOVrX8e05OWNWQWmNqwQ+C2COTmnMVvSgUvazr6TKEavm+MEWZk3/jDbegS
 XRGeXb34vcIDDUVSEKfTHX8Mrek42CZfU0+laiq0yZW061BAG5AFFvhxwTDiVL6ogD1MF4UNlE5
 yZXgeHB8qPL1/Kj/0wY7UzPY33rVCXEiYP1ecGugYHYB3egivc+lx4/DQRJL41oO47fjFP+eq4k
 WCTARP9iidn4HGeUzps0EOfXvpRmJCHgV9D2g+47d1tVmkSHUh2aO3ISlnC6yycvqbNbczKt4Cv
 vpGJNzpqyAjcVe9i02Q==
X-Proofpoint-GUID: HiapIi9zSIOa1cmcRBw0DMwplfGkonXl
X-Proofpoint-ORIG-GUID: HiapIi9zSIOa1cmcRBw0DMwplfGkonXl
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a142d92 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=whjPl3NbLinN2m9j5McA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250113

On Mon, May 25, 2026 at 04:16:07PM +0530, Taniya Das wrote:
> Add Graphics Clock Controller (GPUCC) support for Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig       |  10 +
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/gpucc-eliza.c | 607 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 618 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
