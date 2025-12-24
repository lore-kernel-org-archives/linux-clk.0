Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905C731AA9F
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766578874; cv=none; b=AeYG42a8TE5OT/6rq95aAWK1VWYqQulLP2bWpzkM/bo1wl9XUgl2WZzgQdBTVd0p1ZrBgOJg/2siNzSwTX6kXgOyisz6BTd1YYOZhyNiJYaDb54hz5MswruBjvEfZi7rH3dGHrqNr/urzBWtPrKR8Hw87Z0S0YLNxVJ/oYmGnwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766578874; c=relaxed/simple;
	bh=yRGL8r4ZMsOqfgIJea+g+Upcf7ZSTpqZakl3Koo8zo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikZC6trHUCjbqeY9XSw/2+FSeh35yqNDnrJ169nEJYX2o3/eSmFxXoWuB2+c86VaKRx7MxetK+F/qF97mjbkDXfWsFPeZU3qJPoqEfvVIzyTAyJs6E01IZbCckwdJy8u3ukdfKPMSi7fsigQHv5R3MC6q1ToabVPIJOklUq5GTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXeJNtBC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SZiIAQm6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXeJNtBC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SZiIAQm6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOAXT8S1599723
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 12:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lJU+pblrkPsR9x3DzesoKGsl
	EUt4CYwM1Bfa87PBMMw=; b=jXeJNtBCXuux2HE/POJ/vPmZzPtiGhEvQQQeGGzn
	OevjlSl7YOovP/yxvREV6q1OFEIFbv/NPay9CzzguYGU2e7sejWMJ9V44sM57CFZ
	ObR3Uv5kvB6Em5HJoVkbybCfSuqb41xVXLsls6WvF/+B2broDRCQK1dBIOIvp7o7
	PUYZq2gYGHvIZ0anevRTG/+2joQwgcLATloGfSexgqzQMB3nX6ppBwHrPEX5vxW7
	zQBF6XhASw58MZezPZPIl5dN/7+YxtxJwVPZ78DdJxHDjfAdhKnKTDgTSvFicv1W
	2emu3NojUnd1TW4fICILLWJ6+gVr3rreA2hFoqYiC/YMCg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683hj57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 12:21:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a3356a310so162198186d6.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 04:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766578871; x=1767183671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lJU+pblrkPsR9x3DzesoKGslEUt4CYwM1Bfa87PBMMw=;
        b=SZiIAQm6MmFgnM08mtE10neZwvkVMiI/spyO0EcDCdE18NuyR3YSJTbRtE+RVKR9dC
         2HcSacIfWgroK1hFugS7f4eTOZk5f9pPd6kt/ANA0hGVZXcNyse3sfPl35nGYKRj1lRT
         PQHaoW2PyvqARPjIdMTGV0UnA9V6fXZFISpwd/xobsdEGv0H0BlqMiGizH4uCkPVQFu6
         HYjHOt/Emo4yWm9GVWtU1rcfF3D2npUUGGP9mrZXQTkdsTfXCh4ksJ/Xm99vVZK31VQZ
         8NAp1aLV174dSi1OejsawsqOX5GXB14fEzYAsljVubvZsVZtdaZ8hgqorPyy7PZekghz
         pxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766578871; x=1767183671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJU+pblrkPsR9x3DzesoKGslEUt4CYwM1Bfa87PBMMw=;
        b=ECLvwFafySwWtf9olA/+HNMFItSpa2RCGpYceAr1Pp1wxPHGCzCIDFZ0u85EeM5tYp
         d0oOQ2OfFpr/PEE68T8g9zR3QL2R1WVtKKpR7CnXomeiTMW+if/50H4FgdLFydOUdDov
         gJ6qSMYO1WzpEzLi5mgAZ+rwnLOrtdzl4rcY7kcgOxyhRw+/dqpv7CPlcIRoupyVKvZL
         6ynKpOxsj5zujq0VEUHLzeb5goswBQE5M2PeqT2bqElPTe3CjdjPyuIpWg9mhoQ6F9xV
         ro9ZIOC3icoHlajRxLC0VKER9rsE/CkIJSzd5U+pGR2TK52I922URIob7VmoLr0WR/7K
         W3BA==
