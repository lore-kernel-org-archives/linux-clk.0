Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7232857EA
	for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 20:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776543837; cv=none; b=IhW3cb1Gcxw6HpJs9UbIwxtJ/EsHXxqdd/lRLbwBBrY1PqPL5KSJXdDysLL59G/YrnvXGdyxb84RyHMGKRUvDULrX8rvP/k7iDUwcoOo1ZtwAs5QrTVrG8hDFAbb62Yis75F+1k/tN7URjkKwTN+GIwkkLQTe6fIeyNarh7KjsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776543837; c=relaxed/simple;
	bh=g9NDcf1smfF8vm46KWA60/glnAzkSOqt0MO682JSkIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLbqyklF2AMSgtAJkdbawO001o7ZtSJG0rh07zrhlSl5zeqVMX8QLmMBqmHkXNRJZYF6H34vVyA/L8nY52OkU9TLvHmRwcUlmZ/i+Ab6sCgWtsZqIdGkBQ+QWtTNeMDiZp1QBMvooqA6gzZYo/GThMSmE2MRSj6excA+9UjRA1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fahkhzad; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ejgpdd2I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fahkhzad";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ejgpdd2I"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63IC1HAG942487
	for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 20:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Unkrq/OjgBeyx4OlaQcXktpk
	Zj59I96fgHikJLzhnok=; b=FahkhzadnXWSzUSFX8ylrov8v/eca/m8++AS+PQ6
	sGv9/pNWH5QIpAFkQ6dPIb6wJRP5R+jDTRTtDrrc59v/oSDWbjOoRzWRecIAG7fr
	q4jCYDBz3GIBEW2V/HIpiYeBT7NorzNlEbfsvz9adFQ9tDLVn5vikvamVXf34zGh
	YBWuA547yz82/WYjq0vAUD0wEcEF2GoBc6pR3XE2jSfz4bRbffgI9526VtpafeXE
	88bGOPCYst9VSTR1bOqTFVPplXa6w+pWyYIuaWx8DXuV6c+rrMN3sXa3tD8XG2sM
	+bBvbqjdqSvrlx74ZpqGqLjt+Pxe9oOcmd03Bl8aez5ZEg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm1hx1f4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 20:23:54 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56db8ed8e40so1374210e0c.3
        for <linux-clk@vger.kernel.org>; Sat, 18 Apr 2026 13:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776543834; x=1777148634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Unkrq/OjgBeyx4OlaQcXktpkZj59I96fgHikJLzhnok=;
        b=Ejgpdd2IUpmeof9XLnGn0RSY6eu5xTn2VoOgkS+0p2WAvYYomTxiZcMaOgkI7bnXHn
         37W5K44vIRsOoNXfuTy2muD+AIwj3nDqnKA4W98Yet/uGr8jWBvUzmRPDtiXwTuVcztp
         dDrfYDik12cl+9O+lcYYw7JBK9TvBr5sObwYF0YLKTCBa3ivWQK/V36aB4uSwgnYp2o0
         n7nYPMZWs5bxw9zpWuyPuzeC2u5LQdDKsaqQad0NI58V5nNE+dczxlSZ3C5JDtTpChS2
         +/SechPrwqFUGsc8/IDXfjJdeYPs8fyUEVp8ehExTlq0rsuIL5Z8Es/vHacuNE5Azyq1
         cpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776543834; x=1777148634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Unkrq/OjgBeyx4OlaQcXktpkZj59I96fgHikJLzhnok=;
        b=bX/u1g1f/2bOLZNzqdbH6WGGmQTv7p8VbazNhufBvFh+7KA8JKPR+nL4BYU9f5Kl6V
         G5uZqeeNOS5FiPWZAQzJ813eMc8Rh0BeEae3cqYzhrUVG3XfOZl4KPY97yBtFZqP3gZa
         dKpyfbjokP7ljbPQIF6daXqtfmOS9Je51ElqFi4bAhH/qRlodHkZ2UwPa+NmLWtQGCMx
         bPrgTnc4mT8KKTXxJqEPNsAi+GAlCy7G1pYAZUUNBm5VF8skwtz2t2+AAIGfbqBN9m4m
         nstsHOuY7d/icolyvQnnVWzgrynw2SMy29tQMrLU7ArpZZIhPyV1XlMNOFqjPBHohfER
         kKXg==
