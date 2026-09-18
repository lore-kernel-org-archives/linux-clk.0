Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67A63FD129
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 09:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725026; cv=none; b=FVfnFAYHVN4IRjXQbrrMRU9xHO8rAW+oiRqfrm38A9gb76o31udMAvJdedFgZCObMuXsiibvArDYbhmxhxdePwvl9nUV7FuoXkExP1oC95Wnq7x2ON7ZzbPRuY8lcDfFEgESK1o32BjA7TPEeRmjv0WVs6E8MXZ9hbbONt0SH1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725026; c=relaxed/simple;
	bh=G1HMwfljY4tDGdeins5kPBg3mM7ZJ/xqQQwjAIb5wh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uAr1iOcBL9giH4lisDokfxTdV87SBCmDUxtRpy/5W/mi9Ud5Io/r+4AywW6eDiW1gFOD2I1ez9uIlRTGvAHque0d7F8Oinjr7Ed8bvdIWFUJqiWbNIsCocQA4dN/WVtcARfGcI0KzgkQvhD9qRn/1dEBNBUOJ+TwGZDFP73T+pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1QeVg6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOpUZYtD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1QeVg6E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOpUZYtD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dOc83746778
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 09:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ts2ohB7kaU7wSXWdRJOkbNTM3yTrx79Rg8Aw727zObA=; b=k1QeVg6EJTJx+Vq6
	7NgS+LiufPMN2PcdRpV/LTgZw2vpxy4Ex8AbkoYrXIk96h+EJxR/IQENX1S+N8zl
	A0pjZu7CPXg0B6PT0r7HRetreNVuW9IuehDdDTYZ5myuEs4V9rATmxfo7BtfIzac
	YmPmkzOaWo6zq6xqtdq94fK5SKDeHxSIK7I04NHF20I7L0TvGwCXejj7Q2UAo8en
	YJESoBOjxQx2wWl8YKMx9X2Wo/4iVbeykYlMtwkWQx5c+OTwtsv0xlZYGQUFnqCn
	X7nLHNdFNckjbvrRnsuhGgipMtQXY/CFB8e+3Lj9z7/aAUEdnLD8gUKayu+G7Z7O
	OzoFAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5kj9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 09:50:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930a312222dso12091985a.2
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 02:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725018; x=1790329818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ts2ohB7kaU7wSXWdRJOkbNTM3yTrx79Rg8Aw727zObA=;
        b=JOpUZYtDzh1CVYIBUrM1IsswXEfW2HNJOJJyre1IPCrNCXx/JjczDy/0E1niy0t7xL
         +CBXb5NLZC7RRwbL7xtzsrcNHJu98KudeQn5hYq8hD4hhq29qMrA7Xw9VYgXdE5SUn5H
         TTWhVFQt/k740FlbJXm8rj/VbKgfCoCQQl/WlRNaEFWLuJA11OevzaDeUHuF6qDJxT4A
         DcOWjkfPe8TtUvGNT/UZ2uW2qlNa4wSxJmShvtfM6EANesKfHxjzHn8ysix32NoAuAbz
         i3CHFGysfC6JU6YDnb90nt7GfcR08uUIaY4Xr/h/E2bLBV75Ee8F+Y13ZzojQNV5UOAw
         vPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725018; x=1790329818;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ts2ohB7kaU7wSXWdRJOkbNTM3yTrx79Rg8Aw727zObA=;
        b=NWp0zkOcqYfA25MeZxQeCD0rsNcLSBsBchsIrLG41bUnLZDnMQawBbGzqb/EEwrP45
         soQpsXXQ+3RHyKFvosqtf2mwUcNZJEHgIMqZURQu4Y0nYyZL77riXq9JINWl2GF8n90k
         VDU7IBPJCcQpdrk7G1RbT/kB4ZCQST5r93UC9g6MkjE/3R6BS+vh/4N+O0Zwd5eowQy/
         g03B82IxYAMnelULFhnXGEWkNJjBhtHSl2pNAmy2E/Wcl7CBEBG+UnmflZ1dEpRuiC1Q
         0aXhC3sX1pdFiofBboM2TaZSb2xYJkba7ZV1k5HUKde7FS9RG8e/peoFQgKxxinrAdCn
         MBGg==
X-Forwarded-Encrypted: i=1; AKwUvBwywTSg5GAxM2AZD5WW5/brj23fdzH1HvATgXbKLFT+WmW7m3/IdHSEkm6mbp0VlTIHUeaMwO1rCcw=@vger.kernel.org
X-Gm-Message-State: AFuF++k7g+h1jLaSHFXnrNLvpSv0hVMwO5RKuL6LgJw2seq22mp8Vqpo
	PofJ5eN78gFvN4o0AKr4wcV+wzAic3GWo2gr4I+oQhcYASQqctpoL43gphPeZs6e/QxgA80t9TQ
	z454JDFv1ILCVNZbMi2mtNV7c8De9bifC1FAF6zYPdZxCdzVObwERN9I0LAVF+p4=
