Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C747B3ACF13
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 08:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776070095; cv=none; b=qu7pJkGkkP2wMq7phWL+zY4/m0nZXmBqhQ8vY8kmkQjW5cVftWddNdUlqrwE012vw+3ptY7T6MiBgPh5xsXDFqCM2vgPA8fP2hk2D7VLGGmBViC5ZTfGfnh3JN7ZdMioNSXreGWTFFZNsbAt5d5wlzkCe39gD29ZJ87WpRHT/cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776070095; c=relaxed/simple;
	bh=evRO0PQwMkxKIu649eD/iqI+4CsDeCsGaBZiEEguRB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TU5YP00iUDoCp9mMilwZYLmcDzvjltmDEvPMAJjYFJ3eI5ihjtp8Tzq6WhYJh/+nDU1+VXFeK4BukHDvGukgONFmmqjR5SOkqm4L1cFuS+oABq3q5RFGK5ZxaKHJSdCRUGJiB71s8Rk21prwc3uO7om+ZMLVxqkRbexb/tDf36U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XX9GWbI3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNkWFeoi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XX9GWbI3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNkWFeoi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6xnib2662866
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 08:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gOH7c8WdaSQxakxnVC67pQDyVDyLKRgH4/csJfymxE0=; b=XX9GWbI3pcPEMwpz
	0v5SAxbIi2V8OVpOdQTpzM4MyYw2sgOpLRSV0RPJmFWDcWEybgb94sOQphK3vDe6
	iO42Q+tTGO3drt+SPwnPgR5YG5z6g9GM0B/IG+RwHgCUd3CUyMOZoH7+vesl2vuD
	xbOTPucktEXO8D6jD4tn3ousq5/S3g3q6SizreER/Ctyd2ctLGjC+40JsoZerCmp
	aXUbL/6sPMmMNl52HUMYGwsrj88B0xM0nbtdFjt5qmPOm0evRTc8cRH0fC+Tqv33
	uRotn0iVDGoAjN+O21FV5aUA563pdPNEE2Da+bYUSgWzyck++EaMSFv6CyDhuzWy
	yevyiw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6mgm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 08:48:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b9074bd42so11460161cf.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 01:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776070091; x=1776674891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOH7c8WdaSQxakxnVC67pQDyVDyLKRgH4/csJfymxE0=;
        b=dNkWFeoich0LqQ5q/DEXa10nq5JSR5gayOBXNDcYKq8uWiiMevRR0Mu0J7BnQ7Xf8F
         pblmx45sEex+y3pEMkSl9af9/tovgu2CmcpmkuFr6SWRbwydLNJlmXaiHTHaOBD2+Y9k
         ZcwfrTLCzN3Y+OOwM2Nr8Mt5uim5ljFOIg1tmP/532vwxYoJW3L15VLmzH5XNt+AgVmf
         Mk8dZTjYv3sBRUJspGDMjkoFN2Jd8J3KqtIoHk8Gp6agl4UVWG8NijT3Wsf2Riyw5U42
         rj/iLVf1fUC6w1hfONZdYqN4kVM4E597gFnwWUdAkROL7dBmlF8hRsSkHpTC71HF67Gh
         uDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776070091; x=1776674891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOH7c8WdaSQxakxnVC67pQDyVDyLKRgH4/csJfymxE0=;
        b=X0cPU+fkgSDvL4KdZ/qFPdR7KXOuybsczpXPzvlCDnO3bth+pD8WVE1A81m9CNKJ0D
         /V4h64kYR8ofITfzn8PRj+mTAf4HJWQZdV4Oda4GmqD9DTGH+YIQ0P3UoBwj97xWomtK
         pWzZZ5TE6QlPvM1JxyGuQdpu8Pykh1CT1QfXHB21Q3xsvgPt6nHemLoPGx8jTBdTwa7+
         1WZrjiDdiOBILrzmyaiVATCy5ld90FZrcyutbX+hkv0ll1B6ZjvtBhhnvm2fYqxVALRH
         AjtmRqMkgrwarXAj4Sznt8dJ3dxfYAh8i5MbW3vnI4Pp+eZvF5JiNmUgrdJWAys9wHkh
         zy9g==
X-Forwarded-Encrypted: i=1; AFNElJ9zjxA7rsAcJlmB8/j89L5dlASrc7495Z55GDzbyONx1LCHhng7W24K29A8OFNAgdrxD0ytmZfWTCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMTC/a82fWRbT7k3HSQQTRvvko+MgqJ4bqApZ2+vqBsUa+fUNE
	dsgjpcj9MLzDv41TNKCHD07PLWVSYG4fl+8ZQKuXRX4GehKbWvM6z09pbGHwR95xn3tiNd/uOad
	How1vjeqr4Ahg3NFFxKZfyzQKf5yeI/5YDMsPFOROuEYOm4dl1ASMpcWfIrCbpUHCulJnCKM=
