Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623165;
	b=Hz+Ng4zFMbdGcxRiAoKRvI0OHcBYjKFWJiPcJYcBYMHi62HP+vfw2yAF0HRNNhHfP1S+
	 KNjU+75LME2t9X3JfGopntrikx5uU7iXhW2WMcmlj08L2AQBARk95ZFOtiIFgD/FAaEnm
	 R7MVc7B00Y9FQPipd11xck2KYMJ/fMOrAARv26KugLyEeVYBt3wVuq1PHJBSsW9IXWiLD
	 zdSjhkn2syE0olka8JPoiEtvO+3zVSVP4dPS77H2n+jvddoNkACOlNY+W88QfJ46VfES5
	 2xVs1964TF4TplPZ/S1/dfSN9BOLdVOX1aCtyjsBiqGENEWXoUDIjkMPF3kRCzym8Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aGDvSGUaUelkvgdt8SNqfNdrDK9ovbfPV8d3W40UaUs=;
	b=o7IL5/md+N/GhpMAwDX7TISUAqHSFruINiYEdIC01ltvZ1O2J27PMolOthnPYNeYpwk2
	 SDF58MPW//+fyWtCLm+rYcGa7LRO/CmHmKPB5R1gVP70ZzxkK7UpfbgBVqvm1MsCuM43K
	 Dj+ky7cmSdBH2XFADbmZEzxkKnk+bCxfD8Of0yjh+88RXHV2L/XOEQ53tkZaauJ/poOAL
	 u7R2evDFDMcpNLoApExf9SmKNy4Qg5+kIdcqfmZ1PEppPgbQYhwjRCAHlovjRT8BDdJDH
	 90fcxPXh2qBxkphrc9bYV51d4j7jsRibvl8kcxjrqMg65ni2Ec/i9JoALd4Dhd9OREQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0saIndc;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tpnfups2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAAA606A32C
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 12:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFAAA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0saIndc;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tpnfups2
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A9ia3403350
	for <linux-clk@vger.kernel.org>; Mon, 2 Nov 2026 12:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aGDvSGUaUelkvgdt8SNqfNdrDK9ovbfPV8d3W40UaUs=; b=o0saIndcVHp8vZ6f
	CZ2rkVhjH6ouSd/s4V58y71yXm80mPHeAGEZO+CC0GP+LnpJ9lCUFhD7KjU0mpol
	LhVJHiTkF72NE9l1LmUq3b+c80HrkvP15aK90GU2lJB/zwQOfZqylENqYUtyeX3T
	AU2f5gRStFfAqYDzzvyjk7lLa8GfK7f1LNdcYXLNO11BPKqQtLcgkmyZ8Xpsixgn
	g37lQ3M1AHJJonE/at+vRCNLpPUe0IyzOUE1/wTnknCOiKOrUGj9i/319/V2CvHM
	KJxzu1UhoCsqrbX7DDFAWEqBWoRlU9cGIIM+8f3H1kFlqq0kV5l1Wqm0ffwKkjQG
	GNbzDg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe9466-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 12:39:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5360b8cf8f5so6895891cf.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 04:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623158; x=1794227958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGDvSGUaUelkvgdt8SNqfNdrDK9ovbfPV8d3W40UaUs=;
        b=Tpnfups2+QSRVb7I1L0nKeK6XuBUsdWasskFT6gz395kizEjfAjtra6zsE+NL8Py1u
         3CjuXVj0dZYKlzPxR/8yRmyRoapKU7vIliy+5Y9pHcdngkK2UX/r+TGQRWK2Quk5f1yZ
         B2qE0aJzewN0aMeHsK931S3AgGDOf6Ywlfvx+uK130x9MTvo/RPDbhp7FQokaZeTfBct
         ugxJjtSyhI3MWAJjD/RYVAE9ce+AR3mXwTqRer79AXrK2xeTZRvFpDCWBzInAO56mZKN
         RwY5TtYITH8d1iaW4BEjKwH4SFPuBoyxXYPW9BLlPZlisegm6RUArGKOrZlsAe5zC3Dy
         rF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623158; x=1794227958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGDvSGUaUelkvgdt8SNqfNdrDK9ovbfPV8d3W40UaUs=;
        b=A2sFcy2bOJ/s77uepFRyUuZIvu9Eq8hspqgNKOPKz3ogLsZFNSh7dQryu8lLbLt/uB
         3W3q8yTIq8Q00YyTenZE5gRP29s4UtK7O3d3zCHTUHZ3sms3WQdbgENWinvI76me863B
         i+77q/ILMpWS56Ol1qoewZJX8l1Y0FA6mUWSAU0j99geE1hS95J4Bg25ygVbURkGK27O
         kfJLr4mmeWuI1DhgPHwJ2qVe84F6bc07usUAmfOoXkre8fNbRgsonuekPclghxOxyqiU
         762LhNZUPi9dyt7MqMeUZ6PXu894duFKk4SqlPvCQZY2vyQwyIT6iRHKws8y6WH2P3mr
         KCwA==
