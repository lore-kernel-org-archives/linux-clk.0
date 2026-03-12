Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CA63254A3
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 13:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773320624; cv=none; b=ZzI5519KduYp3gGpY07igceM3VQRe1iq6H7xJQdOiXNl4NGDxh3+khQr6EBE+82h/ghDJlgWSAzwyCSsYJkHhGZ/27eefvyywk9NsDyVp0rWVhsP6unkwi79FfC3nf+7zxL6OJDa5OaPd38StvZc8sq2AHaYJZck9Rw5GMitBrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773320624; c=relaxed/simple;
	bh=VyqX92BFgskPLHgQdLTd5IwboS33BuQxpusg3mRO0uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUjuQt3mt4HZcpEXMbRqB6vTfk7RhadZasnesj1TUFKU9IHDWhMxBv9fhPNHo1vS14geToHjFGlgVw4SX4YA0YEwW1sU3rD31e4g4L2tdopWE2YgD6V7gqz/DoUr6xjwjD0IGvUZAjL2MHaVhj+pUiNCw1MaYYxCnplJ4dCY08A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIEQb/ya; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kKrJHxKH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIEQb/ya";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kKrJHxKH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9xJVg1756065
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 13:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IgeIXP6SCvHw6KGTgfYyG3P2
	zJRE1Ej7HIYXBJvoRd8=; b=aIEQb/yaGD2MFyVROughZIPzaxNPC5yfpOKuDqB0
	qMB7sRGhlyaqkrGhfkXzPUOLcn+TKXHb9yqQJRpqGpmwEzIDSddQvs5bm+PcBjq4
	+j1lB3pS3SywmFxnVNPe5lImavSjS3aYybBl01zvP+KPaBgw5NUxCyqdaJQgbgNV
	A5IE6aUwAHlzfUtXHquH5apA0Lizy5nwscrhy7NFytWG1nZ80gNn2fpaKz1tNpte
	e3uTC30L3UuUsuZ01q6quOSnOR3j1RYLID2Rvu0QOw5up+QRLeL3k21Bo3J+lHjG
	BU1jZlhAWsVoW05OJ8C/2CM7jnGqws55nul4EWZrrgo7lg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53j4pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 13:03:42 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-67bbf529d09so17903215eaf.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 06:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773320621; x=1773925421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IgeIXP6SCvHw6KGTgfYyG3P2zJRE1Ej7HIYXBJvoRd8=;
        b=kKrJHxKHiiv0OMlwJ2nREbeGcnB3dqXGAwsIXPOncokoT+1RMvDaIAGeMtR9yYsnOk
         s5cgCEQa+aXpwQkksysxcy+cY6Zw8Ui3eb2RWEXRxV+kz8RcbZNJUTiBLXNcGAdhezmn
         Ojb2W6Z5hogvuFmtwrjDJJw7c8PwSs+U0iiKkzofU3BQs6To/E4HPdJMEGW8UUKYSk1u
         HPauXfbE6peYjNxyD2xa3CCI/EmK+cdVJNJ2DZa1P/t0A3mdH03HojQRdIaqjpZh5ukW
         0a14PFI9DlGUem4X8wOit1G0ifDZn25C49wjtBInEr3B2AdD17NCbq+YMzgozmnEJdWr
         S9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773320621; x=1773925421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgeIXP6SCvHw6KGTgfYyG3P2zJRE1Ej7HIYXBJvoRd8=;
        b=FtOu9Q/WaR73PbXoZ5IM9lAHzmNriAgWxkKMS0mDwygO3wDpuXljLSZ6/I7g9hUJgD
         mY53uDXV9wa+SOkxMMT/69zlOevbqoGqA9VYKaJs795sE6SggzgTrL/hyTeISa8pW/rR
         M5bb1yPluHCrsp6+3kFpjOioNgsI21GGZ0t4Gv25e17ECRsiuyioj0xGbnHQoSO78FTC
         1clIuJerQFB9gf+E0u8H7ocbOg8qOu8QBI8MLYmet3cWp94vfHNeqIQbtCqHaZ7LT9yJ
         GGkSc2AxMu6pgeg6s9u1vJRcbNarAr3WIalQt1A5QKh8Z9wko0pE/81raFRvNSzdrowq
         lANg==
