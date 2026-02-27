Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D052A1EFF93
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 00:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772151199; cv=none; b=pDhD6nS2Ir2iJseChjjwYWkx+vaAJS6FKVJH+STK4Iz+iuwGsQqv+G1VFMF8qPIVr23BBjcNeY7qYHGKVMzWy9p1CAc7OiGqFV/vNKG1VN9uRjvoiG442kcKbdlkJpuwXY5ILBr1F18BZ9boauF1HST7IpE/m8/xewcSv/PklzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772151199; c=relaxed/simple;
	bh=QR9boxoQsSEhcKFpW3lzAtEmOL/uK19/mo6bTy05qxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuExztP6ppAM7zeWCgL8iZlc0J3hkc5fAcYug98F7RAgtmJbuHkCph0p94Q2EZd4cnd5q3UjzR96t641yIDHYglfjpR6yLEutAKkasqC3f+PdKEH2DhoDJbUWckoJOMcaBV18Hp58bXy0K08Eh9o6bnkBs4KtJUa/NhSKLimUDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBt0A/9X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNINaB7w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBt0A/9X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNINaB7w"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QMaWfQ1938013
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 00:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+nhY684CpTqumo3wHY+UC3CL
	/opjCSEWq+dQgfleplw=; b=mBt0A/9XbeoINQ8fCT0zC9FAb999XskWmVwuTASd
	Ax9Mx5YVClJKdeCXxzNK7TtpBEEYkgKuj98FSLNGsJGbxscN+NcV50C7hlWiHRrM
	EA3TB12xjb5VbMfbyxF5GC52wAqWNQCVUQIJQuDUh0y/50nwCnciwIu0DyHV0oCK
	sWF5ip23zzElBw34aCuVYx4KrKslvNXKx/WOxiTmaYXTaPjvbzOBlyryu9afLEoF
	rIH/nkJxKe6d/7VfrmCaWhDVTuEVi2ExZnPkF75zEoI/ED8JObswVbYp59b3KLpV
	4zHvOa/n3NXkI9Dn2zzdb1ZaCXf4Nrn/dbgP73SkYujkxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw238p3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 00:13:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-503342386a8so182790521cf.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 16:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772151197; x=1772755997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+nhY684CpTqumo3wHY+UC3CL/opjCSEWq+dQgfleplw=;
        b=UNINaB7whzMufZJhzfom/AqMZ5DEuzFRHyoIU/d+++gkddt8i6eIoT13N0tNfHJEiP
         lTE/Oraj7gElrFz34BzrWeN6X4Rxk/3lOzcD0VGVEFmw6q+W5E9BidH8i2LIFqX5Sc/V
         jS/2+CAWgrh5RPpy1/DSTuHx+uStdZv6af9qABZk7hgyQ1feyLl9jZH8pkjQ0w0mIEbf
         btflwaCQ1D4tZLQfrgd37cg+zei667Pp0DNdDxPfF+RXoyfpog+1Y5CEKBzWqQcLlwo5
         gJyOjh+jLSkuj3FXffvpiovvtwb+ECECBmL7s5O8qyb/qh46wuJd7GKabT0QvWbeePaT
         m59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772151197; x=1772755997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nhY684CpTqumo3wHY+UC3CL/opjCSEWq+dQgfleplw=;
        b=Ody4YJpESAwA8CEsJWyEzyev9DjYDVKJuFbU5kww3uxJPVY48U9R50bO+CBtZoj9KD
         GptMB+J/jgUi/lOPc1quUB3u9UB6wGXgykvfaDJVURQShOMn7rvtlZ2yVfYC7rijpaDZ
         NBtYirmhSIaY+P3+DNPlorb2lU1YxUVRnJVY4e2awRpr16Md5sc+lImpxIzkamTBwtoa
         NadCFgFodh0YWRe8cENjO6wgfZztJmaYd5KT6q5U3LQ5VNQSSuU5FMLyauShpYVbSbAC
         agQj7rU9SV4anx1eiv+n7gfkciw+idPYy99IRx2Uxm0KHgw4Wv0WStG2l6wBi4qPXSma
         IBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCy/eX2fKmtIGdwTfQGhObkQvdHO2DEGt33sJRlqPZwgfvV5tSb4+oFLRaylBiVYo4XvzNJpoMXpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVsiDE8PLoqLkdaOdGk8m9T97orHOHLzNe2/BG89i7BmDFy9o6
	KFDH4vP5hMLIxZUM8Lbmbev/jlzmCTedNi3LqtTV1J5Kp+60iH6TsrukzOF8dHt/t3U1dGXFiUb
	aKE3GDta65s6F7sOCZq5WJvfqptlyPSfT2g5vu80/cKd0ARxo3fzn6aC2OfwvAAxuPU8stUU=
