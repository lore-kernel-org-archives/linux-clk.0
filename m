Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679916;
	b=Fa1m3+vDRoj+8HU7VqW+947hKgHa/2uHR2X5uw6bAo/xoKfLJ61sVM2Q3hsJghSoFvzH
	 Ri+1G5ZuKQs5hGqJODxDevdfkbBx3G3rZdhXQdxpaSpgdK3dX3CJUzwQ2kAgPDeaG44ep
	 k4/aRAXV690RNNLSR/0CBaaDfI+t/HM8i5Rm6Fw0pJTBywtdM5/JS7+EsDsan39+aVLWz
	 BmmOtql2JTIBf4ZOL2vol6aJwylt1u9wre0nmca55scMX2PFfN3XtdBQIyAo5nuROz2w3
	 vvOmpeFcpoY3zFyk9Jm84BrzJtiaX5/RFEmIvMnW7i4U2EG6+3L4gMGx8OpxI0FYyNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k8RE6TwfItMQ5A9So3pJFwA1WDCuYnruw5LAZlu14Pc=;
	b=E0MoprSH0pcjxfZzwTyZcJNR3cOo0ZuA+r4eELkn7IYeaK3XQuadLGfLq+UDO0tdyKeA
	 x5oF0XkXymi7pEKJ7aR7wFSaQ7ZhKkxqA/Z3WT8SQrvtRZj7g1Mv0oh0DGL2WdH8aN8tI
	 rxQFkdBtsHgsUHxa6wCDcCsQiDOEj1Z7KUc8CjTfDkJZYyTNPW+NuvWpKrVb16K2rQhWS
	 ER2Fe0gU2qy+rxBEfusjXVDY6Kwnxv0POEJ4afF4VRM5Br5t0rxtyMlwTcVR4exxq1wSy
	 ezuEBHo21jhmFSYfT6KEETXUXr8qVSmoIhTilA78VNxeNjEaMAXwJBXUs7iQQAbkwGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N6/aM3zc";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FdSbbKvg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF60606A326
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 04:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBF60606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N6/aM3zc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FdSbbKvg
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eNrD1431359
	for <linux-clk@vger.kernel.org>; Tue, 3 Nov 2026 04:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k8RE6TwfItMQ5A9So3pJFwA1WDCuYnruw5LAZlu14Pc=; b=N6/aM3zcbl7k0u00
	e5TO0kazy15utKXB/r1OPN13M38DYPS8uVHOw3NVIdXlY5UP24aulLHgVBwR4rXW
	esu22t3s5Rft1XsLyeYcG9xZFDbCPaxb8GmNsqh+/CXlTsFtG51ihdQm6zqgZXaU
	kOL3Nok5k7LtRTSG1p3pxoGNsUzJrNuvEeS+djh05VhFhMp/PhoKFgch35AiQZBd
	jMK7eMhHGl1Cir+vO5ARZrFW2+yUsgO3mBWiA59GhPbY5utUFJrViQzBbRqYEkij
	I1s7PHX+y5Gz1T8u8CKGDpvWQ4V8vvIuuocQVUt8t6tygL4TpPei4fnPwwDyFBXr
	hona0A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq0871vmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 04:25:14 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b20a4b5f2bso1578381c88.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 20:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793679909; x=1794284709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8RE6TwfItMQ5A9So3pJFwA1WDCuYnruw5LAZlu14Pc=;
        b=FdSbbKvgszr6GxF6mkGZXZVw/wpjtBqE2sQiZxH2xKO4PLCeDK+Dd2alFRtFdc+Bw8
         bSlibnsNMog3DW+yAXerxdVPbIwiQDhbKB2CxuuUSvJ6jHaDGfSDY3OG3Hs8lJCnWZRf
         6Mne7jc/wJDXrPNKh82RtMa+XVHHRIAXbJKoTJpgiFZHEBoj8EswMGiOoikHBTH9ZtSU
         HN52krRKfFaOtyYogR0kQ4elLsDn2z5nYMazc9wBXHgp5yDNdWeIEhk22H6uisAWZL42
         w+xUBFajPWHrkHqF9++zEws6xTzXvuYlazx+hfc/6LEX9yusKw4+kTQRUCQPGD4wFRYJ
         M5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679909; x=1794284709;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8RE6TwfItMQ5A9So3pJFwA1WDCuYnruw5LAZlu14Pc=;
        b=LRWQ2XVbhqvIzBPMiL+HXvWwkl33vX6YXzw6xvNlidD9AA0Hu6HE/D258K6R/hVALG
         +bUj6DNoNFeNODRfTCPbE0tbQGeM1/fsU30KW0zWxozCq0dG7SP1CsxcW1WlQVsqlxoV
         EhyUscy26K6oc7JXI3rxqAK+W0pbetug8XOsGzJf3DO78MHbZHcG0aInfZsIigCuTNOF
         QPG4In5pM5hIcHCq1ICw5ILdTk7KK/2ceReifTpoJuSdnhct3423odhGPpg96aGloZ8o
         UX0QDyoMZS0zQe91OOeAoaxEZ9bUizhgEfq8SzWYhn8yQNl8vaXq6pit2VOHOtj3dJra
         FxnA==
