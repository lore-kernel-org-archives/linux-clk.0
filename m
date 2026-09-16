Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C3149AA55
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549869; cv=none; b=XO9jdLHIKg5pO6S2mtT6Scfi5k7YFwR2v17swcuL71biWcxZcgVRal5cFRVnl19B9C//bwxnUmfyVsR/uHu9TrHMnTROOB0BGF8/Q1S5Vl+HJ51eIOZq0NhcnmlJURKkLEEu1dC6tNuPmR3waCCXPA9s903X88QwB9YjpeZim+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549869; c=relaxed/simple;
	bh=67K35Pq8eUdKaLCHWbihTSEFG4ynrtphpaQ5hmCXCw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YG6C4yD51509uzXuZitU8Hik/lxMXNzLWczsjKRi9pHOiSwrSb1Yu90lDl1nk4XzPNSAYd1oFVdtmmbxmI2OAn1MGicTq/WJV5nbiyHYxvsLS5y4jpUslVRPigJ0LYmZEvppeGubaZuxWM141zYY4BZzpI6oFJlk9jQxNWPRbwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkOPa/Jx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hp8TEe8l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkOPa/Jx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hp8TEe8l"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92tkY2122622
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 09:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KuRauLYlQk1H80xx2USQGlgiLsnk6ozs85h1c53Dt/I=; b=RkOPa/JxWZk4ddpS
	5B+Z2jMZwFsdTGJnBQQ6W8q6FHyv62SEb4Q5rxc/Vovo792iu+jvLOil9AJdrY29
	krF1CCiG6P9F8kQN0XHR+AfX6Q5HL2pXJXDIgKyn0QOb9xTOBIcFd3iC541yIbdi
	bWtqfcN/xv8QxbyXJWI4mvqgkP2/FfIlA3tViRwEGJwZoneGfFXEQrJn1uR8jMpz
	ldfrRetL63GYuVeyaW+xAlHQdlhdj4PVA8zy/Q9LJl7QVjUwvqXJlxC+cCLX8FxC
	FYoiGmYLgvEdLVSI3CstwhKR8rYoDtuqVrSoodTLIWQ5jiEneuxeC2KqIDczy5WG
	/PJu7A==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqkv7h6c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 09:10:39 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1a3f01d2aso7954126eaf.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 02:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549839; x=1790154639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KuRauLYlQk1H80xx2USQGlgiLsnk6ozs85h1c53Dt/I=;
        b=Hp8TEe8lQF7ucEb+6JlJkTBZv+rTQ4CI6BXDZlnUFXJEnZyA4VPwGjzlfcMLbAKox3
         S9+xa5cvWNuBSvWteHHqNox3Vurg9mJIQf8gEOsKxQkpz5q/c/HY4sMRbFFbl5gOleFR
         KDPTvRL5TYt7GQfndUiABQNaQ6tc1JR0z7X/W7IloISITP9Y84Fgt8Abea1LKQlR3Va1
         rtRGnjsfj2gXDVSAQrQxcajl+srsysknV0tOWpt2iueyMTYZp3Q77UhpANe/W4gjbTnH
         wypT/+ng6INcgW0Rz/kWxwWc6BOL5kOum0oNIu2QumXFuE1aG1IKByMXNfW2KPwh5PIt
         66kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549839; x=1790154639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuRauLYlQk1H80xx2USQGlgiLsnk6ozs85h1c53Dt/I=;
        b=g4O+lyD00ZnGYkZxIySjaAKWZ3qx5eQLAzXL0YQuOZa5zAkOTpDzagF1rGZRNMKnbR
         jNl44K0EAME2/cHE91WHmuNq6so1aJkcvWNzxuqBQ3YsceAF1JVmyH6SIx3hw74roean
         1UM0WfSCFYtI3xvhSS3SyX7zHqCb7JnUdtvbPV8tNDg4EH6PUouOaE1b+vbRUfufMg62
         ssthTUvv8HpJeeomkr+6ezeE5rMgpxYGexv4zJkPhoeHWOX6Q52xfChvWb73D4jn97cX
         r/xsssXIqIRg7+GecmQmgrzqwNZ5CtKBnncze6cf+/xbXbRAAAGH6yz6Ha9YPhN1xacR
         5bwQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2demxQSVSC3mttYFBJhmYCRv7RrXg9bEv+Dfyp8Q8U21KVNDJYDOddBYrYkgUczgcldJbA/bk/eM=@vger.kernel.org
X-Gm-Message-State: AFuF++lz7ambwKOi5U8NVjkUf4cGGfeOPog/9swSH+fDvjK5fWrT4qzq
	I0AAzYOVOKn35U+RJrusgpZua/rqv2WXnLgBn0lSrW2c/v79+7fvCwWyEIOVKNAY3cURSrY73QJ
	fNrj5uG6eFDF43D9a0JW5fm2zizjItTKNMzKeO1H87lLCkF7CGEPWQyiB3kjVbX8=
X-Gm-Gg: AYBFou0OuyIVv5POVzXYzKUBHdB1gzstItGidwdaiwj/SgHf1Czm1TQeJeylHVgJmds
	1WYwg23OV9kHkJiI4wlo3nIN+rqL+q+qDX048DZjgSDCbdpoQGPKTPJqza4hahMKuexyO7g6PeN
	Tnd6JDjI+uRQJTDsONLZ3O/rThWZQqaeXrUZC223ej/Sd1QBH9rmIs5MpOS+QCW6mKj44MjVcG8
	vO8CCAozDvEs/hzwLT+lMTpz24BTEt5kVfGQfzT8niyCOo4Y6u1uSp+jz6uayN5jWqWBDKvvG7P
	ohflGm8frJJgfTHQgJKcr5PKlUStCrHvT9ZqzKHPB7UXkPOdAxUPA3u1wTBl2Q56k5V97Mi+/y8
	wwV8QCi+f9bafG9XhPNhpjpf56FCMPZYenXjyMiNZcNfRACOV/N1ukH80OqlIcSKWFUnMYTAX6F
	etta2E6zx1ueHOwDV65w==
