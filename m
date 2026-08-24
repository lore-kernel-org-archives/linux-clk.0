Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C793F399358
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557266; cv=none; b=Wry7CQEsqKL9HJb98A3RugV/7wp9Nuii05/+IHtjgycRWJVgo8Xu0kF263c+084v1WlWlxI1lOKGJwMSRrhgK8qXlUxOVC9FrqRyKbO5u5KSJEISyh5/Q2Jhx/4uVFrfz5YgubM1dU2MrMidsz+1ITOPjj5Izch3HV17CLBAz/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557266; c=relaxed/simple;
	bh=7BYh+G7YBii9wdLvZ+tmlYcpEQFULmxAXTs13S8xs7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hB97w+OWgdRMGUuKlYSimFaMDaf+Rz2ZWWdzFlc7fyYCWO99GEy6WorPJ8POaRHVJBAmPdVUc8F51GaM4YwGce4hqIE9jhwFfLRoZzqpO5D4VZNhIk6IZMmi4v2/UP53Wrvt7jaKYjlFpHP41Isp/3JzTs3BerVSDtF77AraY5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qi8LoCT7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgbRxfiO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qi8LoCT7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgbRxfiO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O6SkqY1982629
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 07:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=27aV82B2iwHpqeN6UcRflHNO
	30IeqGoP2gG6U77lA7U=; b=Qi8LoCT7QC+bCW8Y2IWJiN22jB6q9JMo+jE/HwLZ
	1NYR05hrm6/W1X4knaq/TtgBHPHYQYo2wtHFucITlI8bi88cn1da77bNqvxtiNe7
	gShKs3D8nA1kf80Aq0jRgM6HE4CJw3PN19jyVdDGamiulJPYzN961GiuqI5vFUuQ
	QNmBLKaFOeTUsk2vd6aXG9Mm/Qw7/l42zmxIzeNfj26JkM21P/JXzbd34CVu/6oj
	y/4K+Puzwcpf5a1E+fGY/Q8FD3N39JuAK6Yr1KuC3aAm4cTBj83gZtB8zQLMg5Fg
	iy6v6TT12KeEB26h7ucCfb6whHwP8q9AbimerF7Wa2KCwA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn8b2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 07:41:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52827090cc5so40855531cf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 00:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787557263; x=1788162063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27aV82B2iwHpqeN6UcRflHNO30IeqGoP2gG6U77lA7U=;
        b=IgbRxfiOHztY0d4ZAqC4l20er3YPbJ1dXCPkzJpwSIHGLUNZyRjLwZ9D5IkB67mdjj
         Wj7ttgwzcoyKiZha5isPPq+ZOUK+LBSu0qlwRQvoUyigHuWBzy/27Gfvy+qQ3faABLTV
         QnAy7aDbCklyYZ7l9WitKbYxg41S4f6xUwfZgPFwZX0JIAPizFqOwB2b6aM2c4l4N9/0
         E/iNLiQtViCkWFlmJqGAmtVYK4y8RR/BaYyAqwNfxw35FvZHC9klLjRxIe0cpBelvfdf
         8azKrwCm7HwG9/mQckRRhzLjGc5FnN07K/1Muwy+/qa1EzziKigCCR4hmdHMLtEGwTqp
         ubEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557263; x=1788162063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27aV82B2iwHpqeN6UcRflHNO30IeqGoP2gG6U77lA7U=;
        b=qZ5tdIAmAsv6VlG8W3pb9DgHd+T4s8Sikr79RNVMvpfjDBX4Mnc3gspiVVvpcn45nN
         OriIh5vUM9Bz23fxcs9tqPgUHVi6yxBsEjk08uIl3RE32nf26f6Z3GK8sLvPcXNI/gse
         zEi1cAtOdC8kN0fSCK/Z8ac4tq1ffjO/svCoQ9UMUl/O2q4KQa/mjW/2bL9I/GDjeU+x
         BVQ4D0zi4TmfFHUSe9gbPYYNaGrly8wqfFvqpgXwnFPL0YPVceyeAwCWccYyW35y3L2W
         MyhmLLlDuFasNplgYTrvuuieNAu5NbVVUR7+dkrOlUT5kRsllmwkTZFpP5j3Jf2UpIpR
         EN3w==
