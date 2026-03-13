Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D482E3360
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 10:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399222; cv=none; b=XHAmtCKhumhINt003GqWbzy2vNpjF5fOAqGHFuSyTODU3hxvPTNdldPNDFo5SVbIARjRt9J7RMUM5LzbCxuBQvFDVCVt575jx521r5JsvfI6fONzKPeW8YBGtckJXrgem8I67/trvx2EtylqTzT3pcLqsd4sBvO6yDDuw+hB4To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399222; c=relaxed/simple;
	bh=PPCUfoI0/e/eDTBJyZ02tAh8FeidIqsgTPEkLr2KyZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJ+vgBLiWoc3GjHliFMpqSWBEYHm39fA90RbQPhPy/OP0dXKnPnMGjIkkY/1imS5zuWnOy8z0HanEkEUX1vA3r90Aq+g497V9j3gaknvoWBOTM/rdbhwO9wXJLRXJZlXPELQgb32Ed5/YkqPWDZyuZGECAkxdGFMsKyLz74X4wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+1zqocn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibBQ/RpA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+1zqocn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibBQ/RpA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tcRc4140736
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 10:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cX3xkJi/EXH6QWVgeE47LXXcq58/182R6seTgGT7pmo=; b=c+1zqocngVXoKfdq
	VjnLFbrPA0STiIAG7O6FVrox73LYbkYxBGijP27TfQSofRZ1CDLwiYBwwmrwM8QM
	E/MVyAJbQz/9bNtoiiONtBjmJL0lZ0TDfb3t4cBcntLeJDKveJ3Pta3aIQf2P8OF
	n0+64QYgZ+gfgU7wRhhR7L8WwR5QG2pMvFWX0A8fbAiRwmfBNaxiTg7p+Vs3F6yC
	jIZKt/3akiXIgSOROpzWpPNW5JZ5H7TyyiqvNAqtlXyrJK/UuuyO15DWmWdvyu/V
	9HuzohhwPfONkZJtE/aOzrw9eW43IyYjYLO7dusgZ7qpAGhguCKR+2ZHLmNUBK6S
	bb+Vxw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn29931-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 10:53:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8dc8b434so126671585a.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 03:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773399219; x=1774004019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cX3xkJi/EXH6QWVgeE47LXXcq58/182R6seTgGT7pmo=;
        b=ibBQ/RpACoB06Kh0Bo9SShUK9desxiiRAZH9I+8PRgy4fnH9XVP/klFjvVl1TL20fN
         Pglwk1c3tIdSBOdR0iM9JI0GoZw/jFoUInkKveB9dBJyCW9jtotIAxbQMETzkft+Ij1G
         Z5ELemeP3x+Z1u6Ik61Gw0pTvckcY/UHkZvi5zSnJ4ZsO6OmEmBp0XO6GnRT0hyqC5Nv
         tg8e25/3eJbOkj6rMilJQqfIhSKO3ud5d7iqhmCgZHNmcN8dw9t6Ah3nfValgOlyEGan
         kh805IsHiqIhbnxOk9SB8a2wZ8SeiSXShLwAwZYrQFdjJIJ4bSZtGCnQ2w8vSoUfvQl+
         fzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773399219; x=1774004019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cX3xkJi/EXH6QWVgeE47LXXcq58/182R6seTgGT7pmo=;
        b=f4WnvZHNSKHRqvKL/O30cScGCDz3sAR45uj6jWkt7Q2mPMdUssZeUNy6GABg+tydxN
         Jtzf2ANaW8CdTWD4H84RqwTrSiseAYTafbS/4Prxm7Ubph9wA5inKwJ4A0RDJzxUMiTy
         xl9WLB/3WGE/QvA0RRZ068p7rlyPb8vg808uc9dg13VHbqwAuOjXPT8fmTWrWKr3PBU1
         civg+4leqeJ7wgnfcsC0JbCJB6EBc7k2Qi52plJ2dYoM/xFq3LI9KzjjFwbS9HRtsDeR
         BzPPqB9Ld1n1T1he7jiOqdWrzmhB2H8gyK+nHwEwq/A2e5ajMCMFWeKoqAYQyu4vYDGa
         lfhg==
X-Forwarded-Encrypted: i=1; AJvYcCUoYIj6EVcTHi2znEfDsCYukcAyX/UnlR/20wBlHXjqTv3GyymxatuZzDWAKTwJsIQedj/tOuOS7+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU0A9+F2uyP1sZScvcRz6TnuE1GlvKekT4kPrieLyaVbl5fnh2
	VJ02Hua4Sdypptk6wjbJCsVWO5zP38u1ry/BRwbZpEGpYjGuqBo/pYJCsWRQlLv4cBCCKHYA8pD
	SvUznRmrfdUIYCy91QchtF9bhxDn1je0GWbAu2tRMpc7kS3yMpGdbSbNZVCbT7a4=
