Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603A13EFD31
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562262; cv=none; b=RkJAlP6oRNaRXBU8ghD8ej0ML3Dp0Yz1Og9pYJkaztCxzz/P72xrw8B9XyEFq9vHPhG6mibkatN8j85QGbTUZ4Hw64p1/8xxvLD18CeS3gAFTwNNLpTcI7wkt5vZq9hR8HDB+XB55b4JKtJOH+lmw0/RIoW/FD8yiA52NgCaLek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562262; c=relaxed/simple;
	bh=7GtKT0ZmVger2XBJrLywvuYtDWmOa4M9hkNkuOLg7fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQy07OomWns5AZ3N8ZF9rYEgkVDiLeTGD/WAxKAE5Wy6wjy0RI2+VM3T7v8IZDJO5tP02PeKSNuwTkBZ/agysJvNXtZi3uItDFNxn1vzTSN6OAjC+o66Uc++pTSHgBnfvGb0QZ9az/0FxaFIgfG9/DbUx+k/wVFKqNyu+ON0wLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUYn09hO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9nK/rwx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUYn09hO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f9nK/rwx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O8UBCU3019546
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 09:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I5iXFVs0UWlY/4RpvmnF6UxK
	I60QKsGEgwBkwUkWY2o=; b=jUYn09hOOHBPOcKUjjfNmtyHoA2FSeKtA9qF5dd6
	Cfjzz1hi355PwFBlnxaFLT041s03xZ6dd3S1CbU7mdqNY+SdbGftwpEGE8XfmA9z
	CPwXWX77lifIJCMRTI9uAhVtJ3D2mYwxcFZGcFXnzSHIAc6xpHDyql2smqdjIj1B
	yYL8KRtEDV49gtvnY81BuxByir7QsSc6UrhVPX2en7wQjPtGDz5s8vGrrJ74AkVH
	s3cRdsHd1Ss8FXGeV8XO0eeJo95yL7JMTVr/8sgjDbp72mc5x5M2Rt0v59gxvoz2
	JjONkRYxdomnAU/7kaRv0OeUVhxCvH8VD1MCFBpKhg+CdA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk05vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 09:04:20 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738d9935e23so847672137.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 02:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562259; x=1788167059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I5iXFVs0UWlY/4RpvmnF6UxKI60QKsGEgwBkwUkWY2o=;
        b=f9nK/rwxb1YkgWNTv6w2umUYKdT3TYeHnFvfSvR8QjTav4O52OT26sHyrXZKYF//67
         eiO3fFCX+FJPcbvuDNFFxqJM/zLZHBhoA2wZecUzVFInIIGW7H8+va6ENbipTonADp/N
         i98FyjGjK/drM/q1n0dIOBBSZDMgTSMq5qTZn8AnybrQ4v53brcYDl0TTfmvWW8D6ik2
         +2uZGlORo1GadVK2S131KTynVV3rXTXLFt43Zbl/Lt5PjWg8MlpTkX/d3XapZN3rcpBj
         rQVJtDfKxSPwJNa+iiixMP+TZRlVGO+ZpwolcBijSOEIJZYyM3LpAz9qYttqsqIMh1xK
         z45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562259; x=1788167059;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5iXFVs0UWlY/4RpvmnF6UxKI60QKsGEgwBkwUkWY2o=;
        b=d3wKXK6zV2V6/MatJMVnm4n17GRy18TiP7OQ5onmVxY0MARZ7NgVwiqhjXzQr3MrG4
         Dp7J1HSFhvLImxtLqHHZbuE3P2YK5LY/XRlQxFWNhQwT8vk46wXWXP64qiRDNrz0XgUu
         zgQoun6uDxmAGK6PrJo+Y9SxusinN9b5zmS/YpW9gI0QMwpllevWjHylms287n5Q2o0Y
         ZtG1Dz22jxChRzyr1rlImb9ODcwRR2E9B4QPFh75uAU/3nQ1n+8bk9ryLsdpxrGi5WDo
         jRb37x7WMHxGImK/Gork5FGHIbh0oKLJhJ/aRHXB21NTjEHBNCuRIgQhXJ0Z3dIqqWV7
         g/tg==
X-Forwarded-Encrypted: i=1; AHgh+RosLkVOfqXxG7mYbF1nlVmr1U7TU/x+qYYh0Gu4A+syaoTSZTu7JEylIYNo5UaH9cF8Hw+nFuJrzLs=@vger.kernel.org
X-Gm-Message-State: AFuF++k3rPPWkJ83DF9rwbbtkniQRERBXjbv0pq4M50urSueZyJ58X4B
	bgw2nawRyKkTxtQRnHO2WMcyudVUxpDAQzv5+3xwQqhP0JNsLLUVrHy+G6dDySQSLZBlR7Soxzp
	oyue2F41eJaMacJON4v5v3lXnydvHLYCU5hggthNjVBt7UQ97c2V0CELT0w/n4To=
