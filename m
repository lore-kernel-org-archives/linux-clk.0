Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23039223311
	for <linux-clk@vger.kernel.org>; Wed,  6 Aug 2025 09:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754472482; cv=none; b=EY82HEaa85cQRdoWpYuHlJiwoI3NYENHLUrwpf2Y4uc491/aKDM3vBcsneqSsJmrS/i0DyPIvQIFitC9zkbUscxBD7cxs+mXVyBUJpK3BCDYfBZG2p9vZVdz8dVu8KRKTifW7sKgrUZv9nC65Ce70EuwnyYgV73GdZ4Pt4t7PiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754472482; c=relaxed/simple;
	bh=MYut1GmYrZ9pGw7AeqGr62o2kp3kOej29q5WczHLC4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s2pM/mWbopJFzoDtgiI1TDVhctUkQPS1btjP/XectNfJYxf+V0vUdyzptwi18XalOClkyee0zV4QzrDzD24Nd/l7sLV9rCB6uUpFBHM4tpJHnHsdgBQof7u612O2PYJgfaiBf+TRt3JIdWHykJyxRkoE4X6Z7tCzxx0JtHfJoWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I0tKLwO7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I0tKLwO7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766PcBo030947
	for <linux-clk@vger.kernel.org>; Wed, 6 Aug 2025 09:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PNaqGeAKSyJlv//PcfcZiYRz0y4fARWElDbjpanQxvs=; b=I0tKLwO7wrtDlk9h
	/cDNF8dF8+ZpcrMaqSiZn0DX10GVif/cOL4uh+ew/CnX5pz4Tvi8CkQk7g/I/Bh2
	Z1DpMTE4k5wS5aPmCyghFvkdZFTnua6TP5v8NQQpSZvuhK+fUGFc+A8VzRI1wnOg
	Y3sGubCN5l+xpj2tb8bJWuxIwZMWI+OyZ5QZI+w9B4LJY+txk+D8ITUhHHd/EyV4
	6S6bujOo+YVfzLPHvf6RlhbbVLavbrMJoed9TMztVfG2fktm/lVS2BrNwZ2WkY3X
	gjzckmWsXPSXeMUfJIWabuIxmWNT4mPg5eI4Czv3B8QS/TbGpfDo1KJCEqVuLnBx
	lzo7Kw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyct4de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 09:28:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31bc3128fcso9795393a12.0
        for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 02:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754472479; x=1755077279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PNaqGeAKSyJlv//PcfcZiYRz0y4fARWElDbjpanQxvs=;
        b=G+oTPBORlcNPyIXz/wOZRoqXH0m+jHNHuY3Q86fV2zY4wwIior/Rv4215Et+Ac+WbV
         1BhqxvtHd6E+FHarbDOoJ65KGww5bJbnDtuUo/nvXrl01XLwoFDMf3CQytYvDeQnFxOt
         +kXjpO8mEcMyPhU8VEo/Wm/U7NBM77WYDYn28qdE1qByYqyDL+lLkpSiMqtYbm0O2P5L
         hpBAuUSh0d6QKAH/0s0Q1L/M135szfR8UM8lHQcMyavhKaZkupL85I33WEKzCHiRUmEn
         RkZNbd/O5UlkbtOsXJqLcbTa8CRIC1pKZuMTgXECrOUTBkQB34Bd41NAMve9UHz7+XV/
         iOPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWyCSr/TpeO10qaK4f7Lze55Ud8ABdMkiphk+YrJyiPcdX00vMbGA5cOw4dCQYx8QitMJIY9jFIlk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKc2B/upQTylsUd9957qzB1rlHeO21ksrMYD+pwOKH1ZJz2hpq
	TPH8m0FriY1tKttwwTC6Yv31GBu+ovrZLc5HGZ87YDpC98ed9r7qucGOur2uyQisy0EfVbWEesx
	oJLRS8STtk9WnBVl7yaDm9w50IobwW5e3nk/xglh6z0OWMD9mq7Nw+duSOU8x3Ss=
