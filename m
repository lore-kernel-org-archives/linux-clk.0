Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F6F3B27F3
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 07:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784186541; cv=none; b=H5HoGaSgJRlYWaGFhheD143Ke+AaxRuB7MjD+7/rVHFpeEm9cR66K3+C+NQCPiZSJMKUY+Q91PMGZ2uaCGkuC7KjSaDr4FEFgxfWZ8IsXlL1zWuOOgpHjcAvqWgkP48BancSN5+yFM2rhLvPQiOUtZxUFgNcaMdkZ0lznqyzu/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784186541; c=relaxed/simple;
	bh=TROgmWXztAn14NXtkVtZ37C7adp2CVbKWcYKaBOSV9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mqs22qUukMxEjxXWII0Cz8PaE0nR8r8b3pAQnV07+acYDee4seLv9QTpEuqtA0ingwbOy5WecBJNn9yd5dyLPEL0w9gXS2utbRuMiWAnMyKesINnjl5vNb51Ve5M4WQWQ+SsFqBtpo6jeq1kZzTp8oW/JTz9fH/d7VKUkthrUV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTeccfln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OAFoGPeo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTeccfln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OAFoGPeo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DZrd1995377
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 07:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LknEdeGxl3Oala4tG8f14yJ1
	F3TQzMWUSlmByiWhqYs=; b=fTeccflnLpsImvnBrs+J03XbZJDvNKPO7LIYe6zG
	iJaz3uQpjplywQksrXa3GcSxaeLqiEmyDnW9/v0PfNJuXqC3dTADo8rjWLiOO9Z2
	mKkcACQraiXhWWQvrBSz7SQZp/TL5feYlEkanK8kdyGKBMyYt7rMzsZwIF2TelV0
	EMTHc1LHiUhvU0U+FKSweslieNoY0k70AFe1sSxuQBUuujAoJLgMXpAQUg0rfkPc
	UJkgCPUXpj7123iTBHRBxZACshniIEDEj0Bizjty4w/Lao7tLO2KI2eteVFr7Uvj
	Lh70IVaZIyTQkpf4bw5cEKEwT6tSEJxMNdQ7LmzGE8ABxg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqjj72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 07:22:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1b4d961dso3061231cf.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 00:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784186534; x=1784791334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LknEdeGxl3Oala4tG8f14yJ1F3TQzMWUSlmByiWhqYs=;
        b=OAFoGPeomN6KkwoKeGQd1sBZZJ4wN4WKMIQizp4FUNYNu5b5Lp89p9+MhHxpBqLZsv
         oV7i0sRllwnz/KdP36E8DTKiDvYQnHwG0J9sLIBypudjBAL7OJgxV9yI+KBcuujpeSx8
         LRhhbUIIxv4Y2/zI08iwrDxud6iPS66oLwA6kug2niPQ6vwMTkVsTmzZaUidJkFcC8Av
         xBByr7IFa6qPzmMiuqOEWMm7C+dpbXs3IvcxmRCekRK4l2JgW2HR91t1ToyjYGkaF6+T
         AWExRLinuzXztehVRL0ybFzjvRVQdCxAF6APfadEe8fEaNcDkLxsgniFQffsTjYtUsoO
         xocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784186534; x=1784791334;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LknEdeGxl3Oala4tG8f14yJ1F3TQzMWUSlmByiWhqYs=;
        b=E0DhrMme/0tqz3A+Sw91m1RSvkGgw8oxotPsAsOsiS84zSHzkKTK3YLZZXcnutZuEY
         TmmnCFoyBTZgSYkWqlZhGlCrLEvAYuNbFZclzkp5n6oBDQfSe3n8mLJU17uWjuMIIjmx
         xW6aiRkwgenQCBhrkvA2wLO0A5mQtqmjQk1BWyyQte6+dsRD0JhHt0vKV9v+pZhvFO5z
         8CVYpVJ2Z0QA+s8OW8dnx2QwD14GQru+WQ/UI0evHRroAJvTBbw7hfZmrDGE7VhQbF+o
         zr0qnprFiLZWO34VnKZ3MblL12PslYz+v7RcVof3NzT0ozSwRGWz/e1ESCSz0etkQPmp
         ivPw==
X-Forwarded-Encrypted: i=1; AHgh+Rrlo9q3ndlbqRFgGofiwlF6Z1xsI3ZnVDFbgs6SC/tJTBClIS71v45aJ7qKoCP3mqtnGdFW6oEQXj8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj4QPZ++2VtqZ3pv9axaHcKOJCaIjtP735vVQ+n4AvjYMWMxpV
	y5tzDZtsayVsk0lBGo9aA8nUYbuiEEhf6NLRJneSbSuPgdFd/Ibbrzanbf8YeW7LeqPFYTCqOxQ
	i323nby3lj17XLOTqkPTFnVeJzLRPkKHqvO2cM6goekqQnB90GJcOWdUZHF9qtzc=
