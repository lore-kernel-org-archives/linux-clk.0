Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A98C1DE2D7
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758804381; cv=none; b=lH1L/QkP0ATA1YgHQ1sprvnkEnPvkK3NE7eqZGb8iX1yHCLuJIkGDOyU3BH2oVrId8Am5Qo8oH4abE6Z4DMmPXZ6GZMYA4kGbIxJ35k93MLEQuG+9qib1nOyDkhIWO4fFvPXLImig9fetCy/Zd1XgGHHGNFzGLM98StVDQC7AzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758804381; c=relaxed/simple;
	bh=b7+0FUqc0MYeklzSPwrXmiQ+m53hAJ9Fa27fFR/T4ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9m45nwK/HoeLM3a2+OdMjzjjKPKYDOLRgFHva3fQEpnK7s1yKBuaRUCE2zAGE824URAZysjB6/E/UMwSkig7Z3p5Qo9/GpGObVUVIRNVyDSOKHTa0DqJQYti18F8MuvsJ8Mx/vTbHHGJRc6YE7oZGdCyfI1uCyOgdyeBtpmTeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Shfztjga; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Shfztjga"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P8vR1r028199
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 12:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eBfKcPb+IOlBSzmdNVDaaI4Kshn4SPqfBYjmmQnheSM=; b=ShfztjgaO75BgNn7
	pLyJaT5YjczOEprODBf+Zz6e0usexCvoR0H9cKQyrREGlXfUGh0dn4TO7ywgxrWz
	AjunhbAt8yAiwjGQHhbH3MFe2SdOMgGiIx22evpvPtXw33leinyF6xfEhXLR0hnU
	ZocwlauamUiMIqfeHWJy/p80t754unpPNXPxppmT9xXr6GX9kpGIN00Aou5qQtDk
	o41cb8cnsNBYT5SKyv7jQRDjiA2I/LmDNykiEqXdqkriDfQ9uUHu5XwZW200+DtK
	C28cIbm62A2fwLs4r6l/+nY1NcAees5pDcntdahKmwZsSFwQHzi/1JS/h2cr4L6G
	3fW6zA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmp0fps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 12:46:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4c9764f3bc6so583571cf.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 05:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758804378; x=1759409178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eBfKcPb+IOlBSzmdNVDaaI4Kshn4SPqfBYjmmQnheSM=;
        b=mqJdVeArVlnTdIPzr01/UaQxBzy100n3RHrY9SYYe2FoZZFDdFFegTpL5GarxGub3c
         0pnHdKw82qJAVo58btxahbClqH6dvEXxT4/SsSnREvOvr9eFbYPZD7IyPWs1W7I2z0yM
         Nq/5SvmnRzhxM4+tkwYxyqi7d8ugGkgIZk9fnHMIKRAp0SAyIxW5xpCbo3ysEkYFZdSe
         UuvV7oGMhUwr8XSNYpW6ZUxe5u6GHkFG//bnJmaNE3sfQ4ZCGhAdPQk1+Eq/pf708efN
         7humf1wrXhJupfFOAMoCLF231PdSkkDLkLrBpTk9Kx1/A68m77F5syk11eLo67pBIsEc
         sdaA==
X-Forwarded-Encrypted: i=1; AJvYcCW3ddaOn2UIykTq9lnshO3Pd2Du8l4i0FV6cUw5C3y+53F9Xun7LM+hmgY+uoG6EcjLPvl4uFRi7dM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSqxXDp2H//WaEFf3qHeW7oUVtWRlZrW7sh9gFW0c083BmvrIN
	R6O01lgcXcRXu9S8eVH3SZWhkGbo/f+nf0Ecvn2TbCdIZ8H20VWFi6JeeQ00cPJ61GFh4tnVSxC
	ItW3YQsX8clZykB61uPzmzRAKs4GfwIMN7y7xiWKZjQ7gXeD8KWyo+4q9cYoUKXQ=
X-Gm-Gg: ASbGncuzw1K57pC/ymvga3uDcfn4suTMnHLPDl7gOzTLDHgi/OXT2SV7JRWXXI4xw6c
	hC+YZTCjmXOYHf6xeJeGi7ULWSuic1CxSimpF4g3NkccVmR1iZDI/UwgAnt035OrfRX6QmXD4bX
	zAxQcOqUBnAEKAr7C0XX7cyf4f6apewSuEkzFxf3Ip35hWft8ItTRPfK30iAFxZL68J32q9oZ4D
	QTNrlqr9F+KXS3tQIl28F6jeFKK4d/lhsdkC+nHJb4lalHNJobchdY+bjTjD4KllN+3WAZk30VZ
	wZL3DgdTCHKOBB1alLAShEqEsegEHu0nuPeYhOGdvNyL4VBtRKb+FCTyzj2Cs0wRwwWrbXKpYS+
	0wTlDZ+AXYcv0asbc0UlVDg==
X-Received: by 2002:a05:622a:1905:b0:4d9:5ce:3744 with SMTP id d75a77b69052e-4da4b048343mr30697611cf.9.1758804378049;
        Thu, 25 Sep 2025 05:46:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEd5JvjjG2pBr13XQCrzkjzaC3gf49ULTcdScWZxwe/IXNnSmnRT5xxpfNzh8Shpav4MIBYKQ==
X-Received: by 2002:a05:622a:1905:b0:4d9:5ce:3744 with SMTP id d75a77b69052e-4da4b048343mr30697331cf.9.1758804377616;
        Thu, 25 Sep 2025 05:46:17 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d1210sm163567166b.9.2025.09.25.05.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:46:17 -0700 (PDT)
Message-ID: <623d9895-4087-4419-ba6d-b03c55b0ba50@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:46:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] clk: qcom: clk-alpha-pll: Add support for controlling
 Pongo EKO_T PLL
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
 <20250924-knp-clk-v1-8-29b02b818782@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-clk-v1-8-29b02b818782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d5399b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=J5jK6kj7L5UlLF6NqaMA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: bxDOg92Uj954K9eFyLQO4aE0eVbV8l8v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX5VS7hw+/h9BO
 EjDIf4UWNzhMPCAj0/K2BhDL2ztbTQWsdLmg0bFeIu46J6EFJJCKYMBasanSLcQc0eTkYGql47x
 istfL5GNVPERDMBElTjqbtKtxeLowCcOHQF55i1uAPCuNng8ljGYuLWtP8ryZsPJpxcQpOImZNa
 gczg5gfcZaXPuGcmB/0Dg3ytF0PDjTpc77fzR1o7Cpj4vb1o1jgfFhP8rIr9gP149nSTqkXv3p4
 S1CGyNK8oi0HXKugXXERnD+WPZoJKCxShx1Bt1GOZQRDCNuJ7ssawZfcG46Tyyu/ADUCgrYAK+A
 ASNa5GayLHWSUo7wtBLN48fLX1Eeynir0e8nB7Lyc85r30kyuQMNnQt9gUUVXHfL+ydKFcqGkfM
 PAi+M6Hj
X-Proofpoint-GUID: bxDOg92Uj954K9eFyLQO4aE0eVbV8l8v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On 9/25/25 12:59 AM, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add clock ops for Pongo EKO_T PLL, add the pll ops for supporting
> the PLL.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
