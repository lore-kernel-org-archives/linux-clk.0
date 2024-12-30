Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5E81AA792
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 16:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735574807; cv=none; b=VD+QbuqpiH5DOtyGe9S9fNJN/GcROYEH2R3iUHwcNdUGTV//lVJXdFF0foErBYsQKeZpxawMfo1WTPGX8XXaubeyudjAMjUqEhw0rmZJWBdK2SuyIYNdV73w+cgkNBv+kDLuz5hfwoRXSS1/HflE1bN7jK4Go4UvpXGEVskgh8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735574807; c=relaxed/simple;
	bh=1FqEAIHNzdL2Pt+Yq3U0+Th3OM9VqC8etEFnWVnoaEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKUTR6qtpxOAisZZts23sVKDHFyCEPUzv9J4t9zYFzDrjU4CU7Ljee8+CeaksFMzi5OGRxj1TlTc/6jP2Um+yjFqGhcHLVJDjylgSaC9nkh4e3+wvPCSK87JIMm/6AC2eTsycEHYge5GyNidEFk+lI8GK2k/LCQnGBsHpM9cqNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KK3Sdas/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KK3Sdas/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU9LGAL024765
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 16:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XgElpvo8OcSUFCA7YNzM7duH76GnQ300RgK0OBHRX2M=; b=KK3Sdas/p/VgedFs
	izgm+xQX8xVLlFQOpLJat7slDqLhQqytiPu160QyY1tcd/M2Io6/y42qLASd9TnQ
	MvgJ9lSBLdD/fmnI/0n1A20gjEpM+IG+M3YWiIk+LGJrMFMfvvgjELqEjKorILam
	065V57b2xnpc65bvzFYPRKgpMrv5ZQdBgjzYGRt7oCQlK8fzPlJJqj0lAIZQ20Fd
	FI18Sh97hwLdgmjF+9rU0erz2H+Fy9dXne+uR3+qHAPlCs0/um9VI+zYI6ho2HGw
	zCXYYarNx+OSgzcKDFFN09/K3MNcX31yb3XOEL+2D0pisa81fpA0et7ufvt24FtT
	XEww2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43urt88umu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 16:06:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b70df784cdso46981185a.2
        for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 08:06:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735574803; x=1736179603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XgElpvo8OcSUFCA7YNzM7duH76GnQ300RgK0OBHRX2M=;
        b=J4fvI6Phctk0qhyTafzquaVXIBSxMvge9HBcDpmHr1CNvPApk6oaOZ9ql25RuL7l0U
         v8n2NC7hFWFfRkD2HQH3EPt82tF6lj/q+x76DntbPEGJup5EcfojLI5YcToJYhmLC+kO
         MJCnjR+caVmrLk/AXoZOZ12beOtVPTyVLJxwRyphTj3unQj4MYUo4AZZDaPoUWYZyIMN
         nHpzl/3HS4ffyvugj6wXTsqJEeDSSEGvfVCjUCNstTD/tUWyRm1FhxCUO7hNom454riG
         qCQ6mtgw9JrruT4l2RC/zsHFgK+mt+VGYdI1fJsAmlgds3L3ZrV3DR1f2fb+KvOIQC4I
         sKCA==
X-Forwarded-Encrypted: i=1; AJvYcCWOKZivOWq+0nyyJ+wI5dYioAcKqAAn7zCk7fO8qTpzmKSUFvE0Ifho3VLQNL5P4ts/5uCS/MwQOYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYhgdOPtQ1TEa48YhDzRx3wU7AxM1uEwkcYarzdokqkrnFUTQ5
	J74A4QwyK4aLMqOUl+wfnvVfvOHC4oN3DeCZaVZGE2lv8p6S+pDy5yo5u7ethu6uC82Gk/WRkA0
	jQr/dgY6D5hPdciK7JikoPTbKwg2/se2zAzYQud19/+I6DSKVN+fzbzgAeS0=
X-Gm-Gg: ASbGncs9trd+Zudxa++x2hrMMnsrY4qjRSPo5hfM42dIwsFln7qN/JVZogQ7t4+XgrA
	J3m59z6eq+fXJiZ9qAC90zuHy4AflIsieAdHgMPng9lzTb4Xe1ACrgVL0LDCEEayPC0MUQaUbuG
	VEbMHvGZuwQ1E7iBlW6fNJw/hc9D4SCmUEx63CNLzqE2oWRIfwiH/2z9ZdiHjdRTm9RpjMzznwl
	EuJmSJJqupAWrq+7idWeJw1CBkRlxnXzxDYWliSr9N/4E0GmbZfUffKPO2lAuUmB+brDcX9PH+j
	zV5lmDiKrn4eSDbBlyJdmmEHgZ/5A7Vxl5E=
X-Received: by 2002:a05:620a:191d:b0:7b6:d026:29f with SMTP id af79cd13be357-7b9ba712954mr2330669285a.1.1735574803191;
        Mon, 30 Dec 2024 08:06:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9bycyPmrIZt2cXa/IYa2d3alwG8C6WlLAth6Yoz4ieNDGkAfMo0HQWekj5vkZCqZ1QC9Gqg==
X-Received: by 2002:a05:620a:191d:b0:7b6:d026:29f with SMTP id af79cd13be357-7b9ba712954mr2330666485a.1.1735574802734;
        Mon, 30 Dec 2024 08:06:42 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f858sm1501596766b.21.2024.12.30.08.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 08:06:42 -0800 (PST)
Message-ID: <7465404d-da79-4cb1-a3c6-0e88cf024e0f@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 17:06:40 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: x1e80100: Add CCI definitions
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
 <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-5-06fdd5a7d5bb@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-5-06fdd5a7d5bb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7EP-HQHNPsn38f4lpt4XdTTCqEkgdEdA
X-Proofpoint-ORIG-GUID: 7EP-HQHNPsn38f4lpt4XdTTCqEkgdEdA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=761
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300139

On 27.12.2024 2:11 PM, Bryan O'Donoghue wrote:
> Add in 2 CCI busses. One bus has two CCI bus master pinouts:
> cci_i2c_scl0 = gpio101
> cci_i2c_sda0 = gpio102
> cci_i2c_scl1 = gpio103
> cci_i2c_sda1 = gpio104
> 
> A second bus has a single CCI bus master pinout:
> cci_i2c_scl2 = gpio105
> cci_i2c_sda2 = gpio106
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
