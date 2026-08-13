Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B5C2D7386
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 13:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786627065; cv=none; b=SUiJylUCd/AgHaVEYPwVCnn+yjdUKnyGaYKY3yY+PNurHh4d8P5Ek3t161q+/ItQqDZYJ6bQfcWggsEAyeGYmtxxh6kcQdukU9r8NGoSVCG/ITyd58sNoZ3tb22R+TeIVioMrcSaeA3aBqBpIztwyURzDVoc1ZfxgjHhIa21Q0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786627065; c=relaxed/simple;
	bh=CaM6qIrQMavDM/nN4aynYN6SJDtEiDdC3niLVvMkKr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6PA/AX7p7m93HaBeDIOgcCJuZHEy4yTlx+PQtSK8Ra65ffjKslp430e8p0xESzYmdRjUcWXK22YdWx3iRwV9m/W+rjsYtlgsyeiGoySyHXNef5/6grAeAi5e209+W/fbDXwS47o4f0NliVPOODXvhYaLtppMf5wN2eucVqcigQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHI0nq0q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tvt4/z7G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kHI0nq0q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tvt4/z7G"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DCJlhM3286580
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 13:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d4zzu3W/Dezr6dzPPttqVaAN
	idU18FZHiJeoSetOx/Q=; b=kHI0nq0qLJtfnUQWoKxoPlT2YSZX65GnSnNwYZWm
	27qfZaP8RU06stMZQIHjF3O7i3yopXwVRCftLdH4mYFznYqaKFi9jdL4EKMQkANe
	BSBXwHGSULr/+Mh+d7SY2aeMPNZ9gNtPQ+HsrzBtyektpQV0vxVmKcJn5pu089S3
	dzZ9/JjvWlHptWWUAFfytD72fOAwg351RwLrDi6D2M2kDrS9d9rH2hW5WguR+/gi
	VdHPK1lKmJqchLhQiLv7LQ9cW4nHwl4ENjolWhjB/IBSUq+RHeRSx9A1mrZds8L5
	7EKdBcYh2PFqMA5FFj1xa4aoEZQ4XcEJNxHzRGGdwhgLyw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18c5hrke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 13:17:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c01ff996dso32851581cf.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 06:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786627062; x=1787231862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d4zzu3W/Dezr6dzPPttqVaANidU18FZHiJeoSetOx/Q=;
        b=Tvt4/z7Go7xmsrDDifYkdsXoVV7mtjrLHOFK9B9rITHeV2DL56RGHKnLkd4UTsg8EB
         il8j2MmjM/N2uKNM9r0v3VKS0DwsKndx438NP1kGv5zrCpKS06UnH+fezZSIpYxcPkdh
         ZQgiMpP/lMCDwom+179V86hpsnYqDKcOgjkkMomktUEYPX0+qKh8bInBmkrFeVHyCRAS
         OiYO0/MoGPpaCv1xmCvGfukg/LI/SoWOXGmuIpR/61GxHm8r5gBqT+kM/1GHFrq79fKc
         IDyEXwd5kVPU+CP7BWJ88T+kkywiuaRG4hY0b0KPx9FQioLjcpMy1sDsRDa6OLY66TUR
         HO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786627062; x=1787231862;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d4zzu3W/Dezr6dzPPttqVaANidU18FZHiJeoSetOx/Q=;
        b=rzkHatUnxJF/seyQ06lCTjIpWabbJvqZoYpxBv16NQsEtl6phVK2OhRHxW8LkzVoOR
         9hI7tx18IYgC+b8w2Byj4h14sdZvr/NiNzAWeqcrUYsKCgRyXxjREcbh+0ZPxqcdyl/n
         cc14VoIzpo7FcSzhHOJCWA1/QQgCtCB5W0D2C/ey1TOunm9RL2QAhKGd0QUOSNA1GQV/
         QbHlFV0DIg+lgNLsjglR4CE+mmH+QTY69B5NbUAUIR3wh5ynKXVXfW/BmlSP5L2HZcfN
         7bvm1HG9jm8jdnULgmsD2HBmWnhkR5NDIgwWuSXmboCGaSjicxUHNZ+5/+wBgB2d/pyV
         AyCw==
X-Forwarded-Encrypted: i=1; AHgh+RrcF41KI8g3zVH9m5l0a/NGRfYzoIrjEso1OIhTLysGhh5U/gin2187cJcrXQTsdhjUe0B2XDsuScE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP8EASxevHF34dGKUQRWpQVxuSl+cMFIJRgV9w1JtZA/OBs4NZ
	PfBCYsQ5LiGhZD5Gq2kj+Q3TVHOBYA2tCNakhEfuBtsb86BBmH0ggd0ocoLGJyU02BnSYLX2VgI
	Qrcpd+TPgQcNkSMq7d1eLFfbn8jlSaZWEkn+ml3foIhcB5zkOHryQuxpeObt4yEw=
