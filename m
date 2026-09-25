Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560374D598E
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 15:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351653; cv=none; b=AlcBf1PSYJfjZqfK88eLKWMZ/0g5Z5Qe+Oody7P5zKUtQhb61MWCX/rv/2T6gOdOwIZcUIey4O0CpF6oRC9q56Nebqyyp6vk92K7FbhdOI19NZUIEVc3xwBB2TtFSVdUlDJnN0QmthdrtFnzxEpNRcL3Z7kGrIGZmPm0OQF1qcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351653; c=relaxed/simple;
	bh=FIyGzBGb+RYhP8IDWtExS5czZtENC5WK8/oieIJLmXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tj0/sedPrbENuqramAhBt/fqIX1JbdxKpMGmtMue7p1fgEO0KTPw4bb5zCk6xAubyvu+1DXwrIhYqSqQKFyqYl5K9f1oWq2d/6JoQk3ETGKnvIfX5l+PDSM5fzv/hJ72C9DTbp3em9TtVXdt/jpQzW9JKVP+TOKETvhVr89N/7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOFG+sYe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPiQ9Vif; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOFG+sYe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPiQ9Vif"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PCZCok1055388
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 15:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e7cEgO8K1Kkv0l1fj7GcpaQP
	E8krEk6i5UR46iPiSaE=; b=YOFG+sYex1D54daS7CVtIP3OcQd+4HMg2+lBaAWY
	Zc/KZbhP137dJVX78uwHNYnFeeXdHIgwmbqRq5/6SmLC0+4dtcccK3SU5JF8ZyMJ
	4v3YjP0TfOxsjfkQYHS1RO+DK8p3+enYKkhcm3HgWwWyT1IbCNwvZbNJIztmwpiI
	0aFBUXvfL8Z3gViZ35tm2Sgsdau6sOqvOXaugeuZeIE079YyTUeQKgCb6gTZpDfX
	Q6f/qn2GzNkCGdDvSLMHu91M34MMdaO76IOAi8cIjDILcvfDwM4HFSEfo1SJxaJX
	TF+RC1UNeIM6Psel2PMH1fMqiKe6WgQieR/iHXRLMIcgLw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce7b5b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 15:53:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-914321eb48eso15938446d6.3
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351638; x=1790956438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e7cEgO8K1Kkv0l1fj7GcpaQPE8krEk6i5UR46iPiSaE=;
        b=SPiQ9Vif9AujZWkhZmMe4CSpve4eQIssMZ2IUtrf5xB11Y/F736l5j/mnpCVGOXv2A
         wwk8MqYl2lxD64zy4yXj2zwbHR5qHDf8/i9Mpu3ZfQDsCMb/Uy/xzR4le8bli9gfXvnp
         u6So5IAL00UYGTws1ghw/vwshQ5+yca7KznXvuIZrnAb4JdYhKDwaaurgRM4qVYwhHEY
         DhTosUtA50fb0dNrK09eXtNPsqdumSivYbrC/VGDrXDX+9FnEEx9yVKhoYcCbOgCdLEl
         nxps79FjjpS7VgvIBQIhY5fklJRn9cJFU4XYapLuQaMJK82Y2cYlQkZsCrAoYN4ByTUV
         KeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351638; x=1790956438;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7cEgO8K1Kkv0l1fj7GcpaQPE8krEk6i5UR46iPiSaE=;
        b=UdgOKzUB91Gagl5wX1lOg3p+uxDtrDs3v/sGI4Ge+Q5fNcBIFT8GhtcLYMK4n5o5A0
         RPZ4qFgIscgS0ILmvHVMuSEDSU24kqrx6jdRYcdWj7M3fgrY9SqFufzLfi5/5q9WUYaq
         fJKzbXqVLwmfGJO11flU41RBf+A6iJOvdq+5Jo/dudXComlxgmvAy/LOOqzu4MtYMNbQ
         IS0XncUAdoshR0IgE/x0gfKS2WfDJ3RCaHzbzu0Vkt1+v3IpWKWL5+Noi1IYpABzjsKs
         QPFE4Pru9sCOG/pvAODyQuG5lJqAsOpjmCYBEmxK6zJUeHK6KfnQr7TNT8cPweYQG3re
         0vTw==
X-Forwarded-Encrypted: i=1; AKwUvBwCF8XCx8HWPBfZy7bN4dde187aFfTTgM7vYbp/PuC0hRmBeh+UCHi6PPOG0dgof4QEWwDsheAADW4=@vger.kernel.org
X-Gm-Message-State: AFuF++nNA4SCOG9dO4tl5Jfirmq772QuYND4AVyzKnBMiKciTZszEVsT
	riVYa+WqXayMCI4Iq4d4bC52Zv2nav6VfH8zhGVGohB+aVinN2ADyA4eECGI0sKVRw8L/kx0p07
	LEBO/sLv+0Q4GYykKAzx6TJws0H8wUllXItwYAT5ueHitAuiGj21Yuzii05yCJ3g=
X-Gm-Gg: AYBFou170X2KPhqxTeaTdo7mpfLwWSFNr6cU7uk57MNXyeje44Nz0VzXzXndHOoPv4b
	GiN7HpChBeiZBvJG6A+Kl5gOd+wGW0DpLdzX+EmoZFWPoD+cPI/sQBxrUaB5NBgQgSbLaRGn5ti
	vqfgPOUOlr7H/IIAmo3RVccHje/wHLhoidNsN6QJlX/NIM3rgvKyFwnPHtuURzt6uc5i8HwUXkI
	P4kiwTk2auGsJfk6UUgLdEugXPYoZl7PjceFjP2pyEylhqPMWMbKiFdGx2hXHTuKg+L1Iu2WSpI
	nKG5sTCg5fJv78CGiOyejiahReuYAFzEmzE3YDeS7gYa4MXQp6Y6+puuJ+x32OrxMWuNWH6auBX
	vu0GGOQo+7Bh00+c=
