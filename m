Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10D63FC2
	for <linux-clk@vger.kernel.org>; Mon, 29 Dec 2025 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767008709; cv=none; b=ljqIqNV6u/uU8PZg6Zf5RXxRuADpIyAzbWzkfntF2FbLrDCjfNuUZM0eTGPRdfcazRF4D5t3Dckjc5fh7WPcGZlBZ25DQg5BWXLStV2Hl1RwXri2F2Tlq7qmaDDlCbSHI9Serw/UOFk+U4gWfZfvfCQTUivuKhpoARcjt468Pmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767008709; c=relaxed/simple;
	bh=dzy13qrj9gNOfWVk+f9fG0zzLtDEbH1xmJsZR+dQhu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EgVpJRzHdReaPVhsxzqbRXzSMu+44Mcz/DHnClqwrOu6LXTKp7rYfuaUEDqLsoVJr5Chqoi9V463cOOUnhUNr/+GuOIZhumZSYryT2HaYVaW3tnlwcgMGvVEmJM1kzalJO39rG1s5VMwLaUDtH96bJOD5DEAphPwaB3kZKXQorw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXM4as36; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQEGy6gF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXM4as36";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQEGy6gF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAfslP3263676
	for <linux-clk@vger.kernel.org>; Mon, 29 Dec 2025 11:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ucAJJrnBjVPWWwtZNg31IitMUWwp33Ja0WFe9A2IcQ=; b=GXM4as36hGtfQEt4
	XnBUNaKF34VMg618YSoDQ4DrMeHaPcAtzAZurMvqdLBYfF3b7mE2c7zrkvu0fzf4
	f3hXUBS/Y86O6ktneornkK7Zz8228JQj/Tz67sBwOd/oGSGF1Udbnwhty0tfvo7R
	JT29j9PF+h9ISMmTy2skB0/ev1cMp0sIK+F9XkZLvYvqIW/CYqpuxSi51pY47beN
	5LwLokf4Bgn6mLY1+aOS244EHgnQtfvKEeyyGVEur8erDbHaBnzt8GFCdFK1CTUt
	albXuSdCJVWR9msF6sv/DBGnmoBc+sZ7ITPOB4HxUUQhWhivzjA/JxGd9fpX4abC
	3yo3UQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r6c4wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Dec 2025 11:44:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee05927208so40626191cf.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Dec 2025 03:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767008696; x=1767613496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ucAJJrnBjVPWWwtZNg31IitMUWwp33Ja0WFe9A2IcQ=;
        b=iQEGy6gF1OKDyM5qYm/lvo980uQlRVBv5cNllHens5DO30/euselnSzSe0k1S69HqQ
         HcwGapHYz+1WwJc9cpunHQ+eSbsGoZMwjYbrCBhPPVE50uwIy9m2fzuSmWZWkZLUlbe3
         h4oHXgjqNUKRVAKtw73FumwhUjSpZAa4xRYjpWSTD5+pZe3k/soyOe14IfcE34gAX6xD
         gX/dVGsowMkhgdt2ox1Iqh2sviaIo+OGT/H6gU9jehnJZLyylUhW3/5TJqqOH54QPTfE
         62Q8Ra/Fqqd6Eu+b9NuDzHpoJr2QHOhqfygKviWZ/aJmOD8+ipwyXu9ZsmvuJyyCXDm1
         F80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767008696; x=1767613496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ucAJJrnBjVPWWwtZNg31IitMUWwp33Ja0WFe9A2IcQ=;
        b=bJITgeOkFnFTlyjl4gEMPVrZ/poUYaUYkA8puPryU0/vF95Y+7VvOSmhooXVZa1kun
         qEtB59EsSHUxgaFhMAk468nAVMDaXWNCbU0GLgKV3J6iXmedA9xNwoq+AHnyXJ/4QACx
         uPZF54Q2ZE0Y4kp37y7yUt9HtXyHOygPTvTHLLtiiHGTBB/CgTqiLl3l3ElQRlDfizh7
         blUUY42Utw/fVLiBt/HAcPpMYS31ai9Esc6AQuKntzqJag+TshxXE1x2867zQdXZuVG8
         A1aTS2K93grfCAwvskbLNohA81TCdG8GtsGmR5sjcwDCxFz+8pj18ro5DGgvNS82welr
         zL2g==
