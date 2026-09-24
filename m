Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C8443C7B4
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 08:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239833; cv=none; b=XAa8I1Qki/RFov6kZInfHsCji19RacVtBpCSPL3RwaUPbmjnKNWyC+MPLZVoN/ByVZxPtdVKYih8vgP3tK46YOY4ZpYKa8fyoyoQuzWWHIvJ/o6jOm2ILxwGJ7Zm0h6ncX9pIKMHkgxJRlDdJY0AHx6XaRaA0u6gxS1WEIiA6PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239833; c=relaxed/simple;
	bh=hPMLvh4B/qutHl/1Fl4MO4beSnCtt+tFPmWl1Tf0ZII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qzespx6O4Ff8ZJ/2a19DQbPkcmMFQ4w5luuyzAUPHyw/dKQ5/YSOZOlgF6XdBxMk+0Wce+ZGKF+00k9X/JXP5q2NQam/NeYlYhXljCufhTpF8mr/3qAm89YknOClFPQEYbo9u7zDbHkX/TU/aTSHnh8FjmgcKMhvuhHIg3a3i1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHGTMWb5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YaKS899G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHGTMWb5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YaKS899G"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eKdx1898759
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 08:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=azU4cXOkIOMdloNfjSq8Jjao
	n75fPsiVrta7+Ugvieg=; b=XHGTMWb5F8EBM2lbERFdlwJBxN9bhaWMv+yAQKXZ
	SyC+6OBvmo3c76liw7hiNHJKv0pz1IIMRVL4FKsu6QiXv5o27OHE53PrsM1zj9O/
	h8xhzLp9lYc6RokGdgyubh44p20TmeKX/5P2VFHxRcj/ZW/7zs3+QrBcd5DlE7mX
	4w1h2VVhm8S1YVPCNY5yGCN89FeD7HJX9fhfbUG8hcYlyJhSD064xiBqTbEgwqjk
	CDXKsiUEr61CmI34PchFcwDRJfpuF4Xjo7m0NvgdyUKZ0vfIgV7etsUBtTRjxP5w
	Nzf7jpYNThbqZ+1PgMJgP7HXjci5tRWQdJ02EmTlX52laQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb64r94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 08:50:27 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1416f32fe11so2787246c88.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 01:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790239826; x=1790844626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=azU4cXOkIOMdloNfjSq8Jjaon75fPsiVrta7+Ugvieg=;
        b=YaKS899GZgzyLhDw+Poxv9fdAW6M39grcz8gB1aVx7KN8ut89358fYdb9zwzHVNY+2
         deNaEXoYRWsrwis4yXq/1z/HEkEtck0CyPUQUIkOnnpEi2DuS9XTeyNMy0cGydytnHj0
         PrQK3q2HOzVz8GvPhzt5FFq8eMT3n2uX4kOCWLFIn7SwZODHK1Miq+w/Akc60mOiAP3F
         IlT0HZLNzoaSmgxsJ3bSk8NR+1GhPprcL/XViPPu2BNG2YDX5Bl+xVD3+0eMA95DhOOJ
         xfZ45aFVRllI+EyU1/mY4coOhHGlMx8r2vTicbCQVuTSBMV4mvLeZnD+GpxHUjDqPOzc
         Y/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790239826; x=1790844626;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azU4cXOkIOMdloNfjSq8Jjaon75fPsiVrta7+Ugvieg=;
        b=dI7+FqdoIZSMwmiuPOl2q0xxrKmcR9GAD7enfMs8lS/iVplMkEsb6Kesm4BnJifx/v
         wtNqDfIblZI+fIrN2vjRgIVz+DnROexDtA1BT0EZfhM4RAJH+AYAZ7FMegNptkiPLmzc
         qEvYNAuAUSiZI1LO7JV21RatZt403hdRDBx9n5yO2PEuia1FX94J0lLwILF7qcjnfBcm
         nwiokZZpq5DzQZWZYBzR3EhFELgxboVUEprM0qm5oGuV+73hfFRe5lR+YLIdEn2aRRja
         bFCkT4F0rk8xC5w3GJH3/eBi0O+UwcE0HvicA2AilT0WIp2+sGeOqt5pXk1q20hXAImo
         jnVg==
X-Forwarded-Encrypted: i=1; AKwUvByen8uauxPyY+y0uvk/43PB6TJBAOr1stnEiCvO2FO+MRtnhKRNITZvrO4KsQuDeH6nUmLZ2cSRvXI=@vger.kernel.org
X-Gm-Message-State: AFuF++mZp1YRfyvdbLvlfSrZuN3GeDhI53PvmfEwHN8P8f1LjXUgDu92
	8Om/H1SFh7B5Io0XXYXkamlGit6s8ol6DFp3RzOQ0yjdx+wQYB+K7QTByBofAUSSGazRzjwJmNH
	mogK8XpVfrPy2Hl4DlM70rLJcqgxH7y8q/kPbhcCJn1IEnWPOBkdot2m/NahK2EY=
