Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28583CAA3C
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945665; cv=none; b=DSU7hyCEJzFRDMF4dzxRnTzLX1bv1Vx4UYrWjABgE945WRD73WoVZeTcrijjWWKTiomEdKLCMRpXeIIdx3maknHBpZGtAoiZvuzub3iU8uI3a6F4GELNGvw/kTB/0Rsy66tl7NlRjgJp+n3U2cFek257o6YewUN4i/Rj8PFvCpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945665; c=relaxed/simple;
	bh=ukcWglz3b0XxiFuNMMjBoSzp+0cQUC+nI3t9GxS1yJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FLB/BgFYfKWw4QCH65z1ExA5ZPHMMAPlYyXNhDxVLRjt1LfFEW5wIw+tTN7YHd6G4vG/KOy99/9dgVhFmjlcMfUp8buEW7lD8lZGeviW2lYYhovXY+V+vGPcvOgl/jW6OA8PUZWujXkwBwNzS455w8BrhGeQWxvegSJoQbuGm3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gq9YLOcG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gdTcH69O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gq9YLOcG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gdTcH69O"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6893owhL3771143
	for <linux-clk@vger.kernel.org>; Wed, 9 Sep 2026 09:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukcWglz3b0XxiFuNMMjBoSzp+0cQUC+nI3t9GxS1yJc=; b=Gq9YLOcGElM9zYWo
	mKBl6U+Qv8aHzZtMkr341dg391VyqGtc7LZfSLY2/LCq8/tKUbFrDMT+Cuq7yj7F
	CpN1Y+XkwvV8FrNGU9xkGAXtc6dv9wyDSKo5DWBoto/hqQf6mPwmHtQRMk0S1Msj
	AcNMhzMwqtP0uEyozQg/v76sRVMur8pVhfWKk+NeNQpcjGFCDALmWDDfNTaB9ppG
	gsXCgLYhsICqNdhx99NT4yjH/Vl5aNxYJSHpU3xykmJdCA3SHnG1YU0zsVaOwq0u
	K0dJm7IaHJUnmn5iUICEIs6Dy15Jsv0MLAhXfKKwFp/dbHQfeaVwzYnmc4LIPt65
	2Cw1lg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr17yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 09:20:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9392788b3f8so106205185a.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 02:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788945658; x=1789550458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukcWglz3b0XxiFuNMMjBoSzp+0cQUC+nI3t9GxS1yJc=;
        b=gdTcH69OVz82oTN1SBELIlJ9S53Cen4vK0pVw+Mnx5EMu/bJ1hX2qb2SUgjXDXrFYp
         L+IgLQt0JRt3O56QL9L9X1TQxcFY6isN2tgEy+c3bTB/tuUtXoHUPxpvymOckgQyIvCr
         0x+TTepBIlZ5Hyv1E5ttA1ZXE4wPg2qI6JYemzCrxF8UiRKQmMMkwydpub30ziRRgHP6
         R4a9O6rbaxGXNt/Z5h2frIeJa8lJdTH0rbPa5yq7ZzDYTQFJrFMPbyw9zsopgsoYGBhn
         Acl1NFtCfHiW7s/3AY8FwEzLopQWMnCJkoGlCzm9EslA6EG+GDq9C5pSypQMt63B/Psb
         Ub0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788945658; x=1789550458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukcWglz3b0XxiFuNMMjBoSzp+0cQUC+nI3t9GxS1yJc=;
        b=SFIocdCN0BQ1YNXsZ3ISQeZfAwPBmKzU89gtMjpSS6n4WkG6iW7BEzMdH2JoBbe2+C
         uaCdiaJQo6AI37C9sNm0ECdGJkiCqVE4KtyTlbMakezS5UobtcEjjjBYwY9d45DL1yZ4
         qSWpZ0hNBw2fU/vN27JBV7Xa4BXUnskN4Xl2SP3VJYnutWnRALnG2G9bWlhW2yDRBltW
         7pfdXPswCiwZw0+bzXzvVrwt47yXpi3fusEXCjSuZBddxuULyHclxJpqMEa1G048BRPu
         bSxReDTT4RwU2SmygUDxQxmyk9BqALxczk2AVuilx2AlRcSmRvq7Q0/2/xJ/RjG6g+SC
         w11g==
