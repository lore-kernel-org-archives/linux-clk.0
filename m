Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B7930ACE8
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458417; cv=none; b=b8B0Jex1eoVuTJunbbbZP2ZvXxWUU2MhSn688W6+m2I356DrWDdYnvA7I48z63nYiX0cDSY1X+8ySvRDmh1LJePavZaar8tL3gbnxjLWEYV+qcDLB8nO+aK2r2T9InRijuM1OVM0Sn/UQK1EQWLeu+evpgCv8zPulxVHBZFuhMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458417; c=relaxed/simple;
	bh=gFS1s6hS/b0QZcLUqi0Ram8tnYb4sh8+UqS46nL6Cio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YJHpwEP+oIcrI0NsPg0yhyebX83T1wARNHNgimOvGWCuXpJCi/oU4Q21QqqgmqQoAaXoBfDC8x8pcFZYwRWL3YGFfa1wkGIZ0ZuPcaArYByIF3GLVv0d4CpZ356OtyCl08CQjVUUQkW9up3Ak19etReeOVvG9B+jj2YfmoMPK1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnJUpLVq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdO9raFB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnJUpLVq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdO9raFB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8VM5h2249858
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 09:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CWo9vHlUzOp6FVSq8Y9oWlmuZxm32YhyqbZ7Lmsw/yQ=; b=hnJUpLVqf4T2ozyu
	xsGlQsMP/llye5416gpAIObGF2oqvpU9VFdyqWaGPBLuJlp2X7Ly0UWntSmMGvuD
	PERLE9QAlOW3LlOX/cu2sf24Pt1xvEnJW3Ij63zwSowJGgx4l9Ipf9A/zYb3ywWc
	pIkfepw5+TaoHRb2ObMvWk0tYdgwqnlORCwkY3MtgoXXNOkoYcZeSg41G8Zvc3Gc
	Bo/gphOz9peAABxTns+DhS+2CFmzccnN/bp0CThfOjqiCPyiXLvPEhh+ni45Kkr/
	XWXaXCAI6qdSGpZy5khSQ5/WluoGs9NJoqUrJv2WYhaoftTAlg8yaFRcMQKTv1AR
	/Bv6Sg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnc5g6tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 09:33:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ede0bd2154so19326001cf.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 01:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763458415; x=1764063215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CWo9vHlUzOp6FVSq8Y9oWlmuZxm32YhyqbZ7Lmsw/yQ=;
        b=NdO9raFBtizoRwZLMkl+Z0Rd8AnGYp3lRp/WhvjzOdknRIE5sz3IoVYA7RhR+/UgVT
         5bfvNA9l5PFFyzrJuAulSSFS10AWGslcQ+D/9cCECHQyaWrR7Maol2fPN+VsBLaMXAtW
         n8j2YYMu/negaAaEb51sRHXOR/PC0dR/jHXpTe4GSqTUbrhrJ6KpaxQbvgW3QvvT4jH1
         QjyiqGRjNo92drlk8uC4Mb9ekIsT6NGRJoSxCc9zrXmjScwyd1OiSuAl0tXKSWHT4lb5
         vkDLcAqixLB/Hce+kRPP9nmrxy7fwBaLhpCl6SZjNCxO/mvGYEAwR59qgcrpp9I0zL9m
         XePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458415; x=1764063215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWo9vHlUzOp6FVSq8Y9oWlmuZxm32YhyqbZ7Lmsw/yQ=;
        b=ZBaAEksqdM4AmlEeURr1VgP3W3pk/TLHGY8WqmjHD2U2+/AFzxlJP6gt12C99O4IYv
         YtdeoZ2eC6CuoRFYaKctXM15cAkO9JOrvbyGsuHBjsbedMtOBIUzMeBztE7pestqIRiJ
         fE//yteVE3vNMih0SiwFr7X26300wtQnLr0sGW+RpQmIJa1uL/8B7IJYDcUZkcge1r7c
         /fvmDkQzzWARg/Rhe192r80qiz5x3PzH2CcjG78ethZWi+PB6LxjxXRfNGAAyrV6Ykz2
         A1OS67QTA0IqJ0tjY/+pYGt8rPMjJNeejFs8tMhMWcMTBFk+RD6Bkaf+8xWnqhwdCV+X
         DUzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeREd7AHna2PqjzX+rvG6o7Dt8wRylsHUnbFDgllz/3yMkQUI/C+4nwP+11kVpWCkmoN4aw0jWGnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWENoFnbW3PUQQoMFx6nG5BrJZiZ3C7dLbGbT7i0k/r5Tv9+PW
	XyUNnYNqGIRWa3jUltLYiq3kMru6wSYCYMvcqCsmK7XXsQbHFnHc28z95ACQqiguWmUdNoXKGXU
	qDZIK5126Le8QAOaMlMoev2iA2PVYNrl756J8qLa4PPVNahAYhCc+L8sKU/4mjbM=
