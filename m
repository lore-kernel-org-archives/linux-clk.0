Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76634243367
	for <linux-clk@vger.kernel.org>; Fri,  9 May 2025 21:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746827261; cv=none; b=ayD2jgzyWHR2ea6XRsI7+4S+p1D6DL9/m7I50vmO/7YENm7YFpn88qRKsG2Y/d3YZHyZcdbivrAOoQ++R/P/FqdmHgwKiZodrS5wxoG740a52Ue5naxlqv//tlAWpsdax8TJuZ+j66fCiCCXSH1Yb8OyuBpq2R2/oHLUMZeTSlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746827261; c=relaxed/simple;
	bh=LrWZlx3JipRZAEsDNHeSY35/RAjGPR31bHo82ZX/dro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q6nYKWEI0Py6Abvw8HCBYsE0KIR5SvIk4XbUuTMUphSQoALSSjWxnJNDyF3Qzlu67c3gA34M5fRjK5fdIjtamHQVq+4sR4c0mYfyUCot+TU8thL/pZy8FEIDRgi1/6KOuh+tk1IPngQ4s6JRJ29TTb6ARGEi203/BaaAn/sW8VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTgmdQUT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTgmdQUT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BgEaV025190
	for <linux-clk@vger.kernel.org>; Fri, 9 May 2025 21:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qw/zOKbG+s9dSKA7ogOJ8aB0qk0go7aPu19+W/cL31c=; b=RTgmdQUTW1/TVMbL
	8ZUV00SmbEK19CHritlWQxkuwQanDKu/cLuJ6Z3MlC8m+tg+J52fvM5a7Vjom/tD
	d1RlScq43aoJa9PrH2LomMeIOM3uWAmDgdgjXb7DyBS/uh6vlFA3cl8ISuQQFCen
	imctM1QaCfRw29k6iDRmdMEUdeNVp3MNe6jBpnBpOlU+jSyJKSflzUmWFe1G0MT3
	Ac8gJ5P1HwaFh8PCq227VBwf1alkOTsSTqG7jcvvNIlw2qK6BJFhJcZpE5ONvbyP
	RWM2p2ZtYqqf/+3KvFSNjiZIyWwx3NiP6K/GeZlGV0Fk9K+LGN8QnvSb4bRhlPim
	DlidOA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp15yj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 May 2025 21:47:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f539358795so4353176d6.3
        for <linux-clk@vger.kernel.org>; Fri, 09 May 2025 14:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746827256; x=1747432056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qw/zOKbG+s9dSKA7ogOJ8aB0qk0go7aPu19+W/cL31c=;
        b=uvVPONeaCyXVxSqrRIWSSEjZQWHfdG/PKFoW9dPwLO8mztxFitKuOgTaN7OcbkQN3y
         7kcyEKA+StVxdXXYbWY3Z2zg7dakSFdrumg3iVAVaQ4i7E7Dp6ht2S+9mpjSVa+XPIdo
         xIm+BkahZJcTNn6zYKLg3AvE10ftKWAuTV7aoVA4VuX+4y8+jve/kqglaoc64AvZtwXc
         8z9wagWzJSl6z1cr1+u0MRXFw+JxrwacmxZ1kNUGt4x+hSKblbNiAL5E4YH0BuS8cU4r
         8c+Zm7rpWb5gtNxComVKUg2lgENumYSnwiOb+jozpiv3thYBzN5oB1tK7+l0pmFDRIQU
         e+fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVB2kcus0RLE+kbinPW9t810c2UoKtwxoNv+Gq8JpPqDjigApENVKCCoWneiI6+vbjG368+SjeIWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi8F1e6A7n5Mal2VaZBupyoETGO/71wtc1JOZ0WT+D6utf3CCI
	P+DQZFLA6NFs8XJPTqPHYoRMnMijll39Vf/y0dWyJiSlSS8TDMFIPU7dK0a6q5Sp8qwb5Baw2tc
	a0NrwdHMUEhyvN6MqPAC78S1AEaTWsBf+jupZsbr5J5hr6Xp2CEEaGj7ioDE=
X-Gm-Gg: ASbGnctxrEuZPG9xcCz4l6261XSdMeH9hDtuYDlnxq8/yXCgi0xY0cDqSDiPFSCYVME
	D5J64sfA4JZPHwlaKEpTEKKyRddnUa5+q6l2371ukGLuTsrP28qRf8J00PgGr2wI1FxGbF4Vnvh
	Di8uQuRdbQZxdOWh2Z/jOLkNBxUnggIaeMzEOM0WyrTY6sE329bPONWnC8iDjikHw64D6LS+Nuk
	ZWZ8/mcztsolUM3J40bvxMQ/QW/1WjyfoarwU23zzYQ8rrZOkIvsTmghh8CLCXK6a+O0vbrplZw
	NCT6kT0xaog1SzbEwbW1S+3HwMjIBsnL58H9ko0IwFzMUP5WHTXYUw7xT3MChWs8mfw=
X-Received: by 2002:ad4:5dcf:0:b0:6f4:329d:d3e5 with SMTP id 6a1803df08f44-6f6e480ff24mr28928266d6.10.1746827256382;
        Fri, 09 May 2025 14:47:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4kVfm3UKCIez6pugUGxDw+qic6FGMUITyhMEPjM/ZFm11+v3bu99CrX3yIWV90/41JaxfmQ==
X-Received: by 2002:ad4:5dcf:0:b0:6f4:329d:d3e5 with SMTP id 6a1803df08f44-6f6e480ff24mr28927986d6.10.1746827255955;
        Fri, 09 May 2025 14:47:35 -0700 (PDT)
