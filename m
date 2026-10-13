Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F773EAC71
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 09:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882849; cv=none; b=b6QT4+B8baNzasCWErjTvscqSGA8va5yVGi/1Td9+fHrfkIJS59fFaQqhZFoZyu5tkv4TC3tXJq1sruASKeUPYX/HrQGOfo4xRWZDWMSwwKnGR2Ukyvf+8OhRmRObqhCRKyoixiDOqmzrpeDWegsaUHGhir8SmgIQOmljc9tm7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882849; c=relaxed/simple;
	bh=9t1LfwP+C0V3WkdUIqJJulzQNJ66T5GzsZqb8QyGXNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CyRnEPypTnmIka5OgeXaDP5OMQG97B+IlQ3EWZHkQ8RtEJpxtw5soK1yg8CAkhp08Smue4EdjD8fo1s/wlnCyDjxGtM2SNcslrK7XVyL9BTBo8wLzHZIYPOOu0md0MjnFjqeL+o+W8vd3UISI5/8sPDK+cg2VrktbhH4DW3uYVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GMG5hYf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gclKFj0C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GMG5hYf7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gclKFj0C"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8IQ8p922903
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 09:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4iSugGS1p1Fu0QiaYnOql6lHp7UYNFe+58/RnRtCOU=; b=GMG5hYf7up+Vl+3v
	cWUG63lH68sYoAdAYb+aJoD9xby/yKNj883k6Z9nejdI3eI3FP19D2tMZHYAMLea
	yMxTwRadGTeVLYZZbYi98HML9lWNn1Z+I5yjmACWYAMEnAi/NYyARop+MPj2q9z9
	4i0h13r5NyQOjSs/MK77M3nEz3BP4m64L+SqKnTgVTT6NF7htnC+J9bowJ47L/ck
	e2YjT4MRjn4Sap30l+2lLe2MCj9gcLAUgeYOxqWCT/OKfYXjB7ahL8P/s8AtlvZ5
	hIZX6I0/l39J3zB71zUibRrl4d0O0htus2E2C0xErS+Hr1JvnwF79+2bqASif/WC
	yjoAuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1t4ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 09:14:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so47254085a.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 02:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791882845; x=1792487645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4iSugGS1p1Fu0QiaYnOql6lHp7UYNFe+58/RnRtCOU=;
        b=gclKFj0CCVJOYFZdM5LWdSfVHPgKJyabTV/brrB+Ij05uGrEo0GBYWzf0Bx3/x7XWY
         7XGa0SkR8v7JkTyu33M4afnrTN90PstZvt2RXB5uQUk7/rT6JmtnKJLeplJRajRHItHy
         ViQp+2Pqc5SwFbPKRhxaXLPrHuADeP7RJIdjNsC/uPyygLIEiiXD0kRbks6weSOKAgn7
         Mt7vdNuxhVXU35PcVuGZqigaRrxaWnLv9YvJQg/LbHUFjNlgmIc/kI5qMSnye9LVrxys
         lqw9ZM5gtbpwOPVfXe9rD9PY269/9zwZP9mBDR2RyYqrqYEuxRWxsmRzivIrbAPXeCVS
         MbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882845; x=1792487645;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V4iSugGS1p1Fu0QiaYnOql6lHp7UYNFe+58/RnRtCOU=;
        b=blkJ4dRhzIATvbiUaGtjXSFYaepXtQCrORMbsquQXk7YcK5oV3ue/ZJiLI+Vjd9WIq
         YNc13yPaciOfxalzhQV6s/J5vbTCpHBZKfhUgM4jqwHiBZBYMM12uOuEQfXUfVGhJ0e7
         gl+7+OFMyNc8F92nQbMfnLLjxcB9BYVO9r/GhM/aiazq3RlPQb/o1q353x9pTg7MjK7v
         hQoTyIE+xJEoxs2Rgt2G6lPEPoYA3Spz9C8bQS8LZdPWRsajF5mCspqY+9KHJANqHusS
         S9DBSS+4CpgkUsD5pvDw8IunmwIA4HKJ23fQUQsdJq0YjM4nmz9LZl7wzXXnieyWQGL7
         Fw/A==
X-Forwarded-Encrypted: i=1; AKwUvBxJHb/huE09SmdUhhIfHpddYj7myLyLCXLXbQjae4YSAZsMJIsDHSmrbFTsauMt0ewSYhrB8XNn+IE=@vger.kernel.org
X-Gm-Message-State: AFq9FYInkYfP0OoFu4xQPniWhl9IWhCeBbsu0Ga13s6iC4YxuYFg7wQc
	lr6Q1XRaN9FsVrK0VU5s5rN1IViSt9N/nfHNbMtPF+362E5jKXpJtiTSbFvVdJuiV/45GaeR5r1
	nKozNmCyD/9mnUxCwOHHdSVrsCn5nXDrngO7WyxOgjS+KiOyP23HAZFxOi2PVhzwvbkrqaSA=
