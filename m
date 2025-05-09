Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B8E262FC2
	for <linux-clk@vger.kernel.org>; Fri,  9 May 2025 21:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746827308; cv=none; b=aNIaWXu6kcdp8XSoR24+R571yVnsM7/dGzvZP+PS1k6B3k5ZuNSqVL2sSg8f29n2BmfLZEL9wVksoSPGnzLmoZIxJUGM1Sf5oLbJR5CQZ8MGDz3S97GPPiR76qfwmcZZPxEz/q0+QpCQoWX8J52d7c0XpuTNz21z7PY1OXZ9/Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746827308; c=relaxed/simple;
	bh=jMiO8dfIWqztSqyBC/M/E5+POfZySH8C5EjWZ1zmoKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pslfYmmMAX+V3CWZrXn4k6BYW/Uutbxmj+G/qINTi5KOaxFKInVs5UUNrmDWdT1dCH8vREfgqZlL4jsLBB6ILtxLJtu2hGvIxdsakzFC0af547SWOcAaMrXs3J4Hu1vuCdSb2kdZKTD3bL/EJPbDyS4b5fut0TtKadrS//TI9fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEBfc6CA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEBfc6CA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549DVrCj016373
	for <linux-clk@vger.kernel.org>; Fri, 9 May 2025 21:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkn3x/u1u+KSHGaXD2ujk6gLEDw1t6RvipnTJM9byJU=; b=aEBfc6CAEW/1P5VD
	rf8YMFtCf/5+TPYoyKd1Od1YS51NRKX6BgS+KKDzeoO9dusIJLged2z5xf5xV5cK
	AQ/ogyrCkhUEdF3/+5uaw6CKeAyo6mejDWfZ+k+dV1ZsZIh8sU7efEGnfOm3DKlA
	DF2BQg5bi4Vj5nRIjuGH3c4CQU0uesd7esPtIQwEPY12H8rp06qv3jcNJOS4rJaN
	gimSPQltAo04eIc3ECexxUkScmRLR5C/Kvn3ViPZXmGYWTyYtKt8v1iJ3yQCpqgj
	a82tG9Qw0p6o5d46Hi16fnmFDuHSpkjDWnBMWu5HEN3otQQPsPuNom2nATaBoAcL
	TYO1FA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8wu8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 May 2025 21:48:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f543e296e8so6698236d6.2
        for <linux-clk@vger.kernel.org>; Fri, 09 May 2025 14:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746827305; x=1747432105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkn3x/u1u+KSHGaXD2ujk6gLEDw1t6RvipnTJM9byJU=;
        b=CzgEzxhm6XzuzCfczq9fM+QCQZTXuKP+jnKYdQszZaQyNovFjGCNoLlJvZAYaTjtN6
         iy/npj16y1FxtnBRW1BZekBnPdJzNEmIBrxHIA7kzuuXpqCsEWO1thuHG3tvOVfvhA2/
         ZbrL49E7PKGESgNDwM3AAkvuiilTiLMn6CCSqm9EGEh34rTnDPUCo9IJwTdUeNxO0rNE
         0BuByYL4Ad6cmbh62O2qL7sEKzHNPXtfW90srebkq0L3FUndeMjozeh5ZUkSn4uPKY+Z
         ae5+j6nE2+ZQ92o4Qldfd/MSGb+iLSGgSCoIC2S1psaq1PxjCE2Sxay/eMddHvRoF6pT
         F9XQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9XSDLRwjEcqSy9mPgBq2CYR2RlT1gsyvySUxResOYFBXz/s4JM87WDXwBCmeFwVCZxcJ5qameJn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJcgewF3Ql7I/uh8K+0/BMC7iDR16cm9B6IM2DnUz1dhRvCRox
	g7YpmlsGxgPYqd1AmB+QKld1PQRUuegW9P9+LXkGSQkQ960O+8gqND7YnkjefrddG2Piy9VKESR
	8I4Y3NB9kMQolHhjilLfL2bmFsu12hHTWfOLcZXp9QvA8GYYSjv6zEK4LCBs=
