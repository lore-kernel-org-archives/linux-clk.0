Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490673EEAF5
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 10:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814573; cv=none; b=fE+YrDjTNGfP2BLI1HqipNQjJPO+bV6IRZLLcPBSGIl4OJLb9t/fwExQ416TC6djGdfy8WYCMEEy8xR1gNjEtvcw07wC/kC4H/Vtvc56CcPEwZB5gWHUsI3cOsDHdDDXKUdpkIS3KDrPTJd9FkhEyotAEYWRPKrcXGj1qrGWozo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814573; c=relaxed/simple;
	bh=lRKXJKZrP495IiUZDHG4weeCWTHu4o8bUjJfmGNlq8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ToAe7Ay7HdiR7/g6uBvkgUE8YOcVqnV/othcBnzyEWSZtn8m5vYMUGa/NM4B4YGl2GJty2DYqo9JoTWE+OIZ/Y+2gBKZIPiJHCiuV5xFC2JIaTGWDesbAXkd1fwoNvWysbdvT0pi4PIbQuf0hTN9TUABKQdPO+gJZgJtUtx2ekI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CImSIX+l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rxegup9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CImSIX+l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rxegup9T"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mle51541144
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 10:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P7blyNdpZKWQkeLr0/kR8NAwTa+IR77dLcCC5jAo5Pc=; b=CImSIX+lnYq6QRGC
	gfkBDthWL1CvqXsbiRVsRpxi3pFdzMuBGz85OsV++lx0BqyyGS9RQbt0WKHpB7MG
	vY2oWnceAoDcB6q7audWseEFs0NHaOpS4Qmk0q2mS5kGIIEKRc+PivXDv3HykPeR
	bjnH6Xl43aWpdZVOLUxueVOlQQFU5Ut7AcRZDwovSkzWpAEKsdKCjW6z/qmYSm0Z
	B0oLZMv5T1xjSHHaejA9tMj2wnWLomphV90mWkk6AzZaqVU86D/TgMU3ydl444xZ
	ICrq0AArOqkWtFn6ELk59EpGLc/89XpHh94Qw3kpEU6MVQ8aaazVCZ1Glli1DJ4Z
	wyI08g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp1uvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 10:16:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfa45b280so3098531cf.3
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 03:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782814568; x=1783419368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7blyNdpZKWQkeLr0/kR8NAwTa+IR77dLcCC5jAo5Pc=;
        b=Rxegup9TuMBqrFwoI2Rubqz1X01lq7BdUGi0JcDKbywzUy1GWll1EThTy4E+nWzLmT
         jOZYZsZZ1/MbFDKOukp+lbbZHmJjKh5S1IJFjcxYX+JPTocShpDuG8ofCsdscP8tW4mD
         lOuEFgaRraR/isBgByXG+SZZRuEl36qyLPBbf7wqItBQYT7sgwYTdml7O2Ph0cax8KcW
         H5uZ39xtRuZtpPp75vi0zYlTkLhZCJL6tVL4VeDfG/bBH5rOQKAZZyaSvuORld2L7swv
         yCnHX07T5U4skvdRECC/eT0cM9YMYz3SPc+6PIxwADOa54IyTUUcIRkT3sALpnN84vCr
         GQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814568; x=1783419368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7blyNdpZKWQkeLr0/kR8NAwTa+IR77dLcCC5jAo5Pc=;
        b=E5/lmFetV2JJxcJkHIXay45IdR+TffvkJuIZr1a7EflHRbtBeLnMpZ8I1X9sdTWxJj
         8p6n3YvUwDW7MaTOyNj0Bsxy1HO2JP7mkz8+VmaMN9Rm1bjS/b3sS4sN8f2g6ipe+vLk
         jhLmh9P63/QeCLFBV7GxtCkrdcjFROomM0QUCZYVEK7MTaTA9ldmy/tmo21GfNUF0Bmd
         r0Cjvd5LGVnCDZr3qYCNdQcY4Oj/MeeZq4beRDlCSmPIAFvZDDdmAmiLFfchFMN8DqTa
         ov2A5Lxj3xVvOgxu3egac4qOP5xFIiwqfrOdkQ13gt/QnsuLhwWKw1dQ/w5UEp11Oc2O
         4cRA==
X-Forwarded-Encrypted: i=1; AFNElJ/DlKwORlBZi1a5L/52fLfh0LtM1yteXjj6iACT3R08S1e4QmCe7RQSXLqWzPM+7fThdXaZnH4IhAM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5sa+3QoSQsFRZlRfOeP9XJHJLjt+cN6xfZLPU2gJwNy1VrWpS
	O+rtD0J4sEtgnIOaFZYiglTd/3QUgOEdplcX1fPv4LvxTqGVAuqAboGvYVBlZDCqANtOhR3ncS4
	h/wS/ee1PhvRAmq9pqp8mazpFfw2f8eJCxKhG5x1qtneVQyLAUqajHF906t0VaE4=
