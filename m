Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAEC2EDD5E
	for <linux-clk@vger.kernel.org>; Tue,  2 Sep 2025 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815077; cv=none; b=JddGDA7Xjjh9DBEfK0gHJyC4h/ORMkEuagbIegySnB1E58tPkJ4y7SGOXDrgj4O7SszmyzBV1BKfuP5MjagfTwKRskXe61OxoTMTajAKGw8203hDExaTxzYImEOXGL9T2s713QkiTr4QEWXZcE093xjw0Xos8BPI7c4a0/iOYBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815077; c=relaxed/simple;
	bh=Q9xhz7InacewkR2sL7hxMKTtf5/Apj8ua9YctrXUMkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LsToSf5c8htWfewOCObrddwddJOFBsWHkVXkhvY+Z0M0+a8lLZLPYOC3Bwxif9ILdxTnDQEE/LMjFSKFdBkW+70uUg5pzo3eBGctdx8/ROZVxiVGHq/QqS4Nm5FOuARXgjebSYZXF6h/HxEYqCUEKWcLLdvGKLFq9ZKO+RW7Y/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wzt2ivyg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wzt2ivyg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AeGMC024999
	for <linux-clk@vger.kernel.org>; Tue, 2 Sep 2025 12:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4vrt0A6ANjc79IaqhSJY8cPh7b4X0YAYPY/tdBRrzog=; b=Wzt2ivygiUPCUSwo
	BJAREK+B3YS73ADn7xyrkA3+Yid4oH+u/ktvtdOE2h2Aqx7mOQvkPPDlD6icrrBG
	8S9OW/8/QvXUjbtHgz39CKUw0RxZSjXRqA5DAMW9zUkdmOR4kMSEu4CQVKMcDxQL
	YNw2ENT48z1OpYcLawqx/abCCZksctaQ/99bSs7lkAqi+RDh7ajNPQ4E/st5RjgD
	RcKslF1kElgGzipF2lbQaJ5EUcMdEehlpngPrqnctql7iLR2r0oVhQF+QbHBQowl
	cD12I5MpBTvQbz0xvmgi8fcKmPSvYaqak+HBgFOtdKQwOhENbIiWtavOo1N/T5UT
	ett0MA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuyrau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 12:11:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b32dfb5c6fso11116561cf.1
        for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 05:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815074; x=1757419874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vrt0A6ANjc79IaqhSJY8cPh7b4X0YAYPY/tdBRrzog=;
        b=AcqK9/QDhGPpZqzsqYbThnJQvUntv1zD0lKfSIhCUpMmfCg6peHuS8kJmxe25Nylbg
         +6hbOZj2ibaeXEfZ+R3Bp4g0IgTOhpsi53EghhbcFvslTQZZuF9pjFkIesq6f3P3o+UR
         QOmws/3qoNSfx9lFVnggT+a7aPenLOb7pcBjeQPT4n16o3Kng//cdA/rOJNt42mbsUoM
         coz/M3l64t0WYK8p1X0vNIzlAKU7MClUek04/5iorahFFuJwlBoKAvd3vBEN3f2XwT4l
         7oT0d7v9H8ekhZ7igpdUhj72pbAy+xL08TOi0tKc2aRCOHXsXpTF708oujhGsWV0hC/V
         2e3A==
X-Forwarded-Encrypted: i=1; AJvYcCU0x0I9E86Y/R4rn43Tu8XNO7L9h2vyYDfOwREU2wv+TMl9sRaVrVV9u9j/0V3tR5K5kM2Gav1Hzk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YygWrjJ+0ecyCQDLpnFmnPvuye0yAFK+2uhZ9QsxruOeCaj99Y9
	d6a/QUjCgS826AwhevHJEbZ4d45QwEf/8UKNFMOBq14pb9oHHj4YgR0pSFU7AsCws8c2ys2XmxZ
	8kWpeuXlce01ML/gQ+0ZBE5zOnfduAkRmT7/u48mYxU7jAcLVR4TYPQdUVwktvAE=
X-Gm-Gg: ASbGnctX00X0QAvwcgNC2xqTBFth8TTXTq3+E/W0aIaepUiwK7bS5WYTALWNMNWNDhA
	vUn01LAtJSvXSYXa1W91JlAvNk9nQDtCxyfBfDHlU4wE0PlbQa1ONwoyluFQQ2B4ZmV24itidSN
	hha0S2f3aSc/8VQvhkBOcfMs2tk4+4nE7thb7eGK8tcPQHQksF05Gb6GaupnvVrIv0o4YD9d/bz
	cQw8L5vvrAhm3/nge41CMe8MZxR6WyiUCFfvnl/ERI799cvCe91fvHhjNs/BYqYnyaO+n3NER/e
	ezPqdYhguJm4lRz15YQJsKC+ox1HIRe9rRdOnYnnOqYWwxQZzVDAb1uwv6XFDqKGnhXOjAJZzOT
	XBUi1tcZCm84sQmZnWfxXtQ==
X-Received: by 2002:a05:622a:241:b0:4b2:fb6b:38c2 with SMTP id d75a77b69052e-4b313e63155mr114514461cf.5.1756815073742;
        Tue, 02 Sep 2025 05:11:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3KfpCYj++Nh+x6sT1ov8IcNZd1mz0M6lJHlQz2dAizYJPZViCf3FEA46K+1XVLTY1Q97W+A==
X-Received: by 2002:a05:622a:241:b0:4b2:fb6b:38c2 with SMTP id d75a77b69052e-4b313e63155mr114513821cf.5.1756815073082;
        Tue, 02 Sep 2025 05:11:13 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040f1cf4b9sm698003666b.29.2025.09.02.05.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:11:12 -0700 (PDT)
Message-ID: <b2838f7b-8da9-434b-83aa-fa117bdb715a@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:11:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] clk: qcom: gcc-ipq5424: Enable NSS NoC clocks to
 use icc-clk
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
 <20250828-qcom_ipq5424_nsscc-v4-3-cb913b205bcb@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250828-qcom_ipq5424_nsscc-v4-3-cb913b205bcb@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX9L6VridRMVS1
 itIgBmZBkPirfdhZ8heE6a1ytfCcD42z1NMiF5t9s5B9d1ZHbQlS0mDNpSHyZud+meOi6ZNzORU
 1Ea8kuLxWMeP6u0yUxHGDuZNKOHNz+CgC7QOlh7pAVJ4ALQCJfFL57CwnORxPpJm3e7/Pi/25Rr
 KQIBSBtcgpZSGCbyVmbvIJNZvj+/KyWTrta3Kuj1ebbG5Qlc4c6NM8qHLHYtvFdyauNu/SgjOId
 xqHTtYMGDF0Jw60B3v+URiet0FeiK3/eNiFbZNF3R86yOFzoIap73fEhvunWVmTJ74XrBzOIsYK
 3FqrSXZAWDEe1POWzPJrZOSFaN+pQYf+HBVZScsASkslH7+ehYomq/bz/kFe9566DDOmwt30p+f
 agr2327u
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b6dee3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DdE-_dUAR9VioeaCo_UA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ce_2BxymgYURDRi-Pk7Eneom7CJfaKgk
X-Proofpoint-GUID: Ce_2BxymgYURDRi-Pk7Eneom7CJfaKgk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

On 8/28/25 12:32 PM, Luo Jie wrote:
> Add NSS NoC clocks using the icc-clk framework to create interconnect
> paths. The network subsystem (NSS) can be connected to these NoCs.
> 
> Additionally, add the LPASS CNOC and SNOC nodes to establish the complete
> interconnect path.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