X-Forwarded-Encrypted: i=1; AKwUvBwHu1swZuPDxyc6J7BACnlO3c4vkUqhiLJwi5HDYG9jKus1TZDA/Z2ZElRRBD5DF41+n0POrMNK2ys=@vger.kernel.org
X-Gm-Message-State: AFq9FYKljdXn4xQ6dM3LuGaANPnZqmfI8T1d4GSfF+wj7JyZuGv7fFbO
	+05zbkR0e1P4ofMyROAg5R8yRJgjMonlKf/fUDlaIVa2BZv9iciqf5rYfb9hmszoTPsOfJVV4u0
	gpSfARCB+rDPqs4hSXIl30FVPs9TkrBdc4OSDFzKea3obBFrkXqVKa60P0LpSXxw=
X-Gm-Gg: AYBFou1co0Cky/I4wxWf+ks2KOMoAYaLey2VTkMX+xNp/ISOhbHmas05oUKyUldrKtl
	FxwuSTpYGJo9h78WaNslPGDj3emkTPzq4AeUOziTpDCMpiy5HwOo3OtBrSFXbMjqiXYdITfrzDq
	6WBfNL1m8L3IFAtBP55zHzsJy5Q8z2ferkVEl4MA0G5VwBf6xBzGZEIetcDeIa2shKOV3CoJgkl
	/QTQ+rgwxuCsV34UuOqOKktj4VBoAlyg+J18AD2dHjvqFMG6VBhhQlmKV6qwuGbtB5nAW4+1UyM
	EXhsk4g5lBTNH9lbNdU3Set4vrKxAwnlMZHN1i9QFMd4nqO/Pu/+7FdadOf6zCMSj9ttdwUSPSz
	xMgt+a/47SPr/aYgXs3KSp4PlF+PixpDFH/9AjwRiUKGWbYYZQl633/iInBjKNt3nWazAS/8YDl
	bvND2M
X-Received: by 2002:a05:7022:1587:b0:1ab:9266:f50 with SMTP id a92af1059eb24-1ac6088a626mr19395742c88.46.1793679908276;
        Mon, 02 Nov 2026 20:25:08 -0800 (PST)
X-Received: by 2002:a05:7022:1587:b0:1ab:9266:f50 with SMTP id a92af1059eb24-1ac6088a626mr19395687c88.46.1793679907449;
        Mon, 02 Nov 2026 20:25:07 -0800 (PST)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm38151737c88.5.2026.11.02.20.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 20:25:06 -0800 (PST)
Message-ID: <53aaa9ca-2692-420e-ba01-92276e21530c@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 09:55:00 +0530
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
Subject: Re: [PATCH 3/4] clk: qcom: av1ecc-glymur: Add AV1E clock controller
 driver
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-3-448a476d54af@oss.qualcomm.com>
 <d466c18a-9d33-41d0-8cdb-50af409598b1@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <d466c18a-9d33-41d0-8cdb-50af409598b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxNyBTYWx0ZWRfX47ioZZQi2MYq
 ZOa/VUL/qV2OTru0q3ATq99SNWVL5015+doeM/xxC7wVBZFVLFJJbDuo/GWUTKnEAXBrllg3xc8
 YAAO5PKoPRH61S+6W7yKbkl82egmYTE=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9622a cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JqfvKU5N4-ixcu1LdSQA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxNyBTYWx0ZWRfX0j+LnYmEZx5D
 qbMTqdXN7zHRP8p6HlWFZKuH3ajZ1MSE7LuxD5H3kSQimlFFK0exu/5NHw1CyP7TE74I7eaHLbF
 a59Oz2FsrLLi+KVqhw4xAI5d3M7s+qbzqNnwrU60XwILi2OkP/aalRgN5EglvyVGBA94UY3+ngY
 rDNnYs11JX4CufO2Z4AI7jPWLD44xOuoeUFnhZ4pD2GiFvFB25mhAt+Klp+7xxz33s240g9ZY7E
 jfGaE83fEgykGhqGUEobwUq2x7iTgrCePfICjLKj9dAy0ISsVcOd5QPSPzAR1uRsIVdut2mIKgS
 XXQ48XRIApqvDmks2qplVk7dHQ9F3Eh3MtGtwRNlgkMJYgcP3vO4izmcUQGPLofHJXsZuosrqYr
 6SVYZCLDPjreyPdxdhUot3k/2bNmxbz0IJzDJHKFqPtqcWAiTs2qXGGnwaRkOI90UteDC/mdHcr
 9M9HDN+BSaYXtAWn0tw==
