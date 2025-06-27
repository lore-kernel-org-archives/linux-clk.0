Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75322EA47E
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 16:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041648; cv=none; b=M7GHTH945xYnoCacgqVEfJQXHAFUpw1xGL7sFJW7zt7iI5X5AhMEVvAvCTutlk4urjngG2GjLgWFz2fCsdyTTfym2a6XD/kgqctxVBhbtVfa+ENtv7mP3XVw9WeV7c77hscTt6rtjQdrfyqFVj0/vEhs520LoFEW1UnQmWOyvYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041648; c=relaxed/simple;
	bh=LRgiyfrICsKTlHv9IhC5r+4XBxhCMDaKngyow+IGVj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjCkS7VoC1B9R9k7j2bRVYRrEN51b/BLlvPyTUC3cZwbFMszqjW04qjRcYQf201x0aksi8WJiyROBfGRX1+fRsjfdKYKsO1gZjC3Kv00sWSXfk78XJ0bTRsbFZQ6nrO2FY7VqLGFN2M/+yKpHtJN+v/c7Zq/A/6hoD3Z47E1dKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDXLCAQ0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDXLCAQ0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCsmtS009899
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 16:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lvYd1deVAhihvBAnBWJn94CrhAU80ERbjP9yegxtMRc=; b=bDXLCAQ0cbgCnzoi
	lm+zHp0o4lGhoQHyD9gxNOKnTFOFDsTWHkH8HmlD5/uBJW4rnl8cXb4Iiurr8HK4
	XWXZUjskbqOFfdlzu8eneXoVRrnHQ0izL8V8U8OGPVNi+/19sBQkKUkT0qngbbsz
	e6H8F3kGVCBMhN9ByxZkXMJfSy/TJnOIRDEDzWtUNA7vCW+VYrAGwBcyNr8ntvII
	HNexMP22VMPgv3qVSUFsSxkjm5C/EVvoDKtIgW4KZ/4PGBIG5DNfUa6r+J3jnP0d
	kzQsq+hYUyJaCEOlqcb7dIarRz7UZeNBOPCWu1nBFcZZieEKow8ZsZwgO1wTFWZP
	yn6sAg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fh5fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 16:27:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09b74dc4bso45133885a.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 09:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041645; x=1751646445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvYd1deVAhihvBAnBWJn94CrhAU80ERbjP9yegxtMRc=;
        b=riIaZUN4oKps0Exz9QYC/bfoATz9kz+qFGRgNOzmV1ESwLSLPDlZfNtsbyI/V3hRKP
         9aY2os04BddPCuq+Txxbp/Su+U9KqLp40pk2jFiKEER0pCUuaEEmvfy52GTWBlvAdru0
         SkKrXvaRIXiNAWTiVCMxFj/Z/9phGxUToZMzZmNLvoD9iKVu4Wj3qtngQ6QkV+6nUOen
         Jh1PaGFsNNfokMy4K7RgGSErlWXmTlrQVjl1FE2FZnY9ygVdWfU2WzjOLY6LmS7WPJeR
         3yEeQpKbLre5ZnfedZE8hQ77C4/Ej8DtO4Onz1mLfKrsNBOTAxbFeJO73H4Vnv82oJyo
         /2Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWYjNAQz1Xe1XB+nc0aZ6LU2DPFyJkpbl+nlG4zd0BuWBdf1GGBXdzCre5evDKlejdRrzpdT8sz6Kc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo/s/Iet1SRh5hWy+ixGZi4u92sMXGy2MmTcGZkPMWJHYbrLbY
	Ud4/wRZMLCQixIbbZ9ANy7mjDK8yKNu9rCGrjD19WxsqcKW5T6eYNDXd+wD3TVEvRjk6GO2g94U
	PhT4YOV4u/Du2qJglk775SoXAYmHZCejiNH6Qn4hYeZDdwZsdXfQIMJXo8CZuK+8=
