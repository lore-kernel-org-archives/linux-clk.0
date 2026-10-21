Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572044;
	b=pbj9u8dHGXVPuxVIECOrbZ4FPmQ9hFNSRpnoE2hLiCF7SQ1HxROyrYYZvCsejLFS5kTr
	 udqzHaY5Gakl1jHsBNCa5UmDbjczzVVqJNIK/RmN1kv4HUXXYTGENsmH1Sb6BQc1RZeAY
	 yGeuXZARj7QnBS+h40n0Y3mo4b1LIGqa0QgTs5GuvhO24RJfR+1z8RS2Eo39jvQJlE0sF
	 UvDwHifs/obJA5Bp795yahmLSSc3v43KzeJo888qefxfvJtLLlX0ao2mNhtdCXfD1uHiW
	 a5XoJMpzKyzaSmN2iTwlxRAMB3yU3q5iXY95sXgyDr4VWv2+LzTukTTguTrUPnO0m8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Nfw0PUvK6imNS0xXM3MSxUotzC6eCCqH+vuYtGmu7X4=;
	b=wzPNxrEz7RvBopddU+kXISi5fmjgwXwDz5DEMePhJ5+MGlN2akS5qPZdLG3/rd9WqTpQ
	 D3A5fVNdSNaRdjiBGjNpKx7X8l98RCCVWvX/ujNS35+KHHBI8xfOuk3BtGIhW4g5TUxvQ
	 sOwo3w3Zx6cGR8sDLS+BjnVToar/ZLzRMhiJId/ehraN1jJSIhpsMYDFC2XIuWi/FcQlz
	 ejLHn/RBlI1e+D04RrKVh2UXF8n/GEzn0cSbjrgDpGhIAu13mhU/pJG9wJe2unq+k/vdq
	 CDHmXWFSVzRGyX6inVkR2xoo+4dv8F3pbj+sixIYM5PXz/33tT4wRQpTHkMpqFQhbbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z/Fjub/m";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ww53EGqe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33E8606AB27
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D33E8606AB27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z/Fjub/m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ww53EGqe
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jLBE2848640
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nfw0PUvK6imNS0xXM3MSxUot
	zC6eCCqH+vuYtGmu7X4=; b=Z/Fjub/mbGKMnxjJc4Gt1M/Pzy6QnFCS47e7sML/
	6xHjYNHpVDW+eZRMU9QFaTkI7SJ1y58xzx0nGOtJtPIXGGTXRLIYfmUo6tEsp8m3
	7Z7QV4ErCtI4Qs268zbiRPqJKuEJwIJ5Vea52NQbS2yiikCKuWeyvP0q9i0lQ9qb
	CgMaB5aMHS4h7CAXCq+w7WLGwqWJfG83J0vcye6Qtp7rqArQGJUuolXIQMKZ9OXU
	q0WvcaBy5v0fVtNXa+hrhInHeHRXb8VEhz6mUvdd1jZQU2fZmxlKcl/0zQFgqqaF
	4zGCMHRYTiOB2r3J2rjwOjl14l/fykY6uSU0M/fyx1Rliw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9ar8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:40:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f568dee56so107055185a.0
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 01:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572042; x=1793176842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nfw0PUvK6imNS0xXM3MSxUotzC6eCCqH+vuYtGmu7X4=;
        b=Ww53EGqeTH+CcS7tZHZmjPzWG6oCQflZL75FcS1YhxAHX09J0uSAFs3ztZ/bMG3DAp
         A1g5T+kZ2zqzaxL8Y+3y5Vm9Jj/aKjFZqry4poZoQdYlSltBUQNT9ghx1S2JeIgOmOGd
         W9uOZvgilc16e0r8yZ7h2mVnkHkQpw2Gneo4EHFt9UhWsRftmm0EZW6vj4gf91bdu0Ro
         GU5Byuv+03adbuHhh0tauwkg5m/UYgpyNmb4CpPrYNEHW4SxNuALkHjgbCOaSaSaQ/vC
         JAHNjTamq8piITm7U4SMJlHuIq31KNmbj1koPr+7gC88s0IaWnlX7jeYyYZCryLH3gbP
         V3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572042; x=1793176842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nfw0PUvK6imNS0xXM3MSxUotzC6eCCqH+vuYtGmu7X4=;
        b=hKjo3Aw2tbRaS1gNhotecLR05zsZUSSxsPpNQyZben6uvcpMJuiaXEqwIS7ZIB/j/P
         1msgLUDHJVOlkIEmdcu5pPcm1DaQdRXX7/iIyVayPM03A+hJ4v/lhECf7e5nwS/8z1Z4
         cZpMDNvbQwHh2eDB0HgSBWyvYiQe1LWtRJrgNsTcCwBFFlI9lUTxIimitdlbai3L+smy
         hGgMZ2yD3zjPUYyqTKQy9lXQBjSNOaMWN2js23MEIVFZz8JYzbn7NQQf/rqOfg1+f+C6
         rFyqTWG31PQ5tzrGcfCUT7OzTflz9bFlQEjOILNYVs7l2QBBhrKpG6jn2x7QjaQXMP8H
         G6ow==
