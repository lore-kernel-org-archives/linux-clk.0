Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C0744BCBB
	for <linux-clk@vger.kernel.org>; Wed,  3 Jun 2026 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481701; cv=pass; b=HphSRsBL3xPVFmEZvqXytDfCsDYPHhqVNgnt3UHj4a7aN2bG/JCX2sJA6mXLyxXw/McK/2COWXYN/3vA6u6fq4B+L8X719i91u/c5WPmJ+f13WZfqQuVnOFakFF97aL0K/AvnZ8BKjTpge+P3klNuSgVtdRP5hF71sNu6l/AgUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481701; c=relaxed/simple;
	bh=PUyrwgnvUcXnbFOm8tl59p8mT33ommTvgNayNM2a2hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HavonzIU/3ULFOm3xVWozY6QH1SWNwOh/S3AL9QgFMCbgxQ1LmWWdo+jLjG6YrzE0to6nRcm3Dckahhywqp/zsbKHmOQ/YMxo3HORnlE54+w1cTD6WEXE9CJPr/YxVx5VC/vCVTUV8GpcENr+oZuSRe2yC38+g7iGjZm4cWQ984=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmAGzEcN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7yqXGgE; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmAGzEcN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7yqXGgE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536Rdrv1200538
	for <linux-clk@vger.kernel.org>; Wed, 3 Jun 2026 10:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G5uoXQRR+x1Y1NzAuMH2inF+ukyI5BxIekcDkuuPxWo=; b=SmAGzEcNzMg6EFVj
	AJxaoFZzHAlq3ByG7/Al8YvqP1vWkmRutw/OAjR4YxtfS3B2Ymh2GWsxwnq71NBa
	h2UXk7QxDOu7UtdUSzPwrvUkENvND2wgWHL9TbcIhr1yC/aGridG4+njldF6JQ6j
	ZQzMai1HHyZ1iw3tXnZUJl31CyDDfvcGHRk1vZ4Wx2UJb9KnsV6x5w4JzbiozVd+
	xVhpVP5oyBtADnKRqkrWDNyojEGs6HOx1/DnzpPJfz46un779MUCu6D9n8IH9l0I
	1ub8sAGJhafr6IV+vflXwme6o8VXQxYrq0jnup6Tw/4K3FRxiK9NAxGW1PvOZg63
	yTCo3w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw1gnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 10:14:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174d1b326eso12130651cf.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 03:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481698; cv=none;
        d=google.com; s=arc-20240605;
        b=aVxJjD2di9IEkh5KdNceCuYhWJcQjomESA/dB8AXG6A6VTgjtQl9059J5WUL4euDjS
         tvvrVUy20B99v/z3Fc20nYQSOdSomsSLXkScQWE72PsAjP+6tdbZop9PtFCdGQQinfAm
         CZRBOA5odG6p19XrU5rMCodJPVJCbB72Z9z+qvAPhXYn8EKhmMttC1xW0hz7cGAsx32Z
         quio25vNQh4pYTO2J9PZfO068l9IgF+QtcJYm4/eGCAZkTKIi4hDkAWSiNqnEdL4EdgJ
         Rczr+ivb/ha/1uYuQ7uVy74SNZnkLZLqeM6E3ZOZ+tBGgRKmDLhSB6NOjJMVRxkXjC8u
         rmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G5uoXQRR+x1Y1NzAuMH2inF+ukyI5BxIekcDkuuPxWo=;
        fh=/b7xTX5tf7WVIWb/3bL94AqjHsdskP9dxTwggRvD90I=;
        b=NQUS0PWWfFaITpYqiktENnm2Rm6VzdKYOyr3HKMRyZnNM7KCh8l6N0BF6f9Qwm8c9K
         YgEIKwBIO0fRrpz2RO2apxgs3SUT12XAQF9N3LY4ZFk0wh+U3nL1Q9V0Tp+JTCGaFhCF
         EbPgUaYYYNxopUnRUacg2VvTKEA5fh89E/KgDacpGB26kLXVd/ER4T4Rf6FQHKdh7y1c
         VtnRg1HEfqsVj1A+i7LmoAd6lRt+/b0gwuCbk9aTsQ0d8WwFB05LaoO5VLgNl/tyrWX4
         d6TFy/nzKLYtUsPrR+c1xkpYd4qK531ktwQuHHS6b+TiJZHZ4YYU43YHABzvJ+WsYnyH
         qmbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481698; x=1781086498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5uoXQRR+x1Y1NzAuMH2inF+ukyI5BxIekcDkuuPxWo=;
        b=L7yqXGgEzKbT+Z53lCtWsZ4riATNiWlvH0vvr69d9EoZKo47qmpt4bSGmZb83N/Dfx
         4+8tJbAx57NviFstoI6bXwPlMqj5exYS/BZT84QXQPHdIOHYMxSDDLJFco3qVkKJ8iAE
         UVrFzYIH3YzFL4CqP1y4SzvkwmE/0v7o9AMQ/dJudaIndExFbaRKeqnLEYq97U8zDM5H
         FoAzwlenzqNLawbQ2bH6foYS4q0YP8fubecZyufG2JqbIk7n4fjYhUGAMqN9C8cOpggy
         aiTGNuSXM4+y2UDMeabGBR1UplsscYr6YsrE9VlVNIr4OeRsWkah7r2lGTO+k7TUkdF3
         vCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481698; x=1781086498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G5uoXQRR+x1Y1NzAuMH2inF+ukyI5BxIekcDkuuPxWo=;
        b=A/aWA0LbGCeVf23stC+nVEt9Q6lYO9HIrYmz1UR0OO8gk2E5kcmBhKVr8DgdiW8CE8
         9yGiwcHyVTazZZ2agHO75cdlixN8WI0fe/t5Ia2qLOW8YbY7ZlpVGKKVv8F157QhqpIq
         cwW/NbmgmsC9GYtLtI2vNAfn+cndOBXASTJov+IqxISoPNYEksNqJN8QiG8wync4ecOt
         LpizWp8Hp+8f5K+oEaVC7gvnpdfIxObKO1NkRFLWTb/0feczSwqn2v7m5NAzDqQkm7rl
         U+8R0E8MmPZbuj+beH/Lcy/jmMYU1Rz50QkghtwqI71LuYOAMOuZ/Ebt1gxKo+VCyL9B
         T2mA==
