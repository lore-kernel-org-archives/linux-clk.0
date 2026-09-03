Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBA84A64ED
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440941; cv=none; b=akCKTEAdOdZY3xzeiWUz6o8+acEdL/HERasrJOLg35+oVKjhjvYdSHIxJlJw6GF4etPLVmASBF48aJwVMsEFCccGwlORjLzJZ/kPkzjv6LVnOx1feKkR1kv6Vt0ryegtARO4IiYCtTF9cmT+a3PsS6kgrmNm+HaxNvT5+hTymwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440941; c=relaxed/simple;
	bh=0GNg5kNgdHCE15KqkJAlxX5Kp69YoSsja79z/yO/14s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhGerrlcxMnl5/5pcccfBNORsTdSF50uVRfMHLb0LimUWMqc22yrH8EA3d4PgaCPCS2U9959Ao+TPAVmgOpYOqLzhs7g+3bRaHHSFAb2l2BKcK+yyqGCu0boR/Q1rvnzqOhBpYXwxCcxks/Jg3u02nHCtCc3AwVuziyftwkaOJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gk4ZiBiT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jmWBPbp8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gk4ZiBiT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jmWBPbp8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHA2T3782252
	for <linux-clk@vger.kernel.org>; Thu, 3 Sep 2026 13:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MWX3d+A3BnrdLFd0D2QxHQ4n
	ulGF3MsjnE+YJcGXOU8=; b=Gk4ZiBiT9wgXhuMnHb1OgXF57PznehxaD02w1v1A
	XZhjVvCqZZi9B32QdtERlLsOMynKVy34Q5BOeFQvU98Jam8nYOHasklRTojS6KRe
	s1aKyDE1VN/7JhTXTjjNY7nHBBedxJH9DG9hc6k5k4HhpnLH5MU2fWIg4rLRmTOH
	TKyFDBC+GrY7vcu1NhB9p8znn5IyIppldIHA+g0HkUmR2h4ZuceCnTqYVozRacxr
	uBa7afmUaFm8gM/kKj3aQkoL9Gdn+0Dq07bmMl52SCQPOfzIG78HvKgzsiaG+Rx8
	jNt/RXiNsaerQVzI2WcJT6Lq8E4zeiy3GpqCKWXTyXAS6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pds0k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 13:08:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so441673885a.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 06:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440922; x=1789045722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MWX3d+A3BnrdLFd0D2QxHQ4nulGF3MsjnE+YJcGXOU8=;
        b=jmWBPbp8iiT1S7kN9NgOFnr9/KzH8WWdXs93eo5wzhHL0bA6awxNJy3gg5EocKKhjE
         seorpy95tD9xUWPhtJGF974UF3l0HlAi+/QTYt7qBWB2vFbCO+Yr7hRRTxF18z5fZg12
         VcV2QilAmhKnolbyOsU02bczHXJuePUPQMfZ/yjGE92LOsP/rYtvXv7HZ48B6ToXH15F
         hMVrV8JzQ+DrcqiyPbbPkUuE6E0RHARJ7ljahxFed/WjSFA6zB5ecEskUoIfQQ2xIehq
         euYLWTVHVI3mauv7Pywm7GhfOmv+s6N4ZSYeAHzgi9adK1LId+pQ5RTc6E6FKnD3l9vZ
         UFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440922; x=1789045722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWX3d+A3BnrdLFd0D2QxHQ4nulGF3MsjnE+YJcGXOU8=;
        b=ksaSuEPxndyHmi6iY2EXF5rzbweQLycO8aZmwGrEq3DP+1TWGbch+tmOl+4/OcYhjk
         3k0cM6YBMKq0V2+VzW8lKBzUi5aE92Bp+nuoqc1B2qlC7bmz46dmfoQ+7LNqR0hXsi8r
         T1081AEriSjeAN4FI0UwvhclnCprThAAXMe3p96taUy05/782VE8kZU3h75HnNwJU9WX
         lK8YoX1bICBl7dgTe2krVPWhrd3RHLax2u61RdlZ8U4UkiRtpRgaxAp+iQ0RIQSloLzD
         HfsagN7SB8u5iLZKw4XbanBgjlbQ2f1qYoGFj5dc2d8LKCgHP+Yjq+GZFHEx39S+jwkF
         3wvg==
X-Forwarded-Encrypted: i=1; AKwUvBwH0SdV4hivSgHw+uH92Tt6tyWQuVNi7YzZy7uEsWkJd5InCkCBzP0bxk4FsDejAfpuKkftSuqOM8k=@vger.kernel.org
X-Gm-Message-State: AFuF++nkF+s0O/OgZMSbxq/xBw9/utYq+VBKWtda6DprZNmf4hlXY93B
	kbxljDrTM/BMVyGaHSgPKMP0ldqGpuWb/RveTPbjN00nImuZU98SJS4E+vvfmD2b9YW/IkZMMzQ
	IfMv6dcSCIMdqI37jhDBqM/C8TutRpocXKWo2W93ZHxIXNsUt22SnmN/hxHlqaSM=
