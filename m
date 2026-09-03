Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A144A8A0B
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442070; cv=none; b=DzYBNgwfZPGO/+GOWbOHmx9/xg6EvZZ8VueWXBr/wMuQ8F41J7A4yT27eHeqaoz5C7P5/Wlq8/1n2N07/mhBDMAk2fyJ7txqizS309znc2Jx4dHs2g4ElOv2IsQyiapiJBJLuxIVBD2PfMIlYLJ0RIQfjBXqSdFE6iEm7z1Mi6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442070; c=relaxed/simple;
	bh=NCh13W8voqbqpBRjojfXEI4cZ+RsIKEu4Bx8jRwHtqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NIH25s6SL0u+kSLwZgLvU+oX58XQkH7RU4rjM+cVHCGYkQLBtAMxhTHmTP4Vglcwn/G6q50FyR36tNlX2piJo1ylWsQgyIley4jRCuiT0Clt31d4d4tbWhFi9jm1KxRO/TzCDBaoaGfk11CflamiWSfVsc+NdmsR71c8+WlNl+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDq7yuNR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJEgVqoa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDq7yuNR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dJEgVqoa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAPVw1040603
	for <linux-clk@vger.kernel.org>; Thu, 3 Sep 2026 13:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d3RaRG9uz14aExbdtz5RMduc
	WGOR/YOY//yVm2WHhY0=; b=FDq7yuNRsBxxCzfElqk2kfYKwBz3uzwKCQrlRQ2G
	FzSjynD8d8ryoTi39sinU9aqSVbK/zAOmU9cjgWdW4pe15ZTmGcd3NACrPKrEz+8
	GU5UAw46YaOfU1YZhI6R7mz6ESzEc+CbEaNooWe7XurqXz6BUiMmARYqA6OK/pws
	ww2XkvMZwmBAoQRAqbdpXd0ijDO6IMEob7cTH+JqJJ/XhX9kjfJolPws5DoR9wwC
	O02ZJd+liJ+wQRXC7kGK/shnvYe8XS1CrjYWVxsw48p615iREHbIY+SdwHZ9Eqzx
	p/7f6aEk6tb32OsFFzF/1umMkHsDpwF14lxaZOL9Z3XigQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4hyk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 13:27:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so442750785a.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 06:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788442057; x=1789046857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d3RaRG9uz14aExbdtz5RMducWGOR/YOY//yVm2WHhY0=;
        b=dJEgVqoappYJiarC+bvvATq5cWStRSUMBGMg3YTOu1tnZOQfzW4kDUkUq8GdGHXXyA
         L1jGXDBThZ9QXA6KNhqU24dmPVNL9e1zaXe2C5OoXlq6ieL/i60E4GGDXOUzZd3JTjx2
         QvRxBUMJ4DgSq/OTjZE8u6dzLP/SkkE28uWAJI4tcmOXdj0gBFvc6vEl3j5Qr8VOYYLR
         Euz4vBePKbYFW7OXlhgao98sWxsrLuipryRb2yBv7XLCdnLuFjIojV3UbN1No8kf+F9h
         ugBmvQcyaashh1+LH2BJil5fMHXiDg1cAYtMFBedgPF49Gd4WvMAck+Y+fpasKGVyF5S
         8spg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442057; x=1789046857;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3RaRG9uz14aExbdtz5RMducWGOR/YOY//yVm2WHhY0=;
        b=sU/2dI/fp40ELLHkjut4ME7azFuJqupFofHpknQNAGaVepvAE9WynJYOeni2/IGZfA
         2Q8nJmhxK1dISWOiwkIqKkx6KIxpGTaUc+zd/u6aYH4b8HkLxSzET5JWhcLGfe2RTaUg
         VxEzk0h0WLFTjgHVdS4i/MQZsU1Zk8HO8sVa1FIMGxznSovL7GVLZV90/j+DvXhTfBlH
         TOKsduGgvQlF9Fz2y/mo4dT2SBabugQRZBJ9820LZQpe59aMT9IUIHS5X5TyxhLrqi3t
         BZmfoHaHuKXpYJ5aR15DegTEgfozCDmOCCxCEG9M/iO1cbxBVPhM6jgwqHmTYiipQqeJ
         vvcw==