X-Forwarded-Encrypted: i=1; AKwUvBzGMJWzp2fGweEp2DDsiYzh3ENdvwi/EjfPOlp5XyWcVQI83hJ2BBJC7wZ0jZMeAim2DBmGiIJI1PA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKX5j3oDlGTDM7S+oWvIzkwCjm83lW+muRChhxXG7HBLAzTfgeV
	7JeWeFciRvuveKgxRKC8aYpt1x86UDnGDKVdcQpI7/LLSuxMxpPkpaT4hyVo3E9xIkmAgFaB8z/
	SSgcvn/7lbIPqMxSUsZC0KQw76WqHzoP2LRFkSYhHUKcIe5MLD4pfwS6rvczxcXc=
X-Gm-Gg: AYBFou3gKN1q6o4VsBt8n3fgtSyZQvU4cFAgfkl2ddWs3E70bhfytfEHCFGJtPpXWpF
	WPruo1jYEziz2a/PfA3OZXhLTWfEUTGDwm4Hsk3xhCetJdgysTURcihymmmJ00uZ0c+r9p9ECdZ
	ewJUpDhzH41dsGjzi0+15vhHHXQqEPAWMZjVZ5v+n0MkZLyoqTF0Xkiqr3znaibU3hIPpGlrZy0
	8HziOqtklcVlgJh/xIK6z9ZBUL/p6ZJHRZIeo57RRqMphgMWetOEIpy/Qujcte0F3JDhj26Zfq5
	BpMoYICDhizT62d0InZD0HnZqT+LZhsJ2mNtL1oxYp/rcXBrjeDl1cELTrhytkavjW7obtwzZOy
	hBgYuqSyI8q3S4BFewCuqp44jjt5bmDOogUJ7eL7bJIK8MvNjQlDbnpdkzmvh5gfpW71oJU4=
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1815610085a.3.1793623157825;
        Mon, 02 Nov 2026 04:39:17 -0800 (PST)
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1815607285a.3.1793623157435;
        Mon, 02 Nov 2026 04:39:17 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbebddacsm23222831fa.6.2026.11.02.04.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:39:16 -0800 (PST)
Message-ID: <ee443167-963f-4a12-a49d-0b4523afc14f@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:39:11 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/11] arm64: dts: qcom: Add initial support for
 MSM8952
To: muzafferkadir@mainlining.org, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Jassi Brar
 <jassisinghbrar@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org
References: <20261030-msm8952-initial-support-v7-0-ad748ace375d@mainlining.org>
 <20261030-msm8952-initial-support-v7-9-ad748ace375d@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-msm8952-initial-support-v7-9-ad748ace375d@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae88476 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=OuZLqq7tAAAA:8 a=MxLZmUXcRv2kY27zAqIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX0dazFS071YrM
 dsWAXDJVJWazKUL4P861923f+rcVHQk/Y7y2UnYFGUjT1MP2MA9PTx8QoxZ2XGBxaQRAxQrfdZW
 chIxb0LHxqc7n/iA0P9zeRaohKC5GT/mFRUQIxU/8rGdFli1cjqSZ/h4/XshEUVC2KsZPefEAna
 E9kDynIsstg8wX9hOrDw4bjyOsirKcoLyRQZh+VPQ1HroGp3jz8HpkoHS3zTyrqKQcnrXAxnbjB
 KKWNjkveGFk1D4tmGuG2JOFuhMwXptmjPM0YM+uRLDyQOo2XJXHlysYSC9PHkob4Wgd0YBkBvzJ
 kT72n1JXYXmCHUjeGFstwTZvPsHZEH37rLvpaGFb/CnxGHCDUeqxRvGfX67ERUvl+eYkwKFA5gE
 orQ9zBZ61vej3mj03DswjL8oyovrfcQcqqfAtfNPR7Qi5lbaTUMIqfWYYFI6Aw0PXADLsfFLPi8
 PTtwxnMKfTe0SAzqteg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX+nJMOSskbeuS
 +7dgHu6v2SQVQXurUuWkqtleO9vVQH+WZPQU//n50NG5bJZUuDGiKB1WURxhhMVA3xvOKbTCFUC
 ubTb9EMbTbhFzK6VYDi44LZPq2CzV8k=
X-Proofpoint-ORIG-GUID: HpGY9BGmpzFZKIP1cTSDHvb9MGmZ7X5e
X-Proofpoint-GUID: HpGY9BGmpzFZKIP1cTSDHvb9MGmZ7X5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020050

On 10/29/26 10:02 PM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add initial support for MSM8952 SoC.

[...]


> +		gpu_iommu: iommu@1f08000 {
> +			compatible = "qcom,msm8952-iommu",
> +				     "qcom,msm-iommu-v2";
> +			ranges = <0 0x01f08000 0x10000>;
> +
> +			clocks = <&gcc GCC_SMMU_CFG_CLK>,
> +				 <&gcc GCC_GFX_TCU_CLK>;
> +			clock-names = "iface",
> +				      "bus";

The robot suggests this is missing the TBU clock (and also
sister iommus)

Konrad
