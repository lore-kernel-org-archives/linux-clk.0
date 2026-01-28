Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D06F2DAFC2
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595254; cv=none; b=tiT6xkb1mGJxRZUHwN4srrNeDlNOySdf2egOZ7Aik7A+KuNEx0JgLjPTId5uutrmt/KU4iPlyhn5Xef4dwCIA0PbihRMRqfSyKSdKiKwk8CWUFCJyv/dndgKyZQdtHRmFsHL0vPUE6ETcDHYHIUxvP0ZmJNs4PrM0xGGj0TV7zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595254; c=relaxed/simple;
	bh=buEGFL82JO8fTIAO2ycUIVJ8WjqCK/j0dMVra+EV6PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWkHYvmJT7tKL+yQyzj2SfcTChV1+hkN5J36gRe9QG4r8v4eefK30EnZd9JoS3T0FjnCBC1wAVlGztdSenNCSP1zPegyaoFy62sxAiW4pmdfLDLc8PlLktonpf+Zdkpc3djrTRLYGDQAWyKhN2uWIUupV40z/vzs9LPTeUZEEm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAV5WuW3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d4/HxNXI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAV5WuW3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d4/HxNXI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S938n03247337
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B4T0/R/Sy8rbm8kzN/wI0qTxGCJL+5QCvhkl6NSkXMY=; b=aAV5WuW32jWevEVv
	07mo6a+oZT7dKZG3JmooinYySfnG1G09YkQER7C7Djh+Epg6EgJ0rkr/3E/GgU6p
	/EIpB9yFnHvw5YR3zL1lTHzMtQ2L0MdUmLlIJdcEzUGwhecbaWpYr5F3FOAY9mMW
	A6AZtCbE26WDs3jUFxxPNjJK3nsgYSUyZh/SWOx6QN6WXdx8qIFEIzlpm9T7eb4/
	NKVA0Di8dwgVbJ+SgEHYMTXMR27YTaJsV6PTMbMdp8tYv8ybap3OQ1DejyKrWCBX
	vavRSteTxgHMEGhEvVGGy7rxdKuHsMMLnB+oWqmIlm202w53zs8WOrhcLbF1SGQL
	dOnaDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bydfk0pyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:14:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c533f07450so183810485a.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 02:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769595249; x=1770200049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B4T0/R/Sy8rbm8kzN/wI0qTxGCJL+5QCvhkl6NSkXMY=;
        b=d4/HxNXIVGokp7mc777q6GZN02q0uX2QipUJ5d+HwDTG6kcPxQWWbpfMwsrMcEJskL
         Lt9BOxcnElYR4CLBdkYq8jTBUnE/fpV7GtFQhFfbYVC5EDyfOpiTLb3TWlCK3HnEeUpQ
         7EhPpRVb0slZO+iqXZCi6vtu1Lew6wlF0VvCABD+VMp1gaRbbGXPE8jJU3KswgQz9fyv
         FQFXZaQsvY+tzHgA3hWFZnN2NhxZ4rXfEqL9mxtV9X1VQIHcI+KD+h7/FQCmK3lSwlQI
         AbukJn1IX97RjjVvD7Rrrxm1SZ5qUZNp4+uw6OOnsaI3FbQkT6OegOODrWdewjumb9j+
         tRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769595249; x=1770200049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4T0/R/Sy8rbm8kzN/wI0qTxGCJL+5QCvhkl6NSkXMY=;
        b=b3RAvYVWHb28Xpb+5sZy493ao7CbeFYoAjVRq9+ID9dOT6D7DBA7VqCMnApmtuPxhZ
         YFFJPdY5QO9Ewh/Lt1Sqe61pgz3+QXlMNzNNdk9Di3OpsemrqTBut5MeYfWjSl5HQqRs
         1zI31JEHXbdm74o1jInXNz0oetvcfrQVHQxzbdgQtAJfzvXxEmPSVHOk4RtLlkRvN5t0
         1DhsD8B2U/HObjJC6i5aXOrveadNcrkxxVKpuKUDZtCVgq0KcdJUx7WQMFkC9MjM8nuH
         bkc8VpmNPh4ADrnLwsWa+DmIwUYcPmjqe17Mk5cblxVM5MyRY9b/5nGYSzEbd6O646x2
         2Ddw==
