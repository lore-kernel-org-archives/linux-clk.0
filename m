Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC2D493642
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 11:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436612; cv=none; b=ScrCFtk9gugZQPZpRV+kJcPn0bX0rcVUf6zf48IFN0RYlVGODlpxlS9Nn+yvvQp8z1NKT+baYMRUMiAW34gEI73aPp0fmoeC6XlLPMcQctz6rOu+mVEeSrY3DCgG0U9wbjdGxaoaYf4uCt9uUmbbOnywxTG/M69OuUawzlnSWDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436612; c=relaxed/simple;
	bh=l2mBviIzjsxDrCGYmNf6Y/ZxROvtLAzlD3i0LYSPYDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GCqJalvTnaU1ST0VVZRFoY5qzmJrSt3oXvLXC/AikILZj3wEoVwwtf8ysV/6vR3xFYPcEkD5StAHWTe5bAD2cH3KyngzjPAqumkV1rohWQd3k+5bURl7/3tqoiJmvNpZ6PVvvhZ7FmgZbcYxrIneIYP96pa56A1ypRF/e9nhD4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V/Pl7Lyu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILzmJBHA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V/Pl7Lyu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ILzmJBHA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AH2Yt3720091
	for <linux-clk@vger.kernel.org>; Thu, 3 Sep 2026 11:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	10SeU9Ko5vWjSXjWQQR8N3iT1EL+d0CVdPeApdvEE90=; b=V/Pl7Lyu3cX9mZzb
	8uTCS3kaV5siO1pTkeEPItBh6+P23hiW0JDfw7kKeUTcy69kPJdnZXRkqsYtDtV6
	ypQqwuz+LH44O/RS2BVCUbzbrvpf2ykxZgtzbWUswKHzVpuW4OSuGaJKcinpfaOQ
	RJKXvjXlYXtXAajMLQr1AFysd8cegYUTVnzSqOpyl5S+MoQk4CpgOj/VMT+UefwN
	xqH4K+jI74ma7JSqf5ciHrpSkv9FPE/HNNYmj68TNB3UA8NhUOfR9b1r9t3yLhQU
	tnAXpd1/iZrWQQRMNIemXi51NguX9axokjeT1h5vjPSMQJBn11r63glTI6Mucd0H
	S5oxtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjsy6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 11:56:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93495488976so53098885a.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 04:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788436606; x=1789041406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10SeU9Ko5vWjSXjWQQR8N3iT1EL+d0CVdPeApdvEE90=;
        b=ILzmJBHAeLLDw7hSPJ3h8HWvuWy06/ncNoeiqEvBAAgoR0FMd1cDd3MnRhu39Ocp6B
         cw/yz3JziOr3JAG6BvAYi/0/wDUiFGExCmKqXd7pEieUN1bkxNmPPtCE3JK5815oIOwk
         ed6cGEf5HW2q11wcXHTHN8zvEHFMmapb6vdKgvEhRXfqdmlATcpr9kuNeD7R8PRDLjeE
         7Z/Log+I6peX0I8fJWK4kJgvGDjnBpiWq/ojXZYZETdaRwBdX0AABlw0Dvto9vcipaEn
         fyCp2D+IW/6+uB786e2eLvzWkbRzC5oWnvYNDUVdn96ESA/66lB/I4GrddmOjYOiOnka
         X4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436606; x=1789041406;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10SeU9Ko5vWjSXjWQQR8N3iT1EL+d0CVdPeApdvEE90=;
        b=Vc2gfRt1NiwAyYmJhg71soC4MWsLGEYESqOa3PSIfXtWe4HClBZXiL0ckd2HjPPZRX
         GY8HJ46Rs3pfnvvzQ8ZfIV/Gr3MljqGGPnUQyGxADCQWPLImye6XTbpPl/vAVO+qNQSX
         2ewKzGfTKz7z/UxvU6G4FP8GRspSklxAIM0QX5d8IVGPzfWViyiOoVFB4qZ+wmz7SBpj
         VsjDqlCMW5/g08GYAjOGI3mDlJb4Ls406+79wim08DEUkrRwKq0uDBBJfy8grNakb+W0
         ZcK25uo5VGRRVH6B+yPTtVUY75rEED3xaLXjgJCy5V+j5Pa/HbnfkIk5ZN70eHb4CEbQ
         cqEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJMnZOGtyFcw0Edxk5gee0Zysc6gb2f+3QFveMjz5DnEpqH1IIolh+N1tD3UF6wQO7ZmiRoKIp70c=@vger.kernel.org
