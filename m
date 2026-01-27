Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E131362139
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 16:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533141; cv=none; b=hdVRBFbIBW9XppiJTq1+KmxECKXR2mPYjQR5+1bvroIxfoVFfgjeUMwnVTQWiBZvQGYpGhGt307V7ez6FtbDfSc1/Q9oLq7GpADqnKMeDkm2KmtIrpnm0S90zm/a30Hgtf0oWaWUP05+jEQBbWmvaxA8gowOXHWs+YBEAveBafc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533141; c=relaxed/simple;
	bh=IGSWwVQk6hK0IjIwxOuBNPQF3TTIg15Mr3FZVcFFot4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IV1BuZIG0sj5ziMLJfEjgFFHsJ1peDssb+n480Orvo5xZdP2ecXVrvFoWe5C6heUtMtd5marWL5jFPmlhxOYk2VWpFq/S2zZK56/MXDvaY5ptB7NxwxntIQltG+c1j3w+N3AY2Hx1kuUs4sPT60YhT0Cg1avnFjfYX0UsI6DNGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AlhWqse7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ogr6Wtjn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlhWqse7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ogr6Wtjn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60REZdHd1065833
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 16:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k4EOXRWuy4WzdOY2En7DGdc7
	2r/k0PMvyPe7LbbgRbY=; b=AlhWqse7MlJnMFB3sV53eUcF3JNW3WbQODlcygng
	Y9rlEBH8feOSUT0nk8lYu1QvdOxb3OTh85Hk1jmfpXEgcYeTitFL+u/+y86sh1Ke
	q1fq/BuKmkIBsE2R9qvXbuQZ2aSDhPyuwT473L1fK5SRSxLRzbWAHnqxqlGSRhSK
	6gjfNC/9bcy/1ZL1eIUB0OHl4JoMvqbYxIJo1YDwdX+DSK8oLJcPlGQ6Xjd/DHcc
	0vB7VYlPlR2OrG3PdPVeqY0O36ayIaO4wFMfuFGG+pGhvTyOEXX+s/zQ7bh8/u7Y
	7BvCRkvI1Ubq1lCyq4R9qjEleaWbwKITw/JFc/9+OTPPCQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxy8x0j23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 16:58:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70de6bd18so106429085a.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 08:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769533139; x=1770137939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k4EOXRWuy4WzdOY2En7DGdc72r/k0PMvyPe7LbbgRbY=;
        b=Ogr6WtjnptQuX+LcBQ8wrqnM+ucmPo+LRj9GVr6QXbicEYcW1TA8XgDhjvx6Z0bYD1
         onCPW26WSCE3U1N+Kd3LAXOdaEUvja6jnh0MgbYZZADqY/P/zsA1cG9C1C0fE4J88B1J
         jgjwZELZMlDRKZzeYVgPTBCP2Qg4x1KVM+snNVHYG5OzQw7jqxCoyunmwmxfkRnKaplc
         QjLUk8X4/XPkEtEMZ7CdV9QuzjVGFZbZDcmnS634wENt1/FrxKmde4kBNiPAmiOiziX2
         1hcEKdP75+srVJwDBGy5JUu3UOr/kjMA1685bMFmV+xkVTxyVFmLU+R1ifaX205WCIim
         da9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769533139; x=1770137939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4EOXRWuy4WzdOY2En7DGdc72r/k0PMvyPe7LbbgRbY=;
        b=WvsH0+JDZs1MgpKDMdimc3rCRB0HeW92Ycr5dAkDhnGg/P0Kpq5wNpoDf3TWQGDsWj
         ZRHVk58GsPbeckRZd2plaZmBt5TxMWZvVvTxPNM5LdfnMCpwCCXGygeS9cEZMlAP0dn5
         sYZJ/X8WMDeoJkBp4Vnj7oQ3TAuVNdW8SmRDFWiRVe1qIFvbj+DG78FB6pbu8GCkHIwD
         JU/lqaopXn9+8YRTtj6FWdEwShZBNhAUEIXrkci81OVtWT4+lvUh15KmTui0/rcPgnN0
         WQTbwyRHlqUKn1AzfLWVbgBQI2f8Ulww3vObaQn1G//zLwf1M7OfaTO7XxK6kbZfFzJv
         rYAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhhjCpHlAJhzgnaVe+DsUMgwMNX1grwFEI8Ib0ybdr7zBw4ElDcXpuxI3XCBv3ndewDiLoyABaqeg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy96TM8p7MDoMkDeab+SJgovt6Izp6QPCxeKFhqW0JGOxla8m+h
	9l7IODZb03mZfJNhOJOtW2NdFJjLK4jmfMsXvkMr9oUXJhc2WEH2Cb7LjGrOm+wdT7pj9puCBFb
	lRAfU55Nq3hVihKCCz0ZQAgoWN8d0E5dp8V54a38Fe76hDpiXkblFUEdoGAaqO4g=
