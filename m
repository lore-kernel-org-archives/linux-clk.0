Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE47479863
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784807966; cv=none; b=BPcIXNQDbfKbkKPiS8jpHO4nZc4rYlh7fwsEsngr/16HC6WNVb0Hfy0pyhW8eAKgihphJqf9gB2kDZPZdxIvTrAM4/t+TodBX0O69AAOmqqXYRj0coCilaw+9pSmU3ezV6+von5jy6U5C0jOC1yKWhIb538bmF8TuMGg4Cyynxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784807966; c=relaxed/simple;
	bh=3gJPSuw6oM9oPQIFwhRhyxCkwDU9gyPzcFA5x00a/R4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fecvw9Nr1rv1vjZhdMmpDWPENrMWWKF4+uHHe/VKMDXZ+/TycBYEehmx9JaEWHWWbrh7QIYiqtfIZniuwOQy0eiDFLkUM7nXIcKDprp2iGn1NRpqN3/c3BgnXJA6SxGcFpMfee/TLXcyq0K1w8oS2drifU7Um2t5emBaJgc9gsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVpfVMmm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DYG16j5h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVpfVMmm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DYG16j5h"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qicD3387988
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 11:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eMMYVZ1IXrKPNAdTTbF5kFfOPzwty3ytq98RGOAUxms=; b=dVpfVMmmYR6dtJgV
	Ke4evHMQsIYsuxiCMaHFCTSErtNpjY64mvdRqiyJcwuSMNyLRLvJbj1LNbJ8pO4t
	fqaJnGeP9Ow6FRI5WqqNiZZKgBbEbb0PmjtPpaw8DnK2KxYWqmwPUY5EoOGS5IKy
	Gzfebe3tNyCtdIAvFVvrUIEwK9Sm6YyXW20eAoRqOUabuDYexniietkmzw9h1YoN
	2d7AB3/MjKGcOwfk4GrVXdPFCI2ql+jUXUp93A2MqzE7svdz0fHMgIlIBgBWo0ex
	aEUkfRuA5ldWdpMYr04ybj42Y57/JdzbtjzQtbA5BB3bvG2e/p0yCxyQCNS35Xwp
	LlLsFQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275kxwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 11:59:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9e97b626so1989671cf.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 04:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784807961; x=1785412761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMMYVZ1IXrKPNAdTTbF5kFfOPzwty3ytq98RGOAUxms=;
        b=DYG16j5hvi69F2x6hHtOzwU3esCSDD2CKhJekRUgp4bmVmdwrFH67GJ1BqGfYsuBWZ
         rEaMgM2X+CNtqEPGaVcBhO+woOZo6QqzxQpMvecrb9WfLSbK5hQbOqhl/qFuysFMBeKX
         Q2EOx3qWuKmtda+anSPrU5bafow/gW7FPVSWT/GYn5Ujqzspao0bA3Q/1Ou5owU6JPSS
         FV/mRHnkquSBjuI2k1Gf3nBQEBgMiFMtKpjguryrQlTc0VPvOIIwoNNyf3b4k8+ZnWvL
         pDpzrT9ktc0o5VKvXWWhKgGFJyREylBT0xwqRicb6L7w7khjziC90Q/gQn5LvL8XnS7z
         K/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784807961; x=1785412761;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMMYVZ1IXrKPNAdTTbF5kFfOPzwty3ytq98RGOAUxms=;
        b=H2kvoHBgSuIoraMBjL5V2gLtE0gcQqmXAkHiF/zXVdEB2x2UnEeWaNM/w8jvlseuvS
         8vEeLOlecvdSs+bb7WSCJsgMWuY8jUwS5VTXKsK44YkaJEmDk+PxC51NDh0DJpJ+F6pp
         sxCZYTDDdJsUzMIJ3hNMfTLEqxG4fED+DJoAcW5D2ELsGrsAnGCFypr41riv/7fOL4VA
         pzOi9Mq4rcNTALyLXj7NIT1H9yP1I86B6x0ndDMkLqj8leVXvBXy60PGAEhHL8Y+Fw0e
         1dnwDcCrk5vsZhXCs+YsxpcbO2AhfmjIYHr//g2VZ63kjhUqcaPj+bqCaWiaXWNvjULW
         zZRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLIKui5SYC7G5rUAo+r4YfXfSYezwwI886DUkU/FhcxUjEFpekyHrqbMejTvYx0mmEXKuFLLVbQT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvcE3fQO2GAFs4priuV0NnWLWcK0k6xBsu0wQKCuR8T44zWjp2
	WcTOzgRZmUC+sYBi4UAL81VFz/Gl7rX+FbJvVpCY/BW7jNuLsSJNlltIlFYeTLpTAfKG16fkPgn
	yohPuUSA7wvvvDqoHI1MelcEfv/xH1rf1aeZOmvbypwNqb3TZPZXHhq/0rSWXjGg=
