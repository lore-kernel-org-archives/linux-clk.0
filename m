Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666323DC4CF
	for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034820; cv=none; b=uOAQhZtnmIV5Kq74X8MgR++8UUczlHPFE0wnAT0WI8HkRG1tQua2D6jV1WCsTscWr3hntKGbwi8HZAFmtHad1Trtea6BrsN4yYa3Q3uj+6SUW3JvbSqFdjerLeTVm00RfR7tp8bOPuBI/P4m3dvs2+g6GAMrjYFmuPBLavZwnBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034820; c=relaxed/simple;
	bh=Lu+4YHeK869dlBqFjL2cKsywYYlR2fLA8uGutCF0fo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSlb0xLzDEDZn9SOow46dVEGEG1e3dALR9PVioi3AzmEHlq4iw/VkCrANzcGOxAp0djYlHGINvqVPB4VbXNE8VLpExpjkPg+NL9uT88yw8Y0bNS2KvonrnUF11UtdxnldSc6YfJifKgV+WBeavfx160dusFZz3oLN70k4pQ2UT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MduJzZBu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrNAtIuZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MduJzZBu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrNAtIuZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8pskE475067
	for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 10:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m07hojNF+PinLLd/x/EaU/8bPalFdykfrNtvmsSaQew=; b=MduJzZBuR4WoYLZe
	K3ACfyBachN01Nz//KQjBXdap9pw4dZ1/TiDtWBr9sD8g9C9GUJEXehopdN5Ulzf
	OjTawYnYSR0RpIcweJSAtqibfUCyYStMG3RWT8ZQRYnoq+Cqyy89fR3UrjlLgxBj
	v87Vpc4J1m6HsJ0pVVi5Hiddzl5LMF5T5JKNPz/I5NPfPavHqYMbYWI6tDjnHE04
	CqWGalcCXywY+w36mu5LMtzBTHc3aKEXoRWmzpaleddSilKbXuxSHSRcJiNCmFgG
	fFJyv9VqfrEez2hsVgy2BmhAPHTPEfueEtYnuO7R34jsdDR2j8861AFRa7gzjEvV
	iON1EQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygua0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 10:06:42 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1c1538784so7104804eaf.3
        for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 03:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789034801; x=1789639601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m07hojNF+PinLLd/x/EaU/8bPalFdykfrNtvmsSaQew=;
        b=VrNAtIuZzqCtNU4Qp6NcPEYpVnRI2YMu3axHmSR97uoCsLVY3Dzp17RJdjahXtvj/U
         TEuE99bM21gBfFrJPk6QrvuPwdRbIMOIFFarQN/LDM2pMjUrIcjXWx2FSxpF7ml9WCZJ
         KxGXAsiLX3soSTmuC3yLir4fvH9+P/ZnEa/BBzxLaMB+XNxhClNCGSEStbbWJKBecroV
         K3pomuksB10Raj5ZKJ1wskd0UfTx1Mv6XKaqLLdXTrJ2AcWlZJmSo58dJ8EDqSRKGbk3
         KhdghUdYVotMnjAJrajB3W1CxrN8aOMvA1QwiQ0QJeYVpaGxAiAAogtMqymFjRehh9cH
         Dw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789034801; x=1789639601;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m07hojNF+PinLLd/x/EaU/8bPalFdykfrNtvmsSaQew=;
        b=L/zTeiZOnVtpiN33ZfEwhwyqLZhge9Sapw8HBg8ldOC48iU+0Fw+Rool8aUwXwFF52
         sXvmieMC59tFeG0LqNNTSuO/bqXJOoi5WCV1k8zoxkD8XVXDu9tWlf5BiHkVIhX3EApx
         t/O4CuZDvkYCVSuHfCSFrzoQYrMmVBowynE47l+BJvvmTwLE9EnT73LzvLMd2Eob5hKR
         LPefkbIME1BbITvC+VtqYOCHRlhcou/CBHoSRtID0UrxAhLMAUH2mkmj5Cq9DOddCRkS
         jJbO7UK/Zui6evW1SRASWIgMHWcn5Gjt0sKIWzUTnC6N2ehAPId/tbSV138OuG8zTyxQ
         KVrg==
X-Forwarded-Encrypted: i=1; AKwUvBz1+7EYixEFhMjTtsdOtVVq7G4I1xPy8S9e7RySU9o8Fbmi7PZTy0qeWBa4VCdlaGhsRfeeGnLH0aI=@vger.kernel.org
X-Gm-Message-State: AFuF++miZWCs+zZL6f/s+INzqXxmc3RGFA6DGqzPVkzmwr24voz5lix7
	0kVQ7IxTtiBK+Q2lJrIPNEZrwGlgBO6lTt/HEcMf6pu3CuoUaCT7fj9d4HmZJ6orfecbC6z3601
	pXJ8CYBNg7Eu2Fhf38rCvP1803cLPQeku24dTTvgz6deEJgq5E75kqJGnIvtPJx4=