X-Forwarded-Encrypted: i=1; AKwUvBwsCQV5gS789cWc2Xtg06WhHYA4bXb84T2TcslTnOO6AhpbTgZ6JDtWY/HhDrJPuBmCSq0o41iCBY0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFhuIFA4XisvBEav9cjM+JTTfkfMc+gH14vct1OvlHpW42k/0n
	AgGMxIOj6CPTPeeKbObsGmoFj/WjFTfapjS63BDc+fLLyZQdTIqtzH10bKlEgnPmGuZFDpSCBk3
	CtzlKT0pZNxXIOpmPt3AfJAr2R0zzBIOv5Ev2n3ayU8xEwxbCtqXjD3SHPYvzMKGPTPi3Niw=
X-Gm-Gg: AYBFou11rH7h9s/jNt8ag2Wi0ApPr2SuRHnA9KQP8F6aa0lOYl/Uu/9GxPOHXDoURrg
	ZIdzWdyiSPfv9AlwNDc1yh0V+8uiyHBpFPmLF1+Wajld2kXFMUp+0EH6VIVRJZCbE/bgIVx0zAy
	Qi2pAUsseiFIqWoXGtqkoruC7A4/GtdpPPKqypCDrIn7gNLCyYMYwnBAhfjk5a6oH5LQoFKDhPN
	RhbBab2ajM4W2P7izdzPFM0r7qLNH2SD2acetUNbsMDrQhSqM6Cnhn/S+GXvQEKe8giP7CNpFw4
	lh19lxSom+QWFNGayo0KG8Cp9F8JkCqvoch1iIfDR+sh64QwQZYH5dC1BmGm6Y/99pRoIXb9TrA
	+ufKgzP2dUPX8miDW
X-Received: by 2002:a05:620a:4505:b0:93e:c12c:fbc4 with SMTP id af79cd13be357-93f57f9f3c7mr279115785a.81.1792572041617;
        Wed, 21 Oct 2026 01:40:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:93e:c12c:fbc4 with SMTP id af79cd13be357-93f57f9f3c7mr279112885a.81.1792572041068;
        Wed, 21 Oct 2026 01:40:41 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm96917225e9.5.2026.10.21.01.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:40:40 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:40:39 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sushmit Singh Rathore <sushmit718@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: qcom: camcc-sm8450: Park the camera RCGs
 when they are disabled
Message-ID: <qvoigeiju2ka265iqjazauwcjv7zkl7d3in4cfo5im7a2gp3ss@heo6u5sphmew>
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-4-sushmit718@gmail.com>
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
In-Reply-To: <20261020142157.1749-4-sushmit718@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX0sUF4p7uuKQR
 P8n7HG5e8P4sLYKwXZmzXkiV1Z2CtQ2otaezx1qiGWaUZ7Jna5TVcZGJ+z3iYp4ZRYxrYGy14s7
 Q20hYxm/3k8uurZQKyuUMwBrg+nDtB4=
X-Proofpoint-GUID: bGvS4tnTprOwqNVw-ORTwargoiIdSJhj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfXxu7bVosh6Zek
 /6v/Ys4frXlmsbpqG1F47SOBxPxqBQ6R2rYJIGt5cBSFC3R4Z7P4HWNZMyZhrjFhqkBrRq70k4k
 mMglnH8TvOc0c5KP1svbYzOjK1eGFHl1FCNdDgVpeXzVEdJ1KwaJ/H5aW6SuOlMYQy5sIYlSElY
 ViLKjsoz1zCfzsyIUEu3W1moKaK3B4fMikmc5r6w1JYOLShntQUGZsfWfV3qg9ognBkPKyjAJy7
 pbpK7tFv5ZAJMVXORvYsTV35Oyrp28Rd22KPfTkoyOpFnOLZSlSgwA860grL4L7Ff990U+39jWa
 oagRPZLr0tMUxVDJcrZ+kAjYr2lK1Qsj8VvbVh3sC5mL/OJszDegDYpoKkrTkPfgSQW2Rgz35JI
 o0/ZB8nlJxahFwqy7Rx+36sXMJfKuK+5BduGm2oe4ytCzgvnWY30Cl1sNAvgxg/wrliHA6rIL7e
 B1x1Y8Kx1Qw54Bj9diQ==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad87a8a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xW1KjDN5FDO35nT6SY0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: bGvS4tnTprOwqNVw-ORTwargoiIdSJhj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 26-10-20 14:21:31, Sushmit Singh Rathore wrote:
> The camera RCGs use clk_rcg2_ops, so a disabled RCG stays configured
> on whichever PLL it last ran from. When that PLL is turned off and the
> Titan top GDSC then collapses after a camera session, the SoC hangs.
> 
> Switch them to clk_rcg2_shared_ops so they park on the XO while
> disabled, as camcc-sm8550 does. cam_cc_sleep_clk_src runs from the
> always-on sleep clock and is left alone.
> 
> Tested on the Nothing Phone (2) (SM8475).
> 
> Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
