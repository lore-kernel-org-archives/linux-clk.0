Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD0D35C696
	for <linux-clk@vger.kernel.org>; Sat,  1 Aug 2026 14:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785595098; cv=none; b=AGokg2YcRhrX8MTLamvGRhZOV+fNq/tmz7hatQP5Vg8FEamMoCf2m69zgiY/yE0gWjOKvX9a/6cyeY9kKiTxjc8dMyZSUGcMOltrF8ekNNaTIlaV4ak//+LgYb+MBBpRdTZFZbij79TSlPSJmWawdDZJBdZiEqRVTgoN6+15WKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785595098; c=relaxed/simple;
	bh=aR7wlk14jKGCr7YnqLo4Si2gDKNBUMLdz85XYfNC5gI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUGwmUCvhNWP3Blf/pNvgxRdC5ZYb5yiMqeQ8vowT52yc5Qh/QZLJdy2IQpiHLV7Yy43J9Tx4nRXG7Hd2oxN9l0pUyGhX8s8vJGqHWNNu/K7xh1hDLiZl9d8F9zV5LBhixmQiLk4+RT3Yh7VoEz9o7M0ueqqulZsubODgiJe5/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hK8LDr+S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDioyBnd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hK8LDr+S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDioyBnd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Cad9M3239448
	for <linux-clk@vger.kernel.org>; Sat, 1 Aug 2026 14:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q/L4uhhrLRFVggnOJ2orfdgP8HbdbkXZiarCIpcSztA=; b=hK8LDr+SRkOhbSW7
	vSDoG7P9N2lD6sIrNQn9A9cEX/1dybe6Ci7eRTBQs6zveNYwMVGvMv/RHidjs65I
	8mWaUTN5zNj0aqYuTH6JXACN0VsW8AQLOrskp2HLXO/vSQD/BXfD6ShGKSyAVmwp
	2rDfpM2tAXKkVvsVxthmHAHcK7/w5FMeytaPgp5OSGuUzBdAELhXDd1xourWYyrQ
	N5nUmrQKl4gOOr6U2QrV1KnMHB6Vp2PDbt3AsUQSongAXYjP7Y1irE/OoIr5t/1p
	jb80V7LDgE1/c9maTTo11kBb3R/iSSm3NvSnb9EFxP7HiR9tVgDPvDj/YHr29RjD
	ckB6UQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q5147t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 14:38:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3811279d51aso3603987a91.1
        for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785595091; x=1786199891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/L4uhhrLRFVggnOJ2orfdgP8HbdbkXZiarCIpcSztA=;
        b=EDioyBnd6dIHNwEFvYlkKH3BcSpOiTwIhm52Wf7wgrGxVvna931+oLoLAmi4PTEt3t
         Gh5huTE2kP6NcMGDsNIl9VpOdLMnA0DRpxo00DEaqTGGU/3y1/Q0YZMPaKwIaaOpnrNN
         IcBalk8Qd516Wu4XAuKoCvrQGZhqe05v5bWOPnSi0aVaYYLo+jveQuTeennJIYpHUBKb
         NOo6Ll2cMaz+YCeMr6dDeqv4cFBiHbxE/mRQlk1uv7UVdsKJWr6B+zi9rmzGSNhOJgbE
         2qE+aiOL+yxyZDRoPuvKWT/ZN+QaesUZDSjEDfLxQNP2LgDDbfNRQu0QnKDe9VLBEKGb
         SCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785595091; x=1786199891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/L4uhhrLRFVggnOJ2orfdgP8HbdbkXZiarCIpcSztA=;
        b=iB3G6SWPl2095Ww7hnXmYES7UOn4Xufs2AZTxsU9OCCA/zZtt3/yxcWh0yErhHfUwz
         W9RL4DJC9F08ID5Au+QEIpsIUMenAqnsjczfoY/+BC98YIjO75Xf88lzwv3UZ2TMJs22
         vvbMhISdzLp+FbEpWbmLl/KHHPeCdXGOYFl+s38n+Mo4wOu7a5HagAxx65QAardcxtGS
         f7JR4N48yMUMnHnV5qULjnWl1DSurvLZ1jKIXySBBAZdUSuxsWpL0TN+GZApCByY90qr
         JBz+UBgZ67WSgyoPeLAbHEq5e8sgftGnHpdZSkp6MFAjvB73QZooZyGASitHWfNXCdeP
         dsmg==
X-Forwarded-Encrypted: i=1; AHgh+RoMp/eMyHG4byZT8PnD69/r4TnW+eI9TtMyeSX/QpPLhXjsxKtidtnEyK6sHStT2jwMjuG3EdgKRN0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbi1+uF86WGG2SifTHSPbcpkT593XGw3JLjeipImlS2Zis1WOq
	oeiSwF7PjNkbdAbNjakUXTs6vmXo4Z+99iJOyjD4uy+AJUylRcQPC/3wIRcQ2qP3g+dmT+cj0dX
	9LKUWOPDv8rUuU9l1NPchVZmgXvDKbgSfNVO3wl2GF2f6Ka/sPYg/+qBLpQc12v8=
