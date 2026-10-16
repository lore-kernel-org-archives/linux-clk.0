Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D899D3B8BDA
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 11:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150000; cv=none; b=jLFvSPihEsWPgwBfOKLLrKD+3LiPWDVKKW9jNAw0l3sGpsYSxL4YbIEgbFQoq2kZGhbrjGSnhBkDqShHjsWCoeYuJdiN2PKkxByFz/rpa7U33agIkWWRDn4yBmvuTRLFfNvN8DgUKFr7lYhFRHgETKHgw5kHMbvbF44sbxGIcNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150000; c=relaxed/simple;
	bh=xWgFo5vR+4z1f+gJnH8XH2etkKb2UlR+IkIsYtDDmOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LC3xgu6f9WX/23O7CYOLKslt+TMtZlNhWPR2fhCB28aDNDZ/22lzQteaGWa0YSoUWODv7T7JT6LrERekkLMQkSwieS5IDRA9lKh26wfvZMG6sV0sC86M/gOzKc2m8h3eM8W/MpFrq6VkBern2fzlj+4/sS1xpT4DJePtnxGTaRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJdmx1KJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kg1cCL1N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJdmx1KJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kg1cCL1N"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA6ZE1983100
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 11:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	14Hp6kTWchGTGJxGKqMn8VuoWecOh0DayZj1TPbhfcg=; b=LJdmx1KJOV0HJvY2
	MSKB0SnutGjmbtpxx8SgeipvZTTiQ0FZVHXZ/q4/OlQeL8AeSkAZtpVnLbdCxbMm
	w6GZKfWju195RnEIpjVi94Dnd3fIFwaWrGEhx/qVkOacgTRAcLwSyMIZsxNrvVVB
	URQGCMiSQI77jl3jv4FAiTtOj602pVGo145ujHE2IESfyKb85oOfyxgUFvyv04d1
	NPUKvFjZua7p7npX+TI/DZ6xS4byQSAMUPhm3Lx+hZ4dZBWPaLt2GtI3YQ8ba9T7
	xUnyaDH+087aECDfiACHiiz7yBx0PepvINKmVCTR5OgJA4JEm1KG/JEP1z8VpKwe
	Fz/PDA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8ad81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 11:26:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso12807929eec.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792149997; x=1792754797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14Hp6kTWchGTGJxGKqMn8VuoWecOh0DayZj1TPbhfcg=;
        b=kg1cCL1NDC+j9Wd8oXSRb75bTnVWOYOOQoMo7Igdh29d70OGGHKZBEkj4yUt9Z4nSd
         xlDAaRt4O2MQvjkk2qCTPZRtg5L0Sile538KKGD0Ry2XZBd3nTNggkk/btzT6lPLTS0i
         5ViKorT7a0O+QtyqbC1rJY2bSC5nzYr/w8ccd4z+rzgdF0U34ZhalyDw6U38k0LtSEYe
         6UKolXyzPlRpd3jr/AVDEREyUOLsPSV3utqPABmHvP6h+oLv5jhLCoyrI4+X6A7o7n2R
         STolAKfjNU6KfoCbEp744rQWQukdPuUYOZ6x6p9AeYCcFmrKyhitsOvpJLbo8Na8tOrL
         TqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149997; x=1792754797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14Hp6kTWchGTGJxGKqMn8VuoWecOh0DayZj1TPbhfcg=;
        b=sjzmrA9TG33U0SNOhXiUXHdvBq/RwkOlu+T347OPmEENlnw+ImQJd6aAMwlIMIf0uh
         DCLb1Ilo550WjmwUNCM9w5RoA5P+lrU1lpTnI3dK4qDSN6UA+9zxdHUBwIhzDKTOyY9m
         Lq9jC+X8toNORmRlLWdzAF2Jz0nZq8QJ0a8JPkvuJGNVuQAyTFNi4nBklhZoOPsa2QF4
         ePD1ptIW+hiCWifxaLfMSFg3bc500sZ3qAyfoc7enmuRIA09nv88VYBzRrTX6YtApdK5
         qe7rZ0rxAuEdxWa9rzzqY0cvAMkiCZs02euD1W0/oNF4ho/FKzoPR7j2CFnmFtL68EJQ
         efBg==
