Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261FB262FD0
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 11:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659032; cv=none; b=n3Dj/+C5Lz5FddEJiQ/9bih3lx82vpVrgA4Zs/NYpyUwqEvkdL99jJ0Zb6rLcGDr7CYE+igc6syuZzYDRsOVWyii1IC/J2z5AYfuQ5q/ox0azjrkjBWW2M0WS7WfFt0+0cCZqBjTy5K3FhN37kuzswiZmx3TtahgHnZV8otNHwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659032; c=relaxed/simple;
	bh=ONDlb32qfrMTx81xQ6xuub1GdI9oAvu0FzssNJPtv6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ejnk9iNt6oPtJixtxLqvMBSniRb9cjBbA9f9BsDYC5axpJ9GSmlOlwZQQ8Dww7/u4mvCi8Rvdb8+5AT7cQZ3FkNb5FsfAxFrekNbPt4O1VbjAHh/rSJ72LoqSP9zAUaX1DAYOEaC3tK9Z49n3PSB6YkFn5m8f9D/ir24bMSTkQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvbbAm3C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jljJdOFE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvbbAm3C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jljJdOFE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64hcn1724716
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 11:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IKvEpj8o9w79DY7CvTp53X7PaYtXe6EY1qdauKk/1vg=; b=lvbbAm3CdT+5AmBd
	RTS7RJ9LUCLAYXQdoAdIf5ZB1ZO0uUlR0UsTZtkFj51lNUCF18cPBuBlTotvvIpj
	+oLtAu0sgaMoljjQ2XRpDhuiYQ43zHRqFdUB/alEUxb3Tbpuo7Do8O+9Nmzww2bo
	1ZQNHfkBpgspHitB/5p0APX8ZDE5tqR6FrKwmkAXGer0TqgpjEN01TDLe9cHLOfn
	tB3HP0KsujpGmu82FcOnI856l6aMvE7a4m7Mq5jvUyKvECfk8roSmAe9RK9fPtsd
	D7hWnhZjxFMvGdbT/Gpvy/SPi/PZXztVJ5h2aXTpGzc/FHjKcR+V7ihEJUyBb12J
	x0YUvQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udn8dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 11:03:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b061bf1a2dso169755ad.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 04:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773659030; x=1774263830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKvEpj8o9w79DY7CvTp53X7PaYtXe6EY1qdauKk/1vg=;
        b=jljJdOFEughrrj+oXp47fBxgtPPHDbWBEWoYpFm5gR7P88rcqnqjUZ9oiYPf3J56fZ
         k3zu1aGEHqRsZo96I2HV/mCXNil3p9Tej4B/Z72L7ywMHq/G3SO+CZ/4FM8073Ypv2+p
         j7hRSDFGkL7k1PDrJkDm+P4C1PgL6UYvtW+OPnYVAC0JQwkhRUYHF0xPL1K8gSVk+M56
         fwTsWQlYHzKncKierX6dSKYdASngTPUglifZV+4t7c2I41qiwd3m9Z3pNwA2wtdFRgey
         Emf37BSdGDdHjZFXcmQEouGhfXVnuZ9o3jIy8gxSHxSGVsvvw0wGkfOy2CHf+6Zg1nZ1
         X5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773659030; x=1774263830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKvEpj8o9w79DY7CvTp53X7PaYtXe6EY1qdauKk/1vg=;
        b=WCHJ9ExjUeMvLoBhSd4VwhM4npgAI+7iSkIPsnrT6EmCqRrlHkW6IGSxIxTGDE1Di5
         5JQwomdp2OdOhDtWGzfwrhEO1S9NNYxCrEz6X1m0Y56x+yRUPc6IufsmvHJFDcgp/54G
         Rq4S4IoJ5lgAMQNOsWt4yyUQABk1kx8I5e9vYWWd9QsxKIgfVaRWxoElvmCSi2d79bWB
         oMX+rfJEbWIIoUncQW2NLeQbmlNQjaGaPWilT+5UBPA8I/k7b4YgLFtnSzZGTqMJZ3wR
         sEDZOE523hMiopvFYSN2qcCal0yrLdWACSXcfEwh2Vbyd9a3ih+DiOcYcJyUTr0z74nT
         gvVg==
X-Forwarded-Encrypted: i=1; AJvYcCWjtaJtWyEpy71Tzh9LGO+I3TYiCMnvcwjxtolm6Tp+0zpLzn855J6p6MFJ0AYGzB7BiZUexOMcgik=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD88LT/UNwjOFlsMcYTwUVtclDv8f+8mYXGY9cCY865dAIGkFh
	agWWUpXBLZ+PIvfECekV/MnasWDWhZpmP/fQuBz6YVG4wEi60foT5z/sBkXE+2LlqzD2Tw6t/VN
	dMs+LDJ7kgfQnR2uX94+Z+5zI5GU1VM9jg4nPwJIr7UxG/u/kJAsvwipAmnpHInE=
