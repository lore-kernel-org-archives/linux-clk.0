Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E252FD1D0
	for <linux-clk@vger.kernel.org>; Tue,  2 Sep 2025 12:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815111; cv=none; b=qSr73H6kUq/BShgpx11jyXkoqel93Ev87nYODLgAq2TN3Eqo04JlzgHntYQIXv9HmnB5Mr9fY0oIezF73hWKuT9dGB+MdzweZVdSgSyhyqjpl3XXtWt5St3jIb5Gbq2Kwx+Nruxb0ofJyQWWQmn1n7nO1EROPEQznulcieshDuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815111; c=relaxed/simple;
	bh=VKPh/ct5Q5m08hxDCp/EDthmOiS6ucPULO1VHGN1G3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSHtE87kpH1zF2bug/SlTLpOXPBS4Q4IQbb2qpskiyhrVXxgJ5cpgecYpWtFHSsux8ufCuQ846i/cmk/Quf1Nsw7Q+C1q+5tThUjOQDpAYdMkQGvmr9ZiO9n6ojowgswk+VEOY5wg+xqJ8wy0+h3uX7yOC4ePtF1fkLoHiqQHrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eeyr4qBs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eeyr4qBs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AVlOs025749
	for <linux-clk@vger.kernel.org>; Tue, 2 Sep 2025 12:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9+3e9dP2WaVs0y05qgMULMfCunUKyox0pXutflnw2s=; b=eeyr4qBskZ6+frZT
	07ReQadFBKOtqTEhsmyQ9kul7fEYeJO+8J+mQQrnwuO9rQRVpNFrYaAe64uu/GEo
	6/5vGMmjfknMejSA6PujLNvCS6EFRzRGKZqestEKJJa/sn9048M+hHwnRTOFHwAy
	E6Er00oehkoLqYqQ7+xhusvQpk9CZjTw2AxrXLBpj7XC57NlJtCG3EUpc+wzZGWl
	UvM1H/10mMCF6qEEBcDTql2UJQtV8v4MUJ0si0QCTMQcphEJy8Egtbsj8tmbJyh0
	ZGoavm0dRVgWfvUM70fAqplEaWxM/mMs1p5punMdgb1qB9AIRCyAf0tLumVPfaFP
	sw1wtQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuyrd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 12:11:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b32dfb5c6fso11118411cf.1
        for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 05:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815108; x=1757419908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R9+3e9dP2WaVs0y05qgMULMfCunUKyox0pXutflnw2s=;
        b=n+lHUOtn0dblwS2ja5N9atwlrrsHVSUswzhFnyDkkkiLrkSX9EAcTltaocQTjAoaR7
         +BxwgG5e1/g1ksSB2KzijNc5h5QscDOwYXMyQoIOSEtKhfHYqI1V3qpz0FlGynQV38j7
         rnoH8i8W0qTMZGIBkCUAhhniZ6lpamjZ+jngvod0SVnaT3WXwPHdrEknSurDwUWl8wFj
         jZMLUs/r6NjLzQIBTmzGmdMZxYqfKHU/KOUsjiL+LHOafK4ywXVF1/9N0yw39n+ASwsX
         SHHDpQOWdK62jcyof41dH0ZKYbZcuNLECsJN6aqzc85b3QhpVCD+a5rpCvjtXm/B2Eyb
         tbCg==
X-Forwarded-Encrypted: i=1; AJvYcCXkLt6PDo3hRpeIb3QgE+cGBknG/Fh4Y2RuQoO7fvNuqJganLWvAUGPkqzPHcBZLSROojAo0+P57Gw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR/zIoXta8p02+q5raen114ShG1eJB7YRArOA1tplPn/+WpnIL
	+kf2T5BtJSVxRHIwsartFz+XrW9M6V4GZcad3ATmi1GzEdtFeYR+Pcz6sr5y1GcvR2DBqP2O3IS
	Sb4Sm29dxKr+VHi/hDY1V7ZuzLQpEcyxvvyAdFBdUjedkBJyP+OIQZ8XOSC59zrY=
X-Gm-Gg: ASbGncsqLg0D1BVSI/x2K7JgMojJ/Cr7CkTp7OGVc2HQhu8KD2vSr+VanxupHQMASTC
	DHCkmya7PHbswCgULBYJdjuZQLrWx8BCCDBBB0/ujVxqZGpxisRMHJa2LxVdOPxTR78LkFYqqMg
	TxDxt0JTUIobjaUCueJkDcRpon5VGLiHLiOtbPj6G1sH/kfOQweQDaLzxaEZAQIgYqaQ8Rr2Qhi
	+uT47lQinwzrfESSKT0pwXGuLr2r8LTVPlTxXka6akssyDzeuWbPncM3Y2Vi8w7YRv8vn1v7Aqs
	dj9YHT8VFDyvGYeTMcYBl6nXhbMzBFOssb7BQUbY25mJqWNu1STH0/OvWp1DuP43BvhFgB5sKye
	PRSn+D2F/BSDBwF7Fq/ghow==
X-Received: by 2002:ac8:5710:0:b0:4ab:723e:fba7 with SMTP id d75a77b69052e-4b313ea00camr114049231cf.7.1756815108375;
        Tue, 02 Sep 2025 05:11:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwW4G4jjkaUKtXkdS+GHMSUK5ZRdAh64PysqQIkVPG7KSVbGILFSKErYbYiYkdMuTYCelzhw==
X-Received: by 2002:ac8:5710:0:b0:4ab:723e:fba7 with SMTP id d75a77b69052e-4b313ea00camr114042341cf.7.1756815097447;
        Tue, 02 Sep 2025 05:11:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-affc2fac683sm873825266b.83.2025.09.02.05.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:11:36 -0700 (PDT)
Message-ID: <84c48543-815c-44fe-9334-ec1f688e9639@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:11:32 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] clk: qcom: gcc-ipq5424: Add gpll0_out_aux clock
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
 <20250828-qcom_ipq5424_nsscc-v4-5-cb913b205bcb@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250828-qcom_ipq5424_nsscc-v4-5-cb913b205bcb@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX6US1qutouCOJ
 te3fkts82/BSQOWNx70RU6h81S0u8WXCyON0ZyJKV5pjzYpfJh2nAII0Y69Gb14eY+U+DTOu3/f
 nRbiPR4hZ3xkLpOoHVqF6caYRABoJGaEu+FTqc30s8WwghlE9UfYwmGz68TNMy68qi8mTdak9wg
 OmTIeKifjDXBcWe5EF45uohsSt4EjZOMwyaP9cD8NLI5hp+ho5MCDaHDWMWalfnDv0WbgOHcgZm
 TI547Q41HgYD90mR2hO/4JMytMrkolOJvmzgP34kQ4d8JiIjz2SAKQnuOQyQSRWIYKthbkQjD/x
 EiN5Q9OWfHlmGb3hUyxEjJ/glYq1DddNcPmf8O/DMs24yXhiVEYSRx1fJqm+CIPYX+jP3rBAG+e
 BmE8XFdc
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b6df05 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=xy1T5CxqftMPibTtt60A:9 a=QEXdDO2ut3YA:10 a=jh1YyD438LUA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vSuk_Gu1LHTFCnOnJnJ_qOaVqI6br_vE
X-Proofpoint-GUID: vSuk_Gu1LHTFCnOnJnJ_qOaVqI6br_vE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

On 8/28/25 12:32 PM, Luo Jie wrote:
> The clock gpll0_out_aux acts as the parent clock for some of the NSS
> (Network Subsystem) clocks.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
