Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5B52EA147
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588980; cv=none; b=JDoX1opa7L+2F1Q0YOSSwKI8wC3tdmOAJQ8O2ukDrhBaYcAJxNrlVhVMP81m/ny3nDfa3VclgrzMJcVMgiPsb7Odc0OvXSCGGpNQDa3jApkOhm4hFPkElQ9QwtQxT6WG6Gu2SpcgK3EX5LJOaUk1mGBwQSwH+qGwm79DGYlB70U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588980; c=relaxed/simple;
	bh=W4fkXcIzmLOrRprTfYjXxN2qVbektwruWlgyebK8YjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TcChkws/PhwmH+rIQt8y1jGtVSsN8HN+QiirC6VVf2w9oAbwyFjkrDrSZrEh4sRbCiuzmIMeEgynVBj5f7Ylo+qf5GK6ZKzHscOkmfiNr77m5v60TxrIUpeb69Ob0gT+ysrAjft1YDr9y9CGxGPjpEVh8ANv5ekVkv2/ESbXtBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QMO8Pg6M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QMO8Pg6M"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB1iqF026485
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/c7fevbFog8kBDyCouz7tNUAQypnFvG7NInPSb7vKcY=; b=QMO8Pg6M860G8kbj
	UV6WZpRJpMd9c4Y/oKzCoI5Ithvx+29NKKnnuGkWoEWiIqx9AYhwBMMgupfNJQWi
	bbwsSmU0ScDSn/xlH2ySPPx22OhlyNLt2oyotLa/ZnYuN+jZE0xQ5pIRJUivV3Ow
	grsJuUaiPFLhSaUulj+EC4JQLHZD6oAlpQT3OOHpiTpl7+w6uRnxCD+Svorcbpx+
	ioVXmZsueHLDUVWmsTAcmNDXp81HpH1eS43KPgq9PPypXy1EiJHHnTTW51XNd7wW
	og0lH55HP61wir0b8i+EzFreVHclRVX+sILRlznbQXuvRCHYi+dXOnV5tPxWQG/W
	Uq3ysQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0y9w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32b57b0aa25so682353a91.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 04:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588976; x=1758193776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/c7fevbFog8kBDyCouz7tNUAQypnFvG7NInPSb7vKcY=;
        b=EQWJVTCUwudL57ycwHjirtPjrF/rdpPsFeZ55tro47OfzcDqlTnYm+cFJROCijOXxK
         dfD4WmAtJHYww5AZiaRW+YDFH/Od1ZJagc/s877cVx34/o9pxZEivkETE7WWV/2fWH5d
         LRMoAXBPmlVoObVXRPBPnmk2OnUg0ftF1ZNnRRpNVB7g5vqRFqQimBCJQuBAuyWaQSq+
         mx6M2h/mTHdwd+VqXB/ydS/SPhVF8FVf9U920m1rJgiqucxaXs3hpfMAm1S5g1ydiUfh
         k64H1FpqNj+CK2FeGajUIEWz6uwLPu62XIDE8ffenlMTupc15ZcwN0oQEEp+dfmXVWe/
         TRRw==
X-Forwarded-Encrypted: i=1; AJvYcCXPJgGlI0KwqQ9NwPrN+kpTPLHEa7R0yL9jfD2j3OgywSJrM/3nIiK+gpXVp2H6eYkJrWMhm7ArJys=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEylQHrdXBvbVe9/4v8IpaVnm+mT9G7Ar2Qi/C4KVlA0m52ThY
	Us0/e6jMztYgN9bEpg4tehRB8SCbKlX9lHi6GAJxzLqtvk/Hbc9dFV9CYUgdM/VFpeMjaCVKlZC
	/xfxc7fg1gxHW1hzI3iyeW2El8uxDQSw/cIGuJrYEBNTHAH6sNKEDTle3sofqKWY=
X-Gm-Gg: ASbGncvXZcaTGNqF0sYgBVicyY4pSSJDmmCnHXnYQsgipBpE21CJLSyiWJ+cSI+laPZ
	eOqgTZvWetbwn2fQLFMCT8nvE6jpDsHm1X0XaK04ONtzjP7bAqIIhSqixWdDVXJ63gu6aUQkKJB
	H0DOuROcsYUgyBLhtJFg+zEFeIW8z4T0POMq/yQiL/jMyCaBZ/TNpKzYcPfctuVgwLSKj4MZzJl
	W2ee39ftTDFJe4RyTkN0ewHD1Fyqydhbf/u1/NvSTA7p3qcyX9mZv+oJTW8g/9mAJzZzx593ltD
	kvaQbygO9OBpVGSZNsbV410JyUn2A30j9jBPKk7ih+Kn8jrhUcXFanUy5cSq4m/QOZwF5S0=
X-Received: by 2002:a17:902:f682:b0:24c:1a84:f73e with SMTP id d9443c01a7336-2517616008bmr209162465ad.60.1757588976414;
        Thu, 11 Sep 2025 04:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4gZzbIf4QtTnievchv3j2VJYq6xCKNhtINNNA/tJaPCX/SQX9x18OVQGKnBiR9GN/iOsOoA==
X-Received: by 2002:a17:902:f682:b0:24c:1a84:f73e with SMTP id d9443c01a7336-2517616008bmr209162295ad.60.1757588975993;
        Thu, 11 Sep 2025 04:09:35 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc6d14sm16305935ad.9.2025.09.11.04.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 04:09:35 -0700 (PDT)
Message-ID: <513a0c85-8306-4885-9825-30bf33ee9702@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 16:39:31 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: camcc-sm7150: Specify Titan GDSC power
 domain as a parent to IPEx and BPS
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
 <20250911011218.861322-5-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-5-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YJiyzt-Rn3HE_cabXIhIxvT67epM2xwx
X-Proofpoint-GUID: YJiyzt-Rn3HE_cabXIhIxvT67epM2xwx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX0pYos2NNdSfu
 D5ZxtAtQbwhbaXIyRATEz+dlPKeZ/dDKL6zO1CXjqcmkJQHqy2xV2CR8KfWd09WugyByuxJ0bMm
 7tnms/JCIkhly8d5TQXJ6i2Al5cEDZXBHB2yy1ksH4P23UOGQb4V2iaCpVnaTLXKcGlykkO7rXa
 sXE+CkfSQ9FFZNt0shFiJmbEJYEwhZsJmg7HW52wwwvoc5q1EQ2SFvWVkT0FJh1oiOcOdpqtywz
 rCllsfnwFYvOntLoLOgx6MpgLvIJlkZlG3z0Ova1srAJm75wq5HlML0A52mh2W4XH9fUFjs2H9E
 EWpKsUv9J8eDA4jgB0gF2wWNYIZHzUezaJoEMR/WRRyaiv/hkcDsuDrKSyqJMLBaDquzCUotVSQ
 T4UHi3ul
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c2adf1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=l0trHdaATao+Pp179813Xw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=N_-oEbGzrVbpv_w9NrMA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024



On 9/11/2025 6:42 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM7150 camera clock controller, and it should include
> IPE0/1 and BPS ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sm7150.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
