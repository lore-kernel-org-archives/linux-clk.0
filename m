Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BE94AE8BF
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 13:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441806; cv=none; b=MOTn0oWG7VylRbUk5g0wTuh58r6sLVbzxGaS1TrylAN+qxQ9cAIHlGo/XvAVPD7XXQhefcJtDXgzg/zgKCNaXhA01gifLzzJ5k8sGOp48qINyZGnZbI4ekVLxwD1/+RFVMIOEiR8kMwkT2JiH9alybKjMkAY+zj4FYGZ0vllNIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441806; c=relaxed/simple;
	bh=degx7nhJT2AUSifCshGpxZomdyz6i/wdqKZcuSCRLms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiabRcpROrva75aWDthdYzVday2gDDy6+u8eA4pFKI7zYSdMAfMw2bZc1iUCpijFk7wmwabHb7Tb6/vXWA0am9wRbWOTBGapDmM7DoRGwSI78ElH6tSIhmQ3BtV1Wj/3avZnAIeYTy5EKUR8k7+WWpdW3tHvi098G9iNddaJxWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sft/zSB0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gY3ZkVOh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sft/zSB0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gY3ZkVOh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAFH41705061
	for <linux-clk@vger.kernel.org>; Thu, 3 Sep 2026 13:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a67eEv58fAbLQ4CqoD0i9gTm
	udIxhzIVuWNoAajgcE8=; b=Sft/zSB0IO58CgKnabbIjCEtwiCEqKy5mchOW8Z7
	gzKyoB+quBUn+3BgFkamNKwiVgP3BIElFSQsuMKIxn3t1KqsSXJDkojrg5SOGEXJ
	uEOJi80faONRWcQduSSv9KCYZv1AnkpMXxyTO8S+zkn8rl7qu78/3l3shUmiIfeZ
	x40RCY9Ox79sIjVUGOIgouBCa5Ejd1dG25Ky+XJ5UcwubV5bKByhnYF3fmHvFO2q
	VZYN1qUS3yrzEIQOdBo5uJHkxbSqKS1I50mAoQQc2tvrQv8Wrb1DssOGj5339XhA
	ZrU9BTQYrBbOqTYS4Dhvb7A3AzOhj2bK0OA2ZELq7UVnwg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b183ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 13:23:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so444574385a.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 06:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788441788; x=1789046588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a67eEv58fAbLQ4CqoD0i9gTmudIxhzIVuWNoAajgcE8=;
        b=gY3ZkVOhIQzsr2iufPzqVgRP7QFn0WrHN3OyFOvQz4dP3Cr5EIUk2lZPIsZfKMxMWt
         a3o3zcNpi70qZI5NE8u6Ev08zhzD1zuZ9BGmvckY7o6xz7v+QybA+Md0hJTMgswffpQ1
         L+XOtzbhYySp/yyCPvVfMjm0DWEsvvhhf79JCvkedVyAPJ5vML2+ilGzLdmSkLV2Jcls
         Pm04VdClA7LF+yVKD8VuMwEn0MlxAhXYJVN/3BbiXm6+i3VDHx0ez9V3Syjo09twyvm1
         Tn1qEZaiTb17ylJgM74OIWXtfcw1VaCfAuH66+9R+fAgZe3WknU+46b26F4p3pLsEzO/
         vFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441788; x=1789046588;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a67eEv58fAbLQ4CqoD0i9gTmudIxhzIVuWNoAajgcE8=;
        b=oCzV3dHl7QSXPFzfP+TAjy8W3mN1rY4gWJWHb84efNLYXYdw6HaCk2IqQTVNGJYq6P
         3216pxd5VhhHgDw6tnsXxsyxsFQk3uqgHKU6giMm3HyF7t/bHHguDFxvMQ8CNaj9cf1U
         QdgTfdIn2nW004e+hbJ3R3bweWPXcfgd4MkJNziRiV3FHRNBUfwGi5eJGBEGcfyG6rsm
         NgU4DfH1vBISy5vTaNeyGbwGEy6h2Sn2+a2nhGniuDEAlXxEfXMF9KyrgQo0qcTv+9Ry
         5FJLk16ys9d6xGcfNSL1x/MNjsxzxf7X9/GrW7BWpZcVsxTcBpfmOquQmMBQ0y2GKG23
         NP/g==
