Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B820A351C0C
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 14:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782917084; cv=none; b=To/EpWyId1K8nJG3H7+rMWsalACyN+KXPOY0oYc8EoPlheUcLQWXh+2q6KTRJPpbukAmCWcVnrUQIcctN4hJCbA/Csr/Z+pJzrFION4ENXGkKClxtSsQ6A68suVHlxHyHPp4wyjQeXuISmgYqMYfmCOaZs/j4xBoSC13ndjAsyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782917084; c=relaxed/simple;
	bh=1zGBdE2/HidtayDL0pYPSf0Lz0PqkqrshKpG+oca7w4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XIUHE+tcAn/w4Tll0P8Q4b1oGGqRA9r8yHmw+UJSlitQbN7d9uJNurww3VVX6PgYkFT7TquYlCjiQgYVuYjKuCZ4k8Ekp8DEqKb60gIo9HQfUJv35QEspgN2E4+S0boSgXdJiF1/BN0/P80hTVi75rdu49abzsJX9zZLs3Nydzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADpUeB+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWYCVQ70; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADpUeB+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWYCVQ70"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A9BmA763537
	for <linux-clk@vger.kernel.org>; Wed, 1 Jul 2026 14:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I2QgaJ0+AnWq9D7O8v+2m3nVEk4DWTNcCzBfbZBLgLc=; b=ADpUeB+ZqaYV5n4u
	VtkeND0Z+iBaYKqD1XrDbGnJk9bZ2+rPtUxhCEcjQU6gaXa3ltsLZUwYqpS5oyKK
	p9M2Ov/y0ZO+G0mhBGRKTqU/+/qhIIwuyTH7uYI/uVOCx4lmE7Tz05vp9eiTTX2/
	pFynL69TD1GTMPB9URkVsNo/bFQAd7YtdpILtlxWBdgUkYpyGrDUI8Qz8fZvr9OB
	YwP3ZyzKGT4tOCzTpdMU/IPoEa0Bso5abqbHHBmZjyulSsXSFZDbwJPc+fuMyhvW
	PkPdiHJAll8JceCuurbXJT/X3542apEPPCQ4j0V+Ejzd8aiSP1X73Z+2afciAi3h
	DF3ToA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktcp1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 14:44:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c08e9c344so1944621cf.3
        for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 07:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782917082; x=1783521882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2QgaJ0+AnWq9D7O8v+2m3nVEk4DWTNcCzBfbZBLgLc=;
        b=JWYCVQ70SRYWGnmZLqMIX2gK85L2fRU8+1114SMYIvKhcyy5lPEcONgIXUUUuoN/9X
         OQDcGu7KSguf+AhM6qbfUSNFxE+wP3Y331SVVBoF/fAV701JRRA4hNKdmyxqHTAI9+pt
         Am4MBVFmB6EvQVhDL3zSfhFk5J9OYYc7o4rZTWPprTr6fGFVKFD4+tH1jg/AK+Q1TKwv
         JDCPUBsPPWNiDhE5HUKPx506mCct03xhr+f3j8YJL1/TRJi5rp7mxFYw2sswWwP/LQaO
         D0mEfZ4fRz++XRQ8sB2eOiVjDAEyGio6fsw2HAwhFa5Xw11AqQLPbqYHm49xmimFKC+m
         WATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782917082; x=1783521882;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2QgaJ0+AnWq9D7O8v+2m3nVEk4DWTNcCzBfbZBLgLc=;
        b=WIEmS36PLQjoVOyI+MDx+d8cbjaE/mi+PP/V/Y5b24XO2opmGWD2Vg4sWopEv8GQku
         kBspxDJ6zq11VbKCZAJW7k3KBh2X+jiMUpQLsJ2jc1sQh67sL2HZyE5i1Csdw80IvRZI
         0ZEM909er5vigDOY9LTqPZbQCPm+ulEKACc/60/RLSjqbaqUHguOtpPArn+VPgRtCWq2
         WoFExaFJAObf6SoIQjRajbaB0Eyx5i67Ieu+i6QTQDlv66kaERKaSrADUuTi4cDiHLIA
         1SnfGjtgz1K96nj2R1yewq3EVjkL5/5qYCQqg7QbY4/MQEvKsL7uGK50fCCCo/+EpK6w
         Q+AA==
X-Forwarded-Encrypted: i=1; AFNElJ+CbJURXPnhCBMIIUtFS+2RtLNQwgW1HLMn3pVa/s9OAiPMTv2XR/9Gv91U+w0r4G2JRQxiCq7bsf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFkz7t7gp7nwwJ1A5Q4LNhasoHs3N5YHhgrHaE2bK7W6aNDeF8
	4rJC0joM0mW9+elInOP1PFTZHWOEHcj8f46MppERw9MyvLV/wHE926Vz7/gXlPiKbtQRgLDgsE+
	P1de3SATxTMuPijcQ2Tv23O5yzLF9cloAz8tfvHWiWF71f6ssYlGDWYnhC39vXHM=
