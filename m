Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5978B3B6342
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 16:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418224; cv=none; b=Fy+lTTKCL4754dSLYMyMIMkDMF9124QO9GeQKZuCfeSlEgqoh9UPtbFMexIQwoSxLVgARlz1yB5n+kpkOh0UJliNyCZJJX+PWsjgXyuWHuK9qXHBHnvtz+tKsOR4zKF1eZ+ttZyp+kGtbRPyB5HC/sf/IybDNpDk13PUtBmKSpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418224; c=relaxed/simple;
	bh=OQa25WQLrFipN8xkaSAC4gE9e+qUwSPzMMMzf7EKKCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRd+/HTZR5F5A31TqCWCCTDZA/hx5fmkZgLwuaMg2qf5j5B6a7waeJTUfLJKsXS9nJLQBnHc09PqJjc/HMhTUA7ehkcRYfD8GaH7mvR/ydfrGE1UwQegqi7237hvtiiWjG4VNVsItRwRJmaYDPtuhgFyhiaGSv8rc3s7U3hMHcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+7OT9Nc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PMOv7rdk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+7OT9Nc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PMOv7rdk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DEbdbc2262702
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 16:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lm56OVWQc1lPPtQs9j/ASkAL
	ta+ZK00UwWi5EH1vPMA=; b=C+7OT9NcWNSj2JZ8Bu7Wj4DG+JlhzfoLfT2JrM+Q
	W25Kh5UcMEte33lba4QJMTsboAyVm8NCBrHHytE50KpNwzkV3q/XG1UKYfcUK8nK
	3TmJUxqebrjNE+2ubHcywhnOTLZAMd2hhzACcd1PNh1JGwgMPl0mdSYHbOcROn3d
	CUx7tC2Kbm064tvz3nHlV9CyDyqv/RYx8mpQxD60DOgHTBk8Ao32nLa6h6tOX3CT
	0MrKr8yfdZg/ltx7Jp1/aMEBUPfsugZKWTU/xjxbEMM67TAcpnHr19b2ph13DMPs
	mdePu/cwkPa8W7SeQugE7I8zl+WpImWyhlwe5/GZRB7Ikw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4srj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 16:10:22 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffaa85b95bso18129410137.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 09:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773418221; x=1774023021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lm56OVWQc1lPPtQs9j/ASkALta+ZK00UwWi5EH1vPMA=;
        b=PMOv7rdk0HYwStY58uXdVInl+rZcob3vtyLXSLq3A4ucJiCqoMlAxYi+YlVpV6xLZG
         QyUe01EHPQb0jtsFgCPjgv8A+aFVv43UTThKGLpWgygTpJ96KMlb92jjFKAwldsq4eeM
         hQF4oEbnyGgdPpXvtSS/rH/MiOEbdqt+vgN88aI9YKNLOv1Dr1Sg18IlLLWfanneS2Ec
         zjAyRw/IdfbwPD8lvaT0F+hXqhN3L+toEuRlsDjNGEqcJfiMsDaMctxTy1xtvOyRsUAh
         4eL4Y13Z6x894sU6LGGuhUfcl3Rx5mYxi1o4SfyEFHZaFW4u/URmW08o401ECk22VvJO
         zY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773418221; x=1774023021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lm56OVWQc1lPPtQs9j/ASkALta+ZK00UwWi5EH1vPMA=;
        b=pnHMcs8iub1PAFkL6UM74BLdjxcI/XLCmJ1Pp0jsbiIQG2VmGJ+UuYRXLsltYM+cqW
         o0Mv2qRgmi+Re8eaNdFXjgrH7I7/mo3UZtd8QeVb6Nr6vVSvDFn4rPHqN+vdFsdrP3w8
         1X/JnJd8SUBErj9vu0ecUCVA2TpO+h18Q0yP17+hybP1nH+7S3XrtfwJSqZL7J4R5kPf
         BBXwNVmwl1U+y/lZSFs/sBfmBE1lnJ0csPPOnP3n7ZymtHyVwN/clYFJ23jg+Hhq5fg1
         1/GB3Aj47eHBIS74BuCYwpVB11W43r3l6AdxYFO4nLhP5ZhOD7r0U60qNUDHvXUxO8uy
         pKVg==
X-Forwarded-Encrypted: i=1; AJvYcCWO6KgAbwNMDpJMngmawaZCFdsSFVVtZ0Jw74Yt53kH6d6WvVlDRKxPaumTymU5vnhOwW6UH/Y2e8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXYpRSk5x908EK8xzI7ls/B5ndCm9GbaJqZH+eW+JQsxI8GVe7
	OuLw76ReREnE0fx3pd8eRfnUc6fSxzKnLWkFJJGU6FJzhabsYQH651mnzkmkamcJx+rz8wDICcw
	KMc489PwAZ9n14S/Uab1vG3ruDJJXtKj73U4i7fmxPzJQWzzKjIHQv6nxxRl1STg=
