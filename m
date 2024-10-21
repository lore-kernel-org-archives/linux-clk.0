Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C131E47B2
	for <linux-clk@vger.kernel.org>; Mon, 21 Oct 2024 11:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729508846; cv=none; b=Aq1Mw+PiXF/tHm0iyg9VqrZxqRNj06BnQL03Hhr+jznd3d7OZF2evwZvEPLW7YjPsZCVwSet9rNpsQYp3TEGgpy8w4OqBXrqnP4soz/CXto/w2/r8RbCs50pDgzQDfzxAXn4DvuPnSV/AjWqY0VUDl4Bg/NiQVg7Ckuovkc1TkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729508846; c=relaxed/simple;
	bh=N5eBhN7l4N5g+CiruVAT/S8z5Q24aiDr5bqSg9fD31s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VBfhqRJmvgpiNYrWcz4BP/81XANVlJUGXJdLAHFMwluiUFda0yPJ+i1j512JA2zCGT3RBbT/kOWA4CRYkiyy9ZOYL2n+RQDUs1CaYmycq1Qetqq19qvR+V+H3PEYqxOBWTTbN7sp7LbEcHZwe+ul0TNK2UehrrxsMQD8l6S0kXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ki9BSR26; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ki9BSR26"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49L9w83q026029
	for <linux-clk@vger.kernel.org>; Mon, 21 Oct 2024 11:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dRRpJ/UZTMidDbDrDpmrUhrP7JPG8Yqq8PSOPA/Y8Oc=; b=ki9BSR262NGyMhzA
	2zSFlWm3dUanejTogjEqd4hmTcZbY1nUWaGLmcv/Jdgsu3vgMieE4YBPAvepQQIi
	39aJ+3mfSg8wQo8RLCEFOLMiELituh79azI9983+TiEPVX5nvqJEz+ufizgytxdS
	Yluo7TgKWPMu7FaO9zC/FihyJE6JS3NRnCJ9HjDR4/WtdYx/sD2YwmApY1IoT6+v
	2D3tuGkr2dY77+aIO4u+92RcLQmxcqYMBBdyDB85FJDw9muGmpbdmwi2Y3nofg1G
	0wb7zTl51GIPJtcZLiPcWPtSJFBT38bCRUxPOs7yEFjsrTewf1Vbk6PbKuhwuAcF
	d0jx2A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6rj4bg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 21 Oct 2024 11:07:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbf2a4afcfso14388716d6.2
        for <linux-clk@vger.kernel.org>; Mon, 21 Oct 2024 04:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729508830; x=1730113630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dRRpJ/UZTMidDbDrDpmrUhrP7JPG8Yqq8PSOPA/Y8Oc=;
        b=GU9uWf6eKT9Q3VPY/iEp47VP1ftsji3fOwHb63JFwL2XujIBm1y9/bmVBo/u1LT07a
         z0qNRrj61FF6BOBkdF0SYuwJpiCC+K5IEHi0h0Br4zxJtjQhL4sgI2W38jJi5qE2mzAJ
         hYyevCs1OQ1/AayC817OK12WGLK1RqpfzG1henH9KdCu3IK/CGu6Krk+pTtGATmKWGh8
         XHmeZkfZSuZkrgq1Wg0Fg+odnmYDO23eLiXePu0WFpeAdM+lgcgky9oIva/6CiV4mmYD
         y+V2wEGdrNgWtuQyE6RC5qC+s48Y0yyYfoO+1Lpu3eSUhhb8+3iJYdY8JsJXErNOx3mD
         rqnw==
X-Forwarded-Encrypted: i=1; AJvYcCVPpxr1Y4vx9xMRYfdWN1oUUOpd0H4BCUM3Wo3okUjUJ6Zg9PJdrA7QoXR/ZTV4i/5r1gBJDwkHfr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV/rEIZBpNOP9z5j5dWd/kT/GedoM0rKWaIoeqnBshF0lsnPXq
	yV82Bro9IFnA83w6keVoXt1gI/L2BwOjh619YIorlfQSJm9b/2wO+q/vm5WxVQcJdec9jEXgu2/
	oCH3B0pfar4taWAi6uEz9KbKvWk3lRL7eVkY1joqpAqmGBFVosT1RgAjzzLA=
X-Received: by 2002:a05:6214:1948:b0:6cb:e6b4:2d36 with SMTP id 6a1803df08f44-6cde15c6223mr78561586d6.7.1729508830612;
        Mon, 21 Oct 2024 04:07:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBfNHni3oaxFZqhR6T1qV3nO2g8kHzH2/s0gjy45NEB89jUIXw2wfgW2KkCIfZEbRx6DzJ0A==
X-Received: by 2002:a05:6214:1948:b0:6cb:e6b4:2d36 with SMTP id 6a1803df08f44-6cde15c6223mr78561296d6.7.1729508830330;
        Mon, 21 Oct 2024 04:07:10 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b553sm1824101a12.3.2024.10.21.04.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 04:07:09 -0700 (PDT)
Message-ID: <c6a1eced-ea8e-4174-9f8b-dbf4131e0a2c@oss.qualcomm.com>
Date: Mon, 21 Oct 2024 13:07:05 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] clk: qcom: add support for clock controllers on
 the SAR2130P platform
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kalpak Kawadkar <quic_kkawadka@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0FucDBk2O7aMq1q1AJenFAkKXkFYUoPY
X-Proofpoint-ORIG-GUID: 0FucDBk2O7aMq1q1AJenFAkKXkFYUoPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410210080

On 21.10.2024 12:30 PM, Dmitry Baryshkov wrote:
> Add support for the RPMh, TCSR, Global, Display and GPU clock
> controllers as present on the Qualcomm SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Dropped gcc_camera_hf_axi_clk, gcc_camera_sf_axi_clk,
>   gcc_qmip_camera_nrt_ahb_clk, gcc_qmip_camera_rt_ahb_clk,
>   gcc_iris_ss_hf_axi1_sreg, gcc_iris_ss_spd_axi1_sreg,
>   gcc_video_axi0_sreg and gcc_video_axi1_sreg clocks until corresponding
>   subsytems bringup (Taniya)
> - Program GDSC_SLEEP_ENA_VOTE directly from the probe function (Taniya)
> - Dropped sreg, BRANCH_HALT_POLL and collapse_sleep_mask patches
>   (Taniya)
> - Dropped gcc_parent_data_4, gcc_parent_map_4, gcc_parent_data_5,
>   gcc_parent_map_5 (LKP)
> - Link to v1: https://lore.kernel.org/r/20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org

Please address the remaining comments from me too

Konrad
