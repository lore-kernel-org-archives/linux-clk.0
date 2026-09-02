Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7256A45C6EA
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 10:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345431; cv=none; b=BGX6OmB6xWsLlFDb7kB+f2hk+36laP4HRKovvxCSGNc5SGhQ9VnTg8ANsGbVF0OqsTGFBwjVKzeNuoJqQ1RaV5i2X6rfMfe/PZ4tHY2sdCOkPXTFc89u9w7NdEKlsSpeA1Ei1/NMCwkJX+a9gGlGcpY+eXO1BP+4fqTA4VuTCa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345431; c=relaxed/simple;
	bh=d4/NsPaTI3caLZnCww4br3Gt5hf40dmy9YvA9NdaCvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oy84rmciiMpgiQ4i8F8glPRkxwN7FEhs4I3oYuSaNJ9RmEVpiGOEiUxeQKPeAMBPxgzA5ZW7eLeFCDZ35efyPVyy1MJAf9qqKsAf/lnJkI96JLA23Z/GMsZtU8o7ZuyBZy8ddzdEHBRLSbQsMeLqJTaKTztMOnQoqHzmahAELmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRdDjXmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+yZ51SE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRdDjXmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+yZ51SE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NEuh975062
	for <linux-clk@vger.kernel.org>; Wed, 2 Sep 2026 10:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3uyQqoBoas0/92LGGm3nVSusdAnQvyayTIQGFu4GaPY=; b=XRdDjXmxNs72I6N0
	XJhJDOdqRdyQ5Zcb/MVLlzU0hLpM9BNBZgH0cJE5iuMMZ5EXOhvjnl2uGlFiMDfy
	RtKLfqWrURQhDDvSkUt4qhWA1EBUON+zPZoEPGMVYRyXSFrN8VP4588wOGApEMlU
	VNqvBOCnNBHUVaRiTW91HVqU/qSCXJqP6Bt82r1P67lG+obJr7extaPLN2emOpBa
	aJkM5CdpMqy9ECu1xBobCOOqdnMYr8Ghx77/l/dAGneAnpzWYdGRxPNPfC+rn2Gx
	/LM5dt0E8WW/Ztfeq6rC3U83MHwmdmKBnbdfdXuoxOhAKE7S3WFk1v+c5ohyymNR
	02z5IA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge435u6ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 10:37:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d0caso19203585a.0
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 03:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788345428; x=1788950228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3uyQqoBoas0/92LGGm3nVSusdAnQvyayTIQGFu4GaPY=;
        b=I+yZ51SENHgMqUkuBNs2++zAiT+AiLhvL4LGR/v9HYGWHxraCoDaaWl5wDNbZBPyTI
         3ulZCyTX9MActTfJFXZF2gnb3mGzKaRYRZ7CW3/jN84NmVx+j5tbjiNBiYz3mfz/wpw1
         tWpwVeW8CTSJQlqdI2M1RU70aPJJ+8UndsLoYr2HfFBVrK4nPOniHN554PK0+iz6N6KJ
         cH426qe5Ph+G+4ijw4vCYlQjC+h83WlmKTxcA8JNeLadRr2cWAPD+HfK1YkuRUF6iDQw
         NNIAvfZu0P0zlTQ+f9ECd5WxDdbMTK/A8dMMcaD5sGzpzZtdGDVRKvS43Xt3ZjBhCDVZ
         zijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345428; x=1788950228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uyQqoBoas0/92LGGm3nVSusdAnQvyayTIQGFu4GaPY=;
        b=bcBrMTFKkSlp1QYHbgBPgTj3sjT/aXFEvhKJ3Q7SRzgYY2QkxA1phOIjTWhrIPp5Wu
         zH0HpPMDd976KGiXGdCPZv+3a23QAhTEgp9QQTlbv0FNOoVmW4IZxM+npM4yJMRDIBC9
         Ya4RwzRs6PDBlwR1ehNrQ2lQ2uoDVRL69aECrCWlX+Jm8qwD01Ks3qQ73t72WF3IaEH+
         6tzXnySJq0b/5MzvKd7G7BHoQG+Ogqyyhf4zwUfxHRgbEXPPdRYjeyHE7tZV7gtEuinF
         5hnUsAzH/Mejl/1g2h/liFqohj7jENZdYl7pFUK4dwyXaOpdPCNh4q8kkkgcoCF0Cpsm
         zsIA==
X-Forwarded-Encrypted: i=1; AHgh+Ro61xmNNV1ctcQXMt2eIHErHeTm+2CDVAd2tTo3hZhTpen60pT2d/JAZSwhKEmL44fJ6WimHfgoI60=@vger.kernel.org
X-Gm-Message-State: AFuF++nYrGl0SeeoADXYdDVhu6zY9GajVEMpijm14hTveddzjTpOS9p/
	B4QXj34/L16aEoVFMbN1Sx4W1SHiPtDxpT20Zm3Bez0+RzEJduxilmaFyirqIVqfcXW4vG0UJ4W
	0YPYdKiRwXuVuKcvK7lmj3f7PxtQlWT5y2GkErvynk6/GwhuM/MkQzqNdogehUcsSh+LDaQQ=
