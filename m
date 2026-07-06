Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B73417377
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 14:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348784; cv=none; b=oazvVRUkHXg0JU5bSc9YkekigJSUz/z27KZLa/MhkcHViRAJ7fvy1IDVJoUeeM53oghgo3OPo+MxBIQt/Ad/2gcgUnKMuf0nwuxC8axcs5eV7zCUBgB/bWS71HoXQ9NwAvaSxt2yUw3XK6EqA2UHT+Vr3pM5t9qxqDhO62MgdC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348784; c=relaxed/simple;
	bh=v/r/WqLZEOFyAMYQx4rralUtoGfSDfJuZ6bjDMVoL/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXlBRPWgSoNG7/q6yUfW4WzsbAlqSjSlR9AvdQrKt6BUIhSNZo5GTiGd/vkiNhdDR87RWl1GdvHw4QrbABK4Tl7bdcET5Ng0q/hl3WKEJrqGcrXGM82H3R6+PSHu8YYyrmq5Fe5RqLxA+BwHD0YGr1BUWtTMxkbo6AaA6k6v+KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ko24b0pF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwYAsrkg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ko24b0pF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwYAsrkg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EDrru834851
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 14:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VEz5SR4P6MGHr8FEm9V24BJ/
	fL5kDCBLdYNsiYU+fAg=; b=Ko24b0pFQ71GsCvA+R8QJ7d8YA4SgN6xcO+NiAAz
	ObmFn3kMSm9+C5gUOzLEChqAnS/JBdtAe+AIIdzdQzYBDzH4eDOByNVWEbLlvQLi
	Bsqqp0BYH78cJKUaE+hLbO2tsrzdZMtAUBz/nap3o1TiL/+yAGv5UnY2T7ePl1Ic
	iUi+ybm2xa/vE9uCOrNM1qdqJQ9OvSkVFTJyM6HY+nGu/FvDtJwoIfWhYHAImPTz
	3HYze1uoUkqzuamD5UG3jLB91BOjcDwuN9et1HC8RHn7MsnbEFawix5TeqoLnv2v
	bTTBdNrG0bZw/y7vvfS0kEmwVizQnoNZ0SN4IXighlFR0g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgsbmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 14:39:41 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59d595bfd94so1118662e0c.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783348781; x=1783953581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VEz5SR4P6MGHr8FEm9V24BJ/fL5kDCBLdYNsiYU+fAg=;
        b=ZwYAsrkgw6L8XfvJ72meKLXNelzntI/pi1/uBQ1usXkcZJEnmDNl7YA0U+zOs2IWCy
         lbDMXYVLJmJkCP4dU482oJ/sHJPKGeX4GWwCdzKalZqa9D9YmBWQnnqAF4+i5oWvyg6I
         yqBwJEMy3okl+a67OlFWSnLirqpvyYGpdPjobMzWrA4/JYyvKsBtyhUupBlDCIcje+MJ
         +AV0uC/3Lf9z6KuyAMf1SnPT7ryu1ZD4X/Cj0TaDPfbzhNhvoZe2Pf9hobwP3uIpH8bS
         4t0DY3xd53bU0cZlZtnwJAXSLGCHWOYsfrYadRWGqllOx0dFEgvHZAmeP7NB2NXXlIGQ
         3zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348781; x=1783953581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEz5SR4P6MGHr8FEm9V24BJ/fL5kDCBLdYNsiYU+fAg=;
        b=HG21pyBhrL5Ja9g2ND8sY3rlt3UkBIROMENiN8CGOZ9YV2wveYnVyusIzfU+Mnmjfl
         ICGzNBadfYB0+aiVTd3sc/UrN2sYfImufawMSIxFAiQYQ8E4kKv184fMokQ2JMM8Pc5m
         Oje0731cqOp23qdjGEy2jRksxmOHaHuFm7OIZ5solktWSOUqn6KBP+vV75ZSW9S31j9K
         JpHQej8Gro/rHCACVsYKveLho4I05mojrmGmqnT7KuNGFjmsyLlJGn5chZDNRk3nryFM
         BhXDiTgthwQexhIDCtQa22ETOedCa33CcXhhCjTGAnsbsfZ27ZHG+AQxL7cjQlYEch7C
         A28A==
X-Forwarded-Encrypted: i=1; AHgh+RovHJtuMMh0CMI+06StjtqDZG89QNtbxNxumqoF1nnDwB9TF/GWSEBuLI0HWxQaDf0VqP3vfuXfPIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnGsPU1sNXlpHBZjRo8iOU6KYlcCal5d/ry5H8qP0mKxnsBgAt
	TxYLdmo1cxHmSD/0woACn6PG975HYcTPMqvFjwW4lIt2vrbSwcZvGxnNEKwneP7h07+PodHa5cn
	uJqXRy6wpM65R9U+XyxY4BOpiYU2AGO5VRW/8ihybQxxt6GqGaqBONBge1SzfeRQ=
