Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE1E3FADEC
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 13:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360241; cv=none; b=SfrvtRJoC/sfDZrpe55ixYzG0s7dOHHYHf6B4CnaI0p5tiCEmEy8MIAias35W2+cUue/bEOYYIAs/PACGTEquhV26dYc2dKg/nmfdY8iBr/OVm+Gxuo/J77mS8KRhXTAJFW4s1WjunDFjzMID7vvDhsmnNkoNIobDbVnpx9tu5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360241; c=relaxed/simple;
	bh=pRpXqKX3DGcpGHW4S1fO6rEvBtyVW5LqY/TcQkUDdAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PdUyVr8f07nm+JXj3tNEDrdo0gLBZXqkoG4XXQR0k/k+dxXwMucS1dtkrKqg8YTtcpc5UwDrvMYVAu+/zuLLNZnd8qfqBRnrMZZ0zcGDrIegIsut/UDLTEAqjhSnx/+aG2uTS/ajsW1XlLw1VjpuFcplsX37ILg+WXPImzyfv+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J7TInatF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D76dGWBe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J7TInatF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D76dGWBe"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OC4eJC409758
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 13:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1DKfsPVlgxtOA6J/xo55HFoYXQ/cUtB7i3T3emkwyDg=; b=J7TInatFj9ehsEo/
	jB3397IxH024in81il1Vx2I4kXtr1YPpiB8RuM2zIQtGWqMIdledSobbNBS4HnDX
	SLcY0RF2DtK7SxPHO5ktHKvbs2DDO5J/oh1o9UpERaiyjxr/EL9MrciUCfRN8foC
	z2fflsDhXOxgNsRuX85XQbfeeNJuLudrjq38AQ8Kgu886pCU7Jr5+DCrFngXHTTx
	xazU5khmMTGYzGgUgrWdhvCHLepXp+oZh43zb5A8l94xD+x+dNbX/I/7Jts30SIU
	TLtIiaCKflPavgzK3uM31W87F2uwGw7X2p71R9Cbt7SN290PVGLP9TiRQO0dj8Kn
	1RnkUA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3nexsm76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 13:50:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b31f391b8so33383601cf.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774360238; x=1774965038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1DKfsPVlgxtOA6J/xo55HFoYXQ/cUtB7i3T3emkwyDg=;
        b=D76dGWBexDf5Mow3jFsCIY3P+hCdeDeW74aSwLJcFh9wc5bGatPrZdBwzy0UDGSD8x
         gK1BgLY0JpximFVcNQWmq2RPlhrrwicWGt8Z8IbLTrMW0tjSx5cjaacAe60cUe3hhP7h
         jXSi6yNn4OSbdcpZ5Ix26o39LeNkmruarxHkuB7Lb5TbWz4NHXifWUzDcCy/tyQuVkdN
         0cODBQFWl+Mw03gSeCo+G8MUZTqqagkjGv7d631b5wiV+um1PevI6Cd3mXIM8kdKmHjd
         YF9V/6YLGWG1dDu/rUMmSTez+Zc79WCGQKqQeZzq09ZEzvSlGpQ6nWjmihxLM/0cC5eP
         hZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774360238; x=1774965038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DKfsPVlgxtOA6J/xo55HFoYXQ/cUtB7i3T3emkwyDg=;
        b=QxiAFDLaS/uVpQ93GUurmL9btusz8Pzz2RjpSpJyeTEk+WF2VJzd9VuLYfFjfefDGA
         +7Ah3d4Plkfi3HXVFVUPy+iUc/wFVTgQE/rHaHa2XaeQb5RhxZydZdVOYp0h3ahiqLTC
         LbBa7KJhndAHEusLIT7EsPwRVxOaJzjCiCw9VHtEoynrUj+XypgzazgEh0M3Gt+3ZLVF
         n3euKCHiXJUc8++ckAF5ELgVtcztORHcAbDrlg8Ao0iQlArGg9tKUhSjJGpcpKldVVAS
         vEqLMIe0KEbGNCx4bEAFMplHSGNemVhOSgDjoZqc98nv1L+/eZ5YSPUbvvzlu+Al/T5y
         PbYg==
X-Forwarded-Encrypted: i=1; AJvYcCWDtV6BBsruxkIbu90rYuXJfmXYAXuFkzTivitMHtwQngu3QQu1Sr93y1vWCHPF8BsmqumRmcbKY/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYoQsDzC6lBya5bv66N6HyTBEP5u/EBOVfgOfNyii0NDTht7GF
	x+V6MwPjQicoOYgDF9NSsExNTE41QCo52MAF4Ile1BfmeZ2K4N5fp4UILIG3zqV+ggbhQFSTdFp
	Gqtaol3UIBw2qfB+qRSGaRf6WTsks9mUE6zIuMk3GsY3eYYbmVq/+QyU0tU/55rs=
