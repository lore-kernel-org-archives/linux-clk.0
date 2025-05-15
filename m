Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98701218AD2
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323768; cv=none; b=NRtVw5+R/+QL/cow00oziaDBkhoG97M+I/4pmNx4adkzNUtPKBnCdMwPYGne//LYw6lrcHvlsucZabBoPXCO+TzOPasBzIqgYGEaUdYTqSFZTHrzTUi7YRu2Q9PhqndPgw/K2cFt+mUscV20oP3JOiCfWtnTICAJDnhY5co578Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323768; c=relaxed/simple;
	bh=dVPm+i7vwTa7TKxnsLDygbGcoSsaRGh//y5CjsAz7AU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdYkBrpp4u4Rhr3K/uq9JUos8EPLX3BXHZy4oT0hrrtz096VgevF8IjG6AhWzeLZksW9QKfK877W50aymGXYJ352Hrt80CSMAc1Quk/nyLavuvQBhI8a5/lFjJpDFfQsJ24yH4cpO3lzu3Y+waQTqJalMhHDfvXk8oF3IPhf1j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KfwLXqwT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfwLXqwT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFC2X007835
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Atzjdv8tlkFhFRHK5Mi54oJ02dHYxrl2pRFuh6pKCi4=; b=KfwLXqwTHkQr5/U/
	U3DRMBPDGaMZ3hZtLlgvmcYOFeUVZhdxyp8qxh+VRwQTOkeLzt49t9whtBQxknwO
	1YkGDnrHhgwvD+eyOZ7eJqaVTIsx/PUkyuhARih4ZN1uPue4wVgmcjhA/EEjX81Z
	17Er508zs9LkEfA0/Ilz1CdKn9Rk8ZVXw6wEGVXT0Qv9rOpP7+AM4PmLS8pxCtOh
	eTKWnfeqYApx4q9DhF2MkGL1kKdH3Gov9l6L8AVcRhavJKBz3l8dwvqoiXBbEASG
	KdWaXIyO/ucYeaZMBfpigdzMf9c40IRjbc5EI7HJq6Q0dOP4PUGWPnGWnGWepIv3
	pWlzZg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpxpg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:42:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f546b2eff4so2441246d6.3
        for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 08:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323765; x=1747928565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Atzjdv8tlkFhFRHK5Mi54oJ02dHYxrl2pRFuh6pKCi4=;
        b=JDHpki8PRMa99ueTpYizFe61Ex3dPx7uAAnmL8+IKMu0v61ZNTkgBHDiBIOHT7unn/
         mV5vdWxWk0SvIJSlv7nMUnLjgg4kgIj9/3D0zXcYMsxiwSvydxEPcHBLVvmqCuMb1YEK
         SVJBaXf7mhMMHkZoYHN7XEsSmrPKC+W9zCVCzMGYVmg824I90GDpDcdtiOBVyEOXC4tz
         1bTY91Qm3vUvbb8FyoTL9Qbf1EqBN198uG7LmcT3qEdwTry5KDABAcTB27dzruQcgfc4
         lJqbEXmJ7zAnUh9wXIluWN/2oEx/jm7yRdiAiEjxa5SS+1yWAIk/qXLL4izi9gdgZm66
         ZWOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeoO10m305pHGU1FMZDQu8aZPrd0Fx8bvHYLK4aev9sX3tR+3m/+Swxs1ltkHPlG7+OD9vrbKumH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTKbC3gCsfcRmL2tOiZFyXUOeBbXxjwMBAWKYTSUGGpmmhaxTQ
	rKe1l4dk5J82FKv2aSl7gd+8m3gp6gnWzVYhwfDZIe0MvGgYBhX0p/8isy0h6vFsEHQ0G7rV4th
	kQEi97bwkexy2yzxHEmQ7XBMUVbLsLQ9N201cWxu1Y2wbTvwsLWvvnPeLncPTQ7s=
X-Gm-Gg: ASbGncs3O29PIAePRU3c25kByz6SAs1KDE91Z0TqsapeQWHvltLEyxO/Xlut284MBPw
	XxfIs8+ePRqiJkL07eYWE4O8ii5kAAwD4zDoxinEZlBcHmxttisxX2OWSXZqlzq9tWNPUvOvI9a
	2LT69sUQcorpZGiEExFbjM2r2e5ouawDDzPohKErJ9BmDo8oTnQy5+o0lKCfrcfgIPEkTTMG8TE
	aOKlsaVLyT36AcpYfZh+o7lWtzNuoJ82lGTdDTHlVDRUkUG+pFxgkKi+qtTBM6I9MOg7B6dStMD
	xSf3JB81zBRWCUiu3FtJTsb0lDn+TtNjLyHIIocDKk5WS65E1616tZqxx/bEzFrJLg==
X-Received: by 2002:a05:6214:20ab:b0:6f5:3d12:1583 with SMTP id 6a1803df08f44-6f8b08350c5mr1345246d6.2.1747323764723;
        Thu, 15 May 2025 08:42:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyaNW4ZwY6l5LXOsDRMGiN4VEbK+2ZtY3TIpG9uj5oJTWL3ICqFydKxc2MQwVwbdnhbU69Qw==
X-Received: by 2002:a05:6214:20ab:b0:6f5:3d12:1583 with SMTP id 6a1803df08f44-6f8b08350c5mr1344846d6.2.1747323764097;
        Thu, 15 May 2025 08:42:44 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b059sm7133266b.10.2025.05.15.08.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:42:43 -0700 (PDT)
Message-ID: <02fdab40-b9a4-4569-8af0-ceb229252a05@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:42:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/18] arm64: dts: qcom: sm8550: Additionally manage
 MXC power domain in videocc
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-14-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-14-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BLb85M0alXUZPNiYnLiQC5W5lZyRgw4t
X-Proofpoint-ORIG-GUID: BLb85M0alXUZPNiYnLiQC5W5lZyRgw4t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NiBTYWx0ZWRfX+N3ZINzVnzBa
 Bdg+kAp9lpBHlvueOO+7UTlFUdPMXF7OR3RYE6+AlwfjU57L0JITWN8NegbSib6X5xeumEdk1FY
 21T7nWTZlyFTsZflXGAxvEKcgmRnxFaumHWQJfwby1dmhR0KmpFn9ovGVpKsW/xupg5SOulBLVi
 OVeSeawQIF18ZjxgFrwUWJPz6MMzlQrRLETEYzFdzs8ud3WgZrDybY2ZQUQ4TwXNTA6aMqQL0rm
 XfgFnl4t76+wcECEL1Bq9lOKDb2GUt8PM+x4/s5pCagXQnlDrEiCbVUOrjj+70sBbdj32quesEt
 lhoXKhQ8En6OldYcSe9qkKSyLKWrphehsAn2MBaLmE/H844590AwSIIq/Wh0yw/p0W4MzvPdG8H
 t717dfEMO+b6AAfyn/GdZ5uhF60ZcYF+NJhcl0mRyEwtx17tVcWv5Rg5ZPyJ5wV8fayAFvYO
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=68260b75 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VvphFt63O8erv5bwH5sA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=727 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150156

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Videocc requires both MMCX and MXC rails to be powered ON to configure
> the video PLLs on SM8550 platform. Hence add MXC power domain to videocc
> node on SM8550.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
