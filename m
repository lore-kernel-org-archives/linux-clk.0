Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B23A21CC5A
	for <linux-clk@vger.kernel.org>; Fri,  3 Oct 2025 19:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759520265; cv=none; b=lmF4oWlJLI+HFHMUJUvwEDqub+/iVATHV3x7dSFktcWxUtlgxmwiM+R2asd4iD7LyrMBBKC+/oRGfllowI6dSGJMBZP9iy6+XNxmXFosh4XKRNlPwMFrVH/AVaSrzA4MEFFtWy9lrkakBMPRD6eClEqCSJXe3UGOgb4vYklOyDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759520265; c=relaxed/simple;
	bh=L6p/x9voTECqLfOdeh8AIPH6YGnYNQuYZvz+8csEnOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtlB1BQYTU0ssMH18aLBEIxEy7jMON0H7gUaEScoB2diPTL3o1IbuALiSajSrPgGBRx2KmR5gISQNPc5xvcr8OLRX0OTUv4H6CGS3UFARFU0No97ntZVAUMFqNjS8QzNMkjQYwqC+03RUllVNHukIcelVbHjd/p1bo4Or6AonPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bq6WpBaF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bq6WpBaF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593BrpKD009300
	for <linux-clk@vger.kernel.org>; Fri, 3 Oct 2025 19:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OFUrlQLsepMyX0Jz/227i1kP
	IOkJPXkGhpbqceCOZDM=; b=bq6WpBaFk+06wBJwEH0qnWtIXDM7XynAj2EhI00p
	0F0yQKrOjKuG2uD9IJDjX3fBHiA/AaKQV+r8JNIpbKckfk8TYGxHkbyXxHFD1TQQ
	w+hr0slZQ0fTTFBO+3SkLT43KmmQKQFz2paiI0SRuA6ap1+BGolkskmA4+IjF/3M
	R6pzz/sdzb4rcHEmX3yjh6TK2T3RH4kNuVQLCp4qzO9qa6HbKYatKVTiieMWl2HA
	X0vwvwlKecuiNMH7e2u1y+3lScRfaLlQ/4Bm0+/OihQTqQ/J3L9Elig2wr1mH7Fw
	6q310s/SQgoSlUVmROT43PxGwKt/UW2Cejt1kDRi00ksbQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93huf1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Oct 2025 19:37:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4de801c1446so60690281cf.3
        for <linux-clk@vger.kernel.org>; Fri, 03 Oct 2025 12:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759520262; x=1760125062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFUrlQLsepMyX0Jz/227i1kPIOkJPXkGhpbqceCOZDM=;
        b=BwSGzKs+QEf3PNpYEVkO/H5bQL2OJ0c+rI/x7qO0p0uTf4ve19kdF0RpvGpISjKTrE
         7r1UJtHNbqgznxEKVj9quedlBk90S76RiwdY/TtsYZ6yBHTccKzW4DmPAdGtAjO7DmWg
         G++5CxT/eZYLu0CULGCvI1FF4QrFgCELBXMsEFGH7X8tWX1G1nPfJvEhAD6gBJ8ikpto
         M3FAUBO5lVk+ct9xTvbMtaWvYrRDLHCHx1xE0ZzuWgyLKIZPSJrNyN0H0BcxvXwxzMrm
         g0V1ixEq1TJBwpA9WeH894NHaF5ylbpseyeAtI0uCGMY3hjEgO8XlRp2D5eu6KLlu/4m
         dyJA==
X-Forwarded-Encrypted: i=1; AJvYcCXmLqX1tlQmF0c8nOWrwrsoeY4Gt2HHLYPu97edBBcKwxQXwCYWHriHOoJcXpyP5XeS6YLVAFBzBGo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkq7xYKQOJonP3Pf3ShsLaEZzdNCpK2v+iZkEvyoqVqBe6Djj7
	DVLGuCOWHPXBH4awtWX6X18vHrK0XEqIoDkHzkHn+1+5kp8lslYlX0JE+x4DPbNYnPP5xSHosZt
	b+/1UgEmn+0x76nlr74sr2CaDgP8cvlXhqp7W9J0hJmz1tgSs+GIQuGG84D08DGc=
