Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CC03F5BE4
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 18:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362260; cv=none; b=i0De0KhF3i676SBiTId0Oc1ZGHVWHfXuHE6nVFTLKxhLBj5YqdiedB9NHHHJ5LbValFZ6TWRGy1Eyd0UENgboo3kjAtbSTFCfJLEGxVK2ZcSaFYiSNS1r8MCDgQGhX5roACg/PuExWdfpfR7JtKx5D1fEGVSwCZU/u+jmGqABm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362260; c=relaxed/simple;
	bh=kwPsWx3Lq+eORWtb/AZEuOV9MdYDT8Y8hkryWQSeGT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4Uh1UbVvW5qCahl/qTK6PMz9UOeek5hrEeXIJryBjCd8oszTJzlUhbo51zdzMjFrpEHeU1b6fhyUDe/8NBDxjTeeZ6OvqM5lLWXHnk2ej7Uf2Xg/Z+jhitax7+mMznMuUqG/ecGjqD50WTG3cwFRG0EIrtFQD/6z3DZ9gmygqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lNUbb/Ge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csgX6myC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lNUbb/Ge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csgX6myC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFBvu972249
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 18:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CcQRmc9BaCEAXdMMGYGlgduG
	dM0vGlhEkoGbgTNTQWU=; b=lNUbb/Ge+fiE6E3fUcv7Jw/FULk4oxkk1wkh3+Y1
	x/hKGfAgM3xzauwD1uGAU/9DjVbFIiTfu3EWo3Be3AtHEolg/IHDqmaEgMs/uO8z
	iSre4KhCH2Qyid8gtY7vz03VaPnXx4bUE4D4R8O2eWwsCfYdKJsYdv9MlzgM/YH7
	2/hFtwwscC4i/YOY6YuG6SrFlgFKOCCKALBi8TJwWjw1ViYpsqUv8u6FI5evO14v
	THkT6gWhTBU/oSiLH63A2g7h27vvFgZgUavkK30JEPuyfzwGJGIQn5cFZnp45Gqo
	4WOZLDOfUc1Df9rZpa4NJReR7OULlo06wc2b1/IvFQs4xw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r29bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 18:24:18 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5be072085c8so903965e0c.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 11:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783362258; x=1783967058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CcQRmc9BaCEAXdMMGYGlgduGdM0vGlhEkoGbgTNTQWU=;
        b=csgX6myCVkRzewoSH3m5Gd4t05UAxatc4YL0uzRTLXyAPNA5a+NTVrsbxSfjQxdue4
         Jd1fIqDdn/76nqOVxn1yoR7f9OGKngm0QhSvyyqaSPhvxSqqPxJsVqvkTn+FmCEHuwXh
         M0Q2zXXgqdlWzuSiUcSnwLElYQGjnyK6s2eTwr/LbckSJHrCJ4HSf6lAfVb2s8CLgujr
         vMoINer4jNqWMZOunMHGuEb8QGE7hI6Irh4iV1RHCvCVqrK0R+JS2GBSRuoYQGf7vdJY
         lT64V70d+2AyI+RzH8dLQ+3hM/jimdH1BaPZVSwgis99WuTswwF138lHkN+EaVuWYDwS
         3kyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362258; x=1783967058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcQRmc9BaCEAXdMMGYGlgduGdM0vGlhEkoGbgTNTQWU=;
        b=Br5yHngrpZNhUoDd5XpXLgO2CPj2KgYulcdHHRys5NYLwBEDhBkOGM5ZJUwTDCjYm8
         jo/OPv3Oj0FLp7q8Ooq/Xv2XY+uqdevYVAlhUYb0HJOmvRUPWXX/agxaFjJpNqc6H9O6
         iCeo2LVkZhInSn0v/tlRfnO+oF+hjVyjXwT0l+aOH/ItFATJJTWrir3Ea82kjOVS7TiN
         p083qHiFd8ACtShwmGyPBkLUEYvuOR3dKkBzMsh1iN+W19vlA59FdCzYFTWwDIsYJAxW
         I1a+vIrPNtHADR0Nr/3Lwh1fztChdTn0PTLPVzx7mNXOe7h94Z8xlp5S/mDpY/CqKnS4
         eCzw==
X-Forwarded-Encrypted: i=1; AHgh+RpEkoJjkizyuG4c5FhsEKJdD1JT0IN0nEsmjKaD8iaGdK1MmFzIjNJGCG3/Ctm6c7gIV0SA04ga/u8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMQufXCN370kF+wLIujgpiaPHUwjgcalcBiQd2IArsgPHNEN9V
	OyQCDGi/9uOdxQMT5w08wpvoE+1yCzZIr+3i54xbl3AADzGze4M/bVazUES/vJ3bQE6Z2ED1KvP
	nfSU5a01vKpEIdZreExrxeBXd8B4SUiKpk8c9nyv60bBrLYNDQmbilMx1+g5JBOI=
