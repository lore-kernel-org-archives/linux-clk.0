Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F7D3C5555
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 13:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773320712; cv=none; b=s2OqjzOs84aM2/4Yz3NCypg5AzpLjc2iNXWqsrxVH7eyv9P96S+MvlfljKAHe2tUWfR53BIMnARafGaC5QenJ9xLXsr8szzDJNnQOTipGTbhF+6jQ7rBmZc3HKUI2aG3XhQMy9PJsXisufo6+3Wg5V1IWR2MI/VGzxmzV09pTKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773320712; c=relaxed/simple;
	bh=+Izm7SO78Ck7p+ebiCMKs6K4cqXUV8ANqvqwB2OK8sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euEAVppJOP7IndB/PCnjXnF4kLXElWghLUciS77ddqQ4rzAPQD3QFXavupqWfcQb9lC2N56B125KJxFd5kuAGZ+2D9s+hJQXaxtKsTwvdGqY7lfsyvt1Nl8iDAgETxQvMjil30TDOt34BDGLaktFKfJUuXuC6e+Eg50bQKlEfmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEcuhmvg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kgI5t00q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEcuhmvg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kgI5t00q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9PmDC4027299
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 13:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6ihcpB8Otw9hvfXSntu46Cgt
	yarcnxD610q7AM53yxk=; b=kEcuhmvgm8wHMv9fjJhx0IVadEFw4auFkQnNri+J
	mKWDinEPt5/rAL3tK434+SgPcSPxUK1CZHL4z/XsFLAWfFxEPjgC242TRy+Za9c/
	RdkCEXJC3VhtxtzWhVD0Sr3osrqTFcm3xdYn2ZnCf8I3vnhqWNFaJUt/T1TqmsiB
	wjRX3V7kifa8aHZxBHmFJCG/+XbEc1kKE4ZZsq0jNjSGaNGbuzkar1F/Q30LHPZz
	4+Q8xRravAvlf8IDL776k45gN9/2kKKU1YLffu383JyGxwzZD6ZcxCIauMGUiBk6
	v4GxFyk2cE55HOR1O4qI8lE7/TBpK2trSDZglV+KdCz9Lw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54t3vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 13:05:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7fec8d44so670175085a.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 06:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773320709; x=1773925509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ihcpB8Otw9hvfXSntu46CgtyarcnxD610q7AM53yxk=;
        b=kgI5t00qdMP8n9pbaKA8sFqBN9W9o+JpTYelC7LSQafHxG0J/Bfo3Wr+2UTRWX2OMI
         e3ApSW5pavWJYOc8IIxvBWiW0y0Z+HB1Z3TSYs1+VEzf/PhOtRcCc/P+FsvbLO5QwRSr
         rLKbCRlmY9+XPZIC6unAjAwxnjaVHlkyTH1kr+QYf9cv3Tu5WvAGOwOKQ7IpLdeIaUFX
         3EHJZpDGSSx6cjHmYbbxx/Z/ZLVMOgSLBhQgInfQcCQJB3WW6wXSQg5YM0miSSwOKdWy
         oSjjHjJLO+TnwLdLI1yY15kdm9WQi20cp2SQUeMqmis15ybKPowG3OVKJIMTJjw9QWcf
         pdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773320709; x=1773925509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ihcpB8Otw9hvfXSntu46CgtyarcnxD610q7AM53yxk=;
        b=SNcMmz1/O3sqVwQkhEslOIdjVkiPzyPGwqLq0OmWblXNFmqAr0upKSYt54CbFUS3mV
         Jc8iy1d1LF5BaPPEdKRLOT0FIxT4IKWuo31sbow+k5dFvCjEFFGEUdW5Q44zhmuWwhuw
         cMWagABllnD5v+vpe+zEvo8uNXN2oyUY9WO0PK8vMnWJe+1Xs+yzJCKz5cf5cq9UlGY0
         IIaNyicyD5wbRm6phNP5Cy1WI9lNPnYeR2gLyyvZwQ9/AVJBGQrJy6wTmn648+C1COjq
         5GqJ5o+ZtTsv/S4xbHv43jNr8Savh+qL4W0S2Q+us1yCWMFu6jeA/WQtRRPmq1PUZAa4
         1tZA==
