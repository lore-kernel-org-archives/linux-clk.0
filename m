Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978D8349B19
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781609603; cv=none; b=gzsdFCWAAz90r5HlH4L7AalCoS+zNA1aSQ6NWHhHfDnqHilIQ8BmdGoPU14GC644YOaPDf2mlWebxg7cAZdYIDDoFNQ1XQfFBR1twDlWzDfdaW0v8oamhNXp7ZjSJKk1SvLNfk0pzvjaA7PE2PRN7UXtT8kBWNqjTSZuBRkrwKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781609603; c=relaxed/simple;
	bh=5b1lKuxonwsyguS5/PT+2GHd9Md2CWtz5U0lmjoy4Uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uVun2e904YW2heMyZ2B34wZPl6EL6Y5bF29G573R5fqnTQufr55O/GMh3dibvbkBLRQe+AobX/+zmm/xkKZp5QBn9ACi4KupV908Dn9Kld2CU8AfxDJJ2Iup9i5XNevLVMU/7vAOEzr6/gkKMLr8J/fjeh0EQdfiiskYzjNUVSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lg0171m7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FW5uTkmm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lg0171m7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FW5uTkmm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9jSe2799422
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 11:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0/KTaSvmO54QFHOUc2TftcdK+IfM7e3ZkvKmUPM3sXs=; b=lg0171m76ElWYK2Q
	JlwlcM8T+lWWeyKSN9LNT5yvG8HtX9W8OhlrwwVXe8mxTN2Ow0uslcH/OaabOiHw
	0ekpZ/qI0ZlYK1c2lVnslf1FM5ikPLTsVqCwgs2IeFTxsi4DElcy719QPzxfGnIw
	rHBaftju01GI/pPdB/G8aGPoCweVQ+V8SZGITJhyGRchpMurusD0Y2E5wqho+gTs
	MoKK6iyJyE7li2MiGDARkITFlW7FnNt4y88eCLqY4I6babIThW5oc3DQfDQH2SGv
	14tAgkfT5fOcK/LztEmHrXsTmzZoikecV3Z+IcHCn/UzilbZml6BuhgOa2Z+ncSF
	P4tS2A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7sjcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 11:33:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51759082206so12259531cf.3
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 04:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781609601; x=1782214401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/KTaSvmO54QFHOUc2TftcdK+IfM7e3ZkvKmUPM3sXs=;
        b=FW5uTkmmycknUMwDvo7pj615DLCsN0STPsxkOsIVTe1TMmzbjyV4p7xTi6HMrpytyB
         nAjQ7nSsjA2ho6/HzSuoQH59b3JxFc+kX1catZ4tjxSgcz9mFZMr+cvtV7uP7CKs4XPa
         TyE40vQzntkp5GEaaW0FxIj//qzBO7s5V6dgUtkfRMSaR81md9hwNBopB8v1KDkDofYN
         g4GuA5r3cGVNwBUF8bkHwMwe/o9ej1YVRwHCEOMcXZjvbusBrEd+ytKrn/ndQUU8CPg2
         IRqYOPQNBU8gtrllIeujrVe8QlN5S9MjYwnVkBvcXpIfKhF6J4X8vI9s+XUZzCb9m/un
         Q3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781609601; x=1782214401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/KTaSvmO54QFHOUc2TftcdK+IfM7e3ZkvKmUPM3sXs=;
        b=MZO5Fkxo3rdARtaF3SP8RsV8FqfU8IGO7LlMnuI3CCHWQ+aL1+j98go5JnR74YhD/x
         5w7PL+r/5kuM9ZLi8JwSmDC+2GQObME0w75uT/OtsA8Bsg10bRlzkjrALD+entTNiupq
         G+AoUgk/7eyAoiMQl/PUR57eCP4BcVLT7zTEGV2Xpp0yNtYD6rE1nI8O25GhnCSjdxgf
         PqiQgm59J9mPwBurUwLOL+Oems8hPOaQAHGZ85ddfDuZh7vvzoRqmjryTDxI0i8AwhoB
         /JRzHC+YyeyVCzyQom7IGP0w4wj21UdQ7MAq1vKJ5Y3dqTgqk6ZcYWjWaLts4vxg0hQC
         z9EQ==
