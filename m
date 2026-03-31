Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42F53CBE65
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944077; cv=none; b=fUe6bUWWWwzoJmMDxlFSyOdH/I8KO9XPUkZleIwzutTbm+M5X7FUljGXneilTpjdGQFrr8lJb+HIVx5SAuUTCwRPaom5xSMa1TA+lDPEnBxs+yCBqRiw9p8CGAAgzjJNrwKXNuihj1ii2cv8oGafELr6QoADB4QK4unqGC2flHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944077; c=relaxed/simple;
	bh=71D5q3LnwShAxYqxMaE+yJpCvwEkx0ggRNjfGlVCQ3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K37lD4JqcDrE6BLfp20/nCiqXhqEhAdQYBmbJuvJJ4k1XgV1PViWwjQ2RowrPKBE4155MVxUoMfVzkVQbXYuHTmq1NCuCGUi7RSSNhGTgFEIoeaP/84J1Rz8zU2Wm+9tpSdXBtlPRDZvXlAzdHz1XyxLmI40DSSpAy+acQ+ucJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aqi57tLs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6WfrqZu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aqi57tLs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6WfrqZu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7OTZu2465187
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 08:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cUFyAnWnalzdlcqrIiIlSnYf2f8KbjaujscQYXFddmA=; b=Aqi57tLsTxJbstn+
	64s9RVVObvhQo/WuaXBah/DS12xXh1tfRsibD9veQW0xzpAOPA2dH8tsNddW4RKE
	W0LytxdiWL4EsGocln6OvuDmyib70L6kDtYwEnY2gu4RbtsD5cnLiDrerM8qEwnp
	iKs/q751XRw0ejfvACCHhQLQRabxdnvqZ9Fz0gw753DJp5tlV5sHpIpfIai+ioaS
	zKmQEA1itRpIEK+GughVmlxENZ+XmVGlTmdauf0hbMi+w01afJK8ggXvR+HMA3H5
	T4Vr/nyXfs1dLpf9LW5EdAe+y6iKqy8+FxMn5LB4ioGLDlkpYzSkaqdVGODQGSjT
	rqUMZg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ut84v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 08:01:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b32feb719so11321831cf.2
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 01:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774944073; x=1775548873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cUFyAnWnalzdlcqrIiIlSnYf2f8KbjaujscQYXFddmA=;
        b=I6WfrqZuSmWatRpWx4EpPTXRaZ/3LX+x7GOK+tT+4Y5G3/TrOqxwZtSJqVu+ZqR3LW
         Q3BmhC3cfJq6SImRUScUXsOK9nuVZJkpHrsVd2PJTycjVWrc7QJbA9FcTGWFeG2BFVGV
         FF7v4QSEpTOi/Im5OQz+V/Nj0BtVbOuXfpNaTegzawtoczf4xQlWivOyYJNVmQPI2auP
         PctjIIR0Eeqfn9KitJN/2XumjlhUCND7hVHyfU+Ub5/WB3saUrx0STViYwrGYETGxjmo
         ha91dU9UrhpQ/fY5SpvxfCPMmdNw+xus97ptHAifs+GTNXLqLiBmMB8z+0TgWCHxelAI
         F/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774944073; x=1775548873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUFyAnWnalzdlcqrIiIlSnYf2f8KbjaujscQYXFddmA=;
        b=GQSHJ5mC40ePGda3CqtVV7ZFd2avXiVkiQKI/0CEIIuvkekSP2O6TAGTebbmriUt7n
         ogPkzJCajvSKqz8w3768izDDRVz7pUiO8C8iSuT0/Ff8RXx4laG4GShyERP3RlMzUD2V
         vLh+jtqLHU91pMFNP1JYQte5hoedaSNBdMWdXARFr8ZiEgJScwPX4pNcIvAsXT6a4qUB
         oT2mND35wjjxL4bn8q5ObkoK9GYW1MAVdNnCiusCBq+od+nerB/vdeZZhF93N4WWgMkV
         +RwNc6bnEglGtZwAnIE2MnbriGIWjGBrXyJNiUkWb7BC028q7+eV+qANmXwgGVvLIdMj
         DLFw==
