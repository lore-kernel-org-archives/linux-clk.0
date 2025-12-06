Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9BA224AF2
	for <linux-clk@vger.kernel.org>; Sat,  6 Dec 2025 04:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764993768; cv=none; b=RZxIAByJiB1gEo0ziS4Dme88gGOll0DkWOnHXJ5vTT+2xJbLcaOCaUs72Zt4NDQg8Rvjl7mDE2HcAA+JBc7bWHwDuS6T51r5HCkaoNnH5HooBQhE9OEPZ/fMS+CYnFkUyChAcOI07X4TnYaXjmkYXwS4OXCNqrV74pvFlu1841k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764993768; c=relaxed/simple;
	bh=tBPnMtc3g0jZpnIRmwgSGMioAEP4R4vs984Q4Zp0lU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWTjlesFiNNFnaUVmyGE7NJ/tiJOLJo216hn12TRUxyNNW/4JaRfEfxGoOx1g1aPf7iI09VmltnZE/GDBMby39pzUmLZQDrVv6S+Y9dISrqimWoKnaVOxDQ+/6/g75tJJc2prhPUN796Z2lZXj1poJeKPn9tax9yIVWoAPFJ/Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QvNBqC0K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SE78luCe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QvNBqC0K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SE78luCe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B60JjNR2209588
	for <linux-clk@vger.kernel.org>; Sat, 6 Dec 2025 04:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3P8RhC3cRbNOP0rl/IbzhEB9
	y9tPULpHaaL6+mDsxHs=; b=QvNBqC0KzNzVPRU95PJPr/+qVS+YGanOuwTiCMlh
	oNdhNbqndg49Ir+MILtlOUzbpIhlCMEcU2YYd7MUtwRzPz0N3yYfFeefna6JWCHn
	kRbr0KCY13Ry0ypW1ZfqBIwq/DQQt4DmbbRUBCd89MrlxnS2LoLRGQwE9rCI7+l1
	MohM4M3qnwoV+m+Tu6eZl8nKCDjmQ09XDy6kFelvGxdcWWtLhLP66zbkVKu7L8FR
	AoNIbJfm84kO8y9a63fiZi/pqFVs1aw973SwL+cmPgXnrL8swf1HLDkYo8lN7mul
	3/nKlOUpjyyA8lBo9gimL9fhB+0MUymrSqQYYCtwQD5jYw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av9uprb8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 06 Dec 2025 04:02:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b24a25cff5so589511485a.2
        for <linux-clk@vger.kernel.org>; Fri, 05 Dec 2025 20:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764993764; x=1765598564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3P8RhC3cRbNOP0rl/IbzhEB9y9tPULpHaaL6+mDsxHs=;
        b=SE78luCetICliDbAdDANCRLnyGdDR+KvrRhcqEv0697FXZDKZTrbghQ4QL7xO0CbCR
         WjMshz1/sdeaaokKNMfqIQDieGbWQMnQIqua06r67LF5HsvJMKlC8QfaGNOUF75O+NUa
         jVzrVffG7/JyO2A8OZ1kJYAWg+zwlZoJEhJhC7u383JU3WuOzOYAGrhYRKfMHDiQ0nWJ
         QQD6WFdAJvILmVhsGubYxMgasvoWtpvNuERe0emkrE+mq6RKbk+3RM+lkxjJfn9UxYjS
         Ac9kj54wJcnfYjms8Sjoue/VtOhE8Tf6Lj/+73ULQ7EcRi086nfp+PqdwGSmQM7toPDJ
         CXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764993764; x=1765598564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3P8RhC3cRbNOP0rl/IbzhEB9y9tPULpHaaL6+mDsxHs=;
        b=EzotNYh6u77Q3XnZgFCc9uWYv5Xa+lnKUSa9G2mX5Vze4Y/mnaRkRxAeBzn8NG5zqk
         5eMMLmoA9YCjILVWkRfB7Q3/3DpKFs7zxbnyUhWhQ6yJMjYXSlg5vo6nvKn5G2ryzhph
         feDE2iqaQczSQwml0aqlwjzVJmb2BNvAnLNUMOmvyUhpI4Eud9ZO4mQCxYxN86w3gIao
         tkHrutfV2CIl9qsFudrYDBHkLDEH0Nryya33qMTgN3Q1LUjQXsuQwz8hfmrdrw9rpr+c
         yl0MBsbOTS85ac5OdKK9pC2QzNLVa+1Q/jt/JcyDRzBSwKrlQ9KRieMMf6v7ppXlgaKS
         DF1A==
