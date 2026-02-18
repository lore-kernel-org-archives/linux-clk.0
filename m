Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4119B3101A0
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 12:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771417191; cv=none; b=jf1lD1spw+lVQrdqhmB05yidndazxZp5rweSGffzguwlgkTezyZ8P+mqCcXmDgMChuStDK19w1D+ujMdSYW5xAX9HRxH/ipfDyMhzDbRVsuvoSpAYrqpxQlIiPGqrVDvWglSAa2RfWW6hJGeMuTGj59WAo5YzQgf2Gl1E1Hz7GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771417191; c=relaxed/simple;
	bh=rsZMi0nsGJlVJa/dYH729vbp6CbvoUdknRZK4S2Fdck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSEUNtvhgK8qdLaFz/rHwx6nRFvXEeUkDI+FZjZ39NSCqVQRB6A444BqOAaP4BaxSW+vM1IFenyQ5zb8/aI3RmnYYNJo25KHWCxwBtUi0R16O9UxVJFIrTP+fP7NecpfSE+CeJud4a+Q7xowbCY9qKmxUBhi6XIIDRg6szod1Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMoP5oE4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZJNVONi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMoP5oE4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZJNVONi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IACmjJ419955
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 12:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EldQfKGsERa9GHmaQSG79cYN
	ixp6CtFRzfqpNjVM0ns=; b=bMoP5oE4t6e3ANDdBHuDoSej+Bc1hGHKowgnwTs7
	UmoUe2DLsLfuRGYB4wQ09xTrwM3Ldx+TApxHW2iJwQW+507Hg+z6FOa/YZlW6fU0
	ZTQzKqYLm1UO6xo0c1DQUueUm1dededEreFWXOdFacVf5hbnr7kAyDFN68+QQ5xv
	K5S5egdjwKBcynz+GrIrrFXUhigSHR30TwMYsWdCePwb0vqqepjxwsDEDerOWN1B
	VY6v0OORUguiSCGUoHZc7Fen3pr/AEL7GaODrgzMGUGjYZReE6YLRnZZzwmULaYs
	gUjk7Qk88b/wZQi5RJ+cW4pHVRq93m6QHGVF+a+36OQheg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd0k5hw7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 12:19:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3ad1b81aso5394856885a.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 04:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771417187; x=1772021987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EldQfKGsERa9GHmaQSG79cYNixp6CtFRzfqpNjVM0ns=;
        b=VZJNVONiqh4Bwn/43g4RDS3U9Lqv3uKMh8G0xOMSn2eWN3kPUQtt6s91S9Q3wnsG/6
         zZNGLND4uk2zCNWZCohG/7pxITnfz/XTrKEZNbFTDnivUT5Eb5Zk3xmodQ00jBTKEPvi
         K3BhyPLJVAb6qjYK2Tp1devHoqMf4leFleJ98zyfGFh/MocVlxyYpCQamj9upvA7+yvY
         KBiYcCGWr0A3JUTlThFFeePkhpa9iGAeX831kZKTq9fFny9IW7a4dN3AgntdtRVBnxHY
         wqQKQaUvFl+axd5CA3FB9gCEJC4UORR2IJ7fzIdDT99GohLcDTrLEJG6Zp1q1EvPrJ9E
         PvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771417187; x=1772021987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EldQfKGsERa9GHmaQSG79cYNixp6CtFRzfqpNjVM0ns=;
        b=DVgFeT6FrXzdIG3gTd2n75KtBvUNBQq/+Pv6rP+L0K/+hgI/wzs1DpbKpHR7EYy2FH
         x4/gzxKIHuC7HI455EBoJ5MxmBGUAIUQwavXn2XmMj91z9adaxF6JpCeuT73QA6oKb5V
         FOh7YoJuQb97MhfBJBV8CrH7DLsR0xkorkt7l0QiInEJLb61OlOqUqGus7RR6MguBuJx
         SBLzDZJtMTu48wb+SDXhCSKArAQao92SXKQTxqJozJOfsXpv/BYOZJoRG/PyfM7mkib1
         OakeDteT7M9pJ11FkFQOtS7GWd5u79EjdJJOX4gE3J+ZRk5rJJuYQV8zAV3Vf38QFLkV
         1icg==
X-Forwarded-Encrypted: i=1; AJvYcCWfKk4sgoTqC5oY38xl0dhVmPWwipFYny9wuQcKvZRar1vYiEYMGhjD8qZMiJ64ojXvX2Z+2DmRkKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOgCpavTfQa31pAUg6YuXvBhus3gXJsXUoySDsfczeghHGwTAJ
	+flw02WQiccH3Jf/05VfKiWXkIcauWDmTOUuZSwdtPJUAxE52mI+hD8CHUQunzXu8iX8fv5MdGb
	ItwXhx8rfkkmIh6HCFkK1RU7JnYzauXXWeZwsDlpNcC6Dy2FfOclGw1lLuq5Hsv8=
