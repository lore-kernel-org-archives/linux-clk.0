Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A2231986E
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146990; cv=none; b=Tb3p8qBZXXB0EEtYyV8tHteZJHKb4bu7/vwOh0ExzB5tDK0MIev78RG6wGIQpcD9cHFaJx/tFDTBKAUPlO2Ys0bS/NQJCDUQSPejtA9enbXyLBBm4EmKiUk0dzQo27ccQ31LbWRgmtCDZ/Z8bT6IetAHg5NrtdllRWvRpJvi4dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146990; c=relaxed/simple;
	bh=LDNOATw+wFayHgsz5DDuEHR4RebSw2I2Rd+e/2Ycvyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YUWGB70+wGednVethCJNN7j1ZuUbmDi49hIFdSPm9RlNoJX29j162Zgprz3a2BEU756FoppF9kPtuaL0mVV7aaTTUrmPUueioiyxmyly7eSVEyvAvDHG2gAsPf9jUv3WrTlVfMPPn6ewdvVHT/fpzkXRpL7P2Ype5gseyhlJxgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5PlAlX8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5POr2Et; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5PlAlX8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5POr2Et"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ7SdKY2650901
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y+HDFXM3B5nS/Bkeu+TQXGxPQlN3/FUeGSnVPol6uGs=; b=k5PlAlX8tfhj1lX0
	irjtGFFtD0F4lMM5FngoaL98LBK4z5nZDKWbjXYdNIOqkT+oF9PgYuZXujRktnlb
	a7CWeXlvSmDFvOcfggHGPhva94oOGMl/7acK1jQkJqk5vwtO2ZtQZLQWlW8tEWcl
	11m25tCDGjPkSnm4lLdtlI3GRFoldSnIULyTb0tAuZQpieWsr6+r7OFie12cFtsH
	zjFWStqC/GMcUoWBhE5nJ2wiTamVkJ0/uJYKO/cHwZF6eVhkodQwzcXcfrTS6/3A
	jOJIsUDuxzVvhkRc9FP47Uwft/MR+oAA0x9AlpkXHYXc4jWWJ3E+cooKHcq/C1bt
	GFcHwQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anaabue6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:49:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34566e62f16so6962773a91.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 00:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146987; x=1764751787; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+HDFXM3B5nS/Bkeu+TQXGxPQlN3/FUeGSnVPol6uGs=;
        b=M5POr2Ety9SCyPmdh8PMlxg2zLtOmtAKZa+70/kYm+IZtOcUU4v4tm6jV/oU5oqYeG
         XTY34MsstIguJ5qAVvWpFeODAn7rXj0qDavSaLnHa5OTN6wk+kslnylayZNveCMnqHaj
         gDZbB63Qz1wFYnDq8IKLv9BB0n4CWHVZWzNUpJu8UIaCaCk+jPohB6JpwdxMmE1lbjJW
         wlZXl590z6Pgvt52AkCL2fGbyKfmSrgKQEnVLcE6FmkaKdR5Y2PrjacDXf5Q6UaDLgjf
         goO2awe2L7kycuIvEBM7netJloplYf6liHEtrtjXTuLCIYyqJedBzTi9G429Ty4t+NH6
         MVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146987; x=1764751787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+HDFXM3B5nS/Bkeu+TQXGxPQlN3/FUeGSnVPol6uGs=;
        b=qaDGny4xCWgxrXrdGebh1juNMHfZrm/tDy69M2PW3/bGbiFgWXujW1mNafZDi28Nt+
         aspi9lT5y0FU/LKYlSioNbbCP2CT6alal3+I9kuj5UnBFnAbHp6irs8uUZa8qDU5ZpXW
         csGuU+orsPK0k3RS1xi5/MwoI+7QC3+oNeJkeML0/I8hrLlr0AxeDoZ0NeybUOCEik52
         R3ojLHIdjjeFj9IbSpuEY2xkq71B5gxufb0IUx3PeBzOc9pteMZm2ZhCr3NIJwL2RVV+
         ib7raca5BExzyVKxUfVWT8fPaxgiWCcgGNgfFaKBsxwbWAksnFSyiFu8/24awpoY+4iC
         kBnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgCpRXI1LXyGqNn99NMsSh7eTQ4cbIo0cTjYUWXNclBat3g/CDKuDx8vRlc9o5QWXof826vYb2onY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ0SY0HzxBjuOegYDjEKVkwG71ltpGSkczB8s+Jg2U4PLzduno
	PKiSrGt9zTv+YHtYwksbrU6A0yUiFpbpAHixg976m2B0b/UWcJNKP7XJGb0Jv9WJE3TkXldvzv2
	N8zleBa8lg/rQi5xCFCPpj9+njAqmxECF4Pxg7yumTNwJkEqEyZ+OJ3tsN/ZYaeg=