X-Gm-Message-State: AFuF++m3qZIcxxC8R9OSRVnzlDZFrBKUNGLXy87oyJZ0dlBHYtNNLgbp
	oCkyqqv+1MzyrnkSqZ3Lz0/j1od0C3rVDATRkKLNsopoqhS5HgJLQ4JjxCJUcOl9A3ZJbf5SK+U
	X/M7IeKc2ta8K5zti5+3h9r038WCkbiifiHGUvRiW+qMaFGPBG3ZEvPJPnmBl0LQ=
X-Gm-Gg: AYBFou2wF92H6iSxPL/zs8xV++gO0crTxZ3XwVZBjsRfFX01gfGnMFJ6uoAuFMVTKvi
	jh60U/UhTz19heDPNX0+vUcl4TPPzTi8wuL2u3wf0f8zPk4tpbAarffX+IUqOWDgDmFPF0CqHdB
	qw2rVikX/oJ0Ckl5w4zKGb8xWXufsrtVKl6IPP4iYKymaNMydeFYI/TAu2wclivRujbQiA4P635
	mF25U53E+dNKlGDB4MVbtjsa/F2N/pqGhvPDNAFcSEA/sziB0lKySHFGi2TK/0TuU241XCOCU7B
	3As2kHPSWi7Bsu+YgGECRQJQn4ewzY/ftBVWwL4AVVmt2p09DR95qUZ2XSV9+feEvbZXddNYCkD
	43qVe9LiS9VloapNXISRXjw==
X-Received: by 2002:a05:620a:a2cb:10b0:939:6b7d:9941 with SMTP id af79cd13be357-9396b7d9994mr435186785a.2.1788436606021;
        Thu, 03 Sep 2026 04:56:46 -0700 (PDT)
X-Received: by 2002:a05:620a:a2cb:10b0:939:6b7d:9941 with SMTP id af79cd13be357-9396b7d9994mr435184585a.2.1788436605551;
        Thu, 03 Sep 2026 04:56:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41a104fsm88275066b.28.2026.09.03.04.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:56:44 -0700 (PDT)
Message-ID: <9e6a0e54-d16c-4b8c-9034-1e682a420e7c@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:56:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-5-21c3db378611@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-5-21c3db378611@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX/iD0GMXVyVD2
 Xjee9suubjUWNUoIexRQeRqGsb6PDSTSUy5nsrIf2lUzqU35pPbpEDp/MU/yHTtvL1BEGLID1Ah
 fDMDh6o5l8AIEkudqrs2a1ceI2pnsygDbxwXRh7mnJ6lzN01NBVkbm3iEUS5yjReMmbFBOegtuk
 XuMCZQFfHevHPZpOUSSEI7Nv6XkGFsjIQ1hascqIaz0DSRMmQeXi9tXVOiYhbgrxjJgvwJatk+v
 FBf1nuZjqWmpRyuNfsNgA8XwosScEl2HejsWKMjuN0Igfc7LC8T8qc54uv5PID4aQH6eXCF4I6i
 rItjx8RK8rKKN5V9Pozb6kglD8aQz0V+Y130DUsbjQZGemqt6yb1XbePQE9A1f/+07Migu5QEJA
 3DdKs/YuhbprhpeFn4+WRRkR/zEwd7846s+0StAPUzBMjcrG2/kOTV8+jvaobXBOMDkAvCwMUUh
 4EZlRfYWFIFoyjSq7HQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfXw2s5KdTJGKFv
 pUTJddnhNPJ1mj1CnhPaVlTBhQmK3TZcMNUaD2kGLhp2YA5GvQuajM2iE6HaAIU5jsLQAYXQslZ
 skUAXsYsnU3etytNGyl9HISfze2yCmw=
X-Proofpoint-GUID: 7G4KbZOkJTUHIFiSaPAUOLOm9-ZBr94v
X-Proofpoint-ORIG-GUID: 7G4KbZOkJTUHIFiSaPAUOLOm9-ZBr94v
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a99607f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QFuAlUpucN9v7rsm42sA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030104

On 8/14/26 2:48 PM, Luo Jie wrote:
> The NSS (network subsystem) clock's parent is cmn_pll_div2 (CMN PLL
> rate / 2); it is then further divided by a configurable 6-bit divider.
> 
> Register the NSS clock through a new ipq_cmn_pll_regmap_div_register()
> helper, built as a plain struct clk_regmap_div instance instead of
> hand-rolling recalc_rate/set_rate. The helper takes the register field
> mask and clock name as parameters so that the upcoming PPE clock, which
> shares the same register with a different field, can reuse it.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

[...]

> +static struct clk_hw *ipq_cmn_pll_regmap_div_register(struct platform_device *pdev,
> +						      struct regmap *regmap,
> +						      struct clk_hw *parent_hw,
> +						      const char *name,
> +						      u32 field_mask)

Since we're doing clk_regmap now, you can just use the clk/qcom/common.c
infrastructure instead of NIH-ing it..

Konrad
