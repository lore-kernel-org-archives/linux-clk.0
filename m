Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560E0422E36
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 10:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785235724; cv=none; b=i/beyH2FfynEDwrsnQgzLWKZ/wCixLLpwWMUWdLAl+IH2p/i28lp0Bl4ngo1AlMGCg3EEDb5d0y6fXAe2EpFUUm47m0eiMjRuOuypDZDX+U1+QKmHxfL8Tt8EHUJuLBirV7JYMypPCoYXss/h+TyPcs8N/FMTHlHny3p2EUTIl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785235724; c=relaxed/simple;
	bh=+2VXiGMIOCH2pmyuRHa2hoo5DBgV4E80jSEKqltfTVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMBWOZSRtN+vqFmn20ilt7nsNIbE1XiVKDEwslRjjLRLlSmIJQEsr+14OnS7YwzfTrURK6xuCTZfNI2XjP25ZcL/1zTsjOryVs2pRDzUj3HwxPsD4U8+xMbA0IAhjyAg5jfwiWtbq6pjYSNBW9mrvVih16etO0fPOK6SrBK3Nr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rb3RRpvN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGcYkXDA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rb3RRpvN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGcYkXDA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SAgce82043747
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 10:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mYrJRtpE/M58oknn6w6g6s4C
	5iZ5GXjvqTFr0fKnh8g=; b=Rb3RRpvNDCVmZgKAWDSILLWRAEltX43yQo8Ftzdh
	F4DPobVjgY/XhDNK9SmMEpx2id0sctqiUSNakZV8T0ptJO5SrHGhg4LJn5mJLxM0
	GvhQVSo6EOoIiHzB0cV9zf7M098wGYb2w/l6b6ZAMWT2zsgyxyYmUi+NtZOQ9T9E
	tSADJ9gP0qALRepBxvRL5unRcZcv7aVSZvtwHdp1j/E8J3GWWqONVqgUBsmyuAZN
	92ftSV6Uvl7WwSoXx5nibWv0/H/32z38G+tQjCwwA7H400BAA21UZ8Qr8w0ToNxr
	WyheF9UfznuzcRxnrsFFhEzTzJ2xIcawzreNt11gf/dH5w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpptts5m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 10:48:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a9764f0so47477771cf.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 03:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785235722; x=1785840522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mYrJRtpE/M58oknn6w6g6s4C5iZ5GXjvqTFr0fKnh8g=;
        b=GGcYkXDAjR2TFp0HV8t82BmaikYoh8w3kKbixL2HpVoyuLx9jp20hEmhj0v6AnbOa9
         /PRLGKJNUIbfWLyiqClwo/DfUiyxvl0zb6jsuB9yH5UwfOv4rlda/WThSgVlUl7XUeDs
         FUxDrO+hFrIh1BR1xZs7ACPUdC+esulpXNQYjNpbsq3FLnZa/pb02TnYCfWshzblBIoD
         xPCtn5urtO14T+K6wXbDuQgW2SvKXGNsAAuRRrESA0c9Zzbwkjhht2/SbivISFKcH8+/
         d0i2BaCMlVT/b3VwJRM53Uw/ZzKhLXiSBIxNmdf/0uCVPpFkHtkkaOM4Lcnd9fUCTFn2
         Ubxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785235722; x=1785840522;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYrJRtpE/M58oknn6w6g6s4C5iZ5GXjvqTFr0fKnh8g=;
        b=ruiaFaLBDM8jVc+Dhb1fq8SLsn4WYG2ROYI/IntH+kOlws2ZXvk/WfPZX8M+hwSV/e
         wWIHX/UfbYXQHL2Q/Mwgsao40xqxhQZJwW4h5kCjCjdXTMaywDYdjJY+wCw22g6+D/YZ
         DGYxTEWzKlNLEqDtALq68350U3UYqc36l3/19laqZIqX/LQjrUvVt6lCi38ZETGJGdU3
         HQge6O9fmwfub0CJRSsQfZ72v41MWEE2RMzWH6zdNmNGFwfYtTgOVPB7o4bOZ3Ed73Ve
         reW3Jc2aQ6m/g3c6lHHnrK0vycjmCcoPjr/0pNhA4BeDnKcFIvo/emeXZRr+3RB2yu2P
         CGYg==
X-Forwarded-Encrypted: i=1; AHgh+RpqoDqAo1xvvn+gSOlzsXLrPdCBr2MyzPf6Sw7CH00wRWpbqOvZHsc/S4/NPA1kldPRoYI7vCOYodo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw41DTLvr9pq00eQPS9iTgXRXEhYLW7EDzZen7z2EopW8HPXGat
	08X690ceH/GzZU3olcgduf0huaUCk5k4U+mavsDjztcge4HUqwffH7ZrthvbQHHSuwE1MV7WqZT
	dFth4RGaTo/GVO1sbTJ3zYNDsFpdXwJfhi7xNCGLXZD5kev7rCrGI6b0EUVE6IbI=