X-Forwarded-Encrypted: i=1; AKwUvBwiJDtA8XYTaAVsSwLV4ZAZriAte1ALm7P/yccDeO0+hB3HyXPKn6gFBUiDQGTDcPZqcM2vyXO6KrY=@vger.kernel.org
X-Gm-Message-State: AFuF++kzC85Jyz+9NBmIBb9M8aQhqjd56yTMK+Foufe/70Pr15rWkcqM
	uqmFwOxKwW+eLR1QrjBcZG0z5w2+lB/RZFzgadJspEj5xlxcoNNO/WqywN6TYftXfbTJevF6TH1
	kJOqFpE5COUVY2MIuDQlipjsh7ATq5g96aiQdcjaMek6ZKkhtX8/vLl5s/HOxjjI=
X-Gm-Gg: AYBFou1xblLZETFiLe2+/CxAXpzGmBH5rOY+rGez4XsSCur4GKbtFez2ZzcTjdapmM1
	BNacCesgZJGvgx0B7tOwoSCZMVDh4vJX3WfgoH3CaoVnomML9nyPtlDeADmXWpoqc+nN4d+CdMK
	bFYxeheYbDiAT9QQkuFmjfveI/swdapCn1Dm8d8lIbEKKgJl+qOjSqcZ5NBjxVTItPySx9GAoCX
	9F5XUx3hpL8+qvlBbveREOomMmKM3eXbXZvdLccJgyH/XlxnU11i6KGxTWA4+xcSG80/+oc0qpq
	BCNZ+7KLzNPsTfrsicw4qYdj7YQkLJH6TVaA3AGh/cCy4ycU3+1gCYbirOlMQABNLNXlP+8s7cF
	Hig+BkTAjJqbjOQ==
X-Received: by 2002:a05:620a:8f81:b0:934:aa56:45df with SMTP id af79cd13be357-9397dd0d431mr16737685a.11.1788442057330;
        Thu, 03 Sep 2026 06:27:37 -0700 (PDT)
X-Received: by 2002:a05:620a:8f81:b0:934:aa56:45df with SMTP id af79cd13be357-9397dd0d431mr16730585a.11.1788442056748;
        Thu, 03 Sep 2026 06:27:36 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed38cfsm12846442f8f.19.2026.09.03.06.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:27:35 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:27:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
Subject: Re: [PATCH v3 07/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
Message-ID: <unzsymxiequsolb4xfafhqun5wzhk274rxcjke7s432jiae76e@tphl57sv75m3>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-7-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-7-21c3db378611@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a9975ca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=oLdtaUtU7qxJmi1rbcYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: eUaSsWUi5w7lbfRm__a6EkPuD0rw9e4x
X-Proofpoint-ORIG-GUID: eUaSsWUi5w7lbfRm__a6EkPuD0rw9e4x
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExNyBTYWx0ZWRfX+RmkwsJyK6wH
 Rv7Y/MEsFe+rJXdrheEtjG5oI08iH2Y+WcpPA86WRDaNMxJpegeVyVupouVZ5jogj29rEim0g21
 EY5Qxt9jAacVU4eVsyieAaLAmXGiV0o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExNyBTYWx0ZWRfX1RFtFSxFg6Sj
 hNn/E778lKKbRpOS0iVWkqMWg5FSgi378ywDljw3e49UI2wqEjq9vM0XMEJRtPpKbE3LUtbRcTG
 bIMuNk8l1s6FzMj5/OsW00yL/NL2o6wvgE0JD/D82sQ8aVFvSqmlMu8wZNuM/yAJVoyx7qgeK1S
 1kSEwHOPd/RfrQQTbnCf1sUhZ1ZaYtVDDk6gI0vD5jRuJEYMnHZswv+Jrggjd8BPpSZKn7h9pGN
 JelVbHIDJ/n+TNGSc077UgOEDkhiuP9cKCzBqnFLHawYQo0yLp9657SHNbO7zA3i6xj1yNjxKMn
 9dvzx6CefwM9TfZTbsQB4TM3A/jzSiH3eIwrChxThcOkf71YDEeippW+edeiupxMc6mX+gcQfzF
 LQYyk+XuXVHxaBvyQMJucoKjWAOHGz9QgbwxkjpPFpQkyDnicE8LzaGIJ2Z3jGogPOOtj3j96ld
 VXsZH5r770Mejdjq3Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030117

On 26-08-14 05:48:17, Luo Jie wrote:
> The PON (Passive Optical Network) reference clock's parent is
> cmn_pll_div2 (CMN PLL rate / 2); it is then further divided by a
> configurable 8-bit divider (1-255). The clock supports two modes:
> 
> - UNIPHY mode (CMN_PLL_PON_MODE_SEL = 0): fixed 31.25 MHz output
> - PON mode   (CMN_PLL_PON_MODE_SEL = 1): parent_rate / divider
> 
> The clock output can be independently enabled and disabled via the
> CMN_PLL_PON_EN bit.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
