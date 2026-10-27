Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793125453;
	b=sBfvy74LEmyGoFzTEgNJi7FoAHxAye5DweGYEqXiLBtYLyj13fl6oVY9XsA9+mROyLgt
	 OMFXuw4NW6wIUXfJ7/kz5/F+Pl45FAZsbwyuLq69Y/Cz5i+AkpFUwImy+ksp/Oe/oNst3
	 VVXZSp6HhcuvlJNlp+ev42gBaifxEXbDGiFH+G0+ZyrwoCP+h9l4SojE4oujk5/2tHo93
	 9ozEI2dhLmwaNT4iNodpORYu6xZzK2/iVfc+EIdAflfhNl1SsWadyvs24rGt28zg3XmBQ
	 rzlTemYh1+t08DwCTD75hLxw2c/Yde0+WNvhyiSq3pw3QFch9XeB9F2StYe3WjMjp3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125453;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dKrXUpS5lY7XH1tqSJBOhITY7Qjt8wuebW/mqxCfCJ4=;
	b=J1gdfWxrgnGptl75me8VHnh+Rxxqa7Tdru8aKe8k6Nd3lONNJZWF1EImxJqbGV/qsfWF
	 x4r2xXynvMNUgbWTXsUfnGuCGRpjPOSjQq/k49TA7LC9BHVPPx+0BI2YC/boa0G5Ri7T4
	 a8VXgrRLMtBkG/mJEBWUzxPq0f2ncvAlqdkhmZNz+AsgSs9nNpqiPCXMqLe+Ko6Ww1j5M
	 XeId0JIe9HC5zfN8mbBzngNQsGaIKzDstR5REeVjeq9e7WPlt5PLFkyaj9UXKR2yzwJRQ
	 RRxvBAYMBCab4Xwlh364HJAZ6tDNlfDPWNUv5uqJ26uh7/VcQHm2APnYVSVAtsMKBnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfzegT8l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPU2y1ei;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EFE606A31A
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 18:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35EFE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfzegT8l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPU2y1ei
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHStK2451872
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 18:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dKrXUpS5lY7XH1tqSJBOhITY7Qjt8wuebW/mqxCfCJ4=; b=BfzegT8lQWr5KYmL
	8E/TvsxHhIK8H80cdTpoCVaePf+2gHjqNG3Vi9jpf9iObLVt0IN98de2RmDVZ1h4
	RxUHXeoq9nRKe8pBISqgkpooJGde9zmxZV1UiWcMzR7tLQS+B+XV//nNKXkG4sHG
	zUDmMhizlQupnOG74fSRoY76e5kSx2WSz9pSR3oUUjErJwGUd2rzrQlgN0wQfMdt
	lLtwjmUp2rS94XAEAQY9RCt7ZE015xpmDOMWV/CSWSOHGq9MMFrzP4hPSXSQzpw5
	dyHgJDRtBGlXkPyLZmiD1G3022BvJT9jhunlS9TJXsq0yD3XTr3IKJwXMEnHauI0
	f1ejuw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g0m4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 18:24:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so439261eec.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 11:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793125451; x=1793730251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dKrXUpS5lY7XH1tqSJBOhITY7Qjt8wuebW/mqxCfCJ4=;
        b=FPU2y1eijUijHyfp9tjH+qmGD2sndkRgLwYXoPC8bTl03l+PaSXfz3w2PgZZsxS9BY
         U7YaOmpUKfzhiCUok+nBtgRfmTyq8RwJhY1Gd1VLEnU3m+1tMlafSDytFTu9fs3KFEpg
         5Bb/y863smfghlwLVqAmH/N9YT/7dWBcVj3mHAtliK6EJ7psWR5X8872Tsnvi6JN01Pj
         IqGY27Qt9zHo2Z4GJApzBFuUmAUXhSzkKxMw4qrgq0h7gPzDTsjTx7hcMouA8Le/rtw0
         sMRaWUA1jV9Yrzg9raBECO2ScfEamQ6e6h/WNYwA3Ny4/irAwITOu/4uUsy01nIzG7Tz
         /YQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125451; x=1793730251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKrXUpS5lY7XH1tqSJBOhITY7Qjt8wuebW/mqxCfCJ4=;
        b=R2fJJ6UiviVwg7Dilffk3N/i6J7fKv6vlWIKx0cwd09PaiOMTABsoROkqRKBE9ezHs
         2Gn5N8caHpZ14P5t2GptqXI6kHVZoBFEkxnInhZdbTbG3Bixj7nc27aU1L3aX3jV19pI
         HdwVczKQg7rWhQlHXLV9/paOQ+YwMOZlP/88GlcmogPkEKg8PzDHQXOldn+/tX6HibYQ
         hp//qHLlE8Jk+LLVCXXu/Z1ciCxAu6cgB6TqxekWm/eLdM0ZHbDgjKCSHcafhIoM5S9A
         3EkTv4aPSr7oWOp8QQ1fcZHhpWz4ILmuHKWfiZi4fr+HblZMiMuBlGJ67znKB1kvq3iD
         EHRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFOyXPGFfOncyZw3JZVjoTiY4BZj7eOhGwHOl8V1OTzAXSMJz3ieeMp4flzl6+pBkcREOSH+O6h94=@vger.kernel.org