X-Gm-Gg: AYBFou38PUGoG57izM4JFr3wKlFkuj3KRftHD/RXDQZNas5MyGwf4DDBE3Sou0dHRor
	aWwvnsyNkOKKAx8YAtDjEXpvH6MaLZ6C436zoLcyXV7N4r6W0rtTTbcEy3+OcJgBI0by3as23V9
	aebZpP0xayYIR1CQBiIXdNwzzsywrzowol4j+h8soipx0x3Da9IYVWlaNSwM194yCHdU9uufsrQ
	cL7OBttU8R98wQy/4rg1rSvwjWk6py5FPDgqdUpE8VGT6UlMbPH91xMlGi4GS7C1GrctY2ty4tY
	jsaia8kQTdc3E5/kufUngr8cCab8ZpGa3HLnrEVNj5Q6VloKvFQJg0mlLZA7eYR/0xoHCZF/zkt
	G4a+4gCMn2H0J
X-Received: by 2002:a05:620a:28c5:b0:939:6db3:6cad with SMTP id af79cd13be357-9396db36cdemr725606885a.12.1788440921709;
        Thu, 03 Sep 2026 06:08:41 -0700 (PDT)
X-Received: by 2002:a05:620a:28c5:b0:939:6db3:6cad with SMTP id af79cd13be357-9396db36cdemr725576585a.12.1788440920416;
        Thu, 03 Sep 2026 06:08:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea468sm14540106f8f.26.2026.09.03.06.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:08:39 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:08:37 +0300
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
Subject: Re: [PATCH v3 08/12] clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock
 support
Message-ID: <mdfw522n23py36txjtsesi3pkfhqljlkrabturbjumsdkeg5eg@h62ob3bxsa3b>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-8-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-8-21c3db378611@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX1g7+c6+AlaAS
 x/EQ8LMasMJTN60/ELjugnag5IPR2F/oSsB8RqjYYfDtHRyyzR++FKLIAV4Nj04IUDNyuQj4JwN
 6OSNQTlldt/vO1cNoItLZspPJklVwIA=
X-Proofpoint-ORIG-GUID: AmuugfgifytInyTDWSDMG7UBnleg5XLm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX7+ITiqXA3yIv
 nYNwrFw00e+J78ZFZjOY2pvThbZ/ZD24Q3u0q4yvOI47KAkchvMpV5gH/9QIMRNbx7qB9pp03QE
 EgSymWj1H8r7wtSyu2IbH8sdnVyP0RsdahzoL113PS2amfk0ODhIAQhYLTHBzXP3HGHfGzGBN35
 0Z01BdOEKVUTZpxbfYD/rcEWfCu3WE8/vTRZJO/XXryikyDuMmG8r6tENvHhRbpaa0Sz4C6j8ta
 JuqcYozUtJimh1kjoFziWGvCU3RQhFtXa3lXgBO1uTitffhISGVNqGXYgwD4LvB1PANL3WVE62h
 FORCMQmPbGovVPom8hDHdiV9a8KKM1K15DYLjlawOt/QUOEmig19leAVpQVuI+qxJqeJgTJ7FZL
 NJD+ZSr4B8GsMZxeTot6DWLgy0uFNuvFdr0WioWZ3KTS08K02QYSZ3BoM0aonwZ54Jbm+R/RMlW
 wX3biUcw8NUbA9ah+kA==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a99715a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=g6LbhwNr6PFK3GcEcCIA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: AmuugfgifytInyTDWSDMG7UBnleg5XLm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 26-08-14 05:48:18, Luo Jie wrote:
> The EPHY-RAW clock is an IPQ5210-specific output from the CMN PLL that
> provides the raw reference clock to the SoC-integrated Ethernet PHY
> (EPHY), which supports up to 2.5G link speed. The output frequency is
> selected via bit 10 (CMN_PLL_GEPHY_312P5M_125M_SEL) of the
> CMN_PLL_PON_CONFIG register:
> 
> - 0: 125 MHz   - for 1G/100M/10M link speed
> - 1: 312.5 MHz - for 2.5G link speed
> 
> Parent it on cmn_pll_div2, like the rest of IPQ5210's output clocks,
> for clock-tree consistency. This is functionally identical: the
> output rate is purely register-bit-selected and never depends on the
> parent rate.

So it is not a slice of the cmn_pll_div2 then. What is the actual source
of it then, in HW?
