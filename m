Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F7538C2A5
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 10:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658604; cv=none; b=lMGyLSHksht7BlfKYrwXm/53SIHW+sRUoYyy3dBca6cH41CL+B3Nt49Qdix1eDhEQSXdxaHKJOpuYwsIdmrGaQKyOkyLc2y4dBPsFozBXqx7EaGz28DiVkPnssuN5ytenA71xcc04Sgnw8gNK9RKEEf4AfRxDLbP17qixn0MwVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658604; c=relaxed/simple;
	bh=ACwzMbmF9TQsZDiTKYUrOcjxzub0mvW2bqEAulbcY6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OQPvITgFYnszvu7Zx179RPntOfHDrTf/XdlzsS2nqD56cFEScIys+H5uuVSmJ2iqXUaGJ2C4c/Ke3wA6k95qqxoBKNeJqAxgrI1kL5nQguU28X9+gBs5zz6olYggZ8f2j8FhzQEe7q7loG4LDO5eqenEqU/AmWHfg48lo2yKA+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lslEvEWp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSoiwFbQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lslEvEWp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSoiwFbQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G658Wp2673271
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 10:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXtNx8YBXyh0ulArQuEFaFKF9zsreL9yF0cLXh3jd4M=; b=lslEvEWpd4R6zosq
	5y8jPCw9UTm2ZGcfNVjoXFpPj4efJT3pbjnuJZY4ZGiGFur1kPRKj/1ANrODM5G/
	6BKwnZH9GUdEThch16Ux8kDzDBzCtrrecWwRZF2mfRuJspPEm83UH8giTw4Y1+9H
	5+3PVCl+6PClQxJ9Z9/F2F93R5wbmUz78mMxxPLlhJE/Edw4eVBcRtb6k8xvWENA
	XKPXAcRM2veWlKNXWbHl/NNFNi2X4fuyHi53Oq2H2dqZHkkSiEH3B9cvrikay/Sd
	wzRuIvY8fhBPNegTZ99zN2PPdL901ujGiIIhOkJSzG+l6SJeTSaJ4uaaMuXxUO10
	D72Orw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xnbva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 10:56:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8297d261a67so1854244b3a.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 03:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773658601; x=1774263401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXtNx8YBXyh0ulArQuEFaFKF9zsreL9yF0cLXh3jd4M=;
        b=ZSoiwFbQtMyICanO2M9h5L3NxGlQUMLmc5oqFDr+NJa0/iWmKtQi3T/c79ztomKOXH
         a0wdQ+2D+BLD3mKnHg4/21/HrrkLPsPFupbyMINfbbLG1930ueX0cpm0I/xazu3EmpCx
         wdNurU+0baycb2VLzkJm2cqgP7XUTFHmEEri2Z005NZrcjaD+R61SLg330nWohGOm19L
         uG18FcMu9xi5ogmvsvdlv7RpoztcqqhSb9vqlSSi5qCsqXPPQ5ZwjUcM535IvMZ3LJkN
         9BPTmgBAzCLUPbIaGgnKIbv+IjtpxTIAiKHSbTC+4k+dQhaiIjQINHSJL/fEyC1Dda4Q
         ka0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658601; x=1774263401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXtNx8YBXyh0ulArQuEFaFKF9zsreL9yF0cLXh3jd4M=;
        b=AGJR/iQvbXPafnN96IL81/hNAcoPNFd6LtXxQh7Ecn32ivTkG9oce8ODc0nI5jFxpN
         cZeHNtUwL3IAW8/Vd2/CP8b8Gzh0qdoxS3wlOikUOMebApusQBq4qROGwg1QHNjSc9vA
         M0ZCKxZhBMJ3teRa5wkWjy6xjLWP6lqgDMsv/qhHYppeo4iwXXuRkgDc3G3rM8t+NLSI
         N/YsetmrS3Ta+4CYTbEsfIoWWoJ9lv0O+XYDkwPPL9gbIYEQEv3sQpPiQwRV+EB1ddqn
         Mke/pCjoZcoB1Gnu76sNDcjSbxbanyZMbxeQSsSV+koi78NgKwsfnqBGWWS9UUopBvvy
         Jp4g==
