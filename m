Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447061;
	b=crmBIYpp5h/KnrRR5mcirz/EULTRkkNOLoDVaHLDR2dvYuXwGqT2eTfiC5Gq3Hf14fmf
	 C8kqqjvSfrrGd0eOichM0IFppE+9Xklk/NhWa4gZ9l8JZtky/+ZuRrzUnPuwiubDucS2h
	 RmsDsv3VRo3K7zaLnO7c9Io/MUtQS5NjQQ0RICxO6rimhNgsBfC64shQt9gQ5pFh3d+P2
	 XiMB4HkywUTIZrUerkEQI99Wh0c6kCyC0wm5NU0mce2v4daXbBJgmIguKNtJFPktV6iXa
	 amsW+Raz7AlnD+GvFn0RLAaVgxVTZKobqcGfASGHpAvXdJOv5+ZWLJ0UlolFbkyAvEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vkrEv+PVcuudxd6R0af2wrFICM2sOzSUBrjd2eADlIY=;
	b=a//RdDAtjwo4tYiZ7wg3PUQLyQ6F8zJlBATcVS76xe45Z66jMcItZ3Cz44fuR669YL6A
	 xU5o7YaiZEc+JklS8jYfdFeOukP2Q378dczEWcIvJBFMjWINhn8Qte/lI2P+7otv16HMz
	 dSgDcG1yup5T+UJ/1s1gQZY/QdE1y+V9tz0240AuY1A98jknI/UOAUJOT66slz+rHEnIo
	 n5c9XZsbda3A/qu+t9z/57Ros+F1nSzuZ4zGfI4J8ryCZrG+ddb+nkUQn9B6y45gefSMB
	 yZtDPT78ADUYn6ynqIeESjf6ag+/t+UgzjsQ7/Byg9VcHidifVfDX9kBRtImjEcVKVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Bj+jtzy/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zx7yn2de;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CCD606A31E
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12CCD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bj+jtzy/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zx7yn2de
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL73t2443095
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vkrEv+PVcuudxd6R0af2wrFICM2sOzSUBrjd2eADlIY=; b=Bj+jtzy/tW5+Zv1Z
	cRybiJR+ZWrYLOqOFQtKGMxbyFu6GynHDh8jLV2d9h+PTox/EcjUYSbS2VxoMen2
	OXfbgM9SpL9kBKkC42r8AgV095FZ54A+bL8hc/YDnbHlZ3lnKaUZC8LGlvKO1XcR
	ITM8cHjmLdHbOWVUnC3x0osLeuYWQ3njziraoQ+krm+dawdLVUnpoL/oXmkJIjP9
	Bcii4gXGoXmmGsfkoyFwCbpA8vE1jLobzftEwENNfk776EyLjyC0ud/yeVAeNuN/
	6we9X0EnbjBsPyMjUx5iDXt6vZWFjM3D/0iNfAfU7TgC5YTsG4ZUc7YPcRBLUh/2
	Obs8uQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k211a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:17:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b494fe37e8so172696a91.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 07:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447059; x=1796051859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vkrEv+PVcuudxd6R0af2wrFICM2sOzSUBrjd2eADlIY=;
        b=Zx7yn2deOWtV6BkEV/IUz8rql8RAxl0MZ+jGj6cWSSMTW9u7gVKAXqvlAqMaFQhyTc
         KyL+pQTaxkG5B1k/mmi8K525T5hKGmjS4iYq5fdy4uurXKY5hSxqoJh9bbz8b1G1HY/E
         LBBWjvikleOm0joC3ueIPqs/J/J9TN0fbFTC1SmrHb/2PSQPMTc95MXEhnVwYVbZ11BN
         7afn2/qh3mJLNP3g4LEfrl2TZJQtblUgQgAumCm7TkiKWvIUqy27AsbS7fD6mjBA7VSt
         IjNba93q9j8KY4E81FXlHKI5uM0Sbtqw8ysHOM9udFAj5HuU7QqXhPKJ4jMTV2NnFvy5
         OiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447059; x=1796051859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vkrEv+PVcuudxd6R0af2wrFICM2sOzSUBrjd2eADlIY=;
        b=Ic+e4ERXMKmsiiKx0nD2lSAGXYrVGgNp1v2K+mDtP5ELnf0wggyZ+9Hm0Bjld3SCQY
         9qh+SrNL8PMKwcdOW55axKucetXNPP5ta58lBWfB53z8y8IhlTF4Sw4AOb3qeTp9RuNi
         WouLuUhv4PJZkKpX99306EPHGtp5Seu9kG66nGQpFqqfnmAgHWzet+pNtsggYvQbXS5I
         l3A51WxWwMiU/tBeoIHp1Owtsus/QPLqrRQWaYpFrnjON+AFM0siEpCSIDAT/jS9BAZQ
         zTcWQGSP+jizIQ69X30E9VuhWlRkiuoRdOzZ0u4C9PdxmcJMxXXWVMm4L0OCJft0vMtv
         ZDbg==
