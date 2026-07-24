Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BDB423780
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888467; cv=none; b=jBP+Jys/zAAWl5udc6j/4bwSR062pJdwkkeuUdNo4mBN3FW9hy6xAhVSvjfw7QXlUcvncpQCfu1B0IT58IzxQAV8jF5/bzYV+8uJ5wwXAUr0kB8QuLz/LHWzpoWwQuEKJGfRuc/ypb8dQ2fofFj2pGIBPNce8zno7RBsxULNRHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888467; c=relaxed/simple;
	bh=WjLZXi1FX0UcNEp42eU6MECBboq+YbKJiJcKN/N+t18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVkR5NZOJwlYL0pnlF2wiz/pPkq0jYX8fHxANE9ImADSr+W3HscJhApsF6dxFJ+k0dKSyvWxJqh7Bqp+/8MvYcvrFkuTusF2+Yz9TMEIzOS7XVUbw39tZA53OKOHuISD6kfCYm23vZUlk5Zll0z3ZUR5n9lRZsLVi+5gHHm4jEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZicqD6Vk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CgygtYf+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZicqD6Vk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CgygtYf+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADZRC2875747
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	to02Qk7qolpxRS+ATYje2c5XrkHZ6G9GaW9aYIJaIjw=; b=ZicqD6VkrlnKEbY6
	qK/zPf+7qT8u3/x3NZMx2F+5e9kq1ldAXFh6/iMctdbgUcLvHKqx8VXM5/b5/YRh
	HyMjm6rAZmiQM9MJSLHhFmu76+xOWY64w0YGtpLeco7SZFtaNosXvxDGXLfDMD7h
	MwN7IX+9q773EYD1g6D1AsJ2x9ZS3GNYPaB0AoCGHeFQ86uox7WiVRGL81T3kwjh
	sx6b1Tlgy5RpbNqrpjKZGdWfRJpVT8o+OU3Yid3q6qA5XpuyrEEbX3txua79uUCf
	GbkCoTIGLfDBB0pUkErxdfpZYynu455Eam9Z6Adbl6oGOdyPrdIFKocxcMK8plig
	vijQMg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5byr79k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:21:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacf17c7e0so4306695ad.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 03:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784888464; x=1785493264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=to02Qk7qolpxRS+ATYje2c5XrkHZ6G9GaW9aYIJaIjw=;
        b=CgygtYf+1U6fESlKYVS55XMVkYj4eCwfiPzuZ5qQuTxrBTgggRwhMXF7MsBu9gyE2p
         9ajt+XuYrEef/HU3iEzM2Uoidbwxh937IdD1zqXXlYxCpHX4ZW8737W+oxyY4quaDpT7
         q3xzrdW844+vBuGi4Af2+KmiXEyx6QqbqufKRUlpNwoowweXhS12kUrwYIjN4gVReTak
         olHb6CHX4OFyk+UDPlD3LxwPdBAboqObWZ5lx4aZDNQBU/F+EAIpWuYvpMWJNtvLGdW5
         fuYED9oQruknzza+6BZ5EW+JYErl/oaSgp3RKNN1rRAvfi8CpHzrRMb8yknBpRgUkQZl
         Jz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888464; x=1785493264;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=to02Qk7qolpxRS+ATYje2c5XrkHZ6G9GaW9aYIJaIjw=;
        b=p5O3FSSWFrAS9L/ZpoAhAcEFSOgD3KmrFh7lJmegNG/+BWK/kkeS1JmLIesqCAPjuY
         Er115S6oAQbj1j/0ZJWK4KYzNCNbVP1AcVakxlaNXsxe6x6d8Jmx0yTjf4Nf7S3J/Aui
         qSDnXnF+cF3FA1hVzDROhX8jM4Yj6Hx55Z+vCa6USpBVegF5GkyJbEnHe8Xkuq1CKWto
         5/98sejxK4JJLw6OcoB9QWrK/o6qtLDZkOS/KSGF+zuKG49t2Va+QSQJaNvcLdSIfEOq
         bPFekVChnPd3w4XnqXJ1zfwppx+lr2NCBGqVlvPoU45x7tzaLokf2HJ/kPWofNbhazuF
         byww==
