Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577D0221F03
	for <linux-clk@vger.kernel.org>; Fri,  3 Oct 2025 19:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759520312; cv=none; b=i15zog8njtzLv43gADVlXUCInHxlTrFxIJWqCg/bNnfQDESTK2fXSqOM8eLblM4CBqNP0taXkn4bWBv3kk7VE5X5esyP9GabbwoOjwcqpBKRsReqVmG7Q/tNVAnzY+TAFoV0CjO0Kpu2rZbOFHR0h+6VMIyD28VsYitFTMAW3VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759520312; c=relaxed/simple;
	bh=6PA7/gZ6w/NaM0vZU25LxZi7CVbMutYUKbETi4CKwyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJGWzULmdGkTR24GNTIDA7n32xGvOn0ilEAuNzpnzrl4+/BDFCKgbxW/CHeqpC03ua6MgFXxcqskLixSWnj+fJGeOx+xuz6YpqIsZzT9YOAhGNQfp1bxfzlJewPGozXKotQGKeG+pnOGyrxGaurRn1QXY9L7PNSkNZeFx8WgmGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T54qu9PL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T54qu9PL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593B6QpU024045
	for <linux-clk@vger.kernel.org>; Fri, 3 Oct 2025 19:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c/QeD1msDHzyxrlgBhbUPpRV
	r2cqluEXpYx+ZEgqG8E=; b=T54qu9PLdBEo+X3HJs2aoWSGZ7TqW0eB7ilFmhJ5
	XapBW6n0KZJ8cZ6i3VCZk2jJ6NTU91p2S+iW1L5N5Kb8RjNKJrXuLAeOFNLZ2XNl
	0t8KZ7BTlzbqKP0BYOMQwDF7vrAlP/TzHv3/KpoZLkG4/dwHdbuqUOLkMZThXfIc
	d9cA8sXENJV+34ea7aFpkkaPopjjcDIYa9jHrGtXvy53K4LzejRt6PH56iscWHwh
	Z8WlBkJkqSgRMvSjBTeSJSKejxijJNu/6TwR8rUER7LME58YG4nyX8aRuW8MFtRX
	0UxwKgltXZdjImcSxJR24TnY5MLkevMdyXJWJdVC5NB13A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59nc5we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Oct 2025 19:38:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e1015c48c8so70075141cf.1
        for <linux-clk@vger.kernel.org>; Fri, 03 Oct 2025 12:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759520309; x=1760125109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/QeD1msDHzyxrlgBhbUPpRVr2cqluEXpYx+ZEgqG8E=;
        b=Lmm6fxcLWQb/17hTJnPsukmlBhL8+rmAEpdiwQSp2c4gd8zLtLnullBfUeNhiLafom
         HphuJi2P1TiZOhHAYuiq516MvphS3tAEif0DUnm8XqgNg+oppSOdEI3K5A+RY4jfcUpb
         BVnyPpFe7XTuxvWj/E+o5LPESg9y4bR2/lh4hHsnJDetAKakV+vpP06cVqagfKHDquKP
         9GTpVpZBXGMMCtKjdljb5OI549hQjxC8FOL/1eB8gDIq9taPBFIDDSnEF6r7lfZLoLBs
         0XeLrsmZDFeNCTwaS8svma9ao8fFILyraQpQMkTnOu41h14wD7D+CG5yLW0ntT5Du7Md
         7ubA==
X-Forwarded-Encrypted: i=1; AJvYcCXnMSj4hnxNCTGI/teCyw+neeunwuTqDymvc+l/pU0a+pwSlo2FnfDLfRCxWm6wPzsOqZRWKrdR2/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0K2gfivoiPujzRXT4kR3IFIYdt6/4hbXHs1K6N0R6AHsBiled
	o8wwtWJuofSgYl8AM15rdm94Kgyu3zARnYBPuLjtfpZGLaemiW5h+6euzJEzdCSuRYGGvO2Pdtp
	yOcrpUh4+fvI4yMlY8JTYcGc+GCLKvDTNwlHrwLvA3bHcVDUTvMR4QjJ1hOPtDRw=