X-Received: by 2002:a05:620a:4614:b0:939:a9d4:50b7 with SMTP id af79cd13be357-93c43be19f7mr547161385a.26.1790351637540;
        Fri, 25 Sep 2026 08:53:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4614:b0:939:a9d4:50b7 with SMTP id af79cd13be357-93c43be19f7mr547156985a.26.1790351636904;
        Fri, 25 Sep 2026 08:53:56 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm252013645e9.12.2026.09.25.08.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:53:56 -0700 (PDT)
Date: Fri, 25 Sep 2026 18:53:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 34/42] arm64: dts: qcom: sm6350: Add GCC CX power
 domain
Message-ID: <iuuu6v77jvukq3grlng47p7767lzrooln6loq7to2t4emnxmix@zmxaww4lqjdu>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
 <20260924-qcom-tie-cx-to-gcc-v5-34-38732033e5b5@oss.qualcomm.com>
 <20260924110259.19BCA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924110259.19BCA1F000FF@smtp.kernel.org>
X-Proofpoint-GUID: etSsIA5wgZujH-7o5yIAacyoBZK1vc1F
X-Proofpoint-ORIG-GUID: etSsIA5wgZujH-7o5yIAacyoBZK1vc1F
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab69916 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EwBXSBkPT_h72g6H0KkA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX4miggEAxqxrT
 +I9pBCQUnisJr7FSMYmkmVX/XrwW7AySlOyuTpLIivHqulCxyTVVjLuMgQ6MCbSmNNwmloIqvhK
 ApVDiEAh5vJPwWHI3Ie20wFN0OxUWo2NuLiidUjpWimnohP8L8abMFfdK4G9Oxk0RuMLNPmTMjE
 uzJf8kFnPXuuZ9b85QQlXYOA0L9o4wv+lojZnJpRkzPs2IqBNjYtcIdUz1GTD3xlibrQwMPAG+I
 qqW60gcE2Ox+/iMq5jvqHea7h9wiZrEt98/9NPTZKIbCVUsja0DKzIYWQeLYOhJeVyYFx7yuE5i
 Yvd9es6wAza+Lw08X6U0Lsbut8wjw23Pa+Xe1dchiSQhgFwZ1U/gADGsjEHOf9b2F2N+utM72qx
 qSkdpmPVyEqVYyJovMSDPfng/WtdlhfP4aS8pEoRb9yIi+aiOeFHH3+TE0Lc+U/LB/Fbe6o5exB
 WGeWED8TCtgNjp5jDJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfXy1R2PZHzz7oc
 4vfscy3c/2lMuxshc0pt6ZRZv31vNY1L0KsYWqo+pbGTwj3KPILqGP9EijKik46552FBkj4TS8i
 arPrczgSA6cXEMkLUYHWCWeL4LpnORY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250063

On 26-09-24 11:02:58, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] PM regression: GCC device pins CX power domain ON permanently
> --
> 
> commit ee5fe8d5caad7b14e28c23c20f2b192fd4ae6ab2
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> arm64: dts: qcom: sm6350: Add GCC CX power domain
> 
> This commit adds the RPMh CX power domain reference to the GCC node on
> SM6350. This allows votes from GCC GDSC consumers to propagate to the
> RPMh CX domain.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > index 15d38b7e803c5..ded5c3a45891b 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > @@ -794,6 +794,7 @@ gcc: clock-controller@100000 {
> >  			#clock-cells = <1>;
> >  			#reset-cells = <1>;
> >  			#power-domain-cells = <1>;
> > +			power-domains = <&rpmhpd SM6350_CX>;
> 
> [Severity: High]
> Does adding the PM domain to the DT node without the corresponding driver
> supporting runtime PM cause a power management regression here?
> 
> The genpd framework attaches the GCC device and unconditionally powers ON the
> CX domain during probe via genpd_dev_pm_attach(). In order for genpd to
> subsequently power off the parent domain, all attached devices must be
> suspended, which is evaluated via pm_runtime_suspended().
> 
> However, pm_runtime_suspended() requires runtime PM to be enabled. If
> pm_runtime_enable() has never been called, the device disable_depth is > 0,
> causing pm_runtime_suspended() to unconditionally return false.
> 
> Looking at gcc_sm6350_desc in drivers/clk/qcom/gcc-sm6350.c, it does not set
> the use_rpm flag to true:
> 
> static const struct qcom_cc_desc gcc_sm6350_desc = {
> 	.config = &gcc_sm6350_regmap_config,
> 	.clks = gcc_sm6350_clocks,
> 	.num_clks = ARRAY_SIZE(gcc_sm6350_clocks),
> 	.resets = gcc_sm6350_resets,
> 	.num_resets = ARRAY_SIZE(gcc_sm6350_resets),
> 	.gdscs = gcc_sm6350_gdscs,
> 	.num_gdscs = ARRAY_SIZE(gcc_sm6350_gdscs),
> };
> 
> Without use_rpm = true, devm_pm_runtime_enable() is never invoked for the
> device. Does this leave the GCC device permanently considered active and the
> CX domain irrevocably pinned ON?

Yes, but that is the expected behavior here.

Runtime PM will be enabled in the future, once we figure out if CCF
critical flag can be safely replaced by the enabing on probe.
