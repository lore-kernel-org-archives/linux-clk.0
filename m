Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5274B4FD7AA
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 17:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961747; cv=none; b=XeHGlTEllbSdJ7YiS8b02v0kM2jYjNzhHoDjIhYkIRuFtIfUcjaCUkTAugFVqdpkAty3vEoaz71No9MDBLs+ZmUdKKbdBmkmHXkiulnODwejBa0a1JRZuwdvzgWQ2K078V6JJlXgmYlU2WhDDv9PbMmLJnPvKHd390QY7iHoezU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961747; c=relaxed/simple;
	bh=wfkQTCtihLuQmkMLSwbhTu0nmBiQEOBAVacLI6it58U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mCltoGo+OdgKDOGg6Ba+AGnSKgYYIdb9slNDmiXp2Xisn/HLfsvWjWrdex6wstNc5tqoxbprz3e91jm8ZuTv2Txqdj9J4ZbMHcrfAvtYJkNdLcfckfcAeG4W3vpXoZvKTAEqvOstgNoo/FT8m/TKn4+hUOiVp9VXY/fDpuaEMqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4b6DvWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxquiZya; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4b6DvWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxquiZya"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H65pg2115262
	for <linux-clk@vger.kernel.org>; Fri, 2 Oct 2026 17:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tR5tyXwtqll8A7xHJC6SBeUbgFbK2QmhJ4Eo1XroUTY=; b=f4b6DvWMKkZ4SuUv
	SMc4ECK+16+u/XjEnUJDUXU+RI6+O5P66DCqWtdKyizQolxNe3p2Mwck6Wa8oaD4
	wjPrFHKxekDCVFLvUR+cPZQ4MuUVYVxQdmhivEcKAdEFbdoVkQfk8IP54PHrbrfb
	kLZ2gCEFqeVdyyyVanpwKo0k1SSsDj3FD4robtkr1ahtQiimE+nwOxNU0zHmHMWo
	vS6wb3pslb0tUU0UTYd1XCgMd/U7jXFFNT/N0DGbrOsU+XZ1lEp9zxQbB/3HI8Rj
	ji7jgi9eJcxAemgb5C5ur3eIUgt1EAAoG9ASxaZ64nITp7dCN+J23IYuleYZwOEA
	iNxwIQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tmafv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 17:22:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deda201bcso192330a91.2
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 10:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790961736; x=1791566536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tR5tyXwtqll8A7xHJC6SBeUbgFbK2QmhJ4Eo1XroUTY=;
        b=JxquiZyaLYW9rEi2BLzsb9xykanhQc9wqF1DtFB1YKeNcdh85W999oi0wS43RhXPZ2
         IwBcdZRvuFWA7oTyRcNQ5GCaRVNAVDE0gOl+XeXyuqx/CclivNis3HyQwAuvvAKM7guE
         uTFZPkDEfqPGn+hIgVJX1vEp5SoYHVCVKd35CjxUwj9SPS9ayMZtXA2h/0GSr0AYGFpL
         rUsTdrvX6Qz6JxaeQQNJnZJchmnJPzh4SX4GAj5qYQXBAKdXue3uPmL7e2R4krp2Cfl6
         0n4wgTqcMuzSfqsjj+omFsiqp+PSmz8ba1O3NxKkO8tbJLcbSGhJgbbfQ5fsm7lOIK5a
         Wlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961736; x=1791566536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tR5tyXwtqll8A7xHJC6SBeUbgFbK2QmhJ4Eo1XroUTY=;
        b=FITf5jePEglBriTCLAsiU47CB3UiHz/5CcP/IBYRDy/imzFJiCY66xhj0+OJlI/Vcx
         Zi62KpVzTTsbFNs3rFvG0RkmseNUGszeqGZdmT5tme17K1weg80yVUsbz9BD3TAyOWlE
         cZhfygwx2QhfcvSafSSJ7DJJIst5Gpy/ThRyyrixRldvLXiDKibNIb4UOxy11IzsLN2a
         /lFxgD8mA739RR/CyGCaQosJhSbKeLcQNIS8T0z1YasjdYk2EUTwzND76KQRfs2i6WAi
         d/lbiGViB3slxMFNSI++wzNH7hRmI78bnLxBPIGKikSZNliUchqJKgPwY5/mYJuV3hZW
         zPGA==
