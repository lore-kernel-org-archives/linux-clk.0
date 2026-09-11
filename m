Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F95D3EB11E
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 04:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789100858; cv=none; b=f5JX6FUOSAt1m6GL4w6uog2vkyDqcNSca83Pr37QSkZKo4ui5d/Qm+wOVHTgLiMa8FsIO+Y8aFR6kcZhnmGs56E86lKDwrTqmDndki+0MKVW9PII9Vo1KaUDxZri4MEdYHZ7c2qqSu+M0suA8cEayb2FwbzFU0pGb4FIqoRJSRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789100858; c=relaxed/simple;
	bh=l7BLvAbP/Pdv6FGDbaIFRrv/1rYKCBm7pQkhO5EUGVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=usw1CCz1MpBBHa5/HYARL64uLtFm5YpCWwylk1Wko4dT8i5sy2wNZDGnowCajBlJOiASoxKmdogmYJ3xB78/0LliPk7udOp1EVF8PvNJ5APtyfuoLoY/9D3OZQCbrJQwyMi7SllraStzlEvPZSmE7pivz57WIoS36LIwc8zA9y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYRqXudJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQ/673VJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYRqXudJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQ/673VJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4M0fB3877379
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 04:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vfz7qQYRlWKF32Rq/wiU5EozXpnv1dCrWhFFe4882nI=; b=dYRqXudJ6cp0K3Fr
	SWnA+MCtmlN9m0ze9mT0UoUcj+e2dtJl6W97lWufLI0R3kM6emFYjMwts5b/a97E
	MCNM8+QEmxYWniSSbYxfw0pyYoW2pMyDI1YgbQ/5yTDYNcsrHLCZDHJgf4SZYITD
	hv8NOmF9IgEzER8l/5vUetm6/3tLXVZ+ktja2UMkgKHp+rQ2IwVM3FpuUXcbjSBG
	kg8JyMISdIeEX73RnkHMg+WJLsZhqZsJ8+zddq2mMpqZ+qkRFO0o5atbhcxGI/nN
	xv1swcfZpqeW5ntAOX5c6xRCNWyMOxFu3OWyBW7KyhMZ3Jo1PK9+aTUxUTogEF3G
	2qV0Ww==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxd8u2g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 04:27:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4a447d275so869313a12.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 21:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789100856; x=1789705656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vfz7qQYRlWKF32Rq/wiU5EozXpnv1dCrWhFFe4882nI=;
        b=JQ/673VJXxLW6QYk8JRW0c+skjpfP+JeHUhsRtWBH/EyojGkToWBjCyjGSDdzpnhZ/
         NS6aXz/DyjsUlThwNuN9wVxLEtuNJqzvn44UF4//QUImWYxn+TeGv5l46xQ7S8/m2NbI
         OtheR/0mXsdTRKMLD8w8EtmJU7x+qH28QpUB5jfDQSsW9hpkngLDPV+XPzqLDIdtr7hW
         +3YtOcY5LWDdlBRRFnig1whsOUb9rqpJyrKp9UeFBk8Cf2bLXjBYS5pM6y6mShyStqhs
         UTZb++RHqivCKiYxFMibsSjG5dGul+cesFPH4vHIUqQ0LaASPMYCmYPW9mmpwuXxPjM1
         OUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789100856; x=1789705656;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vfz7qQYRlWKF32Rq/wiU5EozXpnv1dCrWhFFe4882nI=;
        b=l/XkwNaRMyRMBs2RTkJzGnCCwgho2Mr3JyD2ZZaj5zVuMeFW7k8TDp3Xkh+HYWgsO4
         PIcQ6GKyhGcznFkKhHAs2kI7po9LnIR7MtLa3YenC0KKw7kBBNNeq+M2pC6isMEctx5i
         Tp6R26ifX1iQTaXnacKpLawt5YXoFueTXAK8fUovjKwH9YTNwY7i5TIiQtZOl+CqHl2+
         L/U0mI2MzvJwcB1YUOkKexCJQCFSGrFPpLxVaN3DHpOrROeXROwOSChAQEqSjt++vbMS
         X4Oax0k/bcNQ6LSNbRSmgwADZ9lWXaFoSPoseHc3O+g00ArHrDqz1pyPlP6ze3fKEM60
         27Bw==
X-Forwarded-Encrypted: i=1; AKwUvBwQiUosFAfQFMoMbKdzwwLpFBa4wr7IoUIe+6csaCRD36b6Xj1j+yKX9ECUPeT61kB+dtNnpxDuiv4=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ3Shvme10MsSHgiXhL39eHe2UjbL3sjliJIWKKQpgi9l8BKaQ
	Qb6iY5D3YLdL1g5Gxs8wBYrrT2Swg84nguRE3xBe6Mx6rn8+7t3XoaLky3144wZw4P8ra6omKnn
	ZA3U60/i9R8xp8tdNqPDZwWJLveUJF4zJ5N+BvqTnyTu4of+MUkO/xCKyrsym5U4=
X-Gm-Gg: AYBFou1aHKmEKQRYjgRPQYQfnD6SPcMpNiQC2oMLU+cOooXHbf6W/+9pCxXb/qBOQxw
	TZicHJM8K8KnompromZW9k5bXB44ICOQHp+VxJUhxkEeZaefcvc0QSWuob5bOY2Z4YaOTfcvaZW
	E5OY/i6uJrHOluYU0qlAaVpT62nmasmwGjnHY0rC+GMpNlm6RSYOaAz7EaB47JxKVox1ycECO+V
	1vfY50jlTyLa1ydF2m9YQsRi2vLsE/aPm7hJFDGCIMqfWE16yyRHAQh5SFRAi8LdYJvlyOA/Y5S
	8DZuh34O6gk6Z/eRh7L+Nd4BJ00LvXiLurrpZpnh4QfQ6GnRpdRg3t71OSUBea1vJw6NIwvPeFQ
	/vMb2oBMwlxdhAunfOWUyojKp+RM=