X-Gm-Gg: AZuq6aLPlGAd1ai6Kq2DuyiDbsyjWJ/Him5DKLZA62VVmKU3fzNgZ3NohGRAjA6yfE6
	LTEuN8JEHCLQFC5YwSaCgibAbMBfsqMcvU3tOexH7Et4EkykcBynKxbUpUa6br4hvIcWZNDX11y
	fvweyW2vA/ZZDgQi+5nLH+MHSU9OPJtNWB1mYxSypbkxGN17nRpQ4mea1tQ/8NQVuTIz1WUgcX0
	xTmsT0JD0DJIHvyl2XDpi94NR0VXDPx9Vu+1W82v8QeBeyVu5wkwQy11M1RjAGwJoykcqKMn4If
	SiR9442v9hi6p43JjGtkbzZIdO49SVyJk97Lb62Aja0A136336omvKAOoPFMq0jGyt/DjWc9hBC
	3WXHqO4poXItzga1iOmCyqe+9a2IT90UaKDkBvkSI3HE60NjJpE/sR74UjI8hVn1Zv8GEPjGKYc
	0CvVO/ReytDTO+XM2jhJUSkLM=
X-Received: by 2002:a05:620a:4015:b0:8b2:f82f:c630 with SMTP id af79cd13be357-8c70b864814mr301765285a.31.1769533138551;
        Tue, 27 Jan 2026 08:58:58 -0800 (PST)
X-Received: by 2002:a05:620a:4015:b0:8b2:f82f:c630 with SMTP id af79cd13be357-8c70b864814mr301761485a.31.1769533138029;
        Tue, 27 Jan 2026 08:58:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c73b92sm381441fa.16.2026.01.27.08.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:58:57 -0800 (PST)
Date: Tue, 27 Jan 2026 18:58:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] clk: qcom: Add TCSR clock driver for Eliza
Message-ID: <7cfriesyupcm6kmb32ynb6m4zsrkbowfpnpkkhhhxw7dmy56go@cetfuzk6wvlp>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-6-ccee9438b5c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-eliza-clocks-v2-6-ccee9438b5c8@oss.qualcomm.com>
X-Proofpoint-GUID: 0OB1YbbyEwEI0t-s5dM0mQBY8yimxOb_
X-Authority-Analysis: v=2.4 cv=OcWVzxTY c=1 sm=1 tr=0 ts=6978eed3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=z393bjM37XPXZEtfGisA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 0OB1YbbyEwEI0t-s5dM0mQBY8yimxOb_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzNyBTYWx0ZWRfX1AQaiqDgExQM
 r8/4MJqzrlVhNxCcBG+bVju9GpmNFwUSxHjCfDm3M7giWYwj7WVtFA3XX1fbZkp0AXck2HIhk+P
 uBPQ3jdqj+Ukr+mAhAEiXdr4llvnavZraP8oYUF/ejaQja3Oonphk/xa4dcqzvCxLLdLT7ioh8q
 nMQRzPisyfAlnnD/BeYW4PyCiYGtOp5FXZhm30MAm+R/8h4xgc10pSgECs1BcyLkZNI/oHXiLMn
 3h+rNNtzlFWlrBUH+w42ciMRbcxs9FL0y1ezpKlR94l4UA/dSkk4DFxzyLkiFwFymoOFq0lWTwP
 FzaOIO2qIjDSfhFxt4YoWWeGGpHzxbKtbg9voYBeoryWEvbXc+29XdGRO4ClKnvse82LeJsiHrm
 dUsKUlaacrYsEG99LA9q3cZyBoAJytlo2VodLuIg/tIcOboapNIRk2h67njiBmDOco6kBSlGNNf
 KiG7Hprs96bFVoYUA4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270137

On Tue, Jan 27, 2026 at 05:03:24PM +0200, Abel Vesa wrote:
> Add the TCSR clock controller that provides the refclks on Eliza
> platform for PCIe, USB and UFS subsystems.
> 
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |   8 +++
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/tcsrcc-eliza.c | 144 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 153 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