X-Proofpoint-ORIG-GUID: I2uzBLa1ycufosWpZnSfCz0KcyL0SpCv
X-Proofpoint-GUID: I2uzBLa1ycufosWpZnSfCz0KcyL0SpCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030017



On 10/15/2026 7:37 PM, Taniya Das wrote:
> 
> 
> On 10/15/2026 7:05 PM, Jagadeesh Kona wrote:
>> Add support for the AV1 encoder clock controller (AV1ECC) driver
>> for clients to be able to request for AV1ECC clocks on Qualcomm
>> Glymur platform.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/Kconfig         |  11 ++
>>  drivers/clk/qcom/Makefile        |   1 +
>>  drivers/clk/qcom/av1ecc-glymur.c | 393 +++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 405 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 27d0ab24d50a4ca5587ed8d6085c4d6fcd57eb8c..94f3445f6bd0ecd297d83b5804ff0e4433d48261 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -69,6 +69,17 @@ config CLK_ELIZA_TCSRCC
>>  	  Support for the TCSR clock controller on Eliza devices.
>>  	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
>>  
>> +config CLK_GLYMUR_AV1ECC
>> +	tristate "Glymur AV1E Clock Controller"
>> +	depends on ARM64 || COMPILE_TEST
>> +	select CLK_GLYMUR_GCC
>> +	default m if ARCH_QCOM
>> +	help
>> +	  Support for the video AV1 encoder clock controller on
>> +	  Qualcomm Technologies, Inc. Glymur devices.
>> +	  Say Y if you want to support functionality such as AV1
>> +	  encoding.
>> +
>>  config CLK_GLYMUR_CAMCC
>>  	tristate "Glymur Camera Clock Controller"
>>  	depends on ARM64 || COMPILE_TEST
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 6affb5073f269d18f1b78d6c7f92e14baeade1e5..61d4efb7547146544902dddf52e4853d073d5467 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -28,6 +28,7 @@ obj-$(CONFIG_CLK_ELIZA_GPUCC) += gpucc-eliza.o
>>  obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
>>  obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
>>  obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
>> +obj-$(CONFIG_CLK_GLYMUR_AV1ECC) += av1ecc-glymur.o
>>  obj-$(CONFIG_CLK_GLYMUR_CAMCC) += camcc-glymur.o
>>  obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>>  obj-$(CONFIG_CLK_GLYMUR_EVACC) += evacc-glymur.o
>> diff --git a/drivers/clk/qcom/av1ecc-glymur.c b/drivers/clk/qcom/av1ecc-glymur.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..228e73a1a1357dc9ebe508b9fbcec71326388806
>> --- /dev/null
>> +++ b/drivers/clk/qcom/av1ecc-glymur.c
>> @@ -0,0 +1,393 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,glymur-av1ecc.h>
>> +
>> +#include "clk-alpha-pll.h"
>> +#include "clk-branch.h"
>> +#include "clk-pll.h"
>> +#include "clk-rcg.h"
>> +#include "clk-regmap.h"
>> +#include "clk-regmap-divider.h"
>> +#include "common.h"
>> +#include "gdsc.h"
>> +#include "reset.h"
>> +
>> +enum {
>> +	DT_BI_TCXO,
>> +	DT_IFACE,
>> +};
>> +
>> +enum {
>> +	P_AV1E_CC_PLL0_OUT_EVEN,
>> +	P_AV1E_CC_PLL0_OUT_MAIN,
>> +	P_AV1E_CC_PLL0_OUT_ODD,
>> +	P_BI_TCXO,
>> +};
>> +
>> +static const struct pll_vco taycan_eko_t_vco[] = {
>> +	{ 249600000, 2500000000, 0 },
>> +};
>> +
>> +/* 600.0 MHz Configuration */
>> +static const struct alpha_pll_config av1e_cc_pll0_config = {
>> +	.l = 0x1f,
>> +	.cal_l = 0x48,
>> +	.alpha = 0x4000,
>> +	.config_ctl_val = 0x25c400e7,
>> +	.config_ctl_hi_val = 0x0a8060e0,
>> +	.config_ctl_hi1_val = 0xf51dea20,
>> +	.user_ctl_val = 0x00000008,
>> +	.user_ctl_hi_val = 0x00000002,
>> +};
>> +
>> +static struct clk_alpha_pll av1e_cc_pll0 = {
>> +	.offset = 0x0,
>> +	.config = &av1e_cc_pll0_config,
>> +	.vco_table = taycan_eko_t_vco,
>> +	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
>> +	.clkr = {
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "av1e_cc_pll0",
>> +			.parent_data = &(const struct clk_parent_data) {
>> +				.index = DT_BI_TCXO,
>> +			},
>> +			.num_parents = 1,
>> +			.ops = &clk_alpha_pll_taycan_eko_t_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static const struct parent_map av1e_cc_parent_map_0[] = {
>> +	{ P_BI_TCXO, 0 },
>> +	{ P_AV1E_CC_PLL0_OUT_MAIN, 1 },
>> +	{ P_AV1E_CC_PLL0_OUT_ODD, 2 },
>> +	{ P_AV1E_CC_PLL0_OUT_EVEN, 3 },
>> +};
>> +
>> +static const struct clk_parent_data av1e_cc_parent_data_0[] = {
>> +	{ .index = DT_BI_TCXO },
>> +	{ .hw = &av1e_cc_pll0.clkr.hw },
>> +	{ .hw = &av1e_cc_pll0.clkr.hw },
>> +	{ .hw = &av1e_cc_pll0.clkr.hw },
>> +};
>> +
>> +static const struct parent_map av1e_cc_parent_map_1[] = {
>> +	{ P_BI_TCXO, 0 },
>> +};
>> +
>> +static const struct clk_parent_data av1e_cc_parent_data_1[] = {
>> +	{ .index = DT_BI_TCXO },
>> +};
>> +
>> +static const struct freq_tbl ftbl_av1e_cc_av1e_core_clk_src[] = {
>> +	F(300000000, P_AV1E_CC_PLL0_OUT_MAIN, 2, 0, 0),
>> +	F(400000000, P_AV1E_CC_PLL0_OUT_MAIN, 2, 0, 0),
>> +	F(600000000, P_AV1E_CC_PLL0_OUT_MAIN, 2, 0, 0),
>> +	{ }
>> +};
>> +
>> +static struct clk_rcg2 av1e_cc_av1e_core_clk_src = {
>> +	.cmd_rcgr = 0x4018,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = av1e_cc_parent_map_0,
>> +	.freq_tbl = ftbl_av1e_cc_av1e_core_clk_src,
>> +	.hw_clk_ctrl = true,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "av1e_cc_av1e_core_clk_src",
>> +		.parent_data = av1e_cc_parent_data_0,
>> +		.num_parents = ARRAY_SIZE(av1e_cc_parent_data_0),
>> +		.flags = CLK_SET_RATE_PARENT,
>> +		.ops = &clk_rcg2_shared_ops,
>> +	},
>> +};
>> +
>> +static const struct freq_tbl ftbl_av1e_cc_av1e_xo_clk_src[] = {
>> +	F(19200000, P_BI_TCXO, 1, 0, 0),
>> +	{ }
>> +};
>> +
>> +static struct clk_rcg2 av1e_cc_av1e_xo_clk_src = {
>> +	.cmd_rcgr = 0x601c,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = av1e_cc_parent_map_1,
>> +	.freq_tbl = ftbl_av1e_cc_av1e_xo_clk_src,
>> +	.hw_clk_ctrl = true,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "av1e_cc_av1e_xo_clk_src",
>> +		.parent_data = av1e_cc_parent_data_1,
>> +		.num_parents = ARRAY_SIZE(av1e_cc_parent_data_1),
>> +		.flags = CLK_SET_RATE_PARENT,
>> +		.ops = &clk_rcg2_shared_ops,
> 
> Can it be just rcg2_ops?
> 

Will update to use rcg2_ops.

>> +	},
>> +};
>> +
>> +static struct clk_regmap_div av1e_cc_av1e_noc_ahb_div_clk_src = {
>> +	.reg = 0x5020,
>> +	.shift = 0,
>> +	.width = 4,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "av1e_cc_av1e_noc_ahb_div_clk_src",
>> +		.parent_hws = (const struct clk_hw*[]) {
>> +			&av1e_cc_av1e_core_clk_src.clkr.hw,
>> +		},
>> +		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>> +		.ops = &clk_regmap_div_ro_ops,
>> +	},
>> +};
>> +
>> +static struct clk_branch av1e_cc_ahb_clk = {
>> +	.halt_reg = 0x6000,
>> +	.halt_check = BRANCH_HALT_VOTED,
>> +	.clkr = {
>> +		.enable_reg = 0x6000,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "av1e_cc_ahb_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&av1e_cc_av1e_noc_ahb_div_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch av1e_cc_av1e_core_apb_clk = {
>> +	.halt_reg = 0x4044,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x4044,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "av1e_cc_av1e_core_apb_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&av1e_cc_av1e_core_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch av1e_cc_av1e_core_axi_clk = {
>> +	.halt_reg = 0x4040,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x4040,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "av1e_cc_av1e_core_axi_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&av1e_cc_av1e_core_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch av1e_cc_av1e_core_clk = {
>> +	.halt_reg = 0x4030,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x4030,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "av1e_cc_av1e_core_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&av1e_cc_av1e_core_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch av1e_cc_av1e_gdsc_noc_ahb_clk = {
>> +	.halt_reg = 0x5024,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x5024,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "av1e_cc_av1e_gdsc_noc_ahb_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&av1e_cc_av1e_noc_ahb_div_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch av1e_cc_av1e_noc_ahb_clk = {
>> +	.halt_reg = 0x5028,
>> +	.halt_check = BRANCH_HALT_VOTED,
>> +	.clkr = {
>> +		.enable_reg = 0x5028,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "av1e_cc_av1e_noc_ahb_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&av1e_cc_av1e_noc_ahb_div_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch av1e_cc_av1e_noc_core_axi_clk = {
>> +	.halt_reg = 0x5004,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x5004,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "av1e_cc_av1e_noc_core_axi_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&av1e_cc_av1e_core_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch av1e_cc_av1e_noc_xo_clk = {
>> +	.halt_reg = 0x6038,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x6038,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "av1e_cc_av1e_noc_xo_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&av1e_cc_av1e_xo_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct gdsc av1e_cc_core_gdsc = {
>> +	.gdscr = 0x4004,
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0xf,
>> +	.pd = {
>> +		.name = "av1e_cc_core_gdsc",
>> +	},
>> +	.pwrsts = PWRSTS_OFF_ON,
>> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> 
> Will AV1 consumer have any HW_CTRL requirement?
> 

No, there is not HW_CTRL requirement for this GDSC.

Thanks,
Jagadeesh

>> +};
>> +
>> +static struct clk_regmap *av1e_cc_glymur_clocks[] = {
>> +	[AV1E_CC_AHB_CLK] = &av1e_cc_ahb_clk.clkr,
>> +	[AV1E_CC_AV1E_CORE_APB_CLK] = &av1e_cc_av1e_core_apb_clk.clkr,
>> +	[AV1E_CC_AV1E_CORE_AXI_CLK] = &av1e_cc_av1e_core_axi_clk.clkr,
>> +	[AV1E_CC_AV1E_CORE_CLK] = &av1e_cc_av1e_core_clk.clkr,
>> +	[AV1E_CC_AV1E_CORE_CLK_SRC] = &av1e_cc_av1e_core_clk_src.clkr,
>> +	[AV1E_CC_AV1E_GDSC_NOC_AHB_CLK] = &av1e_cc_av1e_gdsc_noc_ahb_clk.clkr,
>> +	[AV1E_CC_AV1E_NOC_AHB_CLK] = &av1e_cc_av1e_noc_ahb_clk.clkr,
>> +	[AV1E_CC_AV1E_NOC_AHB_DIV_CLK_SRC] = &av1e_cc_av1e_noc_ahb_div_clk_src.clkr,
>> +	[AV1E_CC_AV1E_NOC_CORE_AXI_CLK] = &av1e_cc_av1e_noc_core_axi_clk.clkr,
>> +	[AV1E_CC_AV1E_NOC_XO_CLK] = &av1e_cc_av1e_noc_xo_clk.clkr,
>> +	[AV1E_CC_AV1E_XO_CLK_SRC] = &av1e_cc_av1e_xo_clk_src.clkr,
>> +	[AV1E_CC_PLL0] = &av1e_cc_pll0.clkr,
>> +};
>> +
>> +static struct gdsc *av1e_cc_glymur_gdscs[] = {
>> +	[AV1E_CC_CORE_GDSC] = &av1e_cc_core_gdsc,
>> +};
>> +
>> +static const struct qcom_reset_map av1e_cc_glymur_resets[] = {
>> +	[AV1E_CC_AV1E_CORE_AXI_CLK_ARES] = { 0x4040, 2 },
>> +	[AV1E_CC_AV1E_CORE_CLK_ARES] = { 0x4030, 2 },
>> +	[AV1E_CC_AV1E_GDSC_NOC_AHB_CLK_ARES] = { 0x5024, 2 },
>> +	[AV1E_CC_AV1E_NOC_CORE_AXI_CLK_ARES] = { 0x5004, 2 },
>> +	[AV1E_CC_AV1E_NOC_XO_CLK_ARES] = { 0x6038, 2 },
>> +	[AV1E_CC_CORE_BCR] = { 0x4000 },
>> +	[AV1E_CC_NOC_BCR] = { 0x5000 },
>> +};
>> +
>> +static struct clk_alpha_pll *av1e_cc_glymur_plls[] = {
>> +	&av1e_cc_pll0,
>> +};
>> +
>> +static const u32 av1e_cc_glymur_critical_cbcrs[] = {
>> +	0x6034, /* AV1E_CC_AV1E_CC_XO_CLK */
>> +	0x6054, /* AV1E_CC_SLEEP_CLK */
>> +};
>> +
>> +static const struct regmap_config av1e_cc_glymur_regmap_config = {
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.max_register = 0xa01c,
>> +	.fast_io = true,
>> +};
>> +
>> +static const struct qcom_cc_driver_data av1e_cc_glymur_driver_data = {
>> +	.alpha_plls = av1e_cc_glymur_plls,
>> +	.num_alpha_plls = ARRAY_SIZE(av1e_cc_glymur_plls),
>> +	.clk_cbcrs = av1e_cc_glymur_critical_cbcrs,
>> +	.num_clk_cbcrs = ARRAY_SIZE(av1e_cc_glymur_critical_cbcrs),
>> +};
>> +
>> +static const struct qcom_cc_desc av1e_cc_glymur_desc = {
>> +	.config = &av1e_cc_glymur_regmap_config,
>> +	.clks = av1e_cc_glymur_clocks,
>> +	.num_clks = ARRAY_SIZE(av1e_cc_glymur_clocks),
>> +	.resets = av1e_cc_glymur_resets,
>> +	.num_resets = ARRAY_SIZE(av1e_cc_glymur_resets),
>> +	.gdscs = av1e_cc_glymur_gdscs,
>> +	.num_gdscs = ARRAY_SIZE(av1e_cc_glymur_gdscs),
>> +	.use_rpm = true,
>> +	.driver_data = &av1e_cc_glymur_driver_data,
>> +};
>> +
>> +static const struct of_device_id av1e_cc_glymur_match_table[] = {
>> +	{ .compatible = "qcom,glymur-av1ecc" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, av1e_cc_glymur_match_table);
>> +
>> +static int av1e_cc_glymur_probe(struct platform_device *pdev)
>> +{
>> +	return qcom_cc_probe(pdev, &av1e_cc_glymur_desc);
>> +}
>> +
>> +static struct platform_driver av1e_cc_glymur_driver = {
>> +	.probe = av1e_cc_glymur_probe,
>> +	.driver = {
>> +		.name = "av1ecc-glymur",
>> +		.of_match_table = av1e_cc_glymur_match_table,
>> +	},
>> +};
>> +
>> +module_platform_driver(av1e_cc_glymur_driver);
>> +
>> +MODULE_DESCRIPTION("QTI AV1ECC Glymur Driver");
>> +MODULE_LICENSE("GPL");
>>
> 

