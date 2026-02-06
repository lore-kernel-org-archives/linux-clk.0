Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402523644DB
	for <linux-clk@vger.kernel.org>; Fri,  6 Feb 2026 12:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770382696; cv=none; b=gH2jM2RcgymenM2fWWoJ7zUt4ynOrlL9YILJTflJIj15mqHzHdaaakM5+9+G30MLvg/vjRb70jsedQ89e/5xA9UCTtTgzN6hKUJqyRRlmh9nkbqfGoTstZyfBj7fFZTC/OvOoeoL6UVWvhkiazBa+j5zt2lhX2MTANmBT0YpOH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770382696; c=relaxed/simple;
	bh=S0AXACMXQfVYc2s0Cd6RLQOUu4IbRYgUzB9XMNy9fDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKzSdUnPE+dQwUoQVOgTIjsNR1JrBNL0k7Me1pc+dap+dtfgIaEAvdwunBsKUZzYf7CfvoWZ7EUfRQivq7AmRSRrgE0opygjzzFVC6YJqqGQfOM8Cmh9stb2y43AGjL7Ie6AtuwjzB3q+ZDvYbVKu0JKI4yzFF1BNaBbf3Q5Rus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6UsUSKI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e6uzPvLw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6UsUSKI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e6uzPvLw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167XdCV1852683
	for <linux-clk@vger.kernel.org>; Fri, 6 Feb 2026 12:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1MtAB3cve+uSH/pDLGZhwV0x
	92MmwM5of/LQVzcO/T4=; b=i6UsUSKII52znxC5elZY1Si+3wKfeqDL2NDEg4Uv
	GxRsgUlAQFUVbKgpq4yUWIDTLSvOT1hyjMJ/4VhAVXnOnB5HW/+F3xWrSbkiVN/p
	O4SOzE/lz4A8rrRkrWAnOrzLoE8oShBVOzedbL9qzrp4TyxK+WlVXttd8MTcW9Nf
	vVgi1l6Rp1m0JkB7cGbuU7GtzAxZJYhdICa7Mc6XQPs26WJ/Kj14duMxFVlZhUW/
	7ZGoRJglPVPptFViTlyTw751ki9f2FqAC66sJquaeNRzlsmTMZVlk2AJETMIC8p7
	DHQgSWO1ZdZovu+cFKFpdyrPBzc+EL8CmPc5oH4CrxkWpQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c148ykr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 06 Feb 2026 12:58:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ca3ef536ddso716015585a.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Feb 2026 04:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770382694; x=1770987494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1MtAB3cve+uSH/pDLGZhwV0x92MmwM5of/LQVzcO/T4=;
        b=e6uzPvLwbSlNfl57AoY3kNbsoscO4ZCKCw/LVHNppiR36pXHdtqDvzhnwun9CL7Yq5
         xg7yrZmS/k8m0ew+PBj8JWngNnnriTk03iDxJ9s1Y/hUlQ85ZhQKB+MYHtMh2v1mpZig
         Gp8gVfMNl7NP0hnV+2Wp/yuqe6NmNGcm252W/fQp7OFsvLXq2vhHeJLYzSEH781bNp+3
         twvyO4XhyZQA3uLz0llxRYa0ACjH+baN7rFaugc31w0YaW4yUP10sgkdvZyq19sCtBq4
         wHouBd3b8MmpSdl+JesATPgf3QpCps8KPYejRFLyGO3dcpG3TPZjawR97x9OhxqUKyS0
         eWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770382694; x=1770987494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MtAB3cve+uSH/pDLGZhwV0x92MmwM5of/LQVzcO/T4=;
        b=PUkG9WRwaFWQ5HCasAydY8hWHXssI5Y248gTWMmkbeQIU/j7XjorcAMQ7a5NDQgBew
         la/sxNDuCeOBzTiNdVw1cb8h52GzXiG3rt51laJdhXYnUSq02yPHOHdtmXTCH8gg3iO/
         qPkk12kB0UYNeX+93rje9jxlGmk5tXMWppzIbc38LNSEe1yUT6p2U1IXTBw3WLgZ18S5
         BK6KX6GSa35xvKy2FBl7PuoNtUrheMc7Xh/gaE3ZFwYpuH1RgQbB55xjCe9QPjzpWh4k
         9CmMtFiA+rVT/4gC37JOFCA7RtvLe1PXNNHCe6knU3xDiD1rnhhcVlIH575h/hCJ2cmY
         V6zg==
