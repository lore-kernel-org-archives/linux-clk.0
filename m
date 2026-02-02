Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD2E2D63F6
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 10:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026758; cv=none; b=h9kOXHxg4oR9vPTEhh8iwpkozJ62LZSmzT0nicatzDP0Nh77hNqSO+ZQPbAbTFz094z7hfHCDWh/RPyhJMUOJ7eWl60kFa9VbaD+cHR7PQtUffhC2asHdLlpCYr7LCmkHu8+niuxna8SuskTGXCr/t1pVHeLKpsLQ3SDO0ZDr5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026758; c=relaxed/simple;
	bh=htL1cVSiwon54WFPmT5nZ0fXBEdeRbIBIhR+cZygJRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbQEd827qPlCjA+bufG7rMWYKJ3qsAnnycE9JqtCKqwLgxc5UxU3u1xOOwJfYd35av+Xf7BsWjDde6pa882E9pO8OKI2VSMItk4b7fuHBdh6SyMaBcMxwpZ4P+DvdcMg0sPSvhFH6Ot3I2+TfsBXu3ZUOZuLwUHOuPYeNNmZ+5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bS9RDIdj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gAbMEZlt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bS9RDIdj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gAbMEZlt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61285GQc1870630
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 10:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lE/lR/lqCoGkbnkAChtl6eTom0kKZQhHcUFHfJrocTA=; b=bS9RDIdj7SKOE0a6
	97fSo0GGr3Pjj5Z9G5OG6aFLssrH48qh+xCrMDAahJM8snkCTbMsqAxA2e8kNA58
	g4LuCoeRSkEXsdUnNykCgXLeTwY5cD3Df0zTQTmpGzgEl3cmNrqnTeSwN/RdHKl0
	c6suByNqSbfFSGNLbmID3UJUfOZ0IZKgbOdIdLMItgLmAWN/RpZTm09G6631/tF1
	bDQVCXb9FEgS+yAWd75p8DOwYziPPSZNhiePYcVk9mF8iEjHTkxR528We8OtSz0w
	7A1Wyti26AYp7EGR7KbK1FGLYA1HOgt61INi76JebCz05kxw8eY3SP9AkUEWM4xL
	EWiN4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avnn0aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 10:05:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6de73fab8so119410185a.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 02:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770026755; x=1770631555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lE/lR/lqCoGkbnkAChtl6eTom0kKZQhHcUFHfJrocTA=;
        b=gAbMEZltW1QSNApeHkM7IGnOWeTmaI0tJEnziMH6IWNYfSyBoumfpXcs4k3mPLVXnW
         GMS8Yrt3IFlE6Yb7Os69g/ks86POYQURorynN5QdkeatZzZ7Ob6zXAaq7XhaHmBFYzK7
         9Q0RfmeKtUWp2j6lS8IMRC0nyKpNeGcIj+B7UEtrtrng8iKnHtYomM9H8ZbTJjL7V4Rk
         QANJJpJ3YIk9uyyAPGfq/H8w+ArXtYeawpSlx9v9N2gRTNPzPk4wEeD1+X4Bb9hSJfVT
         XXpZIRBg0Il9vZbWAJfT9fLnnb3RZs/SanDzd59gyVxMj40icLhHW+UJsSqckas38Pq9
         YPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026755; x=1770631555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lE/lR/lqCoGkbnkAChtl6eTom0kKZQhHcUFHfJrocTA=;
        b=HnZfDYA9L4noZnmEjPiCXgC5nTK1bqjnSfUlT3HwkFWINMup3a1UQ5XQoXQn516Ed4
         Qcr2DEI7drxFTcOgld5txBGLWxQHKrq738vuAgzrOn+7GcR8MBIvsgOldmGPoq/17Enh
         h873HTQpaD2fuvncJFnDM6vskv9YdnDdgl0DMW7i3UAUEh6TQpXGOAzUN5W1eQcGOHD8
         PjiXmV7wCoCBMX/1djU6WYJJk9N36lbvhWfZq9R5LA+I4sRYm+Q6kE0u/GsqJHaEio1K
         H7qdmhrExjbVPAS3/wG1q8e5I1OIM0LgaStamNgPDHt4GU4b7H8mt7k5+kApO6vMFTdy
         mmvA==