X-Gm-Gg: ATEYQzz8oKaZtGm5kW8vPb9E75z8bad8e6OJvTxkhTPi5gYc4GvngyJjo2tMRbvIBAl
	Cpq90SHpt65L6GUqXMrrsrBTTfTCU2I3+y1a5vf+s0jZ99Wl/QW1UQYWZb6H0d7xtMDgveU2iwn
	JBuPRitlzhBqr3fAM9BzENUTjMDAmWGztRmx5aEG9ogQHcniAy+VrtSJYwQ2BBpRBRI9tyTTKfE
	/t8+SawJAjCT9Fy32NnopwT6FeF43buRsALDp3h9XCrsy2leigKYrk4Vwku9olHALJsRk5cgVxf
	CD/+qhuPld3anzHekMMoq/KhmhBcQ2SsfBDbAIK6eyJqQQFfjPVILJ4a/X6dLQv5bsvSVcmc44j
	XP0rJ+k3CNB1OfOM9B5e2Yd14MXQ9+gEni7Yjnorl7aTmEFdtBFvVOXr2l3UB/fwASvvJAnydIP
	J20Uw=
X-Received: by 2002:a05:622a:a18:b0:509:882:9e7b with SMTP id d75a77b69052e-50b37606f0cmr190863971cf.8.1774360238392;
        Tue, 24 Mar 2026 06:50:38 -0700 (PDT)
X-Received: by 2002:a05:622a:a18:b0:509:882:9e7b with SMTP id d75a77b69052e-50b37606f0cmr190863581cf.8.1774360237885;
        Tue, 24 Mar 2026 06:50:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cf4f89fesm4782268a12.4.2026.03.24.06.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:50:36 -0700 (PDT)
Message-ID: <36bbe3c6-e83d-48be-8a9c-9cbc5b26e064@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 14:50:34 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON
To: Bjorn Andersson <andersson@kernel.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-hamoa-usb-qtb-clk-always-on-v1-1-a29ac94f20f5@oss.qualcomm.com>
 <gvj7tsivu6w2fzfcus6oi3pwc7jcfqdrx62uuzny674mj5ftus@dpnn4pzizbqc>
 <388c4c45-2338-4520-abf6-6a15aeb5db42@oss.qualcomm.com>
 <acH2K3-qhGMgkAtX@baldur>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <acH2K3-qhGMgkAtX@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwOSBTYWx0ZWRfX3QDO89yTPzk9
 WtQxdBMm/wk90nxXyxLWkyPHPbKHCPMw0FO/H4qZSjTTP8etX/dWqt6mQRWtt3NqSNhmfUbUDWy
 ps3TV5IndzyMe0ioIb8xFkvRvW94B+wLFmLVz25n5imMfgIRjeTmpd0wcYXWyLLnZ98PbImOZc3
 XJ2MrYWh5nPrA+qT02aHTpBqqSAH0rnrzIk8ELf400Mbp0vo4jjFzmDICKFjCtgkKTBmEXekQzD
 wdFc6F2plxk56+QWSevnvoiFF9pZ1yI+hQnsGbtykw/AZUwXnzVtsxz16LGQ0Qe0IBOPjm+YF05
 u/i2WxIAzCQpM2k/1U1ml3Q3zLW/L1W6V3Ux5RFzPtpYVXvOs2LWULwshvC9J30v6XXsDGhhkQc
 m0IGKjQd4PVbfeWkEj30IKt1dtLr4QbPEr8XKm42YmHl7mp/GZJ9N7nf4nkPTaVYg3DtbAS5RMk
 UM2+w4s6bmGI1RF5rjg==
X-Proofpoint-GUID: aB9sh3YBrJxg_2peo7yQsiawi5b60X0u
X-Proofpoint-ORIG-GUID: aB9sh3YBrJxg_2peo7yQsiawi5b60X0u
X-Authority-Analysis: v=2.4 cv=Bd/VE7t2 c=1 sm=1 tr=0 ts=69c296af cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=NIEm_JVVVNGBJfZDzK4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240109

On 3/24/26 3:33 AM, Bjorn Andersson wrote:
> On Mon, Mar 23, 2026 at 10:26:53AM +0530, Jagadeesh Kona wrote:
>>
>>
>> On 3/16/2026 6:26 PM, Dmitry Baryshkov wrote:
>>> On Mon, Mar 16, 2026 at 04:38:21PM +0530, Jagadeesh Kona wrote:
>>>> Keep GCC USB QTB clock always ON which is required for SMMU
>>>> invalidation on X1E80100 platform.
>>>>
>>>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>>>> ---
>>>>  drivers/clk/qcom/gcc-x1e80100.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
>>>> index 74afd12c158c01c121d9aecd56e65c0c302d7cd0..73a2a5112623e5190f41129af7fd76a86603557b 100644
>>>> --- a/drivers/clk/qcom/gcc-x1e80100.c
>>>> +++ b/drivers/clk/qcom/gcc-x1e80100.c
>>>> @@ -7480,6 +7480,7 @@ static int gcc_x1e80100_probe(struct platform_device *pdev)
>>>>  	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
>>>>  	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
>>>>  	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
>>>> +	qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */
>>>
>>> Is it used during all SMMU invalidations or only for those related to
>>> the USB controller?
>>>
>>
>> Yes, it is required for all SMMU invalidations.
> 
> What happens if it's not enabled?

Board goes kaboom if you suspend the system with the flattened USB node
(why only with the flattened one? I would assume that moving the iommus
property makes a difference)

> Why isn't problem described in the
> commit message?

That would be good..
> 
> If it is _required_, wouldn't that imply that this fixes a problem, and
> if so, why isn't there a Fixes: tag?

Certainly

Konrad
