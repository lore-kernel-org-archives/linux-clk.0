Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F85476CCD
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308330; cv=none; b=svgNwDu0Agi27Pz7cle3/v8NEiWI1+1ce3Vs5xnFONGnFPNXqGZaQqqZYoDdZIWAMfLe40Cd3DY/PTqRdIds7JxAt0/leVZDgAReoOP8GNGFdXNHvmRwwoIryAOvat9TrDd8L3c1Rkr8nGGCHIBTYEynTxfuB1XLvjyWjFxNuN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308330; c=relaxed/simple;
	bh=zosSe2E/ZqD40uYiqTnsIoI6CtU2hb2xgOwBPZusLho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INSvzg2hwXCs+WnPW1hp0PjB3s+mmgxgQ1V3pnYAYtECuwfmZ+3XVv1le1esnoTvkrI52bdPzYrLGe8y/b6gSngwpVEaK2pYV5oWmmvW29FVvNlxdCeUhG80857rEKgmUNwuZE5bNMzBXQmKZlPPFfaA656pVAlnttVNSDIufHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kk4VTiGm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAIdNZsH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kk4VTiGm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAIdNZsH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9Lxig789835
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hGKEQYpSuSXB/Y56MesVtsGp
	Jo7XRCToceowX7JwN+Q=; b=Kk4VTiGmSS4bsU8hB66aV8jAbMyuqKtjz5zW30bh
	k6oxKfZogeuz+Z3y1nip1ixM2VFhveniiiPl8pT63+GmvIaczTBybMkfbxkbbSBd
	2svBEhy94uahK4Jo3MfuSf14xc0sZCEMaojqIfC8bqYqgVpK4DxqmYjz75rrFJQx
	hBNkAyb5VTgBz2QfuFVjtU/qtvKYyFM9hWNJp5sf7PpgkDuF+YpATTylgWASNJgg
	YzvHSvd6MuYTseRRwSFaD86lbXlydP0L+s3+tBcKhPFupoW07AhS/fYpVTX+kLTm
	sKdVviYecdLwLWfWBBFAOcxOD/OfEa5JSP3lmnVyowtjVQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ebusgj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:31:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ef13b61bcso124877085a.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 03:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787308316; x=1787913116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hGKEQYpSuSXB/Y56MesVtsGpJo7XRCToceowX7JwN+Q=;
        b=aAIdNZsHXkvqidISG7C06qJwFAKt3YFI/1SWQPeUX77YArstPH8f/Bi43R4ef/fylE
         d110DBPBlZatQ82k/yseDynuz8zII00Sg2I8oB4qWUW2iwhwM8jTlHXWIlYTa2sVouP7
         91vEcNv3h72SnuoA46NjFHcFByT5U3zeWTKEYymQWdfRQtfMrPaFwb3gmu401rw5kKIO
         OU1sVgK/ktKLyTurBBeyPNEP9JZho471DDBvyiDt/dE67F3zgScW14tnUGZK6ZApsC1q
         a2qx3WJXnyNN2/DsVltF9b1yXMwPCBP57QmLVJn0i9AbOU4OuHqIdkv9UN6qBkrsxpzC
         hwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787308316; x=1787913116;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGKEQYpSuSXB/Y56MesVtsGpJo7XRCToceowX7JwN+Q=;
        b=qdjI4Svo8HlRIjL8UV+Fe92PqVnOlQ9Oo15LeAyb7Xb0sK7Kkjn9yA7C9xinBUJQ16
         S5N43JnleXODQbEAuYbcYwZxz1z+zdtx85AsxOL43vSElcwxHJrePOVTlw5fqgYYs8IF
         xQcNPs5ym2H7gIyQ6XyEaqUxUFnnrui1waBCOc7bBps7EUwbbYFmBMZFL7GLso5MiA2o
         LdXNxRViO5VK3bKND/8YpFjka189V5AQNqbt2dGeiZdzZ+bN73KdIaTPbal+slkX7OZb
         0pasQbQmVU2prGjar8/ov50isWuikB8S/KAQXBvpRQHlyvnMzkZtkfMD3vzN2CC+WOLo
         U4Lw==
X-Forwarded-Encrypted: i=1; AHgh+RomKjyr41z62+K4pAnVYioeuerHGeiYmo04pJrqiQbr2Q7HD0wA6NgKWHave7KKUsIIzd2yRWf0GMk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2BU+iJkeka+v9/XD53sbpABrsWpwFonHU72jEqKwNNBNGPQIC
	pA2WtPwoB319onPkR7fcr3r01mIzdjTXsS0qLIzZtWfpFjFyclhpwwnRRY4AS4zlQzFbjzj0N6i
	lm41OOni0O44ahMIL9KDUhIZHVJdhxm4tBPu5+xQpcwmohSk5KN6e0vdDi7cPZDo=
X-Gm-Gg: AR+sD12vO3fYw1Cq8wAoqFU55XFIk2C/xPm1yUzDHYNVaPb8ra0H4OpsOeFyRclwZf5
	JEpB7q8nVlGcw2qGQ69EOdCD4PoniIBpjRv9hceWdLFKrrwKJxPXf3v0kj1Zfpg635kYO61PWQI
	g8UqUUPBgm30Jz+3sjsQ2OHqqw01F0M0ABK2helMUcndwWV7RwYotfvMxWO3iCHzFYGG9zT9/ja
	iZinrYLTuIT2X72K4OoXzIGvxmfA8sPW7YKmOpLPDyhS8bEwCIQJkpokmFHxs4NWefw3kO8aHIC
	8oB03Oxsu7aY77vbYXmEmKfw8JY8Knh7W6sPSNBhN604y3CKWHFbzLUWDNzu3PZZKnrz340O4T4
	cyNmgwQgrlu6ac3w=
