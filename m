Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FDB39EF30
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 11:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176984; cv=none; b=N9457qvrnnOl7W5daWGfFiE+O8mUvKXV35XwWj8fiF+IsdQjb9LMRVRuTSJllhONd3OCnkMS/F5tlM8qa/hhpp6c7kDqwyWQUW7sPLD18zRcW16GebiocujuEDkyOE54lo6fHZb2rzKZZ5ptkpPZpj7W4+BH42+NkKxOas/DdsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176984; c=relaxed/simple;
	bh=7IxRaQGWMti15l16w9inD3a87Oomi9WL8xah4r134G0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uf4FDcE3n3DNX5ZkANLDi5oe8pH5wBmClzbcj5ctASp3ReLRYwufvBigIKntkoHP5rBvmeppNr8YLdIKXWpb0xkk4a+ZfQ5vTb0+06VU9WzoQoTSNs7UICvqAIJ08K4jNjgxJ9ZXOoZ2GpgSOmbbNXvl/kRiq2Pd6HZaIMWhh0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpXraFsG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JAI8RFIF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpXraFsG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JAI8RFIF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9x6cc267533
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 11:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SaKwPTwmtjNWwhHDC+xVFQqCU8K9rJPAsqnciZvdJfA=; b=gpXraFsGVhXUEibG
	X8Oqdpr8v/Qd2tk+V4gV6TWSHum2ZWT3NsVKagjuVEuXt1/NY8UPtpJdcnS/tpc7
	jZS+N05sZA2ykrcGgR+2x/hnEcA/tndCRiX2yEEsXbh0RBsWEH8msmIfe6Mzd25K
	bHzQw1fMEeyij3O0DzHBki22T3zLAa3XVTnOJQ8uhqtkTq17tMciwZlU2Bt/qSVs
	Bea+mR1GBsCg+t5la1dpai7LupH+HnU+DxsNXxQvkbzhzmCsL2TUUkQHOBwl1RO2
	Rt/HicWmMximkEO92PI72HS4qevk/Z616pk7Q/6amIJl5fHJogqvRbzc5mFxg060
	B6YknA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u34k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 11:23:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517796be724so16350151cf.3
        for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 04:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781176980; x=1781781780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SaKwPTwmtjNWwhHDC+xVFQqCU8K9rJPAsqnciZvdJfA=;
        b=JAI8RFIFDHnHH55vucGLs+D1l297sTfMDrHvF38eKo5cqQPYaNYv9J8NnHbYzn8uO1
         05tPxXxOXdY8HO6dLuNgGKe9TZx1Cd6NsQ5p81V3BcFpuYr8IqWmYbwFuzeemzX0Ljsb
         U6z3Q+agIrEIfwhlEpbxCFMTQPX+ulY2mrp2MaV+CA20sfRC8p94VG2ovIdQJD+S751N
         QJkT185rJst303WcSJhCejEf2/nfu7kNXBYTkidUlGaQSdo7WYiOWICPLzu3xLzLyJc9
         e+LzCH+p8kWgfxjlPv77dNn2fno0Ls3aTbQBiMB4cStPpJN8nSqmOJ5B5oC7qkAaoj7p
         pUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176980; x=1781781780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SaKwPTwmtjNWwhHDC+xVFQqCU8K9rJPAsqnciZvdJfA=;
        b=Qydmcczxq2oqgCorBgAoFNcWt3/8/hnC1/zrYffX4ekBP4TwKp0dZ4OFRnsW8xgDdZ
         NuQb9n/JwQD1yJg0V+x1WrbsO2RDgb8psbnOXnpxRfiYvVChxUbKuFv76d9INmGFyDkm
         FP54eezWa4L6rloqpEbjT9DpBEDm38/zjcosVuhQ9Z0/vFYMhPxeqv6TpUT4ZyT/wJMs
         4IM9W/EPp4lHBsIWzVUNT8xCC+LBbhi9+M08g6chUJFqXVc/VFcuodI1fzrgVFhagLiW
         fdtTlykMhG4nUK8d9R+s85o5/7vU/JeAaeN6AkzTPw7t2MquohxzJFSDuHpGx7fymFx4
         QgkA==
X-Forwarded-Encrypted: i=1; AFNElJ86uM4OSUnYEwQTwbTiHPcycjrpLX6SCDznVp13oin2b6d1hOIh6T+7KhxWniSOREbM5dMSDOCqyEs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjd4Er23TvkCD/4/zZ3lQlcOoUUkuIcXv4V3FN5PAvi43pV40v
	aQXFRnYUUEPbCaeM4cTRa0Hn9UISNkRa4Wdvkz/DBZX8iDudzzGGYAHhUurmAunlpUwDfMAO7ls
	PNp3zRy5osndrLMTk0FQgjNK89xkhHt5NSUAfIwsDcnxcMYtk2sJ3W8JelMzdA1o=