X-Forwarded-Encrypted: i=1; AHgh+Rqa+Pv6IDxyqIYz4mv6QTDg0L7WoSPKXNh43Ncei8VAE2oE+Efnf9TtX0nrm397f1CrpVmfsOtPrpM=@vger.kernel.org
X-Gm-Message-State: AFuF++nEbM2q8dsmZ45zq4deVXNG+D+ahXbJdUdMxTmaFQzTLTZiWI5J
	gS1ByZbwcR/RFFMQ7iSp5xUtEDwK1XBHfaKy2mjktQAdEG9WecXNuMwPOO/bBO1/sJfhGcapv5A
	vt/Kmt3oMGSscTrN3Xg5nG98JDW7kW8etKoXgUL3ZMM90LmmTeyosbC0MY1r28dY=
X-Gm-Gg: AR+sD12W2vdfGRT0BlQiud1dk0YTwIMFtaKe6cpshdwDHSlTAz+R5gRvG9prutwxUoC
	+8Bn0WTszR/51eGIrCuZpeIs84VlA/uVRaI/kIW9XFem1cU8aL16BTDFhQKpJRhUWHetBhSTHOo
	FyK6MCOM5FL8Mh/HKlu7Hm6Q62Wwp0ch8KfojhKifVFWxtf75ybHD4M8Ozu4U3W7/8YG95vjD7C
	kv+3by7Lk5KyaQ7+TVQGPFmSkg5fNBqdhkUM4ZY0XVuen277iuddupkiVrGaSToTddG7kXT/FEN
	7cQhBgZXqbeDelteuWTf0H7EVDoUnmas2os11SNlSLj5zjn2AZE/SaKEvgiczFj/7uKiZbwtrXq
	xkbs+PWrk6rDnZfQ=
X-Received: by 2002:ac8:5a16:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-52de33af115mr214786281cf.19.1787557262870;
        Mon, 24 Aug 2026 00:41:02 -0700 (PDT)
X-Received: by 2002:ac8:5a16:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-52de33af115mr214786031cf.19.1787557262330;
        Mon, 24 Aug 2026 00:41:02 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24962bd8fasm1717117466b.28.2026.08.24.00.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:41:01 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:40:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
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
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 11/15] clk: qcom: Add Global Clock Controller driver
 for Kuno
Message-ID: <jvtygc6q3hts3vynb6jaivlmryrhzkifxiyiaxoghukkfbt7qi@ch4k4adkpdci>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-11-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-11-196e2b306368@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NiBTYWx0ZWRfXxQLANUx1j/Q7
 XxvTNZpSObvw0xBb5uuBwDIAPLEMudeRUk1Wp1bjkrapXB4tKmON8puylveXqspAZTZHLr1QCY6
 g3zw3gSx66CW/rwZooZQCY1wiwvNJUk=
X-Proofpoint-GUID: OkQ1vQDC959JG-p6P6uC-JHaDEQS59Le
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8bf58f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=TGsF1qQkE8-pbLwaU88A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NiBTYWx0ZWRfXz6ByfcEhD0SF
 0qRLkIb0rCjIXRgWpZFXFE1eUJyqE7eg+c4mWXyrJeJC5Gs3/Udtr9HF2a4LnSo4p1tQ3nLGwRH
 BioqQPulZ4mVR3wIIW/9WYZXDLFEqJse8Mn3YhqruJoh9+xh5yYrtfl/5zQfJNUGucuYTd/SAvD
 SdbHAUfEnkJrnmOxjHO3J0MSGZMMQx09s0tY2UIsvlJmNTdJssYRTMAneEHX6NHy2aD+Vo4SjE8
 AGeO3qx6gRvOGp0Jp5oKkA9o7mg4xl+6isOZnKYmPPYavkOoYgyOBKv0eCa8IvBGrydj9hqgQDf
 USTTjuwcBVJeQxN/F9vN87U2Jklg+o1iquQVavtavOqZ0RBJRmrIQz6jkpoo+eAOslXN1wlnjBW
 i0UeZocgmz5vpNC3FGKuRorVY25GFYW+Xg9pzkgunw/2mYrBjAQE4z9C5TxgKQJaa5FhnlXkkpA
 X1HK/rXvJP1zm1ErUqw==
X-Proofpoint-ORIG-GUID: OkQ1vQDC959JG-p6P6uC-JHaDEQS59Le
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240066

On 26-08-21 21:39:04, Hardeep Sharma wrote:
> Add the global clock controller (GCC) driver for the Qualcomm Kuno SoC,
> providing the PLLs, root clock generators, gate/branch clocks and resets
> used by the peripheral devices such as UART, SPI, I2C, USB, SD, PCIe and
> Ethernet.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