X-Forwarded-Encrypted: i=1; AKwUvBxCUcdy3Ud4l44utppuarEie/ufeQvkcSGIWubkl8A1dgT7ky8rRl/17L//HKdUWGoC459JafywnG4=@vger.kernel.org
X-Gm-Message-State: AFuF++ln6Uv7q0Yk+uVrI6s1RQ7NEieo6zIwl7j3JY9Mn+ArsPtUctdy
	7+206BHBGEgdP7q0m95MttUOQ1VcqU/bRHQcMALRGkDKEkp71QpTyxju59Ixdd2VpQd5VPO9oUK
	7Bya2P9qTc5PS/KGwu+fQlmLPBLne0ayTU1o43iSFBvWHLlEWhUuh/up9687AL2M=
X-Gm-Gg: AYBFou0ZmUHHWvrztZA3mlBFBAL9Y5NZ4qu47WzdN1UWfZjy9rmjvPXdyDzHBKm9qEX
	B5qhZy20kN9OCxyVCy/lCvI2fguMnXeNYih7iKINbkOFdzsX6iox4AMrsZmuCK9+AfcMKROuvtH
	ZHaygvo9PkKZ45evsECEwkFRv6AnNo/BWR3T8vl6JaBbYEy6ZvoqtWhcTEWoVGGHhcqXwn6A+FT
	OAOysJdnY8vUB3kRNLb7U8P4+gz4e/uuWKMJwSuogU83HxQiqKDdMfIMdFc/L3kzAASEHvs0f/d
	UtG5+HLRmWLrBHYnlJGjGlSbckjYgbbdfqwHRHynH4ciGDDyE/x2NKSJJqEDL64eWBn8/f+TSbn
	KxdPBbdk4xuhZVJPIUTjhQA==
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr2428486385a.2.1788945658027;
        Wed, 09 Sep 2026 02:20:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr2428454285a.2.1788945652851;
        Wed, 09 Sep 2026 02:20:52 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d53c37csm720711166b.32.2026.09.09.02.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:20:51 -0700 (PDT)
Message-ID: <42e0869d-cb28-4144-b5b7-f62bd26b7d08@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:20:50 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix CLK_GLYMUR_GPUCC default
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>, andersson@kernel.org
Cc: pankaj.patil@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5778ae29-9c86-418e-85f4-1bf48d674a31@oss.qualcomm.com>
 <20260908145605.1134841-1-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908145605.1134841-1-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa124fb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=rlEOdTZNFpIyHtoTmy0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwMyBTYWx0ZWRfX2/eXSM12Y+cf
 p4cpObpuw0Gh2QvsT2beYz1Gf+2U8UuuUjYmi32sOPY32xYuVJOEDwUmr8HU7z0JVb/mPfhJryJ
 imc858e+wxFWxBSR1ADnn+p3cIBvp7lmqPk8bZI1Sme85BSF+4xVweGeamlFL7jzqAzQYyz6c2Y
 S7XDZgEozckRi1EO7pBEtyX4nxreKSiz0taPtU555sNJeP0X+6Q3MAK/Ae+GB9WfbETxrja5cQa
 I7eBt5u7QNzIp9xxKfk+s4KMeuDm4IVj+dweEIrcqQ7SD/FlR10RwIBydl3/7UcKnNu+zZzJNOK
 rnKA5PFzBrrjSqsNA8BwHZpfWeF/LajdIThOPtFcSrleB7l6J/8qKmuAfDF90WzAD5q8W2++N1+
 qoLI1MV63K4r9YE3tzG7JJAsXV80OofPRiSM1QVKatgWPR/wy16v1ldl4Wt67dH12kCSG6HpV4y
 5dDGBXzYpWyINBXKOIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwMyBTYWx0ZWRfXyjGhhN4A5+r/
 f6fQ6uxQ9+mq1M6k/ETIROE8q2rjkxQzfZQvWS6GRHOSzem7GwNuxQxKpLMXlY7I1/l+BduPOCy
 ogIEnpqbvkt98pE9LxkIuQW7mhJvcTE=
X-Proofpoint-ORIG-GUID: 5_8n4_r7nWifrLtIMh9s87f4kED1KWX2
X-Proofpoint-GUID: 5_8n4_r7nWifrLtIMh9s87f4kED1KWX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090103

On 9/8/26 4:56 PM, Sivansh Gupta wrote:
> Hey, this patch has not received an ack, please let me know if
> anything is needed from my side.

You already received two, which is more than plenty for a
trivial 2-liner!

Konrad
