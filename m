Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920693E9F8E
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 07:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322606; cv=none; b=GOQMVZcL7ZLUnA74M6sHz3hNzdOX+hCXj2I6dxZtKO/vmDAWuDwa8pEJd6Ur8ZwZEJ5f34xE4rQXF0G61jrQFnHjk+7iJooBzxxFzqzAXtIJK5h4XkXWBXscsC0x7mAgun9ZjRQ+2MjI2ZOTUZh6/mUjzkbaf7gZKeed3hXIoKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322606; c=relaxed/simple;
	bh=cys8Q5SmvauIpgYMBctOa2YAbBaoLLimQhj9LG+4xwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nqIBHefQhEJesPks/idu/jwLfQHIce/HP2KgX+8hl3rIPoA61Pi+O2i18YCL4JY2K2AxYMmhB9VYW5TWOyH00oUNZNx9X4/gFNFXq59oyKjELBMb7RSOLhe1yuvPM8p3sp7QvdJqv4JKHMd2qCSaFK5SwpCGJtQbWCUimjDFl4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSrvGniE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dyszFFNT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSrvGniE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dyszFFNT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641TVD3623842
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 07:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0uTFHwmHTm+HZ5aosE4bWPbYsQ5oqAsS84u+0360UFg=; b=TSrvGniEG8EBAN8P
	jFST7SJ3OTGVX/Ztc/HuZha0n52tEUTvKD7LcbI61aMRxwew17i4vVklPuyVUyWB
	0/vz0w1hmY5YNrqpDQaOZSwO2ph37d2N/TiMKs+//8ffGQTwRfGl5TMUmJONM2ic
	Xpun0/hz2aeU2AeCwed7ABxmRfRuc4+Kd8bfvO4kgOR4JL3Nn09h/6nqg1giOD5z
	tHP7X8fAqN8J+/R4+3fj2dukSlEz1nczdoaPWVxDBsO+sLuOvCzIyarbFuTJXFpJ
	Pe4T4q3K6y2+AAQr4hK9LRbIU4FLsikqmuAQ0pgAtQtTUWCKVy8QmU1ltQuATv4U
	mg+btg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4sw51u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 07:23:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97955899so3727399a91.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 00:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783322591; x=1783927391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0uTFHwmHTm+HZ5aosE4bWPbYsQ5oqAsS84u+0360UFg=;
        b=dyszFFNT4zNoV4vesUcwb8CRH/jtTpRN9kqF7ypIgE3BBSRy6n+/Urq0bNBzMP17E+
         u8fW5MgYsNIiX3ebNJBryU2SmPvj3whrAc4d2HbZtaBnkK9CHbHcd1q8yCTGJNixa1uR
         3XgYcUiDOTK8VJA1CbqPk9wgr90l2NzgzU1COuvs6b85tAwPwhj8becU1LJoqApCduMB
         iJSZ2pi3m35vYxo45u6PnAz7eOvyQEbeGWk5P9Xn9WN2dHhPtxfyip0rxDm1FCYEOKRr
         3slWUDDWYa7Nsjxi9gsZHLxTHmGbPeBTmc5at2iGDn87DTsyQ2lHUtV4+SpX4SlWv+eo
         V2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322591; x=1783927391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uTFHwmHTm+HZ5aosE4bWPbYsQ5oqAsS84u+0360UFg=;
        b=Ixu7eNghmISHOjjQdXf3YX47+C/6Kc1FVEPV0V12gQudfp6vCiRCc8x496yVv6c8+f
         sInUVhd0Vb88fhNsR5uHlXrTHrKFsMMWTcOB+b/LNcunU7o65AtxeHle4wlhG3z1QnVy
         nOWjN/w0fRMuoROVM9aEpfQN8O/rcVWuboaFVf/BQz54LnEZbMhRS4KI8QbfecZDcm+w
         N3CDOFNq6Um2V6KnKP2Hosj3qX425lDkl51CEb6GrcFcX3xVNbtSY4ikLb8Lx86fhodn
         gf+Xd8NzoRrfUsI/ngQL6r+Ew1Dseo1yOp85TRvjV/T1mGac/H+68Z7ycoeJ2NGDOjuU
         I8ag==
