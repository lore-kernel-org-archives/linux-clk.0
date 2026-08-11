Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B31443E487
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 10:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786443566; cv=none; b=qGX79oLO8kqkII3XGyafm5Lej3TgDFvLpd53xq9IJgTtaRe9IZ2SrRB2xLKQbm3fSZzwqtSBunrJyFZ1rSyhnTw4HZphRQ2C63tjXdnUBMZCZj+Di2QNVAbLWdxqnwSSMaHjGWClvCFsQNAH3dJRCQBk4EI74QTY0RgftGW5LI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786443566; c=relaxed/simple;
	bh=yIX0AZeDSBCxEM283ktfqzeqM9UC6TznRuSs2kcJaBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xn0yqae/Oa6b+BhJ/VC1Lr7B6wGYe4A/10GCJWHnBAsn+dgC51i0tG31H/EQe6Y+Toy0hoNo6DLztksAMSl5pOP3m81jVaDSrnAS2Kwy/LkgmFmv+e3GQvbWZTUuw7guLRB0umb6pAV62VvBVU/nYg1YXnMnF4HmPMpGVGtDWbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEqFXb/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8NG32OC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEqFXb/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8NG32OC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B9Uw893320902
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 10:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OkJhmhbIilLQammOt+nQdb0o
	o0r1qouASRnfUNYThiQ=; b=aEqFXb/Zb/AcfX4XwnYbi0fIRplVtMEbl7bPsWPU
	6SxB8AVHa4apVJIHtqBA2Ac3mEf4lMpoHGIgsihAli5yIScg8OAf98Z8GAksw/9B
	wp/sDmPFZ9Wu0OhG2hPaUMJPzhtVKQfdjyige1dvaJqq3hF5iCyo9XBjhHXiFmFj
	2hZmqmh4zTaagp3CPWyu+wCQE4HPwC/MUlCMgVVRbPt8x16RKnJKcy9RpkWHD9vG
	V7WEzXd1tST7m4ZzD3zPD0vzZKvZZOyO8KsTI939rLmrfipyjCCZZOW8ic6N9f+z
	ye/Hl4FSBYv7U9Vu+SSTDv5Fh2qizoeQcDsyIxMbmDnnxA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyvcr9b7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 10:19:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef8249f73fso53017276d6.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 03:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786443545; x=1787048345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OkJhmhbIilLQammOt+nQdb0oo0r1qouASRnfUNYThiQ=;
        b=M8NG32OCxKAsGg285+eNiXR2ELxCxmxzX811E2c2HF5QMskqyan/WMHqMMCHqKYqIn
         SmW+otVDMOtKcm12dDLhHg5OZE4Adyzx2DMH4jMAjbncmi7akXIbv8AywcPJUUMOidJw
         SqYyg6Uu200WiqwItT09H1jGt8tcKU6s9Jmz+wCr6CLNEjNuFUediH4Wow5+Y5QDol4X
         DshWe1vsaiEFPS46/fdwGgR89r0IJSjnKS1JFcYMZeXqBCeU+ljr7+kosV8k2NEg64W9
         LoB22Zh2I5CprkivtxCJWPr1mIONuIu9od1I+m2i+LDJCErgqHbGb4A7TpOJgsQX4tX8
         l5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786443545; x=1787048345;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OkJhmhbIilLQammOt+nQdb0oo0r1qouASRnfUNYThiQ=;
        b=PhysQ1nODmK0XR3vIvDB9B7oF2kvokvWgqPyRs4p9De6HtvagZElM2jX3cVM30lZu6
         oyVzYj5hnP3gx87yYje2d6EwmqwZQQDPeNDxeKO9NCwOXKm02Vk3Ti6mLEah9gjp0Pr2
         2rlpTHWVTXgdyuvhLd84RU6TBD/heC1bEQUVrC5KU/xiYRTabLW+0QjNDHAO2EixS2yx
         naJcaP86NNpWfp4TBr7UuQ+cFsNlg67ofanJREmtEdlDrvuy4+qDsrD1EEeZDJJqDhwf
         3XPo8YzSOH8M61hjgNCUA5dkoBmQnsa+SDjeFR7sv0ExGAUt/p0YmMKX+jXt13vJnGDE
         uLMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpuLVdn/Fs+3mzqUeo9v2E/4sRH5LUYNvu4H4OI7zAfuxHHpWIzOvUFbwasakPxFOjxf0NJ5c8B2og=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCrUX0mau/ffDJMCIlTMLMTvxHVlfqy+yYmV3d8yWrsEziuUrf
	LY+tCcHBow6ExwTgObZZ3kCPpze0muamsWfR127KuAAgTbOfErCk+cLth6rX9wsWXabaUAePSQ7
	Qkb6H1fmlyKkbufqRvOtFlQP9T4DTzpR9FC2SZHlOpvMJk73FttYdDmMXzKI3Pb4=