X-Forwarded-Encrypted: i=1; AHgh+Rpeew7rtmEmv97hooOoMGAuj1CUO1x6NuDfSmaf+N/T+bg2uqRLVoi772a7e05ZdOnzjRswwWYz2s0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkgwOjUPHbjQvnEIj4KuHJMt1djNIEtdNnMdqn4mvp9eE8dL/L
	8d80kkcaL+rjROQOB4XjCeYi7V0swIWvjbr20lO6mveByresrMDctayhjlDtkJg2WalUadiwgFU
	PWXEXgxf/HbkaFKy8/QKGNl5eRHjltzCb8u12DZowRJsfmT7VukCF4m7Fy2Vz69rOyCnCjug=
X-Gm-Gg: AR+sD12IJFlRUsG6OHewHJmJi767D6x5wPVAQEyJVtQrE09/MnufeyIvXobyalMV48t
	uGLS1THu6Vp5Ta3WF7e3LX7hz5C/km2suAYXIK4aBJa3PnoKYjuEFhV+kl47LBs1GEQ4gkE/vCb
	rrRWlt1W3lFPr2CYH2alCB0pRpLtw7gosPFR2gUOR86TOcIqXwFp9p6O9BzM3O1iZ+9JRWiNSIb
	URxQCUee4MDTIvh/Wv85/vqDQzm6sABqlOWsIpr/F6JxFnSRE71m9BPEXvxYo2eyvJ/bUD23su2
	LEOVZC8sFi+122TXMBKAvx73F+Chp+81BkPvsDjKCVwABldwZoIYssnfZvrWzrdvQNzkwXIEcQj
	vibpiXg4Jqte+9tZCj18P0tIp6a6v
X-Received: by 2002:a17:903:907:b0:2c9:fa31:850c with SMTP id d9443c01a7336-2cfa6c7985fmr77481825ad.39.1784888464380;
        Fri, 24 Jul 2026 03:21:04 -0700 (PDT)
X-Received: by 2002:a17:903:907:b0:2c9:fa31:850c with SMTP id d9443c01a7336-2cfa6c7985fmr77481455ad.39.1784888463875;
        Fri, 24 Jul 2026 03:21:03 -0700 (PDT)
Received: from [10.217.217.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf9c8b7a7esm38913135ad.3.2026.07.24.03.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:21:03 -0700 (PDT)
Message-ID: <9ae581b3-52c4-483b-ab54-90f6d0521ba1@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:50:57 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] dt-bindings: clock: qcom: Document Nord GPU clock
 controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-5-17e5a445a512@oss.qualcomm.com>
 <20260723-enlightened-wooden-partridge-c938c3@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260723-enlightened-wooden-partridge-c938c3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F-HqlqKcvqEf7yTqQuRdrrt7oVHURp11
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX1aekKjJpobQa
 u78QmSevexthi3XezouNS6OlfdObWPVJX1EFdJ18kpzpjaZR26hk17cK5Ig2GIs8vfzi++vZgaU
 5gFPYV35iWkzB3xqVplx892GkcaD8lE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX5Df/kf5YblNK
 q7k3p1qQF99DLgUKYgLCgtvOIaljAauftS5YOVIsAsIY2Goe6/6YpIRW1hFEzR+BsOgOgSp2wr7
 Qf7aHK4w44LsHI51OaYU9R7Xeo4hbRNaD5/FG7MyDhiYMrHdZP1LKMc0ZmMSdWBxZsjoofbzFEI
 Mea1exXmuxmClhFqhQY0b4FcJX2KcuWHJ8HvHsnsF++9Ol8DlrPEuL3OxpFHkkRgDpKd3aHLzDP
 vWy6sEq0VYOs1OmYgFSE3joJJ2PowR/FLZMZ0k71Q/NfmcMTrvprACCV3hl33xaz/ei7qnedYNl
 ZbnZA9avy0AfbpeW5Sfh3eJobGWNbYhoQMlGHR6HqNb7QhKVFR6xJ3bzg74qEDFZylTCgFbuBmD
 TFJMYI5b3e7Y4RdVBoplZLvGuNdvsYW8t3huFrJwREFdHehtabS4CC0uaLqkK166NC+n/iK7lF7
 BLU/oqXDffSDWF6eHvw==
X-Proofpoint-GUID: F-HqlqKcvqEf7yTqQuRdrrt7oVHURp11
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a633c91 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c2WS_Og9x-8VFuS5iNoA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240093



On 7/23/2026 1:25 PM, Krzysztof Kozlowski wrote:
> Mention here second header as well.
> 
> With this:

Oh, sorry, I missed that. Will fix that.

-- 
Thanks,
Taniya Das

