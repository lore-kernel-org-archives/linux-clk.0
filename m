Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9A625F79A
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 17:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758301300; cv=none; b=i3mzgBe1KOK0h0HzB+UTZIMgmWf6riMEbI99Z84m03RNIB4TvEv8Q8X0QZ/6wFAQgkkVBUbj5wWl7lMuMMU9iqYR2cvZo32v4d1+aPj/qQquK7xqBWDez6Ocu8UumKGHUQ3rd+9a6EtvpbZQ/5jbzyZuQoatKiYNLbtN9Gloo0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758301300; c=relaxed/simple;
	bh=trDFBwc1oiaJoVJrQfez6m7oAuetfw6BHTNzouIaVYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DriRw9j29J0hEzGHEaRch8nrNaaQ4LDQyBv0uzHuzD0A7K9NXWbk0ifBkXmKEqoorNTQ8zMddEUnEwPopiFMnkudvMbdkIycm2WG+33h8adYXtntlD3rO4lwX3S6hfUrk049j/58vv7ifKof2W0EsImnrDX82izxR1FYqjmGYIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7e06cpu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7e06cpu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JF8Gxi010757
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 17:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/GJuqjnHkULWUhGDoYaDaK5l
	06w+po27C73CLRMK/x8=; b=U7e06cpuONegCJPqkZYtg4UUJJ3u5dYyrZVSO9mv
	ELIRgnZlemXDNkiJem8hUC9qqsqQHeul2tSlOAixcWaZ9BEWp+D26kpmx6QJizvb
	3BASD7r2p8JrVEMo6ok508AyBmMoxc9ebaA+eYmR9xF5gHyNIIoRh/Pg0OgoJpsp
	GzNk50xwDnhk60IkNeQikoAQ6cLjMGVR25M1d9C1rwt7pl9NxOaPjLOHIyz/TWi8
	aAU0s/mipFfhHQ1LVDpwr0+8mz9fy/BJXezvcaBw3JaFfvE0Js61HH5buv6n8qHU
	I3ZxhjRpDWBsvZhyKTt88C6d93rSWE5BoRu65iXNd4D5rw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxy34ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 17:01:38 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-54a7e0cbb98so1548997e0c.3
        for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 10:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758301297; x=1758906097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GJuqjnHkULWUhGDoYaDaK5l06w+po27C73CLRMK/x8=;
        b=GqESmXKgoJq1QlhkTFCDslNgMIA0yPVEkbprzToNNIVGelTFZe7oXjCZfwE3l1REUj
         vGqMSHAU6xay/EpcJNxYQTzrtpmr0b1pVXSa+zhOTvXLt9R/ZzH9eKAcNfyD6I3+nXhr
         wH2yZltbT5JZRGpDcKZYmRoeKuvuonn0+0E3C16On56+gth8tJ9UapfsfJ8dY5awKf2t
         7IDp1MHM99/zlszpuM+vLvZKBGN6DZXtbl+WENpiP2DtKWl3o/0cWalMkffxRDqh1SUJ
         glixZvno1TJ+0V8xLtupH3Oq5Irx/3ChrZEMJ56+U2YeabrlwEvVhhLNfY4nmxI+5BcP
         UVmw==
X-Forwarded-Encrypted: i=1; AJvYcCXkrjfKRmq2RHClh6ei0YXTK1/zITZnKmbEveDViWP0eY5OBykfs91w4QRPbNzOTEOiCG5t13rdJRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ3ymgz49lK07K/LqiHHzNXc9cCT/Xru3qDNe8XllimYsYhzKL
	EseYpwS5BaYRnm3zrndTnyijT1rHT3Y6N7TRL89FkUTYY7mpOc7WBccRHCVwmDcXsVRdU01LJ7V
	2mWsmBHU1O/RUORO6g0D+moEonijwe3cz22HObc7xUwvv77VM5JKNhtKrYEGOjho=
