Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15243B71B4
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 14:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136826; cv=none; b=C6uXTkLCDPAWpWMNl2wznOC3FKl/UwpMxcOshja6Y6+GE/j2ZRY22MbbN0AGGV0WcS/RPJKWgFuY7mcO/JFmYO+wZgMfe+Z640jxHMFsP6VT7iklklnTk74DeMx9g5ZskRIRw1GAY9RSvzlt+8L9cYdND7J0nS12SatVHiNdXXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136826; c=relaxed/simple;
	bh=MdOeSIf8JKpQmOWa+YfZ6n0lbp36wLghMNUwe5mqJd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kso3F+TwmeFNe0FkV6Lju6SdGyzDSb/EupOONLycRZ79BEpM70Y2nkW3TMITxERLSBQvuA/6lFGsDEHzpaCsDUz93XumhjVtKr1RpQW8HFbzR80Zc4o4RhEETiWPdAX+V2FdNQWUiB97yWcerGy7EE1t1sRKiQqsjeoXF9d8vF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGKqufGd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a9CuYkb6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGKqufGd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a9CuYkb6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGCce2387025
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 14:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y7USYdDcnIwSaPcutTPXYOBMfqHeBI2HwN0WtO8AXvM=; b=RGKqufGdxxcuu7Hm
	RAhsMkSYb3YPfHltO0ZoQfW4IZ7ZBASt4jXjvQafCBSbpiVFzuv8kpziZDCqovT1
	wdE3UKVuHmD85EJcx8rEIhzkCegRLuilmiMWCyzIeTwWxIn94za3r8/Aa78rmhYQ
	XSbuvnJil9900aCytL9wCRsVndr+T+PH3qud0FD+otX3Wn9XGLj0mLsxgkJQ8je6
	DGYVxuZFBAOTo4ovcyMMBFI+QhAjnteUdwhlo6aPZzIHaK9ZXIiQVdHF9TG4JHQj
	M7noSqsIizD7Z0GwNEL6MgeaRkR9+UqgxW22qQATv6gqI/67xjbYXm6gwgg2ueit
	Opa27w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5sn04u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 14:00:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ddb0711609so25578646d6.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782136823; x=1782741623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y7USYdDcnIwSaPcutTPXYOBMfqHeBI2HwN0WtO8AXvM=;
        b=a9CuYkb6QTiEUj9qTKkEBhAjGzfqfXLhZSds3uxOPf3zo0cXam6gHsAFR/XKnMmMNs
         S9q1ZnpwPA+0BUdmI55dY8wjZIlinhtCnnK29D7BqoQao2FbN3IipKuflkIfN7BjVori
         JLqsJEUCcO5r1Knuv0gcY2onGxvyiKTq5mhIPu6iqIEcE6GI9CFx0/RcJ4Jnt3jYYA1w
         8YUd/ue7SAlyckh888E71edBQKUXtPkw87lVey6gyXp7vK0BTZ17pDRcMxbly6+JGVJ+
         zm4Y5uGAPMjwHkTSZBvRfM4tA3g2pxequpIqwID8jtZrP+axkazu6vXa//ZK2fJjFUjQ
         O4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782136823; x=1782741623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7USYdDcnIwSaPcutTPXYOBMfqHeBI2HwN0WtO8AXvM=;
        b=fEop7em2bTKQHtL6DGVXDVqX8eQ2ITL1CELr6Rr1T8m6F5SRNBazpjM0b5dzn2LQk9
         EBN+wjXh3JkKUhPJH60fGkaneL8Bm0Foc1rF0MHJovOUwPZQd3XEg+SJ1cS1VNyopxNu
         ZsT752KPljnJMnWcjki0mAIg0otDztRP8RufV9FcnnyS3hQNCEzTUoPLx/QltDzxGnRN
         Kw13VBkPNJ4IdpC2gQkD51ZN39pCcDh7DjiAwyXAOUkngwL+l7LeR7G71QCpA48PpROk
         hEPhjISQ+zOtOddrlxUumbxmdfLhh7sd5I0jONXNwI7KrdqU3+yDz1yOrIcTeRR7mkEl
         nosA==
X-Forwarded-Encrypted: i=1; AFNElJ+Gi3/H4GI40n+mab4ejgI0iFoe34PmQpcmhoLRLyzPuDVU7JUm2o0fDcs6M3jezIPLhjW++fqVwb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Q3wpbwPcd7CZ+pDIUiDcgQ6iQ6BnRIlhKbAhfIrXaL8CvJrr
	Bsl9A7t0WKgIpX/p5VmPZ7hqTyv2HE+CkSefp+gViva764HVsAF/4pVC1MXpdP/mRSwUE2U/SKk
	WEPHjWDZBOJPmUtsuBRhoXpYOdv3s+iwdVr7YWQpFWt0upwSHcExbi2EpijdhSxw=
