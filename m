Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E5027A911
	for <linux-clk@vger.kernel.org>; Mon, 28 Apr 2025 17:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861996; cv=none; b=sjze/ijkw85z9biXt3Vus7kWUyrUjzH8dzFrNmJs6jRtXLbkH5mmtbrV78sK1nsnnrdvG83gWDgtvlqsqwh7aaT/O0oCdO9A7nP5A8yUZLRLZj5fS+uNJcp+MCxHi4WNbgDNO4orOzMqSyOW80NDzH55teN28WKOvvZhzMBbv1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861996; c=relaxed/simple;
	bh=TNNGtQDx5v0lSUvL5LAXsIqIpx1Alm5Z/0INHcrVzTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MnKkjdakyxKwCfiHorPvmntP4H6DDhCGV5g8AmYuMkTErhYwxC/n8IU38XGu/Fn16gvHC0RQ5uDt0jgWxt4nuapKPw3p9Vk9doWmcQW/fBuM8B3ZlLZ88VTNAWMfcrgAwHApECftgYXM0zvnNxzzV5tu76h8JOWY/qFTfCoFdy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHKNClpS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHKNClpS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SEmLx3009824
	for <linux-clk@vger.kernel.org>; Mon, 28 Apr 2025 17:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJa9nriNSbV6GulDGWzrZjMucxKix0H2ciE1PDj/NiQ=; b=cHKNClpS6Ur/1x8j
	SxGyGtbu9piRQ25uf99Ue9UOPE6mEV/rdqICRYdIu7R2GkT9SfNWmAr7jkbmLCfj
	ITwYcD64PG0WHVlfWeggx0Ow1UcpVIQ8WIP/FdzPg5xXwi0JtH+7ZMRxC48148fd
	ZNPkm5NK6CjA6+OhDNfqz7Sjm1EtIKaVso+CmK3dZ8by3nqAb37DTMFWExQBrt0s
	wv2syQsnsxcPc1ek/J3O0Ki3w9LCUWBQV6Drnck9OjnS/281fFe4Lm6CHo1aUuyD
	TN4PCo5wkdulhQt+AEZGCjY+NX7lyq3OIIr2b6fwts5OSDQTmhTLBdLu79VCH9rG
	n8+Kyw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jh72b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 28 Apr 2025 17:39:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-227ea16b03dso75557715ad.3
        for <linux-clk@vger.kernel.org>; Mon, 28 Apr 2025 10:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745861993; x=1746466793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kJa9nriNSbV6GulDGWzrZjMucxKix0H2ciE1PDj/NiQ=;
        b=dZShULAc7mZWWoE7VcdsCLgjzukvVutNNPdbBsaRLBHoHaXCgWaCLUb6CQwJbEVOhr
         edQIMw/QTFNbYx0XorfvuVpC5UQLzPbeZG3hUm19sKmrOO3EWAXGubYbyVg7VVH4Yl4o
         aSarTwEXpbG0VD7vPSBU2P80WJy+O/QJatwj3bbOkoTLT4KnUnIPcMNVvNJV8PvpXZwZ
         pEssIBTUJIjSwx025K+8oqqReHAB8DiX4CZeVaUKMHi5jq84fPBGRkdnFoSyJcjgwnF5
         raD5aj4M2RHwTbMGRKyB8fmAOX+tKSen6Z3Y0DFtFv85bb0bHhxOEoBm1ADaiKxGF3Rp
         CF5A==
X-Forwarded-Encrypted: i=1; AJvYcCX9diXx5vmUXP+BosZGiGT0KD/REQQiZQQW2+YIi5dtqceNQXgCIQ160J11WVDynzlG+jc72GkytxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHuHDICNGipr5zSj89eKNuju+1tuR8wU3Cvfwp/o9bnra07HB4
	6UnLhZVJUJzIKw5iZytMWov625K7qyAPGRf71e0W0c/M6QplAlr0BU84xajasY9N9moelDH66zk
	eHUfxCGY4XoPFKBIp/vTo9qwiXys9fAcHcdUNFgmC+Fl3K2RpyqtKKq2198Q=
X-Gm-Gg: ASbGncs9dNdDBQNU3he8vYdJCmAByQF1H/mkCoUVgudHmv4YSl42fGcs9vxHlKGFmne
	eLbyXEbJcWFu3oq09Tq1wlN6Sjg7rgxbEldbwzFn00b1Gh0JJTsc8Y3LFtWXQGXBRfl8TctX6m0
	uUJcBJC1ibC3KOS2CoAKsQUwzqieJymh3CdGjqanQtcyAx2UxHf3Xt4zsKZ6qdMqDGcL+u9rBpd
	wImD/gBqRbZp7nJVLEcKL0eow8aket4PZJGR5mHizioTkjqFuv0424s9YGoloZC6XX7c2yVVtsW
	45WB++puJEFgdcY7b+0qX/NKNTGUOrvKGtSlox2K
