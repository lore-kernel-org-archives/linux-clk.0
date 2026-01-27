Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB7B3624B9
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 17:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533829; cv=none; b=NLCu4QFvPQrnH4MJbZKTgctsPrlnLBqs1zSvsxWiA5U8uXeDwsmEdCdfRcscYtOU/52PzjHamnwbNc27tGMKhVJHHUutA3/Ovj/Ajilt9gob43u9mAYfqeoetmQVkIa/DlfEmK7imNMpOP4cSn6VHScFOjr+ua7mgoZjmsSu/CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533829; c=relaxed/simple;
	bh=2t1Vf6UpwTpD+0yC35m+4bzwOPrmuwtJstpwaHE5UVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/0QiTZ3RRyFV6vUJ1JemLxEOY9CbEDoXA+5WnRU1dnWTjDHhkAXuqAPfQqlSf/gbDe8Ekv+uhpIA2+/8pUTlesh5qz7ZSFNCijQiuICtc0g/uMoYFhh1/ZpxHBig4utG0VYva6k77iDj4kbF6XLP0lpOkfHwdbHz4RsVR2T+L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6n2kADB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCrXuTsD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6n2kADB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCrXuTsD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RH5jLr171374
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 17:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/yMpzSpDxVs8Dh/5bLKNN0uh
	ExC8+G7Y0mffS21qSd4=; b=K6n2kADBvWEbbY3qfHQzc3TXO6nTFmIANR6lkle1
	som8Zx9h8VUNn8nT/CDgUBEf3qBqw9lUmBikghudNIvEHhlOKndEwPFz0/yzmdGG
	Gnwgthf5phgSjsqOzKDgK3abjT/eCjWyzBAOKLpkp0NWKjw3LuDQqkdQdhMtCbCx
	j7BAz5VsWZFWNg3L1eeRx9YXCz+mus+v+BuU5KBDD6bwhzSQwNqyHGUZA6nIeo6x
	1W6z5YWTt95LkQJUCuTqd73Z43fhcsmfGkLbodwmpzgBeCPY+EL3LB+hH+t5xW+I
	CkFAbT6mCmROKovjoc6My9LO9ai4nXT/vWd6Y1XerXml5Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a3spk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 17:10:27 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5f5492d5959so16747141137.2
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 09:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769533826; x=1770138626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/yMpzSpDxVs8Dh/5bLKNN0uhExC8+G7Y0mffS21qSd4=;
        b=WCrXuTsDzZTZr18/Tzga8rXgKDH20EMd8dLfFmeFH7VhT1sRcYnF7w6o+iJJkyEpn9
         1vnhzY8P4FXQnqkxt/7DEPqYdu1oqPIK6R5bHC7EIRyuUOAWu+o7+D2wLqNb6EbloJhW
         BATys/j2V/ROkWlA+4XC9Z57lgcclzpCkL9tUYnN5Pea1VqgL+92MgT3mYPnF/QQdUZ6
         oR3+dvmYgxIuRbfdGx3Cy0hCmeQzKANOSqEQ01XGLANGBEcUlKU0ai6dpjrn2YNfYlaP
         XyjN6A9bX2TdI4by4oIrn2APnWspUk55b9ORRTB6c4RJj1vKDQaXdMRWw/R5vH58uN3e
         geOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769533826; x=1770138626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yMpzSpDxVs8Dh/5bLKNN0uhExC8+G7Y0mffS21qSd4=;
        b=EMwad7KNVhAyx08B25JQpYoor90a19LV1S62ilGn4PSXwKcIJaJWakXBrwN7gJeSOq
         1xuLBWq+WNAZDjOSU6ymkc4kFWGtyYaIjNUm/B6/xqSTMLIctjSNg9RTuORX91RlC1Cl
         1bXgCqn8BDUtbanpDKvi2mv6txpt1eO8s1awABFbiVndmVgBw5z44oc5faK8TpBXs2KH
         7LqnETWcIAlYsEpSiQozxWc2IZw/xF1vUv33sPw9URJ0tYVDzAg9e9WIIGeQyjc7VlPt
         01VY7ZjTSLtQuTFopnZs1GiAKFnrplfNoislJNDltAv/Qj9aBzB+cktOWxw7yJbygTZB
         Ag1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYWUgOROD1tHjz2tw7QvQj6cUhtw/94+Ws1sUV8d27i6+dsD0CHRtucqa7nhOPJbR7djAT65L5SDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqVMWhlCGE9xvk5zNT4l6z4BULmJ04ux7LRuyBk6qRb01MUgXA
	X8seNm8UwXZ5KAXyv6wkyq69ACuxGu88VeuY/CPzQ7VMgO7+p4QgY++2PN0KaOqwFKAvdR7U79L
	9rDauKr28RnNAOQHy/bofMxFDkInGTsk4bpLw6LUuPCOa7Ghoao/Y7syppJg4JAaZvzWH+QM=
