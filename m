Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E11326942
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 03:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780888929; cv=none; b=XsaWeu+DgMOHwGxI9SAmKpY0nEUaxMoqzZlozuIEBIOEj0PbZ04pXPHGejQL6YQEuppmVh08ceTd/u6neWOidr9IF87GWBfELbYMI2fiKK8C2dIjlC9u/aczrc5ZXLiKDmkpwYAb2Yu0Jzh0BBq0F6lSxnjxcfzeW0tfDAeD2yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780888929; c=relaxed/simple;
	bh=fx3r25rLt6VUivKdQcgb2nSA7OkctUBrtqGABis58ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgsvchj+0beIpVn+AI7YmITzHBGVIMa3FdItG2f994ObSjexS/HbkbeYMIIP1kgOceUHcEXziaZHTJVrJjcqcZBVLKjlqGH6vNXzbZxlrG9flZAS6ezY3gSpTtrixbq433Sz9PptIo2QNUJHn8eND0jrybT9WNzfrLKs6IiS8kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HyVOYLIK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2IH5v2y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HyVOYLIK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g2IH5v2y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EBG61469252
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 03:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zdGfDGBoMgDf1nHklX0qM1Jx
	g1iBzheuZFvCVbKMi04=; b=HyVOYLIKEIxJo/YbMRsnXQSMvxVOzUdw3xKH+iB8
	h9JPYfImIPYTUtCUaf+h2VywcteJ08GgQvnMclbwCltvFiMxr1muP0zv9RwACChG
	5LdQGaBxuYhqTXKbRE90TsNx2MetS9pe9Y3qYGJIL7z/k/11gGKdjFRVSK8lqPVN
	mQPgW54svNRq9Ea3rYfUZhd0OSxuhHjbjatp75y7aI1pa9zU7dw9pS1bkgR+SWaT
	2WdYzKog69jaq3vds0zrWCF7etq7eB9vO6ST/S83m6pCciA0M03szL2+iCoE/HmD
	JuHxHrAyEZxc4PyATtCg6pQuxzNzZmSCbbFXaYZ//upLMQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgwa47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 03:22:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517a00fbac6so24503211cf.2
        for <linux-clk@vger.kernel.org>; Sun, 07 Jun 2026 20:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780888927; x=1781493727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zdGfDGBoMgDf1nHklX0qM1Jxg1iBzheuZFvCVbKMi04=;
        b=g2IH5v2ydCSleBH9e2b4I9m+s/bgVqhM5yV6zuJlsA/UZVVHaBNOcAFiByCpJxJGjW
         Z92Zk7xHXcB4QaWWozrKJEpcxpYR0KJhZGRMlS+SQj55k7AI5+QttybdS0Jd+GRldMGg
         xmwyhop//pd9SQFotjLySJBVlWJ8A1idtK6hhP2dd+On51vp9RRDUFV/qBEfAfz/Zcdy
         cQdznzcaMMp06ZcbaPfjvMnLFkBB1n2FAoTSadFV1KkG8Xph/8394j421UspuPl3CmYw
         zUdXH6faPxo4aMSZlIqAWyvGcsVpv2OYLh8b73oKT+O3IUEgXp5NhqUXCtnKwsIk7+Sw
         wCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780888927; x=1781493727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdGfDGBoMgDf1nHklX0qM1Jxg1iBzheuZFvCVbKMi04=;
        b=XlMdqGn1syNpprKdXseqvrqyetijUsP46LQR9SCHOdbXK1oo0HHzkXFtWNwka6TS+c
         xlxF0uRFab9Kc0wuv32m21WUTSRDjBXtrMoiNPU1JyjawM5vK3rld6dDZU3jNyyFNjpw
         dbTbz1vRUlqvq3+2Pw1AT38xU2hXhWRpWzxcNb8aF5vMqtK3ZpZ49NH5TcwDb5iVkABI
         SCvEc3iUQ86CdyYCF5jQTmL38rUQBiKoHDnoF90ANVCNDdUzzAcRroILBB0Lm3dMbHwK
         hSaVEmVfhwp/yFeyhYBaL8JVuwzod2abPiQHfh8bQKuAjzI1CiBY5qzxPBBQ1iEYDVP8
         jnGg==
X-Forwarded-Encrypted: i=1; AFNElJ+5B3gtcnfxDjfYxMiO5NW1sUzmaiNkVD4EnnU6hHHLkc2iYL3WYw7cp3/rkYQ6rVc4o1SohtdZ65w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsuRTNYiZZk12S+jawPoGPgnaOH7hjgdhZDc4o6a9p38r+WN49
	Kk93Oo/qTo2IWtJl/wq5t2KRkKOR7583kuYFyLRCjbuFfVlNQeGSR6Z9rPXGnE7NQSLQdbPRIJj
	OcTbXxPsJt+b305Zy6P7dJJVVdpnNMaZA9aKCG+cgMxPN+uMKbOuW1DIQEXxHRHQ=
