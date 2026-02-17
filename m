Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3681223E356
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771313845; cv=none; b=QACa7c55aQmby1deQET3O+aiCb3V/XGJkQdKNngQbsKUHmZ9LNnXrZOnw9aNlDhCT6Rl+ybG6N9EmaclOB5RvRUmQyVgmu2jATS/q9C+crd40MPedLCdk1fmbk5+CwgHZXeEFoMJV8SqSgUau+wn2vs8raOGmXNm8Uj52oEDoac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771313845; c=relaxed/simple;
	bh=5ymOAA/qX+6v/E57hzw88s4Ajr+oAMkZohNiy9JVhZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OR2kLARICoahvxu4snqCsYgZkQg2tQ4rw5EiAOxn46X+jQEaU4VrnZxh/Ppj4X6srtHoGD9h0h/s6joLUnsJ5Ms2PjrMumzm1K9WFYY37h6We/lHNuum4NVRCCmvGZXdO5+b0kkd6dBOP3DTHyGOLgMWc1EAestxfpE5xXpRt9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dxXzaQnl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kU0Tv/DT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxXzaQnl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kU0Tv/DT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GFkWFW982450
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o7NIcT1Nl7BtalJetdwfHe6L
	kIdG75IZF8wDqN6G36E=; b=dxXzaQnlZRuyoSTepdhuy4lXDErSuQGkxStfb0G2
	EKllEczgyahk8p5zLZ3rY+zWADFhPIREp7X6xLWWs81BQs06lxCPfpR2ndij1Ctw
	cx16oNWJhavAkDAiqS20z5YghwyTdUFgZ+JOJhcBt5Awkpv3bZAFocyw0zJhcf8K
	SHPq16vqgi+h8rgiK/qDfQF52qG3lvrr6BYFmD6LLS8e1sbTWSN4qy9a5p9eix90
	NwCgdZoI2lZJ+T5Xh5k7I8dour0JheYLvwgd5/NO+OWIYRDz24k+H9ZxChxJfmcm
	5Y+jBDydAG4dY/LDtCitae4eK/HRGcEhvbOrhILrkPAewA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662sj4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:37:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3fae6f60so2613310585a.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 23:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771313843; x=1771918643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o7NIcT1Nl7BtalJetdwfHe6LkIdG75IZF8wDqN6G36E=;
        b=kU0Tv/DTsf9wC4Fdo2wmmjaW9BFSoHZM1SheX7ZCs4dnBUZjqzmOe88ElOuEaKlFyE
         fV3qr5rl5bcgKPYuq1InywiHhaIWY11T1ythB79LCoZon2WwmtleRoCUWhvrG+L+tsvZ
         tNe3Rr9lq50K876Z9BieNKF4mczJUK6ajoxA0vZ9k6e1p6NlrK8/Cw4uodg40t0hFMmG
         Q9jmgzEJEqMw5JDqMtQmkWJBFdMu6izNLYHgMhHUA+OBIP19W9407Faq0yAZXENkfI2c
         uJByJSYW8AsdwHrsOYOeaOg34GXtv7z6vZWd6k3uLkNDdSojJ8IbD/WFmpeKTSqA9vaJ
         +Nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771313843; x=1771918643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7NIcT1Nl7BtalJetdwfHe6LkIdG75IZF8wDqN6G36E=;
        b=GCrPnf49KhOn7aQ+N1uoT/DIKI359npGsOrd7rGq5EeVBH6rai8cJ9liwuCw4b57Bv
         eAEjoo/sd2i3LfW2giVblO98TgNnn2eTg7XnAPz+/JRwm2hmubOgjnil25zs6G+Nvajm
         nV4USRKGeXvYr5b6IhrXRUJ7EmdQelWTfGPuJInbZpG/y3miQeHfnnEHp0HVmXIkLkVw
         Xr+Nx1hruxMGpkjqwI43IiyCPkY7SWMTzqJeWPea+8Dbx79faCYQ+XSBeKYpjQS/7OnE
         9yR1XkrvkG/ktg5ZFmovhqLuxiuMWX+eUD1AwtNgzi4AAfpeuKe17bozIgq5C86R7201
         onow==