X-Gm-Gg: ATEYQzyHDkkiCtwsiNFllNHUHMNnW4hpFCdHdeXlCSSLgqvmTZiJ2VqhmSFsS2WWoNO
	4Xs+hx8i1iy1sMcj7UwaMJ3CLdxtxBfjuP4AIUHACFGRqzvWaIyN4IPWcXj9D55u/byIifXHqmU
	C2F8f3U+r0PDs1nLKaKEIpNALzt6BH9H5B2dApORWk4N9IX9AiNqKuuDq5qxBHZ5N/mzN0CU7AB
	TR45iS+xToo1IcFHZJtDueNxrR1dghQWd3gzfeEcyusbJHdXOCSeduKP8RIrIheHPW+lvgTn9MW
	IDD96SRyHKvw1oaarkyp9pco68lLXT0K8UJUQ7xGPBew5LAxDe0P88hFtgECfDTekMhS6ngqJBj
	6g4w5Hzt8D/ynSlKc34lkjUeS1lNmKBwwRqqIdn4QPXs/zZsO396jxXTVslS8tpivw8bRccwiwk
	pAG+A=
X-Received: by 2002:a05:620a:710c:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cdb5b61aacmr277702285a.6.1773399219372;
        Fri, 13 Mar 2026 03:53:39 -0700 (PDT)
X-Received: by 2002:a05:620a:710c:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cdb5b61aacmr277700585a.6.1773399219002;
        Fri, 13 Mar 2026 03:53:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf3db5asm36817866b.56.2026.03.13.03.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:53:38 -0700 (PDT)
Message-ID: <36da7262-0dda-4bb1-b9f2-abd77ef83730@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:53:35 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] clk: qcom: camcc-sc8180x: Add missing HW_CTRL
 GDSC flag
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-11-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312112321.370983-11-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nW1Nhn4-z1saPL8R8xdhErVfPy1obFNj
X-Proofpoint-GUID: nW1Nhn4-z1saPL8R8xdhErVfPy1obFNj
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b3ecb4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ysDSEWaLRDX8un34YhAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4NSBTYWx0ZWRfXyXeWo0X0BvFY
 YcA7tPsBv4NCME1p72LsAFhibgcSQA9BdMacZO/W/hvjB78VMqE0LLa03nxO1f4fAiq3ZiH88Hd
 rRozzh1p11E9K4tlTmhlvPQFP8DBUa8icFg/h+WjleqY4SBpQjReuRybAZSi1y2P0QF8ipAYiVf
 xaYj0mLNVJ3T/g6OUy6siLkcCFlgegnNvrEE0NJY8B/JlIrE6yVUK21sq00tr5COk2kYgjzRAtD
 LPO5ilE4wl/bnhfRzHkZ+5uYiLmijlGh58D4C24HB+eil7eTCG+ttF7+B+v5V4ZP6UCVOX5tvVC
 gxkK3YTEWsEfzly7tBS/Q2Vb2fqNWWI+ESsuygu4Q/5+2d7Y/A0v2axJ5HSVS9Zd+4jDyGjLRka
 p0Zos+UZ08g+wsG6y6quWAiIoiVNlVU4dZwy1L7HRmz4HUxINo0XdNts7N/jRlHTc/V+1p9NyBu
 stFHLc8xDcyCO7U0q2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130085

On 3/12/26 12:12 PM, Val Packett wrote:
> In all other Qualcomm SoC camcc drivers, the BPS and IPE GDSCs use the
> HW_CTRL flag, but it was missing on SC8180X.
> 
> Fix by setting it on all applicable GDSC entries.
> 
> Fixes: 691f3413baa4 ("clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/camcc-sc8180x.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
> index cd4c40a81c28..67b2055bd212 100644
> --- a/drivers/clk/qcom/camcc-sc8180x.c
> +++ b/drivers/clk/qcom/camcc-sc8180x.c
> @@ -2555,7 +2555,7 @@ static struct gdsc bps_gdsc = {
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
>  	.parent = &titan_top_gdsc.pd,
> -	.flags = POLL_CFG_GDSCR,
> +	.flags = HW_CTRL | POLL_CFG_GDSCR,

FWIW downstream seems to use HW_MODE at runtime and SW_MODE+collapse on
suspend for both BPS and IPE, so perhaps HW_CTRL_TRIGGER (and a patch to
the driver) would be better suited

Konrad
