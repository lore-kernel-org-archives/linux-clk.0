Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8561E3DE5
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 16:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616425; cv=none; b=Tzy3Ysh/6HPNeCy0ToVALarEnpkktw7edY99OoKwzyeaszpprRnxIlTajlUDG1ClcBRH0HKaxWXkhywm16dJp5pTbd3skewy1itFcWbjm/myF+KWCDnzTK3gabt2TJsLxinJTAdEVly1l9yMSy8leanXgbJ67DySQNuxA83qwFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616425; c=relaxed/simple;
	bh=8xcbMvdHouxhA7uaGvMMr+oYjd2YVtH/1NEy0WvVEPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzvDM8CTC0BYRLuJevh0cKxWybs40rJqjmUzyPCGgKFBADHJUCZ1oY5qorQZM1k8TibobgEV670f4+yMdv/pev8naTk+BcSqhemn5Bh1P2GllGj7PwweT5SpDeVQEZ4jqJGEyj9ao/cBWj8MMAtekLInIaWUqc14IDX1lWjX8iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DbEQJlZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3twTr4Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DbEQJlZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3twTr4Z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFWgXb4008578
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 16:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5wT74JYFNoQcS4wI1iniyZim
	QN/JHMCSXvXZOTbFCAs=; b=DbEQJlZUCQ0DWI/iv0RwoFK7HTXK+pjbIfWIdguG
	mQWQTkBX0zYy75o3Le2DjFYlhdXmkn1VgL+MmaIhWeJ13JwylSNZwzATp1ePlewD
	z9neIrgr/RG38y3yvKTTCGospOkypsDkgbLtfHMq/alPqYUYEqWAsRfK6VDLTFIS
	aHxY0CyUt1EqlIHZy1LgXqIwPIWOz4gfD5HhznSy2ydxtsGsFV7TI8TxKl9v5iYI
	SMHLpV2aGr19koOv5ptwhEIAPmjpFnmBG0C5LR0AMvyljm165Vr+N8RDgJvcHgG3
	ZqJBBW+zLOtSoEKi7+/xlRv4Yi2owlLbEkiLXHYRQv/6Gw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1jx49tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 16:07:03 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5635d204db6so6320748e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 08:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769616422; x=1770221222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wT74JYFNoQcS4wI1iniyZimQN/JHMCSXvXZOTbFCAs=;
        b=Z3twTr4ZdrD7JXVvPRmk5YMZo5ELeOnfGFRoqwFWRxtKNZxqbf1Z55XQPZhbcr3hUs
         Zlupx/ScrouQMRQ7y8+0o+FUbrGO+MGGRcVb44Q+vveHss67wVDZv30GPrPy/WHzH22j
         KNcn/F99Gbp8p0PBvTbn1oWWd5Ym0tOyFcqyjKcOKamTPpwv7OH3Zro2FzO8WOof3dA2
         BfvVHrrEFV2yD9tvuMUbllW0EILzYGxp64wEsf//cVB0Z+IgqeKy+t25hPEEXvTJxSGq
         RoQva76xeH3n+evBLv0uiWKYTSLXG4LdUYM4+2SAlnufkef0W2gViNl2z1Xvkeax3sR4
         Fhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616422; x=1770221222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wT74JYFNoQcS4wI1iniyZimQN/JHMCSXvXZOTbFCAs=;
        b=ZRrL1uoOVOzlMtH1ITwDKiBg1bGzUumfrhRbXVELrYv+5DkN0XJ+tVnwBOCz+WdlOt
         E40PwAsJsqNFpdX2UU0Z+kHBgKOZsZLlQ3RvKLvMXhobxSEm64d3xbLSlShqK7ulNDb+
         tb96QYJ7IF75SwFpIIv7Zj5wZVaeUFrm4Thg/iRndz4MAZQPD2rKLVea1cUBab3c760m
         rAnXRHAwLLk6/zP3dPhxVn5L85BPUOPNCsnkgczS6fqWsEYKnTrCHy2JxlyNISe1VyAr
         6rK7+9vtChSGLdAUQIophPKUp8xn5Z0mMK4OaBrN+RXYN3O3pF7sDzKlbUoVUc9Ax0s4
         YpPw==
