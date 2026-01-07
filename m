Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2D7328B48
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 11:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785915; cv=none; b=H5IGxQahpX4brNj4Fxl6bv6i4oerpWel/A3uAIKaQdBQ9HpRX3sPtHY9xNrjIO0eos8n71bOEgX/OBy5JiYw4HbX4sQA4d5Glpt6L7kc/8GtAnv6QI5KL2yJqlrKbFLedS1pKHKVBoNOK9/LTCnC19/rJzX37X51PP/yhJss0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785915; c=relaxed/simple;
	bh=4zB7b0UM3QAE303z2aGV2y+diJT3NVYpuvJUbKRl2Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3g6AEj20zQs+oGeMwEzAHC343tnlwY5h96W19C10bDf9Cm7Bs6WY9+AcK+vq7ODI5iQAsxnUSEpuctqytIjCY2qXj1+uD9Qb22jm4bKNoNWxcMiO8dGExFlvtOdcUg60i68t+8zGmSSwPgrMP+uUavj6Ah7t3//G4q71zukmNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZOLRGdb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/EZpGTY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZOLRGdb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/EZpGTY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079ehCs2988609
	for <linux-clk@vger.kernel.org>; Wed, 7 Jan 2026 11:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cTH/4ZeodwA/Q+RzWHaBeEgt
	NJJIoFwg96ta/DUybCQ=; b=OZOLRGdbF+iM/6nGiViEWp6GUVmJ1jbNqw8BDRKy
	GVRMBFHZbDKcdByXYp9f1Y2L25UOk6U1YXqXadHLdz/z6ORpu9vLR8zZhBkwKGv0
	4mf88z583y1k7VTLxclG4zVIwN5BUB7tSbEziwxi5nFlnVmX310ppbpU9wK2POSi
	FtahubmmKFvcRx9S1MBjShx+9W2JSed33cU1hsKMs47z3+lNhBE7GGcWrqGheKN4
	PKKtVkDbi3ovCo9yDiUukmkP1wbwDW4HA2wnDkfd5sm4jZXr7o+jUqbWSRs3zC07
	7cesJYcAew9cWh60c+O4JnZEsS7p/3MqLFuEyNNFXy3rDA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn2nrbnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 11:38:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b22ab98226so144938885a.2
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 03:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767785910; x=1768390710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cTH/4ZeodwA/Q+RzWHaBeEgtNJJIoFwg96ta/DUybCQ=;
        b=d/EZpGTYQA1AXciiIDf0+Pt+VkUi0wpoXS9+RpPtC/rYW1lGQHELMMtAdRg3kv7Wqg
         IaaDFuR1Wndw9BwyyBcaFgcYAHuIO0Lo2KIIN9Z+Sv3oMuJTTYmGPwvQio/xncMsHdq/
         745arw+L6A1kGIKIr9+hwRvDarT7lX2qhWECsDTja1DCKERxVzn7YBbDiNmFlzbksFlG
         MYr+1ge5iU14LmcE7ri4rYhdoqti/Rh1KsUIyQFAEGj/1FPhbaGu7tRrH6rFfqKdwR9w
         hVhhB8XXd0Usn3BGliBU3qa/URKZEsHDtnJtQF6l1ElTNRNGzHeLUY9AGe2Y42004xSz
         /49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767785910; x=1768390710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTH/4ZeodwA/Q+RzWHaBeEgtNJJIoFwg96ta/DUybCQ=;
        b=Z4NEs7cPQpu1NkKpVJMPfFCwKvdxWKqm/Aqdqw4UksaDhGUk8rl7a8WeI8VSvYrAbw
         iA65/cE70a4ePamtml9q04in+zriogHS8512+hFHYJPmwSBW6l198Dj0YWmaJvfapxHU
         TMSis1HbXZ97NVortKKHsUzn+SoCZ9Q8sH1wag/QCQLqYnc1kIs7/tSgSeCVQ0lBsvXe
         AdXesEbhipUOmzzQFJcFC8cZj+pO5lQmVBm6/Ggw6E6MDF5bkmcq6iFL38k5+8bygus/
         6pWhYtm+5eo2fpn/0gE7YEaJXosIYECssUmGzr8k+0sRgpfnYuJyF6bf2LHJl1NRxN4P
         GkxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGLslG1h8LmO7kqNobGh3Q44SRiBhXSLYZnEJ/MjdLVCKYhAiODy6fEIEZyTBvDW3u1riePuuaesU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNvSXp8sbtJcCtHtbbgYuz4X+L5Tne3f1k4+bGbOyownLataqQ
	d6o+ku6HLIGj9k0zItJ1G8qLeWdIdtI7O7fdrPUR52hYH4bSFL51Xhso5NVh6ne4//zUFyjEEe1
	DP+qGCc19xJ20YlETJQsZ55xxCgXh9mSQxyXgdIgtu2fTYOTpMJ0wt6xTv0ABYGQ=