X-Gm-Gg: AR+sD134FN70ujqK+aQVpGPGzhnimp+ZZYz7R0rXyWz4uPl5CKllWxCDrNelsxwOEhm
	VfaqZ/uzVH26flwx0UGTAZzTj3Yit0FgCZo0CAKYj2DjYxM4Gd2aA5AdjAdYryp8jn7ZjvPWtqC
	dYq2h1RBV68S4NtyoULoeMDxAmiyuri5CZH+UZzd8eD3WBUKGjp0vX8mfNoxdX8EHYyH69pOeHN
	Cflv9jRPFJbRMvSFa4R+5oRWhCyG3mP0a2DC5onwFhB5G1UooXTxpyorN6wT6E4gUGPFjwb5BBZ
	dlF2ZIIGlN4EB8wgkf+sRrPlghVGtxpvCDiv77KJQkK/k9KdRwdYtqkRXdUe7T5hTeoNWYx9hxk
	VhJoGGQOu+tbMKFcan4ghH6gy+0Iz
X-Received: by 2002:a17:90b:524b:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-38fbc3e7da9mr3201964a91.1.1785595091059;
        Sat, 01 Aug 2026 07:38:11 -0700 (PDT)
X-Received: by 2002:a17:90b:524b:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-38fbc3e7da9mr3201939a91.1.1785595090607;
        Sat, 01 Aug 2026 07:38:10 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.28.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4f197sm18557144eec.6.2026.08.01.07.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 07:38:10 -0700 (PDT)
Message-ID: <3391eff7-9b68-445e-93df-b18906ac1619@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 20:08:02 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix camera rivian PLL configuration settings
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDExNyBTYWx0ZWRfX7cMLooMVjG3m
 +ZqRagozRpWRUTyiJS0Rbdwrj2trAJ0Jk2KytE7YnBI9aGOOe6+i+u6IjTQ3PuJUm24KH+0ltXH
 siZnErA4s/SBy6jYMnz+qNVpxpgz9D4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDExNyBTYWx0ZWRfX/j3EhA7VdFXy
 Jz1InpPKeXHVuewSTMW2och0rz8airOVQ/XSm4DHn1NLSvpgxviNbE9/pIvznJY/vTn+4cau0fj
 n0F3uAx1mSxKfSmRWu8GVmh8tAbxHAKi6RnTW5EF1d0/IYCrhNoAPx3ZYI+VDU7rn4xBGHPXnd5
 PBwKwQjIEaIFDmEUBG5ilsJh0bcCdgzSs2mXKEAiK34Fm2zDbhwnWZS4I0N/99VNjcY7YBmQlA4
 qyqxJe8B/AuFK66YC536KRXBZsKsw6Bnn1mETmFvoG7xk51KBbbZ10RXjbNbzZVaKEZKxjvz1/w
 NZZPVQiNJF/VmYQI/3uFwkGpXkgTw88j3u9r9rLzCJYVVZ3XyCqMPKgrDa4x1cllpUjf0ZM8OcC
 UE2bwL9kPGk19/d8UY9EX418opUS2PAaOxJcvsKSdnZG0gAQC0ijarLBNlFU6V/5L/ME39sJ2iP
 sNII3rDVPGTehhwmhCg==
X-Proofpoint-GUID: oSJL9jV8WqC9rOICkazOVngAL9l-PXTa
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6e04d4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=+2nu5FKjU1rLS1pfaWnYQA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ETOcCGdCUUXvB5ZO3A4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: oSJL9jV8WqC9rOICkazOVngAL9l-PXTa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010117



On 8/1/2026 1:15 AM, Jagadeesh Kona wrote:
> clk_alpha_pll_write_config() in the PLL configure function skips writes
> to PLL registers when the configured value is 0. However, hardware
> requires USER_CTL_U and CONFIG_CTL_U2 to be explicitly programmed to 0
> for a few rivian PLLs.
> 
> Add a clk_regs_configure() callback to ensure these rivian PLL registers
> are correctly initialized on Glymur, SM8750, and Kaanapali platforms.
> 
> Fixes: 97255eedd690 ("clk: qcom: camcc-glymur: Add camera clock controller driver")
> Fixes: f9580bafd39c ("clk: qcom: camcc: Add camera clock controller driver for SM8750 SoC")
> Fixes: 92aae35f667c ("clk: qcom: camcc: Add support for camera clock controller for Kaanapali")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/cambistmclkcc-kaanapali.c | 7 +++++++
>  drivers/clk/qcom/cambistmclkcc-sm8750.c    | 7 +++++++
>  drivers/clk/qcom/camcc-glymur.c            | 7 +++++++
>  3 files changed, 21 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

