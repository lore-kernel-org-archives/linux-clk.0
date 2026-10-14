Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE324A68A4
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 08:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966488; cv=none; b=KwNLF4ZD1E+xwPAI778ecpMfqklO3M2Tcpnf1OeTv+e8nBWazKhToqxgXHePpoQ5MRVR6Q31StXu3v0tnuxzItBWu34OSgQoOkqer+W58AYqZFN+sVSLot27L30ChTo0lTQmoCQft6tV0loa5HFPVNuNfQ3x1p4k5YV7XGXT7/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966488; c=relaxed/simple;
	bh=hA5Jep5pACbObsfPa/fLER2WRbYqlyN+IWuj26mmClk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gopzflyV2IQpcPDW/Jwrupk1QIeERJZIqJwV3S5dpu3v2nQVsrPTHeIKa4nxJdbBAwPTv8VbTyQmFUuboFd3dwjik8w0lzzK5haEibnTDKLHu0bi8Vb/qYFDrJMP7GM/2P8tmAhT8THhAFbfBviLb6BWkF+i2/chEnqrTMMcZ5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J/Vb5+OT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FvWIGz+n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J/Vb5+OT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FvWIGz+n"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67kNZ2685314
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 08:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X/S5SRmbTexKmsjmoZdpsnlp
	+I+xKbH89Xqk3Tt2TQo=; b=J/Vb5+OTiCuO5oBT1cUQpH44EzoDl8aMYiuwNo3U
	+8tMf8oJDgglHc10Mrm+/F253hakhKEnVDaQ59fs3VMpQiDqmKTcoFkuRVADPVV2
	tzvkl3rmFHz7Dw2k8sI4+zsHJZLhmnV22iPDG4DASih6k+VWTHPmXq6mSOMKdAIj
	dlW0GpP2mjZPDekHXKDsMWkaFR5QsAivJmAw98SVlY8fNpoZN3XcElodBtqYh1Zl
	j0/KliDizHtucSam3winuX6RTotlBTURlkaoxkUHG/MUQqJZjzO6WHV2MIa6Xcrg
	P0YjC6kv5HNALn/rccCW3IIypKp3wSBSd6A/QHAMx50Svw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u0j7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 08:28:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bf4c0af4eso133040685a.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 01:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791966483; x=1792571283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X/S5SRmbTexKmsjmoZdpsnlp+I+xKbH89Xqk3Tt2TQo=;
        b=FvWIGz+nHpwrSCuY14FOJOH+7iJmTzlxGOp1T/12vtm/B83VgbHLwjVJVdLdvIiRMU
         LDjpADRfEuQnFbgOo3MY+LVNmOx+KqG/BU35x3kUFDBUAS69vsQHWfrL4sXk0MXBPaFl
         HE66pbR9eqV8zoXAviag9FVHITWzUH/3+dUIjScBnC7huJoikJbPLWOyo5491COpHVR1
         +dPPfDzYsNtQKApFAgqa0FrwL/ScqrEVNhqKs0NAwLmIKaGiPopJ4D9IsHe845xoqcxl
         /kyiMUgofOac5PELIWUGqoDtrhKsEcxakzEm4A/5uRL8vxwZcAbw5FyGnXI5dTw1wl9v
         KQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966483; x=1792571283;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/S5SRmbTexKmsjmoZdpsnlp+I+xKbH89Xqk3Tt2TQo=;
        b=lmQwSccOH4rdhMQcsI2GkL2RMdwcwAo9laXEoKz6agzYSoStGXBKyOoU3+pPCwR6Qp
         RXvX0jlQFIT7QmjsVYPSMxFXUpu+ojZAhBaOaupT2kzR52bD7RStr7Adn/j9G3j7mDmM
         j0Kt1ln/JwBAAwg41kYuo1Kx0yR9r/4RjR3IWzQCWBIn6Bz6cuwbTbtG32O1W6epoOk2
         nJpvm/2np9jIu3UtxmEyqF0GRWLWgCuKA4MjY72nsQ61+Dil36PwcYRC1P9N7ou4Xmsq
         a6KBS0l6s6eqNKkNB4NTR1zni+wFVqyI/LpZbYu46OqA2hd5hJXtyf4Y6pciL+tLeW4c
         2hgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGE9x2PcmGHIBKjrxUFKUyxkx2y6hVj3EnbUB8l/tHzl5RRcNnet3uYEO0Zy5SRhhLB659D+mmfvo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOCRxLzJf33zC5eK68JQRzMHlw4Dm7RxBT3icrlKYke309VrvM
	ByPNzM4JDZxFR97fjprkV3olnev+zbMitngVvWZc9w/OZIY/6u2xsuP5M9tK5wzia4P6mAq5f0m
	cfxZR1BnGtTpQZfZ9rZFW3yaJvP6wKOp9HxuSQ2udK3Oa4y0ePjQHljWIBMPnLqk=