X-Forwarded-Encrypted: i=1; AJvYcCWk0LP33Kpoom+61wOlKmhBAzrZtSmz5RsPCXDZOyJ0dt1b7sBYXeObKTDbuCYtqVAGYu3zaSqPC4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjneNYRkfpi5ONUhzRds1OdBHLZElXmbgiZsg1bUlu8zI/ChRv
	vUcHhvrw1QkAbm0s7jKJpSFWNhc59J0xzuV0+WhKA86xDrho3aeCEKx6dh1b3WXLNkEqAB2Pn/I
	mjOJAOW0URWVbvnkd2DdHochYxR5/Ypr3h7dmacKBHc/kjdUwD50XKT60Q6PwU5E=
X-Gm-Gg: ATEYQzxiYUQ4w2YNSwcoaMg6PW0jPWcz7pRPedub/46h3hYl+lpoDsA04wdFsxMo1PY
	c+G38LCl6NNnmyxnQ5vR5z1uMZGI8lOnRHbObqjbv0/MdKDGeXVT/Qhpudlg1Vh5oYjXFTJBVXg
	zTGIiI3m5/bRq7vkydbzG/ZBlRpYvO5XMl8bMbW3CyLMVaU/nXFKv+6Nnr8glRxVxfowrAY6E7+
	2p4/ULwHWzzKuNqAcvjRMbh+ucGSpbYaa51CjHRRNuqCw94NwbEcPPNFGyvBExaXV2+6XX8rQJi
	oPJ/wt2LGlfKGoBDhmr2bkLQhLGSnkjK31ACnEp+eMHfS+0ya+ucGaufdlcUi1o072/RfvplMWt
	H6TZBxHIBdFzGibX4XX9AkIC6vAS67rV5nuN+HshpuIHwUruIv1vCpujRGxFGAGTLK4UXIdL3/c
	rn9kW/yPBAAF/m6Pk3vu0gPcSh9rflSAWwTFA=
X-Received: by 2002:a4a:da53:0:b0:67b:d301:8638 with SMTP id 006d021491bc7-67bd3018a9dmr1000443eaf.30.1773320621410;
        Thu, 12 Mar 2026 06:03:41 -0700 (PDT)
X-Received: by 2002:a4a:da53:0:b0:67b:d301:8638 with SMTP id 006d021491bc7-67bd3018a9dmr1000416eaf.30.1773320620859;
        Thu, 12 Mar 2026 06:03:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162baesm983898e87.42.2026.03.12.06.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:03:39 -0700 (PDT)
Date: Thu, 12 Mar 2026 15:03:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/11] clk: qcom: gcc-sc8180x: Refactor to use
 qcom_cc_driver_data
Message-ID: <hufolkwj7kpniqzfukpncwsfn27fyeqrkdgpa3xjpzo5ln4dcv@2itadbcoottp>
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-7-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312112321.370983-7-val@packett.cool>
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b2b9ae cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=yOvLjl7QKCNJE-DQ6PQA:9 a=CjuIK1q_8ugA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNCBTYWx0ZWRfXyVEMRs6xiXk8
 fTw2NmCrHxz92O1jNCtOpB7kxFGyFp3hGHGTYH/2VPweVW7dmjdR1UQMB0nmxBKTTZvVYZVugNw
 +mZO6Nyp8De+hT8nXxkMejoe1IkBiEMKxZ2iYfZP+BvpTBV5a4J/UEsRReLJsDUEXaGyy3ji8PV
 Aalp47ASXCESA+kPmvMM92BsyYo33N/QZM9c53JGo5yjaULRc6PxWigQfttKTP1Mh7aHNJev8I4
 3C1appOX/+DdTjVFqcF7yCGuFM8IEes0EaRJXQN/omnlUuX5obxBf286pvmifojDUzMuG0YqgOK
 wHhalVKo3LNjb689QlJsHNmHgCBdHJDtYlAqsw/2aiVqt7D6yhzOjxfkPBZ2106vwcQu9bf/n3e
 hYgN9HGAcIGyW2GOzxgy3abBIJqlYRHicPfFcZc1sjTbCEX+GLnZOrJ6JoSaXRbUl+RPUBbFDhy
 bxD3MP+fBwKBmHEb6GQ==
X-Proofpoint-GUID: Ivvnq6-nMl2mtjsgzcmErFzJPgvvArwE
X-Proofpoint-ORIG-GUID: Ivvnq6-nMl2mtjsgzcmErFzJPgvvArwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120104

On Thu, Mar 12, 2026 at 08:12:11AM -0300, Val Packett wrote:
> Use a qcom_cc_driver_data struct instead of a long custom probe
> callback to align with modern qcom/gcc-*.c style.
> 
> No functional change intended.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 61 +++++++++++++++++-----------------
>  1 file changed, 31 insertions(+), 30 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