X-Forwarded-Encrypted: i=1; AKwUvBzk/on4uZh9bdx5z33AY9npce05FLzUcC0RgCblgiAPXhtIYGUtzp/Wl8UID2GQtJRqhhrq6ThYoI8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu+vP4wV3GSWCdWVF0AskJyqllrstOhaMqI6jv5jhvnRsiCnAh
	QoGybA8OL0u+/JC8OFDAYW46J/F1AH2EguRyEWgkEYH8XDXQJH7fMxqMA8csgzmllzdImzN5jGw
	G3z4m9peASl5Q0xh5Kc5UyUP28SAq8tk7md9T4P7imjvcbhJ3f+A3Dg72G9h/8qY=
X-Gm-Gg: AYBFou0/5V2TDv7586PG9AgURi0zRzy2k3DRcHon4Olyr7bQdg79JTf2d4QD6wGveFV
	ijPA/GVTeQLA8ohtvNE3EKnDQSsiZHYgkyZfp/YW4LU7J6J2a2HVvvWM8pCU0l4tOjE3lkevEIm
	aCgBA4zI8W4eRvBiN96vYmzGR4PFJe5mOJ251kO+k2Cwq2mgrVzSByo6fnZr+GkiTDhnXGE6UxL
	wj0camAImj4tpIih5dQWr9A0c6brXouzEFr8Knhp58J2A/UC07CzZRfxFCDFz6Q4LxipzYKCyZK
	F0nLrrafXG3NHAptn2d1y+wUrWGD1FkkNydyr/timaizdf5hA3EWW9oUT8GTYCTU5HDq02vqAUB
	reU3LKU3JhylzMMLL7z8bMQMXxYrl
X-Received: by 2002:a17:90b:4a4a:b0:3a6:f90b:20cd with SMTP id 98e67ed59e1d1-3a6f90b2630mr1609527a91.6.1790961736187;
        Fri, 02 Oct 2026 10:22:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4a:b0:3a6:f90b:20cd with SMTP id 98e67ed59e1d1-3a6f90b2630mr1609499a91.6.1790961735611;
        Fri, 02 Oct 2026 10:22:15 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.196.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm10811502a91.2.2026.10.02.10.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 10:22:15 -0700 (PDT)
Message-ID: <3acac1a0-a64d-4549-946d-874df45c3dac@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 22:52:08 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: Add lpass audio clock controller driver
 for Glymur
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hsbHDHo0ZzH0hsPWdYQHNicEFRY95JyA
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abfe848 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=3s5aCXBOHJDmPDD1+4kJVA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6XYEiC8ceDmu1LDSX3kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2OSBTYWx0ZWRfX6KdufjerK87+
 9GhAL7AyV49r9KHMAJe3vmDoSvT5czzuR74Jm/lMJTpYcSd7s7/jNzR5RPqQbYbrf/NjI1uigjV
 MUdhk3Q4zEPc5JRg/LJlr012v6+hWsmAAymby9truMgJilWROCKUIIoV4t/u4bFHkEZLlKoj5pC
 mF5K9Fzta7s8A0/lzdcQcXAhMbBI3Tsk6JK3y7PzjELvGcV7jU+kaVdPPn0zXM19MEgcNJ4ZJ4g
 P6jDCmwz6FcYtai0bRaSsE0bIAnh9YVdxG8McgNo38R73Fx9rVajHPokpGfuxYb7jPYwFVrsnkR
 PCbJAYpJ/t5qE0wJL9nWHPcPNeqtIcRwLXOWxRSglGcis9jjm6Pn+f7BRSirLhrGW/gD1h9EJuG
 EhgT+qRt3oMpOU+bZ6a4Wzyt/C6tO3unz7LEwjtfB1ohbWu12L//IZc/muwmCLxGIOMstHPey/R
 xGkGjePg+elkxBizPCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2OSBTYWx0ZWRfX/7xtTx3g4kNd
 3WYTkX//mmV55PJkD65ccn14mKA0INjg684ljOn3/exSR8Zta4Po0jcAhSfV6Xjnr5gFHtwEtJA
 6BEeMXG0/UiMyPTwllbvdR0wKkTcO9U=
X-Proofpoint-ORIG-GUID: hsbHDHo0ZzH0hsPWdYQHNicEFRY95JyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020069



On 9/25/2026 2:16 PM, Srinivas Kandagatla wrote:
> Add support for the lpass audio clock controller found on Glymur based
> devices. This would allow lpass peripheral loader drivers to control the
> clocks and bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig          | 11 +++++
>  drivers/clk/qcom/Makefile         |  1 +
>  drivers/clk/qcom/lpasscc-glymur.c | 68 +++++++++++++++++++++++++++++++
>  3 files changed, 80 insertions(+)
>  create mode 100644 drivers/clk/qcom/lpasscc-glymur.c

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>


-- 
Thanks,
Taniya Das

