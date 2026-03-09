Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A837A369201
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 20:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773087063; cv=none; b=E4tKAzD4bExi7ylsxtLRhYDwkZVqPkIO+/WSKIyP+BWXhXcS6V6/LApzvjZCoOj5S05kQXYfJx677WU9fJBiksRK1U00rDh2QrkNNNV8H37faxPMK2EVX2mDUEUj9emS3MxwiOksBQFWUgvGdhdsslIrS2HhuD9NK6OYJeP45HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773087063; c=relaxed/simple;
	bh=77+W6onGKr3yuXE1owevKxD1xkJ1Q2aKB0TyV8zk4Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxK6D7jYDjv0nRUWjYdoRmG+clMzHhXoYbpjVn8Yjd8ymaqFhulU55dYfgamUd8GJcgV7xe1F+KIS3KrKaRtx/FytC7eEPCbxnYepQzQGx9HtD2IXi2qvw4b9dupkP2DxlO/JbaKISpuyieUGowhy/NlCyevkA34xm5O0O9xa7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJz/iZeo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WF64A9IZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJz/iZeo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WF64A9IZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC0QJ744380
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 20:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yx3kj67JSPg0Ng3B0+9c2PZz
	NqeOQez707sJJN1qWJw=; b=ZJz/iZeoy8S2QxQ6UKTlLhimwELnrW07Yi4l9MEg
	TwUj9pTwgW5PgGKpqBnXtr6GbXuJOd9gDZT+kJ+FPJVLCs+M6Z5ImePaT5utT0f3
	juhUkvboyWgS7d1zGh3fCVkLJrR0xJIwmxY4+Ef8/bHSoLG13lq1bb0TKM+HwmCx
	X68GIMrWUsz8RJG+VRjTDt+UtGqXiBEJUPNEzIff8cw0ympV3T78paa6gWiJPg/f
	hBVTy8DLqjjKm6GM7ak5b5hPfOmf5JGTW1Kg8bBCSfEbG47oTnHo+i586EhKJwzF
	FSbRtbvc0LkVg4GC0jyz379q9c/g9KtPxo/NA+Svtl1GZw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsaab9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 20:10:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd858e8709so1342485585a.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 13:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773087059; x=1773691859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yx3kj67JSPg0Ng3B0+9c2PZzNqeOQez707sJJN1qWJw=;
        b=WF64A9IZIieYvo8dg5ox4+Nc2PPnnO4gm2EU+FE1pHUlPV00XajhtyOBRHYzt+PSPs
         lyxX49RR8WdLhcjwyNfesgTfnDVewA0JsOMBUS31YLF4fVavTd9FkFCIocpBN6CpOcNV
         ycLEr/gRlN3hnvoMuX627iwv/qKe0BQCE61HJGxd2z/hDQEfhXdwKhpVq3PqhnuCUZLz
         VEx7Cx48Xba7FfHkHhOIiFsV0oF46L9JiO0FbEMy+0rILJmx22UjTFgz7p4ubxtC21Qf
         ZjeYY/BJVDm/XYLFjlnIKZY+eiVGIBo/AxF3hRGcMh0tOhqU4D5Exe/IlKzufCAlY8dY
         gAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773087059; x=1773691859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yx3kj67JSPg0Ng3B0+9c2PZzNqeOQez707sJJN1qWJw=;
        b=W2uyE4IHfarHxroXzf64Z06ytkgfiOUScHKaHlVRLVfoEwtAW/xGfksuj41iJYR9xu
         B0xoK2JAiV6KctgU2ORZk1Ffx9WyKGIXLytR6ZBsqVhAWWnOTT8SDdgZvKbBgIGrUPL+
         5lcai77pyq8BYN00pBPhvt7EDCfovKksaXqo+NB8pceiwV05mqOsCHN/AWpNS7XA0PYD
         INF3HnawvjkleA2fssgKLQ7c1O+pxAi+P9+TpKI/gMmhgHyuD0iOQOzF6/BJ6GJDpMpa
         UjuRFYXhtmWSEnPiLLsOWo9eBvZk6L5gUdLbsRS1uBH4f8VCtOK2zneeAWdXzyomDm4E
         mu6A==
X-Forwarded-Encrypted: i=1; AJvYcCX44qc6vHtlylfdnR0muwPdX2wHepb0SMSCfEdODBJQ7NpJlqLlF79xWKqwQxfQGUl96jhwMtCnEDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyizAHbTE/JyZEcGpG0IkW47fc6DpbFH4Kd85oxqG835y9G666L
	LBe3O3g011U+c7i4hJ+nuK1zsA0EY0xGr7dEjvJ429a6dz8kW/lZjZCAWn/xZVtMeIG/zaem+B7
	qaJGq0gqEuArM2oZ7rmJBzEYVsSkcZBHbwt42wZNhgZZgVueI2EmHABojrwkq1NU=
