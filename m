Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445252;
	b=hjZilTnOAyqpAsI9LH5B43znbh+L2cxBUoIygwK1MuZDr5+PVttdeNxqIYSEBMV+eVAL
	 N9tFALBq7ca51GxaQcJlZ0f3iQrKmN4jpFTuxFPFr7LF+7MCvXk5xwOw0sUVjtxQVv5t4
	 yuEvsERvBjCSL84zTWZ2bqNXrrRzn8S3tZtltoSdGrRHsQAX+KMF3FIYHqi1c6PJOrq/E
	 2/4MIyNjIthre3ODdgJsYo8kCxRiUgqg5h5/yzhfyPYuTW4Pjs7k1chTG1OYfS92swXSI
	 Bt1rFrOboJynxrD8rijlQ521vKJhToiEoBLknbMaRDtGVv5mbeNMIV2DRn5J/jzKgyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445252;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MHkMOwpV2WQGRim+w85Tonck67+/b/CezH3Q5Bb5mSw=;
	b=r6+0nV6TcPJ2MmI5dyzip4ZwL51FaPvZNNvvhfql8ZLhruNWgW/I2nfAQNXop5dZE87r
	 Tu3WBfPUdeq8ggQVYmYtGYjo68e82e4X5qNXymEEUn1aDk2JewWUxA4dcm8gEF8UGkQXh
	 rd0J1HuPL1tYVhmTLfaPwyrz3wG4/kyp8w2DlZSB/Xs2nWCBpe25rJv8UQi98nN79/omt
	 hugmtOEYfp4/p2e6o3LjQHVo8S1n0xrAL/SzTbpAOah6ZUDT4A5H1nteAahJMO8euebIS
	 ECplwm8rbfSYUk7o5wuKVxune4UClygJPuULkQrCUJ8lbhN/yFlO3sJFKK4RwXbPxHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y5uQ6ZNq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ev6Cw/YF";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28540606A31A
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 14:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28540606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y5uQ6ZNq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ev6Cw/YF
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLGN71461376
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 14:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHkMOwpV2WQGRim+w85Tonck67+/b/CezH3Q5Bb5mSw=; b=Y5uQ6ZNqVWEGZAUD
	fBEdZMEPau0S+JKacBYxxtvh0lWylRKSDwHQRYXlzqd/5CIEKhwefILUlIA+thX6
	LNBPyrtWv+VCF8WmGWWCGGm6672MeD9jHgKsHzmynk5D6vxm12bsMSL6W1QLc3Yu
	JLgidqczHYPrcYRQMZBRsj9Oyz6iE+CK/jD7/+3z2MKem/l262lImEyGMJT1AeY3
	8hHfPaUOkKnzAXS2orpiwxfYjUIDi24IT6WPLOx5BYkBkvnAyLXZ8qqCg8huE34Z
	B//fsa/vmn/9ed6EbSUodmPe8/SqHklnLoEfRaMzgvNggR0nvEjDB2YuvzHMjj9m
	GlNGQg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a1u04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 14:47:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b46af583b5so364400a91.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 06:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445251; x=1796050051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHkMOwpV2WQGRim+w85Tonck67+/b/CezH3Q5Bb5mSw=;
        b=Ev6Cw/YF7FGhVrNMU420Xz1goM4cemU3XlNypvGI3Gje8cz9MzCjAQ1oHrCUxKvV9I
         t98hZKgSTwbI1y3z/P5A1NEibPviKFlq0N0psgthKT/xEo+48cpa78JsG/CfWvBEEZxs
         OKHfMulYX3gbWHJjU3jLxDSnG1a6dK2Dl1UIAf6VHzwYDKvXH6YWsTotE/wGEisKgINA
         kbAahHicMssnYLW2EZzvgNFGeEnzKqkX8LWZVsRIlzlSkIm50omfOCoRBbajzlPVazYN
         omsMdVNp9UByVsGAYxp9qy14/17k/Q5C4GusiuDNaq4ZAcCoGz4DxToTWdqC7TkD1PMn
         /d5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445251; x=1796050051;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHkMOwpV2WQGRim+w85Tonck67+/b/CezH3Q5Bb5mSw=;
        b=B0AanNUBP4PTRIOgWgFwU7iNPg0GSgwaVc4gZw+eyLbZANcrmBW725BA3CjEg5b3eH
         1OwKuHxO+yJLMkTiOj38g5xGJ6qszYhl9Hgg/OJcyKMyza2LAkUTI5mnDVg3tU1lEuZK
         Gs9UZJMMwaKLthi4q+AWybjOX0kdvw3tYdFI/mBm6GzTyFOclRoIGIcoOW3Q2b5dQATE
         S+uEaADIWZ817HEvvhTPxJZUtelJ4+5cXPXRHteBWesiVf3Kg5EnhHuweCPhmORN5+Kx
         R8nVkDu28HOBVEpVv2H8RxFRGXIqBZp97Xt+RF0uVYWZRNwPbdRo6FMurMbkQ3bXaFuS
         jgYQ==
