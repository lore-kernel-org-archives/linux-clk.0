Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCBA21FF28
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 17:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758302673; cv=none; b=SFCOlq21DWdNGr0G1NcNXlDQLk/9RhYuislTbF2utOCay0cDBjcG8leZRYTsMH+X7Jn6xG4s5cpy7FeObRcdjda5rL/p8SMYtIIl+QhH6SNDjyGO1fk0Ywa9DYg60OxspKRnZwpPj3O7jNesGPD+PQkN6uWGqZqR5bLPDCFEVfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758302673; c=relaxed/simple;
	bh=jz6EK/5R/cZ51gSyiWj0rppUrk/++V0bISlTdb7FPBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWMlRR6I7kdbxK2jQ/9EbiahYInYHEE1+U4YDhcxSewc+ndOPzUH3YYIDpsfttDWP29EsQJUnQpodtzic5W67cSU6wUSKXJMSCwLGPBHg99xb+1qaCJfRTylcILoVI4G2A7Y+gpjUx6Pkn1g7xffht5jkkqyi3QsOZmqmXFdAdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Akjzzx2E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Akjzzx2E"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JDWGeJ030553
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 17:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2SmCmfA+ffYL/cc7ScaFG2SQ
	47LI5h70ggIXvRCOHEw=; b=Akjzzx2EPN6moRmflxOtitL+pQPgsWDdtWBjIDzb
	SI9gvZn4SDbKuRbRCI/W8Namjisn8Gj47i+y1yqNnNW0fWGAeWiU584myZTd5prs
	sBFkfPgTJ5061jNFFGvJTdogvEPSvgarLFocP9gB5AgIoGdMbaeu8bZr31+UCY4L
	WTp7+VdRKzvaRfr9DHQS+PAe7MyrPo1TzIWT0qVgC6JYFJ+Q1CRgNonqOWyGk2Qs
	+gxPs/0sFDZGU2olQdb1AT/yv0CqMqMB5NgveyKypKLRs13HlFsQsHeF0zUPgdJP
	7+THt5oGeOj0QyVna4exc21dD9bEF2V1AW0CPntGWCmHdw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49916x23jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 17:24:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b548745115so49709071cf.0
        for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 10:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758302669; x=1758907469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SmCmfA+ffYL/cc7ScaFG2SQ47LI5h70ggIXvRCOHEw=;
        b=tkBi/W3Fu7ekhe53Rg4FLnlkuA4Hd//KqxiCtJTlzs+oPKy3nIvmTlLW8fBD3ORGW0
         FIDghHNiKp2wLe3OuirvGWQuPq0zLhYe7S2XVGZbSfOAbco45puRfofhfoz/87vHmvim
         +09YhZgKYtrIyjhFAcUweIY/Ctx5/S6kpyYdC7qzlZos1jElUSanrftypZgNGndZHPTM
         Ha9pJJPXW6BBm9OIV0Cbv//qxjqms/iuBPnjntga35rTarH0KkKehy6N6oilF7yRMngb
         yrNcBePykQW6KWzjldTSgaYXEeYcvxYjKG3K+626uXqnS6QguNgl93d9DgfRk2L059pB
         +BOA==
X-Forwarded-Encrypted: i=1; AJvYcCVMjhVyRMBNAcchI/spkLmM+PjZTqsczf1zBkOg2nxr7hBw58lVpfovhOXlTKjBBKVRrcoYlSvIMVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuvqFN/dmna2H5TVeLNTv3Jwfk/KxFa5OoS9wBHhC+vq9889sL
	ZcoGB8OJlqLxgNgUOh3qF0PuL32uoswAVcY2FY3PQxVcJyWFih/CZcgHQIHoScmFhLpUl9k7L3o
	khbOo7O5nRpDgU9g9NDW2rIiOH4/LtvwVSeGMfYu4VeC1m+TayG6PuE44IlIWw+o=