X-Gm-Gg: AYBFou05qnUdHoVLR/wLbTaPABhKtSiCCZjmxocD3W1xJm5d6g3TmJbZJmtcLGL52lb
	xN9xly7nphtDBOhaudLhSrsiCe56t7NrRSumDLyhzeLi0LP/uupwUYw/oT3aWO1qHmPU/hcDPKo
	rr/SPharrUnuMDxBLdk5tFgPBtQarLObhJW8hSzVS+s2uzHKyLCjeIWtUIc5cGyqb2wMiCQBUhi
	OybsWfOjsnUsXyuvorXFu/F6U93GbEjdVVx0Xin0vNqEBAXRJn3IfhshPe2n593XnwPkwYiVsVK
	jVXaYi5eCayjcd1nR44tTAlsPHK8XS5f3klGzhAU+/lIU8zroXECi3f3WKXv5TDqVT/GZRe2+zn
	wYrxNfmR1CE4eJ/BeFUxcI1ilZ32wjvoTASoWe+BMYA==
X-Received: by 2002:a05:701b:2919:b0:139:90ab:36c8 with SMTP id a92af1059eb24-14503fc0640mr1286633c88.1.1790239826130;
        Thu, 24 Sep 2026 01:50:26 -0700 (PDT)
X-Received: by 2002:a05:701b:2919:b0:139:90ab:36c8 with SMTP id a92af1059eb24-14503fc0640mr1286485c88.1.1790239820824;
        Thu, 24 Sep 2026 01:50:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f986e465sm11885603c88.9.2026.09.24.01.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:50:20 -0700 (PDT)
Date: Thu, 24 Sep 2026 16:50:13 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] clk: qcom: clk-alpha-pll: support a 28-bit
 ALPHA_VAL width
Message-ID: <arTkRbBda_yzklux@QCOM-aGQu4IUr3Y>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-1-fa4364e087ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nords_dprx-v2-1-fa4364e087ef@oss.qualcomm.com>
X-Proofpoint-GUID: DTgL3tZqxCW9pwZRw3J5SYLbXoyASU7-
X-Proofpoint-ORIG-GUID: DTgL3tZqxCW9pwZRw3J5SYLbXoyASU7-
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab4e453 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=q38Eq4LkVyZCF8x0k14A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfXxLiRbX6LlnPk
 K7RCcbsD2nTYI1nWbE+wRJ0IfwQa5BIr+hNUWCJ7F6Y9mE7+++PrWTxwz1347JMvLIlle87Ys0e
 baNbdmmprVR9ybeBq50j57GBlaEW/2c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfXwEWif+Y+1Y/9
 C287rK6ggMDea3Aoo6bNj4ef7IWAkx9sFf0zspmDg+Aj2YPI1La7hKQmIu72Y474Ndpy06Bxwuz
 dThSOXQF7YqOxfrsUKj0amMEjxuvUzj/HaOmEreCbTyG30b+BZ28c5ERJzA3TqZbejy29f3vh1k
 mqnQP9EsJZOzlp6nPZL5a94/DFNF7lpZZu2lUZ02rBUfNEdPVyelI0sZSAshLw6NzwlSSIzCCVB
 YUhAcSD/5kcSvXAT8248HYFCG2Fma+wNbhrY7jmbzsorqWy5zJGjLm4ifu/bXxSrBqcT/57zabU
 sINV8P0hC9a8OAW5zEgjpapzLTssTkDGG+ZubT9CTP7KI+zfORwkazxgy2fC6ptENhm4h/YcWGF
 KIaKXFmhDHEK8VAfH+yZfxi1HNa72s7UudowiOod1ccRboN7NsdyzwgrrfLRzF/Og2Xpb4O7Krk
 7tGV0FxmniUlIPe0lWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240037

On Thu, Sep 24, 2026 at 12:51:31AM +0530, Taniya Das wrote:
> On some PLLs the PLL_ALPHA_VAL register has been increased to 28 bits to
> carry the fractional word at a finer resolution, for example the
> ZONDA_OLE instances on the Qualcomm Nord DPRX. The alpha-PLL core,
> however, derives the ALPHA_VAL width solely from the register-map layout
> and can only express 16 or 40 bits, so it programs and reads back the
> 28-bit configuration at the wrong scale on both the set_rate/slew and
> recalc_rate paths, making the PLL lock to and report the wrong rate.
> 
> Add a way to identify the wider register: an optional alpha_width field
> in struct clk_alpha_pll that, when non-zero, supersedes the
> register-derived width. This feeds pll_alpha_width(), so the recalc_rate
> and round_rate math scale the fractional word correctly, and the Zonda
> set_rate L-adjust MSB check is derived from the active width instead of
> a hardcoded BIT(15). PLLs that leave the field zero retain the previous
> behaviour.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
