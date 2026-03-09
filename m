Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8475C366558
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 20:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773086729; cv=none; b=pkdBGgX+KZ2415PK31yoQ6Z+xoIDWoWHJXk6EBU4Eo/x7Fd4A/njWumxgvK+P9jWEWkPMJT2SN1Ic2bqJmdHRa+Y7ljXGtPxIT+T7VtbO2H1nUWG0dIStjBy0pZVzps1HESN5UkwlbN2TolEERkv+T30JdkZF2x2TvBoEfmTBKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773086729; c=relaxed/simple;
	bh=q8dO/NQFKexI0qXT9fHN0CstjQWXf36wBbNmfe7FV4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzBzvmj6AaUgC9Az4uRCnuQmJkB0sDm2t4VIksPpzU/0Ozmr8uPC8JDLYhaHPywuY3e0HHsAossR2mHUnCVAqh4ZVRplFrCMuUt1Vdul4Dg3XBLGu1JM1P9cswiFkvWLSOqsnRSJei4QCKC/MTsEAGMAyTxlXVjQ2pvBIZY3y3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pORC1Vps; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJaIK8P1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pORC1Vps";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJaIK8P1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBk3K859602
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 20:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xeRzbPs3nephiBgwqlRT3QBj
	ZxWsr0RY9H3pBHGUHLw=; b=pORC1VpsYJow+k8nceiN6xk6S7lHffHF74xQ82xc
	+I+Hvf2GgZl83etUxxWD8Lh2aNOQUc+5IMPqm8YzfJSDrP9PtEEI4ywcm9woLmhC
	ZvNs8dKeqRlQ1mkA7ayVSbVkHV5vIxMOJR+/vOq8O72K9ouEvBXceLIVZAKJEGZu
	868tCyxAqoEgOuLPTaw2fA6WPgYOgybaGCdxdKbWyztOd+u8SKQfJsLfV/SqZ0ew
	GKEUbkyc0TosSEJ+5q2UOOMB4ZXoanmZVJ5rnYTz4nzY5Pkwvb+Xmf2GjY30yYCY
	+MdTiTQZeITmikXPS8U8jk9RHyEVggtn3+LAJefbhJLDrw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbs7wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 20:05:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8b37d4b2so760558385a.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 13:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773086726; x=1773691526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xeRzbPs3nephiBgwqlRT3QBjZxWsr0RY9H3pBHGUHLw=;
        b=kJaIK8P1W3RaMcnRfEVWHQkxax9buUiBglqolwrHgELN58kpZIzlG9ReddWYfXwm9G
         SpiJTTxvaJvq3zVG15y0rP9px3cCZcFq5I6v4AKZ45cAazvvP2ExBpjh7+oxdG4skzk6
         gpjcDZsZTmkfJ6Kz3XswsoOzMTpdlMxKeWQM54YTvRFFxkiKHPQQfdZnmx8z4vCsWqEk
         dzuglBbtgk68kKKMc/5gOW1j47ALNJlhiVu8csbXzH1SUIeWkvfMZcabX7C79qkwTkDl
         9+eVjqBS7LUuoeoGoBWV5yjRbwfecx9+8S9NHiaXw+voFUgt2lLm0BhoqEQmpxbLqUDm
         ox4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773086726; x=1773691526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xeRzbPs3nephiBgwqlRT3QBjZxWsr0RY9H3pBHGUHLw=;
        b=QQB943HEl+agqtmQhqa5KsYCcIuKJoLKHRlghvlBYr89Ujz1XMrR9ZgIEXHD3TFdAM
         ZHSpjlgZvULxHCfdimA8i5ECV/fOjVEppCnEGAAxjwsXKYiuQlnLQAOQ2Lll4TgIolSl
         AFVFPq3hpHvvj02ECGjA++3+tFcHsO+B/tRAXnAi6hC9MGkfq6cOqPZ3Qv5Hgsd7uIEZ
         IRr1AgYD4TcHpbNp+UfWRDiaYgoZc/qpmnZ7I1NwY3zAhHwelq2yL+zGwdjm4G0/JV9C
         RLHp913ecIgtOUZy7SXDRr6e/DijXFtXU5sb3wbtdmi4xQXvpnLWrRispHLl4TlCQkI+
         wOlw==
