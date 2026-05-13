Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A259A429831
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686165; cv=none; b=TW3cwwURiAnB+NZvtwVRqAo+nuapnanzvJ1DSSHNebG14o/5l/QFdAScPsY9gvaXDn1ZR4vSjqAc+M+t7nUd0ixg/SRHndZA06ceZxlRM/IFyK+9jRtp4NLpiHIvGNyXhR3PtT2sZ9m62M3DkWjkHK3IMXi8ThDL4ppkSj5y63g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686165; c=relaxed/simple;
	bh=/HC0rRJ7UJC1OFGA2sIIA2bvHGwVrJfXIcgr34IAgqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qHJy2rXWx6eI90t71HHhtS2PZiByIrr32XJsB5EDy8wp9RmeAoPTmr3lXE8x4EKMfKpsXfteouNXFex0RvpJYXYhNLb0qTRqpVIiTk0zKJd9nhbnAk3m+g6iKmTsKzOdHi5lFuEefKgaLCW9UhZY8o9v9/wyHzMLsGogTk9e43w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXE7vLj3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6cNbe9m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXE7vLj3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b6cNbe9m"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBXYXW3324683
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Xl7aVA6M2uIYRJqzcUsD+r5wfUt+8gXt1FDzwee7lM=; b=hXE7vLj3yu7n94+G
	2NSWc/Fje9lZq+7gEbw4ryS8rUQZeq1Jnkz6s9BIeQgmQQboDMIpATq4fN7WEAHi
	lDUwhBnUF+LXUiMGZmyWsR7eWTWh6jDUrkLuHqnlx0jtMV4uGw+/RknDesx24Jdt
	VqSsU+X3fWOvt+lJC7fSW96xxijDGr5oj3DkAzJtaf27PByg1ZO5P1pO015LWGqB
	9fOZpCbZDYnT1nSpdMWhQ2J/s+4bdSzfEyGWocGG7D4At3DJBt0QXUiwTgXOGQUH
	wOLDA/GoNbQYa+6cg0SN28f6OkYLLWLXIK85mKr0MzaFGG/WrSNVjrY4GQK4R1cv
	zea15g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvda5ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:29:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba15e384c7so42428285ad.3
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 08:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686163; x=1779290963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Xl7aVA6M2uIYRJqzcUsD+r5wfUt+8gXt1FDzwee7lM=;
        b=b6cNbe9msD0sJxJCWsp18UZSeYQWh5mSIf/ugcLExqRzQVodpFRA+kFSeRdQeADlYG
         Tr8HDkP7j7fPJKGRwHhCE2a42pghdt/gpPIItQP+fKD7lzljwYIVtWfBPaDPsjtfDY9h
         2YBpLWVQkr1hhGJXF22KlPqf4OhudBV2u4VsckVF6t0Q18s9QiezMpTyNKjCYrvYN8a+
         HZvEa5R6noWaJFiZ/3FYNw5i1lYDvkrTz3hxajqeHYxf9sm4SwsKx7aOrCmOOHJzqGFY
         XwDKchajq0zmGgMjjzatb5BdjzktFQsmoW88bWrM6zRNxVus7e5RxDQX1BcPTFWN/2sZ
         56yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686163; x=1779290963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Xl7aVA6M2uIYRJqzcUsD+r5wfUt+8gXt1FDzwee7lM=;
        b=DDrY2hnyodwZdX3K1Ss5PTsPNZaRqy4sL1xzPKP6ataNKNzRsCmUe26MArwn06JPQ5
         WifgbNGsJlVPVW2L+lO+j1l2EF0EHBPu6GfClayAenuYm6+r7wvczV2bOLTht0YxSZcf
         /HcUOroF9xODNeOEvr7b3L3O92UPy/fQju9DpV27oD8z9jtYAdKKwXQz9gXauwwaBIQ8
         H5dOo1StZRTlHadbVs+8FOfJVclUQQdyMwxJX0prhIm5j4xtdrPhpuRxH5y9nHB0I2o3
         y5kvkM4dPJfK15QPW/XLncq40s7JKjXRt5pSBNcmtF98ZQ46Y7t63Ttkxq5fGK1vFIHx
         iLpA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ls32dCEb5R6rItOXw+pkfOtGiVP6hEOfwSKNlpPfYGZO+bSCc7N91yzkvzqhKplqPLXYzRzWAi78=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwo2AD0JE4LEXd7HbG9wNqFRtyTKBlm2MjyhB4yQK5ASNEdDEW
	nv0Ink9K9r0RxzNxiWl5Gj42Jk2pNMncQG6JKutxj2ACCGaW2lkSAfmhpub+WCyaAdOxcAXQIJi
	vS1/o/Zvcgsq0kUXv6NMbeDiLZDOvqRwFWrYNau4GAwSphWZWfRnUhVqb5+5rTKU=