X-Gm-Gg: AR+sD13iJ85z0H9zEmgQr6J/x2KEtsGIXC03IkSYU7xE7T0yxMAEhTWUzmnvEKVQVSH
	kKngHG/iXWZ6+r+qSLd+7S0SRJnBv6SX40J7nYRqrEI5qMba5CZn10YknykExEj65JqTsiiFwbX
	Wm4OrMwKjF0Kqz6p+vJwHJ2ZgvstnRgUD+SXjV/vOanIClC1Fw6/KRO2gxFHC3nUvttseDvIemx
	8nlOi0kweEYVpIMXpKKW4Nxab5zfrnP/Eg9tCayh97vfcpv9AKy4EakcJr3LGWWHBN+w0z/7If3
	F/eMryuFl42lIMZ8GU2WjYuFno6JobD4cY88ypsKb6VxF5It7qIPj7AN6wsVXr+auG5coSkkBSh
	GVnfY2ozg6tbL3hfFQutEZHvW
X-Received: by 2002:a05:622a:1911:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-52847442628mr1498121cf.11.1784807961549;
        Thu, 23 Jul 2026 04:59:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1911:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-52847442628mr1497861cf.11.1784807960972;
        Thu, 23 Jul 2026 04:59:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f151fbsm221176266b.56.2026.07.23.04.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:59:19 -0700 (PDT)
Message-ID: <97950bd5-3eb7-414f-9eeb-1b19427b5ae8@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:59:16 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: smd-rpm: add MSM8920 support
To: Aneesh Pradhan <aneeshpradhan2004@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Catherine Frederick <serenity@floorchan.org>,
        Aneesh Pradhan <aneeshpradhan@acm.org>
References: <20260723012415.48288-1-aneeshpradhan@acm.org>
 <20260723012415.48288-3-aneeshpradhan@acm.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723012415.48288-3-aneeshpradhan@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a62021a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=DhTvykhhAAAA:8 a=N54-gffFAAAA:8 a=EUspDBNiAAAA:8 a=SV-ve9HlrmyFCwFSF2kA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=kacYvNCVWA4VmyqE58fU:22
 a=bLiRU7DCRrRo9wiowOr6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExOCBTYWx0ZWRfX75PolKT2BSZD
 27IocnKoqHE2TVPd8FdGyduQB/pFSZzJyJsA8v1pTdQg8y8CJdBGc6VWxWZzGHe1GgdcrQrLJos
 +NLhkPg0neGAyUiP1noLcZXTJDmQD+I=
X-Proofpoint-GUID: ANhkUHan40nxv5SWOBhK68a8EDn_zmSu
X-Proofpoint-ORIG-GUID: ANhkUHan40nxv5SWOBhK68a8EDn_zmSu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExOCBTYWx0ZWRfX3jnNiUsPSQy0
 EYlKnWSZbK8bKkLU3WlzH7kbSKJvUAy/tqjUu29Py1pbEejJkk770yxVm843p8P9N0MF6OnH0ib
 Bgd9yWCttdAkpWVzii/5gfYgWalgiNCFNthqqKQi+lvv+sd84k4o7UB7Hrbyld2VhVJbGqJ7CqB
 /SfdXSDzA3sE/USEUH9uL5iiDyUqYEZZw3/95BRfU+kVWxC1HXkw8rzCYGRbFjX5ezDgchSVZ2r
 8xs+9yOnpoUIFUVVxKyz4eCyeG7er8kIgmUdk+UE/+DysxRL/R7hzT7RVf1bBG64fXkAjqqSfG0
 N+0kCQyxxZW6tGIMsm8zDnxovGllXmolosJxsH2f+g0a8yaS5MRz+bYTAguFPFou/KuDTLHxakR
 2dEV92DWVA52HZrCsG4WexYDrcE/AVxYfbzWlCbe263ZOmuuNvLV8k/kC4xKXEtba/cxRXFyiSP
 EBwW4LEgJRoe+Q35xJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230118

On 7/23/26 3:24 AM, Aneesh Pradhan wrote:
> From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>
> 
> MSM8920 is essentially MSM8917 with MSM8953's modem stack, which adds an
> IPA (IP Accelerator) block. Add an msm8920 RPM clock table mirroring
> msm8917's plus the IPA and IPA_A clocks, and register the
> "qcom,rpmcc-msm8920" compatible.
> 
> Split out from the combined MSM8920 change so the shared clk-smd-rpm
> driver can be reviewed and land via linux-arm-msm independently of the
> device tree, as requested in review.
> 
> Signed-off-by: Catherine Frederick (coolguy) <serenity@floorchan.org>
> [aneesh: split rpmcc out of the SoC dtsi commit for upstream-first review]
> Signed-off-by: Aneesh Pradhan <aneeshpradhan@acm.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