X-Forwarded-Encrypted: i=1; AJvYcCVbTM1u3sSMJ3F5LlLDhZAzpUB5b3cHygX/GGi0nT+i4WWrrqAAegbE1ZnUuaECMQ5k0YQFiuOg3wU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyat/c6X6yHE1EQW4jVd9fv5PwzkXnOHTPbso97G2AkayqRJc0u
	VUmFC3VwstJP680Fz7vKzt9elIFlHGtOtxb+iS1cuWluji/JtLG5CMZlqt8MjrGYIZjPupF2qoG
	1/HUIRgaohP1zuj9KoqNCNfdo0uY9siPM7e1zKAK6COAX39Xu5GYWwkc53p5DpJQ=
X-Gm-Gg: ATEYQzw1niSRm7gphHhNCU80jslIe+p/DPPg52VN33Z+Hy7InSQg/nsbDYPMgRRyJRR
	ATcHl+ghQQUa+PPU4NP1TWiFHAGXaY9v4tVpzMw4J7XA/eH2WLigmYyJdaD1I7d/wbl4uXmzDDf
	YFAHwbOWaBIQ746v92HeEo2wfe5XusLkA+apIvUZ/sRGWrEeuFu9/tBjaLlZh+JHIyljfx3LWPr
	O6UW5R7s3pr7rDVJlIU5RSt3ax/KQHMOecOjxVjWFzppVOWnU+HRK6eKHxEs/F8L6ho5i/3eP6R
	3/DBqRHpp7oV2Iz+KBJhC9cvWqqaLRIAy3ZD6XDAB5xtu4/70wlluETE7peq1NogL2Rqo4nrk2M
	VkJmn27vbHlD/+4SoKN+rqNanGyB2K8BAJBS90ny+gPKH6FAA
X-Received: by 2002:a05:6a00:6d4d:b0:81f:9f14:ecc8 with SMTP id d2e1a72fcca58-82a19867210mr9781146b3a.27.1773658601570;
        Mon, 16 Mar 2026 03:56:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:6d4d:b0:81f:9f14:ecc8 with SMTP id d2e1a72fcca58-82a19867210mr9781131b3a.27.1773658601120;
        Mon, 16 Mar 2026 03:56:41 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0738422esm13364201b3a.55.2026.03.16.03.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:56:40 -0700 (PDT)
Message-ID: <db4fe4ee-7135-486b-bc9e-efa0777e7c20@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:25:55 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: videocc-sm8350: use depend on instead of
 select
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313111018.130068-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260313111018.130068-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MiBTYWx0ZWRfX8NLB0V6q/L4I
 mpwI3cYvzmSrNFgGz52ZpkiEJblVT7OslYH1tMrIexNAq9T4Y5W91L9vI4zcHN3WgmzoKiMMHC6
 9oEqSkE7bV6OeqWyR3XgaDSqkvnD1z7SI9adP/417h5ZWpYZqxGVTWUnVnUFaRaEhJ93KBIVaNT
 6JyTFv5bZNmFVc7JbXrnVaxmEmTx4IBU4uZ7dgd+8KZiZLvLF6YQz7BqLjXc5o34ykP2tBgn0UF
 +dVEItcPC/Z/x84ONia2HobRdoeqp6Cz7TVkE2ADnaD89M9Giuncl7+IPTWyjctrqRfultocqrR
 9F54RhTtR7yCKy4AJvX/c9mGE1QMITb3wI71BbxcwtH99AhRTOwMTRy2qlnAYyfNaCPaSitWJ/N
 BLcistG0u1nuyTBEMBWPk6S6ex/5heHHquV7GwA43gzGf3M9Q5V9UWUTM6br/94FVktI4Wrd8aE
 +GpDvDrKcmZPfIOXIjg==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b7e1ea cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=OVT0ipcL2cxU2LnCDtEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 9Yxw7KP0qtlDCRkuA6kNCpWnuYMh3vt-
X-Proofpoint-GUID: 9Yxw7KP0qtlDCRkuA6kNCpWnuYMh3vt-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160082



On 13-03-2026 04:40 pm, Pengyu Luo wrote:
> Both sm8350 and sc8280xp use this, on sc8280xp, this would select
> gcc-sm8350, we don't neet it on sc8280xp. use depend on to fix it.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>   drivers/clk/qcom/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 


Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
