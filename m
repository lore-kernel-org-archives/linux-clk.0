Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6C837F728
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 11:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052449; cv=none; b=QGHYkia5UGX5FU6bv1Ifm74g1mzMzYVrhEBg3tV09GWRBsbFKFDHzctmnpoKBfGEU7cDsyoPqhRIbBBjgaHulPT/T1+itoFO6Ii+fx4j9SQYcXD9J13ymvDEvZBNXxwulruTuzlqUJRYNLS9aadsyO3NqBIjlcCjd5ATBghnz/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052449; c=relaxed/simple;
	bh=1GYpsHv8UX5mbzbIEJoMPzYfbm0qNSMJKqm57K7UISU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4YU8E++KxbAqHvrer2vrSquxxAJFgaFZ1tgO0txHnwHUx8cg8kyxTMoxl0b/lgcSO+hvfWS/w/dYYdmqgjkpUXpLiyMCGQfez1v8Gn+rsMhgi5IFKky8/4s9Fhy2eMIOIiuKNnnmAHDzrHeFU/61e7ePk94WCQhsw2QFP6n2Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/IlP01Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEIcgB2x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/IlP01Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEIcgB2x"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABfKX820112
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 11:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MnGJcFsPiscDtlVa50dVE0Fk
	eIL36dVjzA8lZXEnLkE=; b=M/IlP01ZHzsIyEY6wZQ9AFxA0N2MhjHH7ZL/cV/h
	q190hfzvcipRNNrMOlD9rKgWxCVwxWpLGnTrIfD4By44EzeHSO7W8C6E3X9CvTha
	j3N5JDt9k6bdLWZFcwlj1CQ4MDmsiLjES4lgyY2zYOyXUNJoYflJk5zHomEclkXR
	tQSsRtkqWAi9yisiuHKhQNEh8loYekXZQIwVqqxQ4VOr8sRsHnXp3MqYIq08cL1V
	QXAE+QlyAc0sR8cRL1nDBwNvyuH1uGokG+9zdddRgC7RFndzxQLs2YF5WGFcRl+j
	sZeQSkR7hTPY92wN+Ibq8YI65o8sy/SQAxCfhCpxMuvKtg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p1r3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 11:27:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930b571432fso97015685a.0
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 04:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787052447; x=1787657247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MnGJcFsPiscDtlVa50dVE0FkeIL36dVjzA8lZXEnLkE=;
        b=cEIcgB2xIdy+770Mo+ESod8kQfbuBSVgPpDbwp2y6YY4UvVTcFVC9QDZ71VYP99HDn
         GTlyVhikAn4vVs1i0gaQx9S3c04fF9ZjGeiL7W44QHmXfNdSRNV7Zo+r0BTADasJ2zHK
         jtsL30vZU44dSRz3pxWn6yZDse3YGv+V+9FMC4viNNJtviEKFmHOtK+iMDjaRNhvd4Ks
         zbOLbGMc3oJ/9igf3w1NS81gQLLP2GY633jdQ2JfLAskzH3lffEoiUO8jufYQ3i3e7dQ
         ros/wswlBWq04Z8Dx2eDq4QdsoPspH4hFH8rVxVsdb4Z+JKi1Ow4d1hH2ENafw2hc9Th
         sAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787052447; x=1787657247;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MnGJcFsPiscDtlVa50dVE0FkeIL36dVjzA8lZXEnLkE=;
        b=Q0mZFWkAysIcyA2TPqeIkXWDotHIzKM1tUrJDpL9BhAqhwd3PRLB9c01mUpkK1uUFA
         +cq8S4lUHedg4Ao35K7Or97PLrofkQHHWGge7oV8CHyDAyUcWJ2fK7MJcrXlqvL5V6jU
         /bPxRgSaSWpSxCMsyu/YtqcSuc03wIiD+q9aeZFSBU8AvBJhAScMGJoALcLtR6JiMvyZ
         DRQvruQ4U+1M5Pr6EWH21MDYFg7y22VNTcMedu+weVOPI+sOxHD5DWzuk7gUNMDAImqQ
         y8ikkRN3RnfQwP1FuJE4w/pi2XBOy8T42f3FN2tNpneaS28iVl7zKNb/kdz+fuUOwl8+
         HP9A==
X-Forwarded-Encrypted: i=1; AHgh+RqA6w1hX1wobZrBxktAjsbYhST5NI3fZGxMiYWpP4egF2zOoHcb/9dSpsq8s8qZmGjNmsGb6YVDQYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLa0rub4MvKcoy8EbB51F8V5gjNEiufSbG1VG5mrurAoXEbVhW
	bUk+oZ8bwyFpPBxXImZcbrTtITrYS4dZfUvHmVNOLflSHN02tio+1kQxTbmPl5pDhcnJTx5lIF7
	8mMCDlLhK9ymd3QrWvgPNrj3kML1rSzSj/F3VxHK4YmE5GFsWYwKCNrQ/u6SrK00=
