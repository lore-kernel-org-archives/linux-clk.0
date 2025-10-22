Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D1F347FEF
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761145772; cv=none; b=D2AQ+ebiBOG8K77Ou86R/z46AgYHr7qFenKf9XqcDWXFjsB5tJ9MiqfV8z0os4E8G5Ox3kVfr8IsEXcp5TeSACwUywqyOx5HrMSKYVbmcbvKhT9tPYmjW3PjmjtivZJUUO/hyyRM0tPJ3syI55CjiOuq3o5KtjfGpgle6HzJ4EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761145772; c=relaxed/simple;
	bh=WMIMwGu7v18FDKKJiIcw68EOolnjXiaG0jHWCuQ5J18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDgzQt2MGf3Bk6OZ5LHh3HYs9Kj8hCgl9xbAefOFy5uL+y2o7BeQJDib9CtQHgvQIuS2oiogXaBMgo5v0K8Pxf5s48gcEVC+NUdiWHhQFLIldn1YUOc3bd8SPEh5xuXOJKohH7UqGiFRVPIIYFsN+qrjtk3kmA2n4f7jW1QmK8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PucaDMBY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PucaDMBY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAMnZ0018748
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 15:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OdkI0P3aHIPeVo9m2/RE25vv
	O4vI7yj29ODppPkFbYw=; b=PucaDMBYv1WK0qPWpZF2Va/3Q8GuClfUVNvyCe53
	LpBRo8eaLnoTy5QP6Exyow+c2KjQR9xooGIIYxHbZqlubcJNQPv1fjjz5q4AAy1D
	Y519D9hwHpMZNafATAmPUBw4xHcAarkkZDy6rga/c4+U3Q07hiOM1YCuVCX19kFj
	/Onty8pKYGqa2/lOdSSTITDNEes4Gc/12DXwncaq+LXkOs7n74o4TyJWDv0I8Nde
	ekb6BcK88JJx6Congmc9y5HsA9F62IRoFHEK4YVYLBwSfKspLFIqtWkJfvIiJQlL
	X72I0OIDhq2phzCU6LajcodLH3qfqF+QOlX15sOIWa9HYg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469n2xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 15:09:30 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-930ffeb4ca0so13348268241.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 08:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761145769; x=1761750569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdkI0P3aHIPeVo9m2/RE25vvO4vI7yj29ODppPkFbYw=;
        b=Be7gxrHnZ2pHU2Aherc71oqIDPJc3jHNZSQEXbj+dyL5CUkoYdJOuSXrUBYfRbib0n
         HZTUicgbX58qA3+WlvLaRFfjk6F0HzNDYrY2y93yeJ0DzIYm1SPbI2hjl4LLnjpobt3S
         qspWWLtfQyMiTnAQ0EiYAtyTOHm4h7P7Bj8HBL9MWXrFqPmd6OSt1eNTR0GC1Tx0/aP1
         WUjE19WqyP7fha+44K88ttWnCl/IxWHTPxEoIdpeoGSPn86WPJwH8yS6O0wMNGqnJgPf
         tr+OO2ZrQTt1MRNtxBh1Bw3NB0Pn7kdxeSInA6PWlkcYi0eXZukNN9zPqXgj7/08Kluq
         WsiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs55wy9mXLZIrgjfAarD3E0VvDHgvsQz3MSSIwtM4ozY+9SjmZhLRJ/faTNBSBe7JEd1v8wpWyDPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNquQZbCF6+pjPIOeFh5D4gete4Nu37cUL58sRYdngVYsOw+WJ
	KGZsMjrNL6OZz1fDZ7IBk/90YknS/IVbg6L8YIGoHJgHETcfCQFPuQFZcQ4NNfMG7jD3eN0wNqS
	9ahdRsIZhQdtkej/0qe1Tb5ziVQXoJLPB/Brs/JtiPJWKGCaJ5YDSz1paIDnmBcc=