X-Gm-Gg: ASbGncsFixoULpZ+82nJFLhq5urr/heeMvGsrhw4V7lioDhQ5RhkBnShu1lS3GRGt1P
	CfYlO3Yz+koHjFm3BK5juXQ+7f2Wow8aQDZCsoYCxGS/8olvAcOFoZDLKm//C5FXDwyk+bbZSkT
	KFpb3sVDCnjDaWuqplmY8bodBSxfLAnB6e0f0qYWPmxGQwdgvy+mURrBv45caoGzasRmj1x+ZIS
	KcFEllb+W8xHV0PKTeXtI6ZcBSYDqLynCQ28W2DCvNYrGGQZvsB3twflH0ck0a42LZ5t8GOyrLa
	KAPm8YWtufJZqRoFWxCqlEYy4QrhR6YrPpnxtoBSAAeiA3ykc238AAIuRSlu7N5WUP1Betk4dUi
	GB5J175EzpV2ZtwyKi7kujsSdbMWHlkgkGJ+saO++EBMrozx6jTcq
X-Received: by 2002:a05:6122:8c02:b0:544:a84d:d3ac with SMTP id 71dfb90a1353d-54a837797c7mr1542735e0c.5.1758301296813;
        Fri, 19 Sep 2025 10:01:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRMwUFcNmD6+H4WWbQh7maNAmSeRlq1FmZoBVrzLMBe9fiOHdTW1rugEpaVEScuqRpuuBjoQ==
X-Received: by 2002:a05:6122:8c02:b0:544:a84d:d3ac with SMTP id 71dfb90a1353d-54a837797c7mr1542622e0c.5.1758301296167;
        Fri, 19 Sep 2025 10:01:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f44823sm1510808e87.6.2025.09.19.10.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 10:01:35 -0700 (PDT)
Date: Fri, 19 Sep 2025 20:01:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jens Reidel <adrian@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        David Wronek <david@mainlining.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/3] clk: qcom: dispcc-sm7150: Add MDSS_CORE reset
Message-ID: <rxjhl4t22x4472x7qjxe5nq4uwoogkuyqzqz4imdtnmeibucp4@yesphve6yat4>
References: <20250919-sm7150-dispcc-fixes-v1-0-308ad47c5fce@mainlining.org>
 <20250919-sm7150-dispcc-fixes-v1-2-308ad47c5fce@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-sm7150-dispcc-fixes-v1-2-308ad47c5fce@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/9U8z/hZbJ6g
 uPd/Vkxa9Nx/vbWT1VDq0g72bksTvTYhklOyPZM/vmABganqZF+kdyx54nHJTA9QJcVhEXJyXgU
 TBs8646m6xnq3PaJgk+fGlCRj0wH7rVxL6qHgyRQVgoYLiOtTcP+hWlb3nDYbkyFBn1fsXHPX1C
 L0maWXoEyo7Zr1FCKKO3JjAbQchKihTYj4llwtG87p6qC1rz4BW/uZXLpbZnfqgB1QB7xDIiK1x
 kf7+Zzvt1jeO8AjnWZY/0njs/hcib1VbzWSQg/W7RGHNJ1EcvGNk/W5K+Kr8C9GRHarS+LHPew8
 b2lEzcVQY8jQX9atiz7zqrnBzB1gzTAH2yvBy+sXQOM2Xw4HuFsLLzljjOjNuxrbUYQNoKtoeJp
 gv3PiSlV
X-Proofpoint-ORIG-GUID: 0FpF9BKu2O7XSwX3oYti_9iu0KTjGnc7
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cd8c72 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=1MwS7L9duvxXQ3yU_sEA:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: 0FpF9BKu2O7XSwX3oYti_9iu0KTjGnc7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On Fri, Sep 19, 2025 at 02:34:31PM +0200, Jens Reidel wrote:
> Add the offsets for a reset inside the dispcc on SM7150 SoC.
> 
> Signed-off-by: Jens Reidel <adrian@mainlining.org>
> ---
>  drivers/clk/qcom/dispcc-sm7150.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
