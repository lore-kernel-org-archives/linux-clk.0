Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499839;
	b=Na1wbZR29Kwz/Bcl81SwRHY8Qn6OWH1DrShNZSkKJjPBsihf+YsWK4zxmBBABeEXB6qe
	 e7MxJoCH0sgbc1i0DKSn7u4iH7H5gPY9MNEPFRtw1toCk5EY3ColmxtlrCnzaN5/mGiid
	 TqLNAvJN528XUUWvIwLVuTME8o/syls0nD+FYAVZXQnum8lV7F/2R51nXtvapv2oqFnAo
	 xOnv6A76LxC3hcpaIriVDJZH16jnxs/RX6fxo5K1BOSmHqZoYPK3ATBzaTRXT7FBrAZP+
	 /XLhJLFwaaMaRQmmU3MxaQ/BBrV7AuExIVXM9vQo9R7zmMCIk+ssYpUb0IOmMlPXNhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V9/5S0k+CnWnpz/HcX+zG/F9NBsY/HCPRA/q3uYgiUU=;
	b=0H0jWCRi+pRzooK+VIYFvhhausDqcwjZ32gJhQbUrAwDoA8aUCB1pwvaDc6M6dhXK/L4
	 oHoXGuGd1SVBuwJ/o8Byy02ZmOdk/W02kgUeEBagL4tDu2ZwbKHZwfsRk3lFv5Q+ohzWx
	 d32lVvK3GTouMG0+aIRnFjY/8l1N6pAS/rL2fBBsbqLGr/SOo69gDnaGxKILQbEOETs61
	 0zbIseO5V9S4PsGjM4vieCWkZkdChKuF89NF3zN4p1RCi/wGcUDNP9KE8NP66dnEssV6R
	 1ZNJl7K3f3jGMH66BFbJJd/yeDgDaAp4FjmRDMkfjvMkJUIxWTXmAgErnV10IetFQag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YyX/vk8w";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZ3PBRO6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7746606A31C
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 12:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7746606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YyX/vk8w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZ3PBRO6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KCNocS2197187
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 12:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V9/5S0k+CnWnpz/HcX+zG/F9
	NBsY/HCPRA/q3uYgiUU=; b=YyX/vk8wC1kHa9ETiDE14KStwzhsHnaxA9nuhlCy
	QxeEoRqD3VxV1KiNNtONMHSVnfLebHKFXQ60axbPnRXTjEOL8MQM44goE7PWKdjQ
	GRuT0shOvzwlOPuo3NAWdZjKeovgpxidjCzUpRaUF0QfhhZ30SEmFpaM69ZWk1Ct
	+pbNg2z6BNuDU42Qqa/pPOX7y5FAeyRQdwkfZz79Kva+oIbpB7g2N98/1MbehiRY
	DXTl8Dy+e2iZx1jIrrJTEScnZ49YjHKyo2WY9wot+Iu64mOxJrY+vcF0UZks7hy4
	EmUVaQw3qD71xKOFiaqjSCFP1OZpSZc1bYdo54O927hXng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pjfvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 12:37:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so129569985a.1
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 05:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792499835; x=1793104635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V9/5S0k+CnWnpz/HcX+zG/F9NBsY/HCPRA/q3uYgiUU=;
        b=VZ3PBRO6uSVr02WhAd1n/MfngZxWDxJ89lZPGiuA3Q58S87hSVXjnccNb4fBpwJxS+
         nK9SgAHW9ZRng0gY5r3sWBJcSLhZtFbs3lRaclzJneu558ZejdvyZeQWp0XGyaoF2XZD
         YSJc6wnKfmW+R1ZDzM9BWYJBjc4BkDrZj36RV9RNYSHoJA5dlQej7FRi3Stgzo5lOiZ5
         2bTcV8UsUPy5BCo5Jd5jigbV6ude4S4JP63FjMg4zP7hLEIXUhHgNWMiPslkJg5syw/I
         kcgw0BlKPZCvtQCeaXeHYeaN8Nt9aXEWzTez456KDUx9vqUCAJ0fozGXZiMOFKCuwTyl
         UN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499835; x=1793104635;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9/5S0k+CnWnpz/HcX+zG/F9NBsY/HCPRA/q3uYgiUU=;
        b=BloU6mnXiQgSG0Molu2AwB9pA7Vs+jJfzYYOnhp1OztLXbF69T0v+tZ8WlKKi/1JuJ
         fj9JnUhLsWzOZLpAAuFpsD89JaUDtjGvXYhOzJitPULx4Mbpi1+MPmaN+sEvjAI6TkpV
         MkAxjvueDaHwo4BDcRo8k2ceTt6lQvlCgNiZ6zKgyVGTjC3OF+Ou7fGfENNaCA96LT/w
         pwXVPdEgPHu+r1X4Id+r9NsQEp6O6un1kj3ikHFIw5nnEk2XNKg5SsCjPzySjAKzsXyP
         G7kujdAG9YBYzZD8fIAWZKNmlv96NWJRjcuZaI6IEdivA74ZwvLzXbKjcD/ykoUwuD9c
         iuTw==