X-Gm-Gg: ASbGncuQ+FQmYmzXOx9zj9Obu3HAnjwDYs45+ZRwP7uq9e8jPhKenAYpyhCl7XTtVvW
	+rNrrXPum+Qa72bnS/hWrU7bMQmajRuTqNttJkzCSVHe5h4Hx4viGKQodQayoQaeeUkDiqEEny1
	VzjwcI54cKmnzCKReh0PM0zip0j3xwzgY20MwjqX9q08EFcPZ5KWphzIAI/K6ftVXXoLPhOaqPK
	0gIoPcWc7ZU5dNGLnSWwKaSyTmF+MkQG4paaR4AVbgPH++oW0GVqES+LojKI9AkzAVs5naayCir
	YqhxoXrxh/j0jKw/aN5+BuXx61+8Gep0XMaCs/4uwYg5AjVxS+RVEoEqzc8EbQi6K01W+UdzGRh
	1J88=
X-Received: by 2002:a05:620a:6011:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d44393af52mr224995885a.8.1751041644605;
        Fri, 27 Jun 2025 09:27:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQx+88Ksz4ECZwUoGt+Ed4X8fsAOVBGWYUZ4j8qk+znxirQR95/4sMWkJF3ZwWKFN09XhTLg==
X-Received: by 2002:a05:620a:6011:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d44393af52mr224991485a.8.1751041644137;
        Fri, 27 Jun 2025 09:27:24 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353659e12sm148855366b.40.2025.06.27.09.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:27:23 -0700 (PDT)
Message-ID: <cd6f018d-5653-47d8-abd2-a13f780eb38f@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 18:27:20 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: ipq5424: Add NSS clock
 controller node
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com
References: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
 <20250627-qcom_ipq5424_nsscc-v2-7-8d392f65102a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627-qcom_ipq5424_nsscc-v2-7-8d392f65102a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzMyBTYWx0ZWRfX3x/XjLg4+Y/I
 2mOubrrflkwiOFvGXGfUfEMDiokn6blcrSgUY7BAOGywnw4+kufw944NVV9bbWYRxCEOXRBfUDw
 8bl69MKtjjkLcb36nmJ15JEIzeTrd4LijKJEOZPBaJYw83Z3Oqoo8KdnwpL737piVegDTC3DXOb
 dBA0qBp4iPwZ6LLTVojP7xHv+s4C2M8UWz5PF0hnlspaDNOxZvQswDU8tQHiqxXEAqdBoIurCM9
 ZGQEfZP0711YX4wKzFOG1rJpTwWi/PcYOBylIMbDdAfeFQavSrnGwUW+62Y0r2331kEm1uATvfV
 KkkSwKBQBrAH65/hdCcqicQrOD72m41SMPT8475ptCvB2dOWzPVAvMgD6lQUadjMjCaHxyPAv7f
 LVOtRAI9kj/WXNXjOQYwcXerd9K/uw/Qze2a9BJEj0Mvt8EP0BvCGR4ZYMgvFxAQiBjuZnAQ
X-Proofpoint-ORIG-GUID: uLVDQ9Sht_H2EZhaXnvEMgu8EQwiX5ci
X-Proofpoint-GUID: uLVDQ9Sht_H2EZhaXnvEMgu8EQwiX5ci
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685ec66d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=f6GukiY9ARMaQ3Zrt0MA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270133

On 6/27/25 2:09 PM, Luo Jie wrote:
> NSS clock controller provides the clocks and resets to the networking
> hardware blocks on the IPQ5424, such as PPE (Packet Process Engine) and
> UNIPHY (PCS) blocks.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 2eea8a078595..eb4aa778269c 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -730,6 +730,36 @@ frame@f42d000 {
>  			};
>  		};
>  
> +		clock-controller@39b00000 {
> +			compatible = "qcom,ipq5424-nsscc";
> +			reg = <0 0x39b00000 0 0x800>;

size = 0x100_000

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
