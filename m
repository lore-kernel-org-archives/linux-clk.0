Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892FD302753
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942884; cv=none; b=qxWASZwFmW8PPl2ozzBx5bZRxHAqG5crQZvF0/m301t0KNR5V7MCV/TZtcIesZZGTdWLYl4j/kpWca2A2TzRm50JlFSk97fC8acntUz5euFK900zlBeu012gRrLX/wbAXTG0mMf0NhMqcAc37r8z2gDzKjyp3OEJwH2UMZNxW44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942884; c=relaxed/simple;
	bh=pJPGBRk+cN1hQVyUJDNsHIogDvWgEIuloWQf73ADokg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwzotG7TjHMfx3vWLkwKWjeffNOm3FBUSnsGbb8yw7MMEOlLc6vIB3Zec6DMt6ukb2BBxsciTK2vvutT/2ZPCC62f/R2FhH5bDyxlMswTeOVDyQoIWwjSWdTS1/Khb/sEjYyzyqcwd9/eN1BkGXIlAJhJ7bLhrhl31BN97hWgcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=juqHdan1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWPho7pt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="juqHdan1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWPho7pt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6898PvOc639493
	for <linux-clk@vger.kernel.org>; Wed, 9 Sep 2026 08:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4SlGIdM3cTMUMV+JFnfbpS9d
	9pPhphCilaasH/UUBmk=; b=juqHdan1O+ZWqt4x4J/efiN15firYzahq6lj8bt3
	avR4jDDbLTtPrv2oGg0/Pd57mNmQA9LREbSrawBwTmRqfTC8yA6F3vyleiPyICVW
	WG6xkK7P2zazzbryJiTwaxwu3Qyw9mbTlbOugxeDxxAb1K7MR3P5EfkAih1Tasxj
	B8tkI9T2WF4FobAcLqcJbiiVFYKTiJJ0DdEqA2VIQ0lG11NYCU8+fqip6SedW2uC
	mpQhJFfmGRrGFRDfGWV847ML1QAmbHl9SlMWG/2TkYRwpZDLgdZaPQ7mHRYk4F7R
	IXH0J0pSIhcA0yfSSWz7g3XbqMvCG+N22fqEnQ/LL6/goA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxqj9a4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 08:34:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3734d06dso78134045ad.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 01:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788942881; x=1789547681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4SlGIdM3cTMUMV+JFnfbpS9d9pPhphCilaasH/UUBmk=;
        b=SWPho7ptLsxv5hBYwG7flFC+MZnG92KitWhxtnzZUpmt+5G5/j/pbzowF+ZaGNl59/
         Y3oXHKJcpO1lE717syqexi7t/ErC9WyN2cicJZXsWa49IE1oeFEqnMy/eDXHC2oNBQPf
         ssEtK0T9HqSBeicn9JFDqfMFWvIpGLSFWSddxNFa3lSUrc+EfLLrqUYQzH4q2fDhJ+I3
         ntcqobSF4EAk0qMQbaKDoypa1G8HVWRFuu9PHc5VQjdm92WVK1sL/9PbCIfGUzZlUGog
         xlBI0gSNvYjn6WeNWPVYm1PJPaPzsegvmZxbHOB0f933EYkWAPWkkYbVgbpPorOjvi0R
         fFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942881; x=1789547681;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4SlGIdM3cTMUMV+JFnfbpS9d9pPhphCilaasH/UUBmk=;
        b=iwX2r/9e2MBpDLSbTkzNQpOrY4MYOaE5iIXYu3g0n4uffzvG7W29DdPZo5DVNQFqlU
         +DS86ve/KfJehoMLduDRPB0bgZ0S0SwrVy4EMFC8ObtdYglBP9Me05o9ICJHhao8nmfU
         dNkOAb0p+kEtfcWvTqLBEgzVUpbWEcaBeFioVu5+XVSw7Sr1s/WxW+ur9gd4KfnJgQ9x
         c0iBdw+C8P+SnQ2c59kuWzWRpodiWfTKPPynnnVZtpml5VnmiibvsfJI+iuXFTc6HYJz
         /Tv5bHb0COfICTb11aoYBS6xOqdT+DHQtJjgdnLDQvUHSfNTQxCoUKiKnLMSGNopCdvs
         EEGA==
X-Forwarded-Encrypted: i=1; AKwUvBzNF5LG2wYiMdptqHcV8VJdMoO7Cg5JVLTyKqvGMte7a5C9I9QAokRi4haqZnXy8/k5k7g9pdDYZUE=@vger.kernel.org
X-Gm-Message-State: AFuF++kF61rXiLtLf6aErDFO9/oqwjoqlG6oatjmBEXy1QKngO8XUt3v
	097QvQoIWAlhYP5JYBXP1P0MTd0iakfkYEw8Z35GW03CCc9VxWYA3in/hTgL5O6Lobel8j363dh
	u0RWKW5/bKhZnkL7hoeNK64KBg2A80m1fVbbWr/la8G/KiSnN41zSWQM0T66pfOQ=