X-Gm-Gg: AfdE7ckSMeOn6OQMiUxXkOd1mZLp5T8cB5cy29pbelkaF+bJok9mCqZ22UtNePnuSaX
	ol7L6Wp/sEPChnyyd+xPdLuVeUGkfwl7RHuqGdZw0O/44m3J3C/J0Y65ftsheJjHlTLN24Mpx+R
	bCBhIG436G8I4TDQVgpk6t10e+LVTpqSy/XKTJYJMK490iSoezye9S1dSC/J553zVoOuazvr6pJ
	Bsvcclwbrbp3/pL5ZUST3x0lWe+F/53gnnjq+lOEqKafK4wXOQ5RhnqW6MLmlcHnlJLW3Qi4n6a
	j2f3LRtHUVdogho4zxnbhmgO8jrgHNbj/+RSdZx88+izAjBQ6mO1X7Dp+Q7gizV3YkFP6eVgCgk
	Pcdjng7WaqxE6LxUGIEoH83pHm27y5lNmu+o=
X-Received: by 2002:a05:622a:1ba3:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c10731d27mr24969751cf.1.1782814568027;
        Tue, 30 Jun 2026 03:16:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba3:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c10731d27mr24969481cf.1.1782814567520;
        Tue, 30 Jun 2026 03:16:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cb41sm98630466b.38.2026.06.30.03.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:16:06 -0700 (PDT)
Message-ID: <4fe8d4d7-1aa7-4c18-95a5-f0a9d91e820a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:16:04 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
 <022fb465-df10-4d95-a05c-1ff8e59558c1@oss.qualcomm.com>
 <aimlsgJssczxBGhQ@linaro.org>
 <1b30fd97-b298-435d-83a4-944e536bc8d4@oss.qualcomm.com>
 <akKUIsKtWXNYSaxA@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akKUIsKtWXNYSaxA@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CJds0WXyX9SsF9kCscE7PaRJiBMsV8VW
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a439769 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=n_5_cvKnsOMzfkmOiNQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: CJds0WXyX9SsF9kCscE7PaRJiBMsV8VW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5MiBTYWx0ZWRfX/QlMdv2/RDUS
 9Quxra7V/wWuNQofJTWhLrHfxIyvOr+VsUrLcPFVQv9JVbApRFOEyXLWdfpW4Y6M0FyK2xPx8aG
 mv22n3WCv+0GGLFxGeiXtqSbnVtAO3mq+w5I5u02UtEpCMAoCTZWdEBBm+RweDEi2c902vZeLtU
 GzO6pTmIR4LU2s+bA1x5WIV80Iah44ki7i/5mw0/nK+OnE7SzbIX4Woeh2QY73HBDYNf9MP/feM
 7Vdwct8CjG+4WUDReH4Pw/tvEuLQd8ffkEpvCG7WsA2tbnydenXXNjAF4FUL92sUznLOEjNtW21
 +/j2gQ9yLe4xYx2j1ZGtS2KLbJfV5qYbDS1gF/oyQr3hSDGGRjv2Gw0nW4kDgwUpQOy2Hm2mCXC
 dAb77trhvjTVv366Le31NWqFBLgWYND3/K7qqqkI50K+lsOOQ1xn6DAY3DeDxm0dOhBXso/z3sO
 0Z1bUxoObLWBD5KhD8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5MiBTYWx0ZWRfX2GjERzipXOTa
 qJQC6cuHVZm82a+oPn4GnixWyQd+NBl8XmCdPLOyWRTYjQAyZjApxWspFCNR/eCYjp05vGnD8Zw
 KqaovM/0hbRln9PFYlUB0D89EKbQ/O4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300092

On 6/29/26 5:49 PM, Stephan Gerhold wrote:
> On Tue, Jun 16, 2026 at 12:52:48PM +0200, Konrad Dybcio wrote:
>> On 6/10/26 7:58 PM, Stephan Gerhold wrote:
>>> On Wed, Jun 10, 2026 at 10:43:12PM +0530, Taniya Das wrote:
>>>> On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
>>>>> The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
>>>>> match nowadays is gcc-msm8909. Looking at the differences between
>>>>> gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
>>>>> definitions for the BIMC PLL.
>>>>>
>>>>> It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
>>>>> MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
>>>>> used for GPLL2.
>>>>
>>>> BIMC PLL is never controlled from High Level OS (APSS). These are
>>>> controlled by other subsystems and voting should be via the ICC for BW
>>>> requirements.
>>>>
>>>
>>> The driver doesn't really control the BIMC PLL here, the PLL is defined
>>> with fixed/shared/read-only ops so it mostly just exists to model the
>>> clock tree properly and have the clock rate readable for the PLL itself
>>> and any downstream consumers.
>>>
>>> There are multiple drivers that do it like this (e.g. gcc-msm8916,
>>> gcc-msm8939), is there a reason why we should drop this?
>>
>> My fear is that the kernel may have stale data at any point.. perhaps
>> unless we set CLK_GET_RATE_NOCACHE?
>>
> 
> Looking into it a bit more, it looks like this "read-only" feature with
> firmware managing the clocks is unfortunately a lost cause...
> 
> CLK_GET_RATE_NOCACHE does help for the clock *rate*, but the clock
> *parent* is still cached in the clock framework (and only read once when
> registering the clock). So if you have clocks switching e.g. between the
> BIMC PLL and XO or a GPLL you won't ever see this properly in debugfs.
> 
> In addition, when enabling a child clock branch we make a vote for the
> registration time parent (e.g. the BIMC PLL). But if the parent changes
> later our vote is never updated and will keep clocks alive even if the
> firmware already dropped its votes ... :/
> 
> I will drop the BIMC PLL and other firmware-managed clocks in v2 like
> you suggested. It doesn't seem worth the hassle, and that's what all
> newer SoCs do as well.

sgtm

Konrad