X-Gm-Gg: ASbGncvPRrKSkVjE6SHQF1uKQVV78JpldzfcW2TeKf7DG3yTDFRwjJF+bXTnAb1bSNH
	5WdWdyJzZXBGoNB4btS0jATMOLKzDPxm8ioZRCNHZMQukoNpRp2/WdEninbXUElMY29JLSlYG3d
	fQzAr0Wm4ZkLwA/m97cSZMKshHNTZ8g3F4F7KmulBsv1j7vcG7WRhEieEQOOKpGnmVXe7bMYDoe
	y5V0/JdIpBNjvCQlsYqjsTq1dwvjOaormJlZqTej2hIuyHpZwjsoNvMd9cbbJqSQJAQ7vTxrKvE
	zRdi+qEo9bWTvDkhgm9upciiQpbilreilb+KY8MHoFPWIJYcA84V4dxM3xR/xtgrlC/AvnI2qNL
	L3Rcl81h5gtrMI35Lb7XXMSK13zfs8SAug6V8FUvWT7vtfY2unN8hoIWkwQ==
X-Received: by 2002:ac8:574c:0:b0:4d6:c73f:de88 with SMTP id d75a77b69052e-4e5766fa419mr66222231cf.3.1759520290992;
        Fri, 03 Oct 2025 12:38:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa6kGS9lVlPG9s/2DewNwN4ny2UeX5qnAiNzIzbVl4p+vL4Y447NPSIDi2TcL94+kOw3WYpg==
X-Received: by 2002:ac8:574c:0:b0:4d6:c73f:de88 with SMTP id d75a77b69052e-4e5766fa419mr66220391cf.3.1759520288686;
        Fri, 03 Oct 2025 12:38:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011a7e65sm2090376e87.112.2025.10.03.12.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 12:38:06 -0700 (PDT)
Date: Fri, 3 Oct 2025 22:38:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: x1e80100: Extend the gcc input
 clock list
Message-ID: <xad3x7qn6qxrnfqrhcyqkileh7efwizklmwlj4firdqpkz67em@2bcx44acnpre>
References: <20251003-topic-hamoa_gcc_usb4-v2-0-61d27a14ee65@oss.qualcomm.com>
 <20251003-topic-hamoa_gcc_usb4-v2-3-61d27a14ee65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003-topic-hamoa_gcc_usb4-v2-3-61d27a14ee65@oss.qualcomm.com>
X-Proofpoint-GUID: 1pk5Ge_AF5fo6IVZ6egZL0jtPtHMBEio
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68e02636 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=AeM-GoSWWiRe9qQbtTAA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 1pk5Ge_AF5fo6IVZ6egZL0jtPtHMBEio
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX33YpKRH4ak+V
 3pwSYkm0Y1nU/TpLfmbru7zkJV4qAhv+SfKxtSnNCQ+dtK61WzqCWtiMOh8+sGCrf407XRmy7EB
 WRpz5GsulUkbt8n28Dq48pLfpy2sDhCzz0Ay/fn67QFQizpEWfB1ILLD3hdcOzNFBFyfnTauglP
 lL17RcNyeyY66M6dYKxeBV4gzJ2pjNQ+3Nr1VzOIh/ksvaLL0QCRRaWYE8qJgqfoUCs0RCAy3n4
 4WLmHgylyGImatqt6d92bXiKEZ5DvJH8K8tzih9kYLXr165s7R0UkgZNhR8PGlaxbHz8iunzcUZ
 /2DM8OL/Y2ADVU0Mi1+OErzrawxnWqFtZxvx7im28VlDQChrCIxtSEK/IgzYOKX0rpn1OPdPpvi
 vPkIVxBB8ZlVeE27dvvpcI5vYFdn9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On Fri, Oct 03, 2025 at 08:14:40PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> With the recent dt-bindings update, the missing USB4 clocks have been
> added.
> 
> Extend the existing list to make sure the DT contains the expected
> amount of 'clocks' entries.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