X-Gm-Gg: ATEYQzw0KFwZCTstaRpMw3GneOIPk2FBQERZktfTehvfLAGOFGC7MABkiGpFx6SM7oh
	AKxVG8yBByYHJb9CHV5RnKnEdTeKmEJdIOnZlKOGXLVUFcdVkxACk3wcTSWOLw/GXUBXMdM3dgZ
	ycrlH7bOnFPoNuUK8mGh7fHic9KC7NuDh6rKl2H7qvHMnz5q5B8oJJ6RWE7w+fxB6HjvELH8gZb
	vDF4qJCDxpMH+oeRIpz9W33icvP7bCTFwnWtUrAqita4C7XRQtbc67jW0R5ZLgupCDyp//uCV14
	OM0VUTHFM4WIw7QmkD2+F1FrbzLiyn3doGLL75kg4A9XSMgrCE6xN941gzsCSfOCgElzq6yTU+u
	8vxJy98zYszFBTDu2KGRRyKkiNOA2vycJyYSY086BaBfLc78vY3+B2MBzp/2qZ08INdTr+Fb2CJ
	k0bvvFFhwkkDCbfbvP8kPDIbMfkudHYGecHt4=
X-Received: by 2002:a05:620a:4892:b0:8cb:50d6:18bf with SMTP id af79cd13be357-8cbc8d6efe5mr127339085a.4.1772151196997;
        Thu, 26 Feb 2026 16:13:16 -0800 (PST)
X-Received: by 2002:a05:620a:4892:b0:8cb:50d6:18bf with SMTP id af79cd13be357-8cbc8d6efe5mr127336585a.4.1772151196579;
        Thu, 26 Feb 2026 16:13:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a10a31bb52sm1407652e87.65.2026.02.26.16.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 16:13:15 -0800 (PST)
Date: Fri, 27 Feb 2026 02:13:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 10/13] clk: qcom: smd-rpm: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Message-ID: <5hzzusf34opx3mk5fxvbj4qnnwtjdmqkxkypsouum6pxrm54h2@tokjr753fi72>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-10-4421dd2f6dc6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-10-4421dd2f6dc6@redhat.com>
X-Proofpoint-GUID: 9TBW602xxfbKn4TntkKaz8GGm9y3rq4b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAwMCBTYWx0ZWRfX+VANG0wUHivd
 8+/KF/rXw6V59C9gVyNzih6RtOVN1NnMO2O+rATDhbpukxpdICHqYUasSImfJfWGYwlc3U1CtF/
 VuV/+MohtFanOIN8fIOewIL7Q3Zje3dWU085rEtbbk7Co0S2sLPDC7GgvBwjK3ShpekR26PItI0
 nqBTB9UKdsQ3rFPXg2Z6Ddx7xvbr58aPi9U1NiEmlo8uADN9Qb55tjaml8lTvf4yprDDz0t9eEc
 EMYUP/aP2syqAcPBrAe/XWDJ+oZYF5Wr6QGElO7d3C0NtQyU4t14wabDwSQ1h0Gskm2NPjk2mRM
 XzpKCYyj2NN+TTx26yh6IQS71tYcShV9lQc0IdBNJMHIvItEdgV4tn5IpoF5ecY5uaQnMyoQQVe
 hy7NLnuOR8YhO1iLAoDlu56Y9rbwzK10LmgIEWAYfzhrWYjIaDtrLhxmrvRUM4puD3JsLKvYWM1
 jTmXJ/4AtbWNlnCINJQ==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a0e19d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=20KFwNOVAAAA:8
 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=1r2m-iIbPs-O4eL_W2EA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: 9TBW602xxfbKn4TntkKaz8GGm9y3rq4b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_03,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270000

On Thu, Feb 26, 2026 at 01:16:54PM -0500, Brian Masney wrote:
> This clk driver has a noop determine_rate clk op. Drop this empty
> function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---
> To: Bjorn Andersson <andersson@kernel.org>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