X-Received: by 2002:a17:903:2ac6:b0:223:f408:c3e2 with SMTP id d9443c01a7336-22dc6a044bbmr161718945ad.14.1745861993039;
        Mon, 28 Apr 2025 10:39:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvlskYHOZiBCeXgC0mTr4QOcNigVP0wPNkkgoEFVQfOBxIYYrNWAPwXjaX7+uhjv0Xwvq9gA==
X-Received: by 2002:a17:903:2ac6:b0:223:f408:c3e2 with SMTP id d9443c01a7336-22dc6a044bbmr161718575ad.14.1745861992644;
        Mon, 28 Apr 2025 10:39:52 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.26.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221c60sm85923865ad.228.2025.04.28.10.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 10:39:52 -0700 (PDT)
Message-ID: <aab5926f-6ae4-48da-a15e-0895cb1bd987@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:09:47 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: gcc-sm6350: Add *_wait_val values for
 GDSCs
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
 <20250425-sm6350-gdsc-val-v1-3-1f252d9c5e4e@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-3-1f252d9c5e4e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0MiBTYWx0ZWRfX1jSWt04kPN7p eqAzgNy2w/p2ufkHLBFDHSLDDaREfdiElY44rYXtu4quoRsK9zh8oFjcRg+KmfmEw/J27+p5SQI k/eWYwEtg+aTO4oa35e+hHaQrZK14IQ26qQisD+3fuHwYUAtFPc7pJCOs00qzLFp4ICaR0MHqUw
 0dtCj/KhgBvc+vhgH96b12mCPCxZjhGOkpfZ7s5A8YYl94E744Rv5MZGwz215IrOOiQAw0+x57E G8dNqjiLs5BXBQ44QkzmizJfUoVjb4IvzEmxQo+II9h5S//mvMqlbQCx5uGgGbIQur1bh7EziX8 aTvZjPHhHkyxjBi54lznoqGUPycwFnAZvgydHjPjaifIdLeo5GTCnNEIYK64hflfVxoFbhqvRkD
 LUDLm9anXs8diC7c2lr7y5gRXNDSVl9t/1aRfzzz+meDKVWdUEUs9lgpDg0lkPSk6urQyzIt
X-Proofpoint-GUID: LF3lSOQj-KctCxxuaMGBZ290Nip8xZCz
X-Proofpoint-ORIG-GUID: LF3lSOQj-KctCxxuaMGBZ290Nip8xZCz
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=680fbd69 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Svr01UFivMFfsnZ9dZkWgg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=COk6AnOGAAAA:8 a=dAfvMG2scAZbeIDQYVYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Soq9LBFxuPC4vsCAQt-j:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1011 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280142



On 4/25/2025 5:42 PM, Luca Weiss wrote:
> Compared to the msm-4.19 driver the mainline GDSC driver always sets the
> bits for en_rest, en_few & clk_dis, and if those values are not set
> per-GDSC in the respective driver then the default value from the GDSC
> driver is used. The downstream driver only conditionally sets
> clk_dis_wait_val if qcom,clk-dis-wait-val is given in devicetree.
> 
> Correct this situation by explicitly setting those values. For all GDSCs
> the reset value of those bits are used.
> 
> Fixes: 131abae905df ("clk: qcom: Add SM6350 GCC driver")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/gcc-sm6350.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
> index 74346dc026068a224e173fdc0472fbaf878052c4..a4d6dff9d0f7f1216c778165a1fe9604d9ae41dc 100644
> --- a/drivers/clk/qcom/gcc-sm6350.c
> +++ b/drivers/clk/qcom/gcc-sm6350.c
> @@ -2320,6 +2320,9 @@ static struct clk_branch gcc_video_xo_clk = {
>  
>  static struct gdsc usb30_prim_gdsc = {
>  	.gdscr = 0x1a004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "usb30_prim_gdsc",
>  	},
> @@ -2328,6 +2331,9 @@ static struct gdsc usb30_prim_gdsc = {
>  
>  static struct gdsc ufs_phy_gdsc = {
>  	.gdscr = 0x3a004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "ufs_phy_gdsc",
>  	},
> 

Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