X-Gm-Gg: AR+sD13lt3McBh3Il8fmR23sFCeX+ghmqrcWmrGHKcgLqVFlctA8J6exvl58BurRXn3
	/fejVseiXC2TvhmEDDCl8tK8bDaKVOr6nKuytCMoF6fN617JMMmOHoPG3nEbv6A3PWaj+q1X+n6
	YwZLhdT6Mwl4SLmzqSO1gA/CR9yzS9QnqrgKQiXJKoQ7nG4p78XQwaSuAQK71E2QQQzq6DBNTap
	ueSbHntXUnsHoLmGPZUStgoBozP6vKik2gXuCOEHAIyXZrrN4mDWwHT3mGhhgY5OB+IvdgOafrf
	5gjFc+NDSCemLWPudmaWYEWTGPCVIiHWDez6ztwD9pf8qR/tUYSPq0ukdn0gipmmbbyFMy/KQ30
	wSK3ivILWxYFXcUrKy7r7+3WgykEQj0elOTQgzSVgBM9PCGZ2tLsU9aFVX54v59g3V6q3GkN7RB
	P/27lDvYH6DHeB
X-Received: by 2002:ac8:5715:0:b0:52c:dffc:4645 with SMTP id d75a77b69052e-52d73c1e4bbmr53877141cf.7.1786627061858;
        Thu, 13 Aug 2026 06:17:41 -0700 (PDT)
X-Received: by 2002:ac8:5715:0:b0:52c:dffc:4645 with SMTP id d75a77b69052e-52d73c1e4bbmr53876191cf.7.1786627061248;
        Thu, 13 Aug 2026 06:17:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b453a54944sm455441e87.46.2026.08.13.06.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:17:40 -0700 (PDT)
Date: Thu, 13 Aug 2026 16:17:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Robert Eckelmann <longnoserob@gmail.com>
Cc: vladimir.zapolskiy@linaro.org, andersson@kernel.org, bmasney@redhat.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        m.szyprowski@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
        val@packett.cool, david@ixit.cz
Subject: Re: [PATCH] Revert "clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks"
Message-ID: <gwdrtsvqcgdfccyrmyjgstcrr575xv4ltotrdl7ml4lzsfof4b@iv4lae7446yx>
References: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
 <20260811174822.1f4bcbf8@octoberrain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811174822.1f4bcbf8@octoberrain>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA5NCBTYWx0ZWRfXx+HAYN3WT/jI
 yNflI7Ywtvkg6GCWk/6EI/w1rzO6A9/wbjUcvCNNiu/7hFnv6BOmnB9M+/WJvQJ4XdIzxOfm5ZF
 f/nOv0fLmDT2JuuPGbJDi8pAhKItenc=
X-Proofpoint-GUID: xuPnNcIbObT81o9mdDOCl8gC__zTy8eN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA5NCBTYWx0ZWRfX/+MyiFwOmdmn
 BhY3D8+02aOwwjwziVAFEFXiG3EXtLcVRINoRhvC/alFCdFofeZab342srZMwmBVPOtUVS6MPBR
 YsEe6HAp7YsD61VqG6pwzR66WvvCMcyc0Sx4HGq5qW9R871qO0E3PpeTpKsz6IaoxYAYsXMatrA
 rpREQWKzh34PT0XVT2NS6ex0PktXvvlz3c15gMcUihb+4KCBk43AqJ65Df7pJ0WXNgyNUi2eBRf
 07wlM5WGyv+DixmSk5homG1q9/pxC5qF7ISWbWIFG5GGM+E6oeo1r9/RopF68R+4E2Knx+xqaEW
 i2tGS+62cWlG7DZwfDt9HBIzLzUmbQy6rgpuuXwv3QGfyVIL70d2ZjCzCNfIehEjTmSH1W/+ILP
 xLM+0+HxgPEg3b3djCX0MjPkgsKQdgxHwfL3w6+sdjs4uvDaQYkv+P0nmjnRkLG+D2WRYPjInA3
 d6Z9424pQaf0pA/D+ew==
X-Proofpoint-ORIG-GUID: xuPnNcIbObT81o9mdDOCl8gC__zTy8eN
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a7dc3f6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=_nj0jdx78ndM18lkMxEA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130094

On Tue, Aug 11, 2026 at 05:48:22PM +0900, Robert Eckelmann wrote:
> The same problem also exist on sdm845, esp with sdm845-hdk I saw
> similiar "already unprepared" mesages in dmesg.
> 
> Doing the same changes to drivers/clk/qcom/dispcc-sdm845.c, fixed these
> issues.
> Can provide a patch for dispcc-sdm845.c if wanted.

Yes, please.


-- 
With best wishes
Dmitry