X-Forwarded-Encrypted: i=1; AJvYcCXOXZTQxIcz5HAlbDh2faspdIolhMRBGeCf7USBrG69ZWBZbM/04mSPu2pJfcJmFsjDqojF5cgmdEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCxAfosvdlucilh/rfi2xmphWM/Rqhb5YoAWS4W6cbFd/IUH8V
	y8AbiMUfrKKo6rhp9rMsb3DJtQiLkHCQ8cPI7gvC8zZEfdwJGzJkx1a+a4s8kF8OkB2d8mG8ZOL
	9F7eh256BtR7rLFYTCwIGeGk8SFx19iC1jCWd79o2AEBo6K/ECERIny7FnFDx+/c=
X-Gm-Gg: AZuq6aJxqchZsL7c3TYtRw1k6TxpWzlzJoKpevgmfUf5lYP/PAmiMzHBlyWxmhesWsT
	raWEQp64rPq8njbdncswBdjG3ekE+EK++ldlNd09JW8L6b1DzhRH8UUpZ1zyataL++jYVyTEn6P
	inKZC7R5d5jydWbfaJdYI2baVKGWymRbL7/jrKkqJzP4V/NXf1yxDHEHKnYe7PAPU2FZW94aSN9
	mDIni3dNcoxQ2sV0GH3D7H7CXt9RrmiHqJtA4Pi7gCyJdoey3h37Bj8G2QdR87MHEHRxvkvZQAD
	9LCmSVlGMJejStAOUvRqAHK4l1NQVsH05CQ14RkyuYd0iGi5wFEr5pOz5R5V+iVnFi0ftOtDEM5
	pk0LwWzOY9OnBU/gynuV4j6SVe9ApmRi4h41PUIrrz/dydy6BxhPkIfWKc5Pznth1jFgKUlNifl
	IMNqBD7BNHyTdyTDWqcd9+Bjz3IVedLe+D0e0=
X-Received: by 2002:a05:620a:19a9:b0:8ca:a98e:bd0 with SMTP id af79cd13be357-8cb4ac6ba5dmr1309053385a.27.1771313842588;
        Mon, 16 Feb 2026 23:37:22 -0800 (PST)
X-Received: by 2002:a05:620a:19a9:b0:8ca:a98e:bd0 with SMTP id af79cd13be357-8cb4ac6ba5dmr1309051885a.27.1771313841945;
        Mon, 16 Feb 2026 23:37:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f51edcdsm3688319e87.0.2026.02.16.23.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:37:21 -0800 (PST)
Date: Tue, 17 Feb 2026 09:37:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] clk: qcom: dispcc-sm6125: Add missing MDSS resets
Message-ID: <oudixl456f3lzu75npcincr3idh6itkbmltd4ypu4ry5ncyxe4@epuii2b5wl2z>
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-6-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216233600.13098-6-val@packett.cool>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2MiBTYWx0ZWRfX3/uUDuPzrmOb
 5OIKkvCQdq+MG0XkPey2CRBIe6wvZxqmpEzvhVpTZVHj5gVLPdCl0K37ocDy+OFCPSfU7q7z7ru
 x4x2NLSlEXWqeBjOTsP8e9Xax9k9uiia63yff7nOmxDUKBHPpqC1tV+zUCNBsdiS9aVgLoTVXn4
 32O2RTKvk60aMVU+/vbJe11Ut8w81gtSAlqEDPAI+1xixhx+RoDSIB29wX4yhD3afNYw4wSaLoA
 5jBq7BQlfhmNmk5oSh26NT4iafKDrqUJLmkQGlli1NokgzqaSsaitkMflH0GGkH3dWHKJXX54PE
 REeJTU/kNa3nTm3M8dZVNBMLAyyewNfiIVylo9bI/G9hw9ObSSzP6W5ZmI75akOqLFEo6hVMdEw
 HkbKByqkE6JqUuee0p7YVWCSim93wXil6AW+8bG+o4b168Jvi/wrodoEKZnk68oaPsBSaWPTgZ9
 ecg3cWlRKCthy4dGkjw==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=69941ab3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=NzzAIdn2IQfWdxSLNSIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: qeJeRpZLBE3qmPlkurdNAcEjh03hx6as
X-Proofpoint-ORIG-GUID: qeJeRpZLBE3qmPlkurdNAcEjh03hx6as
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170062

On Mon, Feb 16, 2026 at 08:25:22PM -0300, Val Packett wrote:
> The MDSS resets were left undescribed, fix that.
> 
> Fixes: 6e87c8f07407 ("clk: qcom: Add display clock controller driver for SM6125")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/dispcc-sm6125.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