X-Gm-Gg: AeBDiet3fYPd4vyfehOWidm3eTtkQxkYdGnlTD+MgCejbJlCtpAeLQBOHfVASb8xemv
	4sktgZcP3uFYa6Y4PWtAN0x+q+W1lIcheuXJ2LNVDfUWc87Wmn4d3WZ9SVqnq8Sv2L9dbCbdr5K
	EqA16zsmoGQwH7FpCT3wqgsIofFnKgkaSr0uEtI9KBkhuyLGDlus5+msKyU2IgulbuTsjFyE6RJ
	m3qvEZe9zULJG65TB6/bOCAqKDh2dXf6IWOuMxaWqeej5jDZCwgaNe7XFnRrU8pxDGB33Au1VL6
	udaylBUDuy1q0xSHTSwPxY+b/oWs9lO293OrEjqWUv4GmUEBV/XwY9zQOt7axeuws32c7a/qiyp
	Uk3woGI953R7moj+Cu2FtqGEtHlURWPJs6ILToCks22t9iqE4wwL+CquHG3I9eR6nRD2lPl9vAG
	mi/k8=
X-Received: by 2002:a05:622a:34f:b0:50d:aa1f:68be with SMTP id d75a77b69052e-50dd5bf0dabmr134540501cf.4.1776070090982;
        Mon, 13 Apr 2026 01:48:10 -0700 (PDT)
X-Received: by 2002:a05:622a:34f:b0:50d:aa1f:68be with SMTP id d75a77b69052e-50dd5bf0dabmr134540341cf.4.1776070090595;
        Mon, 13 Apr 2026 01:48:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670702eec4fsm2328099a12.6.2026.04.13.01.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:48:09 -0700 (PDT)
Message-ID: <4dafae66-1ef1-404c-854c-b72d3313f5af@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:48:07 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: clk-rpmh: Make all VRMs optional by
 default
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me>
 <20260412-clk-rpmh-vrm-opt-v1-2-37c890c420ff@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260412-clk-rpmh-vrm-opt-v1-2-37c890c420ff@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4NSBTYWx0ZWRfX5bp5Urv5I9Tw
 o+Ok320Hvetn6ECzwpqY4EI5W1tKzL/Hmu1r2A5GCIQNqhn4Xtl5Xqm2q2EOeDtg/dXHh+6N7kp
 DMeOn65N7tvCzrFgWPMw5e1E4WM4I3iCbWHc3I3tvUtIIREbM2HTLqlusNVaYMYU0Znk6xpNlva
 gQ2RLfbn5EIkoLJwLyl00XHVvobn9ReTH/0ufa2d2Brj6RDdAVYJDANJp/dwNUMCSM5r4lyK2iw
 BHDS8FTcVRX5pvp+S4JL9n2z+GjAW6LyI5PEh9aOS4MLXeMV64h5WM98hfnxg8Mu5UCCpx4uxoJ
 z2w2rlQrVsyrDCXqo20ByEEu6EiYGA/4ExEldpByRZO9iAf7SYnhK25aN1VKVTpud0Tcv+qnecn
 lvjAYvdItQDrQB1yJnp57VLqY0oMApp39JyB6FZo20ks3jpKI1fpET9xvM5tbjo+qf5tpZKnKci
 tPOgWjO3twJ90gwXhQQ==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69dcadcc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=U7PIyejKuas9lMDveZEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ZD626o4nYc7-3ADkb8vdfH_leXvzooDl
X-Proofpoint-ORIG-GUID: ZD626o4nYc7-3ADkb8vdfH_leXvzooDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130085

On 4/12/26 5:30 PM, Alexander Koskovich wrote:
> Some VRMs aren't present on all boards, so mark them as optional. This
> prevents probe failures on boards where not all VRMs are present.
> 
> This mirrors the downstream approach for this issue.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

[...]

> @@ -976,6 +982,11 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>  		rpmh_clk = to_clk_rpmh(hw_clks[i]);
>  		res_addr = cmd_db_read_addr(rpmh_clk->res_name);
>  		if (!res_addr) {
> +			hw_clks[i] = NULL;
> +
> +			if (rpmh_clk->optional)
> +				continue;

if (rpmh_clk->offset == CLK_RPMH_VRM_EN_OFFSET)?

That would let you drop the rest of the patch.

This also needs some additional background.. I would assume this comes from
a slightly different HW (PMIC) configuration

Could you please do `grep ^ /sys/kernel/debug/qcom_socinfo/*`, (perhaps
censoring your serial number)?

Konrad