X-Forwarded-Encrypted: i=1; AJvYcCVGc55qxnybzT31WcJD1dfxcLEXWBSbtWvkqFbxPvwdsvFUYQKecQ6CU/a8OJPcO+ypmcG1uoI32HA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmDXmVl+JkZ8WJuZVYVfXQtxAMhIGsJepsTlhR3OVlALdf6CcT
	iorKyifvaYBPCU0R/qNS181IYn2Q5SyuFniNZQL+gx/fkEaJ1urH1YLURtlnLh8PbhyNDbF9gZ3
	1l/qPTw8fkOfoNRg7t7yLMqwsQtpazvJDaQPl3HjNFNpQCn+5oI+cehO2rc2dXzY=
X-Gm-Gg: ATEYQzyYu11vhC8pIrUNKCiUvXI4OcfRq0DLmkgcBfZHT+L7t9B0kn2o6l3RQOjg+Yf
	GcI+B0tiiZXFdzRdEAFr0H8KPy11gS37qI+znTihcZu8HTtjiHgRZQAJRemP8dPhiRYQz0D1ZuM
	FAuQGtzjOLEvmB8uRrduMSlbOb2xmf7xummzj7PkdYw676z9d4QeFxv2PwuOL1ey6MBJJD/X+OE
	EJ1BfKOjx83HJpgoRdRdjP3FM2vl70tCf3Vnvvhux02mdN5yWf2fDGUb1xSJo3R8ICVBhyXaI2y
	sg/jwzk/m/4XaC7Pj8Ow5doIVfcP8IRXokkMlUmwYimDiC/UrvFk208U6aWVUC8W/JpTvFXnVOu
	JsCkINni+OaC665dWw+KPA6e7jLkyKCym5mCiC0HOy48wkbN2PFdHeLJETTEGKSmCjTzb9dEDr6
	mUE/c=
X-Received: by 2002:a05:6214:250b:b0:8a2:18b4:79cc with SMTP id 6a1803df08f44-8a218b48708mr50473836d6.8.1774944073098;
        Tue, 31 Mar 2026 01:01:13 -0700 (PDT)
X-Received: by 2002:a05:6214:250b:b0:8a2:18b4:79cc with SMTP id 6a1803df08f44-8a218b48708mr50473316d6.8.1774944072693;
        Tue, 31 Mar 2026 01:01:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae23f18sm372898566b.1.2026.03.31.01.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:01:11 -0700 (PDT)
Message-ID: <aca0c679-654a-4c39-8ff9-197e820653af@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:01:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] clk: qcom: Add support for global clock controller on
 Hawi
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
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
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-7-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-7-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Le5MulVCeqN4h1oTdD65QmCVOL14An_k
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cb7f49 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rjm_ucXa43sWr1tRvOIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Le5MulVCeqN4h1oTdD65QmCVOL14An_k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3NSBTYWx0ZWRfXz1z0rb2k9KMA
 RMMsviVVrPImN9UANjqjG8FgRSD8OVGiTds79k/aDW/5EqCMhq67TKDz5wPMLu3fxzBeLyBSHB4
 ByogPD67xpuzbEyk7uz1RSl+f/09WJSrOndJ2yXIjLZmj0h0XJNbSeVJfxqEePiZYfszzReM2pC
 pZWaCqM2AjWXH2U9jFzLbkoBKwd1HnYdXzXLXEVSqc94f40bIki2anMxNWB9fInG2NQanmQD9Tz
 r1vUm9Svbwb0/wjomC7qmd03qyLOaGPTwgDpTZwBZScU88aCtMENU3iiAgUlVQLpHDrHkVCv8KI
 +d9bUQIn01Hc7ybKfvHAQBQILqQykZBNS1Gvh3quznKAHO9HqWD7NeOATxTLtsbFWeejsiHNxU2
 6t15KmrOo9TpvYVxLiBaKUPbmyTniytw3wcldWVGqO0mAZMcuaW7ZR0xxqm68tF+8pueB+B3MLo
 +OaZNKf2JEyS9XhuQdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310075

On 3/31/26 2:35 AM, Vivek Aknurwar wrote:
> Add support for the global clock controller (GCC) on the Hawi SoC.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