X-Gm-Gg: AfdE7cnmcWNW3+nzHjGGNSCCu9OUFCXEJLifiFnOHNmUyaxz0W3O9PrnhduRuxC73US
	bx+yotN0GJQqvQHTntraa/3mms5la4P1r/V9qZAfFw6P0Pb/gRwRULA9XoMb57FN4aswXyEYLgm
	l1itb9PKSK5lhBJ3Al8tSsZqK/lJa8B+hWdewCASyN8hxv8Nq2bFOe72qkdLmqFc3P1974dcZ49
	1jp4oOBa18963SyRshROQjM6APiDoBtogwHWwrJvw9WIa9lpovh/a9HStghGevyaZEyJO6QORDw
	dsiUW5gCl5YzFTBKNMjp3Aot0EvH2AJMKSJXZ6gOwaWABCzFVzCqZNNGd0+cm/Z2dHJmZjcrlt/
	OBYKFAGlppD8Nhi/3R+o30syXJhr2igN7Hq00eK8NZUE3wZimPiqwSh+3xBcOuW6gV/hYylj2E4
	vfoKDs0DO1Ql0knbf3d3GmDzpF
X-Received: by 2002:a05:6122:659a:b0:5bc:3dde:3364 with SMTP id 71dfb90a1353d-5be907c4ee5mr1028210e0c.7.1783362257739;
        Mon, 06 Jul 2026 11:24:17 -0700 (PDT)
X-Received: by 2002:a05:6122:659a:b0:5bc:3dde:3364 with SMTP id 71dfb90a1353d-5be907c4ee5mr1028192e0c.7.1783362257235;
        Mon, 06 Jul 2026 11:24:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb768sm3082495e87.52.2026.07.06.11.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:24:14 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:24:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
Message-ID: <4g6y4q2udludhwmoqc34afwj5svra4a4j5bmpqza7h3av2oov7@6k5r7a4meruk>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
 <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
 <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
 <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfX3ZINdluHV+8o
 9S3RDDPcdJJR5PsU2ExSOig/hqDuO6N4T4uvOAH5VJGRbmyAIO773YMquc1qZIMsK+zhVUYxyWX
 Ug0D8Pi9dHvzSber/JDjUJN7tMXf3jld7x8O3IAptnyCiCnwoC0w0pWDvifgbKuul6kZjjsJfa9
 4QO4guLMnb7LkdL+XCtceDSVrDN6DqCyuOScvsdP/XiXPOe3xc34ABM/1RSkspLyRsZBpS9k9dL
 c43jJCg+kL4Mt5JNMLpyJ+2JPdwNZlQZUjFfs148Eb7jrIlO9BnKnYBorjGhOYNn+jrcUyBF43K
 f6X/RvCY9QZRHR+AX1p10jb1pjsTWH2q0yX+y0bc41mey++cGpXH0g9kmSSycmu0PNpl7xHhXGf
 +yFyJ8I+Ho7+uqEBZQS/pFhw14z9gL4h475c6HIv3PqkUzCbBuxGaw9rb9EPz+u9U0ILQOJWtkg
 lVKGNPCtTxxO/17RvlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfX+QgzFvtH3lBv
 svwZD5kjyNcrZCUOWvPVamrhXmmNjJzytqAo6ZksNzRNFtbP3nOz84YS0y/cMEc07YQT1Z8/rCr
 yNzKm4cnnFNH2MJCsxO+YbStfXLd7oU=
X-Proofpoint-GUID: 0iLQgZRGxEfXXEL9ONa4tgIw9xzjzKdC
X-Proofpoint-ORIG-GUID: 0iLQgZRGxEfXXEL9ONa4tgIw9xzjzKdC
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bf2d2 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NjmyTZ_Ky2fEOGBI-xMA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060185

On Wed, Jun 24, 2026 at 01:26:06PM +0000, Esteban Urrutia wrote:
> 
> 
> On 6/23/26 7:03 AM, Konrad Dybcio wrote:
> >> This is mentioned in the memory map description, but is not part
> >> of it.
> >>
> >> I booted up a 8450 HDK and it doesn't even have MTE, so it's
> >> probably valid
> > 
> > i.e. it doesn't report MTE to Linux. I don't know if it's Gunyah
> > trapping it.
> Then, should device trees delete these memory regions on a case-by-case
> basis, or be left as is?

Please verify that you can actually access those areas (boot with
memtest=1)


-- 
With best wishes
Dmitry
