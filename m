Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440906;
	b=jOXAp9vuVQKFA3iGTq1VViqf+7YN0vs43pZm+dFlgyM2V0W5qCC2qbpvPT3vgAzM7a3j
	 8fy1QfhG+muQJJkYS3GShEVQveJUS92YNAucRvjjPsjUImdwEEcCVs+P1aY8yAWCvAUaM
	 nq5FfUAFWOmF9Faw7WWMiOYhj15YCqRRxDDA0oIDJAF2jnBF6ICJQRGWO1cvi/iWV3Aw0
	 e5krM+IJKy6BQn9igi0+O8gfhtMsE0hyDzn7PCwV5SVkZYPV2QpY7jrUPwACaFWNW8TC7
	 1aF2YdzTFBPxFFGKyf0hqgO7COeFJEPTO5NQMX60LNPE8uG19fLvzEl5fzrYE2WC3eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440906;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W4X+lIkpMnuBPXB5cEtedMsQlEel+NCp6hl7V/xtT3s=;
	b=30/fWUdbq/ZSK2WVgE7kgVVsbquIOGvuW18QqNmINCX9Dt/wxFHeXydc0pqloG9nqTn/
	 5+PDaVDKs0L5dXYfTfHorhFK/cLkfR4Af6h4qK3n/V16M46Zfz8n+x1QzTb4ewHucIYwG
	 DHy2+kSzKwgVxqGSeLzAR8Qj21hcc5dzf3JABprnjytgqw/I1EJUXXWN+usZpvblVDXZI
	 ImLFnt/ZpiBeERIdQ3ftc4FMpdHEJiq9AcyQYiughTuUO5HD6KJB7I5faUL0D8pzLkeuk
	 Ta0t81wuqvB+AJiXGCrVlLicAS8Yw7f6hMzTqQzYvK/ShlfybT5NBD6whz2g/vud+Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VEFaZBcv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hhkGzK6B;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72292606A32A
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 13:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72292606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VEFaZBcv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hhkGzK6B
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKp8A2369001
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 13:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W4X+lIkpMnuBPXB5cEtedMsQ
	lEel+NCp6hl7V/xtT3s=; b=VEFaZBcv6QGdGPm6O/xtuaSamAgwZMZvMl+7bE4H
	kMgAoM+nduS1Hxg0u3aC/Q3I4DawmUMY4gcm5indKy0X9c9vHvhenmPBCv2DMUMz
	yc2nPqgCe2QiA5lUXX7+eO8cad3MVuxjebjLtvafW9YoMz0kGBuERs8N/Jfin4bq
	gNbxlU2t1K6GypHjoywh11oJBj4AZxiIhPCAvnjNX4yUgSfT3JiXW5zTLYTu/oGw
	jEz0eL4k0C9AQXQqy43GriIh4PWHvisZEAjof5aTNIjRMS6KyqFVP4qritTfFctp
	KWzeXnAPVlTVpEVd6S4iZY68WHVGz/sesr6gdTh7ZSxRHw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p9hgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 13:35:05 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b50256700cso50813227b3.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 05:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795440904; x=1796045704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W4X+lIkpMnuBPXB5cEtedMsQlEel+NCp6hl7V/xtT3s=;
        b=hhkGzK6BXsmbaSYX5+Hcbi4s7pZ7AMQf8v6TJ/i9eXk9UMOkZIBM5Grj4hT6RQkBk7
         PRmzol2EC1MFVdKgwb3Qq+FPN3Yoaqst6q9YFW/Z1nF6nAlcT2K3Jkso6h737AyD/qzj
         uMz+MGtVx+8L/RXYHxySu5EKZ700RXpSj8rgLEVk4iXf9CDuxKYi+Rtl5sFwq9VjptO7
         DE4TSuDWeq8nsLNWqb7SiQvh2SOeZPPkR6eDV+7s7rJAsKcHPOITt8kjjQFFdN0ltNWq
         MJaOO/gWhYiE9OOYfAdm8YDH5TxE+b21vHzHQTDBssVPdvewinN9LbbnNFq2j/YesU6/
         ppiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440904; x=1796045704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4X+lIkpMnuBPXB5cEtedMsQlEel+NCp6hl7V/xtT3s=;
        b=C5bTu5WNncQ3+tVtHYuMCs+bedVr4funoEu8vgFPQIPSVR8sjaPDJFFx3e0bOd1AgR
         8Cw0DEeZJBmuh9fjRFQ22cwQeQlzmUEfeGJxK14Natdy58Saxb4VCZEOvH22BtK5u7mn
         c4K3/8H9Ykk6XPSGOCVxhhvzZjQO2pVc1ap8AvEL/hIOT0RN7c5c9KvO0YPfHrA+iLE/
         3qQaxIp4PvHi5MqHs85oOYWUs8Kl0GRPBQili4zosMBb00uWNV+ohK1sEaCwywb+bpkp
         1FGiCY7AvK/WZMZHhu/4jgAIPzEwlpkO218ipOXz5GXOFfloZRs395bRLbb+S4/b3q2Q
         2KMA==
