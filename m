Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A97363C53
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313897; cv=none; b=B7995pqK3fhC0/s+geV86K/sfy4sLd9EnE27wzOveVvTJxQEUjeINq/nKeYOTDj6AoI0Ja90juZAKqYKZI4FihfIRCTk4kflTU+puoqbfwGePNmiP101Zb69c4+qVvv3H8RFkkLpqxlU5/17zk6rBMExKkQ7xt8eNpdSRiZ+0MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313897; c=relaxed/simple;
	bh=SWTIaQyUE0hLCUIIN5L1msdquqlW/MHKkBotVFsNjh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGJea2GbAdwbXGAJNk+rOKlbvmxdXi0nUG/f2TYMtH+4g18ao5Ny3fNsPAKk7/ymCHucpWrlUbmFTGkwHnxpr+bN+RU4euMvTqAm3a5C68ohKEBecEIJdJp9X0EkVW7EqFM0fEJqT9UMnXt21TN99eC0Uw3AIoDb7ypLad8f4uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oX3KzpYV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGmc2PNy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oX3KzpYV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGmc2PNy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BM3Ye622090
	for <linux-clk@vger.kernel.org>; Mon, 1 Jun 2026 11:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U2uhUbSn+d0+wL/JaSPYQdq7
	U5EkDujpLJ0FBYZnkRc=; b=oX3KzpYVOqj2ALE5wZmlP8c0N8xuuhE8BR7mwEzs
	s+ufXextn5U5hNhtoeqlYFZsZJycNhDXJMGvQo650tiGUgOKgEMOv6tvyrT10uPo
	zR3+OEE64UWnW6mMzhlMgejt//eXZktSoYLoqlDW2R0jhuxF46E6PIx8Nz0D4aB2
	oUi8xAWL0FQgf24uMvSSsDtoNy7/13IcL7eRRbmiyIzKXRbKNLP5Z2LQKOPIaudw
	dshGRd7FOFzMtU7NvyRb3qD2wZv3MGGyyjcP45PYGOfOXPrJIN/ZPcf9qeHsGaBA
	sBojjBC6mMv8m9wRJtw3vD4V5EQiY9+dKCN+sSvXmbb1lQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh954g29e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 11:38:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c7b5cf8bceso462913137.0
        for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 04:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313895; x=1780918695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U2uhUbSn+d0+wL/JaSPYQdq7U5EkDujpLJ0FBYZnkRc=;
        b=WGmc2PNygVeB+sju6wa09j9LzH9ySUhgkUD3+0nxbY81sa+zICSOgm1lHUihBLL3vH
         Y2gJoKLnVbB0N0CYr7/l8Wu59S2IF1IGimQnev99QPxUaWNT50YPcmKocmQTwVO+T63m
         MUWBgKsvC7qz/s7tSN5BiwxTF+3t0ZCZ5Pk2PW5wjIljcy8pELAUiYpJNTfKk8u+QrlJ
         PxkeReTAd7BdxLHp9MYbF5icm12U6BHVaWldOnJsXJ3GTpNKNx0lKX0CnST+L+EZiIYT
         RFefdUDiGqUeBfvNO2gQPgciwQCMRUj+NjZMTurnIgok58JGyGErmmiMWUD4pqxvHtlT
         9Qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313895; x=1780918695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2uhUbSn+d0+wL/JaSPYQdq7U5EkDujpLJ0FBYZnkRc=;
        b=QeNDkAOE9GfRlDJ9r1OC3CEL2Im0otYH3/l7ruv6oSu18dKsc/seRNRHFFVqx4hLvS
         mfHeBgp/fH5VZSS4ywFN8q8Le3ZE+ZHIZGxbrFqLkHbeHBTtAYo2iXqcpBw0K0Hm5dn+
         v9CRzp8beiFePPev4aCzAoQ8UqsTyaRyG9IeeGB/NiuR3wU5iAEkXzV1aEeU1MBQ0D3g
         h6fuLWccm1a9Ae+cP7UK5p5+tBE+bPnjhUx3WtKf7ON9ZY5SnOODKvzfNPCEgKVYrVRk
         ga7c1SB3TT5e1DnRibwLMamV5n74T41tgG7AoyRuuT8/rhV6AyZhHdlwKvaf+oTzDs8s
         Somg==