X-Gm-Gg: ASbGncsqcqft1LJ2FCsMkcOL3DawhZQue8yI2MsMugamL+HCVsQ7aUlj2Qmddo94dv+
	8XMILWq2aNTyz1ne6LBWj5AWdWdwr/LM1ptgaCaUTPxUeKCJFA87qhtz0X1HYwDzE7xTZGZOnA5
	NH4wl7c92qYPS+H1/bWwShDo6vdOlkFjgKAGAm6Jbmkn+6UjkoxLzifrXUUK4px7XEAuTiwpCge
	E+9yi71hrJFfrFmwt+njnW2Wba0LwqUO53G8PjWcucYJtJLfHwSmrR6ysLeB3a5dZS6MEoElEzj
	0NTUfLDdv33VU8Wc9FKM5T3PpsrEANPigFDxAHjrrgXq7XXpTUwi+6HKBX92/7Um7sU=
X-Received: by 2002:ad4:5e85:0:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f6e47bea88mr29484086d6.2.1746827305432;
        Fri, 09 May 2025 14:48:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSGc2XgNJYZeKKzikhTNArCWy0JPoDUUmmdsKTNg1QXI9xsFUIewBL4B3CBOAqNpYYGbz9XQ==
X-Received: by 2002:ad4:5e85:0:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f6e47bea88mr29483826d6.2.1746827305088;
        Fri, 09 May 2025 14:48:25 -0700 (PDT)
Received: from [192.168.65.158] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cbe496asm1899058a12.6.2025.05.09.14.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 14:48:23 -0700 (PDT)
Message-ID: <43dbdfaf-fc02-49f4-b2e6-5c08b1998d17@oss.qualcomm.com>
Date: Fri, 9 May 2025 23:48:20 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: qcom: ipq5018: remove bindings
 for XO clock
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
 <20250506-ipq5018-cmn-pll-v2-2-c0a9fcced114@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250506-ipq5018-cmn-pll-v2-2-c0a9fcced114@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NHQMX7uxRFTqu6vtpB0G6JiogBrpmoH7
X-Proofpoint-ORIG-GUID: NHQMX7uxRFTqu6vtpB0G6JiogBrpmoH7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDIyMCBTYWx0ZWRfX0wuvKq4B0RWO
 cWkA6SIDkHai7R6DQMOF2xJvKBK1ttjH51mX0fUqHY6FnsNYoD6e/uEXaWvp7xL+GoDKd0pVGQW
 DrNYc4sDF5nKfWHxEC0g/WMcxa+u0vZBodJeNA2FucYwBrYr6V75uE2Dzrki0J4OJOFdoavwrg2
 dO/uid2qOHVY778Fcf8s0BlifamFeC7hsXfcNTHc05G2/lonwGn8Mvorua4N91a8BQAhQcPvEQZ
 PWQTPnk6o6n0ITgc2CofHMuKA+TAD6N/vdUSI8phHoD9ytQ1qL846iHcrqcmdRvea6vL+O0iO9F
 rh0QLLYXJTbS1358CVL5w5B56ZOQ5M93gaqpU5yDzItOI94Sogf3HHo1dz5AUyIuohoWABFrJc8
 u1ZsGxteQHJZPWuR9829PfAuatfh16HoT1GOV563oDD7HVdJRUYvMKHR+Mpu39MF+ElncVPb
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681e782a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=1mxAAckyurNBcPisKkgA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_08,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=947 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090220

On 5/6/25 7:43 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The XO and its source clock must be always-on and is enabled in the GCC
> during probe. As such, remove the bindings for them.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  include/dt-bindings/clock/qcom,gcc-ipq5018.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/qcom,gcc-ipq5018.h b/include/dt-bindings/clock/qcom,gcc-ipq5018.h
> index f3de2fdfeea11f4b8832b75a05e424ca347b3634..d4de5eaffee7b4cb81e0ff2dcbf9e6669c3da8f8 100644
> --- a/include/dt-bindings/clock/qcom,gcc-ipq5018.h
> +++ b/include/dt-bindings/clock/qcom,gcc-ipq5018.h
> @@ -140,8 +140,6 @@
>  #define GCC_WCSS_DBG_IFC_NTS_BDG_CLK			131
>  #define GCC_WCSS_DBG_IFC_NTS_CLK			132
>  #define GCC_WCSS_ECAHB_CLK				133
> -#define GCC_XO_CLK					134
> -#define GCC_XO_CLK_SRC					135
>  #define GMAC0_RX_CLK_SRC				136
>  #define GMAC0_TX_CLK_SRC				137
>  #define GMAC1_RX_CLK_SRC				138

Let's skip this patch - when we add dt-bindings, we promise these values
will be an ABI, leaving them in there, even if unused, will help
introducing spurious entries
