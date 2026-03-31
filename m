Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D7D3D4114
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948434; cv=none; b=t2e18OhMYHBlSrABkAQ5HOACP1pqemBYCD61FoqjD98Nlx0fd3EdraEYTVUbXYMMZi6NQPpQaSClhimo7Q5VEthKlKI4yL07/IbuYlaeygtrwwg/wngQHIm1z171V8lyUgjtoVArv5/jb0qFK7Yki4v58BhJRFX4qWbGac4Xovc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948434; c=relaxed/simple;
	bh=vtbusTWBAZN0+tv+xdLiLYNSGEM44v+6/zZ942lU6fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjGVC2z62OMk4UCW3P9sItzdU9+myjvjDGZeWHcr7HK+tdMeTtSNYedWaNyrY3+br5p8z03hGUSCWRQVh3ir9Xz1h+OMFNVxGD9PdoHd7fJ7u7xB72Fu2FLDb3dMmxApsGkslYq/TWaMGM9ctmAza7Kei7DPdbPsdfzkSthwKvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0O4wId5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZvW6ZgB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0O4wId5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZvW6ZgB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V4mFQo4053489
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czg1fnXViivG4aLWv1gxU3aLJ7wHZddjLbsExCIXOLk=; b=D0O4wId5ofjlFYam
	ZXsBgH6D/rBOxH1EHfFMtztnFCET+OK3XjuQqxtkPHbEH5E4FYmLclekqJemKaL8
	1qRyURoxmXSAXQ+OjS+94DEQpwW5j7gPKlvBz3V/GxhCfvjnnVDgvgwrUJUB93Qf
	VD3qOKoblAUmgq5DBHJhwn4f/tbaWjtT21PaFmZZ+aiaCLTsbBcu0+CChtCn6lnj
	f+oOLeiN6fQYSgVb+iQna7lRoE3h782ypdpFoCyv0K6/6vG1N3KfTFYSpeKH0B2E
	iHCSubDncAqrNVGCiEH0r/2H25T5N1lEhxRw/17kjEit/ZHmvUc9gSzMOpgUSEI1
	PBHAiw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx3ased-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:13:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2523e0299so64356785ad.3
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 02:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948432; x=1775553232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=czg1fnXViivG4aLWv1gxU3aLJ7wHZddjLbsExCIXOLk=;
        b=VZvW6ZgBgj0UT9W3UBxQc0tR9JsrjCTkwqNWs3qJRIzDGIQhx631LwIVf+NcynqLpG
         +YPZOLvVU3TFApqMS9MfOVqQJnyp6UiHofkosjjfNwlffYvzfC8zHnzr74u3zGj1DNsw
         79FAfzhWTrjRrvGo1s3Hf/p9GsHxetcJloEb8Gza6yAD60VaCraYZMcE4iBwzXf8Lx85
         QxltqmZjGhc+W8zFU90iU9Akg9HA0YdNIZFXNXjl9wTcmzeOM+xL8GyyRxthMgph8537
         hb7hYwWzkPv0nQS9u/tlF8jKhWTs//C3OsFyINz8nXLotuz/sqdaCcCf3DR4REb7gTlJ
         mLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948432; x=1775553232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czg1fnXViivG4aLWv1gxU3aLJ7wHZddjLbsExCIXOLk=;
        b=QNXkh1AJyNGGc2OnjS2xLpSUQBSfqWhHxzLNhAvheCmLH96jHvhAkf1Z0KtumXaATJ
         fDeZcZqtDUwxYa/ZhfF10HmcNEYmmamoX4iAI/oGZjB+M3/TVPVeC8LzunOakUxr+UJD
         3iHkhBbuaXRaVDy1X8uU7v0wsc7A3Dx0rngsXfM9e5RZkIuSuQqximuovTmqXVbDL8oZ
         vTuvQ6YFjsYKgq1y1YGsb+93wI+o+lHfd0Fst0cOYYX8QgB9hD+iMGP3FjAOXaZRs/if
         RS4jOtqt3rnFFk9S/ij1nVUn0j9oLtnIqdDIZLXgc1lSZj03/jTIQbyVk5gypfdH7Rbk
         t1/w==