X-Gm-Message-State: AFq9FYLa5OCT1/Gc1L0JKL1ppOU1ybHoXaG3hIber6EwWYZ9CdtNh0K5
	AlCcetfMTc2s10tCrXHFFrGHzU+3JvNalsI5le2YUoOkpFYm9dIc7rC0djS7N3BEZ5HdcT3FLu1
	2Mztb40TVsTaxR/WwkzgJ403vSg9q+nJ7toPK4rEHbWCrzWuccGApmdm4KgDsheI=
X-Gm-Gg: AYBFou2Dmd0PeHnPeBPSO1M4M3/y6kkK6NB9jQDo9s9YgumFOSy3Z/WZtErrUGcBIXe
	gYUjQmqkf++N3meNWcutc106R0+IK1M704uYhymE9cjA1Bc9prlFq3zhnxFYASZquAtFkhJ4gfT
	bSqFTe14rir49CIkN/9v6Ni/46nT6EYn99NdD8oVbqo9fgbA5bc4PllcZkJFBxhSU29ik0Ckgt6
	gMRengRKjva4EgoWmS8D9nRzu43+gj4ahT1sEimMAZD4a3XXv8dOfHkKIadraDtf8kHFccb50zZ
	aLlDVq/f1WflW2ZIufO2Oq4GSoeYjz0GqDm6dahKTmy/iI07ZHO6xsuxkGdH93fl7LAhhDNoJew
	L/2C5EsUSOD/tulpvJ0qj62+7vcQ=
X-Received: by 2002:a05:701b:4349:b0:194:3a84:e67a with SMTP id a92af1059eb24-1a6ce2fec9fmr43961c88.41.1793125450574;
        Tue, 27 Oct 2026 11:24:10 -0700 (PDT)
X-Received: by 2002:a05:701b:4349:b0:194:3a84:e67a with SMTP id a92af1059eb24-1a6ce2fec9fmr43925c88.41.1793125449897;
        Tue, 27 Oct 2026 11:24:09 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.196.2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm34006142c88.22.2026.10.27.11.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:24:08 -0700 (PDT)
Message-ID: <d0492d0f-42a5-4400-80d0-987086d7d224@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 23:54:03 +0530
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
Subject: Re: [PATCH] clk: qcom: rcg2: validate frequency table entry in
 __clk_rcg2_shared_set_rate()
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-rcg2-avoid-null-ptr-deref-v1-1-43c21b54cfeb@gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261027-rcg2-avoid-null-ptr-deref-v1-1-43c21b54cfeb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX5RC2y1SH0HFr
 IAzHoTRxLRoeHTIr+1n8Lfp0qzpOSOt6Tk7Gmuj+mB8zjAUQtAyC0gBREcu7IsM2dZ3UbNBPMT/
 5zRaAjvdCRquWymT68g6DNQv5tnzjxNeKR2nf5O2HW4uhgIgOLWhzbvePdEhCWXWPdW+CcE4r1L
 ruDUVJ8HOh8hAGZCg55bmKzGKnjW6bpA1uX7YQEftSNLT3dPT0KVdK7VjhV/xM2lk5+SaxdrImN
 KGHfKvXzD0J6rIZOE65yWUrMn3G6XMJSNEDeom73tLHI97Kld5ExSvRWhPQftFTCmgDnAArAFTJ
 pfeOQ0SGfPrHAGQrZq22mwbmNJ4Fhp6UtywIHhmkXa9hHWDsyw3MGEwippCmnvFgCVYXfEnkmzH
 rFnc3BH9LJk08F2CCzjaXP5vC19zGzv17KZ29tTuiK3hETvFHipmdXCIC9WSlR9khjYwRIa8vQm
 ANNinLPHqmr7JNNQGsQ==
X-Proofpoint-GUID: Qjcb62JTmnZV2CNFfoYbwW_UDSw-cWK-
X-Proofpoint-ORIG-GUID: Qjcb62JTmnZV2CNFfoYbwW_UDSw-cWK-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX2gmdhGKg6GEu
 ey/f9paT4VvNAJ/CMQhjqzlgwmAZlL469ZNgT1Tb9V5VvGghmklxMRdKZDDiedVx0gSRnrLUebe
 UTUVQvzaco/YGTuiKuGT+lqO1drKjiM=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae0ec4b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=QnKtIixuteL6j6IxG7zQig==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=i0tAhZrUCOUqKSMIGdwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270073



On 10/27/2026 11:35 PM, Gabor Juhos wrote:
> Commit aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
> removed validating of the frequency table entry pointer returned by the
> qcom_find_freq() or the qcom_find_freq_floor() functions.
> 
> Since both functions can return NULL and the pointer is passed directly
> to the __clk_rcg2_configure() function where it gets dereferenced
> unconditionally, it could cause a panic.
> 
> Restore the sanity check removed by the mentioned commit in order to avoid
> a possible NULL pointer dereference.
> 
> Compile tested only.
> 
> Fixes: aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/clk/qcom/clk-rcg2.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index d7914e59129f..260e90f53461 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1385,6 +1385,9 @@ static int __clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
>  		return -EINVAL;
>  	}
>  
> +	if (!f)
> +		return -EINVAL;
> +

Normally, the CCF calls .determine_rate before .set_rate. The floor
determination helper already rejects a request below the lowest supported
 frequency:

 ```c
   if (!f)
      return -EINVAL;
 ```

So an ordinary clk_set_rate() request below the table minimum should
fail during rate determination and typically not reach
 __clk_rcg2_shared_set_rate().


-- 
Thanks,
Taniya Das

