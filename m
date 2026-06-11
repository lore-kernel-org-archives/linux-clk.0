Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA25E293C4E
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170916; cv=none; b=urpGSEQCjaTt1glbpXE+LC+7rbncXuoE/RdN6yJtDAxjAmtc1yV9xgCF90Xhnx3Pqc4Zp2ag0UtXV7uKDoTAOhEt+Z3i/h+OGRGlPvYcPzHPdKTk919jlLHxw4cOQcZ9m0028D/97/Mz8UQ6doIsUay8MUogj39fXSoBkupDnBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170916; c=relaxed/simple;
	bh=gs29JVYoqBRbD7XbXz5ZIYaa4W+R/0h/qmCJb0z6MrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=el1WMPpJcSBTSqXfxu3+wqN43Kq15hw9R2gpXAqWKlINR8S7WVl76ZbL1PKqFKkD2WmE6zR3WxDcIVYGoRYycCPIQtag3eVaWqgKwBg8UTIYN9lP8rQvHKuCEg/TUTDbjjLnbag2cOrgJRe8QTjkUAXa0Z2UBqH4+dT7Wzssk7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U4FpdDJe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FDhs0goa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U4FpdDJe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FDhs0goa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GQEk3835135
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 09:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=; b=U4FpdDJeg3XnO1Dx
	xzaR39wjr0CqXtjyBP920A4U+UVB1/VDYoeS7ZahhrbjB1CFwcGVAMsICnUQzQmg
	HzvmONCs04DrPFVcfPN7uX40HrEzvuSxb9mjVaaUcA45g8VtYdCD+aSt1S3PQ08r
	1bjkvzlxu7B9XR9H+XqcGlVdP56lS+eL73z3+uAPf6qT8GtTFPniU5N48hifp52v
	Kz/9cH5G2zfFM8hmglyGZmNiK+WbL1A6LRMt4t5RYMF28HTi7Veh38uvazbY0dia
	6Csq9YL4G7mxNv1vLsegFYHw5HXZW4md6HKBeQEg+muVBwCwsGHH3CveOiBFPDkQ
	VI88EQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6tjse4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 09:41:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cce532f1fdso14211136d6.2
        for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 02:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781170914; x=1781775714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=;
        b=FDhs0goaWZ1nLSaBVofBNe6l2ngjt1DjRzUSPLXJ7FxwawugQe31LyEQaZRN1u+jUx
         sTxWJsoF/+axCyXbhUAPYhoY0OoLW2Ii4EaqKpAElUoFPyBQqZNjbVqkv4nar0e6sesP
         URUWId77VewobqcOTFENRlYXCF+3oIdStAgaXOWNWsnZHLCoaAbA6sg6hQ4oQKBJa2Kd
         IX527G8ShDF3WYr9IadYFJZMgkXSKRe3deXYM3IiqTpQZbM2ZmdHuf1MgjSTydYauHiU
         d8a/RUZBbB8/au0DBkPtrpDfCVXxZo6HbYkZ8GgS4yLQ1rUf2C0JW/L4bDcckzfIY/wn
         iRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170914; x=1781775714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=;
        b=rPnLxa7YKezQNyzGSsE6954MWi22OzDO4l3bYfKDZZcynx3E2jXDnhZTknAeFqmXsY
         U7BEm0DRDM43KFgw1tM+Qr2XtNruCdTASzE0hw3FlAi0YpUAeEBk2Gjua++V3M/T1vh5
         Opvo2x006+SAjuF4/wjykKMbVE4PqcXYd2e3a/+64yBSAnKyqo2rV++2f5WT/jDOSAE+
         nCNSsI05mzGXxlbZzuPF//uaoPRYB9ZvyZUx+qopTbL0cksNc1u8JbZu8gKyf+uYlba0
         LSj7I9XDnxT5bR3NiDMIaFPj4YxpaUu/MbsjauezRtSK8eY++Hw7Mj6Nwrq52oeQrUxC
         LEhA==
