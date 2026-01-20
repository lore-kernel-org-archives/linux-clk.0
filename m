Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D396533CEBC
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 16:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768927923; cv=none; b=ANeaTwUEZsoeISouNwXhEc+jF1Hwg8Ll97veBmyEPayjjvSplgvYF4XNCNzWD4r/P9CTv4fjrZnIad4+NpMBM5JvsYr3qBSxysM8IRLSgCpphIW1hpYhOLLB6o/PRb4cOV0Le4mqKyAuctzlKnw5nF2CiwQr2jfMJ5nFGY1270A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768927923; c=relaxed/simple;
	bh=CCPuKReYRvj41JQnhT+HuPW9azB1zQxKUlg4cII68YM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGYDscQGqS634kQapswlDfD5FM+vy8aL2+9/zQymstvcSIrRJvcYsQLDYb4xQp9PGgk1U8bCZEtd6S7r/MlS210V5Ya+Rw5vNQc5gsxmvptCcYyM8FhiQBRagmbZVwNnVGGu3mvSoncpsFZBvHur/86IF+YW3iH5Cuc4rcBNB+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/LhGTpL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aMVJwbeQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/LhGTpL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aMVJwbeQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KDgQBH781661
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 16:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JalpaZr5yUHlMHrok9kWcJgMbCxWC5tE8ZNzAsaa1uY=; b=A/LhGTpLo+qcA/zD
	7r9LZxOot4g0vp9T5qN2dBy0K/D+nuYRlTyeNgvlMKKcjYGpxypDfmUig3q3ajTx
	j6yf869lBaItv1xkZs2OGLzI8fFv1TLnHDcyssF2JCa+K9x/avgf7PSCkBDZsEsY
	mi6kXz5jE1IT3dfctCe0YG43yRadMP6zsnQH2sAH0z5cT60nLzAxDKc39+LuFu9n
	E2lxvNmp7YG7oN36C8MfurAvG+jh3xZ/Xg1IXXTiLWal+4iq5PnWlfPpfuV4juzc
	SoGTzqEStuO75Rdt6pAx86Wqsfo5mNxdBUONdNBer8e0oI3mLI9RuEicwPHnpArZ
	umGqDw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btatyrmuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 16:52:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a78c094ad6so1950405ad.1
        for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 08:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768927920; x=1769532720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JalpaZr5yUHlMHrok9kWcJgMbCxWC5tE8ZNzAsaa1uY=;
        b=aMVJwbeQyD2BFa3U27mjilOa9c5OpDsOPh5oR67LdipG9IHsyTvSSc2b4afh3PHM5i
         IarkGk0PO6+2NRWr64b49uF5uV2tqZUxoNwKy4E1uKCRTSc6lD9w3LELIClPwwBBbKv/
         qHgqr3v0Ob+oPhq1tHxoPW4LtBRyQO4wxuCBooz2JZ16Pqf7GdJFhUKeTrEELKnbccxW
         00OPvH0+1BKBEduyHGAtgU+8aH2SkBB5FB39hQgY3EQbnF73ypKeAHDNmZKEVwrerZSv
         arVCmSvTQw0bGsL5rcNGqvUYoAmWfAwwWeAwo+/ljFMkK175Z7Evq2YxslTipcrrY1oO
         lTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768927920; x=1769532720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JalpaZr5yUHlMHrok9kWcJgMbCxWC5tE8ZNzAsaa1uY=;
        b=oujXY8MA1JYeVAwyp0UxpElnwHSs3fSZ8oAFmtLyon0dDv/5+lRYetZyPLbkyKwseK
         /vGhpzvkjI9W7VlCwf8X9+ysOzWQnRj31+K0oKt22mO+KPcHRnoiet5owcP8QXJKdhI3
         4FwM1IwMxjTAQ1GwLj+MmBjEy52XGLbhanuZrxpYBtYZ021D2UPS2MPJcBFWqn0vfYHN
         sDITw5yuMyIJirQM964FvKe1qjEn49BBMX4N4csrrbkBedMUIVJkcLYkyN+5TwvcD1dV
         t4ttIcQXLcbIcfqVx2lx+OpJ/A3nWT0d3nsub2vVJCRiCh0BbUbPr+g92oDtKAMqMgqD
         1C7w==
X-Forwarded-Encrypted: i=1; AJvYcCXkfc/evYCoGPapYORRMgIJb712hTjVPLtV93a2HwRhv2SysCQZeiJtnsSFpKiWNQPzwRNQACnIxxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbywRCXJ7oR3YvgpDma2f4R4NNEJ5BjMnCXJuy9Um0FaGd1i99
	HoR6YkG1bs8bp3GZhY8nDZUakhbkxHPt0TACJ1bZSHZ5Wq2gSxw5uhs9y0Evi6lWG1OER5F0uvN
	4if0c5PHl7arErvOzhrdEgvmH1LLqHZ8mrStkWavEToVgbH9L8wpYMB9Ribr0OGE=