X-Forwarded-Encrypted: i=1; AJvYcCXFUFx4QQXxtWQWvQNRQ4UG0Z9ANYprK2ORGRL9/sGhyNGyYclxK+7Sv6/+jT5QF+hl2AviskNBqrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFvpEjGGMmhbWeqsa3I60Cxu1ymFAKn7cLRxUzhtAnY0NxHDey
	zHEkQcWcZESffFxY+b4pQfHT1b3o+2FaDZDXhIrNJJEBbhL57wAywfjK8QGRqmDiMRR7DaPsCcc
	km5Ld+tZrLB6938+OoIygAljpI+rabDnNhJOgAXIWoTdye1svNMK081c8OOSnuvs=
X-Gm-Gg: AY/fxX71W4Yu1/F3NnhI6V5UkbR6GxTlgYPPezOWxaJhayYNNDYPtTxLDGXHY3oV3mN
	iFcBBEG1kM7Sg1z5YqSe8CZadNNoq8yQajmxvsFxu0dRZH+8LkgMRwE8ihK40mRMTWwlnxZXHIQ
	bXrb+HXptIRCcng1CPFG0Zs8r5UIX7Dgc2Whj0ZzlapkJ0CXqzafai6U2EhwO0tnRAqf9sHcAUD
	lTOi3R1KdnZTwJ7+9BcFj0js003mYMsn6ODjP/3fMKQVwf/XWbjk9GHR7auhmldkybAEBxaipCB
	vhjFTX4PHQNgvw5olJIVHsfjMts3wHYFixgwC5sw3l0K5HDscjX56MdrZ4XpaAXrf9lWR5JrzkH
	jYXup9JbnHbqA8wXug3jHyjNEjckneeB4dTzdjVrWfkR0cFQzG9vetvGC2KDhnrYxKAzdBKNpBb
	j7tusg1MJO9y+aL42j7catu0E=
X-Received: by 2002:a05:6214:3110:b0:88a:568b:f4af with SMTP id 6a1803df08f44-88d828162edmr291355986d6.23.1766578870759;
        Wed, 24 Dec 2025 04:21:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEewmP76uccHHzyVy3OhdDBMJHCuEKTJegmcNQywBFxh1mQ+oQJFZoLdNe6WJFOzeCAjmoFOA==
X-Received: by 2002:a05:6214:3110:b0:88a:568b:f4af with SMTP id 6a1803df08f44-88d828162edmr291355646d6.23.1766578870329;
        Wed, 24 Dec 2025 04:21:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a181beb5csm4864481e87.0.2025.12.24.04.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:21:09 -0800 (PST)
Date: Wed, 24 Dec 2025 14:21:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] clk: qcom: gcc-kaanapali: Fix double array
 initializer
Message-ID: <6x62fxpyyy3bmtivbfntuqym35ao4x57jv3ijrkg7wwpjioh2h@pykzc6zilao5>
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: 5fqOLABs_ekCAOm48DFYN1LVHEswp4wg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwNyBTYWx0ZWRfX6AXQR1Z2Fpf7
 odIra+jz7XQM0IuMkaB36A4Cp8jBhrkBS5YLz8VYwTR/1MRLWyPo3A5MX+8cj/GFfb0BBII7p2v
 V7uNH6Qg2IlLvCwCKe/FY6u5xaOrtZafTnqmi6hpK0xK7dy/mWtOdbPQfKQDe+P9J0qSotSgvSO
 mi0qA4h4pKwAxEnuQEwmJhBH+8SpMv3rx79ogXpI+j2gO3z9kYNXUKlydjKTcDk1/9qi2JNF/d1
 96VemxHNka4zl4fDqTZP7rEC7FIfp9WRyU9EWMfGNu+vbYa3YWNKJglZ9fNUtX/AQdY9cqZi1x3
 /iELaDezmInSE5H/HoMbzKcChnFKilELcSIC4Nr9DmSTcq52vY2VBmmmtgSSWPrXszyn5B2ul6D
 gJ4s5J1U3fWVlEVbpft7PzpnFM1Ro1OgmvRKCPVlDzzlP71/JsAcBnLaal1JirFklP13PrfMVtL
 GNTrsOoqOUBcX5gggrQ==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694bdab7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=486DEghy8GcDG8TY6xEA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 5fqOLABs_ekCAOm48DFYN1LVHEswp4wg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240107

On Wed, Dec 24, 2025 at 12:22:58PM +0100, Krzysztof Kozlowski wrote:
> [GCC_QMIP_VIDEO_VCODEC_AHB_CLK] element in clk_regmap array is already
> initialized, as reported by W=1 clang warning:
> 
>   gcc-kaanapali.c:3383:36: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Does anyone even build this code before sending it to upstream?
> ---
>  drivers/clk/qcom/gcc-kaanapali.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