X-Forwarded-Encrypted: i=1; AFNElJ/f6+kMUa2nmaoBT/O24mE0o3hZXLgx+Id0mX+7cxd/MuVL9usTAYhlHflg0PG/LBZVf1/l9d5Ht0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT4pNACfokaMkw1V4DcbMBlMkUFomO56ODMw3exMBGx6tf3CBR
	nOQf8Mn1FVupq12pHuaaXwpyZfvPAaiS4TjrAgowqRBQVya2j9ARYy4TRWEiiV1jD8Mrom5hfpD
	cOY797+3F+8zd3PdQQ41sXs0YCkgIHeBjlXqqjPjGRujwoQC1UaT/WjMtoPx7Urw=
X-Gm-Gg: Acq92OEAu3XAX+1zdiDYnlqzi5s8g+G9aRD8nu82J8c8nD4oi1FUSQTILhkoyLN9OLS
	ydrdDwoa+GXDKyV730c0Haqw+xVvnKfr3XcdtL1JLu4EKzOYJ8UsgCurLxJPl+QnEQLC2IMxmwR
	hloDEwpLj8948cxAtxERZW66fMGwb5WRXuxD0TkpJzTELD7EJL6tOSFEtjMJdW1Uw96wDnbVNlK
	xI9rHLQwh8s3forvRwbcaNb40o1KajBUVp1LRzqqGVaEVNJjx5O05SGtFLVzTkVs4c1mN2DXkI9
	dqJVoZgIO5BQbTr+8iBCjLgF4RBFfuAEM0ifSfZxSvi4oD14YO+8hTvkDrxvPATpgHUjV1dE8Zo
	Mas/zyMDblWBLa4NJOh61OEkPhQWV7AzP20zExN7o9eonBg==
X-Received: by 2002:a05:620a:2729:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9161bc7409cmr343129285a.3.1781609600851;
        Tue, 16 Jun 2026 04:33:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2729:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9161bc7409cmr343124285a.3.1781609600316;
        Tue, 16 Jun 2026 04:33:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6e6c9sm639951166b.39.2026.06.16.04.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:33:19 -0700 (PDT)
Message-ID: <f9511ec8-be32-4232-9168-00f967c29508@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:33:17 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-9-val@packett.cool>
 <CGME20260320113219eucas1p1bc2f238b689c55ba256c4694eb067d35@eucas1p1.samsung.com>
 <2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExNyBTYWx0ZWRfX8/Cjsa03zXme
 tVwMPLx6EIsCGTQLMwNzQWA5/Qlu9JlN5pQlhyps734+I1WwckK0Gx1as3SoR9GYXaw7YwlBFV5
 jUXbjwjcQ/N8ygCCXXWkKE8rPfKuDRXES6UPFOYv056F4x9CVXIyYvorQJvHsMziVMfdxi10dnT
 JHWoZC7LexUCQrAvQVsXcOnDOx/oTBlHoptVxw3AH37q1I6zArxyKPGxY807FN1/zmIJS3cdYlR
 K2m8ZI2q4mE/SP085YwvmJm/OsIaj2vuT/nW98NAfLl7w8r65K1/L603c9vkm9cE9sjkeLznqEl
 s9iqEzuKbdoB97tWZviO5UqItS0BMgj/lPOkVMygVOPE9M3VIl45yaym4lK7uv2Yz6vYOgQzWlq
 qnCI0ySxGVcsOGxnRsFilNqfPv+aet9EbvT/eH83dw+QKNb5oKRU44t31CpTiDa92ITXzWodwrf
 PJjw0nC30OkhyFEDsiA==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a313481 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=iR95WtxUERvl_OCU54AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: vEEg7fbiBl1Q942PZ9eifzPPGhKui_cJ
X-Proofpoint-GUID: vEEg7fbiBl1Q942PZ9eifzPPGhKui_cJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExNyBTYWx0ZWRfX9xmnW/ooIeIh
 Rn3wOhbtZvld67f+PJ/sCwgPepRFszcddblHiNUCPyxnUAEahz+la9iri6/rqUEO99CTnsfUkP/
 RwGSLC5DNLDKK95dKcaNKkvcRmOYAZo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160117