X-Gm-Gg: ASbGncsSKwnlKzHSM5hjfea/rQqrV07y2BsuG1OuFl3pMaqNEKaQbS0TaZ1DV8zxpRk
	CcsRM0uHO8VwB1vhAwQGwYhYHenAUqZptL0RxjM8DkSEKLGr1/PM6gO9e/ZUkAxZfEXeRYgebjP
	dwCuEAohF/phWArxzGAV77/DN4iL/Eu8exUZP3UIBP4eYaNFbXr7jdN0DN9XD6DzHNuyhkvatJ1
	wPTloPh2MXQDZn9TUK1m+P0M2hEdF4HKWZ5eZ/1yAQw3Wn5uXU3hDnEZ2QXsFLb4Q0OWY0SoMbL
	AN8Uv2J14ZpgtP7G0hPZzJEKyCIPFmhQC7IkqlkTfcJIiRo5nmmYb7PVaNoPvNjogl0=
X-Received: by 2002:a05:6300:2189:b0:23f:52dd:2d1a with SMTP id adf61e73a8af0-2403145511fmr4473208637.46.1754472479361;
        Wed, 06 Aug 2025 02:27:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzhMtEb/SyNlFHoanrLp8CaRrAf/5QiS39aFFc0BF9fQdyQg3b0pbGoRpmXbYkFnw+mTFqUA==
X-Received: by 2002:a05:6300:2189:b0:23f:52dd:2d1a with SMTP id adf61e73a8af0-2403145511fmr4473172637.46.1754472478954;
        Wed, 06 Aug 2025 02:27:58 -0700 (PDT)
Received: from [10.217.216.26] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4230ecf8b7sm12841307a12.11.2025.08.06.02.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:27:58 -0700 (PDT)
Message-ID: <c54e8ac4-9753-47bf-af57-47410cee8ed7@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 14:57:53 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250804-sdcc_rcg2_shared_ops-v1-1-41f989e8cbb1@oss.qualcomm.com>
 <bnlnz6nz3eotle2mlhhhk7pmnpw5mjxl4efyvcmgzfwl4vzgg3@4x4og6dlg43n>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <bnlnz6nz3eotle2mlhhhk7pmnpw5mjxl4efyvcmgzfwl4vzgg3@4x4og6dlg43n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WHjsxmuKq-zeI98CF1t2czXVxs_1g_Vq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX/eArmDNFS9nc
 ssDVIg+NgewkmpvSuButMdbCn+tLOFfVHM20gpIkM8lpvTyFxFXmxnq9lpc1zaifrLkPHHqgrfZ
 eTYKj+QKb3B8sr6jbIGcde6oN+Zmj4bAfpN+G0gVPoP8FWKb3HIUEiZF0hM+Sypjmq6sSLLfiXi
 jXDhXcC+J00QXLvNacye+sSk1l71WahwzsaTtAFJRXFDsuvx2kDqxBgoecs03GYJuSVwAzZAy/P
 z2khLeGPoclxs5iTOfoOl9ycwMPsLk8InEIud81mG/ifad44QZADP/Lpi0qTNb2G1xicP7rYXRO
 +lvlqilCnlgtugADoEwdKbE9uK1hhofFXwznLoP1vpJIWkA/qFyrGosRGEXDDgs4zF4VhFuuvlU
 EtQICFZX
X-Authority-Analysis: v=2.4 cv=JIo7s9Kb c=1 sm=1 tr=0 ts=68932020 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=h-tywKWRDzwo4R0Mf8sA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: WHjsxmuKq-zeI98CF1t2czXVxs_1g_Vq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008



On 8/5/2025 10:52 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 04, 2025 at 11:59:21PM +0530, Taniya Das wrote:
>> gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
>> boot. This happens due to the floor_ops tries to update the rcg
>> configuration even if the clock is not enabled.
> 
> This has been working for other platforms (I see Milos, SAR2130P,
> SM6375, SC8280XP, SM8550, SM8650 using shared ops, all other platforms
> seem to use non-shared ops). What's the difference? Should we switch all
> platforms? Is it related to the hypervisor?
> 

If a set rate is called on a clock before clock enable, the
rcg2_shared_floor_ops ensures that the RCG configuration is skipped
unless the clock is ON and which is the correct behavior. Once the clock
is enabled, the parent would be taken care to be enabled. So it is
better to move to use shared_floor_ops.

Yes, I can submit to move all the shared_floor_ops.

>> The shared_floor_ops ensures that the new parent configuration is
>> cached in the parked_cfg in the case where the clock is off.
>>
>> Ensure to use the ops for the other SDCC clock instances as well.
>>
>> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/gcc-qcs615.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
> 

-- 
Thanks,
Taniya Das

