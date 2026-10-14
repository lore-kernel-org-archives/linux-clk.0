Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FEE539795
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987464; cv=none; b=rfiWKHiCUNYjPccyiWfoBb0asO0afPdIhQLIoScx5144tZ2Y1xXvwsZU4xBOLWbiSpxOLZdq+q3fooS7vM/7EjmaOUxE1CTTUMbwEQq3zQmE+Rsu3mtJqt4WFPR1WyujVm+6dVrleci7KBpcPKQWcEjlIu1H4lIIAF4ffwI80Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987464; c=relaxed/simple;
	bh=mduGJu+RGnhlm5vJbzOcVpHGjFHq8q+1YTzaexNaa8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzuRCfmyoZpWeTlBodL1LAw3tM0fXZcdFfl89glKqxqfzp6saDHPkhuuyNdqo9h/VDvG/EeBFpNoJeIIA1oQm8wVnbfc1g2EVIOpMVT1M6hmujjyhzBnRa68xNlS53ZJoyG+9xpGlOflW0IQWyYwOwNzOve1Q5FjfWuhJrKSs6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5jHKLiP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJUE0AS8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5jHKLiP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dJUE0AS8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9eBY93696119
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mhxN6zCpb47Rc0mlziPtloK7
	GA4TQmP2+HsXBPO93LE=; b=L5jHKLiPUzWtbvAi2aJJCGwrcdUuohdkcu+eStQs
	qpBPUShHeeu+X0HDAMG7Q0pFPpZTcXZaGTr79Cx6KDs8Y30f3EYabmFMnbsg/hYx
	B7fWSkHsnbr4MMaHcKcBS6Eo7u31nfaeJXMsxyHId3rXGdOzOMUJLKZmAGes0pOR
	v3lMtazPN+mb0ubowLNa8p/j1Ym+hty+9abCFc8Ocw/nwO0XprkaZE/yyCySDTGO
	g7l9ecdxgfxLoUVnO+P6wJvey9lcpi0DnFrgUxxoU+GoBjpFS3yP/xdU2k2QLNkE
	bLhM9ZQGPRnydWjcZGm4IsXqPMjZRrTnJ/aIIMxySgnOkw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aeh2cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:17:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso245595185a.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 07:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987461; x=1792592261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mhxN6zCpb47Rc0mlziPtloK7GA4TQmP2+HsXBPO93LE=;
        b=dJUE0AS8bAWLw52phsOLAyCp0jJI6SWHGwsZa5dpWXShY3yRsiNTtVPIM8XRaeObUu
         F6Yvcd1szF7H4pWZkkpuGv1cL5eD6qApCZNs3ydbQ2ijC9fTziJzXTbry5tewDbM2PhW
         kMD/xg2/5ZrA3b4lKHGqNNZ0kTRcH/L3oWTt0L6LVpFlpZT8xHKfNWlH870tBMuEUbtW
         BiLABm2iVlcTRMtXROmh7P3Sulxt3GQf5ci/bdaspuRcm8C0IKqtFwQHYkA7EIiGnTep
         eMVjRCW6ZtUg3dKWjzU/xi6dtEsmxOAhxPXV4vNQQidyo1uKQ5UD7kBFCRdWMW+icAH3
         pXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987461; x=1792592261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhxN6zCpb47Rc0mlziPtloK7GA4TQmP2+HsXBPO93LE=;
        b=amzwXGwIErqZwZsMLn0ZM1dEsDTsXBZuSGiqUo3ItQ7JEDxOCkLVdDrBFsMSXIN7+T
         54Kisq4qBR/OuqsBoY6J5pKZi/1WzQ4Lsjlof4zkgI8NE0zzZSXCrg8V5C9I4BuLHbvi
         wxZr7GBDggsGq0wR3I0UpKWa5DrPbblK1vQYjmDMmhqxrADUXsxerFxS6mMhRy4NoPgN
         fJKxU5HkzEux1wo1QxSIHDzsQRBSIsmBSs2yvVijDnKBfLKMEZeug2M+YTaexPUz2OpV
         D15SPeuk74vpcTQzcsTVAzqtjMCUDcE4g+ftVHp4mITv382/7lKYOT6j7h1vQGs60Egs
         zvxA==