X-Forwarded-Encrypted: i=1; AJvYcCWj4Acq9zB+QMevSXJFDG/2aPuVBIpXUpBmhhlOEQmsApIKXgPyy0RJwmBEXrDMTSbLOl0HRRTUwS4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP0QBZc+74RWqOP0qf2fj6TA0qdghkNzSaJP2YfI26v223JeuM
	pBExvAgUbXAZmSNJSfmwPHiGvNOPjgTJyYqdivs1X0eDekL+ZIhhYDjm6i1lbNdWmvaAYz6vEEv
	4mngVB9GK2b+r+HimpG6ueUC5lYv6RdVfGUGJVIpCR2fcCbe0J/TFiO4wzVctScE=
X-Gm-Gg: ATEYQzyHQDDL5ctlyy65IsY3zf2r8U2WomkDMu7Lk9AzME3/sZBwykzUKsdX725lgdE
	EnNWrQZFeFpksyiRkYEsaz8gd7tY7fGThi4LJEqAs9gN//TT347VaNPP0R84+shwGBCcC5XPyN8
	BVKQ/Qmp++wt9aDKXr9veCDUIiVGz16Xl+L19HFWyWKRe+7YqiX98685Hfeg+d0yGf5Yvw2zYez
	b+n9ZlZWTspHtTw8+Sa6t9/jAoKjXwTT46ChaOLqkvSyGLG6HOiDrVtWwCi0q+ASF5YtJGhkJC4
	biKW9ZX/YDrm29Ewif5oO321kYApRiEcXAtnBP1P8eW0Ix5zcFtOK1YI5RJ3S6LU4iOlQ4W8BzM
	uViF23TXZs8isVw0SeG/AWCRrd9Oq/2+t25FzqmZZQI/rVfqsTsJ3ukDFQfmLg406qHtKUgU1nh
	+9ZGWt2SNNAEUZzupOSpehXfM7XwZ0ZNVwtwE=
X-Received: by 2002:a05:620a:290a:b0:8cd:8f18:d1c0 with SMTP id af79cd13be357-8cd8f18d44dmr335250985a.27.1773086726384;
        Mon, 09 Mar 2026 13:05:26 -0700 (PDT)
X-Received: by 2002:a05:620a:290a:b0:8cd:8f18:d1c0 with SMTP id af79cd13be357-8cd8f18d44dmr335247985a.27.1773086725969;
        Mon, 09 Mar 2026 13:05:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5d045f5esm984971fa.29.2026.03.09.13.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:05:23 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:05:21 +0200
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
Subject: Re: [PATCH 2/7] clk: qcom: gcc-sc8180x: Add missing GDSCs
Message-ID: <2s6wvutzb6ovsmjigaugpzapfgtt5enq6tf5gilf3fk5r23sgl@nmg2kprbknch>
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010214.224621-3-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309010214.224621-3-val@packett.cool>
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af2807 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=OQaGSiDE6uMd9YZWTaoA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3OCBTYWx0ZWRfX9uyI1kx7NEHs
 fEX99F8ygaxz3MEZ4E381Vg5zOs43VRmjiFjy45tNP0iwr6SKklgf8SorQKj1dreaoHUPPRniHo
 2h1BMr/GBesVwT02DtZhzVmL1D+GnXBrX+P7bDgySIjpS8kMZzzL3RQOCuSm3hYYCqKFmL2XQtK
 /nR238DXnaQNu+HFIIdush/YzUHwaAu5lJ7ge91a82uTktBnrojSGpnV/dizWSYyXAVhXAbFkls
 oLR8iUEorqqA8STZracE5LWH3fAsf7tSEbHoQITngnJ+V7aNZA6ggGqY27wS0PLVz8nrsSmMwho
 9m0LRrmHhWeEaV46zBJdW9mNtU7uySHt/VEcWfehV6aaU/aic82Nb4t1CVkwL0OHW949nXHzIV2
 4tAO+XMOJW2u3+1s77wdGT1NgB7pkTBb3hqZSWMi+0tSAv/EpimRVykSm1Jjcxcw8nXdSr8bham
 vrvQHZlPw3fymGGjbOw==
X-Proofpoint-GUID: oeYpfu3s0ciPlwL2PdSk8EYWyxMt4wtI
X-Proofpoint-ORIG-GUID: oeYpfu3s0ciPlwL2PdSk8EYWyxMt4wtI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090178

On Sun, Mar 08, 2026 at 10:00:24PM -0300, Val Packett wrote:
> There are 5 more GDSCs that we were ignoring and not putting to sleep,
> which are listed in downstream DTS. Add them.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 50 ++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