X-Gm-Gg: AR+sD11cgejPY9MO8ev5B6nXJvev1aF00ClWNBgt49xhou52u2D/AeDYLrdv3T2YC/f
	LEqmoe+Y28ZAtr+EkXvfbWNEWyxgYicGizzHNDmP+XYi0i4foO7v9Oy81UlQPH6W3s7S9YATwN+
	IBe+aKRg53ZmbuZ9nGe6PgCc4l8s5R84kU7xEYXB2DMXJmwzMFuUrQqsemCOAaKjEBp779Yk31Z
	AaH0upmCsB2juSdVvgeUNSGx0HULylODv7MLdQKHsklM0v+drfUsShOm0EuXJudHRrwV9dmd+QG
	ZEGKYu9lCs1mq0j0b+wGlzuc+pcaExp0YXpeqIPrHHf/aCGZpv5WEIqFKMBHJznS88C87x2PVPB
	vNIq5TguVjzHEJckLGWRe/g==
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr236834985a.4.1788345427685;
        Wed, 02 Sep 2026 03:37:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr236832785a.4.1788345427214;
        Wed, 02 Sep 2026 03:37:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc5d85sm109338866b.1.2026.09.02.03.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:37:06 -0700 (PDT)
Message-ID: <f80683a2-40fc-4c1c-b66e-bcdf90869dfe@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:37:04 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sdm845/670: Raise CSIPHY timer clock
 limit
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260822-csiphy-sdm845-limits-v1-1-d360bf7cd38f@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260822-csiphy-sdm845-limits-v1-1-d360bf7cd38f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MyBTYWx0ZWRfXwtvnkrP0FBqm
 02Xh7yswCiSQimUxFCvmbWFRPIxOYjweMaZlHozEufSxLr90B1L/7h3OnsG4J+IICCVOOR9ufEt
 YDD5PPZCVcM1FsUbey5mk3gL8rteYT4nupA0KFCcnD7bh1/finTvn1R2MFdFRHM1+/Ux9IjNZm8
 32mB4Obr6bkZDSW04I41tBBUhFSSCnPNOqANY6jBQrloofm6KuNN2K03duLxAtynVCrSQ3eycVA
 1neuKEhwPDosJdIGWBYPYMpdfYVKs3dyu2XP+UCSoYqJmp1xaJVeavNuK6Fz4g2fXmLJMzYVVtq
 tqLuuFu32lpPraP3XflRx+AMvNcxQ+fYoWinlOMGILOHPWNpq7IAf+Kp4U3oe23KX1gZDgjWUZj
 8jdZNJyJulLDi7vZk2iY8kKQeoBuxcETQSGlSSUK4QV/nk66JetQP0bdYEn+j/OmIPqlj+XwLw5
 aAZ0dlqI+KyM1gTsWng==
X-Proofpoint-GUID: XJsuT4FaD4HxElIYh9bKmGmt6nvUryNY
X-Proofpoint-ORIG-GUID: XJsuT4FaD4HxElIYh9bKmGmt6nvUryNY
X-Authority-Analysis: v=2.4 cv=JpnBas4C c=1 sm=1 tr=0 ts=6a97fc54 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=9zb2tplEqV-KQ8uyg_IA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MyBTYWx0ZWRfX399I4f+mTmY7
 kLSJNlegHorDdDf0VkvilqusPNJKBml0wE2OVgXgkqbS/NQdooAJYMscYJuFP2fm1QhAnbp6Zhc
 /Ku+hrGe9Sy1ItmqBCnHDLup6cNiNWg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020093

On 8/22/26 4:25 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The sdm845 CSIPHY timer clock only listed up to 269.33 MHz, capping the
> supported CSI link frequency at roughly 1.07 GHz
> (CSIPHY timer = link_freq / 4). The Samsung S5K2X7SP camera runs at a
> 1.15 GHz link frequency, so camss rejected powering up the
> pipeline with 'Pixel clock is too high for CSIPHY'.
> 
> Add a 288 MHz entry to the shared camcc CSIPHY timer frequency table
> (PLL1 VCO 1152 MHz, well within range) and add a 400 MHz entry to the
> sdm845 CSIPHY timer clock_rate tables. The camss min_rate check now
> passes and the timer clock rounds to 288 MHz, matching the ~287.5 MHz
> required by the 1.15 GHz link.
> 
> Assisted-by: tencent:hy3
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Tested on SHIFT 6MQ with next-20260820.

Is that what happens on downstream for this device too? Is there a
chance the sensor link frequency can be lowered?

Generally the latest clock plan for SDM845 says that 269.333 MHz is
a maximum, with the RPMHPD running at TURBO.. I would assume that
while the PLL rate stays the same, the downstream branches and RCGs
may not have been validated to properly function at these freqs

Konrad