X-Gm-Gg: AfdE7clVkiaxOO1GYj7gaqhuMeHaMt47DdsEo/J/y/4alw++lgrZcd0nvq1sI0jUSUv
	mVEs67D2q94F5gx+J+VrfgpJGikeal1yqxGW+iSOkS+JqWNkhUAxGJvYxV7Z22cwa/2Fl0V0dTA
	VNX7fkrDiRpvzU9PthlV8hc1vtK2jCJHqglLhJvbsid+JO71dcYPB437rs/3Gzr0184YwYGWZqE
	BKXPb/5tDeb4X92R7IE/9oWBcw5qU9yAJq+fCC/uRCIC7zpDRq7nn9Lhg/0NwZYtuvCH+vugDcK
	j4eshQBttAxezNITfL0V+5CVDdRe+qN9wXbLD/+6VrhtuMyzmxK2oMb7cXSYcLo52f0IQ7hNDFg
	u6+RcNzqRlPWsb9352PsAKVNWBeJdvNAm57U=
X-Received: by 2002:a05:620a:19a9:b0:8cf:d953:b4ec with SMTP id af79cd13be357-925c8fc4599mr53174285a.3.1782136822946;
        Mon, 22 Jun 2026 07:00:22 -0700 (PDT)
X-Received: by 2002:a05:620a:19a9:b0:8cf:d953:b4ec with SMTP id af79cd13be357-925c8fc4599mr53163685a.3.1782136822247;
        Mon, 22 Jun 2026 07:00:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e4a14d4sm368028166b.7.2026.06.22.07.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 07:00:21 -0700 (PDT)
Message-ID: <62cfb2ec-f069-4012-88a1-8667d3f3e5e9@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 16:00:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: gcc-hawi: Add support for global clock
 controller on Maili
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
 <20260618-maili_initial_clock-v1-4-d6ede0352113@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260618-maili_initial_clock-v1-4-d6ede0352113@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3RpD7MZeDADD4dOekfdLqANz4a1lAIRZ
X-Proofpoint-ORIG-GUID: 3RpD7MZeDADD4dOekfdLqANz4a1lAIRZ
X-Authority-Analysis: v=2.4 cv=PuKjqQM3 c=1 sm=1 tr=0 ts=6a393ff8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=uYmEc_XH6j7-nL-_3AgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzOSBTYWx0ZWRfX5EagdNkSlUKV
 VOqnFXVntCettNJ4CrFaTZuPvldGrYG9V9iwq6/fZRsxEr9tRehHVVS2OJ18I/e6YSFxnTWVerf
 H8IHx420MvlxRbvNx5C2viFal2FBA0E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzOSBTYWx0ZWRfX3W8kvHmKpyUR
 1x9/Pp9okpUzSATmpH3r0Qoi7Nr1QJ5l+bLF+eWbx/NAtvUMgicCgSvYcwBtzLLJ1ZPY42PPO7q
 Z4zmTxMYyMRwxNN6QqgcN+GslaXL/YziTABTJ5kwbsRWM+Q5HiemoIIwK4XUMx5OqxJrBi34dj5
 goCV0UfZhmuyw6TY0n1mUp7Cx96eS8/RhttHDa9vTw6qS3r4Jt7IoSiQboCky5ecWYLfdtUirZ6
 j6sQmlXku3gMJx2rEplHEcBartonZBYcWp65c0wqBu3T6IIsD4KieYK1wnKohv4B6xP3318kXDI
 vxAbysxHLGeH9/ueBZSJXKeysnVOFzRGpEEqJjvo1eSPntmaoVA6hjpEb9L7Twc7XvtNFLk7ejb
 zrjUcqOZmZDlp2KLAHk2AMeWOZt3CX+hY5Gpw0h1asj546yQ8QUxkugRama46C/9JBInEoZ/c9D
 0dnyyn88cNIstC5szgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220139

On 6/18/26 7:21 PM, Taniya Das wrote:
> Add support for the global clock controller (GCC) on the Qualcomm Maili
> SoC by extending the Hawi global clock controller since Maili is identical
> to Hawi and has few additional clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> @@ -3485,6 +3617,11 @@ static struct clk_regmap *gcc_hawi_clocks[] = {
>  	[GCC_USB3_PRIM_PHY_PIPE_CLK_SRC] = &gcc_usb3_prim_phy_pipe_clk_src.clkr,
>  	[GCC_VIDEO_AXI0_CLK] = &gcc_video_axi0_clk.clkr,
>  	[GCC_VIDEO_AXI0C_CLK] = &gcc_video_axi0c_clk.clkr,
> +	/*
> +	 * Maili-only clocks: NULL here to size the array to the highest Maili
> +	 * clock index.
> +	 */
> +	[GCC_QUPV3_WRAP_5_S_AHB_CLK] = NULL,

we have:

--- common.c
qcom_cc_really_probe():

...
cc->rclks = rclks; // desc->clks
cc->num_rclks = num_clks; // desc->num_clks
...

 -> devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);

and qcom_cc_clk_hw_get() has:

if (idx >= cc->num_rclks) {
	pr_err("%s: invalid index %u\n", __func__, idx);
	return ERR_PTR(-EINVAL);
}

so I think this should be unnecessary

Besides, is that new set of clocks actually unique to Maili, or
is it bound to a QSPI usecase on the specific QUP?

Konrad

