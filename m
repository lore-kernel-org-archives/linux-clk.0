Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706D4306B11
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 17:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400852; cv=none; b=lheJVG3UkCpYdzf1vzMPQ3zaqIBMOHmYGvtdkGjHI6O44CLTGvPo1WExFEJn8mW4NENt8KhrSTNVzeE5yjpoFFRSJnt02v2z0TKiwUMrwiyfVgrFIP9UkHelEglAH23z4xvGRe0+/CLlRmCljhAQooq7vUdwUa3P9xU9hndxpWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400852; c=relaxed/simple;
	bh=8yj2NWFfiUq9ClohcuciNWOuCOUl6JST1j0gXENO/AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roNhGOh1fLOS8RJoTWZHbXH+YGBWpT9pp1XsugahUgc4BxqdMuSxK8ZWOM/+/jcnRSmyI/JmVc1Kw8kjb+KKo2SQZSerMNl7CDd9Vz/ghUR6TGSU1zk2LEgouHXoryZHMZUYFGTGOYUSxekVMUoS9jxFV+CQkOPdfq4baDZLsmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IiFnFGQi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bcIHR9T+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiFnFGQi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bcIHR9T+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHHVBPS3571889
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 17:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXNAWs0veNCMpMF1G9AV8di1rEToHqTDD5YFdaqlwMY=; b=IiFnFGQiywBZpVzs
	cA4sjNYEfFHU1KqqTSyEeg4BX6I2X+BjALicNIdF0IQMPTIc6eLzW/m9lgFbs4iT
	FFNNBGHlsGq5i1yD/8/PrP6T7o5toASfVM7OmXet2GTofzxmDuWs7A41KaAo+x2w
	QuuztsEizKzPj2W1TNAXMzmn8WXUWEN1ljG1gAgl56BgWveuCaKaxtRiQ3Mc2qao
	N2pR1Ev171k5VKcG91kh/Ljshw31hQU4f6/WOa/84sLeQKJYG74J8XCBQYjrOw9J
	vY7dLlsZvyLoWPPAT6D4heRd76onfKj5FAI14ovpPyTJbsNo4qzuszfX7/6BOv/z
	JTlzTw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1rbs97s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 17:34:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed7591799eso135792901cf.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 09:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763400849; x=1764005649; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MXNAWs0veNCMpMF1G9AV8di1rEToHqTDD5YFdaqlwMY=;
        b=bcIHR9T+MfQo3ZpH0VmGyrlGI9Wl10wCUEH27Gp47Ea9S1hFW1fne5NhDZOkAggnkr
         W2Xt4mXrpS1+9OdoS+GQHbxrjj4+0HzhzL0n/q1WorHh5jtzT9a3N43ell50Txc6jRDN
         VfgOWLIBU6T5lcRN6YcQfTkbQSZANUQnAONNF9mZCPGvTshSiJcHCtOy8GFP4kyWJUgC
         qdTvmwnWnZoKSNhcmbxJ3bGMw0uqsZkYwBAaEhpvjCZgcO8lysSIdzGcPvy7DItLPTGo
         A9Sa1/LuGgqPMX83fuqyH915uDDuFwS2zIi5wJnr/7mHcOm4cjguXiGyWTFDixxOzd4/
         B4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400849; x=1764005649;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXNAWs0veNCMpMF1G9AV8di1rEToHqTDD5YFdaqlwMY=;
        b=eBHbKr7hGRmfM+kh+Il1o+UxBs2z5K7hr0QMLHzVwizEs7vidgtrCQN5TQBICeJTKI
         s4pJAomHTOLotrc9PXzZbnfevY0kHISqo+UK5pG5TXKfFKNf48qICEZ1GQ02XTC9kNcL
         59NkYCyczaTwYd02doL3uirp8L8Sb6uYAuFBO1FVEytw5r4oiqerW8x8WgSGmSVPYs88
         9Pyr9Qvrqfye+pZTmSIhvXdDrC5ImAoORMKWlquniPceY2RrhC/lAWvEFmtNcX5Z8e3g
         Eu5oWm/pjx5aA6x313JLVKpWJin3OXUsK9VTcG4TfwprKf2EMo6h7eUK7G3t9pYXltG1
         3X0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtasX9LeA2RbZ++Sn2DWQGNUQd6zl+owQRISU1CQa/SAtaF0BncgsuhwYxLLXH3X09ePRv6qzCr60=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcayMVBhN+t8Ou7J9AuQOrWxsoVHF6hNtAWgv5BaZJDFnGzMcL
	AKEhCb8g75Hhk+Mh02tFaIhpooYCt23OLHQULcvsEc/+QyCzltcEQt5MNDiC1k48b5CgGiQYiC1
	FhIyBtIz/5gqLQvDJ+4ma+luWixtsK6usxVnaFmTuPjibV81EGZMvn41vWAiIdsU=