X-Forwarded-Encrypted: i=1; AJvYcCWfSwIamjGZB8DgKGFIjfItT9okcmrEM11nyvTXgrBTHdbnUpckQR6yqAwB0xLuxkp7nfinwiclxVg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7NeVb0GCAMqqNnyQfPdcWi+IlNhBUihn2RAFmexAqZ66KLBOm
	wOS80VFYDRnLJF7P1gaeyv+bwb7TLDZbGsjZE/lqWcG31Jiq/5pSYRmc3P/T3RjRsafqVXJa2UU
	qQ/0vfhuQByXEeXX/saouVWShZaa22s3PDQHmW2jJCZD677UKljzncTvJMGI/Rpc=
X-Gm-Gg: ATEYQzyWP2NTOy1gtQAyyIpvoCggsgWT4GCkb1dUlYhjHCh5E0olYwv0/xK0buJk/qq
	GBfAupUC6TcXbeBfeiPbq+yknWEM0rc7iBjJ+XZY7JWaTkkfCXyctgNHpSA7zygnCLKQmrsf9YY
	QuXRyrjesQStC1jHIMaIoLNd+bKgNr9phW6x/0SdAEMjQb8d+EiySvOZn+wYVAFOsWr73CDK+fP
	HHMf4T3a4FQ9c7Nm7SnD3Ornjlnf4lH7xc1ftvhdbApEsXFjROY3GuReVZ+98/AASKQw1SjHdaB
	TTkQfjH4n8THf9kZcFw2iANbESXxdPVQB5964Mz8XSIxQoeOYVr3IR5NQjpj3jtAVT9aFg2IK0l
	HCBPqqbpnidRyq1quFNXqijxmU3HuU3cGwHcRfxxb8UCmCWbZ+w==
X-Received: by 2002:a17:902:f542:b0:2b2:42da:25cd with SMTP id d9443c01a7336-2b242da32fcmr121443795ad.45.1774948431849;
        Tue, 31 Mar 2026 02:13:51 -0700 (PDT)
X-Received: by 2002:a17:902:f542:b0:2b2:42da:25cd with SMTP id d9443c01a7336-2b242da32fcmr121443495ad.45.1774948431330;
        Tue, 31 Mar 2026 02:13:51 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242765b9fsm126761135ad.43.2026.03.31.02.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:13:51 -0700 (PDT)
Message-ID: <81c503bc-0279-44be-9e79-a9c313aa884c@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:43:45 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] clk: qcom: Add Hawi TCSR clock controller driver
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-5-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-5-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cb9050 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ofuwNcfXRJEBrn_tyCkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: leFiB68ISzzV6rJ8-imVnnlY-hflSVCn
X-Proofpoint-GUID: leFiB68ISzzV6rJ8-imVnnlY-hflSVCn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfX4C8cIm3y0Hqo
 fX1dS5OvXDe+mUd3r5pYW5V8AbV4u5y70LYzDT9d345KMKObdHPjPlsfrlA1v71V7dk4L3v5AxH
 P5Cm3Wu0Z4A4d7/W6/RUG/KbeX472LqKsRL0ea3sVoUX2UqdsAQspEi7/m78j9F3cPNAPGHNJSI
 XsCas6+LZn2E1NBltcNDLp/heJHKngVQFWk1bXFgQUfCGNLfjrBFEZ1oVZNE7J2UETSWr2V2ooq
 w1mkBq0SMMSI6zRO4kXH4Stz2xK95w4d05eaAtxpIku+NBP/lVLK+rbBRwcTetDSazPdrUQJQEY
 MziEM4JgezqU/g0Rcd2zfpVjxG2WdRecmWKBRMkXY5qKQOR8byuUNwWOCeSkiFBAXSGC6aeYLrM
 Z/0EEbU3jCmM5laY/cCQ/ravQNgCb6LDfadMcC8H6sSWqrvUE+eD++NTlLhVEhpizSq2O+Lt9Q0
 XBbJNcl4GBHLD3R+m6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310086



On 3/31/2026 6:05 AM, Vivek Aknurwar wrote:
> Add support for the TCSR clock controller found on Hawi SoCs.
> This controller provides reference clocks for various peripherals
> including PCIe, UFS, and USB.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig       |   7 ++
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/tcsrcc-hawi.c | 158 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 166 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

