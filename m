Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17343330B14
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 06:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786689034; cv=none; b=oh4bLvwyPvMjThDOCSAS2ngDt+qWfgEUJduZwb3zfMGmNdX+vuxd25VNR7nf3Sb5Zm5E+QWaSMqIhVu8K0SKtfaNZenfyopvKI22k61gkduLaxZS5UL8GwvoEzNE9oVzd6UvF0HfWyjbf4djT60xSorFYzR1TgNkmaRBkV9JPKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786689034; c=relaxed/simple;
	bh=q7PhFH8Rq5jJowh/Sa3XK1Hmi2WAur9OGhakn5DqGKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HIPx3SOu9N8ZrXArRFTJ8MO6UyeFe6ErsjnIYB3HDsFJFukLXEWBsbOB1Z1sC9UftwOGn2wK435AdPhHRAb8OhR/HUyARAa7Ho1rpqVfwDlEIqf2MWBgYo6gz7JiKgrjFgsUx3Z+HURWo7FVLOhO5fww3tfN8CcFB6WfFWS9Qwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2IXJ6mq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/+Yg5Lq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2IXJ6mq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/+Yg5Lq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4Qd2M282980
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 06:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o++6nmC3/io8BnIwnM600v56hJPZXc5Qr+AJU/4Mg7A=; b=H2IXJ6mqw/gV3bXy
	B9txnts3Hy1VEg/mDC0o5fCYpr6TqmWn1y5jGVEBDyZvZi1+WzhRUsxWKWmqlrJz
	nLt7dHR2QmIG3zSVfbheTyj+iOlvGBbXfQRjjZypILl6lGzVbkll/AQXDpBwOFaC
	2j93lXsREL6Hbzcd2PXJbfPQHQzLhBBJOiTMmWsZByyUce+x7diI2w1yYX7+jNJM
	oiv0KLx2CPygXD8xBKAsTnBLuERkDAZWmNUYaADQaj1IqzHeThMRHeQNLN6oyUo+
	wwtQsvQ0JbZmCKW16c+hXPNs6fxkwUCv42w0wy7qz/+MRZk5IgATrdGuZR9I5eSE
	S4eM/Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h90txke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 06:30:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e024d2129so910861b3a.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 23:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786689031; x=1787293831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o++6nmC3/io8BnIwnM600v56hJPZXc5Qr+AJU/4Mg7A=;
        b=J/+Yg5LqjuDMyt+5wjMGS3UMsgp79Z5XfYfMukWA44cCyAvYGhdqMl44XUCKpnaOjg
         B6qve5lcZFF5Qec3u99PdLkKaele4fHqDdOo+oeXYvZ99JV2zPbltYDrH9hsxQOZhCk6
         S+ix2PiIRftyZZzarzeVuFymyt0bX3+xke5sMgzvjh/dLZa8izc4Ons7IUP0eTq3sW2q
         elBFChDyfyvZpTBH/ybuY05OWgbVff5c8BjsEzrIcBsAF5Qaw65Nd8BSJmvOlevaXNcP
         S/9T4Elpjk/m91XcZqGTs43VArE7KMfS5bJ8uTh0+KKZEaOqqT0OnOsHGdD4ES8ndaNL
         Wnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786689031; x=1787293831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o++6nmC3/io8BnIwnM600v56hJPZXc5Qr+AJU/4Mg7A=;
        b=WjzfcOvYZ3ZcHedrk11CdVCkOc/Rh/kO+mVOPFWSK6XkoYmMtk4g0t/MGCwwzwrdSu
         nS6dssPsyBtW1uYNkUSA4o98c8rzBqn7oZTqf+WGdy1yoVQJ5pkSF5FiQ946xiIN8GUK
         XucqaNeLpPWI7E5xAxcHI9SnDCyx4+Yl2ki9gdd5pTSG/fSbNP4gDe5oLIRcGnbyWRq3
         AwIGIuvuL1nOa4wqWP1vva4lMUrNljo2O9Bb10gu62CZ1sjPNZjRMVav7uA1lngLNoqF
         W0WAxskKGo8EKI1RatkhkfDAwIOE1dBtuFhzt2fld4iabszs+sJ6QnVs2m9ALKAuluF5
         W3rw==
X-Forwarded-Encrypted: i=1; AHgh+RqyX9iQsrKSuv9Mrr750uZKvZrQSAmmImYY9VLOkLpEg05MNDAMrCMgxUaRoj6CaNRSb1xYB6g4Ix4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzp/AyszdWzMiMvHLjnOYCmZZzkwNDPMTtsfhf16wDQY+xiBhE
	09qttZd5ukarmNKR+SgRDeKvVYtGn4u/K9f2+iIABP2HbkISopBHuEuoFvpPtEqSnI81kyWzu3j
	hGC9JuLTTRifLlZfMLLK7SRqpLdq3GoRy8Lpax4ABSv6JmSprLsaWVt3IlLKPxwg=