X-Gm-Gg: AfdE7clysxj5/Ycyd/a6e4Xg/QuD2sDZbQ6GsQW18duAgP7ILxJDADitloZt3/0XQFP
	ObV8j+3dKMKMQzNJ+pboR+JfFQmvptGLfFGOurxTVAcApERjJevLHhacrQ3MsicB0cCF4U5z0iA
	c9QNihTL515mUup30fitp1JyoOOO3VF+xmLann29Q2laS2U/6bX5ERbrpiRsyDoExfAQCERwZV5
	MgTpPPMbaQ2HdVy+0EYRkliMWOosOgYfWaZJzF8QZvq8mriDlbQNyHX5xpxFlvQCtWf+QVXk1lv
	pYmJ8rznyRyL0rnqvdJctW7QNqRqooNPrr+aFX8VR1bh+l4ZZ4e68Ead6vtFLxPCZ6Tx+yZXOke
	hILlGTLu41MY=
X-Received: by 2002:a05:622a:1e0e:b0:51c:d1c:10e2 with SMTP id d75a77b69052e-51fbf3c1556mr13659741cf.12.1784186534440;
        Thu, 16 Jul 2026 00:22:14 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0e:b0:51c:d1c:10e2 with SMTP id d75a77b69052e-51fbf3c1556mr13659481cf.12.1784186534038;
        Thu, 16 Jul 2026 00:22:14 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a973fsm23730483f8f.17.2026.07.16.00.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 00:22:13 -0700 (PDT)
Date: Thu, 16 Jul 2026 10:22:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing
 CX power domain
Message-ID: <olkjcrfq5t32gvqgpcqiuyp5jhf72f4piowz6osxhain77f7bc@ggwuk4nz2ak2>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <20260715-glymur-fix-gcc-cx-scaling-v3-1-72eb5adad156@oss.qualcomm.com>
 <4b543abe-2482-4381-b41e-623cdf5be9a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b543abe-2482-4381-b41e-623cdf5be9a2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a5886a7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_BB4LBeaRi9vMzeX2ikA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA3MiBTYWx0ZWRfX7uMUIGbo4nzh
 zqsQtbeQeB50y2GeSsHI3VURXIhrHC5tl75C/af8Yfr8IBuIbLKdHWfOWjaL9obpXeMf0EsT+ut
 DwtPsdXV7xRggeE70ri/mhp0DxgPVsk=
X-Proofpoint-ORIG-GUID: QB10kxf9ewCLAYweEnwNr7XBCRHWdcLy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA3MiBTYWx0ZWRfX0Rczf+1sBpuK
 0OJ5S1dfGBUUtHGyjr6qMcxKjl/R5rI6GpUrterhtJ0H1OeBKYe58mTxtAYWwL6qBEDS4TeQIDh
 vEu2DQima385EpG7cjvYhhCgi9Zdp0wl2vIjvgDfvDtuoT3P8lS4MwnBP2FBd45Z+yTYpUk1XJ+
 xl/gdRioAb4dlXKP+bvX/iC2osIDbMV0X+fxowljkVoBg/iO+o4a+XWvYUZLBiOkS7+kIh1VJMb
 TYth0PjRXxkvGLfRXIAbBKgkdGXxgf1POTnJm7ZhRsmIL2F0/k8TI7sAT8TZ/3dINZfTU8UjK2j
 4lRoYIiPp/8yJRnac/DslMxfpG0ObcqeDB7zdWc5PpzRN+d590uhJL9NAYkFi2WLZpZ5apal2X3
 h779aTB7k8/2tJPFFAKmqeLU3R79q6yu7FVnmLIQJF+agvDQSpCTYl4pIsTTGBMHcTbHl+klduz
 fYfsnBDXPPWd7QkycIQ==
X-Proofpoint-GUID: QB10kxf9ewCLAYweEnwNr7XBCRHWdcLy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160072

On 26-07-16 10:13:48, Taniya Das wrote:
> 
> 
> On 7/15/2026 6:59 PM, Abel Vesa wrote:
> > The GDSCs provided by the Glymur GCC are supplied by the RPMh CX power
> > domain. Model that parent domain in the GCC binding so the provider can
> > describe the dependency in devicetree.
> > 
> > Add a single CX power-domain entry to the binding and make it required,
> > matching the hardware description needed by the GCC node.
> > 
> > Fixes: ee2d967030fe ("dt-bindings: clock: qcom: document the Glymur Global Clock Controller")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> 
> 
> Abel, I feel we should add the 'required-opps' as well which will ensure
> the clock controllers minimum voltage requirement.

But it was agreed in v1 that we should not add the required-opps. So we
dropped it in v2.

Can you give more details to why you think it is needed ?