X-Received: by 2002:a05:620a:6b1a:b0:937:1097:feb8 with SMTP id af79cd13be357-93739537a62mr334787585a.24.1787308315845;
        Fri, 21 Aug 2026 03:31:55 -0700 (PDT)
X-Received: by 2002:a05:620a:6b1a:b0:937:1097:feb8 with SMTP id af79cd13be357-93739537a62mr334780385a.24.1787308315259;
        Fri, 21 Aug 2026 03:31:55 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589d98b0sm398453166b.6.2026.08.21.03.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:31:54 -0700 (PDT)
Date: Fri, 21 Aug 2026 13:31:51 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, konradybcio@kernel.org,
        tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net,
        lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 13/13] arm64: dts: qcom: Add SM7250 devicetree file
Message-ID: <cgpmlh6hw3n67bgc7sxjrrixkxrxfsajnwwwucqzklef7zkusr@xiafwn2agcja>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
 <20260821081125.4522-14-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821081125.4522-14-sreeshankar0910@gmail.com>
X-Proofpoint-GUID: C50VAFkF1ZA5YLFlr9EiKpoaIfMJaSl3
X-Proofpoint-ORIG-GUID: C50VAFkF1ZA5YLFlr9EiKpoaIfMJaSl3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX9zIN+QtRE25I
 Ses7xX0vyRSfqkGybEqPeIrnZRZu7qnoAOjgbq0C+kiI5pgZJqqiWVqPrEEmWXeKg4AoQLVYUeu
 8J/Oqi/PrxFnJJfd1x8VddxHEshb1w4=
X-Authority-Analysis: v=2.4 cv=QJlYgALL c=1 sm=1 tr=0 ts=6a88291c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=Ik05HghEHh1AHjvg2kYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfXxP3duqnbYsok
 e9A5pPv8WjilmR1D+astnIV7CUiBIqpb9+BQKAuoTrKLUpoXj+lXp5bTWw8P4xEBIfyMHktcpTr
 l4bD8uPs0gwAXH+M0D2kh2U6nGFE3NmBA1W0Gbys+8H33RlqkxOgeIReCKRo3ttft6f7VD5GB5d
 Gl/KVsOm+YqIJf7GdYWrBp7STATmigCz9R4gx06tqNzFtJry3uKP3TjditPaj/H4+gGFOx8h+f6
 VPRag4h9O4TJxYuoUpDw7KGL+bcW4mF5Ih642ijLmrXTADL/qNN1zHi3NgvkAE13vx8fGzfyGsP
 KEGWeE6XPdOVjUq7kzJTmQTSF1vEx/Vpblduptju38ZjliDJZayMfpuKXQFWwi7Lah2qoiG25qj
 FXkdZDOnsYSdIktP75B8RiP6W8v4jvBEFTmMR3CFBwu6MlPUxHAwY0i3Q+Ooe3Z0ETOKSRqmMSf
 YKRhy0HlAfkdhWZ/vMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210078

On 26-08-21 08:11:25, Sreeshankar K wrote:
> Add base devicetree file for SM7250 SoC.
> This file adds the basic nodes like cpu, psci and other required
> configuration for booting up to the serial console.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7250.dtsi | 612 +++++++++++++++++++++++++++
>  1 file changed, 612 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7250.dtsi b/arch/arm64/boot/dts/qcom/sm7250.dtsi
> new file mode 100644
> index 000000000..7caa11c80
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7250.dtsi
> @@ -0,0 +1,612 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> + */
> +
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm7250-gcc.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/qcom,rpmhpd.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +

[...]

> +
> +		cpu3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo475";
> +			reg = <0x0 0x300>;
> +			clocks = <&cpufreq_hw 0>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_300>;
> +			qcom,freq-domain = <&cpufreq_hw 0>;
> +			#cooling-cells = <2>;

No capacity-dmips-mhz and dynamic-power-coefficient ?

> +
> +			l2_300: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-size = <0x20000>;
> +				cache-unified;
> +				next-level-cache = <&l3_0>;
> +			};
> +		};
> +
> +		cpu4: cpu@400 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo475";
> +			reg = <0x0 0x400>;
> +			clocks = <&cpufreq_hw 0>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
> +			dynamic-power-coefficient = <100>;
> +			next-level-cache = <&l2_400>;
> +			qcom,freq-domain = <&cpufreq_hw 0>;
> +			#cooling-cells = <2>;
> +
> +			l2_400: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-size = <0x20000>;
> +				cache-unified;
> +				next-level-cache = <&l3_0>;
> +			};
> +		};
> +

[...]

> +
> +		apps_rsc: rsc@18200000 {
> +			compatible = "qcom,rpmh-rsc";
> +			reg = <0x0 0x18200000 0x0 0x10000>,
> +			      <0x0 0x18210000 0x0 0x10000>,
> +			      <0x0 0x18220000 0x0 0x10000>;
> +			reg-names = "drv-0", "drv-1", "drv-2";
> +			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +			label = "apps_rsc";
> +			qcom,tcs-offset = <0xd00>;
> +			qcom,drv-id = <2>;
> +			qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
> +					  <WAKE_TCS    3>, <CONTROL_TCS 1>;

No power domain ?