X-Forwarded-Encrypted: i=1; AJvYcCXqNIuJevhv5D5I9ONpSlGuy2N+3YInEhTHx2Bz7tMwH2iYi6WwmK0dyxap3QKmkcM7uPnFGuYvSRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtE1Al7HzfivkPmXZihZ8F4wJnssDFKou/z7ch4/mr7/0MQtnF
	smaDlT/AvRxZIL2IAKbmsyRPe0bSk+QdSZol5J0eQUByGJiKQCbFpO+M86VSKwNxsWk5uPihJSz
	N9eSknHZdfFqShQvHvBiZLJXURhS3ihn43Kpc9VNHzlAJSXRu3RZ7yYQ8ECn2ftw=
X-Gm-Gg: ATEYQzzpVsSgKz4546J56kzClQP1YTe5549pRufRsqMJhgaYLS7DALbvkq6IJukLjpg
	ASh+ZJhcKp3Ki/2X0ci49t+AIL0M5jp2+A4QtqFr2y4NKi+lNzM06Fq3AmCyaj7veeBB2JjwCmQ
	tOM8XOAnAaOB0TwM+G6108zonQd7vFdC6BflG9oQSLwP/OAuftq1t83M+U7461MmtdszX89x/HV
	YIVqpmvd+I/Jgb8O7HHaRyMQvTjZfvmrPz275awGpEvrESPj9D9HxMRwxNXvWT03Gr//Ff0o6fN
	Lzx1Nk5ER4hZLAVxBi7WG7HaaT9m9DqL1y4sXOM093o2KOSNiJX1DTOpKGV10Wk1wUF0/IkhiWa
	7cr7GdO//SO8UYaRZoGk1/kAytnDb16n8ud30h4U+VCxmm5ENbK1uQlPpnaNAFtvotJcLA1LVLY
	bIJsYrb4RgGpRjZ+IRH7sq70sEl5KGQ8Bb5vg=
X-Received: by 2002:a05:620a:4156:b0:8ca:a950:238f with SMTP id af79cd13be357-8cda19e507bmr731704785a.10.1773320708959;
        Thu, 12 Mar 2026 06:05:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4156:b0:8ca:a950:238f with SMTP id af79cd13be357-8cda19e507bmr731698485a.10.1773320708516;
        Thu, 12 Mar 2026 06:05:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162dcesm934242e87.58.2026.03.12.06.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:05:07 -0700 (PDT)
Date: Thu, 12 Mar 2026 15:05:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/11] clk: qcom: dispcc-sm8250: Use shared ops on the
 mdss vsync clk
Message-ID: <rd6kg7c65iuxoigsyysomibtegfhswicaop6veb5p4fait2a6p@ogngmaaxcu6u>
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-8-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312112321.370983-8-val@packett.cool>
X-Proofpoint-GUID: exVdQBkzRgndhSZkOWY6bI7876YEtv7q
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b2ba05 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VNIAONyjCExs_J7o2CMA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: exVdQBkzRgndhSZkOWY6bI7876YEtv7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNCBTYWx0ZWRfX2ODiq7X9jRIa
 X3xlDRb851lRd50GSnbS63JHD+jNxbwLS5qtxLvJ/saUBqH8tiCxcWVn2d/uoxfHD/o8ScYXf42
 It2VzkcXSN4XOE/ZiRCRWwLjlxv6CC/B+P39GhXrBelIk5N3g5mYVi1nPnBfFJRfzkN8kZvyr17
 yFJ/d1dnl82bWhiNjFl+rg9rSOUIV61kf3puywgonPz1fES7b0vL5jLncBfQGVvkqhpAfyOxQ2/
 2czmaFMbcGjrNwSFC0TH/Qw3WqbifSmBeEJe2gRclCI5rKPkWYuH2slwzTRJpFx2alhLr0beLYW
 rIUmbJYHM4MtpbkUohn9IjFC7p8nO7OtW15bJdu4BLn6tSTM1FipKY0UoZbUyZmMivIAbXD7zg+
 mTFyh4P+fnCwLXFPNX59iUsxZGEmQAxX6xIykgrlT1yMiabo69kaB0a2Y6wvNK1vUO60xG9PJWz
 vCb7vVys66lA1d/7ooA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120104

On Thu, Mar 12, 2026 at 08:12:12AM -0300, Val Packett wrote:
> mdss_gdsc can get stuck on boot due to RCGs being left on from last boot.
> As a fix, commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon
> registration") introduced a callback to ensure the RCG is off upon init.
> However, the fix depends on all shared RCGs being marked as such in code.
> 
> For SM8150/SC8180X/SM8250 the MDSS vsync clock was using regular ops,
> unlike the same clock in the SC7180 code. This was causing display to
> frequently fail to initialize after rebooting on the Surface Pro X.
> Fix by using shared ops for this clock.
> 
> Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/dispcc-sm8250.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