X-Forwarded-Encrypted: i=1; AL+hErEATtMuliFaSAdIfaXp3dUgF01xDJ4Z8sIY5L0TUXHBXSo2/mveEif/yDwP8ephoCg2/DRyLt3w/4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Yc0wUgh6vJUeCtz4CPUQS/C7ZFqY/LIA2rcH8MqtF79FsxVAs
	UGWztx04r387zw0QkPWbiusuTCChPGxhNp5yRma/jfD7I4bkTWTGrPu5hQxSMSDwaIdoJ4/RMhK
	JMMZgVMcrom6lsnVZ63WE2gCMtLwHT8mQtFHOYlcj4zPedCW38cE1AKNwBE0U66s=
X-Gm-Gg: AZFdTZfs2yu9+w8lcoCQyEP0zA/H7RxvNcUNU9pLxGJ2eEqPB8Boi257ptIvBYtkyDv
	pr8ddXVc1jOvJKIpZYoZiTT8kHJ8vVkIh2ixuxr3OFSJ7uHVNa5jMhQypMSEs0m6AvGWlBdYEs9
	7K4e2hF5pYgAZAJayijB0a7Vxt0CiRL5+INWmcwZsG/a7egu3mcn7yrUsHC2Rku+uNkN5k2j/dZ
	L3JRcD+OXHslbQqFkxl1wGCLyoO7IVIhL7VMPVfnxhHBUTShCjZBV5/YBUb5sysId5L2v9PcfbQ
	760+zC6bZMAepm4IpLQ1etGw68tXaRHPJcRkjMsJVHC9+XNS73bOtLd12oI8LibFm31Nd3G+B2V
	aQ26mNSM0Ex80XHdpVakvK1nCevednnQ255gJ3QULao1KHImuCmIdU2ZA5dEpWH926lh8clacVl
	+rxO9ZSXXqjnkxo6CT
X-Received: by 2002:a05:690c:2a44:b0:8b2:edac:7a4c with SMTP id 00721157ae682-8b52042bedamr39514627b3.10.1795440904363;
        Mon, 23 Nov 2026 05:35:04 -0800 (PST)
X-Received: by 2002:a05:690c:2a44:b0:8b2:edac:7a4c with SMTP id 00721157ae682-8b52042bedamr39514537b3.10.1795440903970;
        Mon, 23 Nov 2026 05:35:03 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52030df7bsm46300587b3.31.2026.11.23.05.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:35:03 -0800 (PST)
Date: Mon, 23 Nov 2026 21:34:54 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
Message-ID: <awRA_lWAviFJj7oC@QCOM-aGQu4IUr3Y>
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
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
In-Reply-To: <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfX9qYCdFEPM65E
 6zBt1MLH62sSHwddPfb4nfSVXk9qhnFXZaCVHLlgpCu0D4aZnBfDcYhoSL2RNH2nBmZsguIOqBD
 EaO2gfsOEr9r/SjEMQvevNjWxp5SNJ9v6E779WkeXkviq1eiO+RM2eBL+j0ic8QK69YGPOcUUUa
 MTfJl3EI9dyKL4Ts7+zfzo+gI8AhZimh9J3XW3qvHNCvGa2sJGgYjz3p60ms0AVjV81ZVzCM5dI
 RyflsIbBEG59/ezKI1up63Uz5aLccT56gW0uQ/aY84faf91kNbcvIZc0Y69pSmDFLcW96NTVp+c
 yrpfm1FP7ZUvMWXK02KMK0+ucnPv0TC8nK5bqVNskrwXhRBYXT4Z+ofnNk4WtSVWNGX9tMC7ngU
 1qSdXIvJSP5FaVOQ8Fd/8gVaOzICL1HgM+g7M0AR7HfhLfupuLdEmAgZR2FuoY7Bmthx+1o6yrQ
 RPiKPS4hxQbHbU6s3lA==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b044109 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JVp1Gilkp8drtUWwDXwA:9 a=CjuIK1q_8ugA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: ghhyOcRiRQ39KF8IlTKTjt0-KPh6Po46
X-Proofpoint-ORIG-GUID: ghhyOcRiRQ39KF8IlTKTjt0-KPh6Po46
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfX9rJlD9untLH2
 ctGYqiaOJ/ijcXTr5MP4/o4Iel29qwxO8JWLDGvvPBpC47KtfBr9QfRwWhgr6d5iTjaqnHP8aFi
 0kpdOPkMFfViBjHC+xBeogo68ofo29Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230053

On Sun, Nov 22, 2026 at 06:46:21PM +0100, Krzysztof Kozlowski wrote:
> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
> currently used only in the socinfo.c driver.  There should no and there

Same typo as in patch 1.

> is no in-tree DTS user of these, so none of these constants are really
> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
> that part matches the concept behind DT bindings.
> 
> Driver have local copy of these defines, thus these can be dropped.

Nit: Drivers have local copies ...

Shawn

> This has no impact on in-tree ABI, but any outside users would be
> affected.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