X-Gm-Gg: AfdE7cl3Fn/cJlyaptcGKowXCuWL+qlkBMJ4FGzRgyXac/N1oyFR+YegW9n+Bzjzwxj
	4HnQB9rO57l3oBTn+4du3lyLLAioM7EqQA5KqlRMZraecS9hhcDVGSZzz9of7l550A0+h21l4DF
	pvdSIoaKYzG2RPdgYDdmpzgb+Jhj4c9I1czFFqil8RM1r8hTeev1F+rVETUjycijjlN9HOjc+/X
	Im7Wj2IDlnnmo8SSsxnbuz1ArKjLgKf0TaaPyLHI0DreJlHU7OoW+NDxrsyOZvLQg0O03rfCYVA
	J6G8mjkGA6/9AUh2aYXR8kVJ1jhsFDZvVHA3/xHYZXSFm2k6VV0xyHPkpPHx889MarBRx1fCMy9
	iP/Fz09PHHoqzR1W6VCEH2yCUCiayuA/YwuY=
X-Received: by 2002:a05:622a:13c8:b0:51a:d45e:638d with SMTP id d75a77b69052e-51c26b25733mr18492951cf.8.1782917081990;
        Wed, 01 Jul 2026 07:44:41 -0700 (PDT)
X-Received: by 2002:a05:622a:13c8:b0:51a:d45e:638d with SMTP id d75a77b69052e-51c26b25733mr18492511cf.8.1782917081414;
        Wed, 01 Jul 2026 07:44:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4a137sm285311266b.50.2026.07.01.07.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 07:44:40 -0700 (PDT)
Message-ID: <07f54b67-6428-4ea1-affc-0ccc45741292@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 16:44:38 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: add CLK_IGNORE_UNUSED to
 camcc_gdsc_clk
To: Brian Masney <bmasney@redhat.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260701-sc8280xp-camcc-gdsc-clk-v1-1-ee28be1e8508@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-sc8280xp-camcc-gdsc-clk-v1-1-ee28be1e8508@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1NSBTYWx0ZWRfX8C+DfASdpfxE
 pT2gVeDW6N45O4Y5L5FOloVBJi6z80MqAg3UaMm9nVX6lNO4JJhRfvKGcLuYgBQ7RTIBaYeYVcJ
 oYE5P17J3yGPYl9YAvrloGKGyKXnXIc=
X-Proofpoint-GUID: v4x3-HcyT8UUynyo0lqT0JDh6IxF6dGj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1NSBTYWx0ZWRfX7Mk33H8qczRd
 ZZYv6CwkLuTFZLOkXjqCzdXFYU6+WTgkC3RS3IKFjM+ks5c1ckgkrN4g0VsGt6I4xpSbYn402wC
 jsnJvGTPaZGrN3SCfientsPQLj1mS/yQSz42ypGpeyIq5kJbt6cvBPTXw+dywZTVepL48JBWM5u
 odawmbvIIclN4gXzYdIq37mejC7zPevcVlvuBhJIqOjB7d4xdq8JqNCL52VjCyblPRUmV7/LCcN
 WMf/xKg25QT5zXYRKB03oxtdEkvDB05rU+F6Fw3lbGTBnWmxjQfCnH2KQpRnZW+x9ueKH5jSkaG
 8Xg8ZV4ZW3vC8Kut0Q/6kheXlpzRFg1UQLcuUfZ5pYzWUoNOiIyCA5f5uk4iXpxOBXjqKX6zk5Z
 8Js7qt3Hh1eLRh8dxnqqWMpBs7IbzdVh21hladEcZ3q9myE/ibmtYJcffD0LWOTwDYSBXzh5x+p
 P7OO3CYYAmTlqWTOC4Q==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a4527da cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VuFW3N86aykZV0Cky-kA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: v4x3-HcyT8UUynyo0lqT0JDh6IxF6dGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010155

On 7/1/26 4:16 PM, Brian Masney wrote:
> With the introduction of sync_state support in the clk and pmdomain
> subsystems, the following warning happens when the unused clocks are
> shutdown in camcc-sc8280xp:

[...]

> camcc_sc8280xp_probe() has the following snippet:
> 
>     /* Keep some clocks always-on */
>     qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */

Let's just unregister it from the clock driver. It's just a branch
that can be online 24/7 (as this snippet makes it), see 

b60521eff227 ("clk: qcom: gcc-x1e80100: Unregister GCC_GPU_CFG_AHB_CLK/GCC_DISP_XO_CLK")

Konrad
