Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF5939EF20
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820935; cv=none; b=A4LF3N8OqaQS4dWtDrhMnAIvDaDjst9JLYc8Nw0OBi+JRCYDWUsUohfK8rCU2n1r8a914qDwycF+Ry9yfQI4mjyOIIfIon2YxCZzPslj3bKs5gtLHFPawqmV3B0Ibaaqiyz1IT0MyHzLAbHNLoNw3U8tJRCU5jPjYpvuC0UfW/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820935; c=relaxed/simple;
	bh=2RjDGaBIt9UpCsIrhhyUdlCRXMviK38qRoAakOzKOBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uUUOy0t8Uu1noFfYumUEBv8wCRmrS5lbvMpRkkdcKfHdQnPO8dSWzYCrlvPm9goH4MvvxzI//3jlatyYXeK/YTOE4B9Aiuu/JF8a5pLQQeAhCFcO31tWZbO+3eGXKfWI9hHrtQ4PgC0H5b4a/0rul/k0drWv+G90nKzjrlW3TZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkbucb44; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1HIDQ5A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkbucb44";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1HIDQ5A"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFerJ43851202
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 16:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gyByxyOQ8a0f415k4TSij77SdQVIwV0lR/nDvlbYRAA=; b=bkbucb44LiOp9kmQ
	qGRbEZUyO9umgF4oWHpmy38uPyfxWf5aW7mT/d+mG1anXeDz9uNZRNn37wwkFqBA
	R6Cdwumqd3FcdZ+xxqoVYiTOJJn3ftU5OKnPpQR8N/zuy0Noo8WdrZp5RnJ9wTlJ
	G/PFo38Qo7XUcvPvvHokJakAc3tlDaro8rWnmaRpMVceZ0Y1HgFMhqEgwyOsLI+4
	CKzknB22nh1stQhXijTkhje/2hUvRBXIo5B8wYX3ck94c6vJlZvpGjaH+mjEO5D4
	LWsgBbJGaTUGuAEJxAKNrTB7ww+Jc9QVU9OhgMua3heH1haOyLX86y3nNyAMY7j8
	2uPR/A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr9jf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 16:02:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-533962f6bc9so4834301cf.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 09:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820932; x=1792425732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyByxyOQ8a0f415k4TSij77SdQVIwV0lR/nDvlbYRAA=;
        b=Y1HIDQ5AH1yIo+rF+HHwlh3+iGURRQvPus7SYLdPVxZspdOLylBtDzUq6pRI3CwjvC
         3KV1/HgsFlYhpkRHw5pFPSpFrWAk0texHrQZodE6rqIxQigLH3BtbV2iNjMNKYSfTPD/
         liSjbmYTV6fp4dk/It3sW++tZlromMLFH7vptjijQRmMzbSi9LZZ+ediv9loeTQry3/V
         khFb7sJaIvZy/D4uE2fWvf6GvCtbbDjqC5s7xFSW8d0FOUS1oQ6vG8XIIYKPZO0c2v6Y
         8wi72HTKH8DZYBKI2c2HgICeMHE434mUiWQRmr8LHEfFXKCIK5W88X6J125jQsqPLHJZ
         M+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820932; x=1792425732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyByxyOQ8a0f415k4TSij77SdQVIwV0lR/nDvlbYRAA=;
        b=yWBr95n+ePznKx/Bam8Esq5Dzsttke2HEBXehcGEpB/oIac45WWBltWf/llCnatjJN
         gDnGv1acdpRQl+ykiiesRRUzPboA38+VAEZuZPgLCY2nqQ0eyrxwJBw5z8YdryJNA8G6
         cRho9+cJ/PFpjRGtV14gDDq9oJIDj2qCa7n1c1TYMF1qj0v70f/pfeqjuxOdczjjXgbE
         LLrICw5AITlpMB+beYFLd78kZFOgJKilviYWw/ShXdz+yc3ygLIyvlEMnygeDieH3piY
         6rnLOVtwEfiyPUAzWy5FDpfFevKU1eIIaneVr5qcLtJkRvfqUX5ryqeVq1p/2q45dksg
         hGVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxszC/mRx9HI0gesoGkP+1AuMd745qKtBC03MspghUXafZR7UOBfPc0FgB96F2wIXdCD7ss77GmTlU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLl10kzMZLWAWjQHNnl/UwppLpqkZwAyNmULoFkuMbPMFT+UbaC
	ra908GWrjWOzyWJ+NOEMM0nrI+EeZMzjAGUg055HzB2/TUc++IVhZp0C/7sMcUmt0TYw3taQqMS
	WfA1+j+Eu0jKpI48YWYvl3hZOKNmdW8zT1jwdnideuN54LcEprr4EOtOigjLxBNA=
