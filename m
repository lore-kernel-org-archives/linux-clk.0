Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E5B2F7444
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 12:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766578912; cv=none; b=WAIU+MktlGDxOeNIGOA0XxOiMdNe/TB8c3gP9Sn7Yssec2lPR3XAxfNQ6wtm4p8QQuytuVhfAATXZfi/olDfb5Urh5SdD4Do9tMlRc9bsjFSJ3t7l79wN43fXY0D7caVet1G1Zc3vaIQC6yQp0SkCG5dRdCig0ogDWMQJ7oDLU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766578912; c=relaxed/simple;
	bh=KQkVNIoYZqAeYA3wunRzrFguvDuMZpHHdLny0Yeuhzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0pNrg4jVrC1yf6RuCJ9QlVRXZgFMug7KYZKrZmlr32Q3NT1uEKI8YS4UzVe+RHIuXzWHr3+1M+i5YTkokdOnWGkOBwOGxuKzBwNlsy71b4Pft78UG1CTlPVoPqfc8t0tsDLHAv2YZZQrB4rqF18kue/AF2Z8XQc1rKxxbiBbYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gwCKLWVH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bb/yW8ZI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gwCKLWVH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bb/yW8ZI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8PCvb721286
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 12:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JFFP5s6W87N/1+zfMWgQ1GNu
	xW9vgJ+7oIu8wbOa65U=; b=gwCKLWVHVCee5ZkAhSP/F8qvlmBeFBCXh0bMt5j5
	dL8X/CJNffu7BnL8cARMRHV8Uj+0qrfhPLq5LUX6xYIeGGCA0zPvwX3BDgVXqRMM
	xscnh5CVktdxeF91wfw0Bhud2d/GlLSqmRFfgbngcdEOOr9xxuq8McFrpqOwrvyt
	wbHjwm/rAeqpl4v15DfdGtZgaKgfuYM2V2u/QZqpcYHDXtgE4tIRvTt7WRKu49gq
	kUy3YQbrqCjEY8ToKK8hyAVZqT8otPb305A2xkz5wWdytEEzhQmLL55Ell0eCdoK
	pzkMCCvUl/bwtGaQCTmUQY74H3OCAXCl5BnUCcE8oZX9lw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mta6jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 12:21:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1f42515ffso141241991cf.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 04:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766578909; x=1767183709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JFFP5s6W87N/1+zfMWgQ1GNuxW9vgJ+7oIu8wbOa65U=;
        b=Bb/yW8ZIEnza1K/HbLBa/9De0SHrs0372+eE6ViWjcvhMqQVq72SUfIHNG4uJ6oPmN
         yNbkdR4DYsJxoOHbBhlGfk/s1QTDy6SLPBGAO5Lb/la8KYGJkwipTuucq4jl1T41HG7t
         grBZHsWHrnTNJNnDWktwx3YCRe2J1ayb2Pkq/peqt0VpGDtEydb/KPUU1Pooo2ghLqbm
         /E31TXZ9lLVg8fZSCVM3zIJt4CjrFT2FtkCXJFDEl0BErO5zGb4E6s4uSUkwWS6u9XLK
         biiJaplbcsjCgwbizBRzTNoUDQN4NZYIvhv72DnPY2yFZA4GwTA7AdMFcCPw056sBvxa
         F0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766578909; x=1767183709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFFP5s6W87N/1+zfMWgQ1GNuxW9vgJ+7oIu8wbOa65U=;
        b=QU7LkTKxo+UkdB+Lfjs7kzRINcpm/B0EIcd10dFtXOHS7rr7M73C0aLogY/81/RGeW
         a+slZz8LwDAwQUDhG6PgozKnJyanemKLc6hG9f6hFKLOcRAf+QTLuErN0V1wQfK2qMsO
         dQMCvwxB7OmxOH8N/I0pSOy7PNfEUbyXvUgbgAuF//I0O4sASIt7UPOc6265Y0c0Y0uo
         pcsLmpjeus0BiIshgnBALUSikzEfu75xYF5PS0rJFisUVG6bC6330MejTH+K1wyEtdwN
         GtuyBrGjtMY6+4i8gUyAORGWpYlPjWOCztkPQJDuZ7BcAi+L6vriznLj8kS2Pei5utrZ
         xzhw==
X-Forwarded-Encrypted: i=1; AJvYcCVGlQdu59mrFsAqsxS6g44CUcNLZJSx/Xb/MlFRTlMuBqO79L0PI4BvD/NMdXLAM4qK1gG78vvZ444=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7NXdcKL9OriDfeRa5JOo1N8I8da+8N0NYhowLRAWTMrnJXOqu
	SqlQCta3Vm1mzmI7gLZoFQJ4odKKM0EA8qCglppaOZ2QXI6SAlkFoL9BHG80rnAn6ChHZTHNQiZ
	0+Vf09RdMEfurbo1P87gL2xnYpr06/pbmhv/Gr9/4DuaRX9DlRwNaSyKViEhEF9A=