X-Gm-Gg: ASbGncuipqtTQbTqGezJC+HW+XvYk+VAfPolyiSRZRAwN4+oeQSVONQhXEXwrkNWc+J
	IPItAxvKJz0OZmsc6CXmtV0GUBTlx8XIh8v1yWV+stlViTJQXVoMuVxBFNXDU+8hIAk3JozH21o
	psrUjoG80nJUcaBKVOKRjBe5/UEj4bV2SDB/kNIAU80uFYsyzYGW2kPebraru8HHqeouL1hFd9V
	gS/nWmxMtBtQ4KSAF31t5Z1M6cxC8myjk1yoHr7eF2cYhJM5F42n0p/u2rjSDnXOFZpUhFj/PY8
	V5IIvIMtizXcNiTYCRVax48BnFOIZSk6c2YVPQLw3IZwMPh+/0ef9c4bILZj4I8vALetz2JVPx7
	p2T9FzKBtZgOaOA+ZGl++4YO5vl9pcFDwQ6JlUXw1BFD6NJveDQCCaNUQ3id9OwLEipN8yU4TmT
	ByiZE5m0MeSx4L
X-Received: by 2002:ac8:5884:0:b0:4ec:f940:4e55 with SMTP id d75a77b69052e-4edf20ecbc0mr167998981cf.47.1763400849444;
        Mon, 17 Nov 2025 09:34:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAKWaXR45cO/WcFecwUT8UxBmAFO4iHiLPBdjSKS6vZP63OaUJSPm9KsbV7g1BpJVj8ciMxg==
X-Received: by 2002:ac8:5884:0:b0:4ec:f940:4e55 with SMTP id d75a77b69052e-4edf20ecbc0mr167998641cf.47.1763400848951;
        Mon, 17 Nov 2025 09:34:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040595csm3307252e87.94.2025.11.17.09.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:34:08 -0800 (PST)
Date: Mon, 17 Nov 2025 19:34:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: msm8917: add reset for display
 subsystem
Message-ID: <h6lfgajogriesxnthxgz5ofikgwpkd4mh3aakxuzq52spgvxtx@t7d6hyujvxia>
References: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
 <20251117-mdss-resets-msm8917-msm8937-v2-3-a7e9bbdaac96@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117-mdss-resets-msm8917-msm8937-v2-3-a7e9bbdaac96@mainlining.org>
X-Proofpoint-GUID: ODo72req8LnhBSOBpAzv8C6zQLDncgP_
X-Proofpoint-ORIG-GUID: ODo72req8LnhBSOBpAzv8C6zQLDncgP_
X-Authority-Analysis: v=2.4 cv=FPAWBuos c=1 sm=1 tr=0 ts=691b5c92 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=4nVcwanjD9Et_E7zVfYA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE0OSBTYWx0ZWRfX0WWsvRioSDbB
 e5F0096Ke4/LJ20A8Orzn/w+XQ/nZ+EcXqUKPSvDSCoHC8dtr3TTUDL2vELFsow+gHDCZzmWPQn
 wSSv1GGfA6r7Cins7R/G5EmGdMHVrRH1zQw+RNaIMqm//pIj8eKFULXGPf09qaCbduL4z/tWbbM
 UiA8gP2IRDEk/mJpT80GGHzvXpKdWxrKgnLNsIEPEygwapV82XzQA1FYORgP9ZFWEZ/89agOA/N
 NUS/Hr27LTVhxIGYUev8vbB3ZJwXD5zDJ+P0ekhOAJOm3JPsBIudJJs5pBFOReLyXcJ9PYGeqgy
 Yc6WjncQdG3il/0ItH0SuKJkN6xPDQ1z/ERN5W60fLY3O/jNMEr8qO3sBU0D9Hg0Ercj4thLJnU
 mV7YoQioDeHpqyzUIW4bp918Pjgqmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170149

On Mon, Nov 17, 2025 at 06:17:54PM +0100, Barnabás Czémán wrote:
> Add reset for display subsystem.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8917.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