X-Gm-Gg: AR+sD12tbc+X8V3UO+++vmxeKUhBzfL0t4DUA01+hZMk2zZ8hmBLVUlUQQIe0zGl7Yl
	y5jzN3OLw0zuXe4rNXqSDfUjdgNaco45cG5rshknwJ7qVRPBXgA4qCZB4yezL3iQUS9MxW2uaN/
	3Xr3zopEoKX7cZioSobP43/722byfLhivv693h4SGyJXH4e7U2Buz3MTlMUbTthT23d855XLlpe
	NZJXa28PH+iTI9wZVMW9EXDbt53cd5Jti/XruUeAmBzNU7LYEisEGG4g2ubaFtd4w14wakw+cKU
	V96+mdsE9ahAACzkU/7dLsVxZtH3lZFlgHtsNHN1/M96Sctu8vMidmCUfiMSDbPkEVORUVFfJtY
	cXDkfMyy/kA5ELn4=
X-Received: by 2002:a05:6102:8092:b0:77f:2f7a:f07e with SMTP id ada2fe7eead31-77f2f7b3870mr439465137.9.1787562259416;
        Mon, 24 Aug 2026 02:04:19 -0700 (PDT)
X-Received: by 2002:a05:6102:8092:b0:77f:2f7a:f07e with SMTP id ada2fe7eead31-77f2f7b3870mr439431137.9.1787562258866;
        Mon, 24 Aug 2026 02:04:18 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e02a8fbsm10850642a12.13.2026.08.24.02.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 02:04:17 -0700 (PDT)
Date: Mon, 24 Aug 2026 12:04:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
Message-ID: <qy4dstdfwguaalr6ildd5esrskx6yxi2zga2my7m32dtx4icne@n6moblldqii5>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
 <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SYTjQpvgIuIHLwLg0tOQYC7hS5sfTnXO
X-Proofpoint-GUID: SYTjQpvgIuIHLwLg0tOQYC7hS5sfTnXO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX7TGBgdYFtw0m
 uV9WoEIpCmKEfRFRkNe1vAK5xsbfn4OyDlzMDxsQpX8e8UY8IDiKknVs8raAB4HUuCp3LMab1ci
 Zc5wkQSXQ5VUCswMBHZzLUEHCMvxD5M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfXxswn/rBFhWUb
 67Irtid/DZF3UnwkP4QB4D2UK8zHcT7AGJFMOzpb5IkThQg2DZ5kmowwaGYj8p9BMipgazhWunF
 /nalXjLRlvcOxWu2vE+6RXAFgjaSM+63OCW4xcMSP2wNJg2MiYdPJbwPwoaLFH9CT4pQ2rk2SXg
 etCuFlCDpbOLYWsFM1y3X/b4G3QGHNDYIM1a8OHDoceCyrFGOwzE7IYMcIU7OD8mrJA4CDbdFaR
 nr+0A2K2bEpJ3+GhQjFnmFNzgoVdY/oFCgeOmTTxLfwB3ivdiqzErQG/6tVV9V8rixnNyOJPWqG
 jrOBIHiRTJLv8KQ5B+AcUUeq0beBDpPDgXM5FPMGOUQcwiKLERFGXxHTlr7eCHatYSgs7+70w2a
 FmxGS9HppzVthO5aXbZ6qPUjLQJnghHsOSLiUwONWcGG7eEqxXP0fz5Dzaj7QzDTIjr/yUr9J5Z
 UY5CHXnSwkBtwdexUwQ==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8c0914 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vkuWnLlI3icQtIAv_MEA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240079

On 26-08-17 12:10:06, Konrad Dybcio wrote:
> On 8/14/26 8:30 AM, Pankaj Patil wrote:
> > On 7/15/2026 6:59 PM, Abel Vesa wrote:
> >> The suggestion of having the CX power domain tied up to the GCC
> >> controller started here:
> >>
> >> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
> >>
> >> and then, for Glymur, it has been brought up here as well:
> >>
> >> https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
> >>
> >> These plus a discussion off-list led to this patchset being done.
> >>
> > 
> > This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
> > Reproducible on latest tag next-20260813 as well
> 
> Yes and the ""fix"" is to disable the GPU nodes because the custom
> runtime pm dance done in the gxclkctl driver keeps a vote online

I can confirm that disable GPU related nodes does allow CX to collapse.

Had a conversation with Taniya last week (off-list) about this.

I think there was a recent fix from Akhil that was supposed to fix the
GMU recovery, which will allow us to drop the pm_runtime_disable() from
gxclkctl.

Taniya ? Akhil ?
