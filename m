Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFEF2040A3
	for <linux-clk@vger.kernel.org>; Mon,  2 Dec 2024 14:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733149637; cv=none; b=PbA1OJ10lNJb3+eqsDothxnsuklg3zobOrUzyn8PHV5WG6iAqhxXHlg3Rwi++e7YeoFjwZ5kl0m6gyw3hOyHre+qQAdeIv3UhaOwTDpLcD2xrZXxGIzuffij6wiT1RnFc3SCqoHajI13U0afMrRs79hD9vGTaKtq9cI5l3v9x5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733149637; c=relaxed/simple;
	bh=+0lEVZpYuOv7o3FMPc0Pv3lmHWLz3wqPArGyGpNBM20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJRFkLDKPlMXRMtOIeJO9zW2Io3a1OQQWSxED60iRuOJ8H/r0Sw8KNIWKIFTeRCxUSJGAXvfL7DCWEmoAsKXiwav6MrhlCshfkUVBKsQgCCbv9qs79KvIyZONOCzQEdDiiO1+Ckn4IYS8M1cDVuppFcK/rJnFKVXwl+2zJHG3KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myY+Y8Bf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="myY+Y8Bf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B29BTuD010645
	for <linux-clk@vger.kernel.org>; Mon, 2 Dec 2024 14:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YeWkuqOLf9DYYwHwIizxBSFI7lURFVcVl25PyvH6Ucs=; b=myY+Y8BfM83vi9/6
	KyvIhFydFf27ZZ0D8+FSH1xmDRyfOP5d2itdVgarA0LnYGow2Qa9vMVla2tyX3bk
	I6Npbco5QYdWo/rGV+EG39AjHz468w45/yvPx3fHa9k4vvEOZvAmbWRQyRCOwrk+
	28TZ4qKU8CDgeiOC4Pe8YP0UpDDxkCgSsLT2BSHIWbfyuLylBYPh2XoqPJPv9fKL
	OP7p9NA4MFBcgfIh4EljFLLJ/6NrjIjihjDhoUaZEjUOoYvbfav0FJ37p4RIBLP2
	iGWe5Id3ls7fPSeBGWCxyLJQJWKp0Y/Uru774w6y3wcSxUhhNosQlUxCDBB0AenQ
	M9YiXA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437snqw47m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Dec 2024 14:27:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d88a5bb5e6so7519716d6.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Dec 2024 06:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149634; x=1733754434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YeWkuqOLf9DYYwHwIizxBSFI7lURFVcVl25PyvH6Ucs=;
        b=b/obr1Olm4HAURAEFR6uen1vVwJQORHFFFgXh1U+qZ2B3fVbwc8O8mWrKIx2I+JmKb
         pz5f8ktvzR1Ag3tq7HmkvB7VHDuKSiRzFgOF1JOCqLHgul2KYyyRw8yl4pTgWgrMjWhW
         4zbWcaHKhsQX8B7r9EQBeOsg7jZfOSv9WtjkcpvkiWN/1TsGE1pbaFt/jcJsJjEswPPU
         vLtvhh2tT+GqHc3VbP5VUGVQIk8Ml9U2FuujW5aaoWryfQf2tp0nu6GaRVM70/4ubBVq
         Pw4PzOgIVcmR4SIYkabFpjCGFyv4R8sdY5n9j3uAfd2oc71m1/59HH7e/nFw4KKrgFk2
         7nhw==
X-Forwarded-Encrypted: i=1; AJvYcCXMjeBo5ov0G6zoadcVo7zj9DiyBey3h8MBam/gmActXob8m/1CgfC+133ZL7hBRplv/Yolms1IYJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpPMrEXyv2A30n8/6LuWyy4Ra2+JeYfW1/q354qMKcW+8TCqSV
	oUA/Xjd0pj/bfQS8dJYhPKTjw+ARmFZSypoRoU7tXSBNBr+BVZJZyoNqVyF07VHkGT8rHglN2PG
	O7LKL9FdFDDaNNzVDcStUfe5p1kjiVWRw521hX2OhItZ550xEiDnrdd1MmOI=
X-Gm-Gg: ASbGncvYgWE6Z3L4SgH49huQYX0k40vmXhdcbXypbW4DNuQ21xGqjFoLfG/w2q83PJt
	l2NLlbtItT8VVbDTfFwfpXCAlvL6hZkg3ahAFzom+j296/jfo/+BNMNi2CyJw43TAv/QMSJO5Ut
	xKx6cc26MlWimYI2v4+iVciVEB2JojxHIDEgN6YQWLWdx+qCgM1GODP66d29oiNidicQXQt2rDs
	6Hlmo3u3TRJNDG9Yunz988MuBlFKkEIChLO++M1f77SqgWos8xfx0u1jDzzz0NRAyNxmLVsq3zT
	tHek+v/N8ubjNZ6HLjlv1/rcyK0RFRk=
X-Received: by 2002:a05:622a:60e:b0:466:8c48:7232 with SMTP id d75a77b69052e-466b34b8be0mr143537421cf.1.1733149634239;
        Mon, 02 Dec 2024 06:27:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbCAAkr1jr6A8ylVsfj4i+aRWKGXXG6vAOJ8y8M6v6CeAJ/2w+sO2qpxpRsd+Y8DVmjmRKuw==
X-Received: by 2002:a05:622a:60e:b0:466:8c48:7232 with SMTP id d75a77b69052e-466b34b8be0mr143537111cf.1.1733149633883;
        Mon, 02 Dec 2024 06:27:13 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa599953c51sm512391466b.179.2024.12.02.06.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:27:13 -0800 (PST)
Message-ID: <02dd5593-38ba-4344-aa64-0913eca45808@oss.qualcomm.com>
Date: Mon, 2 Dec 2024 15:27:11 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-4-54075d75f654@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-4-54075d75f654@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Sgdy27djSHlV5iQIDU3NgM7r1JwWMEYi
X-Proofpoint-GUID: Sgdy27djSHlV5iQIDU3NgM7r1JwWMEYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412020124

On 19.11.2024 2:10 PM, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index c18b99765c25c901b3d0a3fbaddc320c0a8c1716..5119cf64b461eb517e9306869ad0ec1b2cae629e 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
> @@ -4647,6 +4648,22 @@ usb_1_ss1_dwc3_ss: endpoint {
>  			};
>  		};
>  
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,x1e80100-camcc";
> +			reg = <0 0x0ade0000 0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,

This clock is not registered with the CCF

Konrad
