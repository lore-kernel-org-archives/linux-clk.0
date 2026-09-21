Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5B3489886
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 12:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992452; cv=none; b=G4bSx1f42VMkcS8W96LLWD1tDZQKww1xjpRC/fGzBe0uYn6pRJabk2szVjYJOX5y4UbiUZUHmAcNyPcSDsuFfYkT8x0ZcIs4Pa/Y6F0gDCpgh28XsfHBchUz8NHPIPM2+Qhj9Kn9iTXqjnan7OU5njcBMOYdGBIBN3ZVqK2FqMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992452; c=relaxed/simple;
	bh=aI+TcTaxp3qATHFDOIc+09KqwGvOBm/VOg2yW5Pt6c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ev5SfsJXVFeZL9DnFJwE/Ookbk6I4UcmddvTj6bQmPeGSSqPfbvVnd9KRPub4l/WWj3Xwk8hSzbIViz3sK4wkwztxtUG1omxzk4K0TUbNktv4yVDbRZPHjZHlCBJ0yxFH/rENjCilIo6TPn1iulsZNvbGNuSLrd6glNNfLWvyzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edHCoD7A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WVWHtlzi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edHCoD7A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVWHtlzi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAduYL1926510
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 12:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mrmIbXeN2TBMf2KsRlbZFCo/
	xNhOB/akjMxEecMlLrQ=; b=edHCoD7AmB/TowptwnhrUHlYRxIeu7lrGS/fubpA
	J0PBp4aDsLxuDDvc5lFjzEXjf/kp0brI8AJp38E6uxFiz8w6R5tXNDiUxWy5c4eu
	zurbSHWEzRpwgakncAWIFygU5mlXX4pBKi73/ZS74kcM9HrVA92LhXcJQ0Ztgwik
	uTx0WbLvMiYR+dYvGDcQMPyzCpTv8k/6JeBNf7PUuHMbqQe1CLJzMugnjM+x9sZi
	1PqaF0UIhhClNk0unCSTRa6+yBryPSDi6Ek1IXxNl7BiL9C701wJg1rupyfkzoh7
	/2UnmAE2NiqyeyArt9Uj+zWlKyxFrCXuNGe0tIsfmngWGA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3va96p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 12:07:28 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7a9378b844dso63370137.1
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 05:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992447; x=1790597247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mrmIbXeN2TBMf2KsRlbZFCo/xNhOB/akjMxEecMlLrQ=;
        b=WVWHtlziABnNFi18DkJAP8FuSEQgxmnjKM0JXpU343tZGj3NUJLVQXhQAME9JnalvC
         bClYrlkVF1k5wCRdc/zRT5kXaG8x6oZH7VHyAT9SIFwuaFx57irjbCBNxyA6K8lcSLrK
         Qybqc3/haYbNEQSzcjJd0eUnpdDPhaM8yatlnnPfTw+MCy1HUOLB18YZ6b6Xtj337Mdh
         K11S3usU2SvpTfRsG0G5ZruvxOWuSozlA022y0DURriM0+gZ2GDCN2BpVxrInXBPZ08t
         sCWghZogggUG8ynnuyObzAjyQAJ2cbHmRE8WFCyY+ZL4ANhIfHVseEwOCjk19e/lXtgI
         fJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992447; x=1790597247;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mrmIbXeN2TBMf2KsRlbZFCo/xNhOB/akjMxEecMlLrQ=;
        b=cw5sTB6ESbTWwPcjKkoXYpbW+eSo79ocP8EPK8zwRORsBm6/d2SXw+OE0dTfM6IbL6
         l59iFgC9d6ia7QsmOlOQ0zNOTQfcAixTjPNagI9p0uFWlnmYD+evHXZ/j/sPU9uk3aqc
         nDCKDbnb+fPDH0elcZnepvr6TOujGkFx7KVXdZC0iZm3X2Gqe2aoBy/EFjVGfmn5uc6x
         +5wpvPdWb3qe9KfoGrMbpNW8X74I+IOJSazAoLuMJ+RRis5RTwLQtqjuy+aWmc5bT9cq
         o2gOkjaFIu3+LXqrjoD8AwbHgkoa2Co0CnhVFjEFNqrZ+2Mxih0ihKTojTdvVYQVIplx
         efww==