X-Forwarded-Encrypted: i=1; AL+hErG2UO8QwO1hZTu2iYB2lGnrRybGLyWM5mYvFhQDUQ4fWUBtnKFSkCwOfsBCrfgprIUIF2mh+60ZULk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bSb1h6t4u5GQcc/gMOOpJsHYr+oN682KvUWv4QRBJC01+0Npy
	MkGCQ9EFWszN+S0kkjB1iRnu7BOJ0RSwfwCRvV4cs3/4/Z3q8tJsvCO8J5RJ2fEcJN66CDVuOY1
	lr4XSFxt+oqEAVPgkx1u1zplcWmA14kyDe89OUo8LuYjL6FjM0naCYlwx+jIkvQQ=
X-Gm-Gg: AZFdTZfY/2617Waecwgm+lZUpUEiV5sRRpwEcTFxNV6iGMN03mU0OuLd/o1WIR/TV00
	6jWeoXV2L5iKB7eZ/8ywTCxvmW1bhNfgD6qK2fUeoXeX8yGYTa8HVbzQyJLpJJhClFChy4q9DQm
	lhQrnX7jG4G6ALh+Qi6KwG0xpIyYRR+xsBaXUf1TGGgKaHKN9cW3Cv4jKzAYAE3NEYgCVyLtK1P
	FddOEl11bspbeD8XnEQXMPlpELlllDQB9VV4qdEGcE+VXC1Vh+MS2e/k+uT9fKm6tFSSSduApcq
	i/i3hcw6MNfvy3IxdK3imt4b57LGapNefx6shDVqLErojEdFPLBTDSsLs0cpY18lvj77X7Sa4dk
	JfKS9rivAUGM9Duj51XK5x3VUJpEc971Fde7bYQO1arcd+CSO67xKPXLePhktRoSS4yPlrI8=
X-Received: by 2002:a17:90b:388c:b0:3b4:393:453c with SMTP id 98e67ed59e1d1-3b41c96fdc2mr18071163a91.6.1795447058661;
        Mon, 23 Nov 2026 07:17:38 -0800 (PST)
X-Received: by 2002:a17:90b:388c:b0:3b4:393:453c with SMTP id 98e67ed59e1d1-3b41c96fdc2mr18071093a91.6.1795447057989;
        Mon, 23 Nov 2026 07:17:37 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea28f4sm430944366b.33.2026.11.23.07.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:17:37 -0800 (PST)
Message-ID: <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:17:34 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfXwuDzjqe3bjoS
 YgsOmDdXlOvX+t5pFhqr14VrwyHiuvovlBZDNJVzruqzdaI5jci/IHDqbES/Q3VIZuiEzlDRsVJ
 fHIrkANIui5RnVvgVg5kK+b5qgCsc80=
X-Proofpoint-GUID: uyYWsHoXxm7mhr8jncWiyTuBIyZOu0Kz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX0RsIC/V9cX1o
 nBml4herWfRko0mcMhV6ZLIFeotCeB8vFJe84YhqzVyfKEIUbnLJrKYdXD5gtLDoBkSaufLh5cS
 sJcRrg71On6RQHUmfdECERUR/6yHi6CUDrpvmmFbL/CyfBoQy1IDwef7edu11SPW2rauiKgtAGB
 HEVuA8005K+R6aswnqz8DAfyC4Dlx1urAma49FRiiZjhl412qJo9y0SLKdxgnNw4SmBdK0+4tH3
 W5G9AGjzcqg2EEnvQTWUfBE+LV5JHgFn+mpyET5J94gF7Dq6rG0WcwCxfv710RGBUsDrvvARwdz
 QU7jKrH74Y/X9gVXQ7FGZ/tk1bvFJfCnolTquWhpFK0rVV8EL8dtiVxFici3BIrvojO1U4o6zBn
 svDAn/qTF9z7besv4ID8Qtm/7U+dkY72P1OUwhk6+F4+jWW2mtQ6lNL7IRl016ObaCWc5ibELXO
 /gVYR4c7jNuBiDrchJA==
X-Proofpoint-ORIG-GUID: uyYWsHoXxm7mhr8jncWiyTuBIyZOu0Kz
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b045913 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JVp1Gilkp8drtUWwDXwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230060

On 11/22/26 6:46 PM, Krzysztof Kozlowski wrote:
> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
> currently used only in the socinfo.c driver.  There should no and there
> is no in-tree DTS user of these, so none of these constants are really
> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
> that part matches the concept behind DT bindings.
> 
> Driver have local copy of these defines, thus these can be dropped.
> This has no impact on in-tree ABI, but any outside users would be
> affected.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

I think we can move it altogether, to prevent a situation where one has
to take time out of their day to analyze which one of these is right..

To me, this is the same case as e.g. glymur-ipcc.h where the values are
some foreign constants that are specifically NOT bindings

Konrad