X-Gm-Gg: AZuq6aIj3ct56rEuUDUuCsoYneYCJf9BAFX+tabNybYAEPgMv5wake2HY6Wn1uE+85h
	rOIKh/8zJg32y6BQLhuNKT6dOpGGErznA8vz11Mp076YnnhhdjG+kZaDxKM5hUAGm9VkWX0pWYA
	qZYnHtvjmyPUh6/wsB944LOdpcUzOLRFeyKFACOG1XSgcKbwkakcTmSi9x6AZ4fP6k4qTFya+WJ
	szi68VwJquNdYIdK2D6IsvOC8hnZkAHDBU37QpgXWiM2YILckMeIFPe+m/0Ogm4JnUVj67ElRJ9
	2syT2wi1OIKdUM+SdkbnLAz3F0WUrdIFRqCeHMlngDDr6XRsQfA+ixhm9VxFKcA5fVB++iZzFJa
	+zSD+jUQLxuKR/AGHGTN3rT7sGL6zXEhYmBbP3bvXuS3f0Hf8oco8YY7lswHp1UsaeBABjZcILy
	J/6d8TYBPJQszXHMLUMitkQxOKN1aX+Ex4WUs=
X-Received: by 2002:a05:620a:31a2:b0:8b2:7435:f5ef with SMTP id af79cd13be357-8cb4c014729mr1696398385a.41.1771417187473;
        Wed, 18 Feb 2026 04:19:47 -0800 (PST)
X-Received: by 2002:a05:620a:31a2:b0:8b2:7435:f5ef with SMTP id af79cd13be357-8cb4c014729mr1696393985a.41.1771417186837;
        Wed, 18 Feb 2026 04:19:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f56fe99sm4594024e87.36.2026.02.18.04.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 04:19:46 -0800 (PST)
Date: Wed, 18 Feb 2026 14:19:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
Message-ID: <zmutw7pdwzm6olugmdcmtmwhqtybx65hsk6heba2nsbpffd7op@5ngfvuhozute>
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
X-Authority-Analysis: v=2.4 cv=JqX8bc4C c=1 sm=1 tr=0 ts=6995ae64 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=SXzkmgPmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YFRkW6z6EKuh0dvUfuIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-GUID: iuVK0J2wMA4GFUC3Mtuimf8KHAbpwWq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEwOCBTYWx0ZWRfX6ncjioqrLJSe
 HGuqU9I9FIqa7SDsQo7jEh/hnh4i8dvqE5MlMIZJyRvT/6UOVqKsRCaC6xD+nn5WXk4FnQQLTfh
 SOcMygtYVwS9aTb6p15D4JGKfI1krprokwx10QyYcxymlMc+GqpaE0rNjf6R1IrjKeN9Y+lFbPt
 WgNI3zyswk8fiRKe3wAf+I/N/UimxQjfSZ4Ccfj7CuFa5ji42TIQ0cfWtfd9MSaQN1/yTgkPu4m
 5AJFYCH/u3c/scV8OIY6BAApYHhWVoD3RWQYmne0W5XfgnYWFOfoc441cz6CaxSh8FUUCQNaXN4
 ohQL03dUlzj6h+EnmKVbIoWwlWniJiTgPRsr5JDGDtcHOUG7+ZDxpzIWHrOPT6Rt3LeLIFAOUHd
 E3xPY0NLZOrFMxCAbWtLwKdJEBir14hc3Ko8JcPX3j/K0KHeI4/5ytJswSJuBDVcp/+vDJAB7Q4
 UR9ox6SrnBO/lgT5PcQ==
X-Proofpoint-ORIG-GUID: iuVK0J2wMA4GFUC3Mtuimf8KHAbpwWq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180108

On Wed, Feb 18, 2026 at 12:18:39PM +0100, David Heidelberg wrote:
> On 18/02/2026 11:30, Konrad Dybcio wrote:
> > On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
> > > From: David Heidelberg <david@ixit.cz>
> > > 
> > > If the OS does not support recovering the state left by the
> > > bootloader it needs a way to reset display hardware, so that it can
> > > start from a clean state. Add a reference to the relevant reset.
> > 
> > This is not the relevant reset
> > 
> > You want MDSS_CORE_BCR @ 0xaf0_2000
> 
> Thanks, I prepared the fixes [1].

UPD: touching that register resets the device. So, it seems, we will
have to live without the MDSS Core reset of SDM845.

> 
> I'll try to test it if it's not breaking anything for us and send as v2 of
> [2].
> 
> David
> 
> [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
> [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/
> 
> > 
> > Konrad
> > 
> > > 
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > 
> > 
> > >   arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > index bf2f9c04adba..75c192eddc57 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > @@ -4550,6 +4550,7 @@ mdss: display-subsystem@ae00000 {
> > >   			reg-names = "mdss";
> > >   			power-domains = <&dispcc MDSS_GDSC>;
> > > +			resets = <&dispcc DISP_CC_MDSS_RSCC_BCR>;
> > >   			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > >   				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > > 
> 
> -- 
> David Heidelberg
> 

-- 
With best wishes
Dmitry