X-Gm-Gg: Acq92OEYmff06JBjkPehiUptZe5ZHDf7muFtIacSUpOIYNTfzD7aO5JpgzoQN8noBi+
	MrTTvpkebB22Y7wlHTDwzSEX/bJ8ZCa60uUBsAvGNI15FVqPNBu1r17hgdTwniXcM+5c4JoHS5q
	y6Uc3RyIfB5HhKk86DMO9A4fSzeg/q/sOH2FmzSKnVfqcQZRyvAaULwpLe0NKPYNGaD8whw4LoR
	wI5R8xxwGOpVyUjgxHfJDbRYinMwaVEdqVP7HDML3I6sxLUwgZBeYIKYSk6/1o9XtpP7UypePff
	E+G2yasyzIdJXaTP5Gzs6fKbxhNquHDrfpMZI5rQZfK2ypMwW+HYz0QszkGEdjdP1EeQBKhtiLH
	FH13goWICJpYNtWObv1q7MXy0jUlEvQrC61bCsEAlIA8N5N2LyHxSXIQ5
X-Received: by 2002:a05:622a:1f18:b0:50b:2875:5782 with SMTP id d75a77b69052e-517ee2375f4mr19937701cf.6.1781176980380;
        Thu, 11 Jun 2026 04:23:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1f18:b0:50b:2875:5782 with SMTP id d75a77b69052e-517ee2375f4mr19937351cf.6.1781176979892;
        Thu, 11 Jun 2026 04:22:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f15621sm52097166b.13.2026.06.11.04.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:22:59 -0700 (PDT)
Message-ID: <02a767ef-0d6e-476e-a535-52b55d082b65@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:22:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add Audio Core clock controller support on
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-3-7ee6b5f2d928@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-audiocorecc-v1-3-7ee6b5f2d928@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Xq-c-NDIob4VpHEZhqeqIt5bXv9_4r7I
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfXyRTY+Niov+Fn
 Mhv/+/d28b3FDz+oALChnXA7vZsHZak0fJaGg5yukQfX39Ul1S4j2qY1q+TvYVre78NiU/s6WvG
 Li92F1JABhuVPlF+rwajU4rvFdtF/C4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfX4XLPGCWk2H66
 pu9Cj7hp6mHCwKLKGPLrsNM6j+oM4njIUOdVghJzDuE7GifA/d/IEhjV2BJkwjEMi69yN5+aAa2
 WiPuYBgGzMb/+CIheqwizuR4QqP2XG8l7OhJpi9briQGnMNtKIjmt3nrzhbyaNx/RryyTul1KKi
 n1Okgfo/8pL4X7qPV/uLama+LK+i82EifXqmI0axJs+hKmWmyWrUplS9O1ehhLs2SCRrH+OkYrc
 ogtXfOkgbCZMBdkuu1Npan4p1fPzOdSQup+I/VBACOA2LWpATU6ZdWKk1bZuPVgJAffy1iEGyD9
 bnxZpNlGOeTDk8ZAPOfySS28I/oK4BJKrCETbvXCnIE5svJmOr3N6MXE/OSI9u150wceCv8qv5v
 CAPR6D9fUvVZx0QsvWGLjCkmuglFJoIozPXSK9fuHjl5YkYkaJRNMVwFCj/Qa/dVehAu/sg15MM
 K1ElHiSFW2j0DkoG+eA==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a9a95 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9j2NjNoUcPKmTTtl3isA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Xq-c-NDIob4VpHEZhqeqIt5bXv9_4r7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110113

On 6/5/26 1:26 PM, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AUDIOCORECC) on Qualcomm
> Shikra SoC. The  AUDIOCORECC clocks and resets support differs based on
> Audio subsystem enablement. In the CQM variant, both clocks and resets
> are required as Audio is on APPS, while in the CQS variant only reset
> control is required since Audio is handled on Modem. Handle these
> requirements using variant specific compatibles.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

[...]

> +static int audio_core_cc_shikra_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	ret = qcom_cc_probe_by_index(pdev, 1, &audio_core_cc_shikra_reset_desc);
> +	if (ret)
> +		return ret;
> +
> +	if (device_is_compatible(&pdev->dev, "qcom,shikra-cqs-audiocorecc"))
> +		return 0;
> +
> +	return qcom_cc_probe(pdev, &audio_core_cc_shikra_desc);
> +}

If the clock list is complete and you pinky-promise to never extend it,
we can simply go with a single compatible and use protected-clocks in DT
to avoid accessing any of these registers (sorta like kodiak GCC), removing
the complexity

Konrad