X-Gm-Gg: ATEYQzwfhSo2PyHfLtxvZ56CzRx/f5ZSYJfBxPW1Amss9cYex6pxFczkcheGFE2V5bx
	IYnj+dXEtcFn8zlETkEQXxCru6Rj0qFcmzM7BCTRRkMy30BHPk+27I7+syrui+y2+BgfkYa8YHy
	yH2hV3zAHzbh9A5TgINEuFLqARspXiBVDzq9r50CbwrUj4cKm9WT6S4uG+vsa3lEu0K+WmXT+vp
	VtcFRR1IiZUW2Gx7A7IVR9ZzQsh/sg3ctRC97uRBXEwZw6z6u0z2NChHyMxexBmxLsoD3gYkta6
	o2bXPs8NXQc+eE/TTRQDSu10Eux1VxDujoLYwDE/zP9Zpez3nZcljF8GzJ/L4gBJm2to5JiM+Nw
	lK30d555glVaM0iyEUHHNLb26AH82i4N/ofHZfOSaf4Q8TmXmEfex8j1f6hRJn9xvl7FJWxh1Lh
	dn6sPxxwqp3+h5zsSvgrdivgpq3i5o2qiTC9w=
X-Received: by 2002:a05:620a:4407:b0:8cd:8f66:c9c9 with SMTP id af79cd13be357-8cd8f66cdb2mr334872685a.64.1773087058615;
        Mon, 09 Mar 2026 13:10:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4407:b0:8cd:8f66:c9c9 with SMTP id af79cd13be357-8cd8f66cdb2mr334868285a.64.1773087058074;
        Mon, 09 Mar 2026 13:10:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d086079sm2277245e87.69.2026.03.09.13.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:10:57 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:10:55 +0200
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
Subject: Re: [PATCH 6/7] clk: qcom: gcc-sc8180x: Add runtime PM
Message-ID: <jk3rcbl4eissj6ss76qubyo7dka5723isa3nmlmo3ekamogufc@oekatddqylwc>
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010653.4266-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309010653.4266-1-val@packett.cool>
X-Proofpoint-GUID: c_Z9bp8vDhD_GWD-Ft8UgevWGL1hqLuK
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69af2953 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=sO3YEv06Sa-1lvpmPvUA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3OSBTYWx0ZWRfX6bqqyAx0yzIF
 s9S7qDiOEcIH0SfGhaQmdO5EDrqDwYhmRQ3/ijX4XSjcYig4o3keNIFoAMwaQYEt8o7cjhRgYud
 dokELKfXXQr40+RYvK/Oh7i65uZpNfhl1fN949UpB4NXb3M0uYvviL35HxS2FfiXqKtEXk119dS
 K0so8km17bJeqyhBMQuU8i83sMzNGZywIC82LCxLTXXWkIoTjJ5l0fXvPHrs24jZtKK2C3N9Ilm
 1Ll1PeXgZGCdD3jBabAFXshj3+9fahQObvcEfQXIHdtpF+ShEew0wgBS1ZswupNFqVqUUQQVON1
 IbT/4ag4qsbptJXcr1JozFMqjhqutvzVo8WJMD4lp847flEvREI5AwAl8SyoGmEjkDi8uN3lv+V
 y3uSSWohfCP7u453NfZbMyRA/dycF9S2jKHGY2TDih/YUC86JuAZwLrezqlAi0gVI6ZndSOfOtY
 iF63uyZUU8dsr54rBMA==
X-Proofpoint-ORIG-GUID: c_Z9bp8vDhD_GWD-Ft8UgevWGL1hqLuK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090179

On Sun, Mar 08, 2026 at 10:06:03PM -0300, Val Packett wrote:
> The GCC block on SC8180X is powered by the CX rail. We need to ensure
> that it's enabled to prevent unwanted power collapse.
> 
> Enable runtime PM to keep the power flowing only when necessary.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
> index 365943cd5278..073fb1e2b302 100644
> --- a/drivers/clk/qcom/gcc-sc8180x.c
> +++ b/drivers/clk/qcom/gcc-sc8180x.c
> @@ -9,6 +9,7 @@
>  #include <linux/err.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -4676,9 +4677,19 @@ static int gcc_sc8180x_probe(struct platform_device *pdev)
>  	struct regmap *regmap;
>  	int ret;
>  
> +	ret = devm_pm_runtime_enable(&pdev->dev);

Please don't hardcode this. There is a .use_rpm nowadays.

> +	if (ret)
> +		return ret;
> +

-- 
With best wishes
Dmitry