X-Gm-Gg: AR+sD12p/pmYzqhAdS7agLjgBzQMIL9ro/L8QprvkT5Tnq5ARQftONfpF75I9fgi3zS
	hJBYtZM0VPo081ZPzYVSPUlrNyBv8ozxzFSXon9qebGBoKjUN0F8/VoS1art8ZD/LRfxCaX52c2
	so7irADcknfluQmGNbRv6Ws8RzQ7SbTx91Myylj4n7ynTIiv98QEMTzB59n4oB8s/mVNI0oqCWC
	Ozmq6Ga66GnMQayp4lG1xKNOY8w4QZcSJ1xKFOc++6apxMELpBLzbA/LudaYZIs4pmu/+DzCACw
	40iaxc2Y/pKqVShqHH+mSEeABGsN3u1k/VV46ZiPJqQbuQJzGPEnkkjUEaNc5ztXoSUiHVcqPN6
	FlD7nJ/W8PI8qbG04VBAHNCu3Y550X1twGOrk9dyyXSONXUnMrBI4UV3o4+AU59i9A9b+37vl0a
	uV6rq0KuzioJ2hqVME
X-Received: by 2002:a05:6a00:4fd0:b0:845:4d71:8d15 with SMTP id d2e1a72fcca58-84fde31c68dmr3924631b3a.37.1786689030717;
        Thu, 13 Aug 2026 23:30:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fd0:b0:845:4d71:8d15 with SMTP id d2e1a72fcca58-84fde31c68dmr3924558b3a.37.1786689030180;
        Thu, 13 Aug 2026 23:30:30 -0700 (PDT)
Received: from [10.50.35.113] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d01f351sm51644b3a.19.2026.08.13.23.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 23:30:29 -0700 (PDT)
Message-ID: <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 12:00:17 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ovh/DS/t c=1 sm=1 tr=0 ts=6a7eb607 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=yzD-3L7JzAtJWEG1nKsA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA0OSBTYWx0ZWRfX+91H9J4PRR7+
 Us0P2ComKGsuRPDRaCxwrtFql61SmwnuLJLpnFTx0/9TxsHEwG0XUr0+k+tYP/psoGhoWg5bD+7
 a/QLYXS8znMwG/G9MU7wvThljGiXbOY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA0OSBTYWx0ZWRfX35f6Hx7ja632
 kgzXZZZj5TqXYGLHa9Q4WvLv3XBhpa3gi9cDQoHgY4CkoK9p+/3Hv6nz5gpeUPbinMX3Xau5EZ0
 cOZVxJ3zm/R53FlJ2/AT4VLOwDMtXRBRRr32uf515VGPUytWtjFpMdD5uzL/uTxwq33URIdmYAF
 GijV21qTjhgOT5EXhEVL585NJ2i1Enr+e9ytappILNAgEww5jhz81FPQA86fMhFVKHEFt1V98MQ
 L8Cg7hAo2kM8aDn5NVplhh3NPjtNjq8Na9DoCgaBv0SzNed3RO09Ncj0ejKVOXlTnZCL3KnBSCV
 95RADq4nVstiW/oOzzqCwxoxHvrTniCIo7K3ynpE/eAzwZN2lED/FC4q3SIhIY+0S97LNwlg/uf
 PvK/Ocad1YUNe/fgAEQPwjaz5jfTymZoKa4DqPqB90B33ky+KtDYn4Ni6vjxGH3fKmf45BF9SHD
 Jx+3mz7fZBpzzAPJq8A==
X-Proofpoint-ORIG-GUID: iI0x-cKv6Y5TXeEmKkPFDoDeyKvNWA4R
X-Proofpoint-GUID: iI0x-cKv6Y5TXeEmKkPFDoDeyKvNWA4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140049

On 7/15/2026 6:59 PM, Abel Vesa wrote:
> The suggestion of having the CX power domain tied up to the GCC
> controller started here:
> 
> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
> 
> and then, for Glymur, it has been brought up here as well:
> 
> https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
>
> These plus a discussion off-list led to this patchset being done.
>

This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
Reproducible on latest tag next-20260813 as well

> Sorry for such a late respin. This got lost somehow in the need-to-respin queue.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v3:
> - Rebased on next-20260713.
> - Did not pick Konrad's R-b tag intentionally because the commit has
>   been reworded.
> - Link to v2: https://patch.msgid.link/20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com
> 
> Changes in v2:
> - Dropped the required-opps property from both the schema and DT node.
> - Link to v1: https://patch.msgid.link/20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com
> 
> ---
> Abel Vesa (3):
>       dt-bindings: clock: qcom: glymur-gcc: Add missing CX power domain
>       clk: qcom: gcc-glymur: Enable runtime PM
>       arm64: dts: qcom: glymur: Add CX power domain to GCC
> 
>  Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml | 8 ++++++++
>  arch/arm64/boot/dts/qcom/glymur.dtsi                         | 1 +
>  drivers/clk/qcom/gcc-glymur.c                                | 1 +
>  3 files changed, 10 insertions(+)
> ---
> base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
> change-id: 20260309-glymur-fix-gcc-cx-scaling-a0b350cd5741
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>
> 