X-Forwarded-Encrypted: i=1; AKwUvBwu0BAcuvVPpRO1pT0aaZSftjVIa73T684AMEspKkib3BCnpOK24Qr5JVdUgXgz8jpXkaGjK9xqdJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAkKzw+AtyqYlCMNBZobCSIPKzRLuvsI+UzJkhtLj6Jeu0QElE
	jKfQX+tUz/8Gcfcf6XzLP+GPaTzShd8beXa9+KoZJdv5ny6v5fq6JAkoK98FPNfjlo2Xh1CUWxo
	I3CsVwFV6m8HF8J2yQxUw9tufOqf6BWzoGeqnVYmqPxFCtt1ldrvzori3Xp4EXR0=
X-Gm-Gg: AYBFou229Q9ILVeFzjTwTE/Kh1q71CDsdaLQFqjLlsxEYgDMrqtVevXcuOogmSvyfrW
	4b3nYh+h4ElUACE/bDmw8KXYj/k74Yax5dskCG2O7DCmwTpvDbz2yHNsp6LqzXtxR6o/KIcc8Us
	jczU2mwGktHhHbaZZUtHldfslTmYFLytiLDHOqKA1iZmXUH8UG/e/qlOGBRHQOcB1HkH6wRS9je
	TiKRlN8aevpj2+YqlhitieU4jUzUglQcjhQVvhGbfzbuAqy6hr4y+5j51NvwdXTBCy/CRX4Mnmi
	vhcLF6hinoX/FcjPjRsBJCQZh3TOpkq5bibjZKMuO8t+D1SlVFZ0aeyxQDDm5y9F51coQDfdAql
	aujSGQIphjda7zCbxGwGJhT/YMQ==
X-Received: by 2002:a05:701b:2411:b0:147:a685:9125 with SMTP id a92af1059eb24-16a56c9f443mr28008388c88.2.1792149997102;
        Fri, 16 Oct 2026 04:26:37 -0700 (PDT)
X-Received: by 2002:a05:701b:2411:b0:147:a685:9125 with SMTP id a92af1059eb24-16a56c9f443mr28008359c88.2.1792149996325;
        Fri, 16 Oct 2026 04:26:36 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm6534333eec.4.2026.10.16.04.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 04:26:36 -0700 (PDT)
Message-ID: <68e8b350-9d32-4eef-840f-f2f7fba27cd6@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:56:30 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Add additional frequencies for GP
 clocks
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0NSBTYWx0ZWRfXzQ7bnPqb6nRn
 6bopr6jqI61aCdKCjIAR+By5Hlk486z+UuldF/bLgr+xu4VCLUhqWmiW7kuXwL/aTajy8sfd7vo
 zYAJ3iOAebWHdLmbNuO3808wxceXQyo=
X-Proofpoint-ORIG-GUID: 7JrX-U6VWZrg3BmdF1pUV94z-n-sHjFJ
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad209ed cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZjhuaSGYQaDxmet8v8EA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0NSBTYWx0ZWRfX/NPvGJpRCgao
 15CPxTO9mV2ZnLtw1EZQkue8KtzDa4MqTQ6gnczvtY5U7SwflYs3M0n9KXvL53/+n/XLCEF2Jtk
 dkQGkFtMV2yv/K+OEDTi3I+LDBjdVYMYN8PFuOmRbeOv/SbwsRNIBRUeILBd94b9Jr4SeZkznZJ
 5J3UCbso5yHwKVkIdqvFq85f5OgLsP8v3fdl9TiGWkEeU/6S/FUWZVt8oJHhauWjTPUN1TiObDZ
 rNS0EfU5rRRhzKabz1/50thIxTa/A1RphSdDTV0wg5ICedLPT5VwG5BbQrrfskQQ+SVpFSksHpm
 vSgQz5t2VA8jrNyNCNkWbaDhfEA+R2febqiH05foJv+CS7eYzMRCuHsGR4Jl0bpKkhUjyX/jDCv
 Rv94Gt6RClX6odFFPVVAc647CNZP1VxJLOErqz2JYPyBDG/XK4OVW8rkQafSAEENFxj3lAVQWzX
 O7jeuajJEWs0yoNH3KQ==
X-Proofpoint-GUID: 7JrX-U6VWZrg3BmdF1pUV94z-n-sHjFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160045



On 10/16/2026 2:42 PM, Imran Shaik wrote:
> ---
>  drivers/clk/qcom/gcc-qcs615.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
> index e096af7d82bf..f205de3a9361 100644
> --- a/drivers/clk/qcom/gcc-qcs615.c
> +++ b/drivers/clk/qcom/gcc-qcs615.c
> @@ -419,6 +419,8 @@ static struct clk_rcg2 gcc_emac_rgmii_clk_src = {
>  };
>  
>  static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
> +	F(10000, P_BI_TCXO, 16, 1, 120),
> +	F(100000, P_BI_TCXO, 16, 1, 12),


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