X-Gm-Gg: AYBFou3sZW04hHWUduhKMgXL32ed/k6TCgma713835O/068OEraZ7Ah1UVdo1uVQRaF
	MT1pba/TszxCTVMPk9AcDNoXFJbht8ZBVEftFXnu2xbw0ijIucPXSB2VO/JEPUieNPcegWPaGnK
	lJnQiHReLAyPoyE87/3YL6RZpTz4uo6CX40Z/AJyCvJDG6YQULp/irlgV0Z/nx100yKj2ViEpor
	2BZbglTmGrwDRr75OG0LmtOqHixDLMueAp1xyqipZgvQS/Wo27RNFXVHSh0JE9816MEhIGMVTqV
	GjOUMiRSFV/VyjQgZc1TA/Vq0pELtPOpqFXWbs1Zf+p3aWNvcwtzHcRypxXrNM1FA+G/GM6e7wV
	YEbYOhp2Zh/JcGyn7pLdDvPuDPaM=
X-Received: by 2002:a05:6820:178a:b0:6bd:5506:aae0 with SMTP id 006d021491bc7-6bee57a3e81mr3549646eaf.22.1789034801256;
        Thu, 10 Sep 2026 03:06:41 -0700 (PDT)
X-Received: by 2002:a05:6820:178a:b0:6bd:5506:aae0 with SMTP id 006d021491bc7-6bee57a3e81mr3549585eaf.22.1789034799830;
        Thu, 10 Sep 2026 03:06:39 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm79725666eec.16.2026.09.10.03.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 03:06:39 -0700 (PDT)
Message-ID: <21cc9c5a-aabf-4ab7-8f2a-e8f90d5fb2f3@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:36:35 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] clk: qcom: ipq8074: set BRANCH_HALT_VOTED flag for
 usb master clocks
To: Chukun Pan <amadeus@jmu.edu.cn>, Bjorn Andersson <andersson@kernel.org>
Cc: Jerome Brunet <jbrunet+clk@baylibre.com>,
        Brian Masney <bmasney+clk@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260910100000.2627799-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260910100000.2627799-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExNiBTYWx0ZWRfXweh1dENP8u1G
 czW7BuqCywXBsY29bGczkIjmFwMtVxDUCvUYJhtFx0Pg+xHXUMgq+ryBzIKbSxHwntBWiF1FNxP
 LMkrwE8SDA11B9tsWhppRLJQw//4wmfIpidmCm7P4qw0oq04J04JalcnMzOBjTeaEW5M8ukfdvM
 4Bkwy9g2WHu/qG8Edsll/kRufM3Vt1ocHhvqdM3pMYKXOdWjsboBzH2kftaiC0K+PxlTH7OgaTA
 px7Z4jqn/QuJenDiFXCL0SRrfJLvXGk4n4zqLr8HVgfKljON/U7nyn/ifRuwBTdx66TzlW3bT/C
 TmV3BGgSUPh+MvDv3oVRsx0EzZK+Yx784+Pk9Hf6kF13SOKAc4GNqszU2HP5HpNZ3MYXO6hObEK
 IsBhkCz6PPWfsJ8FaXuU3AsVjRInLzJp4VYjvsyjU5Bwc+ymKukHGIqFj76wJvbVsG5xBT6L/rz
 NVduQ4hT21vHWq9pHzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExNiBTYWx0ZWRfXwnt82E/FBL4V
 rVlpHAWN0b+kI7Lmj/IbHJsGEwKROksOqInnBIe44opdZdwsqnwAJBRrqiaoW3xcjBcSDNfkgbp
 Ip7JTwZ7F1l12y5J8uqX1DDN0l/xkEc=
X-Proofpoint-ORIG-GUID: YUCWe2UEolYIPFBZHGpQ-Og4mDVMRewC
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa28132 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EvhtOw30TdCrwUAivPwA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: YUCWe2UEolYIPFBZHGpQ-Og4mDVMRewC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100116



On 9/10/2026 3:30 PM, Chukun Pan wrote:
> Currently, on some boards with older versions of U-Boot, attempting
> to disable usb master clocks results in a "stuck at on" warning:
> 
> [    3.005088] gcc_usb1_master_clk status stuck at 'on'
> [    3.187119] gcc_usb0_master_clk status stuck at 'on'
> 
> The USB master clocks of IPQ5332 and IPQ5424 have the BRANCH_HALT_VOTED
> flag set, so let's do the same to fix the issue.
> 

Fixes tag?

> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
> These boards run a vendor-specific version of U-Boot, and upgrading to
> a newer version could brick the device. Therefore, I think this should
> be fixed within the Linux kernel.
> ---
>  drivers/clk/qcom/gcc-ipq8074.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
> index 1329ea28d703..10bd2f80010c 100644
> --- a/drivers/clk/qcom/gcc-ipq8074.c
> +++ b/drivers/clk/qcom/gcc-ipq8074.c
> @@ -2612,6 +2612,7 @@ static struct clk_branch gcc_sys_noc_usb0_axi_clk = {
>  
>  static struct clk_branch gcc_usb0_master_clk = {
>  	.halt_reg = 0x3e000,
> +	.halt_check = BRANCH_HALT_VOTED,

BRANCH_HALT didn't work?

>  	.clkr = {
>  		.enable_reg = 0x3e000,
>  		.enable_mask = BIT(0),
> @@ -2725,6 +2726,7 @@ static struct clk_branch gcc_sys_noc_usb1_axi_clk = {
>  
>  static struct clk_branch gcc_usb1_master_clk = {
>  	.halt_reg = 0x3f000,
> +	.halt_check = BRANCH_HALT_VOTED,

BRANCH_HALT didn't work?

>  	.clkr = {
>  		.enable_reg = 0x3f000,
>  		.enable_mask = BIT(0),

-- 
Thanks,
Taniya Das