X-Gm-Gg: AR+sD12V/SPVcBAMhP4bEFFyRVpwOMSiyO0VR/24rLwUCtqT4jxudMB0KEkdKGojo0H
	N7rOoRd913QQTo6CYv6dvWtfpHYjhgz5of4cfT4pox9LJa5iEfbUqHFZTZFd7wdyCW+BBLBcN1D
	8s41uht1qvbMmtukYaIzI4rb7GnCA7gWkjuc+y1Iyyhq30BYESncOus1gjfJB8K2b6Vr5bQSRb7
	LFo6JKo0dS0HiCb1FD9ZPSdwwyCxgj+bj9TGPR8p9Z55WJYPYWyqoyXxHthlWs8l0Fy/LDSJ4db
	iAkSrP+HCoV29+xKwQOOauwmi3eBXLvNa9t4GUBkR16feVyKK56AmB80jLp5LqNj2ZKTfkuYOpx
	lkXwy8e5r+zvlU8dfuHKZKmrDQSSpQUoycIqlv/5MUW7v2AfEeyOGFJB6yepAqfvkqkettUC32m
	ucljk8oAmyB4MYWg==
X-Received: by 2002:ac8:5f47:0:b0:51c:a70:5ed with SMTP id d75a77b69052e-52d586365d0mr15297751cf.30.1786443545261;
        Tue, 11 Aug 2026 03:19:05 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:51c:a70:5ed with SMTP id d75a77b69052e-52d586365d0mr15297571cf.30.1786443544894;
        Tue, 11 Aug 2026 03:19:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a0fa3fc5d2sm1729601fa.10.2026.08.11.03.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:19:03 -0700 (PDT)
Date: Tue, 11 Aug 2026 13:19:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: Add Qualcomm IPQ9650
 support
Message-ID: <n54sewn4sjafsncs2e64hkynxr5ct7qh3xukmgvdqankpsg2iu@kunxe57navul>
References: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
 <20260519-ipq9650_icc-v1-1-4d3554c94257@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-ipq9650_icc-v1-1-4d3554c94257@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4NSBTYWx0ZWRfX0pNLmYYtzYIF
 Fwg/neycT+vFslu7ehx6AUYRnvxo9BkeixxadWZkf9UuEfJz1Mhuqt3mhDrm/YJaUSE9+50OMve
 pKDR9rh80XFInUxnnjAWo+g8dgIh+dS2Ld4SEsJsg9fPuOT9zGu+igg17DPi7j0iLDNTfs/PPQt
 H0QpRTFy7INC3dLOVzNtSKDmPnawHnJDBmN6avdYMoqqeMtykj/fzasjBVFTBcAzvN8BIy1q9K7
 c41d8xncOajxBFuY3Hi4KuBCVaOIpNG/Nvv6DnS0lCLsFdOTGoQNU5aShz08RRIlYs9K3jBHoIX
 LYz3r193e5yCLXyNU6U69hGMINc+KWuS+sXPLZXGDsGyE5kqZz4Ws/sL+Alyg/1Hn7dYC7Krq56
 c0kJL2/P9qwZjsjAk0VVfaXDs2PGy4MpLOtf3owP+TUA7BfonwayEwZ1+RCsxqSBGqwIZsgzwRi
 KtK38pYQxWfZ2TZHFgw==
X-Authority-Analysis: v=2.4 cv=e/A2j6p/ c=1 sm=1 tr=0 ts=6a7af71a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Cx5HlDUoyQ0isXJhYOIA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 68C0FfN9vaSwIymCYJ2A5cF3TLwThOPm
X-Proofpoint-ORIG-GUID: 68C0FfN9vaSwIymCYJ2A5cF3TLwThOPm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4NSBTYWx0ZWRfX2vMvCHg2Vy3i
 Y7+Wj20jIM1VM60+7N+4Kvk3NrViJ9ySskyru6lC8Am1+yVRpwYJTV84Jx2zAjs0VZqLxjRTMIS
 mzZBs9wMMtCJ3JH3DDlHDhG0TT7uWo8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110085

On Tue, May 19, 2026 at 02:17:05PM +0530, Kathiravan Thirumoorthy wrote:
> Add master/slave IDs for Qualcomm IPQ9650 Network-on-Chip interfaces to
> support the gcc-ipq9650 driver in providing interconnect services via
> the icc-clk framework.

Please consider adding an explanatory text.  Something like:

On Qualcomm IPQ9650 platform the interconnect busses don't have separate
RPM / RPMh controls. Instead they require direct votes through the GCC.
To unify hardware descriptions (and software interfaces) between this
platform and other Qualcomm platforms, make GCC export corresponding NoC
clocks as interconnects. Add IDs for these Network-on-Chip interfaces.
The GCC schema already defines #interconnect-cells since it was added in
the commit f92b778251ad ("dt-bindings: clock: add Qualcomm IPQ9650
GCC").

> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  include/dt-bindings/interconnect/qcom,ipq9650.h | 28 +++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

Georgi, any feedback from you? Would you ack merging this patch through
the Bjorn's trees? Or would you rather pick it up on your own?

-- 
With best wishes
Dmitry