X-Forwarded-Encrypted: i=1; AJvYcCVe/gkBJxKrn9lYLFd4IOvojEGk4fwXFWd88EAhHbRyw5sDVUHxFMoK7Zj7/4zxJYC7tnpOrEqhk1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVBmMeMN7XZHC18/EqJ8jOtBx6njOk0wiYWAvWSa9rLuHMRom4
	MS0FKU9oV2mduHV/vViceQ0tHnzt9v14wh6ggU+IaawwF+xgs/UM4R8zfdWAuqBFT8SsofYe9LV
	SZtb7+rdzViTrXJDpLjEHWbFUTu84dGtJ8732youO+r8AQNZ1VRhTUBTq6lCYXig=
X-Gm-Gg: AY/fxX48Z6w3H4BFKvtLbGD/39sy/gHN0XCXrxALpAcJMkHJkmK9XWVNmsd0sV9icQD
	ketlviSXkmcvmptcMOi0I6i6eokFT+Duh/KU9GAEkXi8lpl8AqrmuKzYeat2X8rPIT4iPr93jIQ
	KPJB7uaL0ba865FNqjQX9/MnphLqyX+tQGirKKDA8NNDexjrca6isT4rbsCB1+IUSwnHR0fuJXN
	TyYCjXXJc/Ja6FB0fYd5sCmV6S4opXGxoxWy87vloG1+gs8sdYaRORtN+ave+1K6icT5RCNaEGG
	9/FPxZfroZAaZptFibTbHIvUYpt4NS6ujOYzSGwJqCVk5Cvpdjs+tlvZeAH0yXgNR7yfOqYAHzb
	ahaV/k+uXmXHUxOwGNi+MaYoepwecPXWutfk4FMpFOcYtphvZ8m1ngKPtvfXY9yD1Ng==
X-Received: by 2002:a05:622a:241:b0:4f3:6170:26f4 with SMTP id d75a77b69052e-4f4abbc06ddmr320398701cf.0.1767008696130;
        Mon, 29 Dec 2025 03:44:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFA4JottHG+Jxzc0G7OmGsV87ONcdkVvVeRiYt9/yXxfUQBT1GQWAHX0HTrLAGlJKNNpbK04Q==
X-Received: by 2002:a05:622a:241:b0:4f3:6170:26f4 with SMTP id d75a77b69052e-4f4abbc06ddmr320398451cf.0.1767008695663;
        Mon, 29 Dec 2025 03:44:55 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494cd7sm31326686a12.16.2025.12.29.03.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 03:44:55 -0800 (PST)
Message-ID: <e7f7878e-3b04-4276-9d16-b19a4b922d6b@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:44:50 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-kaanapali: Fix double array
 initializer
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=695269b9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=486DEghy8GcDG8TY6xEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: uufkekL_0uoZg1BabBzouBVm8l-JyZL7
X-Proofpoint-GUID: uufkekL_0uoZg1BabBzouBVm8l-JyZL7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEwOCBTYWx0ZWRfX9t0/n0WE7VVb
 6P24jF3hsnG7BkYAhjZwHQU0Kx00/NhBDLINy8a21F/IKVNUQjsgScANvAeEzCmk0iZmvJbzD5Z
 7fRVgm2qtNS5o9YaM455fCuu1AxtxW5miRsMKaTikidTwNiXWcYp1nih/MjAHBTQTEIA+HAPWjH
 y4wK0rQYD6RU7wOj/jGtlTkoh+CLfjc2Pk3Ez0ra1JfNHK4WZL8WfTBCmz7s6HbBL/y/cZN+KW0
 NhTzKkFZpwhIwkIqD8NEuWBn6CgWxY0zQCtNErRc7BZAiYJsSLcbDR+P6g9ff9HrU0gt34jml1k
 oBIJzG/tdx+MaM4/OvnGbHCPm+znB7hivPiM3JGRuh6BciyK7phqlkDHa73UZafsHcfVjRK0mI4
 n3GJvlrWVmDHudv7+r/c2RpZmAGvWl55xp5RyrRdJPFkjKddzXB8cQ5tbV4TVcUYfohrTXHVsWf
 4ev8njAhyMBuyNTtNlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_03,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290108

On 12/24/25 12:22 PM, Krzysztof Kozlowski wrote:
> [GCC_QMIP_VIDEO_VCODEC_AHB_CLK] element in clk_regmap array is already
> initialized, as reported by W=1 clang warning:
> 
>   gcc-kaanapali.c:3383:36: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Too bad this warning isn't enabled by default

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
