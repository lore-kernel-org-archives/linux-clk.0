Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EF0246770
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 18:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763489329; cv=none; b=CsfNhZDvEDlmLJuobOytyFCfEP0EQp1Qv03UmTDTqEy9N8TpOjooBf5v+zk/neuJO2toInPfSQHr1L53v0U6aYRNYog4Svk7uXcg36QGUd7BS/6eclvy9Ln0c8/Kh9gTRUrdfRFXqKHwJ2nHTgnuBePk+zuRTmoq4KqCf2HuuXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763489329; c=relaxed/simple;
	bh=uFjeS+L+9p6//r3QPO5tVU4+lsHTj5VikorOK4buJeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLIr2u4x6s821Sv+6ai+FTZQALZtrPSwFDyFP1AM3X/bNMODCscjHebZqAh0nLfAWoDFwFfua8zfX5YzbOEQleceyBIrz88N713iBCNIzG037xaJB2Yb9zYY5lAqElcWXwYBDHviKwSAHUmu4DHNBVrAvmT0O3rUFvboYYvdlMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bG+QN3SK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EqhRsjTz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bG+QN3SK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EqhRsjTz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIDZXBG384295
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 18:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jFW2QamiLpQX2dBlDylSiFEKGsDftAsfgER58yiPGV0=; b=bG+QN3SKfYw3jHTi
	K9ka0fDivTLeCIAuYwXNReoH20TkN/GlIq0sFyFGvZXzOlLWjAONlfzCECGBskon
	1to5NRlhAmDMYZqV6rJeUMqt6CEhqwH9yULUdaGzHFFzxkv1+4NE+nBjPaRn8E+w
	TfnuS4teJk4xrokRpwIydYc2Wtmiuy3rN9TQpiLSpqLzT9rO/KEFKvNVcZblhpY3
	7BVsWvkid7H+WaVAj3VRoEDQl3WfgvY3/twYwwr1SwNp1SpC5NGVvR4yKTmYEy+w
	Tseli0mW6wWlZgaiQnG6L4R8U7y9+t7rsjpidyKXQPsyhwTdu7HtDYRh6ARYXyG1
	y+ORDQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8kg0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 18:08:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7ba92341f38so5395580b3a.0
        for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 10:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763489327; x=1764094127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jFW2QamiLpQX2dBlDylSiFEKGsDftAsfgER58yiPGV0=;
        b=EqhRsjTz/HDZTBP/wFj44i/QqVtsH5jzqWyJrebjO7wvyX06r+vt1RgEMhjRsoPMBa
         5gmVov2ChQg/StjAWfKT/8Pw81KvSErwoK6ZV8T9rIBffm3ZXLxjF7md8RhvpQ1gOG+x
         cXYk+fUjtaKA+Fs4EBHHY6fKSbigTxpq0BdK9iKsfrr8iZktayYyTaMJy0odHNDrz+gM
         jZo7pkKxKQuzTxqjms3cM3XFE69jOiP6diQdRd9L5Mx0Q9wlhfcAhamT/ND8T7iWUKWi
         bNZ8Q6gVK9q6S9BNdu1aQRjXu0cYU4TfX+WbG6yVnJ54tmgEP7m2WZHS+Ju9xgmV0N7C
         COGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763489327; x=1764094127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jFW2QamiLpQX2dBlDylSiFEKGsDftAsfgER58yiPGV0=;
        b=vW+9gUogbmj6sHAV97l9hSsaLLyeAolGlzouWl4+Uyv6SNv4VhY0g19fBG++EVkWlc
         CfEfrfxvHUzMs3KPRYLbNzmd/IFNyr1jr3QvXHb+x83gV4HK/++6Xp6rL9Ybo3/waYMf
         e8MsgApPe8eUKcQj3wqRl3qitq5vSDdcNhDFWmEFbNEK9FHUriv1JzQ7kb49z3BkGDjU
         hhMePPOa+AszKdyywJgQmBDqbhJKIyUTjFi7cdUqO9hYpvBSrcuYl0Rxoyw12FtSSGGV
         Er+BmPnBot5/lHQbOLQrJEkSNKnzPsKV/mu8EzWp3ywI/D/JdOD4UOxAPuqnIXrMiF1Y
         ecsg==
X-Forwarded-Encrypted: i=1; AJvYcCUbVgy71TwZILUhGCB77ZisFxeHoLJcAWhyooDA7TubWe+D5mo//c2u9sq//lU8NzruoaA/qXK7gvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrPvG0ZkTw+lgBppUBQ4zzQkquA97ffrnFc4+fCRQqFFZZwBoa
	fwljELyx24fngc7ZzyIFc9EmL9SxbxGxVDEQFchc4by5f8nZreJpGqz+51SWsLQIfhBIgzrAICd
	vVCiAEybnv2LLLeMs9/+Y3cTBBKSFwtSfu5/RJ3GKc21LGeqUiW1WL/3GRbWJrQU=