X-Forwarded-Encrypted: i=1; AKwUvBzWiZvVI+Zjv2N9y1c1enaVACqDQP0L81yYtM8zMUlvd4SfMJxhwruQIRupD5IGrW6xHpGchZ028V8=@vger.kernel.org
X-Gm-Message-State: AFuF++kIIj5bei9QyL8tz6OeEJwbRywySAGlj4VC6wSqDep5pRMhgxXP
	BnmbCe81qLE7lQGxrJtp/nqPdwYsayyZSc/imQ4bUv5yszmrQH4OTg72bTVv7BZq1inTP2NdrsV
	uFY5l8OR05p5UrYRNIjUbkGYmJWp5puyd8NitHlDgWJl4+a1PpFd7+CzUdqxjCn0=
X-Gm-Gg: AYBFou3xowwu9mrno71lv/BBOzTsQbD9VvzMMgVUhqhvcP3BW8/AS4gJqTw/eUClwck
	ADvnfLsZ/MQcU54hzDbOdFVXScwpYxJPThtcYLqEM7vDylB70X4SyWnR0gRyW0g/JEixo6mN3nT
	H62Bmz2pNDTK8vsdpzbdinnxZBUV/pPLZluQjN48VYyJqvYZZhr5g0j69r9AXgxuzabVZ3vIv/l
	3dYa0ZsaN4XqoXDQ1dXpYD6mTqAPZU1Rzhp6DDbfpQ9R7rrjqO355XRb0Thr9okAeDH03UwhQNU
	ogKTNtkKme163MtyxZ9BGsDOgdRJW6xN7DE9y/Tfgl8vHcp5K3mx0i6r7Ql6ZxL2atNGu41qTIW
	vFm1JKkyMfiAiag==
X-Received: by 2002:a05:620a:1709:b0:939:74ab:c1b7 with SMTP id af79cd13be357-93974abc7eemr331355385a.23.1788441787797;
        Thu, 03 Sep 2026 06:23:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1709:b0:939:74ab:c1b7 with SMTP id af79cd13be357-93974abc7eemr331340585a.23.1788441787066;
        Thu, 03 Sep 2026 06:23:07 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d9c6sm72882415e9.11.2026.09.03.06.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:23:06 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:23:04 +0300
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
Subject: Re: [PATCH v3 05/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
Message-ID: <t2uxcw3dl2dnb4n7zi23bjkixa6iisciiqgizrrp6xldqziism@fpuflpaahf4r>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-5-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-5-21c3db378611@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ParvkP4QsGQBvm_7lB9pyPPWPKYhzy2q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExNiBTYWx0ZWRfX2J0zlzS3/cLg
 yj+p3QhLw23LhtMhcCT50vIm3KQu+9JldRsMI7lcXwZ6r7Q8CqkIZcWtLRjJU6mrIbePC2kwGOL
 Vda3FkdFB8puenLaLf5XmK95kA8tus8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExNiBTYWx0ZWRfX4svtVyiINQJL
 SIImVrDYCTbbFQM/nqLti7iG8lgbtncgME3THwocikT23FNJ9PzOSgDjkGiu3bVRlu/riGyC/2j
 VTbAzq9kfbxtkBqCdsWh8aMmQgp7ehbtsCBYKZQM949kCftbojYW7Q1ZrXMIWtOOnFXqbLoMaVY
 4w+dASzKmd57cRHlAXjfQQ+lHJrHsX7WsFEbmssLGeqDKiBO9fOV8r8QXbMjJyOhBmCGL9wdoU8
 sD1573Wr8KSY9t8YpU0V/bQzIQ9LHm9DNKS53YJXAsWoTddeUovbkYWdXlQ6psj7lAgP4Ewf/Fa
 REZPCTxcx3DkjTZZJjhP30eAkzNDSFZgmIxt+ZctTD+MbGY+um94vjauNtpJ8LGmuLsmVCU/jA2
 cH/Dg4uuJcvb203h4LkZig+FV0JEZz8tGZGAjmCqmvAM5gXVQw4MMyCf6xv3YsZ3tcjpohRhEMl
 9f9+oO0YvvFz8k09tnw==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a9974bc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bSJSfGj242zlhJVEaKEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ParvkP4QsGQBvm_7lB9pyPPWPKYhzy2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030116

On 26-08-14 05:48:15, Luo Jie wrote:
> The NSS (network subsystem) clock's parent is cmn_pll_div2 (CMN PLL
> rate / 2); it is then further divided by a configurable 6-bit divider.
> 
> Register the NSS clock through a new ipq_cmn_pll_regmap_div_register()
> helper, built as a plain struct clk_regmap_div instance instead of
> hand-rolling recalc_rate/set_rate. The helper takes the register field
> mask and clock name as parameters so that the upcoming PPE clock, which
> shares the same register with a different field, can reuse it.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