X-Gm-Message-State: AOJu0Yz66EmifELim/FyqWR1vKy7BnyhGCeBwsWpdRSPauXQOLVKp/Cc
	xShOnKijj/nYGW3b4OF+9+zTxHqcHdIFfCBu0QbJRkEFdLTQsd7KmIkBQ1hsACXVTrZFS3cVZTw
	Zpz0+bzSRArkWg6VbRfnq5OyO4FpviXs+rAeY+qd+f0GaRhJDBzCsiflGd+Ju6HM=
X-Gm-Gg: Acq92OE+NRo8XLX8S6fRlNZ+TnA4eolsM+0HS/QwC74EGAleRPgRRhF7/nlsCR6OsX5
	b1buRSDCyD/p2l4lH+RPOGw1EsDWO9AZccKbGZMCCshGLk0JUc6xLwj1X5UNnckbmy1EARSA6R+
	42KSkPzhSt4vI6FlfNZQWeapXGXB0GrlczRDR7bG7AEmHB3bV9E4rwjXggRK8FWAkQVeJxCphtw
	QyaSUvP5Monfc9Jmn6id0boeIb/aXIGGOB+7pwU0b9ddprsE59ADJtYtoWHEW+ULjH6e4NJS+OJ
	Fl8AXoSboe8iGFb9aOGTGnQ4BqvT/oFMdRnzpR/mk5J0BRR7yeu2XOihPSHPUmq1mML7+BMvuef
	1iy8rfhQkQCbeBJPfdapGGcSIffCOZ3YbOmwBjwnW4iQxMdIW2zbWo7kC
X-Received: by 2002:a05:620a:8006:b0:915:e7bf:e6fd with SMTP id af79cd13be357-9160ab0590fmr188817585a.2.1781170914265;
        Thu, 11 Jun 2026 02:41:54 -0700 (PDT)
X-Received: by 2002:a05:620a:8006:b0:915:e7bf:e6fd with SMTP id af79cd13be357-9160ab0590fmr188816685a.2.1781170913893;
        Thu, 11 Jun 2026 02:41:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb58cf947sm40282866b.43.2026.06.11.02.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:41:53 -0700 (PDT)
Message-ID: <5298e320-bb5e-4e32-9bd9-c538a6689549@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:41:51 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] clk: qcom: smd-rpm: use
 clk_determine_rate_noop()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
 <20260505-clk-determine-rate-noop-v3-7-f3f829fbacdf@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-7-f3f829fbacdf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfX6SKKpscoaOKl
 ze0ah9ySgxxKSsY26VBCM6w/PWZJPWWc5HPbW2tcc6zQmviWzRiO15hzLkMl7bcwppciP3bz6iE
 6kNvvdg/PXmPLIAu7ll+xT7z6blAb9O90KEoI3IkJlH6O/JGxNA57FSy9QW0OcKAJnrnIhra1eD
 85qUG7As77WnS+6cBh940hoL6K86WD4nfzX2XQqxd0EGeWnqUqOEFqSPe2Vjl+IvBDrc0cu8Dst
 cYf54LW1ff7OzIRq9wp83Li+B0YFP7xUmfzJPe2+jX5mCLN5hVieXwua3QQBSF/RjZatuj3HdF4
 CPFkGPa4KXXf14kD50vGRpDSUIec6EBukT1gHMOXp+Kwl+/x4JFUdpN9T8OAjx96ry6RpbM767h
 Zx+XONMOvzWr/Z758yytV8Ltm6EdL3zWw2eLc0duhLmXzho7pxoCQJMCWJVMd7w/IkIw0PW16UZ
 JBnGYWkzn78L9hqv23w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfXyXhPDHgH35q1
 Jskn6c3TPC5dWyVTuPx6La3umizS8h04qE8+pF3F12Rgf4cEYLV9JeoDaxhlCXGFQGdNcpIMbn9
 LyyRx/w/4Zi0QCnxunTo8E3UFk6Y6QI=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2a82e3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=yiv6Am5jRSTGblAyIcUA:9 a=QEXdDO2ut3YA:10
 a=tYq66TkwoL4A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: TIl1lBGcNbNNbCKDs1g6zhCvfltnJfy3
X-Proofpoint-GUID: TIl1lBGcNbNNbCKDs1g6zhCvfltnJfy3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110096

On 5/6/26 2:49 AM, Brian Masney wrote:
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