X-Gm-Gg: ASbGncuYYnE8w+lMToARtGMhg75Dj50D6WU9hC1TvOjBc+kaUbau8HI+dG1sqoN0qDu
	bmhF7pZRjm+KEeXL7DdV+V7thR8gNLBVcUknRxU3kDbD+Brmy6mGcIgSl0eANp7mo4DcYuHQxfW
	LYaVFXfHnowNiapcVUnGPU9omE26a+EDUsH8i+vIY6SmHWKOPmUBCW2EXUyEI+VK5xpjVFv46iP
	NU7ulI3yB8+y+k1bu5V1WxfLvaOawaOakNUBeGEXfZxZIL1uqBo9VGXKCfLuVGQf9CHrHG0Lk2q
	5//qPSlwehtbmfII/SUnm1D2kPFvLz/2WHhznvAko03KAlIdEuws1XZUQd7QOg3Md7b7jaULqZL
	RNsBqYU7WQ/QZLFwSRGiBeIhLFf18k35mA6ehzGhtN3Znlps7pPAU
X-Received: by 2002:a05:622a:110f:b0:4b4:906b:d05d with SMTP id d75a77b69052e-4bdae5ac1b5mr88562171cf.29.1758302669453;
        Fri, 19 Sep 2025 10:24:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEowL0VkIS55e+wrnpXk8ejFGWmiVu1K7CSpGZAvwocAzm3e82EVFvLe2rVUzxckJSDcYN9iQ==
X-Received: by 2002:a05:622a:110f:b0:4b4:906b:d05d with SMTP id d75a77b69052e-4bdae5ac1b5mr88561851cf.29.1758302668930;
        Fri, 19 Sep 2025 10:24:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a8fada4fsm1524487e87.89.2025.09.19.10.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 10:24:28 -0700 (PDT)
Date: Fri, 19 Sep 2025 20:24:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC
 resets
Message-ID: <cujc27qvhzblxsvkiyn2kpyl2btkeysr22amuhpfhjlsvwfuka@ukzba7jz4ftp>
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
 <20250919-sm6350-mdss-reset-v1-2-48dcac917c73@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-sm6350-mdss-reset-v1-2-48dcac917c73@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA0OCBTYWx0ZWRfXybURoaYSB/8I
 zHRbnvkEE07Nw6TrHTBqNMkvoYFCP3gkKTawPhrU1k8LISLuwhyxl/c3f92Dz5cWvnA0iohm7K9
 mQm+dnz+SWNRAk5iy7PBOBujzpAFxWURZUdY1IGh0QD1X+wokZKbbUduLhfI2p44kIYPeVjXPZ1
 0YrkRqkBbhGSZhcE++CjnjEh4VhClMRtkhAjg+tv3OTCTjrXs1boSYcIWy007Zms/orpynVTuFJ
 swuz0FzmjeKk9v51oy5LTmO7YiGkmqW3/UJr9AJe0PqHURBezpkt/v8ODrABZKWrzOzUlr2jsVQ
 0OUeBHLfi3XYwdiMGYugBJBC9AyVTjw1wD+djeuOJiA2jSO/fNISQL5zye87u+0XyC2y+scqXfJ
 CsktU7Em
X-Proofpoint-GUID: 99v4c1juConU8qta330qAo_wChOGWpP7
X-Authority-Analysis: v=2.4 cv=LcM86ifi c=1 sm=1 tr=0 ts=68cd91cf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=S60hzewbzrEDFSkdeIwA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 99v4c1juConU8qta330qAo_wChOGWpP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509190048

On Fri, Sep 19, 2025 at 11:57:24AM +0200, Luca Weiss wrote:
> Add the offsets for two resets inside the dispcc on SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/dispcc-sm6350.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
> index b0bd163a449ccd2b27751e32eb17a982facf07d8..5b1d8f86515f251d90e01a4f3cb3b5582b5db683 100644
> --- a/drivers/clk/qcom/dispcc-sm6350.c
> +++ b/drivers/clk/qcom/dispcc-sm6350.c
> @@ -679,6 +679,11 @@ static struct clk_branch disp_cc_xo_clk = {
>  	},
>  };
>  

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