X-Forwarded-Encrypted: i=1; AJvYcCXFVTSrgNNuzNumnCocxZHvN9cwg88/lSDAG1t5mZ+nEBUhgFbK+0q9bsi+5oQE9CA+BdfadMTQvcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8UZq4/AqjmqPNzox4ULzZMdeN5eR8ukMQCoJtng9IO7Mm+Fkk
	zYf64ZT5chOd2bZU9CG3NLWfwEWQgu9NKp/IELi0xbfsPMCN8qrMOU3Jv72cxm6QZ1wjlxYafGv
	X8nNm+RG/Jx71G8k8UpRKroJFIS55jcMbiCHVT6kG8ofIiTL/6iyoe3fh92GN9X0=
X-Gm-Gg: AZuq6aIlcRwIOuedpye0QBdA0kVPma4idnZXQXtXfQnYkX6yduBxWg6NjGEOtm2cotM
	F4Bw87tQXX1wDYgumIDVCLjiZgIuakLM+k8C5twPMRnheUq4XQoNNMubHfHKpfiKi+c/tHZiD/A
	cSHMrWKvgbX+nBtwBZQQZt6WX8ctjAOUKdB9+YQhqflSrOCvM4BCFOhutbg/64V5V2eoKGIHLIZ
	0oGO0OPuoU3McwP32ucT7OYJQA9KZTQSoWCCEd80ZaTugcioT40DZopweCqMrAYc2RnboAClqMS
	5A7vcn9hb8anBeXtem+wN6f3D4pQ3eTMB6W10EZyfe3e56pPUY+pSEYwgJ9J0CxmmiyV9EEU+vk
	scyO013+a7i1Gm8iXSnH38NNbBLDFmZNob15Q1rnRfW/Zj3J3PPchAQ3G0ecz38QxsE1lH7I2mf
	/5o7j8iDSshX4xnXDt+DSuZdA=
X-Received: by 2002:a05:6122:7c7:b0:563:5070:ab4b with SMTP id 71dfb90a1353d-566795c542cmr1437737e0c.14.1769616422295;
        Wed, 28 Jan 2026 08:07:02 -0800 (PST)
X-Received: by 2002:a05:6122:7c7:b0:563:5070:ab4b with SMTP id 71dfb90a1353d-566795c542cmr1437707e0c.14.1769616421853;
        Wed, 28 Jan 2026 08:07:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38627876ab6sm3997671fa.49.2026.01.28.08.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:07:00 -0800 (PST)
Date: Wed, 28 Jan 2026 18:06:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: sm8750: Constify 'qcom_cc_desc' in SM8750
 camcc
Message-ID: <mpb5lca5n63vyp725nfvhzcyckjzfw3qxhjrwrhsxvbaykkcta@lhq6t2guwm7y>
References: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: A7qShYB2AFwSeoLUf6KvZDvAUo2HyvHa
X-Authority-Analysis: v=2.4 cv=duPWylg4 c=1 sm=1 tr=0 ts=697a3427 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LBVU2G7aICa-vlctToYA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzMiBTYWx0ZWRfX3JZ1V4X/toqu
 JSgJCgKEdsCAmNCC1kq8uxX9kWk5GihNxi/HlbrWC8hC87XW2GsLSukaT5kikUMc069nyq+cxi0
 1G9xdp4sQleBYNWi+Pu/n6a92usn36uHw+oMIDSArG+cqT9tN/6kcd/DNj68/yZ50VGG8QR/hTb
 CqZ1HqxaQqSyhHCnGnkAx1uTIObc+R1NNSKJgQOWft8paatOvFGbWvU+knlC5+2VBOqmEZBxwse
 iljx80hFrwIKb2aburnP9Dqggq7jfbarr/bUVsBdZ37YrUpyRF1+2qzuqMWf4OW+LHPjV1H//pF
 4AmWFiPAYg78cyBM2WEWnbKWw8ieq6Dd47MU9/Ibg0Pssj9LBwPLoxE98bKqTksWazMp1CkVvI2
 ++EmdyBeafGrwLalEN1hnxKN5UdOj+dwd7G7henzz19k6bC/hyghznaPwtZ8ZkIK5TOxoTAL/mK
 kVdwhWWhekrnDsOCrFA==
X-Proofpoint-GUID: A7qShYB2AFwSeoLUf6KvZDvAUo2HyvHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280132

On Wed, Jan 28, 2026 at 04:43:07PM +0100, Krzysztof Kozlowski wrote:
> 'struct qcom_cc_desc' is passed to qcom_cc_map() and
> qcom_cc_really_probe() only as pointer to const, so make the memory
> const for safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/cambistmclkcc-sm8750.c | 2 +-
>  drivers/clk/qcom/camcc-sm8750.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