X-Forwarded-Encrypted: i=1; AJvYcCWJdgQf+GvA89ziuOWwSIfsSwtKjdU/DbOQl58MaiNAIraHA2oxsoQziPIwWi6x1BAPhctsHv4xWCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbYmUAvoGCr8bI1J02+pl1TFBPmjERwGICIgqI8j1jNiJ6CLKE
	uCOw1aJYnfC1xI6HCnuxXTnEfqpZDrlIw+ihc8RTMc+NvgahZLCOhFoTAN6gsWHf8TuW4ZsezH6
	MFYlGBzPzLqYVzz6mtKMo4nA1r8nvl5sgGGxm/Pyg6pY2OYj6lIhMrntOYtFIpvE=
X-Gm-Gg: AZuq6aL9/ga+Ag0Mad77+Bl9zP0aLhPA1yFhoOcxd0DhHpZM6SG5IVsG1oOfeeEoX2J
	2Fv/Wf6cAHA6L+1cHQq5bbzNFGWpoU4HEgJG81964yVM6nnrogKoMLdKiGuOrXSdUEI/siAjY5G
	NJqZALbnEy6o4B0dNWF6EoJu6nQ1zE0uaxA0S9mbwE8GrLpTnvuf72SKFUWuMUvJ8afPMD6BUXa
	FazcqG/IN4tTWvPXWQZBZUrXWwkCuQ1oR15x2TMFEF5rNm3TXbomrpiuw4DXvYoc5sjUyD7VeYc
	v9WNSOdD7t2PqXYCC2H4Is866AnzjvS4Mb8sWNT2rjEPVsIOCLn53fkeWk82fu0NSfZYNk6b0Xl
	mHxT3yiK6ASRbTkQKb5YYviOq
X-Received: by 2002:a05:620a:29ca:b0:8ca:4438:b8f8 with SMTP id af79cd13be357-8caf120ea7fmr309612885a.64.1770382694388;
        Fri, 06 Feb 2026 04:58:14 -0800 (PST)
X-Received: by 2002:a05:620a:29ca:b0:8ca:4438:b8f8 with SMTP id af79cd13be357-8caf120ea7fmr309607985a.64.1770382693758;
        Fri, 06 Feb 2026 04:58:13 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d345c2sm167861355e9.6.2026.02.06.04.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:58:13 -0800 (PST)
Date: Fri, 6 Feb 2026 14:58:11 +0200
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
Message-ID: <lvm5ew4sswos6e7x2fjqezdz2mclc2bgarpa4nu4zsta4553dz@ggmudyhiebzf>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-6-ccee9438b5c8@oss.qualcomm.com>
 <fb7bd7de-61ee-46f7-826a-2c9c32aa9c2d@oss.qualcomm.com>
 <44k56h4yjjknc5xnwlrmlpgj2hpf6rvdsv7fhrhb4qnzsz7goi@o6qz7im62kg3>
 <e5e42350-813a-4f6b-9ace-368f2a31cf7a@oss.qualcomm.com>
 <2j3oraektgiphuj7akss3ytxgqt6e5kqt5gorkncjoiibol32e@aueznegzge2s>
 <krn4ncotwny65eu5p36wr5dyrw2pc2ophs6g6yqo52ogi34gah@6uxeccbed3vf>
 <2abe345c-ba9c-492c-8684-0d7f4e6b8c0e@oss.qualcomm.com>
 <w2zz36w7jpxafunxhan4jvdh47kx2mhxunazig3ubrvwe4yfhk@6sbi7rqo7lul>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w2zz36w7jpxafunxhan4jvdh47kx2mhxunazig3ubrvwe4yfhk@6sbi7rqo7lul>
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6985e567 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Hftd3DfNRCz_qKpLIn0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA4OSBTYWx0ZWRfXy2/CT438Z3So
 Ljz14Z/oIyLOSDDhPo8gSTlPnIsypRUN+Rb6LCWT/kOQAh/P/zfgbfFW/8NBzQm+F4MjBmtISSt
 LOIxEMQi+Twgx8mVV74LIOXl0njcf1oYL/WZUjUKv4tMh16Gi8LGW6ICYxW94x9tcjQUBXZAP6T
 0RRe7Qn2UvqxKBqRrLX8qLOFyzCGjYpX5K4ILRAfj6kpbMJsxsggjWcD4Ovk9iP5Gw7CRFfUlPd
 6HMPQ12RBjIg06IlgO2J92exrIsuxpI2nLy6nSuB/64Hd+sVSl9N8H2rO3QDymWHIfOYgBg3tVK
 VSKnY3QT5Nt4gekpO2pWAXmGZlmfLcBlUjd2kpjmQAMbQjeVNQMK3kDEwsr+V6Vzq3619AGfTA5
 3D9M6Yt0racxBoOhmUc8Jdgf3uICsj/r1RVnVUdyrTRcf7DpprVOzVE0YE0pO/QytC5b6zmVzdm
 k0Ft99rso56diIrBWYQ==
