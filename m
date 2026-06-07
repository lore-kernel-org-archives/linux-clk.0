Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452EB2F261C
	for <linux-clk@vger.kernel.org>; Sun,  7 Jun 2026 20:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780862782; cv=none; b=aAHnDwBlC0PiApQl4gXXSrOsq8BBhaeQ61R4+imoBx0EZ6XnzOhPFQSkBv8nhu1SXbCvQ0nj4xK9E2uAgL1Yj4/9lN/zur4o6RKVUEQeB9QolZWd8wuZz4b/c/32/JAl6ZXHgF9BZlSm5EheWNoGjQfr5/4dEbfzdXly3pZLTvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780862782; c=relaxed/simple;
	bh=/dSri843urCQMocVt4iX5/3oh3lf3me1TQOi4X3CA4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBrJnDnBPOGj9bdhaUjOjhSRhHL5C57Kn7c4f0+Kymyzkw6VualbChsKjurGGjts9McOGI+MFZLj4mF4UpkCcjA/sbIqUZ0ETXPClenlFL+HEj36qJ8m1HjSRu18M1woI9hHxCsFa7xZrhrUmoAY866SgM7kZVWixrT9LgncSh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nudKNXZm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ykk6TCYV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nudKNXZm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ykk6TCYV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657I06YA762588
	for <linux-clk@vger.kernel.org>; Sun, 7 Jun 2026 20:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ySrjtkrN4U4WBwoTWWvvislB
	tDYzErtLRzA4YICPT2Y=; b=nudKNXZmexcW8Fl73NINkt/SmZNGU/gxxjmGjnuF
	6mL5O7IlKQCoClkoj0Ban32h96eV67duaHfhenRP8U+DJNzMXGbNxJVEe/Zqenyi
	SaWp3+BNdQ3/CMr2QuFjRCvVZYm7pDzVVNN1zpHYE7SLpamoiH6PkNPWx4wPMdLZ
	1xNqK90036m+eyNxVGtB1kHUpPorBN4Xm/LPQHGxJGVy3ofXVztVTlB+zCZ3fCAs
	bELpK8ViYFfsrQz42SGeV2dXZu/CW2OHjdtBAJ0fxlZP5RYnBWDWPrURwdCasqfo
	jZZ8a6KYIchDP9dgmsgFYUOITwqXNJ7NRVAGHwq1WFi7Bg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadvd10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 07 Jun 2026 20:06:20 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ab02fb4f39so2391979e0c.1
        for <linux-clk@vger.kernel.org>; Sun, 07 Jun 2026 13:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780862779; x=1781467579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ySrjtkrN4U4WBwoTWWvvislBtDYzErtLRzA4YICPT2Y=;
        b=Ykk6TCYVLf3CqN+VYjBJ3kyfBHfPkd+OHnqWzqFPt47DEyeDMIJciyfXVJ3mZftJTB
         sKy3vA9+w/MtTI/en4sb/8Ks8Ktb7EU0xdVMf4dL5nn+wfA8U5i7Wx7XWmBHh/xqt9bK
         jwAT6rgPCOsIoaKBj7euRcRodjlIG8EfhIwMIgnTALWwMrGnu1MDdMshCWQ3KSH4EY7e
         pZ1hQEbj/bTfh+CnuOhbckQrXAGVoNjWpnFIN8kHNr6hZYP02BQmzukLebBIkR9mB7c3
         yh+NVelWJS8qQn3XIVh5Ml7WNdGE8KyXpWbpZ3Mriawoan4u34HmrB597X5dvQ6CWLOt
         0nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780862779; x=1781467579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySrjtkrN4U4WBwoTWWvvislBtDYzErtLRzA4YICPT2Y=;
        b=Do6eSqcUSGgIgX6tcqMgPAR9o+xBmtDJNKQNYiaAAJiSy7pTtBJFxP1z3L1TBn858N
         gNe6b9/q9wEdraIK1QcO1zTgqgDYWo+1oyjb/BI/rwqIEGDfkUyK4m4QwPcmSdWcCjTX
         Bg/lTE0xNcezsuDmbVU1pijCFyb2gQ3eCqeBIv4eJasVx96bS0A6kcfGMSUQIdBgDzK2
         6vrwPslgZzuENZvszLEx5NRwNwwRPSLg6+H3i0gSjisvw9+RUvMZ05T9HRtzaS61l6CU
         SYsilUqkfV0ax0tm9JNV01VOBZJBqOP+lp4ILiBfSfbdq7AklwHhiEXGow0vpVNyDgRu
         RNAA==
