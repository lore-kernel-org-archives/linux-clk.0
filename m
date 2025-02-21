Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B092080EF
	for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 11:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740138570; cv=none; b=Z0Pts+H+W+pCpbyue+FEjFTNej7XcUSGcUeh5mpiIo247z71Y4jFIrUusqzB2BY1+gQf+xl4yTLuh36xLUL2fQZ3bzI7yK/zj/IyoxHsQ0YGSUtcDzb5O32ITSczlKRLuYtAYUWmQgfc8AqtB9941ckPO2Z8kjAviAfzrqH99TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740138570; c=relaxed/simple;
	bh=8arGMFLajZI+sPOPm09SQrk2nlxgudO09El3V4TGWVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXuchCFw0FNeit1Z6tcJpM8SNDaD5iby0F65ekca+jkw8gLadRUEcQOefunY3sjspHlG+3TZCH1jBaV3egC3rGmVILxSd8tykhhH7jc9FOJ+7+9UP7Rymw1GlO3YQ+7L5V/dpZeyGRjD+a1cpkwoF6W0/ZTg2QevFS2w8SweWPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aq2liSbp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aq2liSbp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L5VDLg012173
	for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 11:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/6HBhwxgkCn5p5i8qcqY122PrKqu6SuX7ZN6cuXdGk0=; b=aq2liSbpPTLsAqeg
	rZDRWRrZG8IdHD67DphPHXh3iPe8o7A7m3P6Kcr+kHhT4CkQWuiOGDvLNdzSRrZa
	NZkGaaBJBLyY2JjryDkW3xxYj+XQ8+u7/zk+SccLDnexDVWtABcZa9UFDMlX5o7g
	8LdUwvE0PLm3Vzw+NUwhafbn51cSebRhTUx6Ig4cksrxjrw27KsSV/LvmXmsIbCo
	E7/8Afx7QEGpoxhq95M8aK7Kwmy/iDryF6o27u9TqjvAYee8BAfxYEwO/VruidQw
	2clsI99RzCGxZjZS1vjew1+KIyuFvEBY9IQx/x3ZgZRJimWUuqsHKvb9jmUYucd8
	WOkSsw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1sw9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 11:49:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-472075a2b47so4674691cf.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 03:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740138566; x=1740743366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6HBhwxgkCn5p5i8qcqY122PrKqu6SuX7ZN6cuXdGk0=;
        b=Ub9++kpCiB7Br654dzoW6bMPKJu92XwA3iwSz6bUkPEuKurHCmK9BQSVFnfhxvZWHj
         hKweAGQfPB95yPoj7AjQj5V3kRGh4d3spfQsI7Z/fBGnncgwv5P5FlmiQJoBeUHoc4GA
         l/4kRZO6D9J1Js8AAi6KzQkaZsD2k+XVuV6s0OmDIXu/6AKdeDlNT6gbqvsWs6oJAfq6
         7+A9NyndS6lRwoZahdoUIeNvur9BUcPnpUmamT/sWI7jKn/5SGrRa19rbuUIixgpFUWU
         UCac03hOZdbDdP39L0hkN1s9xnyrUaMBHwbbi9dL1cFXgegk6AA9jrnhJHHd8i+ow9g/
         6oMw==
X-Forwarded-Encrypted: i=1; AJvYcCXlrT4wL3KGIHZsHGaM+zS4leHTLCOEVA3KpTm1DONUhDmnVuEGoDwAwUYRJuv79EnnnL7lyGMDirE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMGtysqfokOX+R3D+xCDKAqLVOkAvJajT1Jld1CYJoMlSREW6R
	KLKVpPvY/0eTJENQxf1DrfyiD268qm7eTt9wYIQ0XG+qUvUF0syWHTD25Gq+P+ZJ7clta82N+Ob
	egKoWV9/XRGRanIHfrlZinJcC1Ggkh+vSPUKNxqQP/xvjt3EM3h8SSHGCjhg=
