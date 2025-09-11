Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F9B2EA147
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 09:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582935; cv=none; b=qx0zho+rKfY7mbJA73oD47agfDv+dAFIVeD6BTCyc1Y8oqghcWsKksYPIQrI521VRzibBVUnWJEecf7YSfhXBSjdKnvCcupnhECkYgYcr/zdNehKWdh7+KOuWLJuZZTafUM2jBCytrwsvE0pxbzNoeF4VQxCeq0t8qAS2qymhCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582935; c=relaxed/simple;
	bh=KD8XzX53ZmBJU9dtZpfXx96GNYsVRHlLrpvx3RMeack=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CZ16MTgdW/7FXakozQXw6FLwFCkiiAc400NlcQjjcSJYirdVs0WrohH4P5lauq5BufqtA14sCw3Zgree3yy6KezMuwT0wukRoASNv0FMjdaX1HlNPvCQTT8R7VUL35lskQ/idXvO+cWdSKnptj4WMfzPHBoSNX0GS0rk3hl2CQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABHhAm5P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABHhAm5P"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IVPr026258
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 09:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J1Zy2IIse0cQ5PgkOq++oOU/mEYxxQU40ZnpePD/+EI=; b=ABHhAm5PSuomPLY/
	yQSfc7RJ3iQdGrQ9WzzBisarDOLEOq226AkeRvhnYMjqtWX8Heb9So1JSl3lLSuv
	ObNuhOHc1HTAnx5t4TirRHNST4jcyMhg8B3SzOAVNOoNoTZG6N7AmUoO2f1KiIKW
	xT2iXz3JPp+/ypJsvAPh6hAbYv6e6AtUqNhzoAp20yhwojFDS4Y/4/fshoF9LavW
	spare+qMKriifUBMoE1nl0zi542b/1mYlKcWgdeKvYyYR90bZ+U0yRR9ojRqfETM
	EmIqmQrDSIv82j5KQGB2V2Xjr3UFBUo9jXz/d1u2Ad3q0Yt79Id7eTW4MutwLC+F
	Cfd0qg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h22f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 09:28:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-721c6ffab9cso2222446d6.2
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 02:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757582932; x=1758187732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1Zy2IIse0cQ5PgkOq++oOU/mEYxxQU40ZnpePD/+EI=;
        b=AUZGAjkJdEu0vcf8Sbd+sEr2CzL7lskKb8nOddv7HK77UcXZjX65bFJduDLleO/RsB
         KtIWegaDH4Ngam0dmo3hr1OAJcX+FyS9+RH2EpTjJpkSUM9KwbZHyn30yuIV8y/29kjA
         eFO2Driy94daqm8iU3KZklJ9BTDis1ubAgXpM6d3FjBijACk6RmobUSwc/LzMWuh7bGf
         2FnNYsaJB2HmwN+aSIKHSVSkhKbzRI2NPohW2wIp9l7DjuQfgw33ZOnbt8gXFbT4c1vn
         J8ytye0TwQrQThTr+PqQQJEfOoADt1Kr/MOxmGpJg0agO9RZZGOxzFq5BXGgQO/RkKML
         bd2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5vffdIC1zPO/rPX9BpHvn5B7XzsJJ0Z7c3zqY/U5qbIVrM9JK/ndKf+vApmy8mY3MpX4qfEr3kVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ8RHk1sLsIc1EGjcrrNq3+dHFTyb7+6oW377KyN/41g/s4nPS
	woG3e/aVap+o6GU4B5nauvmTBs4zO2YrShS67BR+eIq6eG91T06HAph+eIDnPel5ESpKW93rMdp
	3dVBy/O930wfQKZ3cgmbUw2g9HX7ImCclqVe3j7708ECZAjRv4DasLAiLSoO3N4Y=
X-Gm-Gg: ASbGncsop7oCJaA8NF+PNLslibzrgRbj7MJLG6D8R4BvPsXt0mdPe/McqJ/GXhh+Upl
	RMxwG+uaVwhk1Mt1JzEO/DUTRclCKKMiMfEyNL8PuVsiNbtPUi1oMkfxVFmYexTH9AHMCeylSzQ
	P2XJM7e3E0ZAuHDbjR9FBUzo3rxC49y/5kaZAb/t5fCZhnVXHUFHxy1kSxjoIq23ECpV+pXAIcx
	FW59vxZxSLsSFk5QMlV1ciGAPiu0KUyrIqJikcyZPmoiSFvGispZQ9YMKBOMbQpf91uxKfIirPY
	+qS8UuCcGa6fy/OSl+WBGc64HNL8lGNqgvYTDJahebNX5oy/cJdMzKFfwEfrbFqmKm9J96ZPBdW
	u4KkTHQT/7fIrpbb1JjPY7Q==
X-Received: by 2002:a05:6214:ca5:b0:70d:fe22:9aa4 with SMTP id 6a1803df08f44-73946f70a6emr128381346d6.7.1757582932166;
        Thu, 11 Sep 2025 02:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBXOG3igN9/8DJ7fySlrmK7tv4Ls0GjxhprGiIYCJToIxRWEwOOX26rhYsv/1MafCZvRPumQ==
X-Received: by 2002:a05:6214:ca5:b0:70d:fe22:9aa4 with SMTP id 6a1803df08f44-73946f70a6emr128381196d6.7.1757582931744;
        Thu, 11 Sep 2025 02:28:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec33ad6b3sm803237a12.20.2025.09.11.02.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:28:51 -0700 (PDT)
Message-ID: <5272c3fa-05d2-43a7-941b-759f46f5f02d@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 11:28:49 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] clk: qcom: camcc-sm8250: Specify Titan GDSC power
 domain as a parent to IPE/BPS/SBI
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-6-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-6-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RbNqBIQlpVXdFcmqT-jMuJBj7CSUunNk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX5JxPxzALbnnN
 WXHJFco/yrAuUfop2JcRbP5wG5hhyfactyskmOpXkTWElsksxF5mMQlB/ud+X3zPFRqr7W3izNR
 ndU7Y1x1o7MvNl5oVhiwcCGeumn9vT59V/zUVZbM7lLSz4Zu0JxmgyawxwVKfzcOfeH7muKqtFk
 vB3NGo7VrNyORm6CftXfYpqnOGru8Mn/KpNq2DSSMkbLo0KKwoebtD4sKntnQcyObGtZd9P9gVU
 QRLg5xXjQPiQlat7FTHZ1+U/ZKZAXBJXx+dYBBmZY4umYTEEfQUo6lZj7h82QVpVzqAHTFGVaUn
 pmnHECU0Yg61YQ7qDyDG0XoJeaiv/TwdofCPVFwCSfEFRPwr8AXJKCRds2sq9i3eWpndzcg7NHa
 9CulyozE
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c29655 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LDDDIuMr0XRAt-0CmwQA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RbNqBIQlpVXdFcmqT-jMuJBj7CSUunNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177

On 9/11/25 3:12 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM8250 camera clock controller, and it should include
> IPE, BPS and SBI ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