X-Gm-Gg: AYBFou2tjIaAuCYdLNng69GE+WaPNxYnPIHIhhFD9fHKOdPnOn4gQdm2GJNDx30DxX3
	ayKZ9MxbY3QynNEtHEjeJgav/t84R0/uw2rqGceYnq1ijgeB5+iFPWhz1FdGnZT5LKFmnbHD5a+
	tchpddkFBGu6jYKgNzpyLSZ1JbJoVgTLvwpNfO+9b8fBKkP+wToDLn21AV20c8yi9oZzXzrqvD3
	pVxmlkiQ+1EsjBUP5M57/wf1CX4DQ5ZIxF2bfqtGvIYfqQxpZR2lTqnFBNMBLntFV1YlR94jhyB
	gFU7m0wb4w68FiKklZl+m2e+kErIAM0AYMexwScTgDzyfkIb6i/hfUO/X2g0POr1s6lpmphc4h9
	mlAGvJRl0+r+lI2tlM9Uatg==
X-Received: by 2002:a05:620a:4408:b0:934:95d9:85fe with SMTP id af79cd13be357-93be055f2fbmr179073085a.3.1789725018040;
        Fri, 18 Sep 2026 02:50:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:934:95d9:85fe with SMTP id af79cd13be357-93be055f2fbmr179069585a.3.1789725017588;
        Fri, 18 Sep 2026 02:50:17 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa5975d070sm644748a12.23.2026.09.18.02.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:50:16 -0700 (PDT)
Message-ID: <c9b318f9-b8d9-46c7-8e0c-d5d74a171efe@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:50:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
To: sarath.ganapathiraju@oss.qualcomm.com, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com
References: <20260917-master-v8-0-823d2c5d090a@oss.qualcomm.com>
 <20260917-master-v8-2-823d2c5d090a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-master-v8-2-823d2c5d090a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzNiBTYWx0ZWRfX9DgFUisSwGM7
 DvPcg4gmdaLH87y9zIW/aAafclNct4W3XLb8ZAZbQykCmPaU82fD5FlFCxLIRWTLBBGDDHAWaww
 RtMHEAteuLftHPuogEBAEOee1DTUr7+L6ybBLAUU52v4klR1v0NoFU5D4EaSJhB8p813+PrRafW
 qI0jWnPY/I34WSYnvdVTglu6qxECblMBzHH5OO+txKCscUCNZ2PbHsbQQXHDwkZY/FHMVNO1Kbh
 kFXBduEnvy2ZyOBShsBOAqOGyKuW8UrLekgOXP2kvSAmhdPI/w7FH0S4nHRSvnWWxcs96NwYkcQ
 C8tTS9511FvhtRE5WzYLJMpT8MBqYKAUKiyMKt6UMuE5tCeZaH5pMO6Llwb9tYqWYDxNZjkykvR
 M+Y9+kNY20yYJ8Z8cnvVjO2c6qimfi02yCFPEE7EjQ6xOuvNj4Bj8sNdm1M7tY1FQ7qjUBN/nej
 EUWncOAaH+cBm55FdyA==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aad0960 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Y4doX2lIe-IihnvZzhwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: eMrycAxwt1_P3c7Tx-aoJBZMXSvC-Lv1
X-Proofpoint-GUID: eMrycAxwt1_P3c7Tx-aoJBZMXSvC-Lv1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzNiBTYWx0ZWRfXwxH6gGvyT0x6
 y0eYjxzRal3CiSJv6Hy9MevpA9udSj7ToixPppojbmZ9Sqp6zkNPyZQQlNKwXT3tf1yf/elA5DC
 mMTl2g/5fhaUs2KD3tsm+qkYvFOOjT0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180136

On 9/17/26 3:57 PM, Sarath Ganapathiraju via B4 Relay wrote:
> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> 
> The HeartBeat Pulse, also known as RateGen Pulse, synchronizes the
> start of DMAs and Codec Interfaces for the audio usecases and can
> serve as a periodic wakeup source for the DSP.
> 
> Add the LPASS VA CSR driver that models the rate generator as a clock
> provider so it is enabled and disabled automatically alongside the
> other clocks during runtime PM resume and suspend.

[...]

> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &csr->hb.hw);
> +	if (ret)
> +		goto err_pm_runtime_put;
> +
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +
> +err_pm_runtime_put:
> +	pm_runtime_put(dev);
> +
> +	return ret;

You could do return ret above to remove the separate error path
Or better yet, you can use the cleanup macros from
linux/pm_runtime.h, like PM_RUNTIME_ACQUIRE_IF_ENABLED() to get
rid of the gotos altogether

Konrad