X-Gm-Gg: AY/fxX46yuGqHoCIAPuXgnOVVp5dVmLSbiFz8es2ReqAvFjBBw2xeuA9ZjcIbkR2Shh
	hXZXbrEaSsSe86n9qPvB/U6Lo/q4xAUlsmlWMr2IHNLqTmFpfOmdURL1G3Ms+1UhYjDZppydL5C
	tJfYDc5VTHHhswfGWW5AUYxpEiCKkUPWGe1HIS+UKMHNnL8ESCTyjWns++ZGWmUY4OjglPcVwPl
	lWsuwSInBejsEGjjXRt4ZRdrRV7kCkSHBY+M86fzTmL95cPyuK9Ev7bLdeUBfallntQQLrCq4Wj
	8sNoBVavcBOUvLNLioFY2nDoOX4uBc477WvRHBHvOKLC5pYFbTLxQBKPphxaI5RT6crA4uvjhQN
	7QeG8KRfcaa85tA5GD23jD1nDKoL8ucxidSgdg/Rh/wE1X9rsN8kLZHrFzlWh7vRDyJ0hKBA6pt
	MKJZNcDGfl68F8jNDX+PSXed4=
X-Received: by 2002:a05:622a:5a15:b0:4ed:3e3e:a287 with SMTP id d75a77b69052e-4f4abcf3e29mr259174381cf.24.1766578908741;
        Wed, 24 Dec 2025 04:21:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiQGFk5xnltCfr0bUaaoksJ0Dsy0sY1qB7Of/F2RoVpncDpBTQNaDkpB6NU0l+sxTGWsMlmA==
X-Received: by 2002:a05:622a:5a15:b0:4ed:3e3e:a287 with SMTP id d75a77b69052e-4f4abcf3e29mr259174111cf.24.1766578908295;
        Wed, 24 Dec 2025 04:21:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d85sm4807529e87.48.2025.12.24.04.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:21:47 -0800 (PST)
Date: Wed, 24 Dec 2025 14:21:45 +0200
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
Subject: Re: [PATCH 2/2] clk: qcom: rpmh: Fix double array initializer on
 Kaanapali
Message-ID: <oajs65zfu7gnskijpuvmm64qycw5viuqekklty5yowk6jwikks@jymfpp67dnnb>
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251224112257.83874-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224112257.83874-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694bdadd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=snvUICUIuoXJ_myJnVgA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: wJ8YMt2OXGEy4-lrx-BRuMif99P_aYhH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwNyBTYWx0ZWRfX/iJV9I6e4nLn
 EkyJGxvddC/E50brcFnDHI+T09FNMlex4ox2SCmv2gmm5ACdmMmC7sR+RPHImRkLtZofgWkVLPv
 DxelCdos5PKoAdtgP8AMeaumjZe+QC8zOwRFF8tAROIhUxIJ9mNKDZv81BI+RZvGJNYZvR+M2Js
 S1O2NPVogKAQ8qATjyYCkMrmBHGMvRiK2omroyy/v7gKFbqFFCQuCJncXLAvLk5Cpc3bBxE4xqm
 aNPZ9m3SfC4VHulqEiyu7o1qZAK23OJF4dNWBQih5Dz50s1j41PdaIJuXpc3uzmKQMSStD6G9YQ
 DI3+4MFJYAm/PrCKXF3NjZ8KxF1EL176BOh3UXj24ZjiAFevXlzSCSm6fHfmLYd3Z+ekI4iapmm
 UWpm8s4DyBGEytM7wPQT2kJ684uPalYdgju73c8mGQsdNmq1pCorjht2Cne2fb9O5gt16yXxsy2
 w1vdUroTvGUGdLyMZsw==
X-Proofpoint-ORIG-GUID: wJ8YMt2OXGEy4-lrx-BRuMif99P_aYhH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240107

On Wed, Dec 24, 2025 at 12:22:59PM +0100, Krzysztof Kozlowski wrote:
> [RPMH_RF_CLK4] and [RPMH_RF_CLK5_A] elements in clk_hw array are already
> initialized, as reported by W=1 clang warning:
> 
>   clk-rpmh.c:932:20: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>   clk-rpmh.c:934:21: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: acabfd13859d ("clk: qcom: rpmh: Add support for Kaanapali rpmh clocks")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