X-Gm-Gg: ATEYQzyqntVo252o2tQS0wY8TzQmInRWmDj9uvVz2pWd91ZOJrbvizo4dN2sCFAlCgD
	zLV1T4TDoon7qLEnUzgsKSo4YNaEwuKxDnlqvR37Eos4mBPwr88aaoweH11YFxPfKVaN2iTj8rH
	R9KtSKNASa8U/ync03dvPDlmhqemFArYMzL68YsKudaY2Uzw4kajUK6Rfk2mkFFrN8i3TF+d9xQ
	/rnpQsNeVc5V8NsEVm3PHZBhxTtroDx8xlSaHtp8wE045LZXcgTP9Z2ZZZsjwfB0LumI3X2VkvN
	sp/x612PyM8vWXR8ifCa8gLNESzvT087ogeLlSASfNI8KHLssmFW4ieD6IrhQUTXO1LfAI9rB1a
	tgxm+F2BANNloAmJUU9x30J4XBNjJExdyNP+rMv90xNpunMQp4tIO
X-Received: by 2002:a17:903:41c5:b0:2ae:a95e:fe58 with SMTP id d9443c01a7336-2aeca959d3bmr130518865ad.8.1773659029757;
        Mon, 16 Mar 2026 04:03:49 -0700 (PDT)
X-Received: by 2002:a17:903:41c5:b0:2ae:a95e:fe58 with SMTP id d9443c01a7336-2aeca959d3bmr130518455ad.8.1773659029227;
        Mon, 16 Mar 2026 04:03:49 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0537b6567sm40971865ad.58.2026.03.16.04.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:03:48 -0700 (PDT)
Message-ID: <5299d711-63db-4d51-888f-c9062b2c7fb6@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:33:42 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: Add support for GXCLK for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7e396 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=m_WPT2mbnHjVYyRV6GoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: xuli60M21nhoL8wIBgf9BmN49LiweDTq
X-Proofpoint-ORIG-GUID: xuli60M21nhoL8wIBgf9BmN49LiweDTq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4NCBTYWx0ZWRfX6MVW8XfmiwmT
 a1zdcmfJHVFeD+oCjVjXne512vvF+l1sxTQd/xxGHdYKWIFqOwSfxldFvRpdac+EuFExdVkR1KQ
 0EZwuCIC9yjMJsMSAQItckgOifwThODlL/IawPDiQTv03tA5ZINN5oFgQaBuz+4BitvOk9uPvJA
 eVmFfch+Ed7o9IrLD0MwPUNGHWjO46WqEVuio6DaDt0zJZtYJgB4IDK8KbPu6L1TEZiT3PyIybA
 KZA0CWyf3KqKnmYeeDIRU3yJZAsv9hnmCxBt7ISKccHy8X3qs+MyFSf28/A/Ztkdf9VsG7IGEcc
 zoqfz3MhDFjr16TL8VFaJGO2l6exCN5CQWDbnrcKpF/4u/gRjn2Ua8eknOrYjy5lbrZ/HcavwW1
 Nne0bThztG7fMuqZOTW8/qBbb2Cs6IlSU9Y6Zo/9TXPJodDmwwgsdBtTlPpv5qInipKb561qnQn
 rbYW/+b16Iqj9NuXyYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160084



On 3/6/2026 7:18 PM, Luca Weiss wrote:
> GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
> clocks for the GPU subsystem on GX power domain. The GX clock controller
> driver manages only the GX GDSC and the rest of the resources of the
> controller are managed by the firmware.
> 
> We can use the existing kaanapali driver for Milos as well since the
> GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
> configuration.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/Makefile             | 2 +-
>  drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 90ea21c3b7cf..155830140d26 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -182,7 +182,7 @@ obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
>  obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
>  obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
>  obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
> -obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
> +obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o gxclkctl-kaanapali.o
>  obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
>  obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
>  obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
> index 3ee512f34967..d3899420d6f2 100644
> --- a/drivers/clk/qcom/gxclkctl-kaanapali.c
> +++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
> @@ -54,6 +54,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
>  static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
>  	{ .compatible = "qcom,glymur-gxclkctl" },
>  	{ .compatible = "qcom,kaanapali-gxclkctl" },
> +	{ .compatible = "qcom,milos-gxclkctl" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, gx_clkctl_kaanapali_match_table);
> 

Reviewed-By: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh


