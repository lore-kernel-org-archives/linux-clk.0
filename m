Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C222E3EC2FF
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 10:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778063671; cv=none; b=KuAvrIHbax/+FagzSimecwm51uQXaE1M60ZyybMqzNgFjzrK4dokcSDa66avYH4VUimYe2mkWEIc1LBQqGBkp+frzhTPOGx6/HNYndpIRYYsJJ26GBruxw0mMOvbNit+MNTGfIathZsVfcu+kHO961d0E/l4rLJkQnM6Z/J8myQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778063671; c=relaxed/simple;
	bh=8pD5Y2Gw1xXO6MNf3qMxfxJoU4QawtyS04q9c1OQ93Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJ4XCmtrd7DVIZte+AX9tXyG8tlFTS8C+nixO5XwmB7xnIhjzeGPZsiM6nPGVfaeY7vKYs7TxMtZtvUjVo1M4eZuo5J0miRA1T+HvQDnqBePx8yzXx9tDXCpeER56g56A73IQOhX55IQWCELlRyJrIqYseST3kXSUKU2F52whVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaCPXV30; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKL+MEYy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaCPXV30";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKL+MEYy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A02KE1985753
	for <linux-clk@vger.kernel.org>; Wed, 6 May 2026 10:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SGXrGDHADy4VW0xAVeipqzNuBCg4PRMApMn7mO6mfPA=; b=WaCPXV30ob4WS8PF
	rWGmiAbm2TAM5Nx+VJqKv5GbdxsX8F5slc7lOzADZX6GJE9ryq1tkGvqWymy5Boy
	sAgqwGnrPg/Z2SGuv7XZ3ojUGE00LIPavhRijzteynWMlJiJwDnL6R4JsvQZxi+2
	AYS5EsmO/lEF37Nj5byPt3rMQbMiAzLtrIcg5n6q7zru9BAVQCW1fSdVH61NU6A9
	UhamLeGXL3EctLlGUm3v/idq6PuE7rqXFsXf3xyWBWaVqCWh7sjFbPMpVh/fAAAA
	ved//T1wgveYZh5pvnJc4QURIA4e1KC1i7ET02pAWtFc2qVpZ+FIN1RaQ/Kldgpc
	DDU/GA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03gp03db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 10:34:27 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f8a5c02b4so566692e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 03:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778063667; x=1778668467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SGXrGDHADy4VW0xAVeipqzNuBCg4PRMApMn7mO6mfPA=;
        b=fKL+MEYyLwffKl/zktKjgKH2Qb9hz7OAE6LAyrNGH3IDvY7bQGGwvmVU4RDCfduknM
         hTmjx2MDj8k9rnvPOgst2if3Jmy0j77fht1fiz8rEE67hNuBg7kB57r+X37rjEwlGgiO
         IhL/csDqMRxDfGxj+9KU4ct31NYXGFTYkzqGTzRHI2TN33QjcfX3+1RBkXyqfEL3Ma/L
         gqdBY/ZLfcWHwGVnmBO232Fx0c7AxePOcgDoTAdzP+BF39r3TTufiMZvN2qFspdv1CTt
         GTFvs+doidfuHFKZDkKBIC3vOteTLq7Ekln3nQM6+lpRu7cRGqoai8jQwf1xwP72YU7G
         Uu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778063667; x=1778668467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGXrGDHADy4VW0xAVeipqzNuBCg4PRMApMn7mO6mfPA=;
        b=Jr0b2d9UIJND21cSN1vhX9T153zVlZLG30AqEXeimDGpMyQ6bahv6s75RqpmPfcs+0
         TfQ/JTvdS8vFalXN1Oa3K/Jd8N8lZ9JvJTlv1TDZ2UONVk8pNEFIx7lqYFZAr3oSN2e4
         aLgoCaJJGouKh3mvd73MxXnuxl3EM1q9/wTSgEYohKeNH4U5nYe6Q1uJ41XFzu4zOpsn
         xuC7K8ykZlfmx5MV06xw7u3WlhnRu+3vbrm5S5UXkTUP0T+NaaVF4hbdsmMNmDM0oWof
         KHtQ9tE8lQzkHstHOftOtL3yjzXBbG8LIxSXHJf0P4OqnlKaKzmVF0FtQF97cHZ07qMW
         5ROw==
