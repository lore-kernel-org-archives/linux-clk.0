Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9B438A72F
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 11:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890943; cv=none; b=BVwjkQhHFaI3jlMNcLr469wLLtl/TMfqcwNqDbzmhliQheLQpHhcU2wbF260K463Bu1+b/XtIOkJEMfg4BCwjsIlj+1FK0VgQ6koreRecaPx+36ZQhL5i+BTrw/U8pTzubQsDrlhuk3xsg0iNhBW8/pcXz2vCJ1SBn0zGywoOLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890943; c=relaxed/simple;
	bh=aVuVsXFjs7/0gp6/eDzJFJsFZKrvp65ashGjNex6uHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EmL67WzfUejX9s3Rj8ANQczu0vdOh0Z8zyJ565PDq82XzvXx5+GHOzul02FwB5H0mPn9dN2HyRJcjKd00Whn7T50gKw4/YeBNWrgNfG/gk8gcZnnKk1dBbxSth71amX8AMJ3kP/uf2tGQE5dcE06zj+M8I2VBuYprSDbDDn2ans=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqPly97u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1bYWc99; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqPly97u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1bYWc99"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADrYU2742615
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 11:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b3WranAQfzhXTtB1r8MBJk7fw0SYatMMlDEmM1ttxlk=; b=AqPly97uwQ+iJdSE
	CwqHiWWuAa++XKTPmlw30ESbj9wW70BAR25d1wUcpXzuf2eFHbsMNJE7c9ZBE4CW
	cE0NRqsJRHbrhF2/Mgk6kRvn8E6602CHzwy7dfrHqOgddt4ujxXYbLojpIeUrzi4
	JHhsg5njhvc5cwv21im5KhKec/Pkb/pr7BBib6R6z3Z+xf/CrdbRfhORclBEsZvo
	k4iKwhAJVjlYu4eeS6I77O+X7KmctzIRWr4OIpeG8MByyeqEf/983OJWx/WtfVxK
	nlWp8hREkBvpof6UbeXXc+NVBVUi4eEf1E2EMXVcWO4E0/4jGQDmHQKMaQb02qOH
	/micTQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p51f05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 11:02:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so540429a91.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 04:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784890940; x=1785495740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3WranAQfzhXTtB1r8MBJk7fw0SYatMMlDEmM1ttxlk=;
        b=b1bYWc99LH4zHQOg0mDDF8hDRgN3jzOtVeSOJronwfEzr3TfNKJL3GzU0jIeApmWj9
         lfej/P4ZRpKg+Ns+xHz3UdDutH/17iV3pTXrVmuFEJ3/t9tmifLc8f+qr7jzinKig64v
         3Itb30adqV/efiGY4yof5exT5yCmYvBNj5q+2g3pRdbBpHEKgyviwGZgK09seu8/FB2q
         2Aull+h96jKT/C19Bv/YwG93+3uws3yytQUil120a3GWKUpmVuD647k+U3O9wRSmsLQe
         kbG5cnquAV2lqX4YVhuRNijykwd0z/bbqUHsLUW/IPHiDVVQ0oz8bjIZketo01l2ZBlq
         xUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784890940; x=1785495740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3WranAQfzhXTtB1r8MBJk7fw0SYatMMlDEmM1ttxlk=;
        b=hs9ldqS+Jv1m/p42EwmKq3b56QAGMQvixZ3lhkGP9B3esXRDq15J2Bcr3iQ5TvNYBK
         TOa4yKOOwylwS+EfPCREia4CygXat8QQ6JMcJqzxv9pQqRfGdbPYCUC2tR/Z3PVGYPod
         5+IrhZX5JgTH0/MJrnoyC5YQ+jzsrO5+LC/Z+phG49xxx3AoGNadzPMlSNxXdoiGxFXm
         hM2cyEDAXkNz3MXX3Y8kyFoHslDTNp6+NsIMBDNMtkChQKRnZXYbf+nJSd+PIWv8rC0c
         UunQfOg/7ZebzQounLAwNeaQfyTAiMNPVW4Q1eLVVymXSZioXRqzWPYQ54Ea/IJlsyJy
         4JNA==
X-Forwarded-Encrypted: i=1; AHgh+RpZylBl5fYfLuJIXonoIcg1vVSkiHnImjWgShu5H/SZBTCOTmbNwU+kjcKy76RlYQl9pIcOptnqVC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDQxBFKd9UEU//4v3cUeF6m6ijQYUJ2Kp91IcNSrk7oZ8jzTqQ
	x4XvnzS53V5190nFSJRjJJsCDVqahPxExrZcz4UcJGiqEUzHC2l0Sf/00pnlQ5PYxspUNCbi0Q1
	RoEFeUcnrAh1OHGkwa6HER2gWL51fR1Gj+3Z0OwlJxmFCujggamFEDN0lVCNG/m0=