X-Proofpoint-ORIG-GUID: MFm1IG0S-xs0cL7fPkcGcnO3prq5BFRa
X-Proofpoint-GUID: MFm1IG0S-xs0cL7fPkcGcnO3prq5BFRa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060089

On 26-02-06 14:50:44, Abel Vesa wrote:
> On 26-02-04 13:36:57, Konrad Dybcio wrote:
> > On 2/2/26 9:53 PM, Abel Vesa wrote:
> > > On 26-01-30 22:40:32, Abel Vesa wrote:
> > >> On 26-01-30 10:43:44, Konrad Dybcio wrote:
> > >>> On 1/28/26 3:10 PM, Abel Vesa wrote:
> > >>>> On 26-01-28 11:34:49, Konrad Dybcio wrote:
> > >>>>> On 1/27/26 4:03 PM, Abel Vesa wrote:
> > >>>>>> Add the TCSR clock controller that provides the refclks on Eliza
> > >>>>>> platform for PCIe, USB and UFS subsystems.
> > >>>>>>
> > >>>>>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > >>>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > >>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > >>>>>> ---
> > >>>>>
> > >>>>> [...]
> > >>>>>
> > >>>>>> +++ b/drivers/clk/qcom/tcsrcc-eliza.c
> > >>>>>> @@ -0,0 +1,144 @@
> > >>>>>> +// SPDX-License-Identifier: GPL-2.0-only
> > >>>>>> +/*
> > >>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > >>>>>> + */
> > >>>>>> +
> > >>>>>> +#include <linux/clk-provider.h>
> > >>>>>> +#include <linux/mod_devicetable.h>
> > >>>>>> +#include <linux/module.h>
> > >>>>>> +#include <linux/of.h>
> > >>>>>> +#include <linux/platform_device.h>
> > >>>>>> +#include <linux/regmap.h>
> > >>>>>> +
> > >>>>>> +#include <dt-bindings/clock/qcom,eliza-tcsr.h>
> > >>>>>> +
> > >>>>>> +#include "clk-branch.h"
> > >>>>>> +#include "clk-regmap.h"
> > >>>>>> +#include "common.h"
> > >>>>>> +
> > >>>>>> +enum {
> > >>>>>> +	DT_BI_TCXO_PAD,
> > >>>>>> +};
> > >>>>>> +
> > >>>>>> +static struct clk_branch tcsr_pcie_0_clkref_en = {
> > >>>>>> +	.halt_reg = 0x0,
> > >>>>>
> > >>>>> These regs certainly aren't at +0x0 to what we normally expect to
> > >>>>> be the start of the TCSR node
> > >>>>
> > >>>> They are if we add the TCSR node with reg range starting at 0x1fbf000.
> > >>>
> > >>> "if we take the wrong base, the wrong offset is right" ;)
> > >>>
> > >>> The docs for Eliza don't have the nice separation like on e.g. Hamoa,
> > >>> but 0x01fc0000 is what we generally agreed upon to be "tcsr".
> > >>>
> > >>> The registers that first appear in that region are the same as on Hamoa,
> > >>> and so is the address, so let's continue that tradition
> > > 
> > > Actually, the 0x1fbf000 is the right base address.
> > 
> > Actually, I think it's 0x1fb_2000 ;)
> 
> As discussed off-list, using 0x1fb_2000 would include regs that Kaanapali for example
> doesn't. So will use the 0x1fc_0000.

Urgh, I meant 0x1fb_f000.

Sorry about that.
