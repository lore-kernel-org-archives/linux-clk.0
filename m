Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06A1471CED
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797340; cv=none; b=JLKTFurIEOx+pUOVDPAsizvVval5gIlR7OCnpHjiBnovvMkf8/h2kyRFnXEJW06YljLy4EnrypSZQwkOltEwn77pHajx7dzth+k7+V2FusHdp9FPWCCgxkjYY5iU5efG6xxwbQG+XrzR8vkpUMpHFlNPilfY+YH32h/ma3fX69I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797340; c=relaxed/simple;
	bh=HyAYHeh1Vo0SrqzbBagm0y+GX6OcPB+IoMqBVEfh+Zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eD0r0CHe2FdCdXojsy7OAUnhqjRoRjDy4y9OJa/6UA3hxa9OJ9Tde69j/QLwbrupGQnUen2FyXB++1mfZPUVRUnjBw+44HO5kfbaP3Pr5tCzxQ/M9hG5VHsGqfPUejA35PRhFV7zMbx5io3Gr4my4V8G5JTmp2hPoWrVTmOZjwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bbc6jrA4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLyFSw2Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bbc6jrA4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLyFSw2Q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KlRh2181456
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 09:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6zN8RehjJsYWPFVmwb24sNULXmAN9Lv2jI4egGwK8oA=; b=Bbc6jrA42muGp6HO
	oHKS+YUI6IhV4RWCKAeyLGKtG31nv2MYtBZDcMC2gL7niCl0QTJaT6u/eglnQpeD
	AnpshpMQET3PGlJtVkNQwxXSA1ndc6lcVRaZQv06eXoFxYVu62I5IXmiqaPUCKzs
	/mXRvLQ3kSDuDAhcavgI1Ot6KXibFERbSfuPrJvCvqFBQMBQr+Mt5cdPOAEMAlyt
	bgV82iEcXh5TXGwarphcbD8/sChwrGpy+slqpsAsVEObbF34B/iBT34Di5A7LoR1
	Lz7E9hihErRoJ7SG0aSjaMuz6Zz/t3Mlxn24sv3t+1sVad2dfudMyInC2zzxt1OM
	zDx/pw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1s1h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 09:28:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso30551575ad.2
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791797331; x=1792402131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zN8RehjJsYWPFVmwb24sNULXmAN9Lv2jI4egGwK8oA=;
        b=DLyFSw2Q9EgXxIOfsDRLyYfCFMDlja3tOCst0FatZaIot3W6fhwbrC9pmpcWcMHejU
         /vPrnHSkpYKCpi3vsjn3hRyHxrRurDATddnssMdxSClVdRQZi88To5WBtjgkb2UenLUx
         guOIdWSneIflUHJR7LJpEi/PpW1rEeovAOAB0vhhsf4OoV2t2nedqaoMNeW+/nrL7YGd
         7CMlRNigp8oTPH6sOislQmM0izw8UlVKuwmH8J2zTELREwXsCr/KLrsWLtAHrqAOFN/F
         tbAGtAAOYnRI5kToonwF3jzGIoHQks0wyyAajTErAAJ4AQD7NEnN3nrwqDGx3QOExo6b
         igqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797331; x=1792402131;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zN8RehjJsYWPFVmwb24sNULXmAN9Lv2jI4egGwK8oA=;
        b=BisMn8w14tsVJlTRHfa/otOBVwHiQSswnb9fZzkbC1JSiuZIVPY/EliljPVJASbJ5g
         FyDq4Qv8A5vEPbeeFwUBnLodLgofBC9tNvskeCT1goOnyY8iK6NDqB1JyK9nLazZcpj/
         89e0F5xkP8Ophg9G7/q10H6PyNMq3K+MEmdHEcflcEQHsRkWHHhCti6wSe+OyModL23A
         YZCPf+wlLYJjUvF9TdIlQzqGqeaNs/68Pawp0gMpm3Z+QdtLduslWAY+JfN+kiYQLMSj
         5uZp4Ziyx0DcOBI0YiXhuCYLL9x64sESrTvX3hx9ZO2Uqz1E6IDRy15N//dgFulIQcCQ
         USmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTJpy8TT7yQz03fGjszDlmtLlrwLdC/MS5X5BrepSRZBCHDDUh7ReAn1/IrijRiW2DWeHupxCJHIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMzrUgm0i3TU8efG69CDEfOHqDIoZD9mAolFJhOgvBt5j/LyGa
	UWAUmIxMrJ0t0Ib/rTBCn6At9hjsTg+Xmd/wC7osktvknheILQQMxj2UyUxX8GaCnIKlFVsSmpZ
	xuiwupavB3KKePc81dreUoJL/DnbjRowje0GnZ2ZV87JEiQSDaRJwSnGIkGWQ4ao=
X-Gm-Gg: AYBFou07WXdVaTVmrhaTnyYpHMA4jfzmqAK/vKiUKvjEH4E5gZFL5bU5VwheESTPrHA
	ZUEp3Swm3ZZWhU4NgJ6G0uwPR4r8bTrnrL5y3fHSL7x98UCsoj6IgRwM2y3yMh6qwZSXS1250pJ
	AUHHXdaWOoUMqvGJ7W68UKY8Ap8CSDJThdPMFl7q9Y7aJpSUVYsUuQhxgd2N6JjKq7YodADXYhw
	nbR9q8oGdROjlgSZMNn37eWu0rXXdjM7LI6FYaBAER8VSk4UmeWt1k5YtdBjpuOSWxNLuCJFaXN
	YzCNbsa2HJ4+J0QZU3CxKZBnxgRMxmeowusIq3ipapWYNj0iUZIek1BtOSsjHYFpHCcgGW5tmBR
	1HvJjb6KJ+hwk5I9AEvQbq3TmlfmuGA==