X-Gm-Gg: Acq92OE9Z7IHY9u21zxc0vEqs9Lo65ZSzI0Grywu77tDGsOrt/881KcAoDDGITIaEvB
	wqCQVXVVrzfCYyDIn4aruvXaz+PHB6b1ZA1ZLScVtixJuSXQPr3Y5XZh2uCg3pr7XdeD/YTDZY6
	kP+a3+Dn8/fbw5F6Dp9BHVYf5bfSQf+S5B42DK+xUoaaZ7Rg+ntTyoo5D41KaqZ9Jp+DqkJUAm3
	5LoSKDEZrAIgZZsrDMbWuZ4sM9upMJQlZEMB1yh9kTunzyl556MjChloGKmCFVjIy5XQo2GoNcI
	uiawBk1vxMzvmoHzPzlh53HAKchIeij9z7Hc+Wj8JG02kJlam8gmDcqhr0FPXJp7F8+zGHfEZLP
	fSIyKn0w7TpKDA/GzRfSo3HCoOspAhP6znWE8sL0l2569iRQ8nVK8HGMQ4zYURkGaGxWG1/57Ew
	C7T8MsiSSHX2K+unH22yf5B3sfewHuyRBw4YUfl0r8Z4toxA==
X-Received: by 2002:a05:622a:17cc:b0:517:5e32:f3bf with SMTP id d75a77b69052e-51795b9e179mr203628541cf.20.1780888927224;
        Sun, 07 Jun 2026 20:22:07 -0700 (PDT)
X-Received: by 2002:a05:622a:17cc:b0:517:5e32:f3bf with SMTP id d75a77b69052e-51795b9e179mr203628351cf.20.1780888926767;
        Sun, 07 Jun 2026 20:22:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d3a1dsm43897391fa.28.2026.06.07.20.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:22:04 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:22:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 0/3] clk: qcom: add MSM8x60 LPASS Clock Controller
Message-ID: <3j6l3q7sxrwgok65tgkjpkwb6iz4h67rdbuzzv3iwopc4u3zag@qrnodft3j55s>
References: <cover.1780148149.git.github.com@herrie.org>
 <cover.1780197511.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1780197511.git.github.com@herrie.org>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a263560 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=cTwmTnRGAAAA:8 a=OF7aXn1xDe1HAw4HkrkA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-GUID: c4tFajojJ51yQrlR7216Je8sIEY31WqF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyNyBTYWx0ZWRfX2v6fEBcAii2W
 gsE40q1BwIPr5VqXHQkn/DD2mKxFH/7xzMseihAY9E++vEikQFuwksIu3YnO3Sgguj+MSKll8+z
 z6VPG+DchhlIoCbbceok1tENoZw2bqcfiYXHFgeipynZCu41UXyKzem4vxeePeLRNBCvxYSmyNi
 F4mnaqD58xT5L/Gg6b6U3mIpm8Fm8MYbS7XoLDvpWOloWD8Sa5fbQQDLO3iJd+Bnzc8XS1pB+KK
 ho832epa03F25sA3Qm7gMDAP8UyjcaCjlneZDsX3OgXW1qO0/RC3+qAG7VrdKnLqX080o0N66Po
 7UaLa0lh+SeX8/Lhh+AnNoutJsPXUczEgF60n91vYhuBX23YTvgNWCPYiZLB+T6Yl5AT8G/ih4f
 LIc3GBgo1W3qp0ZVGx/ky8RCDBr3zmNg3rER5guR+WmeMxBesxPiadRwfaKsVyX7LC3mq5JYA02
 TdTtDLHqNeyDrWmw8BQ==
X-Proofpoint-ORIG-GUID: c4tFajojJ51yQrlR7216Je8sIEY31WqF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080027

On Sun, May 31, 2026 at 06:08:59AM +0200, Herman van Hazendonk wrote:
> Hi all,
> 
> Self-review (with Sashiko AI assist) caught five issues in v1 before
> maintainer review reached them. v1:
> 
>   https://lore.kernel.org/linux-arm-msm/cover.1780148149.git.github.com@herrie.org/
> 
> v2 changes:

Please send each new version as a separate thread. Don't send new
iterations as replies to other threads (or previous versions).

-- 
With best wishes
Dmitry