X-Forwarded-Encrypted: i=1; AFNElJ9bxNZ+bLOM5IygFtz5wGX9xSAuE/hQtTdaU7/rpZT79rF85Po2KXeQPrU8UhBXchK+B5khidGZrxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrB9EZUVQzNOv+Qov08gtONclfyPh3MODEbUJWBicrqY+SSyMT
	Dd01GmSftij1lWmDN4qvFBKi/qlm1e+KkUoi7+tbaaL0LtcF0ld/spShI8PJ3zR0UZMJ7CElQMf
	2foBf07MK6tZN9sVP6Skvz09A+7Iheq2f52HuFxKQrSsfP7qiswZlaIUybmnCyWMzPuLiNDQ=
X-Gm-Gg: Acq92OHqh78JShA+/jzkr3W8IOTv8vV1wOk7akiVvq/8yhWF4KHbw9Zr58OpvLKRRlt
	ipN2ujf0rmNkMINdubCHtk83/MBwBmDp5ewTKVntEb09tZAwxvT5D10FUMn4/GAh2Ga1M1ZZMEw
	uy6EdsDZZhCQ5HzYNSaKUGK9uFkfp+tFamCQRR1rPd5nRX0GG59wkTs+1T/cKvuSS6hkvktIT4D
	4/CVFL6G8X/3fr4IXBorO+oC4VyehqdaX4rUs4A/ymqLVBBg62RdN1txg5wV/rKCXMygxoGoAIL
	LgY8n9ZvockGBfBcXtBFYUqbJVjpxkiJJkGWtqabUb1lFze8vH34VSZYVcbaVPzWLLh+F1AsaqG
	Rm4syX4/zMjla/glXlkW+I9qmV4LBgBZETL6cJ6n4OkiepCLYCe75ZQ6MQO/Yw1PbUvmT7vTbDF
	wV8zeVD3YCCN4KhSA/J+dwJieI2DSqnqyjb1lvsETbJkB7bQ==
X-Received: by 2002:a05:6122:134f:b0:575:e9eb:d879 with SMTP id 71dfb90a1353d-5ac48699ccdmr5535555e0c.0.1780862779321;
        Sun, 07 Jun 2026 13:06:19 -0700 (PDT)
X-Received: by 2002:a05:6122:134f:b0:575:e9eb:d879 with SMTP id 71dfb90a1353d-5ac48699ccdmr5535544e0c.0.1780862778808;
        Sun, 07 Jun 2026 13:06:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8edf44sm3228662e87.9.2026.06.07.13.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:06:15 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:06:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Phillip Varney <pbvarney@protonmail.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        bmasney@redhat.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: a53: Corrected frequency multiplier for
 1152MHz
Message-ID: <vvguw6izixyignnsen7rtzat7xukxpf6a5632lyh5udjisbzcr@zb2ngw2ub3ip>
References: <20260605005502.313928-1-pbvarney@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605005502.313928-1-pbvarney@protonmail.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a25cf3c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=3JEogiOhbz56tVuKwNwA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: yrv2Sjd98ztOLEFX10lCLOuuCaIZF7BT
X-Proofpoint-ORIG-GUID: yrv2Sjd98ztOLEFX10lCLOuuCaIZF7BT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwMSBTYWx0ZWRfX9czeDyzuwSvb
 a6OB8lK13jmT/7BFOk279P3zejC4nL8JCIdyQmn8N6hLvS3zPVBQ80WS7hcGcOAsHbn5HZW5y6E
 Y9euFu/wV1/H2HuubrrThAaOl17+OFufsGPtEY851PNc59zBULNh57GVB67P6LKZHCCNlqvjlxV
 R+LPo4N0uLtoWHlEDprQ1xKEL/DqN0tVt91Dxp6HDD9EBfQCUdplQwbu8F83geF5wMIuD9xOzr6
 pPsLdAgs2YL6az48BH8x13GR9sLTeRYWNr9rpv1NTrwIPsIwf1QgGg87Ed08kmLi0V7dC/ti7gn
 QiowU1uPWjMxPQH5NNs3G/o0VEmvMO8XkVfx0Ka1nPFKTkptqy1ugG99aMkatxv1Z01ZCagnW1p
 htCkcpohrF9NVNGa3JxJCotA/3ED6L6oRZRV4XWHGYHNAkqStWTlijVnpKksgwqIWyJBRzw3spD
 tCAv1Enz7WY4TfogQZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070201

On Fri, Jun 05, 2026 at 12:55:45AM +0000, Phillip Varney wrote:
> The 1152MHz frequency entry for the a53 currently selects a multiplier of 62, giving 1190MHz. This changes the mulitiplier to 60 giving the intended 1152MHz.
> 
> Signed-off-by: Phillip Varney <pbvarney@protonmail.com>
> ---
>  drivers/clk/qcom/a53-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Fixes: 0c6ab1b8f894 ("clk: qcom: Add A53 PLL support")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