X-Gm-Gg: ATEYQzwdYWbwo0qzUqLDU6H+cl2Mq27Ee1ixxfq/cLL8DY2RkxwCcGg/Vf4bH1WFLch
	l8gd6XUyhCFErYLbNfDAhmcOS5/6JvRnd7K9f5PI30foJcevM4Yj3GwDPqMkHNdrEnuSMiGNKI+
	9AaNzmvRvOQAnZu1GZeS6b4G3YUKH79GCTuN7fbU6/eeWZ/+zh7lGl09eOCmTfAcQJszOmTW8WH
	6KpSgXPLwhqzvV09byLK753jchWnBc5p5GMYX2O2YmPZYuPceUKHKib5kqdxffkU4JAY6aQmkUS
	yL0K+mnO7Bwflq0YAAmHXon2gR5x1TXZpG1gDwbCpvBfzIOZ4qbpnB/q9rmJJaN0klkJo9KCslu
	JCfzQit/npq2SU3KRlRZgwFjpq+p+2AxiWu2tgZorwG46Ghza69DZXt32q96UCc/JIipzfwMHma
	ONUawm0Q+muZ1n2zlviqVMD8uZX51qPJOb7rQ=
X-Received: by 2002:a05:6102:a4f:b0:5ff:a606:3cfc with SMTP id ada2fe7eead31-6020e8b0a9amr1866172137.21.1773418221420;
        Fri, 13 Mar 2026 09:10:21 -0700 (PDT)
X-Received: by 2002:a05:6102:a4f:b0:5ff:a606:3cfc with SMTP id ada2fe7eead31-6020e8b0a9amr1866152137.21.1773418220974;
        Fri, 13 Mar 2026 09:10:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5f0e0sm16976981fa.28.2026.03.13.09.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:10:19 -0700 (PDT)
Date: Fri, 13 Mar 2026 18:10:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/11] clk: qcom: camcc-sc8180x: Remove wait_val for
 Titan GDSC
Message-ID: <2ncpk6egdhfq7nkgtrluzxv5iryupv5lbh3jgcmn3zuvd5om7a@h3os5hj6uwfa>
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-10-val@packett.cool>
 <ac0fc154-b41c-4273-ac5f-408428c360ad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac0fc154-b41c-4273-ac5f-408428c360ad@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ogFikOXWfMkkv7XXbqLq3Af_003xKtZQ
X-Proofpoint-GUID: ogFikOXWfMkkv7XXbqLq3Af_003xKtZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyOSBTYWx0ZWRfXxZDgZCAUoMV0
 sVW0PYYhjrVxlqyORDVLo7vEyDTC13FGtBuaTfkWQg8hLV5N3r5hU7sElIe7B0YXf29OQSzO8W7
 urgCPfjr+DPoo8PAwl3R9Zr+9fvH5vaQf4sxQmq6Z6MqSRtKnrUv80l77F9z7IgAVG4AttF20PG
 CHhNegokUeEpHtkp37N0KSlbbROYOpv+K4n585YWf5VbPZDBJr/pMVMVF9K1EWltfDJXIChj0+X
 tb9mkH4SHPgUPkpWUOSHD1tOtFf4ewXcZNxPWuOnmZ/dEoF2NHGBhxTGCSNa8Arn0uFU4Q5eVLk
 bGqb7K3B3iQOQGJwwzKeqOwFaUGQoC/n2IdbcPEbQfUbhV8XaLWdHDNv1pioK6aSeMtzhU3KTZd
 +s00RlZ6E11qLMqiBySOc3RP5KwKVAn+PpJw6xrL6Kj0J3PJdi0zFcMl7eOik+SM6lDNzNm/hv5
 8tzydzHZUx0oVINgGPw==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b436ee cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=jiBLetKTOZokdF3zhskA:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130129

On Fri, Mar 13, 2026 at 11:50:03AM +0100, Konrad Dybcio wrote:
> On 3/12/26 12:12 PM, Val Packett wrote:
> > These values seem to have been copied from newer SoCs, but e.g. SC7180
> > and SDM845 do not use them. They seem to play a role in causing the
> > "titan_top_gdsc stuck at off" errors on boot on the Surface Pro X.
> > 
> > Remove to fix.
> > 
> > Fixes: 691f3413baa4 ("clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver")
> > Signed-off-by: Val Packett <val@packett.cool>
> > ---
> >  drivers/clk/qcom/camcc-sc8180x.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
> > index 388fedf1dc81..cd4c40a81c28 100644
> > --- a/drivers/clk/qcom/camcc-sc8180x.c
> > +++ b/drivers/clk/qcom/camcc-sc8180x.c
> > @@ -2538,9 +2538,6 @@ static struct clk_branch cam_cc_mclk7_clk = {
> >  
> >  static struct gdsc titan_top_gdsc = {
> >  	.gdscr = 0xc1bc,
> > -	.en_rest_wait_val = 0x2,
> > -	.en_few_wait_val = 0x2,
> > -	.clk_dis_wait_val = 0xf,
> 
> Those are the 'correct' / on-reset values which if absent, are going to
> be overriden by the driver, with values destined for MSM8974, so please
> drop this one

Probably we should fix the drivers to stop showing in MSM8974 values...

-- 
With best wishes
Dmitry