X-Gm-Gg: AR+sD12h7LGQreSfnBiowp1x2hoXNfyr5uCN32XjZs484DW2TQ2OXvyL1Lk4TlcctjQ
	Ug7UyCH9PeNUZKYvBDlpfcNO0VoBQ5ghwU1Q3iQaycE5VmFFb4BpaHDT3oXjqSOnZArdDCsERjR
	uaQBeoQVGsi2DZugeqkY5aCMg06GbNmwv3apAq1Tu5dVYMmvIsPiCMcNvFINltxIsn7iR8ES7Um
	Ddy8StVIUGGrJS+/Z5URrDZ9hmZ4oKK7jPByqe4PqdBmWKdRhchYu51etmKES3pcT6UXTiWHlC7
	M7/m1ce6WFP9kSwBy1KN04u0hoaG/KuQnmXgJ2f7TDbxf/QyeTAoYkbraOlGnU8WxFrFPxLLHlM
	dueQ7jT+x74mAQESG9WnVhIM/SDA0jP3JLNt3cv7JDWuOhfQgHst5h5RieWWFW7FwUUVLq4/yu6
	dZHE5e6kiteEy63A==
X-Received: by 2002:a05:622a:412:b0:51a:8c9b:64a1 with SMTP id d75a77b69052e-529d7169f3amr14419991cf.69.1785235721536;
        Tue, 28 Jul 2026 03:48:41 -0700 (PDT)
X-Received: by 2002:a05:622a:412:b0:51a:8c9b:64a1 with SMTP id d75a77b69052e-529d7169f3amr14419721cf.69.1785235721070;
        Tue, 28 Jul 2026 03:48:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1f9721sm1917162e87.76.2026.07.28.03.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:48:40 -0700 (PDT)
Date: Tue, 28 Jul 2026 13:48:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v13 3/5] media: qcom: camss: Add support for PHY API
 devices
Message-ID: <jy2gc6ojh3sh2araz67vdk4jo6wsmx4xamgl6hjfuqpdphxxjr@aykdzj6ewhm6>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5NCBTYWx0ZWRfX3U2F9uHuxtpG
 Cd2wNYMLCuTn3nBkOW0Md5WbfmAGJ5p3pWRhe9sVtVkG5X9vQSDqrOu2YB7GSn08K2bZqz93M80
 NNKLk6zcyPEncuBW+CE4imkqqetU1Wk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5NCBTYWx0ZWRfX2oncbNuK8KMW
 FHXpFznNhPlAcxHchQoRpY9jrdUrSakuNNc32pmZRqc4JhKMiyvOTaSYyAFCDn+VHxmbMsV4hIJ
 SLFs5YY2ohFvjv/o+gNSp1hUxBHo7vfGQTL0kEgYDw9yTETgC51KBakvkthnRhMqOxBHrYe8BKq
 /yX/zgMjJpT1vLOEerAUZ9SH/UD/E1elFT8xVC+t24pPNbD4vHA+qhtMETpfMOFxcatHy0Y+MZn
 Hc0KScEYfO4fGrhpYWhkEtd7nbGWgSTCDY5he8kGN+RyP/SD8RmyQMNiJURAWifBfiReLl9AWSJ
 4xk118cjfU4FPYLPdSBFnvx9zZbjbSyAn3ru/4A3DGUcGRJ2mAtx/A3DiUng9x/jGu8fSOZDWGh
 xUKKo7Tdt5zoJfU9fC+g3NfguSVBQVRGSUC4JaAFVeENXBKACVmNqSI7Wjnih3dhBhvTlpaZMbu
 +W2TSt/EZSUopf8xMFA==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a68890a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=SmOWCKbkXSXCNfC1NdcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: DqgA8cFdaWGCrYivFcaTicJIv5DJY8ON
X-Proofpoint-ORIG-GUID: DqgA8cFdaWGCrYivFcaTicJIv5DJY8ON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280094

On Tue, Jul 28, 2026 at 10:35:34AM +0100, Bryan O'Donoghue wrote:
> Add the ability to use a PHY pointer which interacts with the standard PHY
> API.
> 
> In the first instance the code will try to use the new PHY interface. If no
> PHYs are present in the DT then the legacy method will be attempted.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/Kconfig        |   1 +
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 177 +++++++++++++++++++++--
>  drivers/media/platform/qcom/camss/camss-csiphy.h |  11 +-
>  drivers/media/platform/qcom/camss/camss.c        | 104 +++++++++++--
>  drivers/media/platform/qcom/camss/camss.h        |   1 +
>  5 files changed, 263 insertions(+), 31 deletions(-)
> 

This is nice
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

.

-- 
With best wishes
Dmitry