X-Forwarded-Encrypted: i=1; AFNElJ8PLyewCE5n6gMR+vjIOt5fKJBg+z0Fn3cMdov3NlH54SNp5X94uDXO/8xNCdY/d0//qKxz5CzXT7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwePlGdpaQNjP6x7LNHmxCUbKtxUvRQrpoFvqYpz2xJuN3bkc7M
	ka7B+mBsQBj8iiPZ2FkDEpUwWdr/lA3Xy4JF7WwZX7m7+lrtlOqDAYQxaxhO0BRP3gtoQtznCll
	EY88XTK+i92jNE+tFODxdsWCUdYN5Ze05lGxqV61ZcNOVVRasSXbXjRYZIkp/jTE=
X-Gm-Gg: AeBDievYMczn3azGpMqfr1qzEDGl0bl2uxhchP4+pGDP09nz+KvJs1+qDIyax2LxRNd
	byiFHk4oGLRyYCALaUvctJ9lwmE+f/N9px/nbIMWfnNUi6eStVQ4ol3RSlqIqjBZJtkKUfxstO9
	XiHLz1p475MnBHJrRecE4SYKj4hpTCF0etQCVeBhANOV8YCQfeRlkvLRCBbmyNqtussZRjXtHDd
	IbC5BiFwbwhxt4fB5DOcPE3zfPP0sC8p2e6OtzffypHf4GPUUT4RY+adTkujGrWkli/0EN03uT9
	09UzD8COdS4VgI5ilv/otMFm2bUK4RFbzQuWBqhsDDM01y8ovs7wSlsQwFwEHJnraEoSTEEsMS6
	abaqA14NW8FcvnOWhyylNFsfVuzfI/MkWH9xjU/Co+79xrCa6fX54DPRqEXBTMWUjx+Qdjzo9nM
	5arY/TL7yQhM7wITfxN+As3piM5vIeIwG+LvWS4i4tB9QeBQ==
X-Received: by 2002:a05:6102:149d:b0:613:3fff:feb8 with SMTP id ada2fe7eead31-616f91e60cdmr3492502137.29.1776543834264;
        Sat, 18 Apr 2026 13:23:54 -0700 (PDT)
X-Received: by 2002:a05:6102:149d:b0:613:3fff:feb8 with SMTP id ada2fe7eead31-616f91e60cdmr3492497137.29.1776543833817;
        Sat, 18 Apr 2026 13:23:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f652asm12679001fa.12.2026.04.18.13.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 13:23:51 -0700 (PDT)
Date: Sat, 18 Apr 2026 23:23:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574,
 QCM2290 and others to ARM64
Message-ID: <ycqlsccmlzrsiggg2f7rps34qxjzpbqf3x43jyajaecn3t3qxo@giplsfboimuw>
References: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
 <20260416-clk-qcom-defaults-v1-1-579e75c4cfe5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416-clk-qcom-defaults-v1-1-579e75c4cfe5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gePMNaJBHwFQu3BNlQluvimFwrJ_ky8V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDIwNSBTYWx0ZWRfX0hKPCyof/3sF
 d7YyVl614IKDECrqtbZwiDKr7PhrJIeO47oVl07L/k3ocp0kJ94E+l01iQERAmSIl2vHdoUaqFB
 NCuPWg3xyrM/nJ/zYidmdEra01p9VhrJKFxhRwNob9Zpam/+jdZDW18TB0kecGLodYU4leJepWC
 5CMETqoJaWqAs0F6cdzusbROhOkpdssBKVwU9hc1eKIuCdVPia8hnjFty8NpreVEyXn/meXiuOO
 UlYHkxoOcMEyTJxUBAmNYzPZqMnaz2vQVbffap5yL3WN1Q9FrtPz56ShGRfrKPkEglQjseEdcHg
 Yj2sg+zonPeS9Z9S1RNMeOaFEs+BP4c/R5zWJyzAbWeaS9czAMZqd8uhfr1Mt81Ff88VFzXPZNi
 se/nHKRuZOkNcXkH/BI+aiKzhfUc5CxxuTdUa8sbFXzHd8qJ4NT3nJA5wLWOek8rajMRoQMjp6V
 2+MjpqImDZouwZeVhfA==
X-Proofpoint-GUID: gePMNaJBHwFQu3BNlQluvimFwrJ_ky8V
X-Authority-Analysis: v=2.4 cv=RoX16imK c=1 sm=1 tr=0 ts=69e3e85a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=XY21xBfZkjNNQA91HVkA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_06,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604180205

On Thu, Apr 16, 2026 at 10:10:29AM +0200, Krzysztof Kozlowski wrote:
> Some clock drivers for IPQ5424, IPQ9574, QCM2290, QDU1000 and SA8775
> already depend on ARM64.  IPQ6018 is ARM64 only SoC (at least upstream)
> so should not be a choice for ARM 32-bit builds, to make kernels smaller
> and user choices easier.
> 
> IPQ_CMN_PLL is used only by the SoCs already having clock controllers
> restricted to ARM64
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