X-Gm-Gg: Acq92OGaWDNBeQbp0Ue8s5/OKXdvYOF80zCKLY/tAqtwLdszyop2/fpmYl+lEYP6Kn/
	iprX/e//9NMBu2SuZq9bRT+s9iRQqMzD287RR+STX8/p8s0v9U2La4Ry5WQ625NtTXeRSs9B5uy
	YlJcOIhvg/xsFy4PseFTFihNQ4Peic/M9rFhDzbsIaZb4hcDzjMU6vhgs9iY1csnuWjIazShJxC
	jSSW4cZErD+/GKd2WBZe/B9a00hFZuLaTNUeY22RDUgmmD/iv5AqbJR9o+Q48cq21x6RNAc/MzW
	u5eTLRgtFa7wI8Ht0KuVwwWx18aXNsVWfsKY3cuN6BTn91tNk3IGM8bxjcKd1nVJpVPphnEzvsL
	hBDvX+obBqj6bCGf7JTWP3R+etn6Za6M2jrsXwLI+agqaV9RAJw==
X-Received: by 2002:a17:902:d2c5:b0:2ba:9e1c:7cbb with SMTP id d9443c01a7336-2bd276e23b7mr45319075ad.34.1778686162698;
        Wed, 13 May 2026 08:29:22 -0700 (PDT)
X-Received: by 2002:a17:902:d2c5:b0:2ba:9e1c:7cbb with SMTP id d9443c01a7336-2bd276e23b7mr45318595ad.34.1778686162197;
        Wed, 13 May 2026 08:29:22 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.25.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35bcfsm168295585ad.38.2026.05.13.08.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 08:29:21 -0700 (PDT)
Message-ID: <dc78ab37-c62f-489d-9497-998ec11080d6@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:59:14 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mQ7MwDhmpepZ_-D2wp5qYylydlwsY1wP
X-Proofpoint-ORIG-GUID: mQ7MwDhmpepZ_-D2wp5qYylydlwsY1wP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfX9MG+nTFIrZln
 gwz4Ob5MyCSKY9C4CkQXkxKZmR1r+5XcSVqAERxlXAGsp3/g04KRBtTodvzgiTWVh9Kj++gJy10
 ciJjVPSatAhZ8xlnz4Souj1e3fGpCSG2aDLO3e/hGHeVtJlurj67mOwsXkf9X3K8hZ0fsQexor9
 0fWlJpfWgWoxop4iPQGBF0BvD6Ukoz+y6MayU5aGUPpGzHFgKxLTBVGbDPwro8iwguj37Q4Px6A
 7QJ9geMJKkdFAhWxYFH9aqAea3N/LBabPJN5fJ1aZ00WipL8Emd6Z4pyybbbv2G1zlCTxt7nj85
 BGA4ChGv3EC+Fg/j4d3ahajkQduU3/gzsiYrCs1p+u62WRJcvNTruqY2W8BhUbaAihZSBbu2IHC
 V57m5p3BiTfaPUbS/9HPSIbgQcy7ojdIBpXLkHHZaqIytkmjIEbJ/3Z3Uhb9TlD2ANL2bR7oYFh
 Hzw8Z4/IX/0oD5mWSQQ==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a0498d3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=QCtv3gAnLEb/jX3y9W1wMg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DeNt0BJpUpdqGQuxoTYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158



On 5/13/2026 7:53 PM, Taniya Das wrote:
> Add driver for Eliza SoC camera, graphics and Video clock controllers.
> The camera clock controller supports the cambist clock controller and
> the regular camera clock controller.
> 
> Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
> and MXC rails dependency. Since CX and MX rails are already ON when APPS
> is active, explicit power-domain voting is not required similar to Milos.
> Hence extended the Milos camcc & videocc documentation bindings for Eliza.
> 
> The patches have been tested on Qualcomm Eliza MTP board.
> 
> Changes in v3:
> - Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
> - Dropped the defconfig patch and included the drivers as m from Kconfig itself.
> - Update the header inclusion in the milos.dtsi.
> - Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

I missed the ordering of clocks in the milos.dtsi. Please help review
with the latest series.

-- 
Thanks,
Taniya Das