X-Gm-Gg: AZuq6aIIGnH9Q0/BENoGTDzLRhB6oqw1n8C0oy4ast3h3OHzwgUEOPHBpWwrUufaHOZ
	sPs+f7m0wptKBPcHvEymZbNIhpwqPngj0prFQbq5wu6olvCbuolswYcSLim6DlkwrT9bSbqjYBQ
	4bXVmYgaGHjYDwOqdF2V4cHcx8rfHMgBE/59FaSzmPB6xxmgYKVzQ1K+64cBda9K7iUc0AQ6CKG
	JwQrZDhRQ4hVIFdKDr/Usm6IphXOtUb3Bkhsdjwt371p/2lUDvznVXi7bpKHGuHGhdMPnRV6frq
	SvoUASnnfzhrq15vuqy9+JeIyvmTM+G6myzamc5EDKbZEsioC1kEKjxYiWbY9rYaOMZnmetP5pM
	ocdU7vGpXIfciGSaY1cbbFGQow9uqcazqvMa0lA==
X-Received: by 2002:a17:903:228f:b0:2a5:8d30:58f7 with SMTP id d9443c01a7336-2a76923cc64mr22709705ad.17.1768927920131;
        Tue, 20 Jan 2026 08:52:00 -0800 (PST)
X-Received: by 2002:a17:903:228f:b0:2a5:8d30:58f7 with SMTP id d9443c01a7336-2a76923cc64mr22709425ad.17.1768927919485;
        Tue, 20 Jan 2026 08:51:59 -0800 (PST)
Received: from [192.168.0.195] ([49.204.25.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71942248asm130052615ad.98.2026.01.20.08.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 08:51:59 -0800 (PST)
Message-ID: <3e973c02-c804-43c1-863d-bb160108face@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 22:21:52 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,dispcc-sc7180: Define MDSS
 resets
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        cros-qcom-dts-watchers@chromium.org,
        Kalyan Thota
 <quic_kalyant@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Harigovindan P <harigovi@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
 <20260120-topic-7180_dispcc_bcr-v1-1-0b1b442156c3@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260120-topic-7180_dispcc_bcr-v1-1-0b1b442156c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0MCBTYWx0ZWRfX+ge7OTQpYolI
 hixxPqzDo2EYWQ9LP1fzgV1IFhhhMttI6BN88iNxH4gs1VytkMdLg0RwMTm1Txw2xfk+9o8ARpS
 FwmitL9KNO2xoGXRLjKsZZlYHOf5LwOn2+1fl4ja/5pgVCfRHc+D/nSXaie1tBSaGT8eXIQiUlL
 quUvjuuZMw4Cvx9EXqt/78POhNJ+4yEvbLxNDnGMsXWDTAGvcRKcvNgbtY/MTLts4IYbWAqUcdz
 1lij0q8moY4TixDmiE9Y64hqn8hFrpFGsZzNoUHffcqIqJhYQyXjCm1VGeh8Zs6fh4ey7HJhsmB
 w6HE/dHvBWwexviRF1YC7Fra9WePR43jS7uiJEB7PxYLdL242Mz6T513r4v3x+moFzmdVmZeSJ3
 bQUsGEa1k9utQ50BL+ffEZoa3dB2QLJTVcQ20/NOQWX/ZnaHVPaywG5BF32aTecKUNUnlTlpqR4
 chyfSuxgqUW+Iv6MtRA==
X-Authority-Analysis: v=2.4 cv=IYeKmGqa c=1 sm=1 tr=0 ts=696fb2b0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=NUZ/Q5sP+scsJfd5oYcUKA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=o43xtqzOwXQgjmHM5CwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: kUgKLpXXmMRSVoiO1HAC3F_rW_fihfAK
X-Proofpoint-ORIG-GUID: kUgKLpXXmMRSVoiO1HAC3F_rW_fihfAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200140



On 1/20/2026 4:49 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The MDSS resets have so far been left undescribed. Fix that.
> 
> Fixes: 75616da71291 ("dt-bindings: clock: Introduce QCOM sc7180 display clock bindings")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  include/dt-bindings/clock/qcom,dispcc-sc7180.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7180.h b/include/dt-bindings/clock/qcom,dispcc-sc7180.h
> index b9b51617a335..070510306074 100644
> --- a/include/dt-bindings/clock/qcom,dispcc-sc7180.h
> +++ b/include/dt-bindings/clock/qcom,dispcc-sc7180.h
> @@ -6,6 +6,7 @@
>  #ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SC7180_H
>  #define _DT_BINDINGS_CLK_QCOM_DISP_CC_SC7180_H
>  
> +/* Clocks */
>  #define DISP_CC_PLL0				0
>  #define DISP_CC_PLL0_OUT_EVEN			1
>  #define DISP_CC_MDSS_AHB_CLK			2
> @@ -40,7 +41,11 @@
>  #define DISP_CC_MDSS_VSYNC_CLK_SRC		31
>  #define DISP_CC_XO_CLK				32
>  
> -/* DISP_CC GDSCR */
> +/* Resets */
> +#define DISP_CC_MDSS_CORE_BCR			0
> +#define DISP_CC_MDSS_RSCC_BCR			1
> +
> +/* GDSCs */
>  #define MDSS_GDSC				0
>  
>  #endif
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