X-Forwarded-Encrypted: i=1; AKwUvBwnbGnFnIVu8N803CRBNXj6m9lNJs47C30bz49AK+GAmawfxJeTDa9smoTMZ6JurRsph7oXIzwxDpU=@vger.kernel.org
X-Gm-Message-State: AFuF++mu85Cdi6GreZGB51tMQ3+350dSpjpJc++lObjQnPTKECIGaYwE
	1udlv/d3+t+K9IIi3nDXlPzuDugifxi9THcuDpTNheKZsWjXGBKjb8408A/nPacweWK/wamF4yI
	765oGNvn2EpEye0S3ariPdSj75XLorE8/Pk5eXcqU2ORi4dmJIN7xDRlC8+EGUmE=
X-Gm-Gg: AYBFou36wcCsYjba/VkuBraRh+9elVKHKcURmZi3vTIk2oVbjbRzOsIhA+B+yB0R+u9
	LVfLob84UpFqHnPACdJb5QaT0XpIAB5qlcTH3oN2+xlcE33huTJI2uTrph9UnRqSg0GbEFVX3fy
	HoEk3BseD+NyOcwHm5Yng/oNS8aw98cnAPogbLIsMv1bdx+rbHpHgtHKBxAzEFvmh3JtnQ4LB0w
	KDIkCP2xDaTcAw5rlB2vmSo8jHyMw7hgFUvFJls6pfwlaS8DyAuavUs1y2AUNard/RBmMeJYz0A
	QjSPyKrvyLT/GQMpR5muxZ8Ctox+EMukbYcIJYlPAFXJ8EL+uRP2TWVyV3maPB+8kniATHXgSXz
	/NT1xwzL/EqY0Uw==
X-Received: by 2002:a05:6102:3f0e:b0:7a1:f980:e93f with SMTP id ada2fe7eead31-7a55d796d12mr3921084137.27.1789992446881;
        Mon, 21 Sep 2026 05:07:26 -0700 (PDT)
X-Received: by 2002:a05:6102:3f0e:b0:7a1:f980:e93f with SMTP id ada2fe7eead31-7a55d796d12mr3920971137.27.1789992446153;
        Mon, 21 Sep 2026 05:07:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0eabfcsm233127095e9.3.2026.09.21.05.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:07:25 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:07:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 11/11] clk: qcom: apss-ipq5424: fix 'ipa' typos
Message-ID: <oez5n4yxcusxjuw5pt7gtqqa2drnvbvzhmpaau2s3rybwxdzr4@7qpaaeevdfzb>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-11-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-11-d242e3d49648@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab11e00 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=D9-gj5qkw8m8MH5a88kA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: ac1nvHDl8-ut1s8hOWf2r3niA91KFHnS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfXxaQvRsgBB56M
 Is11RuX7zt8M9PMlf4p1Ek1qk0fE2jgqyVarpk6na9Ffe5slNfHcHlrPbzgayg86mhGekri+UYd
 wES/QgQUrZLoAYeyhjXNGCOc6h/FSGA=
X-Proofpoint-GUID: ac1nvHDl8-ut1s8hOWf2r3niA91KFHnS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX1nLsBlehvAnO
 Y1VA/uo+lX0Dd3D5YQEfrcj8hKSLkymRVaLRCwpfb8UYFSyy5HDsFtcX5uQCtGYuwTTfrq7LIRb
 g4FHMS3vw5ixOUGP3c8DPQ/wedhb4PHxTq9zWhgzciGoeiRXi/xCFHzAYwBkYaefdmAovQwO3To
 sXImO3CeO6PdZIAWq2+C8+eI51GKv7tr2SjHfSpCD1IzFkdjTmwCBljGoYPezZBRiK28+Y71VTX
 lGbIWVNXjwLVUTHVHKhk2ljb2dgv2fHQ+F1NlIfjeXcG5Lq4c0va6q4fPLAlwNIE4pM6Lg/T+Fj
 /eQjsp8OdD/wYEnm7UVHMgHOlLtxRuYtFiPQFF4geY1+bTkLCNEgRErtIrr8n7jxLvDiOPkBPCU
 0M/V1aYCAOrnI/z7SS50RP0xOlA12Xe5xDu3VmyeQUmP0uWc98DT/TXAFvmyVPJ6IVxJwAffgUr
 oBAE7AHf5CcRTFdzHIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210175

On 26-09-21 11:49:44, Kathiravan Thirumoorthy wrote:
> Replace incorrect occurrences of "ipa" with "ipq".
> 
> Compile-tested only.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