X-Forwarded-Encrypted: i=1; AFNElJ9kLrFpiP3CNLbQGMVkiIl6TpAm37iGRkkPt6x2nNAFFwhSVgVzA6nOmbFlN/4OZh9vZhPtCNf5dQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ0hijK7gucgv79eKuyyCK36nHGLn8yyrG8DjpbDt7xRuHHvYx
	RoUDbUINQTxdCmYyYJRSlogv/CZ/ljx72xI0l+MVgj/b43Nk7WijpInJz+QbOpamjnCY2/N1QqG
	qWkFW85kTsDa3kbaH0alrObhFbcrYK9wPexUJHdGSQnQBF+jbuo5FQ+L6X7jVhE0=
X-Gm-Gg: AeBDietXWlh7DkOvTSJfx74iHWEbpqvHwSZPnf8OM/KQFuOnvK7pk+kuY7zfdCXQgyi
	R/elW423xYS6AocRoRBSpeEsrsuw1IygK6KktwgaRFleHlpcsAQeJ81KYL0BSpI/ktRYB0djAYm
	nhIwVYYxzlktZCqYPhCcSsLUgoVjeHX8L200KKfdb0ow2vNO1pdk/Wsw5uSomlGdSWP0pvPTsQ4
	lPpXev5hnHBxE1T3m9SYMpuU+8h53hTFZjs86gs/kRNOv20crZpiw3DHok7Zd/Nm0nBaLvCN7iM
	qcyexznp0cr+/BMtRWKOuG1c1Xt/wgCt1lPFpisZoH+vPXr8XkNFrZZLT4BI0kF0y3GyKes5Sj9
	wQN+pOdOXPKjvNmbRCRSkCsI/TNVQeaGYoS/wffuIl5C2E9kmEz6eyBOXIcAWafVneAVLrud6hi
	ldu8nrN0ukb2gEWw==
X-Received: by 2002:a05:6122:5017:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-5755b2b0d03mr285585e0c.1.1778063667099;
        Wed, 06 May 2026 03:34:27 -0700 (PDT)
X-Received: by 2002:a05:6122:5017:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-5755b2b0d03mr285580e0c.1.1778063666712;
        Wed, 06 May 2026 03:34:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55875cb59sm69779066b.0.2026.05.06.03.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 03:34:25 -0700 (PDT)
Message-ID: <031624bd-cb67-404f-866a-250f6362d941@oss.qualcomm.com>
Date: Wed, 6 May 2026 12:34:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: qcom: smd-rpm: Add clocks for MSM8920
To: "Catherine A. Frederick" <serenity@floorchan.org>, andersson@kernel.org,
        sboyd@kernel.org, krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260505203845.192140-1-serenity@floorchan.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505203845.192140-1-serenity@floorchan.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEwMyBTYWx0ZWRfX7f7p4Q5h069A
 5W1raFdIJdOtlCNPrXITotYYZYiwSDeamo747AQfyVFDXrrKo/rtP2oLcBwSnSnbrCjB6DwiFV5
 Bq4+toiusUrWAu3l7n/94loHZvhsL8KutzhvKQr6mKe+IBe2JsV5+XNGgfXfn63AXCDCZd7jCc8
 MRyldZ6OiH2dQicbWDKUGwZSw28Q1OEtpbzkXC2Ri0C79EdIoETGdV1pKPhKcqNoL6Ljc/qm4nm
 I7g5y/02exWNNO42eHSRqBrtxcRITjINO+zKrCncon08MfX7peUmOa8i2z3TmLGbVjuFxM9J/SO
 /K2EZ2V/nJAqreymSRQN8fjgRGDMxusd9R/qTzbEqfVvuA8HfHxKKdySQzKJVCm4GjKcSHT4SPU
 ClI0GLkPp1U5s2ftclw9IAyunbUoOXwzmwDPOcxoRqkHr13zmDCv1F6Zaf8pujJqiXjYf0r5VuW
 TmojEWwCleBimt0i+Xw==
X-Proofpoint-ORIG-GUID: EPS4J0U8g71OZaqeVDzZa9Y4gmGsp3q9
X-Proofpoint-GUID: EPS4J0U8g71OZaqeVDzZa9Y4gmGsp3q9
X-Authority-Analysis: v=2.4 cv=W8wIkxWk c=1 sm=1 tr=0 ts=69fb1933 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=DhTvykhhAAAA:8 a=EUspDBNiAAAA:8 a=URLdPFrtKwSTYNkRWwwA:9 a=QEXdDO2ut3YA:10
 a=T4Xa7w4Qb_kA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=bLiRU7DCRrRo9wiowOr6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060103

On 5/5/26 10:38 PM, Catherine A. Frederick wrote:
> MSM8920 is very similar to MSM8917, but adds IPA clocks.
> 
> Signed-off-by: Catherine A. Frederick <serenity@floorchan.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