X-Gm-Gg: ASbGncuLuOznk3HN/56HQRw4I6612+Jyk7qVhUdtq8OUwWfflkLA7I+hY4tv6lr/3aF
	aZDSKOv0Gigw7I5G15SVfvdb9arN/Tb0BVf98FrXGejKCICC5Fs2g7DxWjqvzzTaCUK0oA7BCI0
	j1cP6N/ZS4bqHh/KZSI2dVJtveRFsNt4XLe5ExSzl7NaeLDRwNmBeWOODiqZAyUjrL3DlHIhRq7
	yH075dg2tACGsFDfnA7Z7b1Z7gqgtk6YFdiHna9lfLQioZqUdNL1C8efzQIwNGRacVXjOqV/o4g
	rHuDn/WfBdNwy5qh/RR8L8GyPByIx5J8/VWXkudviWxfRMBrQBsuOyCwbbG3oY3J9SSHAutDuNm
	Nnit1IvfSl1dI74cFbi8EWAOKNZ4/x6eVMvskAMcIdUmlZUS7E6ciFlbmbg==
X-Received: by 2002:ac8:5fc4:0:b0:4da:207:f0f8 with SMTP id d75a77b69052e-4e576a418f6mr52319051cf.11.1759520261973;
        Fri, 03 Oct 2025 12:37:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJeAynDi2ixAidT7oxs33QpSn6Idl2n/OrcQ46tde8eNgyX5FczSTYJrNB/bEEPlCldm/kew==
X-Received: by 2002:ac8:5fc4:0:b0:4da:207:f0f8 with SMTP id d75a77b69052e-4e576a418f6mr52318751cf.11.1759520261512;
        Fri, 03 Oct 2025 12:37:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01135a82sm2103189e87.39.2025.10.03.12.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 12:37:38 -0700 (PDT)
Date: Fri, 3 Oct 2025 22:37:36 +0300
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
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-x1e80100: Add missing USB4
 clocks/resets
Message-ID: <rdmpmfvspa6kjmwedpouy2nndl6okdrb7q2eenvcvpnnk67wp5@56fxgwfc5t5w>
References: <20251003-topic-hamoa_gcc_usb4-v2-0-61d27a14ee65@oss.qualcomm.com>
 <20251003-topic-hamoa_gcc_usb4-v2-2-61d27a14ee65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003-topic-hamoa_gcc_usb4-v2-2-61d27a14ee65@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfXzrOBrq42xi/p
 4se8C5+klD0PRggzAmfYibv/ffxXe1RauOh2NQTC9qGKl0JHoEVBMJLAcGarANdhnfVcYwic0m5
 wcj8KiZh9awtQmq7BGudk0sb3ywQtmTIjsMc76bVDymBu2vAi6llokWcM9xcYF9AXkCEsrGqAh0
 XfUJJR7uJdi9I9BC/x8BPG2UqHuLAoKe/gIjRTaxpI9DqRpHYC68yuRMQJ3bs4Sm9G/U6C7t/Pz
 Cj55L2FaQHnV9JQhrJozWowST/wZzu4Ereolb8GZdvcle6Xoue1Xp6G9ZpvhsowSLT3hJQ23Qts
 P+3TOVGhd4GPl9/pe0XRiWR5jqw+UVBFeC12e3Rsq+4yBuagsylEMVtuoyN1ovw8hdcFGdEVKJT
 91eUIVJePXqbOdqX0KGS1nLLBa1oQA==
X-Proofpoint-GUID: U0FJ-gMzw3lxzMtGYV5i1C-jfhwpcmyk
X-Proofpoint-ORIG-GUID: U0FJ-gMzw3lxzMtGYV5i1C-jfhwpcmyk
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68e02607 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vYJjhQUXXu9twL9fmf8A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

On Fri, Oct 03, 2025 at 08:14:39PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Currently, some of the USB4 clocks/resets are described, but not all
> of the back-end muxes are present. Configuring them properly is
> necessary for proper operation of the hardware.
> 
> Add all the resets & muxes and wire up any unaccounted USB4 clock paths.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-x1e80100.c | 698 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 681 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