X-Received: by 2002:a17:90b:558c:b0:39b:29ca:3d23 with SMTP id 98e67ed59e1d1-39d9c345ddfmr4018032a91.17.1789100855707;
        Thu, 10 Sep 2026 21:27:35 -0700 (PDT)
X-Received: by 2002:a17:90b:558c:b0:39b:29ca:3d23 with SMTP id 98e67ed59e1d1-39d9c345ddfmr4017972a91.17.1789100855066;
        Thu, 10 Sep 2026 21:27:35 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b5e1edsm3072419c88.6.2026.09.10.21.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 21:27:34 -0700 (PDT)
Message-ID: <3e322428-7673-4428-ae29-dabd9cabb974@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 09:57:28 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Hawi CAMCC
 compatible strings
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908-camcc-hawi-v2-0-f892ba1d118e@oss.qualcomm.com>
 <20260908-camcc-hawi-v2-1-f892ba1d118e@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260908-camcc-hawi-v2-1-f892ba1d118e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: irT4Y3oVKfG2uxRsT9HZW_YqmEIeSDFI
X-Proofpoint-GUID: irT4Y3oVKfG2uxRsT9HZW_YqmEIeSDFI
X-Authority-Analysis: v=2.4 cv=PchqFShd c=1 sm=1 tr=0 ts=6aa38338 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5R3-X4UbMoIwJvzG15sA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA1OCBTYWx0ZWRfX6bPMiwxgxhs1
 ypn+VqnZ06oCkAgbScV0HQSHwY4paD3XV2la0RQfw5k6HPWIts8i1REONkkpsqxOMHzOQUOFSRo
 HXlsjv7dmwuU5BhxdSdi2SJhyAxgb5gRa4JUq8M9vuh6Tk3vHKFagrc2sNHRXF94KNQt4j78VLO
 cTXoomlOeTeHUGrxOHnfhh0dCmK2+c159Hkrm2kGu7AZxj3NTbujCTEODNIw5PKPAAzEhSoybov
 NwFuZEksYURI+EB2inkY+VFkQUd6rYg4R/OGQRz/Vl9Xcd829tC/Djk5YZPhtsrRgHSmTg+htYg
 A7pAhTB9hnMt0TOpBjQ0DATKaZoRqRtVnR+YCVUKurfgmkxKQ8Vxa/kYDPYeogDobFoIQAyyedY
 JrJc9hCAwFnUXYjEAq1c9KPy9hHHE0uwqXXVHRvrHnTKZaDpoOwXK6GPsrphisxOnRhU3AACKdE
 gMa3lCOWCs16vRDzPww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA1OCBTYWx0ZWRfX90rKPLvgFeof
 7AOBEzxgIQoOwewvGXIrlUuvYo1AQEHaOSk+NgR0mlt9eJD/Mv30P4sOLTGBf2l8ByNL5ioOqNC
 HSk5dFHxpoAaiTMII7QCWe/tl2Vse+8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110058



On 9/9/2026 11:31 AM, Vivek Aknurwar wrote:
> The BIST MCLK clock controller (CAMBISTMCLKCC) is unchanged between
> Hawi and Kaanapali, allowing the existing Kaanapali CAMBISTMCLKCC
> driver to support both SoCs without modification.
> 
> Add the 'qcom,hawi-camcc' and 'qcom,hawi-cambistmclkcc' compatible
> strings to the binding, along with the corresponding clock ID header.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-camcc.yaml          |  27 ++--
>  include/dt-bindings/clock/qcom,hawi-camcc.h        | 165 +++++++++++++++++++++
>  2 files changed, 182 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index f65380747220..3e6ba5505584 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -16,6 +16,7 @@ description: |
>    domains on SM8450.
>  
>    See also:
> +    include/dt-bindings/clock/qcom,hawi-camcc.h
>      include/dt-bindings/clock/qcom,kaanapali-camcc.h
>      include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
>      include/dt-bindings/clock/qcom,nord-camcc.h
> @@ -27,16 +28,22 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,kaanapali-cambistmclkcc
> -      - qcom,kaanapali-camcc
> -      - qcom,nord-camcc
> -      - qcom,sm8450-camcc
> -      - qcom,sm8475-camcc
> -      - qcom,sm8550-camcc
> -      - qcom,sm8650-camcc
> -      - qcom,sm8750-cambistmclkcc
> -      - qcom,sm8750-camcc
> +    oneOf:
> +      - enum:
> +          - qcom,hawi-camcc
> +          - qcom,kaanapali-cambistmclkcc
> +          - qcom,kaanapali-camcc
> +          - qcom,nord-camcc
> +          - qcom,sm8450-camcc
> +          - qcom,sm8475-camcc
> +          - qcom,sm8550-camcc
> +          - qcom,sm8650-camcc
> +          - qcom,sm8750-cambistmclkcc
> +          - qcom,sm8750-camcc
> +      - items:
> +          - enum:
> +              - qcom,hawi-cambistmclkcc
> +          - const: qcom,kaanapali-cambistmclkcc
>  

Please add the interconnect property in bindings, similar to
Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml

-- 
Thanks,
Taniya Das