X-Received: by 2002:a17:903:4b4f:b0:2e3:1d30:8654 with SMTP id d9443c01a7336-2e842cd4527mr77385745ad.10.1791797331240;
        Mon, 12 Oct 2026 02:28:51 -0700 (PDT)
X-Received: by 2002:a17:903:4b4f:b0:2e3:1d30:8654 with SMTP id d9443c01a7336-2e842cd4527mr77385075ad.10.1791797329860;
        Mon, 12 Oct 2026 02:28:49 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1807sm40875295ad.43.2026.10.12.02.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:28:49 -0700 (PDT)
Message-ID: <273f7f8c-e24d-4322-a418-4fd5ed84b0bd@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:58:43 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Use retention for PCIe power
 domains
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261011-eliza-pcie-gdsc-retention-v1-1-9349dba7e0b6@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20261011-eliza-pcie-gdsc-retention-v1-1-9349dba7e0b6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U75AlaDtY8nPCC8wE1QUsIiOg3XOCEjI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNyBTYWx0ZWRfXxNMMMz4hUf0R
 6Gh5crpgo5DcQmtq60n46+qVgK0+QcI10aqH3b53Grt8TEOcSh0dcEvWltp/uUVMbBKQoy1Z6BW
 cyarPMuIiJRZ+tskToZ9Q+Ab1TDoAd0=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acca856 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z9TVNPNHG0Lt5lYLwu8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: U75AlaDtY8nPCC8wE1QUsIiOg3XOCEjI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNyBTYWx0ZWRfX5PkhtrZz/wpe
 lv6v3vNmfjT4YT98UmP300BMaVbCJZJQcDANcRKjxIhsfmlHob8N2t2N7X92ml/io9QNTEOXYbD
 Q3kii3Q2SzFBN50WDHVuVNnfBZL7krK74+LSZ5qTQdFc/4hPyl3PZmUF6p7kbq4zooYuFRAbQ3g
 kIjOpdw0VwpWZQ6WB6pUPxbXm0Yc7LxEaTEM1HZcZw+CG03qmmpk2VG8eZI8P3DZ6R5sQ8cDV0q
 4ZBEHmXHIbgnCqR43byc9mVf0dYe/MpFiPDTfLLYTjFY+7fPf6cZPoi2fbRvdHUl9p8NnNukuMd
 JCgCJFKdZfjZH6fpbwKoQL9qtRdVtWW60ffYhZSH6AwKspW6n9gnZKNBxtrekHNdp54e/hWr3CV
 vU3txeAip4Qjdl23MqJTFhFTjPm7NvBpmgdxka0sj0Tgf39vKv0cKNUkpLV8UZ86yWp7ZKuA791
 3OzBLeDsPPwwkG/x8Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120037



On 10/12/2026 1:29 AM, Abel Vesa wrote:
> When resuming from system suspend on Eliza CQS EVK, gcc_pcie_0_gdsc
> gets stuck off when powering back on, preventing the system from resuming.
> 
> Use retention for all four PCIe GDSCs, as on SM8550, to preserve their
> state across suspend and allow the system to resume.
> 
> Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-eliza.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 


Hi Abel,

Using PWRSTS_RET_ON keeps the GDSC forever ON after first enable and the GDSC never
collapses.

For similar issue on Lemans (pcie_0_gdsc gets stuck off when powering back on), picking
the below changes from PCIE side helped to power ON the GDSC properly without any issue.

https://lore.kernel.org/all/20260728-hotplug_pci-v1-1-d1f38cfb9122@oss.qualcomm.com/
https://lore.kernel.org/all/20260729071514.859778-1-manivannan.sadhasivam@oss.qualcomm.com/

Can you please try if above changes are helping on Eliza also?

Thanks,
Jagadeesh


> diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
> index 064771726e9b..21fd93a1f6b2 100644
> --- a/drivers/clk/qcom/gcc-eliza.c
> +++ b/drivers/clk/qcom/gcc-eliza.c
> @@ -2715,7 +2715,7 @@ static struct gdsc gcc_pcie_0_gdsc = {
>  	.pd = {
>  		.name = "gcc_pcie_0_gdsc",
>  	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>  	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
>  };
>  
> @@ -2729,7 +2729,7 @@ static struct gdsc gcc_pcie_0_phy_gdsc = {
>  	.pd = {
>  		.name = "gcc_pcie_0_phy_gdsc",
>  	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>  	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
>  };
>  
> @@ -2743,7 +2743,7 @@ static struct gdsc gcc_pcie_1_gdsc = {
>  	.pd = {
>  		.name = "gcc_pcie_1_gdsc",
>  	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>  	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
>  };
>  
> @@ -2757,7 +2757,7 @@ static struct gdsc gcc_pcie_1_phy_gdsc = {
>  	.pd = {
>  		.name = "gcc_pcie_1_phy_gdsc",
>  	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>  	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
>  };
>  
> 
> ---
> base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
> change-id: 20261011-eliza-pcie-gdsc-retention-daa497d5578f
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> 