X-Forwarded-Encrypted: i=1; AFNElJ/nYa3N2BoXr6P6d8JgsSeks+HR16K5EsIL6hhae4IZmGZyt+MhR8mw9hkv6zlCHtLcVTTep+kW/BE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdGfFRVbk8REZQqBs+xyLpABweo6echawWuRirLE4vn9RvsUQ0
	lj35a0+dq66HbAbnzrvPT8/AsVZQB69/HQt74bS/kzB0F8werSf+D24Aj/eHiQvFUex2ddhVtrV
	9NIjJB4610iMIP9bJ6C+lpPwLKjLuYnLpD/s1ngYN5B1EZsv6cWYjYXh4lhCDTIyfafzFBIk2Yj
	2nf5B6ahI/D1/30Ff03LyvCOJtFIb/BTQa4v+qaQ==
X-Gm-Gg: Acq92OHPCApUmFX9alUYVrMXsnqPttSJKr1NpyQMccHm9wh7MFKLyOkw9E/ZRVSlFw0
	xOmVf98MFNXY16iRx9+mzV2BwQ6X/4va2WAbNlcBUxVhs4/696mISUFVFRFxUPjh6iY0SHSyYY+
	oo7kwFn/1T6l45cLbkkfYrGXxae+CMBqqodauJqieGo+lDHlEgjpus1d/BvwWz4tFM5pYe8UL/4
	TQV40IFH9S4fzD0
X-Received: by 2002:ac8:7dd6:0:b0:517:6afc:b644 with SMTP id d75a77b69052e-51778770b85mr39837211cf.47.1780481698262;
        Wed, 03 Jun 2026 03:14:58 -0700 (PDT)