X-Gm-Gg: AR+sD100lUMz9eeuxCyUh68mEmRK1/+TjnCiUpYPs0/77FQgGNwCM/z3wqTQkUKxB/C
	by1Dq2czkG3wSvjpKuZvDT8LQZUykTZ0y1foyDoKRgnkrnnLxNMip4lo+SRveRRKY+gZME0YIvJ
	r/SNh02OOeTADuJfjTUowVeMohTKjgnNQzmH8QngfDSHI/usIUKjES0YuHcmuEEzLyjYFSVXpbz
	gNqw3k6MquFVeFzVnsFjvohSfTmKwpi/+KNkwF548fhkKHnyNrhoRB8e7GYcvWFHCUFn0zS6TBO
	Z8rRJX5Hdb16xAwt0NyAtjGMOnor2NFx1hzos/qLHjl3InrT3jzR94LVv7FDOQJXZtwj4nnc03q
	iiZVaNUmV07rZv/7aobXQAS6HSwI=
X-Received: by 2002:a17:90b:3b49:b0:38e:8896:4024 with SMTP id 98e67ed59e1d1-38ec688dad1mr6724436a91.40.1784890940210;
        Fri, 24 Jul 2026 04:02:20 -0700 (PDT)
X-Received: by 2002:a17:90b:3b49:b0:38e:8896:4024 with SMTP id 98e67ed59e1d1-38ec688dad1mr6724391a91.40.1784890939701;
        Fri, 24 Jul 2026 04:02:19 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041bec23sm1264186a91.15.2026.07.24.04.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:02:19 -0700 (PDT)
Message-ID: <fd1f6228-02d4-4dcc-9dfe-f4d304598660@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:32:12 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] clk: qcom: Add Audio Core clock controller support
 on Qualcomm Shikra SoC
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-3-90b878ae0d4e@oss.qualcomm.com>
 <amM_ViJcG0jbDNmB@monoceros>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <amM_ViJcG0jbDNmB@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a63463d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=XH_em5C6Qgemdf-nh0kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 2HR-k1ct8crRkVS9JYt5ZHyKntI5--as
X-Proofpoint-ORIG-GUID: 2HR-k1ct8crRkVS9JYt5ZHyKntI5--as
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwMCBTYWx0ZWRfX8WTz60J/1dst
 XoqdYDweFqpjN5zfWOAYWW6nGZiBn1TfG7WDqiN4LwQ0VA4OyCKQ/tTMiguCWBntQYhKhvcNODJ
 N34DlL9WxHUjKiLSWJUzTEXUiMuz4TE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwMCBTYWx0ZWRfX5UYnmvF9kkD3
 89R0cx2szWOVa9LSYBpgL5NR+pCy8nt0GibOT5W0Ly36Yjh+WIscXB8z5e+XgpEXI+5bJkgfq4y
 VfuF7XXZ3oq7RhhAuZlZQgRyojgJCsxk2krS75F6Tkcb7KuG0NysLXHged+Pr3QKmXE4Q+XVW5U
 skcVnHupajpH7Qefq3srIdRWoC7bS93BmzJb1np/hOnmp3E1/TDzXUbNDN5Mor3xshuS3VWg2+O
 sWn81gI9XX4f6HsVfgLv4wna4GHWXmKqgO3ypdZnfw8MIGyZG7oVc4cg8l9XyO3x8eytDYiAZI+
 zTvEkGDYnA7DyXyaeAP2pDPBtGXlXyvsBfTgh00BAtsOuYbq9pYq3Zy/bOcjXySPAR53+nNyAM1
 k0+ibwNnmQ3eUIbS+7BeTAd1PM1+ied9Lm239gTCYMtPmQ/XVQPCNF4+gKXefd8E8Rp0PMbVJ/C
 7/s+Y2MgMeGpFjU5AKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240100



On 24-07-2026 04:04 pm, Uwe Kleine-König wrote:
> On Thu, Jul 23, 2026 at 09:15:52PM +0530, Imran Shaik wrote:
>> +#include <linux/clk-provider.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
> 
> <linux/platform_device.h> already provides of_device_id and
> <linux/mod_devicetable.h> is supposed to go away. So please drop the
> include for the latter.
> 

Sure, will drop <linux/mod_devicetable.h> in next series.

Thanks,
Imran