X-Forwarded-Encrypted: i=1; AKwUvBzvp9f58lDp7FlRsbU5dBPONFrgX+LLkH9qF9biqFnS0npWLhtc+Z1TUslkq84cevzRNt7xVGo0uKA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwR9TrIxINBz35ajODr2jGeFwU6dKLRvcthcgOvJ3dPEwaTHk+
	tSmGgJliWNiFC9oogp2pIUyk502Q9xpmNZsf6c5oTCnG5f6MDi4BB1L3U+vsBpw/tIUNBWl1GVb
	HdRf5f+//ttzZNbVRr4BDLZTsAcJFD5fRG10+Ynqyh3slKrtj7b4pXxut01P5u7I=
X-Gm-Gg: AYBFou2fFG7lJwR5jmoFtW1fHZhGwEOZNFGzDVM2e6x/fcL1hV+vjjUA5opfY9xqoLF
	QHUGIR/Y/wq2ymK/xnYgmkgydXNN2MqnqLF9keOoGywUkSPeh439M+CUkCW5A3SCkBRhREPxCJK
	wzupuSAXHlXWlYP2fmKivSZupWZj5JXU9K7ENEcTNBc9qiJ8S8j0RuouIv440Fl/+oTCdld3Fhv
	wx/gkzRu2IJ4UyYw+tyGhOWd5O3k0E4Ix+2qGbKF4Lh3/rzoLMGPQdlnVfKT0vM22uBs3Nze1Yh
	Skr57vC39/Z1vHYJZfTRyUO4nPYuEu9IDOaB+Owdsi/4tVxn+djszMpOEetTRz3k7NXO6VptVFz
	dkL8MkBiGdAdJSLLQ
X-Received: by 2002:a05:620a:2788:b0:93c:891b:90f1 with SMTP id af79cd13be357-93f4c7882a9mr276510185a.26.1792499835005;
        Tue, 20 Oct 2026 05:37:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2788:b0:93c:891b:90f1 with SMTP id af79cd13be357-93f4c7882a9mr276505885a.26.1792499834370;
        Tue, 20 Oct 2026 05:37:14 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1e0632fcsm5146180f8f.0.2026.10.20.05.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:37:13 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:37:11 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: redducc <sushmit718@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to
 bi_tcxo
Message-ID: <2gpomabi43eos2aprz7red3m2cmdif5srdq2eg7c3o35pp3y44@cfhcrixurzs2>
References: <20261019161740.2384-1-sushmit718@gmail.com>
 <20261019161740.2384-2-sushmit718@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019161740.2384-2-sushmit718@gmail.com>
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad7607d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KyWEcasX42xTa70S7QMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: iNpEvThVfUVvGQ_tlbZK4djb1GonZU_k
X-Proofpoint-GUID: iNpEvThVfUVvGQ_tlbZK4djb1GonZU_k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfXyUlAxTclfiSN
 GSsEjsOvqH6yEHwpGf/Hs8nwK+DRiJSu8PUcWm3RoMvwqulmKgzRwevjLMPuw9bWLXinGxsh5Lq
 BDrvjZ3sL3Ql5EiqyX06wVPt36YyLlJvXlzD5r7wAsCsR2EeU0cW/aKiN64z484Y00cwm6TME6O
 wPM3OdAB4x9WXzkkAQbuyHn0WKndeuhde9K8DTzQH9QflpM4hrEPkxmVq2SvfQS+XlEg5fhc46O
 oXq/cEi1AIOZYuteiA49Vt9f7LhFSMEk0HwB89xI0mEDNwyN+blYoH08hFPR33b0RFUcjCnfNFu
 URYQUmRvuYDQ6KPPt34FMQ1XBZrdoO6RPwascKMxzgiKCAdWOVRFPoUfqxYi2AetUH6JZRSIjzV
 Eu2/f8gyGU60p86wZd9A2loDVScYeqnvwxnZX3nKyj/mfVRBrepZzQvjd993tkpz1bp0YXrKf8B
 neoKf3u/hJVKaln2dwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX5lGl+24czFGQ
 6Y+rc3r94JcIJubQWaZJ5h9MbcHcauCL7GYaaAmrLTWaFybNPu7Ug7O1jNtgKIs0gq9JaiU7sdf
 p+0JbV1qTMYk0unhSd//u/3F0yLBoY8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200050

On 26-10-19 16:17:38, redducc wrote:
> gcc_eusb3_0_clkref_en gates the XO reference to the eUSB2 PHY, but it
> has no parent, so its rate reads as 0. On SM8475 the SNPS eUSB2 PHY
> takes this clock as its reference and rejects a 0 Hz rate as
> unsupported, so USB doesn't probe.
> 
> Parent it to bi_tcxo, as tcsrcc-sm8550 does for its clkref branches.
> 
> Fixes: db0c944ee92b ("clk: qcom: Add clock driver for SM8450")
> Assisted-by: LLM
> Signed-off-by: redducc <sushmit718@gmail.com>

Full name here please.

See:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