X-Gm-Gg: AYBFou3CZ43SW9Iq2dUP8lYTN3prOrlXRvyRizxzzPM0JpxA0rUVGjRSxTOVUIPgj/N
	Z+Xagh5r8DXi+xAd6N59XEWY/ji1Wonmy9iaoUWsChVTUkVXKpB9IFlvZQHJfIC71VSGZqkKiu3
	IxQel9PrybrfMiS2WsmPI2HZFxy4NBjPyoNfGI02hPK+Dnvo3Nq4MT37drnKUxXcx/YfqeX/kEQ
	yTnAQEh09irMu3PimHyPdeYTMjmANVpsxalxQrlAKuXjzqDbG0jLzGBB1jm+xvAVRe20EjY51pC
	lNyO1qj3InhdEXCRf1U7u/VO8yi9Sg0sh5KACWO3fU2kZ3Z6IcTO1ABSlAlw0lpkVuR7CmZf0qK
	AljMFmY9k4RekIKPc
X-Received: by 2002:a05:620a:4010:b0:93e:e1f9:4c2e with SMTP id af79cd13be357-93ee1f94f88mr1234645185a.5.1791966483460;
        Wed, 14 Oct 2026 01:28:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4010:b0:93e:e1f9:4c2e with SMTP id af79cd13be357-93ee1f94f88mr1234642685a.5.1791966482859;
        Wed, 14 Oct 2026 01:28:02 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0514ab1sm13464144f8f.0.2026.10.14.01.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:28:01 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:28:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: ipq5210: Enable interconnect
 capability to clock controller
Message-ID: <vhqpbhknc4p4syz3y7jyeesg2vqsrcakv3p6r3tnla7v2kr6c5@kpgsr3rmhjvx>
References: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
 <20261013-icc-v2-3-196b219e25c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-icc-v2-3-196b219e25c1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfX0uxQ9AOQrXGY
 ajDz6CAiwhDwdQldWgdQhFPOTf2rNzVTYFhy2SE2x+1VkrRIH/3avQJuHk0EeJu9dsQhnWTL03W
 q4LijkpJqyuqJgA85XbZi+m+4NATIoA=
X-Proofpoint-GUID: bVyV1NkU2niHl2YGUZWpC06NAs9cwEf2
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf3d14 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=x4xV_kGm9pRGdifk3eoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfXylye7dNNdIPb
 16+6ZCtL8tlSHRGjuIIKve+DnGOXY4Y8mg0VZTZRXO4vNcEHxrFDES3KdHiQdqY/4y5GvS0F7v5
 d2z+f0ldy5s+CjC8UrM95Wcl9Pgx4m0JMRxg1T/p2hOZ+th4zFWzvl6zNRex09kp8VsQcwGLhQl
 dyEnd3QA9bqr4fdMXBSB//UkLjJNjRvNMMFr/v+iqZvFDFOy7LeKNnzxoBqk5/B/OxeoGCQy2X2
 hxRZjLgln+5HACLPpGoebQaV8awbmG9nMT12ondIm79jUrXceMWXLwZ8RlPGrfkrXs7RO2jVZQI
 kYFOKaQulUK3EM7XM3BCMCud27VagHKiBs0/30FdqXT/JDzTsB3x3dLg4mFwLdZOqPHQk5oKNvh
 LesGfiBBx+Tj31d0Pi6CWWY9yCynhEP89qJEHplBCVJWGlpLWkWaR8DItL9D8P4L4sOR56auB+Z
 QeZWiTN0/dxc4bPY0OA==
X-Proofpoint-ORIG-GUID: bVyV1NkU2niHl2YGUZWpC06NAs9cwEf2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140033

On 26-10-13 12:39:45, Varadarajan Narayanan wrote:
> Add 'interconnect-cells' to the clock controller node. This will be
> used for enabling NOC related clocks using icc-clk framework.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