X-Forwarded-Encrypted: i=1; AJvYcCU3RNz9QpaWXId6nDGGoPdVj6WQKTisrtNy4VC7TtXhjD9O9hC85gPRO7No++eQz1qjIC//UG/OifI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4oJVbE3lBEzw34cgGUM6YTUoqNIHyEmod3+U0OICVSCsHplWK
	ytqT+9IRyshsej1Z1PDJ9XiGMYryNEy/+elTmh1B6OXCVWiA+OncBwLDvbn3qJH5S+oy+hdhExt
	x7o2j0NBhI8pRj9L3QOVET8D/JSDBttMvP+cQ/oEc69sxJGeRZkxHW6xMrzA6+f8=
X-Gm-Gg: AZuq6aJ1bASKS5UMc761IqtkeCPmxivj1PiTLdjVe5ei3OrLzvlh/5N0Ihz1Uyr8EU0
	ancnobut4k2NtwxgKOw/YfxDtVQq3EyCjDCHyMz8BRE0LUfb+H11gCYajCR8x0iFA1vb3eA5rc5
	vgmQ2mnOfOCoMdRptnLK0WVzF6NhrKG2QLytVwEwQv7Weh9YgUXttpycfxYip8rjcQbAUYtJL+x
	xcl5LO7YbskHT02PMlmkprQ5sUDZxR5ZeANZu0IuWZBzTXBV8IdqbYMoZyuAALbkVgTHPAz1rSt
	UDZZf8JetH0wet6zdon8jgTNq9B61kOAHtxhJEbPwm0NeaPVILVHjQ8xYWqTNPgQWGaSWFNKgSB
	b3dfKLiVz5+yYz0WHIfXkB3r5NXBF+4lofTjI2UIAZvreSTaaezDKVxfyJBeJviHKfW8=
X-Received: by 2002:a05:620a:4141:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c9eb2b920amr1083290785a.5.1770026755554;
        Mon, 02 Feb 2026 02:05:55 -0800 (PST)
X-Received: by 2002:a05:620a:4141:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c9eb2b920amr1083287685a.5.1770026755123;
        Mon, 02 Feb 2026 02:05:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469e45fsm7463972a12.24.2026.02.02.02.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:05:54 -0800 (PST)
Message-ID: <d8826de8-0535-40a3-9b1a-24c2d3fc5de8@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:05:49 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] media: dt-bindings: qcom,sm8250-venus: sort out
 power domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-3-6f40d2605c89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-3-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D8Biu5sX-FCcjkWniRmCTk7xROSNSsEj
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=69807704 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ybeyijjueW2mqxUJa2YA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: D8Biu5sX-FCcjkWniRmCTk7xROSNSsEj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfX0eBsvkw2/ZQK
 dIXX/MPIXmSyavue2vOHL+nNbtNzdYFjdgHUMan2pkPVJjNQCu73AqEOs3j4trtpBixpWzkyStf
 7EL9P9ZrHLq/Z/9wNVYBAsM3n3ebE0KwCDWlTUXtDmuAqgOl/+qzvGIK1Lh6u/tNpGRCiB0AOKc
 lJ/xn3tnTnQ63kNNxgZcEFaWC4lYvU6KhmSTxVxA0306n9tNSITysgb6RISW6RwWaijgU4yXB57
 LXod6N6XuYBt8xp/FwkhkOx39K4hpi2HNB7sZidGTbpN+kbFb98/3I0GVGHGXG6257QFGx2eue/
 a/GvCdN80fFe89VRMv2BNDUgAECjTSgejk5hP97St7/oukRVHUeGpTEfLoF0538G+9QbmxBpEY1
 YNxdNvalwmBF6ImyCHxv30rWb898oCxFJg7ejd9juRfcLTIc5tlhxm2wqJVmmhwlQhIwGAvcn3t
 L18QAXAb80v4q0GNvTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020085

On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
> First of all, on SM8250 Iris (ex-Venus) core needs to scale clocks which
> are powered by the MMCX domain. Add MMCX domain to the list of the power
> domain to be used on this platform.
> 
> While we are at it, drop minItems from both power-domains and
> power-domains-names, it doesn't make sense from the hardware point of
> view. There are always 2 GDSCs and two power rails wired to the video
> clock controller and Venus. Disallow passing just two.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
