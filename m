Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E2E3AE6EB
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 12:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264153; cv=none; b=B+quLbTOSioadVSif/rOZ128AxuY2rMF2Ct7aHosaGW56GAKaZ8sjDx4D21pAWMyg5dKfCUQ4+uW0DMNI0kwpV/rZh8wANDu2PbTvBQVHtpRfWLIxiRbhFcrwjOoMlQI8CGFkWwqG3PDeirv04oIpY+6JXANVdIhKlxs4h57RPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264153; c=relaxed/simple;
	bh=Y+YY7fuD9LrO+Sd+3rCyEQKeYw2Y27X6Y7IIOYZzetw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2S9O8pKiUs1gRwtcW9BLXgejRezHgH7fSOR+opfCzQcEbhn66LSgGA+ClJdO0hU+FuxXMfFOv2P3Hfl/X8IvA40pc0jj2lwHuVHifF3h8vhMbb5335f8zHF90Kf9UXOs6yAl0HYlIzz0B4f5s7XcJIQspmLe2K3QBvmDNX1pus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZESKSub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMW0XzEJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZESKSub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMW0XzEJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJ9kk1641288
	for <linux-clk@vger.kernel.org>; Tue, 1 Sep 2026 12:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xrSaMuuxA+xEooVjCUF3b9ip
	BwSv1171iBrFkM/JXB8=; b=YZESKSubBWnr1uIUSJ0VB+PzUVtwyreIdwksW8eY
	5GKXgeX8Pf9Q1pXkm8eosFuu/5oE3W8SrJK+W1uIw8o+vcQzmqNa4hHf8qXGUu2d
	DbYLjKLlXjLuq0ajvWg+NeVnBHy7sovuCWRe0ar/9myDh5zr2gHscS8/nAyTcDmN
	Xf7F4roMl3S3/INTqSgaLJNmLMPyGkEXw+eRc+KbENx7NRqUSI3FNIOEkS9+IS5G
	dI+mkMEIvq3xm9R3mDVuORyVeU7DRmeU9sTuN3/AiiVpEeLB/DOfni8kks0eJLK1
	f2n//Og94CFv/ejIr89i2IinnEDG4ucyQ1cOP2mXg/fd7A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8tfra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 12:02:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cc84451a1so611210241.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 05:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788264150; x=1788868950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xrSaMuuxA+xEooVjCUF3b9ipBwSv1171iBrFkM/JXB8=;
        b=OMW0XzEJbIhk64V83UzbfWZSieXKI9erR2hFdTh/557iBT9grnTIH2QSSTO07xHttU
         vPCBi7T+85wc6YF5Roi2gOtmA+Xy1Mc8WCif6reStNsYFEFH6imRSc4ASdDxRogLBJEa
         drmv8VnW7pG/nc3oUbWcX8CiJzmaZH79pM8Tl1AeXJfMTlkGRrrD15/GLV7HxEzz8Uau
         SNgtqcGU6osps1xb4WPj25h7zSsy6GX0bzEUmUdQ64z850Tks987W4+H6KwOmEUvbjsC
         reKv5x0h2u6zkULBvGRkNdi9bCCrRvyJgONKvbOcCrHymSY4AgkONl8jWYhJbh18DBCC
         hAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788264150; x=1788868950;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrSaMuuxA+xEooVjCUF3b9ipBwSv1171iBrFkM/JXB8=;
        b=Vtrm8Chv2CzUru6hbdHdRX58L7r4U2UNjfVyFVLHamCLwcQmPn0JA1ex453VgKRqhl
         vhYEf6ZIDwaAy5UOA2epD6Wk2meeBH7EcnUQRs/Dcz6yONLalT6kGaQtEVM7sHKC+FT8
         qx8Um380+RC8zplykzQCXvPiHtRby8zjNjHge2WRVtYfSLPewtWHsKOOeUYh8ysE+YjT
         3Dz6yJF7tQx64IWWQjKiCKqQZOpu17vO0Irt5rPM2iJyc95TGTTiioQf+ub+Gvvw0jBD
         QBKMbJKVdy+TjIlJkkujmlTXitXtiWZKvfhCCPR/LDDA6QVW6y1LJ6419G8k52RHS0aT
         REqw==
X-Forwarded-Encrypted: i=1; AHgh+Rpr6I64IXznsg8ulbfYWDxxAJ42xUY1eiDu+NXoBZA1GltmlIzOWkIect0aY0HI41q6al8o+g7uVYQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nSQJITX/9ntCIenH1prZJuQFAAa3rz1QIBcJ7pQcD3JpjdgKGS
	h0hrUdrWhCuzXQHwU7bJ3RXdC3wjKOlZ6igDCe1J1Gg5KR4jna6VmvV9nNUernD0M4ThW/eByqt
	E0jFG1t23OPl5t40EM13uBYnAUxLtV67tns0kJ5Da6F4fASYppogiQZcReWzgDQ4=