X-Forwarded-Encrypted: i=1; AJvYcCXyTyZgARZMd9SrdvlfUYUFJEYbCYwCWfuVLnjneDIhMJm10IiQDeR3COh/HUg46Otv1IThERcySa0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXJiMbDFoBRC/DVNQNVOUmpxc0wv9qB4PEajJSbZaUCeON8FHW
	WeYjlFOJucsY3CNynk4cbXmvfp84uSbcjgpJIm6DC+p5RHJwcc2+YWLpSRwc8f0Pyy/1qsnm3X5
	QsI5qWlkro6zMg1+Oodc7nLP0CmJCx+/9KD6mNgQCohs4cCtPKbHPFZw7yUA1NEE=
X-Gm-Gg: AZuq6aKPPJ/CEZPbhIMNPqJTJDXuQ4Re5KO2dQXCHi8R2gtp8Q8eimbv6ttwNH7pH9i
	pLcFnnP5dOJHmsBiImeedyX6MEQm4IkMIIS3S8WEHSIdb2EGYZX228qmZ/9/EVaEC450V0XZyvI
	Suf7FZxuzLX6bBweNcd8ovoklluA9XxAoR1gMcnAQ1apPUWjiDvx4VutaeVoJnhMTkVfMryZGeT
	1QV1d+UwVnxhahb1rC1qAQdriuj8HZKkwtfFpyLBftgbrRkklgMtIYvOJBm7clcNc5We3HC1lHP
	+FkuKEBBBEFGB76Q9xUS8KKeAcFDWpKecZL8GrMQ69M0ttBcosuQWcNntjdvU5++EY5oxO4Fp8R
	uZc7ISFGn9iby7X9E7JHHW2DMQxVP89ly0qz24Qi3D6GlfYhwu2f+xLaBDN/Hr+w+Mho=
X-Received: by 2002:a05:6214:4789:b0:890:7084:c6b4 with SMTP id 6a1803df08f44-894d78404a4mr9913816d6.3.1769595249309;
        Wed, 28 Jan 2026 02:14:09 -0800 (PST)
X-Received: by 2002:a05:6214:4789:b0:890:7084:c6b4 with SMTP id 6a1803df08f44-894d78404a4mr9913526d6.3.1769595248865;
        Wed, 28 Jan 2026 02:14:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46ae22fsm1341731a12.35.2026.01.28.02.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:14:07 -0800 (PST)
Message-ID: <0dfafbc7-5623-4851-b1ee-112c4a97f7b2@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:14:04 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] clk: qcom: camcc-x1e80100: Add support for camera
 QDSS debug clocks
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-4-b23de57df5ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-4-b23de57df5ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4MyBTYWx0ZWRfX/dQqgP3SwXDG
 RDdCcw66c9IWEDyD4bP4ukY7oI/yzeAkMWxX1sXC/vD+Zde8Fs/s/lxa4OqQI7e1UXSvuZ52Pbb
 AylyP1a69zawQdk9WmL29sxwGtOpuxFwY0N2WwWFhrzKoW4Bmd4SeKeF72UZgMqD+e3fDcKeb+z
 g96Ns6Et/c91nVmdhwjvYpcD+q1q7YMBE/8+TLYY1rq7XsBf3xev2MfYgkU4se2EEhz2pOn3Eq2
 E6S7C1/+mPib8osSOfqw3u2aQPidoQx1FyhBNgv72wg3avR/0O7hjA+4WLOeeSCWWXRpSuYmtKa
 yM14DZRhMzd8uaBiD4HgRI8GONgcdS/0wzNnNseuamiVLuDZrhSBf1JJ05JBoEFcWWk0x0/y3r3
 bwfYznRzrI7aVso2MNKSkPm22wPSOmV5OeVANPHeV7lL1ch6nu41igk6GY3bYPhFvexSWNPX/gZ
 432e7Q6GyhI/3XJ9uQg==
X-Authority-Analysis: v=2.4 cv=XfWEDY55 c=1 sm=1 tr=0 ts=6979e171 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LG3DDfy-6M914-NHDhAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: -K7swnRC52K-b_1yZ2xXJtVDdHYzY4vJ
X-Proofpoint-ORIG-GUID: -K7swnRC52K-b_1yZ2xXJtVDdHYzY4vJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280083

On 1/27/26 8:26 PM, Jagadeesh Kona wrote:
> Add support for camera QDSS debug clocks on X1E80100 platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Fixes: 76126a5129b5 ("clk: qcom: Add camcc clock driver for x1e80100")

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