X-Gm-Gg: ASbGncvVqiZhZ/FziF2yjVWHS0u4qP1BxsX7OOgvYUPXnGb6nwttgI/p4D22n2Fbq9V
	KVx+wycmyS/OjsnAI5dAja0k1DgPLSbzXCZ0hjbjxFhPGAtYtBddVY8zr7c7CGH+EI/+ZTcJGTJ
	xa9mYxWv0Sdp/PsaNSocE8Aa8o2hXksHd8irF8y/LleiuXw66QM6HdJLWpZMA5kLLEmlD1IbHdo
	XcTOMmhG7WSZBzbbJ2EPe4a0r1u3M6lt3Nb8tnz4nG+GF+MITDxVekzCEB6/PtMgS5DDEcrPJTG
	LQoVw95uA7LXbs/3+inRxe+vWiC8ZKTGymwx31k/rhUjeTpy4jdh/1Zw3ecuuow60i5Z1eTmx7K
	iwjKJTqQ3bamE9Wi5Dra1COlnNr7+20BHU7nx8kIUO6FkHnQ1xxai2P86csRj45p9pQn/OzFloz
	A6I7FB5ADr/kg=
X-Received: by 2002:a05:6122:459a:b0:54a:a048:45ae with SMTP id 71dfb90a1353d-5564edeeb7dmr6086300e0c.1.1761145769031;
        Wed, 22 Oct 2025 08:09:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTW7Za3xYid8rhr6v4z3vSiXm/haXNAQidSfHTGA4CeMN+hQb2XyvJwGutTkYmU9r6673nbw==
X-Received: by 2002:a05:6122:459a:b0:54a:a048:45ae with SMTP id 71dfb90a1353d-5564edeeb7dmr6086265e0c.1.1761145768577;
        Wed, 22 Oct 2025 08:09:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def1ecb3sm4735512e87.95.2025.10.22.08.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 08:09:26 -0700 (PDT)
Date: Wed, 22 Oct 2025 18:09:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sm6350: Fix PLL config of PLL2
Message-ID: <qanawqrk6izypwmmuvezzff37k66ptv2vlbdwxs62dqx7igop4@wzkz76376jli>
References: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
 <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>
 <06aec134-4795-4111-801a-469afdd8977d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06aec134-4795-4111-801a-469afdd8977d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lSaVdbe59ml7SqNbZLTwTGfZzSynFX-F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfXzu1oN21i6WJD
 Vj8VKQ6kk3x1SlPBi8oRAZGl1H8+5GRXoebn2ZGq+JZ5NivSqSQLbK1cWz61zbPN21BQlJg5mNz
 Nz6uIMWUrxlk8nl8RLX6L5pZEjPMhCBLV6nXIsxjG4W0vNd459Me01WKJOJGpaGTbeJ4+yaR95x
 yTx6x+AOq7Y006kbHlMvIYvNBN7vsaip8T8XdMGMqGK1422/h43uadWcgJJqC0YLA2RcBLlIEA2
 AMHegRFIyJ6VWZlC7q5D/FOAb5oLiWEHYpfJQZ1qNtgf4BYmluiW/Oshn0UNcNBhro1J9JPle+d
 G998T49cBq6QsY8MPWx8qDbc8pUjmgJFk04b1sYn1upm2HgZAAm4PAmWPrDTEVUEpwq2tKTjsZe
 sZBeP5m0XUv02mdz2X1sKxVRlhEgyw==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f8f3aa cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VhJX9ptpD_-VFgrJVx0A:9
 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: lSaVdbe59ml7SqNbZLTwTGfZzSynFX-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

On Wed, Oct 22, 2025 at 01:19:16PM +0200, Konrad Dybcio wrote:
> On 10/21/25 8:08 PM, Luca Weiss wrote:
> > The 'Agera' PLLs (with clk_agera_pll_configure) do not take some of the
> > parameters that are provided in the vendor driver. Instead the upstream
> > configuration should provide the final user_ctl value that is written to
> > the USER_CTL register.
> 
> This is perhaps wishful thinking due to potential complexity, but maybe
> we could add some sanity checks to make sure that putting things in
> unused fields doesn't happen

Should we just drop those fields and always write the register value?

-- 
With best wishes
Dmitry