X-Forwarded-Encrypted: i=1; AJvYcCW98vgNZVpnxEyq4exhW1E4IvaB63r9ir7HmBS4AnUZcaRUVQRCF4YPQKF0nqSR6M+dRtzO3COGjA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQenAmOiQuQWsHr8/KuFQQQtnI3VzDPieawRAaWCw3uY6Dql3m
	lW88eNZpEXoxE83D56Ess8IM9uQtsESMpOhuzG5d/MigRGYl/qnKjXoVDL8ZdWpgYT+TKuOFLbp
	SXBAXV/35aRplmz/ak+4DQiR1/Zpx/3SA2RwW1XuJb3CO5vE05Va0/QDwg8/9IRk=
X-Gm-Gg: ASbGncsLyef18+AfRiklTTxTX21WMp1rSNAcAyb5m4RErqsmumtaml54gnrSd73bnjI
	gL+XoXT4vsuENvlJVeR/xaqb0UFdfzWyomSAWww4oIQ9pVREAgpNDq9ilavsojz27gMOiBggndi
	WLfVpzT4VQXARV6zligSTxD3bCu4PBf6zc8LtCCzzUxsnnfnDCDRW0avGN1A14DpshiCFAKR58d
	viv2uDaxugw8FLtB1lzzote9gEDIu71YaGSFQZFPYfNw/KLPf2yDf3w13bI1LyigfRvKsfIXuh4
	7FI4SRaWU+i3V+urnX3eCETAxOOD/fhD0HmLGVH2iy9f73mKOL/94ZVw1Dsqnn1AH/7rIUDkCZY
	WYTLwwUPX6wm7Zkq6b8JydWKTINlxmYgXZjV3ReCentTGO6YBcqWDfkEK4vb9knbkRHTT4O4PXC
	j2DlyUeDSEMcSKpBy1H9AxoTs=
X-Received: by 2002:a05:620a:4726:b0:8b2:7777:f662 with SMTP id af79cd13be357-8b6a2589ac8mr201824785a.64.1764993763777;
        Fri, 05 Dec 2025 20:02:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtdPTmuravVRhlZz8xV1WEVwbBUkAkyhjwHvpt7kRJcvSdxAlEvy5G47mBX7coj0tQB1w6+A==
X-Received: by 2002:a05:620a:4726:b0:8b2:7777:f662 with SMTP id af79cd13be357-8b6a2589ac8mr201821985a.64.1764993763272;
        Fri, 05 Dec 2025 20:02:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e6fe6bb67sm19293071fa.6.2025.12.05.20.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 20:02:41 -0800 (PST)
Date: Sat, 6 Dec 2025 06:02:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] clk: qcom: camcc: Add camera clock controller driver
 for SM8750 SoC
Message-ID: <mcvwms5logao4sz2o4h5yfyi7kloj7pkx5qzq7byvtcmhbymnk@ynegs32kkxyw>
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
 <20251202-sm8750_camcc-v1-3-b3f7ef6723f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-sm8750_camcc-v1-3-b3f7ef6723f1@oss.qualcomm.com>
X-Proofpoint-GUID: w7rj9esALCb9VCiCEc8PxHhGEMZnbpGR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyOSBTYWx0ZWRfX2RHqKKDnQnUl
 8fTW0kN7Mcrr11XCaWvbx8W3o1o+4NQyrq+7dEUBqqgznhV90VOuaHGCyrfcvcV4Y0muT8heg9h
 38TlmeIMBCdX87/1SMcKWnOQcD1xbaOLJ7dwUF3zChAD1EzCvECZLA1s1UdGKrOADoB6bJuimBC
 EeWIz6+ttzZfPTpiolNCNkJTGdBNDfFUC9bi3BTjehVdhHNyRD8N9NBWX9kR4eHPsoP+rkDOgh4
 Hg/cUadcGH2vyf6HjkHr9BI7193xbCpiqtCBpQvMon25+InfLANLc7Vz41TihKFDlPQeOuXGFOP
 atcEy/4DUbLs3FxO3gvfUEely5MIqr3StMsLaBAUvuXwrCi1liEA7egD5TbWrNW1CbFWWtvD0fm
 YRejSmR6EzBROadTQszGZpN8w1GTdQ==
X-Proofpoint-ORIG-GUID: w7rj9esALCb9VCiCEc8PxHhGEMZnbpGR
X-Authority-Analysis: v=2.4 cv=NsHcssdJ c=1 sm=1 tr=0 ts=6933aae4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_j3VNrtD_Kzz85i8SO4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060029

On Tue, Dec 02, 2025 at 03:56:27PM +0530, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the SM8750
> platform.
> 
> The CAMCC block on SM8750 includes both the primary camera clock
> controller and the Camera BIST clock controller, which provides the
> functional MCLK required for camera operations.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig                |   10 +
>  drivers/clk/qcom/Makefile               |    1 +
>  drivers/clk/qcom/cambistmclkcc-sm8750.c |  454 ++++++
>  drivers/clk/qcom/camcc-sm8750.c         | 2710 +++++++++++++++++++++++++++++++
>  4 files changed, 3175 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