X-Gm-Gg: ASbGncviX1/AGuWLBtcyXEoQhBsicoJ7thE860hk0yLtItnW/I7RWIW9xp3jfzoErc1
	MD5UEfne4odIguNJBLKH3STuaqC65CFZ9Depx50Bg/XkF3P3Pv/IYNuCLBSuilEl0H1okOW18E3
	IQOe7y/krfQzy4nZpcnuuSCDafD2Mjj9okP6Dd30A/IRQFSNadqt79QqWCgWvOiz7wwNyZZtfgj
	Dn68dzm2cEGNpmcd/xwIfzp5UwEiUZYHeOEW3JTI2AqtbMP6h4shKzNn59Ii8ibG6I4V0qiTfYh
	R60yFlNkDJsiTy84Jv1IngNnpSSMbWkMhWYLcb+8D4i7RjaeqTjaNJ12KwPF45Ltz2ZiLw==
X-Received: by 2002:a05:6214:40a:b0:6e6:9bd4:82a2 with SMTP id 6a1803df08f44-6e6ae7d99f2mr14708136d6.1.1740138566367;
        Fri, 21 Feb 2025 03:49:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7jnkWAirRkaZU6bLGlSoCQGj/vZMj9fV2Uwdu/vuSXjXCkYcGk7wUqFHMBlf4yfMNs1gWRQ==
X-Received: by 2002:a05:6214:40a:b0:6e6:9bd4:82a2 with SMTP id 6a1803df08f44-6e6ae7d99f2mr14708026d6.1.1740138566027;
        Fri, 21 Feb 2025 03:49:26 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbac781b78sm823562366b.60.2025.02.21.03.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 03:49:25 -0800 (PST)
Message-ID: <8936f8a7-5bc0-417b-a719-806f1ce0904b@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 12:49:21 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/6] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
        quic_tdas@quicinc.com, biju.das.jz@bp.renesas.com,
        elinor.montmasson@savoirfairelinux.com, ross.burton@arm.com,
        javier.carrasco@wolfvision.net, quic_anusha@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250221101426.776377-1-quic_mmanikan@quicinc.com>
 <20250221101426.776377-4-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250221101426.776377-4-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oOfmjK2JOeEcnNzPClWlAxOlHEYtRxCK
X-Proofpoint-ORIG-GUID: oOfmjK2JOeEcnNzPClWlAxOlHEYtRxCK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_03,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=839 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210087

On 21.02.2025 11:14 AM, Manikanta Mylavarapu wrote:
> From: Devi Priya <quic_devipriy@quicinc.com>
> 
> Add NSSCC clock and reset definitions for ipq9574.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

[...]

> +  - |
> +    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
> +    #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
> +    clock-controller@39b00000 {
> +      compatible = "qcom,ipq9574-nsscc";
> +      reg = <0x39b00000 0x80000>;
> +      clocks = <&xo_board_clk>,
> +               <&cmn_pll NSS_1200MHZ_CLK>,
> +               <&cmn_pll PPE_353MHZ_CLK>,
> +               <&gcc GPLL0_OUT_AUX>,
> +               <&uniphy 0>,
> +               <&uniphy 1>,
> +               <&uniphy 2>,
> +               <&uniphy 3>,
> +               <&uniphy 4>,
> +               <&uniphy 5>,
> +               <&gcc GCC_NSSCC_CLK>;
> +      clock-names = "xo",
> +                    "nss_1200",
> +                    "ppe_353",
> +                    "gpll0_out",
> +                    "uniphy0_rx",
> +                    "uniphy0_tx",
> +                    "uniphy1_rx",
> +                    "uniphy1_tx",
> +                    "uniphy2_rx",
> +                    "uniphy2_tx",
> +                    "nsscc";

I see that the input clock is named rather non-descriptively, but maybe
we should call it something like "bus" so that it has more meaning to
the reader

Konrad