X-Gm-Gg: AYBFou2NtIGDqEvc/2CU78Qeqd0NXaivENSSBkgTbJvbi6itNzUjYiJi/y6vTh7SWfb
	CfngOY6qEM988gsaMUBDI9RCWNAIyhN8anrY3H53VVv3Wt7PwSbX3H2MufoKLiMA4L6MGk1KaHb
	4YndYuGN4ZV87iUTv31fBMJ/4KDnSap4R66LwVbMGUVo9ldLdZ5wV4MNQvYQe2k+RHWqtn93LeK
	lUEUlJigzmR20VXKqc0pXdhMROMCDk9SnWTr+AfJ6NBl7IjMER6OebrbjcMw8l7/SjntDxCU41D
	mx32UNSIf0gOOXnJElPBChWEB9gV1VkpUJ8Ykif8Ecr1jXHpcpbHaVLhwDGY/2l0c4hJhvm20AE
	nBZXR0ba1QWSvxAF3MVLwIA==
X-Received: by 2002:a05:622a:110a:b0:535:1a6:6e93 with SMTP id d75a77b69052e-5359f4e01bfmr192065601cf.2.1791820932047;
        Mon, 12 Oct 2026 09:02:12 -0700 (PDT)
X-Received: by 2002:a05:622a:110a:b0:535:1a6:6e93 with SMTP id d75a77b69052e-5359f4e01bfmr192064921cf.2.1791820931537;
        Mon, 12 Oct 2026 09:02:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c353bf3a541sm110415666b.25.2026.10.12.09.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:02:10 -0700 (PDT)
Message-ID: <a8e6e9b7-ca66-4969-bc34-99df34058af0@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:02:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: qcs6490-rb3gen2: add the clock
 controller
To: Alex Elder <elder@riscstar.com>, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: abelvesa@kernel.org, kees@kernel.org, gustavoars@kernel.org,
        mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        danielt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
 <20261012152408.3729237-5-elder@riscstar.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012152408.3729237-5-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX2s+6wCr6pWmm
 xGYikp85o4r3mYUfW4yIdkBcTsYT6GCre+HxgawDvXGmQBY3Jb+zX5LgaWzDHzl7mVzjLDsVwwH
 vYzWF3DdERePy6DpDGgHtQJCyGpV7JHJjA5H2gPO0je6YpP4xDL/dfIoE/Sci6l3q6rAf6hHhC7
 9HTl7aY1ImH844uuAqGv1jejdecS8lYOXVUOQ3qliU25+ugngmRhCUwb007sPcUTK61pR4A9U2e
 R/NnPb+1rh9DOZ+5AIjvidebmyVhDhx3slDtletCC1+YQuQl/VYw0JYcRVUTmqUrcMihshq0suV
 L6mnAd9km1eHyKxcqdCDzFOo05zbCTraXdgSZMRwiwIlAqO7YcFXMyoggOyg57wajs1UD/FaMGy
 ray9JfazN0w4n7lMyN6ieG+yc+5aAZQ0bCshIoUORLk3ozqT7KbBkBbNeu81e2SoEHqx/3J0xOc
 2zqt5AH3UnUoIyR3rFQ==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6acd0485 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ee_2aqc6AAAA:8 a=WjKZ7VJ2YQ59rNZOuecA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfXxcZp7JnOas1w
 p79p5M/u6AO3/KQgqCM10QYWa8pEWth2pyK21rlqaRIRrZmn5gySn34w63UuyKSQTx/3xAaZzQa
 6UKjdYVymjU8UL0RcCcPCWKSPRM5Y6c=
X-Proofpoint-ORIG-GUID: lBZihjyi6aL5zTn1Yf39xJYTrNtEklhE
X-Proofpoint-GUID: lBZihjyi6aL5zTn1Yf39xJYTrNtEklhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/12/26 5:24 PM, Alex Elder wrote:
> The clock controller within the TC9564 SoC is accessed via a PCI
> endpoint bus through BAR 4 of the first embedded PCIe function.
> A syscon node is created to provide access to a range of memory
> that is used by the clock controller and shared with other devices.
> 
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---

[...]

> +&pcie_s1b5d0f0_bar4_bus {
> +	syscon@0 {
> +		compatible = "syscon", "simple-mfd";
> +		reg = <0x0 0x2000>;
> +
> +		tc9564_clock0: clock-controller {
> +			compatible = "toshiba,tc9564-clock";
> +			clocks = <&tc9564_xo_board>;
> +			#clock-cells = <1>;
> +		};
> +	};

It's the same file - just put the node under the ep-bus definition

Konrad
