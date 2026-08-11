Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EF82EEE69
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 01:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786410070; cv=none; b=CyUh3ndHWj9MdnRPSW3wOLlP6mUhKY0SLfo2uQsDCT4D0dSm56dmmvKRqth0swwyqohmjQnuEsXwWviME+0R1pZYcqwJhoHApi/WOJI4XzVCrghVOw2Nyz386D63tGZ8ra4g930wDdcu5J/Krc06eXOgCvp2kCzmiGIvhw3yAm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786410070; c=relaxed/simple;
	bh=etcNXBBDDQzHCuhn9WyhQRQcwV0yDZKYkLQCSlrBMdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuCgIaGjk8mA6LFTSBgRfr1PCxHW2zg/KEM1JnSD1Zu/0QbT+f7lBg5anrF0PLvcgamebMT4vPnoY9dhBO7TiMUlCEeQbqAmE12xdeZcgUR3KzfEKKNH6TkYogSVa0JB4WLtJwxI95iu0X91w7KX8FGWBvuXKvB4dernQE4Vgmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FUJDVLMn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEpF6Lud; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FUJDVLMn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEpF6Lud"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMpwdC2705441
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 01:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7AgUwPpZ6ylBFvFSPApEkM29
	i+AJLtwNGpDaxug4H9g=; b=FUJDVLMniirLor7pOsg86uadALTgQdrNocSWwq3F
	IsFkmukO0qWWrhSFxupaMigQcW7hXYokQxIGVROxMWAIrhOBzCNylgEcdI3JboL3
	qVX64Zn4unEqcYMi9qTnPKhxFlcNO59MTWNeYYkbO9qDyrYjjrhId4kf/9Ap34m1
	xkodpOo1nLbRiQwznfnb/CjXa4k6d7lgS5nU/NCsXTM4f8SneiQxwUBXp2iz0bZX
	OJYHb/7Qml+uH8dbVtXQr2F405c7YDE34BmuBcC8VWmkAamXqOyWvD+Z107XnpCH
	DItbWwvt+u8ozZ01lGJdyXHV+2NzPjkd75wqRUum3ZXlsA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk61q6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 01:01:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so3456951cf.3
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 18:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786410063; x=1787014863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7AgUwPpZ6ylBFvFSPApEkM29i+AJLtwNGpDaxug4H9g=;
        b=UEpF6LudAC4r9DjxgRwZ1ZTLVM/2BPavQ4H0qh+hTti59JSfU8q3N5wuuEYyQjqF8a
         LRlVLjTON/qUNL97x0l5PAM416F8kAPLzMyChTiSNltFFoKdJUqQX3SWHvJ4mc9zDBs1
         wme+llUrWCVcyLiUcsya5G+PI/DJA1jLu28ZMZ95DdrLyOwqkEk5+UL2YCN1/jjxkDzk
         q+FrHeIH9GHGwSg2AKDwM+22ndrjqCRdChwkyC9SHK7NhHHV5GGMxB1BHOQiBTcVZxjv
         BZlyJAi9XeXy5JXkB4pXn0LnRHLiKB+yRd2ju5hsRHyuFcAw9Uh6kGPCm69uJ7ekdS7Q
         xUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786410063; x=1787014863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7AgUwPpZ6ylBFvFSPApEkM29i+AJLtwNGpDaxug4H9g=;
        b=nYMMLl7+CHN7XXZE/Ab3E42asGvICgTYg/WeeO0MDx8Q2XFOmC9qbyO4td3CHNU3ts
         rDmUYASJIcfIDAzT08vC3Oc3+gUxWIm419DhJA6FRMTHNuAArqOXj+VKnKif+DVg0ARt
         UbDlTNuDghSKJ9zST9HvJ7Qfv4YYPlLb3nRXv3VWW5g7hFHG0gU/tlPuN6ec2CAOyx8B
         UtseR/PwzEz9CZUzOjSkBbUy5V6e3tgU5zm7wgipDrHUB/5hgzJT/evL9SYIqq3K9XF8
         vkWkM2O4vJRqKwqiV4IG4fUqoNZqdHxix400jg5sIoTqu76lK7xu5vroYW7p5As06i97
         H3sg==
X-Forwarded-Encrypted: i=1; AHgh+RryK7zUuBLohmtHDZtaIU+SL4xU7ZxFeD/fkbpV8DdAcAenck15RI189YYVTH+PhJavujns3INscBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiQdxnprhqtuwKUnPg1EnG2sEgsCrGnVtpJnf8BI1s7ngd5FoZ
	M59j8FTdVLLFNojpb3ISzktjjWklUEi1HQaucQR2irzft7nJSPnHbNqmTMorPoMG2Pmd2bC/fk7
	22WH92nk0n6rRZSctYHmS8Jd9t4nn/KT9PDMI6By2stiLL7f3mlhq1mGeBwOQ1Oc=