X-Gm-Gg: AYBFou2Oc80sOjrLQTd2X88ZiDaA/PZB/VeF+7h0K3qS2vxdlJ3jR2uWJ6pj1GA3LTC
	11rznpLVOQz+tBLJKfPYTNGQY0eIuZPGNpmJZLG+P86cPxYTvpVZ+0z3XP//j8dsbvZth9k3TcX
	jV7zhbqJ6fPnexlKgEm+9rg6bVVRRluI2PvmMdvFOtKQeUpbseU05irA5CHLVg3tiCAdcbg1wkZ
	wGrNcFFcqQEyzb5JVKXGPbgPgzel0HkvqHAWeNhLtLSXXYVD23oSbOpOfU9YoaTPFin2UZoLu1J
	VC5gKpqr30qyjGGW3FYUsrxVVqBeh/T/JnsLc5kxGVwT70E43hA20WT7isKOxoxTYUSlsEeTHHd
	4Hv4FG/YawMB+ABOmBzOJdQ==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2350660885a.2.1791882845506;
        Tue, 13 Oct 2026 02:14:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2350658785a.2.1791882844985;
        Tue, 13 Oct 2026 02:14:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c366707467csm105224266b.76.2026.10.13.02.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:14:03 -0700 (PDT)
Message-ID: <9e3ded68-ed3d-4a64-b26f-dee50b7e00fe@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:14:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: negcc-nord: Add frequencies for
 ne_gcc_sdcc4_apps_clk_src
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20261009-nord-sdcc-clk-v2-1-e00ecfa321c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-nord-sdcc-clk-v2-1-e00ecfa321c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6acdf65e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E7-qh2Fnl_Ea1JZtUYsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 3GNxkdSjaYKSG6Vp_BL84EZnLPqzlKHM
X-Proofpoint-ORIG-GUID: 3GNxkdSjaYKSG6Vp_BL84EZnLPqzlKHM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX++EwbcsvlKKa
 s1RW/MdufHV3k1gMP7WL73dyHJPwa9G6Lwa8mmiGgoLruAYecIDLr0WzAXxYSK9D0CiPZ3GuwZ7
 ZUObH6tlMN+/rUY7OY2dfIakQOy4e4o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX9WbhzuNseJ+j
 RKsE9W8pnGEj8oXSI94/X1Gdo/r7n/ExZNLMLf//mZJ375lT88kR1A8+WLAWYz/iS76hTieRaZY
 NBn6Q+ODRauz3FDmnOOfnRNbEBzOwwb87OIdqvQpvUPExlx8UDBj4dnM7mU22G5w+yf9qCRF9RJ
 CyZcSbGuEonvclMFKJgF0dFw54HoAHRrxMZsyNid1o2KfXnNuL4VcyQpFVUrYLMshHxgHiim0Je
 JLqLL22K5I4UCIq6JsgNaRs9XGvU0p9526noypN9Qsrb8ky3elrUYEom0tG0AC507/zZYOJ99tS
 cfELBPl5GEkT7oVLibZtDnI7FJ5ZZEt1FKB59/KbQowF169zPVddffXlwu563U4FNCZq3dJLTcT
 /5bkhmx+Z5dQoYwkGjZuOTo10+ERCiKNSYH3/oi4RmElBg3KvKEi6ZOUBOQ11Hlz5wEclNNcy6V
 E4INcyReuNI9O1zXh9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130036

On 10/9/26 8:08 AM, Jagadeesh Kona wrote:
> Add the frequency table entries for ne_gcc_sdcc4_apps_clk_src to support
> the additional clock rates required on the Nord platform.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated few frequency table entries to align with pre-div reg width [Sashiko AI review].

Please make the generator aware of this overflow

> - Picked R-By tags received on v1.
> - Link to v1: https://lore.kernel.org/r/20261009-nord-sdcc-clk-v1-1-63351f25a165@oss.qualcomm.com
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

>  drivers/clk/qcom/negcc-nord.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
> index 68ce4d6278baa5888b277fb34a135d7e5beb789a..0e33737475d98f1c37853a5e234831d03dd50aec 100644
> --- a/drivers/clk/qcom/negcc-nord.c
> +++ b/drivers/clk/qcom/negcc-nord.c
> @@ -436,6 +436,11 @@ static struct clk_rcg2 ne_gcc_qupv3_wrap2_s6_clk_src = {
>  };
>  
>  static const struct freq_tbl ftbl_ne_gcc_sdcc4_apps_clk_src[] = {
> +	F(144000, P_BI_TCXO, 16, 3, 25),
> +	F(400000, P_BI_TCXO, 12, 1, 4),
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(20000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 1, 5),
> +	F(25000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 1, 4),
>  	F(37500000, P_NE_GCC_GPLL0_OUT_MAIN, 16, 0, 0),
>  	F(50000000, P_NE_GCC_GPLL0_OUT_MAIN, 12, 0, 0),
>  	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
> 
> ---
> base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
> change-id: 20261009-nord-sdcc-clk-1b23f4eb4177
> 
> Best regards,
