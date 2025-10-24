Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505002E7F1E
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 07:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761291536; cv=none; b=Lxvz52Nm/cL3Ucm2+fA4Hh6svAs0P1j/Hy2gKEmO4ogALMVjbZZsxTb4+UilmLSOsn5s4X+D6FD4uWu7wA8l9nrweWxxVKTswvwdcNZNlk8L/2R01uHUQ6rxGzAK+VV93HBE7Nymh1019SmsGfz8JZROwsklL537LP/jxaWYz6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761291536; c=relaxed/simple;
	bh=tiNmurCsXGm9dhg4Nmmt2OTRfw3heIDQmN8jUvQXTjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cUPLGRPcV9STt9KQ1+eIR0nlXuyNide6iv30/KFCeqUHSnmRHyXK2ZG7/2Bt7oGBedc0+k3a+g/f7BsilcjhsGcjZ3BeZd/ebHeEfjpk5101TF2to2paL5xQyfvZ+aSageQWfT2OPE9qnYJIRhQIdPROyUo//pRm/WqWSU2sz1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzdvsgVc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzdvsgVc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FLrZ014884
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 07:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	my9U8pjQuu0h+9sW6zK2VocRF7KfxfmwPaDP0afFg+o=; b=OzdvsgVchTe29L02
	nCG2o2z+NqzjZo7AT2grwO7uVBpNicYdIr6JNq0gKWrQ5MN7MYJfZBdmk00NlZGZ
	G/qtOM89jw/J7B3F7/t//ES5D0hmixHqxezUR1Jk3cdt1O5lbjDaflKGK8nkoAuR
	qEc86dMRQ+otEV43KgBx6SUzTSFcjnExTJpJBSyVVeEX9KO52KpFBpCjHW5EguFP
	6GRlrlTYrDb4eEeWG7kognhvc0+D1d5Gge+2jpCM3HqsP0hY0Xjhdsp6TK+E/4FZ
	j0jLQW1D//iriR3Ua85RSaK2KVmbINi0AQ/tgJvejwSw/qZA0U5pSXMcdVs9bio+
	Smft3A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08puegu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 07:38:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87df3a8cab8so4662686d6.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 00:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761291533; x=1761896333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=my9U8pjQuu0h+9sW6zK2VocRF7KfxfmwPaDP0afFg+o=;
        b=UimZ57c4RqLxXyEEVYJeKVp5vZW847vSTtt6gyFmkBE7On+xUak+Cdepqs9fOlH1We
         HZ4ddWx3IAt3/V3OBQ+Zh84DK0PNf63kPqABUyHGATsVoKbXlUb0EZp5pLni/IdiQjTS
         luzwRXQsY3Kz6OCc58ACtlhUM9C3diVW/KNcbkiuq/r8FGsm7CraFR978rnDJ2PN3Hbt
         7nDcmpZTQWOjyFJ383oEKnRZAn4U8U7C+ES4Tp/yIc8Ldysx2j6J/82lDsGgzTZkAW94
         mra2hiwUV265w1dlq1IVWgDFkbELnsK0GM7Tf6/FbXIyo61HDzc54leZV7TlV0O9rWKU
         MYkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpy8MGgnrc04SWUPvxw8LLoUnVzqETXOy14Sye184r6PAFXO3bra1M27mVWb5Ui427ceRVtInb8Yc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVmD6KVGBoDnE2ABW7d+L4dL3Q43NCRvxjyR5r/S15D+mpCyWu
	aJd2nx9jpMu7txzM2R1WReiCYOZI0x7AmpSVTFfGEsncKA8Y06D1jlz7A8E9T5Z5ZTtezQuVXGU
	1HS0m3OO+J70i/aT6IWW1vP2vq5MHQ2BATpdXJlPRdz/M6Z4mRUuAPQ1sYzmw1lw=
X-Gm-Gg: ASbGncsoP9IgrvUj4j9/3aQt//9JhbHAZgNqijs0CMNKXchy4MVYSUDS8zFsvU2rJUA
	/SmJZc40NRIuBdYxyX62b5KdN0uxgswlMtePDGoAbDYY8gfPeY0EeeArvh2IFplF0COPMN7rTDL
	Su3S2zY50fzbaratSr/X6kfJx+ONRBfxy0OE00gFfrigSKhfX+uJhNgF0bm4J3imkINrcugdWo8
	1kqKyQYCNa/PNeaJEmh0Orbiq76fWbIOd0JKesvIKkrnlmMyt9jRZBJ7gcHjvic0i+FvlFVUt2w
	CTA0EJgP39fBGz9++j2gBAyW0UbHwjZoEK8g8Syr2FNptanzNE0dP7avmYh309YQI8yQjzYX0xl
	5VVllu2fPfwvfUVCWR/cu4uaiY5+Enfc+/qrVY+fsAxPjo2WA4znxzKSy
X-Received: by 2002:ac8:5a05:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ea116d889bmr116824041cf.4.1761291533394;
        Fri, 24 Oct 2025 00:38:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERlDjQFfq5XQ4d+OpUPfjbFEog9jtTsbbodJUg2QOMqaxjucQIj/Y18kJ9TgRfYF9ST9aSbg==
X-Received: by 2002:ac8:5a05:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ea116d889bmr116823831cf.4.1761291532813;
        Fri, 24 Oct 2025 00:38:52 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d727b4338sm105457166b.52.2025.10.24.00.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 00:38:52 -0700 (PDT)
Message-ID: <5e8397c3-5bb6-41e6-ac35-4090b7a9fe98@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 09:38:50 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251024-sdcc_rcg2_shared_ops-v2-1-8fd5daca9cd2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251024-sdcc_rcg2_shared_ops-v2-1-8fd5daca9cd2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX/Y0+EnLzSNn2
 DDJ5Gv1Bv1k6M4wEb+6Ixzx97Zrh71JrqA+xn7YHBVQLg5yYq7g5xJJu15nyoJEUG5IWQmLxQw7
 dUtpi/KD2xJTAReQgPCQU4JPeOZ3lIVNvznQuXQSGvHCEL+4/F1MPtmYaSlu6GefRcwMeFk+bHe
 XnXB1h7Y4P9iRd9BSXzRyZvntyeWH27VeYw8byzBzM2xEJQOOlVfj4p4uVD1MtbzqMFxgYXlFiM
 YmstZCQk0Lb/87Vs6X00EDdaWv28cnDbJODNYHmL6/u3gvxtaufbOL4g5EuUb5OtS5awKwIaEDO
 hr1i6yvAPfQXPds5qsO2y7x6ko4DbieZTQPp5bnEzelEgn+gJJvNtmJlZAN3XDgsTVQjLlvOIjM
 qs1Sz6Ob/k0ftoXk38O3wDxLgJfOyQ==
X-Proofpoint-GUID: D2spVrL2ASfw1ZpLYxnpfNHJ7StQLH7N
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68fb2d0e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=X3gyspzaiBKJvtbIpHsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: D2spVrL2ASfw1ZpLYxnpfNHJ7StQLH7N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On 10/24/25 7:18 AM, Taniya Das wrote:
> Fix "gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
> boot. This happens due to the floor_ops tries to update the rcg
> configuration even if the clock is not enabled.
> The shared_floor_ops ensures that the RCG is safely parked and the new
> parent configuration is cached in the parked_cfg when the clock is off.
> 
> Ensure to use the ops for the other SDCC clock instances as well.
> 
> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

:(

The subject also needs to be 'gcc': -> 'gcc-qcs615:'

Konrad