X-Gm-Gg: AR+sD11YTu1eJy+m1ukU+6IM9yB5zlIaNrSOjbkGCyScVcg0NzV4tkDpsR2PUWnh4Vl
	GVNCnvrBQ0AX3QPft+/NUGVcHdbUwwvSvik5p507THNin+CcJNGCjCUZzcCobs1zC5UExiFmZto
	7rIR8Lh/WqbIAXVGuiM893GJN4yyWz+1owcXgGPgZWvEMDJOhIN72C0htvZCtwP56X/TxvZ1dPB
	+grovTr0rTLgdDKpGGokINvJ/7Vwu8KgDrqYOtoZRlab8r41yKc8A72yKsZ6UwL1dVHZrJSayeL
	qY9+vBjRXUbfL95LibVGIes3peyYTIWXj4m1IDktMTlXNATByA4lvg0K+bN/kE2V3R/qDbGqrX4
	pQQpFsRoaxxdBsRGnVGNi70YOiryFE3oYq53/B1piZYlkXJWRHk1g5Tks1CjXGjZkdlj1MYEF9o
	1maq3O4LVpC6pgVQ==
X-Received: by 2002:a05:622a:593:b0:51c:21d1:3852 with SMTP id d75a77b69052e-52ce5f63740mr489636081cf.5.1786410063324;
        Mon, 10 Aug 2026 18:01:03 -0700 (PDT)
X-Received: by 2002:a05:622a:593:b0:51c:21d1:3852 with SMTP id d75a77b69052e-52ce5f63740mr489634881cf.5.1786410062529;
        Mon, 10 Aug 2026 18:01:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd6a796sm24711921fa.36.2026.08.10.18.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 18:01:00 -0700 (PDT)
Date: Tue, 11 Aug 2026 04:00:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 07/15] interconnect: qcom: Add Kuno interconnect provider
 driver
Message-ID: <xmj3xhnvdixooy3l6wro5f7eeehlrlrq44y2mwojzzeb3yjdjf@e3eo2772qctz>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-7-5e0ede4a0c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-kuno-soc-support-v1-7-5e0ede4a0c72@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Nb3WEWD4 c=1 sm=1 tr=0 ts=6a7a7450 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=pe0felBmJweB1gBNqhwA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: D9iHoSDyVPMYR71Be4VAoA7VeQhuleRd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAwNSBTYWx0ZWRfXwrYlHAM1C5mC
 fiA5RSXMuVUYMpI35yY/Fkk+q8/cAgY2qfrcnVKUTTuMi4Es+O8aS5OMutQRM85GLe80UVdtqy1
 JFhmX+W7whEK2PvBGLpwU986dtCJoM8=
X-Proofpoint-GUID: D9iHoSDyVPMYR71Be4VAoA7VeQhuleRd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAwNSBTYWx0ZWRfX2G+gwGIClGHA
 L5KndW0EUCT3ISv+NIFS9cfYXNYTUAxyvFYyL2dGmblBsHlI3/DzNOzFgf1k3tIvUaytzxcWLpj
 xH1zhdLxKW5spviCPjImYIE9drhu4kmlPsidrn6sd2jxq0CHnwQHhV6knwnCAVYaFT1KfNuXLQr
 LhMnGPg/L7Mz+SD7bGF0YEm8wIrZ1c38tmvLyvc6tmq5Jmy1D6zhFZ1rloisIYuJ6P/MlaxJ30E
 L03Qt6bvPM6BfPLmqul5jNEqK/+gGN0wfNLMXTagYQ1GhEhqQNfbuWNfP0PS+7xJfLeyTx6JPw3
 +UttL9AGFE5dGBkkMEu7cKzMUyqABVqGu2P70LNBZqqeVDS5Gk/IGBBxDtc6RUWfry5KJpzOCYX
 JnizcwEjJnRKrsfQFFWHPMFawvB3use89p0ywFNEAKZo0zyhryJdjqycdJhK4Px23CFFsUfk7EH
 u+wOQ71+VBsMANK8sJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110005

On Sun, Aug 09, 2026 at 12:57:06PM +0530, Hardeep Sharma wrote:
> Add the interconnect provider driver for the Qualcomm Kuno SoC to
> enable bus bandwidth voting on the platform. This includes the
> aggre-noc and cnoc-main NoC instances with their associated BCM
> nodes.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |  13 +
>  drivers/interconnect/qcom/Makefile |   2 +
>  drivers/interconnect/qcom/kuno.c   | 978 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 993 insertions(+)

Please add QoS settings.


-- 
With best wishes
Dmitry