X-Gm-Gg: ASbGncuaF85YNO+iOsnuMf0ejX6W7zxeGydWX+2hh1wX1LPWkLijViBQzxkJvA6KASd
	jQvQBswWVSZ1GHudNrZnFnvvO75ifSqbOzztVGg5R5g1NCOckls4ef2izBMwqGAWD/ae1M3sdzf
	KuG29rmIDrgH1xIsVlvJiKaj4V3gPw35jbwXj96vcKNbw/NmpmGptzQMxAU+YlGRSAtHN/LFiHj
	GSncT9racHPSJQOktT75QjJIZjEe1b6F3kpPXwotKzxxnzeQIjMgrOmwbmHYjOi8gZwJcDd4/Py
	rxtO0q87tQaKA+0AIoWkOwxUGxOvALPrS8fU0aUlG4l4juGxBIhHkxilEEX7qHfGiy4VyyAPqzc
	TFV8T/IUki5DuTYE1QZjTmG+Wb7OGbQ7WDsXl
X-Received: by 2002:a17:90b:1647:b0:33e:30e8:81cb with SMTP id 98e67ed59e1d1-343f9eb3971mr18252047a91.13.1763489326900;
        Tue, 18 Nov 2025 10:08:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1Uzyc3Rs26M9z+TLr9RubNw66g8hWTj9TxU2LIQ388V/yrnerFUGun1mf/cu5llYgz5YFcw==
X-Received: by 2002:a17:90b:1647:b0:33e:30e8:81cb with SMTP id 98e67ed59e1d1-343f9eb3971mr18251999a91.13.1763489326415;
        Tue, 18 Nov 2025 10:08:46 -0800 (PST)
Received: from [192.168.0.195] ([49.204.24.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345bc274b89sm107138a91.17.2025.11.18.10.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:08:45 -0800 (PST)
Message-ID: <e355a0c3-6336-4280-9797-39397b146373@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 23:38:40 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: x1e80100-dispcc: Add USB4 router link
 resets
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251118-topic-usb4_x1e_dispcc-v1-0-14c68d842c71@oss.qualcomm.com>
 <20251118-topic-usb4_x1e_dispcc-v1-2-14c68d842c71@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251118-topic-usb4_x1e_dispcc-v1-2-14c68d842c71@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E2iu0ZU0GU6bBmfpgT2tx_8AuF3JfzkJ
X-Proofpoint-ORIG-GUID: E2iu0ZU0GU6bBmfpgT2tx_8AuF3JfzkJ
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691cb62f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=5+QBcuoneMP5E5DM890qdw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ns_ZLgzAnZTC3wmiXj4A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE0NSBTYWx0ZWRfX4iF95u113H69
 dIJqTlnQKaK2oaPxjLSDgqYGKZZsLMsWm9fO2IjmE/ENNekqbveHu32YOYSLGGpV6YE9fyo35y1
 Ert7blTmy4vtKVmvPTGTz8wmrCH8VRT5Tud8sUNr46VMTAdGSXhECg2F0Y6/rtgEjrXDxlREcaC
 hvq62o0eHq9L+6Y3+9p91T5GWUHwGnyjulSaoaH+quc0fJzlFbHb148G6x0mDRtO3bBwCEEInK0
 jjnrqDCRjauK/QRxedru/Wq1Gi45wuZhYugggIgMXW6Y2MK03pb4jdqIa75bBNP0IuOPSeK/9nh
 LxIz2VinNgE7qvnWsTvndZEKw7SAkz6QRifO3Y6yzii8tCBi0BuzAebetxM6jIYXX/59tP0qHQQ
 mTRqcWt0rbYMPOUdafJ2jt95I5bfWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180145



On 11/18/2025 11:03 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The router link clock branches also feature some reset logic, which is
> required to properly power sequence the hardware for DP tunneling over
> USB4.
> 
> Describe these missing resets.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-x1e80100.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
> index 40069eba41f2..aa7fd43969f9 100644
> --- a/drivers/clk/qcom/dispcc-x1e80100.c
> +++ b/drivers/clk/qcom/dispcc-x1e80100.c
> @@ -1618,6 +1618,9 @@ static struct clk_regmap *disp_cc_x1e80100_clocks[] = {
>  
>  static const struct qcom_reset_map disp_cc_x1e80100_resets[] = {
>  	[DISP_CC_MDSS_CORE_BCR] = { 0x8000 },
> +	[DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK_ARES] = { .reg = 0x8044, .bit = 2 },
> +	[DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK_ARES] = { .reg = 0x8068, .bit = 2 },
> +	[DISP_CC_MDSS_DPTX2_USB_ROUTER_LINK_INTF_CLK_ARES] = { .reg = 0x8088, .bit = 2 },


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