X-Gm-Gg: AY/fxX5uA2MjyruGBN6/Oe/2pdyEmqIoZ/+0TtFccU3Zsm/yaWqmHAYOyjNxcTy5VUT
	zn3oATdObhbXu6+YRw1axrkeJkuhOW67BEIdJ1Jy32xt4mZ8jS7hNAFLodl/SrNpHF5TmNFsSYP
	3Ju4Ofc46sQc2DIjCJsXa2i0b8dbFWs8R6/Rld6rpUBegkSEvlConmFzCTzOjK0Rdpf8NJQM5Ne
	1/v8nx7Nm3b3wcUAvU6Kruyusnrjs+jcWIkKVpWE0a84GTWHqiOAVDT6GzrQSJYyKeVaK907d1P
	X3m2XZuYVxR9yIpw0/74XnPFmg/zVS/MwEOewuXAc9qaIasQIP7bbtURTaNohSDxi7yZYiaIp+J
	Z65kp0xL5F8BzFrLcVdY/bsMSIJQB4Egqvs5+4XznF8GCfiZss5i75YoNwIO2sCYzgD8PA7NnaF
	s1NNFqRZTJpQ/GUL662NB00Xk=
X-Received: by 2002:a05:622a:20e:b0:4f4:e15e:528f with SMTP id d75a77b69052e-4ffb49c7d3emr28885811cf.62.1767785910434;
        Wed, 07 Jan 2026 03:38:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfaBxfXO0EARRWs+zjZ9c7H9zOXqTKVd04HB62R5Cos9qRCEQe2HmgxwEezgO5LrfADT4Gyg==
X-Received: by 2002:a05:622a:20e:b0:4f4:e15e:528f with SMTP id d75a77b69052e-4ffb49c7d3emr28885451cf.62.1767785910039;
        Wed, 07 Jan 2026 03:38:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65b89842sm1242653e87.0.2026.01.07.03.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:38:29 -0800 (PST)
Date: Wed, 7 Jan 2026 13:38:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 02/11] clk: qcom: clk-alpha-pll: Add support for
 controlling Pongo EKO_T PLL
Message-ID: <7lbw6rrrsxitcldgahf2wwqklzy3nvcmem7aylsw5yvbsbom2b@lgel7iicehrf>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-2-8e10adc236a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-2-8e10adc236a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MiBTYWx0ZWRfX29uhwQ8lrYId
 R7Bq2iGkG5/DNhsi4SQO/BoA3zu6LT/N8zkFDJ7k/IHRo3tVn6OrGfnih4vbV44RPf1b73JL8vs
 9xWkCZDOAnlQ1YhhqT8oysMtWc6yit8thdUWxzTO0woI6iW0t7ob8mMa01+z22xfcjO9CiPthH4
 tq2WNdB/xERPTfQgpl1E4j3nkn7E0FWfAPNVGdoORw2xa66rdv9yk9vPxpmsPpqO3Do6fG/A6ee
 XI0/CAT+axol9WFbwjlUh3dNHvcfCSslRjEVvXZdS8RoMvbjUtuKa8dQnwTfM3gZsprHSDu2JjY
 oglmNhWNIKu6PzLu839LtG+fIMYuEuq6fUUP8qp3bkPvLC7Ykulo+JDv3JpVnpxc2o5hO7iiBCY
 lNrKK34VD6C9CfpwA4vyDa/C8Uf3heXLAXungUP82e8Usf/S6mhpXeiZyKGc98bb+2hKVkYQWxw
 Zo6wBY8vS4v22dPUdrA==
X-Authority-Analysis: v=2.4 cv=CYEFJbrl c=1 sm=1 tr=0 ts=695e45b7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Rar_LHnIVK7gKg-YXgkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: QVqyHyJaa0_QK8HCOajaZs5fsDizTLi5
X-Proofpoint-ORIG-GUID: QVqyHyJaa0_QK8HCOajaZs5fsDizTLi5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070092

On Wed, Jan 07, 2026 at 03:13:05PM +0530, Taniya Das wrote:
> Add clock ops for Pongo EKO_T PLL, add the pll ops for supporting

Nit: PLL

> the PLL.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