X-Received: by 2002:ac8:7dd6:0:b0:517:6afc:b644 with SMTP id
 d75a77b69052e-51778770b85mr39836981cf.47.1780481697866; Wed, 03 Jun 2026
 03:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com> <20260505-clk-determine-rate-noop-v3-14-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-14-f3f829fbacdf@redhat.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:14:46 +0200
X-Gm-Features: AVHnY4KYEhjVLt8HCP2S1uMOezJVDgrkFC02GzF0MnbWrCfiBI8GGzmmmTGcP78
Message-ID: <CAPx+jO_E4XLZ8s8iuMXwUg2pXZKCo7V+9PWNyX=NmUnv3QG6bA@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] pmdomain: mediatek: airoha: use clk_determine_rate_noop()
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: hGgVCgxyNG0rucgK1aQHjWuksox-Yhja
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a1ffea2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=QX4gbG5DAAAA:8 a=IpJZQVW2AAAA:8 a=JfrnYn6hAAAA:8 a=qVNBMPF4TgRESbWuf7kA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX80DGr5fktxbV
 7CmJIZnw8x7wPVl8MHMA+bhZYiIc957BBqopCrmEv7qsg9v0qXikC1FoNGa5+W/H29WBGgWe57M
 xEaQXM5yzZSeTS3DhsmlmthGUYbKH6MHQSYn1oF7+jHol0EFUkMXnHGWxPFisbLBqS9ax2BmQhL
 BW1o2ZW0jWgrFzv85Li8FpQCZqMVODuDL9OsCY6wk0ZfNwm8dozJnFK21awJ+fvejYPiKmmzGRT
 CIsmhwfHpsQQm1XtKJBKuDfeJuIplB0TI0QMKYPLjmW31IpMZ8FOm7fLEl/xJAT8RbsK0K7cFJT
 5Fl7xfHWsl8IfBWruWgpmjibi0tpIeTIotchKmQ/uBiqHCfgNwNtswz7zrJUUQH5l+3GpZ5jSAA
 Hz7wXo0XVk9jVCJljDxmBPNpNmuZvCAj8q+O2SCd9P4QU1LICkjWmy7GpzXvShSEde6j1ANBlzB
 pwLOqkfnxHYR633ECTA==
X-Proofpoint-GUID: hGgVCgxyNG0rucgK1aQHjWuksox-Yhja
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097

On Wed, May 6, 2026 at 2:49=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
> To: Ulf Hansson <ulfh@kernel.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> To: Brian Masney <bmasney@redhat.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> ---
>  drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c b/drivers/pm=
domain/mediatek/airoha-cpu-pmdomain.c
> index 3b1d202f89dc..5efd7a38f4da 100644
> --- a/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
> +++ b/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
> @@ -21,12 +21,6 @@ struct airoha_cpu_pmdomain_priv {
>         struct generic_pm_domain pd;
>  };
>
> -static int airoha_cpu_pmdomain_clk_determine_rate(struct clk_hw *hw,
> -                                                 struct clk_rate_request=
 *req)
> -{
> -       return 0;
> -}
> -
>  static unsigned long airoha_cpu_pmdomain_clk_get(struct clk_hw *hw,
>                                                  unsigned long parent_rat=
e)
>  {
> @@ -48,7 +42,7 @@ static int airoha_cpu_pmdomain_clk_is_enabled(struct cl=
k_hw *hw)
>  static const struct clk_ops airoha_cpu_pmdomain_clk_ops =3D {
>         .recalc_rate =3D airoha_cpu_pmdomain_clk_get,
>         .is_enabled =3D airoha_cpu_pmdomain_clk_is_enabled,
> -       .determine_rate =3D airoha_cpu_pmdomain_clk_determine_rate,
> +       .determine_rate =3D clk_determine_rate_noop,
>  };
>
>  static int airoha_cpu_pmdomain_set_performance_state(struct generic_pm_d=
omain *domain,
>
> --
> 2.54.0
