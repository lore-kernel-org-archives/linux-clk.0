Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0C839098C
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 19:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293917; cv=none; b=c0hsQqL0Lb1WPvubjqxrH3mLzRUjSS7FUzR/x534NotN07CKjW1Hapy/Pot5hHGuD4/YtY+wkeED925uTqA0dVTHZv3o+H7Y1RSKTFSbjzPVHWdLxmylFY1WY8uEsWDoGRuXygPikzn+0zIOTXvl7l6N+u28EnbFkQOtZuoBzTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293917; c=relaxed/simple;
	bh=VNt3oIJPeAitMvEk140461nWaP0kgJIgg7on8kLFuTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJuIlcpvO6CUAHUUHAeVhFe35Kc9+UxGYDS223LETs1yrpz2/dcZQlhh9w4Nbwo99DVUjE4cLuFymh3LKiLXSgdFhThdwe2dewE5McBidg/YRhIVgTEpN0gYREQUy61qDOTevFRX/+gb47i+JeuelERpR8YPfLlSeqUB9IPmpOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jrT9ZyIF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qtihk90E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jrT9ZyIF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qtihk90E"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXWE3817467
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 19:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n2cn6VL+YpMidlTbJKZrRD/a
	6COYTRrqbh5Y1jb2KDc=; b=jrT9ZyIFObFyqLxe5jpuSUT3QyfuHsvIV3Pn2LFF
	QdhsRE6nY+7hFhFy1+3O02olLpdy1Dkqk6gSiVRu+MUeudAgB2k0JEeBhJR17YV1
	SiX4f4YK9bpAHrXcm59ihMH1QpfqxHSdBC4JrCCG7IowuqwrrzTTLLppwR/HTt/L
	JiP4zxp9mZD3+nzz2/wBCE/PVpySrqc8DHaRCEKvdihR0dlrgwdnLhhb4lvs8mOW
	4vPOwgsj+YFBKhJ/eKwrMiEPRmC64J1FWsmSgz3hcDD9X50onQKmhzZ6/06zBc9p
	ng2bQ73hUvBVXCOKf/ZpU336Iuvg99h4QQdy7Yav+bri3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w1j6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 19:25:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4031b86dso279156921cf.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 12:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774293913; x=1774898713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n2cn6VL+YpMidlTbJKZrRD/a6COYTRrqbh5Y1jb2KDc=;
        b=Qtihk90Eop+inkRLARRsuVJ1xxHr0x1iWPaq14RULx3Feu87PVDRnCP3cDC6atcmB9
         XUhzFLi11BDXte3ikxCCMQI4wU9lsPJd3nHyeVYi3xG18w7/OnytBmkl7Fxt5FMArBHB
         V8Y7f65ipvt0zJI0a2UWzJakHTyznsJONoV3UiTqOsxPQ/IKM51aQLvD68oMQXc62J2r
         3PDyoIig3NOnJ67GOZEQtAzBun33qtgzPV4EeAX3cROiKv+U15qGlc+pjLy8nYiAco3Y
         oEtOFE0ToKomg5MVCwOBJ7L/NhQjOQ2NbQVp4hy+n57hdjUuvo3xp96UEebobJMBfP8G
         BZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774293913; x=1774898713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2cn6VL+YpMidlTbJKZrRD/a6COYTRrqbh5Y1jb2KDc=;
        b=JmO/x51RRu+Rxa8ynRIvB8nLz17HHPrQ8QUyBJpYGXvjDiMqqvBPcoHcFvskbDPhP4
         vlEbX/3GqarpVBIMuPhXWDqZ3pwcEfwTmtTf5aJKDQ1xpdPLGqsl1PW1cbuSudd61adu
         K58TXBth0Jeo1Ubc4w6smwTInMjL9bvM7ilFVJKxawmVeCYCZpH+q8/VBPyHpwpjFmpX
         8lTGDahXyJyhXaGBpOfe/W3U7EacYvtLG6AvolZuxYVcKsjlRS7ZDcdvB2L/0jfUZtuJ
         cjUdV0GWfkknjgZKA8wXBnPN3mQiLW4sFstkA5XwoD28f3MAQIM1RNSqhq1aGtzHBaDz
         k3kw==