X-Gm-Gg: ASbGncuCRJLifs/ApM8DaCmWU/iFGkkRrhCCmW1rmAjIN51Euyba9IuvSZ8ya8wiON1
	HmO2SAnddhw+g1CdJ3cRbZ0kPAF1mNGR+wW1jubkzxAa91EczhPyXcFsrwzLDXt7JsN+hf41tIC
	dcUxm2brWRs/sySQkE3+VaYDZpLykxDW220vuUyaqdzHeyUMIqO7CXmC+G44duhXWaRxbFLcDNG
	yTQPp/1TzqoXR8IBdmcIoBErii1SwTei7f/QBc+fmCqUDva1hjs5hVtF/f8uW26dlAq6cEMiMB9
	AM/VNWffPcJ+pzOfT0XgPBX3nIovZP3GTjMRHzsY2OiaOej3AmfDoePPFxpUMzVfoCx2e9Zo6wu
	IRuZzhvcaCgBb3xSL6hlBzLJvu3h0RwYykYMF
X-Received: by 2002:a17:90b:2cce:b0:343:a631:28a8 with SMTP id 98e67ed59e1d1-34733f5d400mr19137835a91.37.1764146987059;
        Wed, 26 Nov 2025 00:49:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEY5m0II1yfVQ+AfN/2mzF2aSYu9PQ1TvU+vUQjc75JG7j/M5I3KBneKWcayCHeTc75gNeMxQ==
X-Received: by 2002:a17:90b:2cce:b0:343:a631:28a8 with SMTP id 98e67ed59e1d1-34733f5d400mr19137801a91.37.1764146986453;
        Wed, 26 Nov 2025 00:49:46 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a5a3099sm1817261a91.11.2025.11.26.00.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:49:46 -0800 (PST)
Message-ID: <ace9f08e-48ef-48b1-a0af-c3506258c7c0@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 14:19:39 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] clk: qcom: gcc-milos: Update the SDCC RCGs to use
 shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera
 <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-5-9038430dfed4@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-5-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vd36/Vp9 c=1 sm=1 tr=0 ts=6926bf2b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dIrJftJwEK3lONcwLLMA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: aU-SH7xpr-Yem0Gor0bQ1J46oEMzCh-G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MSBTYWx0ZWRfXwKX77P3Rsvx9
 jlg2NByVHzUBKTU5+P5oY863rBG7TP+VL/EmoCQjxBccNEy3vQxtf1JV46Zzlel7iHubbUymKEt
 eRI5zpMTqyZP/ZCZZzhFxKJqZyGyx5AwABkfA85R49NaexuSnPYfjgmikQ6HR1xe8+gAemjL+HY
 lb2I0hyCWdo3rSGTniFcc30XilowA0Bck56FePaGo8udVzNZLKNJg/YRC6friQuW8e6i4vBwyZ3
 HuHArUrWtm4fakHS0oLPTHr63os3BmPKb+Mw5XlTGB9VjN+3L82HJa5rmekpUMPGib773d0fKNJ
 nByqAPhBmZvSG1AM5a8jMpFvBjQeUjGCU4mpzRWDrnu/o79556d8LJGy9kNWZrMNmG+OpDMl0J1
 cJbKCwC1WskOyj4dKghkZixXO2qq0Q==
X-Proofpoint-GUID: aU-SH7xpr-Yem0Gor0bQ1J46oEMzCh-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260071



On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs to avoid any overclocking
> issues in SDCC usecases.
> 
> Fixes: 88174d5d9422 ("clk: qcom: Add Global Clock controller (GCC) driver for Milos")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-milos.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