X-Gm-Gg: AR+sD136IFmLtF64gXaHSdVH7uOqi0bSDez2Fbyd8/8HCC8fJ4nKm9CxPLIzS5Pjf3u
	OjioqxvKwL1Pw8CLe1FpesT0uejzYsx3DsT14hSn4M2cyNwlCtJkGeQLfQngR3E4p5zoj/2hRfd
	OowX3YF+z6Y5Nz8pGur9LESw9l/AoGxTh2mJ4XVFVXnmDxUxR/nWAS832qgCoAu8WxIIxyIbiXO
	91hoyktu4lrqqcwJgIRv8JIDmuUdS1xcHROW8jv2Wf4wuO/Sb1VghTzx157bnA0dfMeFJNw7EL7
	kKnINUMZpCrFcqwt+nG34k2CpReQa/ZYgUTNCsJIpumkBh8rhDMqRFbfXarSSbS5dN1ctKng9pK
	yZ51KdnfboCHDnU+pr4PWGvLCuI9d4HfM0cyXILQ1Jb5HS/Xtch/HZXeU8PflLx4uTKLub6zCip
	CT0CtBalFLgx6m
X-Received: by 2002:a05:620a:a2cc:20b0:934:b798:c245 with SMTP id af79cd13be357-9370667ddaamr427162985a.16.1787052446872;
        Tue, 18 Aug 2026 04:27:26 -0700 (PDT)
X-Received: by 2002:a05:620a:a2cc:20b0:934:b798:c245 with SMTP id af79cd13be357-9370667ddaamr427158785a.16.1787052446452;
        Tue, 18 Aug 2026 04:27:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b0e1f18sm12120781fa.12.2026.08.18.04.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:27:25 -0700 (PDT)
Date: Tue, 18 Aug 2026 14:27:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        bmasney@redhat.com, lpieralisi@kernel.org, quic_tdas@quicinc.com,
        danila@mainlining.org, davidwronek@gmail.com, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.vger.kernel.org
Subject: Re: [PATCH 02/12] soc: qcom: socinfo: Add SM7250 SoC ID
Message-ID: <4kerzsphzdl3e3bciiss66uvwodtkh4xhuyfirpdxbh3b7pzmu@ta3mq75jecor>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-3-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818080754.4362-3-sreeshankar0910@gmail.com>
X-Proofpoint-GUID: xAX1ySPyMcYzg391zPdYYqSwSflkyKDt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NCBTYWx0ZWRfX15dZwERWLlDR
 8xu18HmztORnEr5awvOnLmfRweDqmMxBYPNhW++xFxwsyKY0lQnd/5FL97ET1b0koe4GWkhv+XU
 J0Gu6nzbGWNh09q3hE6gF8yyoM8axNo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NCBTYWx0ZWRfX67aEtGQUISod
 O7aRy71r/CU531PPBgV5iErLTAwMMsEaKM8sAO2jSoA/kDaCPorVDqo842RPbM99HI7iHR43VvO
 MWlBUSzJ4KX00hi1ZQd5rVojA058oKSPkIPN50pp8rsoPQ8VKKDGNY2Qs/T8+vBw7I+iPdZuV93
 8HYi5LnHFqlEkIVSNWiMM1Q9bnBU0VrULO3SbIpyJlqwASQ1wRiBJ0yi0Mdg+uK+ELvaDwP9I0X
 qy+7keL/Ncgfxq9Mhgh2Vv4qM3Xk5ZuBU15au9SuTJ+bRIGhddQGq3ZAarIHpzaUxwKYS6/Tnbh
 C1m3zF2j8sQK2y9YVwJon6wNHEWiHpQ5qKm/4c0s9icghSRxDVKO5BDeQ7O/56X48Ihzw3ZgM3N
 hVYgx06kOeeoWT+G87egTvm2SqoEFBOwDXsytaOOkwgE9GPELdHVDMQSO/nCcaqi3i3YZ5kLnrm
 geInRszNS0tnRTdXs/Q==
X-Proofpoint-ORIG-GUID: xAX1ySPyMcYzg391zPdYYqSwSflkyKDt
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a84419f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=sRjO5Q5YVjkkE11Nc-YA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180084

On Tue, Aug 18, 2026 at 08:07:44AM +0000, Sreeshankar K wrote:
> Add SoC ID for Qualcomm SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