X-Forwarded-Encrypted: i=1; AKwUvBwCKjDHTXV3xzPfXiUEFH2NIUwiiOUJ+2TLBIIJ8ogn9LxCLxsXu/ZYJ1dDvRXafKtHXdD8ub+f03I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCwh8Rdo/iBPN+N/f2tp0Zj38fh9YFE7gntEqHJ9MlG+ReBdLa
	9Xm+si1ELtguk3mamd30qF6/5ZOz9RmrvxVi12ozCUx6SyQowfSXmGMFlewHcMW1eLgH7Vsruk5
	e2c60MIAMyRVMtI/2AgpbUF/RZW9YcpdNrvSNzie0qYC8xe8ZIGJHF8gFPsSsD0Y=
X-Gm-Gg: AYBFou02O6IfMBKf2tEaN5RtPjkR+ztMzJ1XxOGxjovcsEJcynOIaRySAQRd9TjALCp
	ozS+l+XYLzuelBOkdQhZ1ES40hVJ6/F+6ycVlOvkWT+8YhyBtrzJOpp797qm3Q3K1MqH4KVZKz4
	PkgKtUtN5Zg840dTpFRojE4GL0V5XY9fc8eSIJsl6RilmbfrJz/b1UXpjZRXm8P5Y2ym2dd8Zvz
	I1V3Q3uOzVijWo40wSObu5FRoozN6rSlvu5fHBrjlqOdCzJzu3YygIeINDX1LW21f58hoAV2AYp
	PQmJ+jzKJbtEHSW6rm8zC40WMRyQsPhZRGUrkW9EBWpSdlFnE4PrW4tEJJ0JAKjm/gXkqtyfHRH
	9A0OmONPvNwO9yONSguIdNWWqu/ShnBEYQiBm66sJh1vklxdcxLoBCkcrB2IiJ5uh3SMtb08XiX
	Ei7KKmDuIKncSS
X-Received: by 2002:a05:620a:1d09:b0:93c:891b:90f1 with SMTP id af79cd13be357-93eb96619c3mr2384211185a.26.1791987461081;
        Wed, 14 Oct 2026 07:17:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93c:891b:90f1 with SMTP id af79cd13be357-93eb96619c3mr2384204985a.26.1791987460504;
        Wed, 14 Oct 2026 07:17:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d90ce5sm688706e87.59.2026.10.14.07.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:17:39 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:17:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 11/16] clk: qcom: gdsc: Make GDSC parenting optional
Message-ID: <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: seEH4N0JEvzDoCLb1_H8whmeO8mEWRez
X-Proofpoint-GUID: seEH4N0JEvzDoCLb1_H8whmeO8mEWRez
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX6wVwwzKAXsUo
 FDe7jUeIs66dNlQR8E2vJXAAK2SDxlqBhQpa2Gh6KJJ+bRs71MPqzepuO3CUCUiuVs3R5hP0N9Q
 OuwRAfe3rOO30gbA+q+jD1ze2H1mB+8=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acf8f05 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=gF80273UUj5qe3Hr1MkA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfXwfem9cmfcgeS
 EbGvlRk2J76D1nuUuw+nV7ykgZSC5efgpeJ8vGrIw2Lb9sITMSNkCm20BncdkowlPaQl5vRRHHx
 ZcC2bRmIJ5w2jDEP3zRvAvaE6OjTyxqvQUPkxj8j6sCcfoUs9pVMBpxA9VjGer8HWHnNT6K1Xro
 3zD8mLyk1eV4/8Z5zTyuetWetzgfKpd4DTvuQmLf41Q2/nabZ6UuL3U+hrLfI5F9DhpPbaMuBkg
 qtAo411SavglcMUhQCUyWxtl91O15X5p8lkyga1VjwW67vwSUxP+aJWxqWtj0tjVctf4/dBo9dp
 fq0f79/lDtEzqMwWxZbt1aiZk/yNYTBYpt/hBhBLQ8hXB6+E2anhr960xob4LOAe7ONcG1jex4n
 i9un9BzhtnnbJDw7qYRmxybNe8g4Z2T1uWrwOmXs/SKej3f7qmPXsHDsgDOx+6ugG3XPtuLhlVh
 JF6LlIbUyXk8o1L6kow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140056

On Wed, Oct 14, 2026 at 02:19:11PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Clock controller power-domain attachments currently become parents of all
> top-level GDSCs exported by that controller. This conflates resources
> needed to access or operate the controller with actual power-collapse
> hierarchy.
> 
> Allow callers of gdsc_register() to suppress parents inferred from the
> controller device and its attached domain list.

I think, each GDSC has a parent (in the hardware). If we don't represent
it in practice, we likely need to fix that.

> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gdsc.c | 13 +++++++++----
>  drivers/clk/qcom/gdsc.h |  1 +
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry
