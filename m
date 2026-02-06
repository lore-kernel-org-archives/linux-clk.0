Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDC238F93A
	for <linux-clk@vger.kernel.org>; Fri,  6 Feb 2026 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770382252; cv=none; b=gsz0KKff25xud/1yXQx45g+eUIRqHT3e1NO7TFGmct35Y4DcFLtAxU/pKX6FpBZth3iVo9udWvgxmxPs/WcKOFr/4ecVjeeQSbxX7MJMuUrG9HLq1zCw5W6VLvy9+TnEseMcp+NWlPZPvGjWQhOhGuXCB//vb5mq1GAAj8ib49s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770382252; c=relaxed/simple;
	bh=ZWUSfutXGKCikBMX8Q0Ep5H0GBuz5LUQSJTdCNe1x38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBm7trJW+MC6t2BjSDX6b4cChAxSpZ1OvkJg9+KW/jDBNoYMSA21wZbtOGFSZo+48LI04eBWnzs9Kv+LtzXL+ReF9hDX+5S76vWbrTiTuU3vBjhRNG+rd5bjf2xPORAqVy2EkUFgSf6d1CZHyS9i9wEACMiqCr9KIyTtL6mbMSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bswXsaaC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+dwJWqo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bswXsaaC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+dwJWqo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6168ZOWe2314345
	for <linux-clk@vger.kernel.org>; Fri, 6 Feb 2026 12:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gfeubtNFCdvI+87VUZgOtTYw
	db+qMLhkzHGY85l1U64=; b=bswXsaaCXm30mtGk5aL5RjF9A9prwuCedxiKZQag
	JSYMoTgIrN83VkA9+FGu92lmrnHlRY3MffDi0jtqKoxb3DvjiNOVJWwZm3MS+DEQ
	WuDt6xG5SZJuNTEIzbye86JUzH8GEg9lwRN7qMnHAFyjHBc1wqmKuqsOnQjv2D6W
	zGY/ihAatRJv5d9k9MISHFEXPmII+hbQD6WPx2vdxV0aooc/5azsGq7RU3DktO+S
	oi+4zs2j4CSYezIWbsWhOT7653cmXJByhbEJGi9L6ZQ40re7yoTNJ+q5i52lW+YH
	dq4xB3EFDmkcsUfJ6WUl/6N57IpqqtrHJWp8RRr1OpD9AA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c52mrjvbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 06 Feb 2026 12:50:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c882774f0dso153911885a.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Feb 2026 04:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770382250; x=1770987050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gfeubtNFCdvI+87VUZgOtTYwdb+qMLhkzHGY85l1U64=;
        b=G+dwJWqoV5o5/FfOXi7/GboZHqz1I21ZLvziJTfb8PInkpDRriAttMHuM/rEYgOP1x
         mYJdWQmgzkDtd1+TzdfAzMYSU99qLYPpwd2myDNj5QB7GxQklWq3mY3FN2UXwaqh/eus
         0VMFHYpRL0tgYhNhqnm+EalqprKm6WCAq6kCG8PKz8N61JeE04eSRy/dpyn5mnIaWa+w
         cX+TI5GmHda+eBWR5txyVvPn2J1/7KK9sPj618XxaESCjrA0RsAfJkiKzeVSvnqfJ2/V
         2ji8zJMdr+h9Q2ty35a+jf+4GcwchzgKSj4ggPAYdSm8Rmk+xJqUDVe+ayOJ6CsoOLxt
         KLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770382250; x=1770987050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfeubtNFCdvI+87VUZgOtTYwdb+qMLhkzHGY85l1U64=;
        b=UF0rxM2XXO12Kp8/n5LAzfEBMwhQWUmDmkW6mOG1CLiA0+oI0zazsrPOaSE3/CULFU
         i82FsdxipQruyLIgVUV2o2ELmzDpmJc4IRHzuCSBaxbOaZeQ/M5RS/RLhQk4K4COYEPl
         1hiot8XDi8LlKBfKonybCcidlDEK1szhUxivto1IrtVkMPel5nWUzvAjnSJlW4llePGx
         mbQXFfmozroSn6jaDA/gWlDEv7DCOk1LTvcc7fVmtsB8hIF7K3wcywPUYfMdDJXNiMik
         J6GRAZnUdQP8n9ojuU7Vnk//9uuJMDrZXf4glXNnRM6C+NZgQa5Z0q081SpjnqwFkFPy
         TJig==
X-Forwarded-Encrypted: i=1; AJvYcCUkVR1S6r9rPwmPljDQZwgszw3SuzzuheyD9jAweOy8kz/0XBUJluMrj7yzZVKBqdbNTvsmi1aD9jU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn+G89DTnbCzbuelk0Q4NEdI0lqWN6g5M/K4wpEdvVMUC/dDAD
	KrSXkVpyqwYwMmBSppDgPtk7iDPglHkmg5wHx6nF9mS2DfBvkjSJB1TBRWozQNGXUhYh2EVjU/Y
	PzyDYU6bUGBr0jgmKvkXU7G9rhDY1z2O5tQ96RY47WZ5Hf4kFSjd9t1zSYy+km4c=
X-Gm-Gg: AZuq6aIfXyafW5ZPlNG3O2x5GxxrlJaM2MxmcB3lG97hHAnF9F1MUB4/N3r926ExYDN
	jsBo5z5MmN4IHbPTODr8CQtaPCGi8Ix8qjxkFYQqEkfAZgGdpY+zOW81/BFGwzbcVEp4nRv/zl9
	ybanX8zOE7U2t8b9/3B0b4j16lQG2x6x18k01+U4va3fALjm3Lrf7oUmUc78SL5+8dFNAReW3Az
	1PUG7EfCROkvObJAXxvfL+Ug5cO8RAFz6bei2GMR0zfTrYQnIdUy1KJsQEUGPkmkHyqUdrGfACC
	xlI4HZKEMCaBz9YpBcQPB8pT+rCTOqhO61K79W6ed7FKTBaIU51gl3xvj20tZDPXMWQzmwMTyxh
	4QYJhoSA+69ha+ntUcd1zczlc
X-Received: by 2002:a05:620a:40d2:b0:8c9:eb7d:cd94 with SMTP id af79cd13be357-8caf1acb608mr309508685a.88.1770382249945;
        Fri, 06 Feb 2026 04:50:49 -0800 (PST)
X-Received: by 2002:a05:620a:40d2:b0:8c9:eb7d:cd94 with SMTP id af79cd13be357-8caf1acb608mr309505485a.88.1770382249289;
        Fri, 06 Feb 2026 04:50:49 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48323c0296dsm38981985e9.1.2026.02.06.04.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:50:48 -0800 (PST)
Date: Fri, 6 Feb 2026 14:50:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] clk: qcom: Add TCSR clock driver for Eliza
Message-ID: <w2zz36w7jpxafunxhan4jvdh47kx2mhxunazig3ubrvwe4yfhk@6sbi7rqo7lul>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-6-ccee9438b5c8@oss.qualcomm.com>
 <fb7bd7de-61ee-46f7-826a-2c9c32aa9c2d@oss.qualcomm.com>
 <44k56h4yjjknc5xnwlrmlpgj2hpf6rvdsv7fhrhb4qnzsz7goi@o6qz7im62kg3>
 <e5e42350-813a-4f6b-9ace-368f2a31cf7a@oss.qualcomm.com>
 <2j3oraektgiphuj7akss3ytxgqt6e5kqt5gorkncjoiibol32e@aueznegzge2s>
 <krn4ncotwny65eu5p36wr5dyrw2pc2ophs6g6yqo52ogi34gah@6uxeccbed3vf>
 <2abe345c-ba9c-492c-8684-0d7f4e6b8c0e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2abe345c-ba9c-492c-8684-0d7f4e6b8c0e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA4OSBTYWx0ZWRfX+Pwmgw6h3BwZ
 OTuGYNXwBVPUKtJvYzq9+eyE7J/qSzE+/nqIZ9kTltR/kz0aJ9jLy4ytFE0CZKVQN992gRE2F0b
 NirQLNhUcVLvVHl/vzlbo2j0MmW42t/q4xIhCKbWVw4AuyXeZw19R8IWYwQj1aeXG8YoG3/sEEy
 O7NiOB4ctuJ9M5/3lv/nYonTm2C6i65YBHpjvUyG2S9EPTpmubp8MvIjP7mk/AGsWr3gLW0iIt2
 q+B/LtzeF9390aqkEXg/dt4RXh98/i97IqVKU57AiTzLp7YVPzWPC7xAduVigz/FwWpFfJjHKqI
 AO20WDW5y4SgPtM9DpMYqamAVW5qWarWzAMaV90niaZnYenBoEuKk2JFiSPOp4atXAw7iDFqCUA
 2U4RjUtE58l6ZSFMtCnYtssWmhbS8iO8P8DJDdz1Vqs6DLObQ7TfsImXeuFsBT2unFH5UlTlT8q
 jV6klGYlmdJE6lom4rA==
X-Proofpoint-GUID: XKz5s98MARLmVUpevTKhdiaulZrwl8je
X-Authority-Analysis: v=2.4 cv=e4kLiKp/ c=1 sm=1 tr=0 ts=6985e3ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=0XEvXGck0KlApgr3KlUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: XKz5s98MARLmVUpevTKhdiaulZrwl8je
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060089

On 26-02-04 13:36:57, Konrad Dybcio wrote:
> On 2/2/26 9:53 PM, Abel Vesa wrote:
> > On 26-01-30 22:40:32, Abel Vesa wrote:
> >> On 26-01-30 10:43:44, Konrad Dybcio wrote:
> >>> On 1/28/26 3:10 PM, Abel Vesa wrote:
> >>>> On 26-01-28 11:34:49, Konrad Dybcio wrote:
> >>>>> On 1/27/26 4:03 PM, Abel Vesa wrote:
> >>>>>> Add the TCSR clock controller that provides the refclks on Eliza
> >>>>>> platform for PCIe, USB and UFS subsystems.
> >>>>>>
> >>>>>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>>>>> ---
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>> +++ b/drivers/clk/qcom/tcsrcc-eliza.c
> >>>>>> @@ -0,0 +1,144 @@
> >>>>>> +// SPDX-License-Identifier: GPL-2.0-only
> >>>>>> +/*
> >>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>>>>> + */
> >>>>>> +
> >>>>>> +#include <linux/clk-provider.h>
> >>>>>> +#include <linux/mod_devicetable.h>
> >>>>>> +#include <linux/module.h>
> >>>>>> +#include <linux/of.h>
> >>>>>> +#include <linux/platform_device.h>
> >>>>>> +#include <linux/regmap.h>
> >>>>>> +
> >>>>>> +#include <dt-bindings/clock/qcom,eliza-tcsr.h>
> >>>>>> +
> >>>>>> +#include "clk-branch.h"
> >>>>>> +#include "clk-regmap.h"
> >>>>>> +#include "common.h"
> >>>>>> +
> >>>>>> +enum {
> >>>>>> +	DT_BI_TCXO_PAD,
> >>>>>> +};
> >>>>>> +
> >>>>>> +static struct clk_branch tcsr_pcie_0_clkref_en = {
> >>>>>> +	.halt_reg = 0x0,
> >>>>>
> >>>>> These regs certainly aren't at +0x0 to what we normally expect to
> >>>>> be the start of the TCSR node
> >>>>
> >>>> They are if we add the TCSR node with reg range starting at 0x1fbf000.
> >>>
> >>> "if we take the wrong base, the wrong offset is right" ;)
> >>>
> >>> The docs for Eliza don't have the nice separation like on e.g. Hamoa,
> >>> but 0x01fc0000 is what we generally agreed upon to be "tcsr".
> >>>
> >>> The registers that first appear in that region are the same as on Hamoa,
> >>> and so is the address, so let's continue that tradition
> > 
> > Actually, the 0x1fbf000 is the right base address.
> 
> Actually, I think it's 0x1fb_2000 ;)

As discussed off-list, using 0x1fb_2000 would include regs that Kaanapali for example
doesn't. So will use the 0x1fc_0000.

> 
> > TCSR mutex starts at 0x1f40000, and everything between 0x1fb2000 and 0xfbf000
> > doesn't really look like they belong in a clock controller.
> 
> Correct, and that's because TCSR is not a clock controller.

Correct, but as agreed off-list, for consistency reasons w.r.t. other SoCs,
it should not include that gap.

Thanks,
Abel