On 3/20/26 12:32 PM, Marek Szyprowski wrote:
> Hi,
> 
> On 12.03.2026 12:12, Val Packett wrote:
>> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
>> clocks are enabled during clock operations, preventing potential
>> stability issues during display configuration.
>>
>> Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
>> Signed-off-by: Val Packett <val@packett.cool>
> 
> This patch landed in yesterday's linux-next as commit. In my tests I 
> found that it triggers the following warning on RB5 board:

Hi, I was clearing out my inbox.. Is this still happening on the latest
next?

Konrad

> 
> ------------[ cut here ]------------
> dsi0_phy_pll_out_dsiclk already disabled
> WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0x1ac/0x1bc, CPU#1: 
> kworker/u32:6/120
> Modules linked in: ...
> CPU: 1 UID: 0 PID: 120 Comm: kworker/u32:6 Not tainted 7.0.0-rc1+ #12425 
> PREEMPT
> Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : clk_core_disable+0x1ac/0x1bc
> lr : clk_core_disable+0x1ac/0x1bc
> sp : ffff800081a2b990
> ...
> Call trace:
>   clk_core_disable+0x1ac/0x1bc (P)
>   __clk_set_parent_after+0x9c/0xf0
>   clk_core_set_parent_nolock+0x1f8/0x230
>   clk_set_parent+0x40/0x84
>   of_clk_set_defaults+0x130/0x4b8
>   platform_probe+0x38/0xac
>   really_probe+0xbc/0x298
>   __driver_probe_device+0x78/0x12c
>   driver_probe_device+0x40/0x164
>   __device_attach_driver+0xa4/0x148
>   bus_for_each_drv+0x80/0xdc
>   __device_attach+0xa8/0x1b0
>   device_initial_probe+0x50/0x54
>   bus_probe_device+0x38/0xa8
>   deferred_probe_work_func+0x8c/0xc8
>   process_one_work+0x20c/0x78c
>   worker_thread+0x244/0x388
>   kthread+0x140/0x14c
>   ret_from_fork+0x10/0x20
> irq event stamp: 336832
> hardirqs last  enabled at (336831): [<ffffad391268b854>] 
> _raw_spin_unlock_irqrestore+0x74/0x78
> hardirqs last disabled at (336832): [<ffffad3911b6d8b4>] 
> clk_enable_lock+0xcc/0x110
> softirqs last  enabled at (336804): [<ffffad391134b884>] 
> handle_softirqs+0x624/0x63c
> softirqs last disabled at (336793): [<ffffad3911290674>] 
> __do_softirq+0x14/0x20
> ---[ end trace 0000000000000000 ]---
> ------------[ cut here ]------------
> dsi0_phy_pll_out_dsiclk already unprepared
> WARNING: drivers/clk/clk.c:1047 at clk_core_unprepare+0x1f0/0x210, 
> CPU#6: kworker/u32:6/120
> 
> It looks like a bug in the code performing the default clocks 
> configuration though.
> 
>> ---
>>   drivers/clk/qcom/dispcc-sm8250.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
>> index cdfdb2cfb02b..e59cdadd5647 100644
>> --- a/drivers/clk/qcom/dispcc-sm8250.c
>> +++ b/drivers/clk/qcom/dispcc-sm8250.c
>> @@ -578,7 +578,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>>   		.name = "disp_cc_mdss_pclk0_clk_src",
>>   		.parent_data = disp_cc_parent_data_6,
>>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
>> -		.flags = CLK_SET_RATE_PARENT,
>> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>>   		.ops = &clk_pixel_ops,
>>   	},
>>   };
>> @@ -592,7 +592,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
>>   		.name = "disp_cc_mdss_pclk1_clk_src",
>>   		.parent_data = disp_cc_parent_data_6,
>>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
>> -		.flags = CLK_SET_RATE_PARENT,
>> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>>   		.ops = &clk_pixel_ops,
>>   	},
>>   };
> 
> Best regards