Received: from [192.168.65.158] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cbe5542sm1910107a12.5.2025.05.09.14.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 14:47:35 -0700 (PDT)
Message-ID: <a3c3dbe8-b73e-40a4-b86f-ff9f371b1a46@oss.qualcomm.com>
Date: Fri, 9 May 2025 23:47:32 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] clk: qcom: ipq5018: keep XO clock always on
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
 <20250506-ipq5018-cmn-pll-v2-1-c0a9fcced114@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250506-ipq5018-cmn-pll-v2-1-c0a9fcced114@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDIyMCBTYWx0ZWRfX/Rmtr2QzjptC
 yop15tFqIkbDRhyQ9D7NFzJ8T/NdpBheT8oBr7iMbbPrLoQ2Egyk/Azs5gCZMXg9kzZ6FFVKKO2
 xjovDnM3dAZeCbwuRytmvVg9aznE2bd+sOmEUUN5HX3BkWk9vPiYOoEatOMPvfRfaWIzFxM0I1r
 vJjx4+b9KJ2jzwNi005WZ+7Y9nYL1VZ29SmOecudCfzfpM3LTeAsqQctTQ2Ar8ngIyEk7R2M/Cz
 l5e62gHGogpSIrelgFnJyRJBhsTQhzeW9p1FkTJV56nCuA4KtwngyPWxzaQWjFoXyjRoDfqZzga
 VDtcAM2RtEZfjPXB0HHMUYOLIAgMmfA//NcBAzjzDxiNEXLycIb1ayl+ganswRzDWRgO5WAKJhL
 vA9biMnUHAb1nXOiPI2hk19sI9n7F4MtfXmvMV1frNz2OsVZB+8E8cxxh0TbcI2irzLpaEJF
X-Proofpoint-GUID: 9BFjEiCgWwVagVFdIU9iOm4PZ1LxbDm1
X-Proofpoint-ORIG-GUID: 9BFjEiCgWwVagVFdIU9iOm4PZ1LxbDm1
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681e77f9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=6ibG6wpdE3FgK2yJb9QA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_08,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=783 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090220

On 5/6/25 7:43 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The XO clock must not be disabled to avoid the kernel trying to disable
> the it (when parenting it under the CMN PLL reference clock), else the
> kernel will panic and the below message will appear in the kernel logs.
> So let's enable the XO and its source CLK and keep them always on.
> 
> [    0.916515] ------------[ cut here ]------------
> [    0.918890] gcc_xo_clk_src status stuck at 'on'
> [    0.918944] WARNING: CPU: 0 PID: 8 at drivers/clk/qcom/clk-branch.c:86 clk_branch_wait+0x114/0x124
> [    0.927926] Modules linked in:
> [    0.936945] CPU: 0 PID: 8 Comm: kworker/0:0 Not tainted 6.6.74 #0
> [    0.939982] Hardware name: Linksys MX2000 (DT)
> [    0.946151] Workqueue: pm pm_runtime_work
> [    0.950489] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.954566] pc : clk_branch_wait+0x114/0x124
> [    0.961335] lr : clk_branch_wait+0x114/0x124
> [    0.965849] sp : ffffffc08181bb50
> [    0.970101] x29: ffffffc08181bb50 x28: 0000000000000000 x27: 61c8864680b583eb
> [    0.973317] x26: ffffff801fec2168 x25: ffffff800000abc0 x24: 0000000000000002
> [    0.980437] x23: ffffffc0809f6fd8 x22: 0000000000000000 x21: ffffffc08044193c
> [    0.985276] loop: module loaded
> [    0.987554] x20: 0000000000000000 x19: ffffffc081749278 x18: 000000000000007c
> [    0.987573] x17: 0000000091706274 x16: 000000001985c4f7 x15: ffffffc0816bbdf0
> [    0.987587] x14: 0000000000000174 x13: 000000000000007c x12: 00000000ffffffea
> [    0.987601] x11: 00000000ffffefff x10: ffffffc081713df0 x9 : ffffffc0816bbd98
> [    0.987615] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000057fa8
> [    1.026268] x5 : 0000000000000fff x4 : 0000000000000000 x3 : ffffffc08181b950
> [    1.033385] x2 : ffffffc0816bbd30 x1 : ffffffc0816bbd30 x0 : 0000000000000023
> [    1.040507] Call trace:
> [    1.047618]  clk_branch_wait+0x114/0x124
> [    1.049875]  clk_branch2_disable+0x2c/0x3c
> [    1.054043]  clk_core_disable+0x60/0xac
> [    1.057948]  clk_core_disable+0x68/0xac
> [    1.061681]  clk_disable+0x30/0x4c
> [    1.065499]  pm_clk_suspend+0xd4/0xfc
> [    1.068971]  pm_generic_runtime_suspend+0x2c/0x44
> [    1.072705]  __rpm_callback+0x40/0x1bc
> [    1.077392]  rpm_callback+0x6c/0x78
> [    1.081038]  rpm_suspend+0xf0/0x5c0
> [    1.084423]  pm_runtime_work+0xf0/0xfc
> [    1.087895]  process_one_work+0x17c/0x2f8
> [    1.091716]  worker_thread+0x2e8/0x4d4
> [    1.095795]  kthread+0xdc/0xe0
> [    1.099440]  ret_from_fork+0x10/0x20
> [    1.102480] ---[ end trace 0000000000000000 ]---
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

> +	/* Keep some clocks always-on */
> +	qcom_branch_set_clk_en(regmap, 0x30018); /* GCC_XO_CLK_SRC */

this clock is not a clk_branch2 - its control register is different and
this call is incorrect - you can drop it altogether, as if the XO source
clock isn't running, the system is dead

> +	qcom_branch_set_clk_en(regmap, 0x30030); /* GCC_XO_CLK */

This one actually is likely supposed to be always-on too - does removing
these two lines do any harm?

Konrad
