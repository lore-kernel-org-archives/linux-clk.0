Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B037166307
	for <linux-clk@vger.kernel.org>; Mon, 23 Dec 2024 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734955784; cv=none; b=DfXLSOxxiEnUUq4+J0azmEALG1d8lS6hH/M5w1HfQTOyDXPAhMKecRl6ruC/pR/dfdJK/pWqEXXTCO1l0XwzkOX8exh+fo9IudrycWj9ES49zGqsVy6sa2DT3dKprTwmA+xRPgGpCacHXPMmpU0mN0QEHIAhprSAPdJi5j5cnRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734955784; c=relaxed/simple;
	bh=tcmvcK8tgvefKsps6FzdnOdxtsWbEvB3UCIW57E+5zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ifArB49aipQuGbfKDLbCoPF8oLhj5l3rrpd9/Mwgs0Vx+RouovO5rQsi4qV67vuiaS54waKsBV+H6HtvJ8st5UzyZbnvrqP2UXp7nguFsGZuqHnYBhI59AVDv8YTp959KN6FBEXHX3g80ZarSExocuY3ZxxBsy2EcfYj/N3NItY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCZPUfWm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCZPUfWm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNBVdgS002805
	for <linux-clk@vger.kernel.org>; Mon, 23 Dec 2024 12:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r929DbCHRihEB+OW5i57mR0uTG1mxigmUV2XT8SL+W8=; b=RCZPUfWmhnlBQQef
	IA7D0cUVFyHqdOM4eDS/ZdFikBqfe0Bea8qAnrSVzscy2C2MHFrL7zx8CW43tSCR
	qfhZBl+GIBZNfTXpFF7rv3vpQ5LrA4WYjr1zIo1JaGHfr0TAUNsAF6Nw1D8JkG/0
	nE/hAiC5wNO6P3dvJXfH8wkAzGNiULR0A1MwkZSwnNJup8rwTxcE6UY/IBZPRb9u
	CtdoRYrLWjFjkbst6JwT2Mc+rt+i6Ah0JmJJF86nWtA3g09LY8V/vIfnoN3PPba8
	gUGX94f/YGycL6A9AOawLSCsJ6GgQE9cvF8EkoO1aK6WaPNxC5mWfxklM2oiuMK2
	PNuhAg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q72mr2cu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Dec 2024 12:09:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d904ac0ea2so7497876d6.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Dec 2024 04:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734955781; x=1735560581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r929DbCHRihEB+OW5i57mR0uTG1mxigmUV2XT8SL+W8=;
        b=byKWpSp6xeaagUZRdthy672lRnlOUcJdlwm/x/DyJos87WP9G0G+pE/QH1LrR6IOA0
         E1///8sE6mr6DvT7VV2c0RV0TOo+EEG10fvBrBR3beHkZsCJ6oQpImGE63Quuu6idNV9
         VB531lO3QeC95qypm7b6s3SY3qa0HojR3/6l+rHf7JrNrH/2wfW3AnVelqFIfFq7BCuG
         t/NsXRZZtLg+xnOKDLRuUaoM/UVuH3pE+W6lOqtfB2H59lOscHuYG8l9IPWmR+MmyFk8
         AyRq9qX9gHhF9jsqxoAQwjep/hwyK0hdMFNUEBkzKp+dV+d+9qSpmyXLOTxXn+ukmQqu
         L3wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWWAta65C8/besxC2W1kNb9vbeEZiTPP9+tBExmxpLzINliXvDEh1Za/iI+x+UMm+GwHx8we8Aqpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhPmRxv7jylhDtSF/UzQJGGFIQeatW6GZ/IrUefJkUfrELTku8
	e60mlA+r9BZJplZybFzU58HeKQ3XuhF8k70Y/4nynIqaKuaCWTKcsECVJCamqQCMZI1NfvsIRJa
	wc7h3Njg4Xds9XT47aIGoowKOGczASdp6dZZaoU6fk0QhK4qUqZoVwPD/sAY=
X-Gm-Gg: ASbGncsEq7Gk9bsz7+fOaSTmsio0qEtqKra5o27QF1NPDC3jiMdPreZlIKfTsQ2euCB
	E2GJmbbxrbzc9GQrTBPvnJtu4VnDa5J4tjbPxqBVCwZ4iLLD7+LukH6CeWh8yBqFDLJVQA2ji/9
	ISXx45BAFneHhdLay1S6Cijt8iqOda49iSqI0NbwOUnrQd2YR3DTOZFBUN6puHH1EQTHVFVxxWU
	8GI4BhiqMbHoPHwA97Do9agW0p7s5uDK8T9Q8En2XThToyF7KrzvtGm6cjl0VScJdxyto5+DFU/
	M/8WH5FdIfcPak2C4YItMSFhElaHIIAJCxI=
X-Received: by 2002:a05:620a:4108:b0:7b6:c3ad:6cc5 with SMTP id af79cd13be357-7b9ba7be550mr718506685a.8.1734955780027;
        Mon, 23 Dec 2024 04:09:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhGMuPXNgl8KWNVqUOywwV6OUHhYbRzVm+R6ExhUqI+M0K+BDgx9nh/gjBxYSkaWBokx9iEQ==
X-Received: by 2002:a05:620a:4108:b0:7b6:c3ad:6cc5 with SMTP id af79cd13be357-7b9ba7be550mr718503585a.8.1734955779526;
        Mon, 23 Dec 2024 04:09:39 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895366sm506493266b.73.2024.12.23.04.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 04:09:39 -0800 (PST)
Message-ID: <11a47f97-b1f3-4401-950e-5fbf6c5e1c50@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 13:09:37 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/5] arm64: dts: qcom: sdm670: add camcc
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20241218231729.270137-7-mailingradian@gmail.com>
 <20241218231729.270137-11-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241218231729.270137-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C58HB4bKRFnZBFXT0V3OsR_LgymSZ0wO
X-Proofpoint-GUID: C58HB4bKRFnZBFXT0V3OsR_LgymSZ0wO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=749
 clxscore=1015 mlxscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412230109

On 19.12.2024 12:17 AM, Richard Acayan wrote:
> The camera clock controller on SDM670 controls the clocks that drive the
> camera subsystem. The clocks are the same as on SDM845. Add the camera
> clock controller for SDM670.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