X-Gm-Gg: AfdE7cl+VQEofEKNNkb2ruWmMay2t2F5rwBfSeANqLKkXdti0z162hiF2JtFxpqojsu
	FuBHjjcFq3wof4/2mlgM+gs5hMDhIDkva2x9L2m/jpgIlaxCr9rap0QfyyCVr/Xq29rp+CuTuRo
	DdVVg9NS16pKWmepuz3D676q31PdJRQOwVDyrWXboI/UIRIrPUQBtaK+mVxNoOYOIsB8htBRPIE
	dqKaj+v94LX+jC1TNYPFB380xhVcVDdJphXj62gTxhcGH5qiaiog1QQuMwc4ZIYobSPt9z2Ch30
	L10g3uYkiy1Dhsa029kEdDMkGOxW/HEwrSTO09cn2LvKKBIbDcwlwRxVlv34e/k6l5TTC/Sov9B
	UJTQ+5mpWLc3GUrgm7w8bXzSRlDTQhif/oN+PYyr+0nB7itdU7xT2J1K30mSm4YePgfxfbLsFDO
	akwuNJwfaACvUJrK0fkwGWiCGr
X-Received: by 2002:a05:6122:8288:b0:5bd:9f23:a74b with SMTP id 71dfb90a1353d-5be9085aab6mr473103e0c.9.1783348780692;
        Mon, 06 Jul 2026 07:39:40 -0700 (PDT)
X-Received: by 2002:a05:6122:8288:b0:5bd:9f23:a74b with SMTP id 71dfb90a1353d-5be9085aab6mr473088e0c.9.1783348780248;
        Mon, 06 Jul 2026 07:39:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbbbsm2906428e87.43.2026.07.06.07.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:39:38 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:39:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: videocc-nord: Add video clock controller
 driver for Nord
Message-ID: <6pecwkpvl4inltqzy24hbhouuz3e4hss477xy3ce6zldk6qcvg@4vnvqxykmio5>
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-3-bae3be9e9770@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-nord_videocc_camcc-v1-3-bae3be9e9770@oss.qualcomm.com>
X-Proofpoint-GUID: OZIK8LE95Oupb6xSt7TyUIWFCC7Si8f-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0OSBTYWx0ZWRfX0v2WeAoGGZ/X
 nJv5k3CkmW1LLJYtRnBVopN1tQ6fHPDr1FLgL/vDkpxcvoGhO5asgSZ6+hRPLkQL8OX3hgCmKY8
 s2oZ8WkcnVjHmtempJ6LCyBDvGRK8bqeL9rrOFIoD3dbDfOV+rgx2imC1i1wSd/2NDBeR6sifa6
 bmx/lwE5AnByPgOQ9KCOJYPatJed6XLfBcd1mkT2RjpDFJ1U7D0hNajM8IF1jWHKNQqdcJvmqx+
 wakCqWNgmVdFu4+kPJOf6G44dZag9C6N2E6PNNlp4kzoC1nLT+gJoCOG09JcZgxQLVJwK5Veu/m
 rlVYn80NBMmMOzWQaRcvZh0aTzaxc2RMwGn9DZrxtiOqK3sqvK3Ya/oLCSQZkz5Gj6B2hMwLzNL
 si9g3DaYhPqNi1dxU06xZDiLWjEA7JC8QOlbQTVSMaYCPx9R97jVkBPgCmISosw+blqKkYRBGVY
 S3B2mjrgFiIXJBJ/XcQ==
X-Proofpoint-ORIG-GUID: OZIK8LE95Oupb6xSt7TyUIWFCC7Si8f-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0OSBTYWx0ZWRfX/ReQuaDiX+5G
 6MwTocQKU/bAP5nuY7yai6eE42mLe3Y/mqGcwBo/zdyfVUTE/rW2PpRR2WW3Jn5HGaJoEq55F04
 K9ojs+/0ILnZm/gP3HZreOCRPC8bwTA=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bbe2d cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=d7ClhsmVZ3m4v3ji_18A:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060149

On Mon, Jul 06, 2026 at 02:27:15PM +0530, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Nord platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |  11 +
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/videocc-nord.c | 507 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 519 insertions(+)
> 

This is almost the same as the Glymur one. Should it be unified?

-- 
With best wishes
Dmitry