X-Forwarded-Encrypted: i=1; AFNElJ8Jz2hiJbt/kJRJfCoM9I5Yawr4rMPtvh/qNAO8SY4rvEZWo0/nhyg/NjsCN32rOI/vWU8RPkLB9MI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8SSXT2zMobHjnnkbesDu6mZpTgpb7LOGH8ULzQWFcTmZCI7gu
	7WU2GwBbAWKoSN+gSBCSHlGXWh4OGpqgojEvPORjavVv/u857WrXg5N5+Es+TtMc3r9/FGZ9cLZ
	EaKTio+HZr97cNIIqeWJQrBahKDATPg+r4+Lq15E+Wgixp04fu1vo1MsxXsSuYkE=
X-Gm-Gg: Acq92OHITb7BxgRjmMPakMCNvUWVdlm68Do39+5Z2/B0ox0jNqTaaSyDNTjUKfvPgK+
	sOlf7rtT3d/WDjAn9ts78l3eJ2l4HaKbp/LQgJaEglVdH2X6RFAu42pA8zOTKk2aWdQrQjP+w8G
	p1w7FhQ4dfip9mAa7ZRktaYzvPATi2ABt8QMMqvOCIdeWsVzlSVZ9olWuEawppF4fHzFmsHe8Ir
	fpoGc5pfAhCA/P+2j9OJS0BQK+MvRiU3RxxD8KPNqaCDoHxDdZAAp2lXj10/AMN3/UMtp5yCjI0
	vhz5hiKSFK/flXbIYcGN55989u65/DTtIyUD6D5f7fcsOPdb3g1pDWh9D6qWeWik4E7KHb5QHdq
	YVFOH56bMRl6vdb6hc8L5w7ZPtAcUnn07dC2I6xwcJFPVLOWdlUoqhs6+OmQzw8uPFmBDEaGLoT
	Scmq7PX8V+60w1j2SFy6VVd6sl6Qwh9ytrYN3nZ+pazD298w==
X-Received: by 2002:a05:6102:3e22:b0:631:26f6:7009 with SMTP id ada2fe7eead31-6c69b078cbbmr3454928137.26.1780313894862;
        Mon, 01 Jun 2026 04:38:14 -0700 (PDT)
X-Received: by 2002:a05:6102:3e22:b0:631:26f6:7009 with SMTP id ada2fe7eead31-6c69b078cbbmr3454894137.26.1780313894373;
        Mon, 01 Jun 2026 04:38:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b06879asm2022024e87.7.2026.06.01.04.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:38:13 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:38:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v3 04/10] clk: qcom: clk-rpm: add msm8960 compatible
Message-ID: <rvs5c4shgeroxsllqtxyjtsrb2447yprucw7qtmeissbbxtvtb@24nexo4dy6r4>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
X-Proofpoint-ORIG-GUID: 1xiNDvVbKO-xkJzCtA2ifHCw_Z93ZSsx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNyBTYWx0ZWRfX6V5BYsHzYfhS
 5iaUgMWpKxmfMGe8oGQxUF1dxMnQh6MeBNVLK9tFAYduy+PSYnL+trpwqvBxBFDkbi+h8AFJx23
 qHlGNsrYMYMnPA+X3UxPMzvI2iazjpP42xOgiFgpaQv9ed8+7VkZTNw4/L8m4O3AMEy+pg2bJUY
 JzxhT+66m1lvi2IXKxhJHP5woOl6WVd/mIqAK38Yr+C2s6Cc6vWrZsbrz9DloHD2jpEn9/yJcjM
 Z2ZOJJbupzpce/dq8rGQ/xXUdfm5pblvWWpzxKALFCa38SyR2bXU95e5lxCyvq7nrllSuhTNPq3
 US5kAeXA4eijv6/4m6f2eCPm3dWk7fbFGTT7MRZuUPVfcoDqJr1P7mYtdA99dMXzqSxNVN+ydKr
 5j1J1vahGgcDr2PQ0uf7M7p7ZHXgseMCzmFA0NHOYrSoixhXFgfjsUDXcRVVBv95BeXH/Igzil8
 AAPo6/7lioqCamfjohg==
X-Proofpoint-GUID: 1xiNDvVbKO-xkJzCtA2ifHCw_Z93ZSsx
X-Authority-Analysis: v=2.4 cv=VpcTxe2n c=1 sm=1 tr=0 ts=6a1d6f27 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=5PoCL-xiRuW4qANWJgcA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010117

On Mon, Jun 01, 2026 at 03:51:17PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add support for the "qcom,rpmcc-msm8960" compatible string to the
> RPM clock driver.
> 
> msm8960 uses the same RPM clock descriptions as apq8064, so reuse
> rpm_clk_apq8064 for this compatible.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/clk/qcom/clk-rpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

On the other hand... You have added APQ8064 strings as a fallback. Is
this change really needed until you actually have SoC-specific quirks?

-- 
With best wishes
Dmitry