X-Forwarded-Encrypted: i=1; AHgh+RpRXeaQBYyegmVsIuwCTTNfgUNp3U20bUlfPe1DopIGpxLhuz7m6RwEBXbHFRiM0R1QHj3YYuE4c9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjkzccU7LU3xwmgnjXuxKKdctqQZDIe5530bNbI2oWnYOhVATg
	ul0ZTCi+0vlXMOoXxp1HevEyzNAI0IdWfmQOTcUuvHSZD3dPzU9rhHhbm90lUxDp+qfgS+dn3vJ
	hdpfTl+zeVxxUDPQmCiRbUyoCnmqwBT0+kaTD90FRUHV0SsTluGzw0Xd2n5WkFiw=
X-Gm-Gg: AfdE7cndVL2RMf5R6+4dzOR8lKZGK1e6bBOP5z/0sh+Uc39zbxEdiJvkDT2opAOi/Pp
	HVk3D63DFTPmR56gRLDM1qtB9YU7k+1lNvtAVx0dezttV2g0S/dRsi3RSkPbwyGuPpZsVGsl5Z0
	NfGh0dMmQYdGehTl8wHyMX3PhXqEppgOeqS9x4dDcaAuECiV4u7sBB/3JZbEyQHybwN3tZPsP2s
	x5XkuFMgz7KDxuwGD091w9fX3XuHIdylRisoj7U6+N3Gs/Qw1A+7hsbm7CaO4e/TcLE09BpikT7
	okt4klBUnEwd082m3wTubZQJaWtidMMp3wYx2701DFw1joZMyQWdMy3kciSFRKpjUU7ylFn2EQJ
	iezbci+/9/oupuRsyBxGzb6pg8cXTfRRn2dytenQ=
X-Received: by 2002:a17:90b:3b8a:b0:380:9d0d:7ade with SMTP id 98e67ed59e1d1-3825c50c9cbmr9403086a91.0.1783322590917;
        Mon, 06 Jul 2026 00:23:10 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8a:b0:380:9d0d:7ade with SMTP id 98e67ed59e1d1-3825c50c9cbmr9403055a91.0.1783322590481;
        Mon, 06 Jul 2026 00:23:10 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3835bd053d1sm2075944a91.2.2026.07.06.00.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:23:10 -0700 (PDT)
Message-ID: <e7e3af50-a11e-4c18-8bea-07d059fb8c4b@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:53:05 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: videocc-x1p42100: Constify
 qcom_cc_driver_data and list of critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260705171811.115542-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260705171811.115542-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MiBTYWx0ZWRfX+QtwlFrugxN5
 1Opz1C7WMUD7n3asthf+avrYIw8cz7FBQzm0+z/DquQ9cfq34wXmzJ9ho1CdkjAydb3tka8rxoa
 pwuJ2jbkJBQr5/U1ZkqOjAUxxH7KKVU=
X-Proofpoint-ORIG-GUID: bzDZYdMa39eveBM593MQs2lZgNJxoHD3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MiBTYWx0ZWRfX7tXMwfZ3WNGf
 uEQkAemc4Y7XFoe6HGc1MzXlRqMaQjiSbzNPopyRqvjU9wVvBPyGS2UxovKsRLNWNjxLfH8vKvl
 43jIbATns371JE76ovmWULJlC1QtAZCF+pWvJ2V4fCpzLahPcmW9k2SLu9D8XA3gaK04tsoKP21
 yfAgiWLUJDSkwWIeJpfUvZo9tUkMeUWBBTVTmrhCDXM4criwFr8AAGKZ6J9sCV6psJkH2U1M1p6
 Yz7SCUTqEKBf26j4nf5fzGIaoAJ5vOMJLgZAjgSeLsBtTUU34/y1BVEye4D9ljMIbXP1sTWZaPu
 NH/ba2SXJUF8gerq6+gq0aS85ZwXTnH5+OiZJqroK5KmMeW323q9m7n5Rcxwh5Od4RY8yGgpkeg
 Hmsu2o0yt965zUVpXvmNB57R8gs0/JXOYZ7+9Gm88YP07u8bf7ZwrLL+nDZoapfBOCAO0kAspEH
 sCsIgBqy37nEzgORHjQ==
X-Proofpoint-GUID: bzDZYdMa39eveBM593MQs2lZgNJxoHD3
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b57df cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_aGr2jj6gUJWDCgJmWoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060072



On 7/5/2026 10:48 PM, Krzysztof Kozlowski wrote:
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/videocc-x1p42100.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