X-Forwarded-Encrypted: i=1; AL+hErGi9lYq2p8tfDbYV/AFEuR1fHwGoSrtNeX4GvNSsqnee63yFMsBPChAPnW1fXPWr1SB6m30Gnn9T6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WmQGd0CLqCabgi5sU4lKNLyYqfFDgruNZ/AClNXJ8fADnyieM
	zJ2l3s9pfgkvYbNJIDlsJaHuK+dUzy630EqvHPfmUg2XZIplmvL66IhypjibSI1DU36Bj4FwWcm
	qO+Uv4f3nj4l4U7aZRjM4klmr4JegXAJxuvMYkWcvC99heIzN0+VorOcTYMYTyuk=
X-Gm-Gg: AZFdTZcH9lYdC/XVLHJO/pJLy/ymhK/XXOayJ7Md7anFBmzEM/HKzFJwFNRQyul5yLS
	cKi8q0y9aCiWZpZ3/YkVu0kNIIGbGwGLIA2+zeW7hSTVHmlpe5CgTXpcLM64aKgUhGs+Ozalkfi
	pUQPCudXz3WjmbJbu+M3DKe9n5ngnVhXmuQ1yYBLuXhmLk9OpQwhNBhgffYgSFMsC3OYLX+lU2H
	5iNEWUYtAoSeoipq4Q03qmISmQJAbOi16OUsIlPDexEeDXznXT4iPO3VckOArVa6WU1yg3hLjjr
	5s5spB3P55TaUEPZo4dSSPNRt1pT3JMb24qrA/SjA96UCgqVKB7EzG0nl5nJ+BsWfMpiVhsIz7t
	xQhkH0LUwKwtADwx51WMy77+05oggSzIqSVRI1BgnHdqUvG5nHBoFhlBoSg5VfHO1qlLz0E8=
X-Received: by 2002:a17:90b:4b05:b0:3b4:33a:4cf6 with SMTP id 98e67ed59e1d1-3b41c908fafmr17090996a91.4.1795445250736;
        Mon, 23 Nov 2026 06:47:30 -0800 (PST)
X-Received: by 2002:a17:90b:4b05:b0:3b4:33a:4cf6 with SMTP id 98e67ed59e1d1-3b41c908fafmr17090947a91.4.1795445250058;
        Mon, 23 Nov 2026 06:47:30 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acff65bsm435068166b.4.2026.11.23.06.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:47:29 -0800 (PST)
Message-ID: <7cebe4b7-773a-422a-9391-58dc3848fa28@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:47:27 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: Drop redundant ARM and ARM64 dependency
 on IPQ_GCC_5018
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
 <20261123-qcom-kconfig-unify-v2-3-fe56c8fd15bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-qcom-kconfig-unify-v2-3-fe56c8fd15bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX230wK9dgyQ1Y
 CDl+cPUoA8wtZ+tRRySVh355ZRBHU7WdNxJKSTYlgQyjqJVHMhFZKXe5JgHL3WFYf8r+WQHWc0A
 IVat/kqmzcyXQB0ycR6QXlolLEhajrU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX1CFohJrNixpS
 TS1NnZ4ecrekUnEZ/MI3iaY+5rWPBxg4cYJQA9+j5n+n8uoK5hrG49m3vyGXu2qgOgcTNbitZq8
 Ah04bTuS6j7AeHPxnNeFZ1+5aycG3uOAon9qYH6ELulRrzagZki+U9ToHbz9UPNFyyRB49sVZxp
 a7tkqZSrvrrAjpGr8BWYAcnJjDCY2/0jkyqBMPn1SiRRuwbOk/A7XllXwXoGHamZ7n8DFakJeHb
 pjR7bV+TffKiqEMTZ6lGn8bi9+7X6MZnF+d9PkUv3nM39HN5YnxKoEorrgovFIgkEZaMBs+NHR5
 SPFAENlVTXkNeb05agHqJvUL0603AONczKOxHAH6xmlZliPKSQ7aXLaR9MYdR3rh/8v02u18TTD
 N/ETGrNqqguHvUU9ns8IbOluAgAOToAFAc4p+mL4jFW6v+xBkpGNXNN1ZYaM7yy7vlrKaBvDvVt
 ZTR/oUuP7BRC1r/GKsw==
X-Proofpoint-ORIG-GUID: OxDW53g6xEG5KHM7e6h6dhW96oUMXlOC
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b045203 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_3eSVg-FmVzFu8mZ-a4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: OxDW53g6xEG5KHM7e6h6dhW96oUMXlOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230058

On 11/23/26 8:38 AM, Krzysztof Kozlowski wrote:
> All Qualcomm clock controller CONFIG entries depend on ARCH_QCOM which
> is ARM and ARM64 platform, thus additional depends for IPQ5018 is
> redundant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