X-Gm-Gg: AYBFou1H0v4bmAkao2OZ82K4wTccBFjaxPgXAbxfa+gawEvHuDysQ8QYIoYbpSjWhyW
	NnnNLKSLWyKvaLaqSrxeOajcuQrD6VSQ6v93qM5UVRPD04Ji+FnlLj7ST+OC9ZElrDjUC3aIh/v
	OInWYhVd1eqYtdu/Rhp3AJOUQH1l1no8nUXVKfyf2j9DE+zgE2EEdacUq0IehNmcC8zt4Z2WJ3N
	m6QILU0PyQVija54PvxBzKzkCq0VjQOhHikO6gabOSkEdoKfn8IN4zIM2nWEgAFWXMNJgRIdCmo
	f+64w+/3t7yIGuzE1sKv8OcLfOxTr3/VWHY83T9uDk3qI2aZSCaKUpj3D4OEO1oFZJKRhOQz/gL
	yAPyq6awAkI3HyzF2wuC/8ztXBrW5TXKyUhEK9y9EbFs=
X-Received: by 2002:a17:902:c1d4:b0:2d8:d4d0:792e with SMTP id d9443c01a7336-2db128816cdmr310682785ad.18.1788942881094;
        Wed, 09 Sep 2026 01:34:41 -0700 (PDT)
X-Received: by 2002:a17:902:c1d4:b0:2d8:d4d0:792e with SMTP id d9443c01a7336-2db128816cdmr310682355ad.18.1788942880587;
        Wed, 09 Sep 2026 01:34:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm47133770eec.30.2026.09.09.01.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:34:40 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:34:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: qcom: Add Nord DPRX clock controller support
Message-ID: <aqEaGuCwBRnld3db@QCOM-aGQu4IUr3Y>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _-mGBG0AMplQt6atAV8WH2kHC3IcgUxH
X-Proofpoint-GUID: _-mGBG0AMplQt6atAV8WH2kHC3IcgUxH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX5Lh3uy/U5MYD
 6mNUvkjovOdzAzgdXV7dicO2VwX0g7skSyRsGBodN5YBaBNOJiBcRQds2hr/aOHGW3mqL22BVbg
 wopLKm+CabbTyb07qcM+oeSExIIsr8bdtDSHP9y3ixD6AeGLdOskJo/FyBrFs09E3Me/pJRdSol
 bflRYvLnYbyq5WGAhgOtFMyAyYYdQVcXqUCx3fu94XHWulKZpA1cInp4LoP4zVemjtOfCdusNK+
 gBHf9HIpDDv5sWDSf0U6UnvzFe5rOD0r04ndUCR1tBdIaAxR6H1Z0qjBf+5/67+Md6+ymviAbi5
 O8Z5sAigL9B3uzgIX3HwCPwk4VIXB6BHfJVjN5J3RHgwTX+rQl7k62RvR9o/mJAnFIxNIVciVuK
 ugJUq0CH/Pl1x3KeuuuULO2TJWtL44hnj/jN1N38Kfv0QpMxDlFWJnOLPH4R86z7ft3UWBakpjS
 bkzJoKOarIxTwe8Z+TA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX2/UTH+xfYXYf
 ao77ekmqwjE2ENzLf01bSlLiGyCEwNciYfM+UM9XGvnqTZI0phsWIiJvvANaLwWdCcGffCyIffl
 UhA/Ik09DbCiMSXNQVH8DKjiGmlcsrw=
X-Authority-Analysis: v=2.4 cv=f/p4wuyM c=1 sm=1 tr=0 ts=6aa11a21 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IoEm9MQS1YtAEnOBX-UA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090094

On Mon, Sep 07, 2026 at 01:56:12PM +0530, Taniya Das wrote:
> Add support for the DisplayPort Receiver (DPRX) clock controllers found
> on Qualcomm Nord devices. There are two identical DPRX clock controller
> instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
> audio, AHB and video memory paths, along with their core PLLs.
> 
> The DPRX PLLs are ZONDA_OLE instances whose PLL_ALPHA_VAL register has
> been widened to 28 bits to carry the fractional word at a finer
> resolution. The existing alpha-PLL core derives the ALPHA_VAL width
> solely from the register-map layout and can only express 16 or 40 bits,
> so the first patch adds an optional per-PLL alpha_width override that,
> when set, feeds the recalc_rate/round_rate scaling and the Zonda
> set_rate L-adjust MSB check. This is a prerequisite for the DPRX PLLs to
> lock to and report the correct rate.
> 
> The series is organised as follows:
> 
>   - Patch 1 - alpha-PLL 28-bit ALPHA_VAL width.
>   - Patch 2 - documents the Nord DPRX clock controller device tree
>     bindings.
>   - Patch 3 - adds the two DPRX clock controller drivers.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Taniya Das (3):
>       clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL width
>       dt-bindings: clock: qcom: document the Nord DPRX Clock Controller
>       clk: qcom: dprxcc: Add Nord DPRX clock controller support

Hi Taniya,

May I ask to be copied on all Nord patches? Thanks!

Shawn