X-Gm-Gg: ASbGncspA9O/1Dcxh29A2QWbYmEW3b7zY89S1sze9XZPvseB7ujucgkxu/RJhBGKsPX
	2WXRsKoJ77aiBFOrwuRu2gBmgYa4q8BSs3djaWkME7siznk2ZFUAsZAw51Fs39EJWce20huc0+w
	4DZz9Ee0NAn7p+RNiMOBH1Dpkt7D2CP7qNK2Ev53iBqIyJFv7/GHGmJixZhh9GzlugoFw9kiWDh
	+384O9r0FkHB4rpU6oyhdShLq4M4j1BVrtstEBuwIhvPunp7dmQty4l/xFQx01tLgySSJ32ZXOY
	cILQlTCFqOWF5wQ/axkaFDbCuqcDoFUNpJKg9I0MCKQ+FvTARV2Fpae1ts4QVXJ5KkUi195YocG
	3Zom41T8/ETQW2zBN1QoCMHRrcExd6CRAoR1HQ2jgVWYw34drDeYMPlUYguvscTwomhY=
X-Received: by 2002:a05:622a:1a11:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ee312afc09mr19266471cf.0.1763458414703;
        Tue, 18 Nov 2025 01:33:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOwrbsk8GAZ++PWNYy2tLwQM16/dC9YMObl5O/MohFmiNDaIq4bly7UyWmnTTwIr0eFYX3qg==
X-Received: by 2002:a05:622a:1a11:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ee312afc09mr19266401cf.0.1763458414216;
        Tue, 18 Nov 2025 01:33:34 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed9d38sm1324875766b.67.2025.11.18.01.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:33:33 -0800 (PST)
Message-ID: <29c7baa1-7aa0-46d8-b9a2-d6c9a2b36557@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:33:31 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-msm8917: Remove ALWAYS_ON flag from
 cpp_gdsc
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Lypak
 <junak.pub@gmail.com>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?=
 <otto.pflueger@abscue.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-0-db33adcff28a@mainlining.org>
 <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-2-db33adcff28a@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-2-db33adcff28a@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5XkP6vuTKIN6P7YBljF_URAbGlrUbDkS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3NSBTYWx0ZWRfX3VW3y0VNQwyw
 EnXKGIcwL46gzaAnlZoSdq2xuLU6SDL1ZNcp1RtljsQ/PU+JTlyMeS5GnNDhd86qJInCIS8DZLE
 /xmCPNOwVIUAVH4fWqzpJJboRAlNzFcp1qvA7gvbvN+Vc6GMah7YuE1zrpqzPj3VdHaFwpDjrrU
 4zrTzDvT7PqQyJaFTBIkMCKGR+ATznrh6BrIH3pgJecaOBoHyXqtdKfM7WhsLX6Y2Y1GviYpQaz
 OmQyrWXTyrmvlu0PzZixxf5BCyGzkAMtUfE/JeHpmgPxzTbn2pHu6a6dRpHornIpZigiPq61GMH
 aAtl4vd1bfKEXgEmNX/W2NaqfSy85M2cn1ePrArJp9t13D36VWz2sB+NT60Qb5yFCrfX+ORfVnu
 b96j0nCAc9IckDvODi0wMU4wTMHTYQ==
X-Authority-Analysis: v=2.4 cv=BYTVE7t2 c=1 sm=1 tr=0 ts=691c3d6f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=bwGweEJhbDxPikGuqYQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=UzISIztuOb4A:10 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: 5XkP6vuTKIN6P7YBljF_URAbGlrUbDkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180075

On 11/17/25 6:58 PM, Barnabás Czémán wrote:
> cpp_gdsc should not be always on, ALWAYS_ON flag was set accidentally.
> 
> Fixes: 33cc27a47d3a ("clk: qcom: Add global clock controller driver for MSM8917")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