X-Gm-Gg: AZuq6aJaknfGigCsovebg7TorWeAY7S1b4OG5o83xmwXrZ/Oa7n0XlPkrydn8nVQN36
	NkagHht6sl15frjlo+r5H6c+/Egku3LV+IuRyaQson7u41Yoiw2BpXEvUKx9Q8odGgiSkPiAqvh
	zG0VIuaAL7mQJZrasz6S0hWNoQFr0GmF3AnJUgGvfC9EZEAreKpFSqYV+16D4wFZT/V5mwOZCCc
	x0cMWEwLNedP31EwIGgFG0yWlRAd0rvgwn+vlOFMoauQeRtvjzndVFI47nvIG+EvPdky879zUxW
	V58Aruyj40mIeLvvkkJFAGOhOZg/uKRk4sQTE8bU9VYc7AFXa+W+EL5wNhuhFz7gbA0GJ5cR1ch
	mYKcS5xah+KDljDO7Xe8CEnk3Q/QrG7E9DPzaPR+LbPxq1wIxf7RCrtmAPMujtjfC/ggRQVMm5M
	qMt7xL54WAL6zwNvnbMt1AeQY=
X-Received: by 2002:a05:6102:2911:b0:5f5:2b1c:7551 with SMTP id ada2fe7eead31-5f7236f8f1emr1322129137.19.1769533826127;
        Tue, 27 Jan 2026 09:10:26 -0800 (PST)
X-Received: by 2002:a05:6102:2911:b0:5f5:2b1c:7551 with SMTP id ada2fe7eead31-5f7236f8f1emr1322121137.19.1769533825707;
        Tue, 27 Jan 2026 09:10:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bdca0sm49577e87.94.2026.01.27.09.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 09:10:24 -0800 (PST)
Date: Tue, 27 Jan 2026 19:10:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] clk: qcom: Add support for Global clock
 controller on Eliza
Message-ID: <snwge2tfgbn5l7nvaez5v6h334hfhsaeh2piz56zuponxkxypo@73ar5opadfjb>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-5-ccee9438b5c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-eliza-clocks-v2-5-ccee9438b5c8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE0MCBTYWx0ZWRfXyFaKKGRxxhrL
 8DIPbUyXeTFZY2txIHzqnWVKfdSHKJCVCbon0kufpLppEM7H8jm8nM1gXwrTz4pKXOPv0pJ84H1
 FKAZffLFUJdKrECPf3DVVLK7WmFTyX4qtClat6g49b1qLvuM/Ujj9pyn9AhM+vt5CUFIa7NTS9Q
 TCVGR5+iLKuPh7KRD8wzmpLRxxAOCbJhauiBwfi3kG7oUUGbGCkUxdBAMc1MYJK1qJHPR+DoExO
 Med506zCt69KSWKrPKdQf1WL4ZxoZSSUaf/ROR2q8R47Q1B+BkH+nn+kVeVcvrRBLwY+H+6RpQv
 fhnmB1Nl+zptUt/1r+qKRfZ9ghWpyQ4Zn2kA0vkW9vLH6XrbsBMt/rWzEP2r/IcYMiz+43Dh1EX
 wGJweMEwISthevfQ7YKmo3r+dfaz2Lerf5OIrxWV9DmCUQzGHF/ZR7iV0NLpQLTIX9Qys6OBxMZ
 IgyMQubo3fBExuGzXdw==
X-Proofpoint-ORIG-GUID: JpN09uCafm5G_s2nK_JLcZtmPvlzXBR4
X-Proofpoint-GUID: JpN09uCafm5G_s2nK_JLcZtmPvlzXBR4
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=6978f183 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=F7eGajQwVCTwq7oO_cwA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270140

On Tue, Jan 27, 2026 at 05:03:23PM +0200, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add support for Global clock controller for Eliza Qualcomm SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig     |    9 +
>  drivers/clk/qcom/Makefile    |    1 +
>  drivers/clk/qcom/gcc-eliza.c | 3160 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 3170 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