X-Received: by 2002:a05:6820:1ca3:b0:6c0:dbd:30a1 with SMTP id 006d021491bc7-6c7d11d686emr1924453eaf.6.1789549838968;
        Wed, 16 Sep 2026 02:10:38 -0700 (PDT)
X-Received: by 2002:a05:6820:1ca3:b0:6c0:dbd:30a1 with SMTP id 006d021491bc7-6c7d11d686emr1924390eaf.6.1789549837946;
        Wed, 16 Sep 2026 02:10:37 -0700 (PDT)
Received: from [10.149.106.38] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a182sm6388715eec.8.2026.09.16.02.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:10:37 -0700 (PDT)
Message-ID: <0b371ca0-e91f-4ede-921f-9610961bbd6b@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:40:31 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix default entries for Glymur EVACC and GPUCC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LmF3Iy-1aixlQ3evxTmPTMFzHzdkv0S0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfXyZw+PLg2Lf5r
 QtSGFFqpxs/wgCfVq2xJCYFeXXl/3xPWdeGzmFoG2VSTCEdzcDnp2RCM1B4F3OPJAOsMsQcWiOp
 Vr8bg+xGpTWy0W1jRhiSDAMdmC+j4t++rpInql5PiBI4tve6cFLhr99jSU9VlEwlEpbrjHKNX2H
 OdQB7QYwQ7RinvpA2t9Hux0s+LflFzO+PJpWs3IFvJ2uFSDLKzPWfRhVsU9BgIYVouztY74C+mN
 yr/Yg8IyXK7VAlnobK2ZHdZ6ah+IJxjBlpBuPU6lDuPRwUN9xmZhuXIyHzTv76/XMWRdXFgGsSd
 QVr4SjeNm7YF8FZeEBPtRy/4tJY+OYvZQ1NjO4TwXVa8BEobMesmGSVQZOtIyKfrp3WvYHlWh55
 NmzJiy0CizKdRlhOFD5paxWehS7DFEve1ftlXSEokhrRfd/N+fhqIOSwNRwoU95RdAKNNIGNTW6
 RUg7hhfgEadI9Xewy6Q==
X-Authority-Analysis: v=2.4 cv=eKmGH3p1 c=1 sm=1 tr=0 ts=6aaa5d0f cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jPJSeZr3LZmqAX0kEZ8A:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX1L0462nZNRRq
 HOpUc1o2QoNmBX3fnzLCZdR+/zDRXn6gDJdYnfn3NKDW4jw0XfDLc39C8VBs7SDS9ph7pJFrvzc
 o6dp+Uim+feFF3n+1PaaE+ivNxb7QNU=
X-Proofpoint-GUID: LmF3Iy-1aixlQ3evxTmPTMFzHzdkv0S0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160118

On 9/15/2026 12:28 PM, Taniya Das wrote:
> The EVA clock controller (CLK_GLYMUR_EVACC) config carried a duplicate
> 'default m if ARCH_QCOM' line, one of them misplaced before the 'select'
> statement, while the graphics clock controller (CLK_GLYMUR_GPUCC) config
> was missing the 'default m if ARCH_QCOM' line altogether.
> 
> Drop the duplicate on EVACC and add the missing default on GPUCC so both
> Qualcomm Glymur clock controllers follow the same
> depends on / select / default / help ordering used by the other entries.
> 
> Fixes: e291ec812dec ("clk: qcom: Add EVA clock controller driver for Glymur SoC")
> Fixes: 67e645285dd0 ("clk: qcom: Add support for GPUCC and GXCLK for Glymur")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Fix Kconfig ordering/consistency issues for the Qualcomm Glymur clock
> controllers: the EVA clock controller (CLK_GLYMUR_EVACC) carried a
> duplicate 'default m if ARCH_QCOM' line, one of them misplaced before the
> 'select' statement, and the graphics clock controller (CLK_GLYMUR_GPUCC)
> was missing the 'default m if ARCH_QCOM' line altogether.
> 
> With this change both entries follow the same
> depends on / select / default / help ordering used by the other Glymur
> clock controller Kconfig entries.

Fix was posted by Sivansh and has been reviewed, should get picked up.
https://lore.kernel.org/all/20260821045214.2623299-2-sivansh.gupta@oss.qualcomm.com/

> ---
>  drivers/clk/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 6ef083f5d9e251d2d2c5592a3f3dd51845dc743b..b3ffe1dced017e6f4bd3f0fa9c11bed5948391fc 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -104,7 +104,6 @@ config CLK_GLYMUR_DISPCC
>  config CLK_GLYMUR_EVACC
>  	tristate "Glymur EVA Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> -	default m if ARCH_QCOM
>  	select CLK_GLYMUR_GCC
>  	default m if ARCH_QCOM
>  	help
> @@ -127,6 +126,7 @@ config CLK_GLYMUR_GPUCC
>  	tristate "Glymur Graphics Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
>  	select CLK_GLYMUR_GCC
> +	default m if ARCH_QCOM
>  	help
>  	  Support for the graphics clock controller on Glymur devices.
>  	  Say Y if you want to support graphics controller devices and
> 
> ---
> base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
> change-id: 20260915-kconfig_updates-39a684a748d0
> 
> Best regards,