X-Forwarded-Encrypted: i=1; AJvYcCV+JLkttqe4Ly/AeO2Ehh8f6bmogW+LKUPauCy9QgtuD7h2+MFLSSF3/CxpHu4OCBOclAdZhys5xuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW4+DJELLMbU/dVFrmrrFBrrOLXnKlt9ZFExQhoBQqNe0hi/rS
	MfFjRhvsEeDK7E4P3gEUomkfZZMs7P37MA+5GuhIcC1VCM+Hn9KyG/woPrw+X904VSGySFaAn4Q
	+IUKpcYDBeBZl13S3ws1kh2wn9Gf/rVCQLm7HBpRu5taCvkVSYKOIbZc1AZixQ7c=
X-Gm-Gg: ATEYQzzUe06+WJV+9v6GkJl/QajrMO4krgugt/8Wkh7J+3wUQPN9COJM73s2az+Kq7o
	EZaPgF7coIDV81EstZDz8MnY4iPDAF5AFbnCGL23HmGXGYQCZXkRXdlFIQQUhEwh4zszwIVPuFY
	60pdX2RUNABGe1kWS6Ne+gTFjq0bgEO5OBvxhyi/OaI9C6fDxF/yN0fTMNdyknQ9uMfKnIxzlCe
	RbobktaPUSyVpIr/0fo4zD/kSMSzUIdCjUsgAZUA6GwUIsyU6Ro+DSU3Tc6Ohnfx4xZZoMczTMG
	1cT5B2nf7HxHX92D/v2FkX7lwqMkZ6jM7Hd8U9Llr4jxGsdNShtuIYgtGx2At9X5/LUAnZZVMeK
	wiHCJiVDzYug5lVOdmXvI58kE/PnDupLWa8QwVCz4i66JP68zVZR+sBypxGZpWOYlxYvT/k98Li
	y9+n0Rtpd8dqU3LvyB/8rZ/MuybkyXevJBPVQ=
X-Received: by 2002:a05:622a:2611:b0:50b:4e65:95dd with SMTP id d75a77b69052e-50b4e6598dcmr119728691cf.62.1774293913023;
        Mon, 23 Mar 2026 12:25:13 -0700 (PDT)
X-Received: by 2002:a05:622a:2611:b0:50b:4e65:95dd with SMTP id d75a77b69052e-50b4e6598dcmr119728291cf.62.1774293912559;
        Mon, 23 Mar 2026 12:25:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305e31sm2697048e87.64.2026.03.23.12.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:25:11 -0700 (PDT)
Date: Mon, 23 Mar 2026 21:25:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS
 AXI PHY clock
Message-ID: <26twtzbvqcevl7jq6idkhhhasf4kuu6a6p6qby2plcg4a3vola@exafx7os7jls>
References: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c19399 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=XNfRLA5X0yr4rW59EWkA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: j5Cdr1pbV8YkDx1BgbI6GStKxN6LtbeY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0MyBTYWx0ZWRfX3jK3JL6ZEFD3
 Z4G6GGDIESnO74bSfOUT86y3LQLiEFGO04FKGi0Cb2NPaHJ+WdSiVCqKmvJRW2fRdX1V/Z/QmGH
 +nQq5NjjJ+6/wr3vpeDbpWPfA7OSPSImU9ZX6gSw+16CoZG/Mw+B6SJkm1x/gFMff6t7fu0wI8H
 tf3+1rHzhZsobVCf5Oi5G0LYDi8n7B5NA6vwM/H6FsdIGBMHqaYfMDuJd7mqQDRG7xD+JU/imWU
 y59AjqeZg3WtHD8eQbFOQb2cPiQy9BJZLjFxjV1pkbkfgGZmamUiJ0qV2aFnM98r64DuFJzIHbb
 ReLPd0A0ggoLFEePeyKAYC5/bIwtyCZ1tf0Ftxt8AO7hEii826UBXi3AQNmPmRjG0Zy9xdHvKbP
 ED8nS3FlYnNlMy+J1vEzngvm74EGktwGQdpCWSYnLz19Jejxgl64Kzu5xSpA5fSQpT18epslnj+
 GXwwOLXtA9NF1bqqCdg==
X-Proofpoint-GUID: j5Cdr1pbV8YkDx1BgbI6GStKxN6LtbeY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230143

On Mon, Mar 23, 2026 at 08:57:12PM +0200, Abel Vesa wrote:
> According to internal documentation, the UFS AXI PHY clock requires
> FORCE_MEM_CORE_ON to be enabled for UFS MCQ mode to work. Without this,
> the UFS controller fails when operating in MCQ mode, which is already
> enabled in the device tree.
> 
> The UFS PHY ICE core clock already has this bit set, so apply the same
> configuration to the UFS PHY AXI clock.
> 
> Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> Reported-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-eliza.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Do we need to apply the same fix to any other platform?

-- 
With best wishes
Dmitry