X-Gm-Gg: AR+sD10igh/qvaCipa+eBBgrNuKXWTmFIMSpcy2TUVrlDIQ2Tj1YfojkMwmONTfttPM
	BNL/crHTRpDA0rwkSQ3QbB6PqqohiLZyiVTbVAQvp2lMaCZMrig3TbJSTLPLYvHLHkaxdIG+bkt
	kFxT19pVek0Jyr4YnWOMNGgqSZUTv/T+/VK82DctSABkegn4gZSqQ7rktEpzz+QDHWJmTNUBS6c
	xYWjmZfsKrgaFkaVGJUwp6fNcJcwMWjMN+UkNTrg0XdANehPMFeY7krvx/vkMSAuJWVd+o2qHr3
	08j7Z0sEmpc2Ftte2a6Qcy7KC/o4K6pvYNP7Rc+z/F5BEw4GksYk3KcTGCPmfqTlC3qEHiE9xhW
	vzLfKQo55Tgvrm6Y=
X-Received: by 2002:a05:6102:c10:b0:77b:28c1:210e with SMTP id ada2fe7eead31-785967c8f7emr12106829137.1.1788264148117;
        Tue, 01 Sep 2026 05:02:28 -0700 (PDT)
X-Received: by 2002:a05:6102:c10:b0:77b:28c1:210e with SMTP id ada2fe7eead31-785967c8f7emr12106780137.1.1788264147437;
        Tue, 01 Sep 2026 05:02:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce18dbae2sm18891085e9.13.2026.09.01.05.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:02:25 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:02:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        radu@rendec.net, taniya.das@oss.qualcomm.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
Message-ID: <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96bed7 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z-QAWnQ1IDuNMEsj6QcA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwNyBTYWx0ZWRfX8/DCUgS1/rOV
 YJ+vk9ZKiiaCsrjm8kSN6VKdBB6gY1YxUVXD9+0XTWq0aTkG7Jqroj7sIBkrdipwHB12429NLFC
 8pbTx2PN86mWR5TJzIa85f+qtYpLg86VdK7QQmr7pXxiNTLY7SxMoVO4Ar9QDMN/g0xLRPjXq8A
 /TnZyxSdBq0A5KDJBIE+Lop/SXMuELZIDEtrUc6eukktgf1gnIJuh2EVM6X3U+b5Ut6QOV58SI4
 rLZu2gfWZ58lXG8U+pTdV2N43dAqjmGcucdO6yA5D1Z9mTiIE7OUwMwPUduGUUAVnf8h6Jh/XKx
 TNJY6vk4PHVBxizr+K0FogL9AHTkQC1iSLQ3wZdPIG8sS9n8N8UvbZdN6oFFtkqcqPtBBV8JRbC
 I23/o2Huht7rTdMBo9NtGUDa66CTER9fVsXjbP/0jG4zju/T0Rbw8tQ8/UC/OQVi29VhnPRR1XW
 GBQZ05bQsZo9xvq7z+g==
X-Proofpoint-ORIG-GUID: ZGcVk7QfhRdFS0d3JBh9k6UbXWtbubqP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwNyBTYWx0ZWRfX4/+7XbCRTva9
 l2VZUIQxdCdwpwxf/tXwfgkZOuwtFQcTGKQQnssqP0QfV/tZ0EzdqAVIIyRVB37yw4rGP0aThU0
 uL4VSj8S6PyrUlGuDQnjkvf79/PkTW0=
X-Proofpoint-GUID: ZGcVk7QfhRdFS0d3JBh9k6UbXWtbubqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010107

On 26-09-01 09:24:35, Sreeshankar K wrote:
> This patchset introduces foundational upstream support for the Qualcomm SM7250
> SoC (internally codenamed Lito).
> 
> SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> and 6x Silver Cortex-A55) and Adreno 620 GPU.
> 
> This patchset is organized as follows:
> > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> RPMh clocks/power domains, GCC and cpufreq hardware).
> > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> interrupt controllers, clock providers, power domains, and reserved memory.
> 
> Dependencies:
> This patchset depends on the following patch:
> > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
>   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> 
> Changelog [v9]:
> > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
>   Make all clk_init_data instances const across the driver.

You sent 3 versions in less than 24 hours. Please slow down.

Give a chance to the reviewers to have a look at each version before
sending a new one.
