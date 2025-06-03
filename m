Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F319242A80
	for <linux-clk@vger.kernel.org>; Tue,  3 Jun 2025 01:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748913850; cv=none; b=vDePbaEoFCsqUar8dCidEBocg204bQHz5fgdII8qDJQiVb1A2n9p6qg2yuEiuenWMP2j25CllyIyh1pZElU3rY8SHV1GxKJK0auZZLQSVor/dilUZarbBQKX/9em4vhSSVJo+5UfAq1GuPOYqDkFq6sn2OdCLmI3J7yGGYuBWPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748913850; c=relaxed/simple;
	bh=OyLELClNgN245/Nq5nCJ5Miwt7BUMfEFOp/t7OKMqVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZtaR8kviE3NyLZtm/rMSYzY3oNnTKLTzqyAvFP0rxvgfEWc7X7TIbGhuwRGkaqr3zJeEL0RWspQslfkLph/N8STkA+ftOtrrMhnetI4ACewVfgwSLmYjr4VzW+9EeMPCO1g3MAaCrZOFreu/qqSCT/d9gASYrkNvyoNfU1joCsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4Owh0QS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4Owh0QS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJcL7011072
	for <linux-clk@vger.kernel.org>; Tue, 3 Jun 2025 01:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OyLELClNgN245/Nq5nCJ5Miwt7BUMfEFOp/t7OKMqVQ=; b=R4Owh0QSPpVvnXY0
	4aNzkkiJoiL3kpXDcKK5KeQxMLzBK/4/hrJ/YOmSNnXLJuzt8Zk5jKAUrNt5H53Z
	Hum2hNfkqS9FtxsSOwLo1ZlEzqAyS1MX1wR7NKU0DZwSuM2x4N+A8gdlJFQ1+vY9
	0aJjox03sLYUCAoz2Sy20IIIvhmj4QtLSvxgkJnps5Itm0KDlvo8xgOhJIHJdOjf
	h51r87pmsRjMfHvqbNXr9Pp8Wx7ZD1/7eFtfedz7s6/QgBM6FRJ2F/6wqkweZEPf
	vB+57KGZXEz4gkgGJNJorrbmgrDeL86tzNOkc9WdVEpekeWfU7eCcu4H0YFIiRWQ
	KWtlpQ==
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8q0xnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Jun 2025 01:24:07 +0000 (GMT)
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e8128d61056so3424163276.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Jun 2025 18:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748913847; x=1749518647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyLELClNgN245/Nq5nCJ5Miwt7BUMfEFOp/t7OKMqVQ=;
        b=ZhC6BDerJeXcdCBet226OBQbQqxmQwv2LpSHwtN3thvHDB6J5ZAmbSIB1qwAWhBEVD
         rIoBmOeF3CKTCjp141jKU4/ZNV1nTiCUYAYCrqv4TUgTxFOxr1LNDu8PUtkkRo3z+EKO
         +BWh/3UyhX/4klF3rkiHYdyXlUokoAa8xDRPheuVsAZTjroC0BkaCohB5btiGD4k0bMh
         B48VdLqM93xD2O39HvdbnPXJWgccA8HzOxaM//zhmZ0uMoRlsidnKxpFsC2YlvrDMpAH
         hsZRnKIEEWiBMMcCr8hMYP9GIXnMsfA9zPkxPd41ee0hGj7ShQlq+XAregTlwar0wl5n
         mJZg==
X-Forwarded-Encrypted: i=1; AJvYcCXI6UvmK/T1Wku2n4+4aTz/RJGBjK9dPUQewAd7qWLXmiUreyMv8mzuygfSW4KfMK7LladwByfCimg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi8Kp/YXZyGhiFO7zl2efu7ikpFwHr5S9aQgJ/UwIlYxn3yxwA
	AQB48djqZZFGhmtvo7+lQnh4Q1bSnVAUrkKommEdsP0N2TUXMDiLGVJHZrYdMMqTdD6IF0dH7xZ
	V5Vs0V1iseTzFWZrSqJ0NiLDN5cj2CT46BQ6Su9zq3qNY86mA5OvmB2GQZ9DrPf6/vFmFsaiPq6
	G716rnA9JPWSARG6M/+yK9JgeVHaCErnTdcOnxC0LNyb7pPa/N
X-Gm-Gg: ASbGncvQr9eOyMvKugwjum59npkTcfGt/4wzQ23VNhylK+EsHN+ow6J5zLFJCt8fDCO
	GT2joCt9CPzAGPFGK3D5A/YSxFX+dA+Y1VW4ZjnkjYxgit8L+EIJcYwsEy6LZGCL+ZVIKgw==
X-Received: by 2002:a05:6902:2846:b0:e7c:3db3:9ae2 with SMTP id 3f1490d57ef6-e7fec8c20a0mr19439359276.17.1748913847058;
        Mon, 02 Jun 2025 18:24:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRNXmgUXa56X84DDPzBysWHhD8lC7DaZh0a8VFTs4nS/AwD2eUZ7nzp+zMA+ugyIU7MwMpkecY9Z7FF+IU+mM=
X-Received: by 2002:a05:6902:2846:b0:e7c:3db3:9ae2 with SMTP id
 3f1490d57ef6-e7fec8c20a0mr19439342276.17.1748913846769; Mon, 02 Jun 2025
 18:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201-topic-ignore_unused_warn-v1-1-f29db78cea3a@oss.qualcomm.com>
 <93b5004dacfe1151ca3abbb0fa31eaa6.sboyd@kernel.org> <87241686-90b5-44fe-b4e9-1a59451e3575@broadcom.com>
In-Reply-To: <87241686-90b5-44fe-b4e9-1a59451e3575@broadcom.com>
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 2 Jun 2025 20:23:55 -0500
X-Gm-Features: AX0GCFvMMl0IyBy3E3FCayY7kJ01cr0tAWgjWudVIiCu7u_i2rt18DwZOdpPk_8
Message-ID: <CADLxj5SfR90nYWaT19G0wGWM7zw7v91=LBHjZzb0z0+uERcXVQ@mail.gmail.com>
Subject: Re: [PATCH] clk: Warn (and therefore taint the kernel) on clk_ignore_unused
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: SEN4kZ4KqVoXBPCcImkZhHncjDzRwZ9v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAxMCBTYWx0ZWRfX8BEk/N6qmoZm
 H5l42V4iNI0dKvA6AN+Xd2hXu0VyCbYXMOWMhL2tqGlXX6TxsTx6suveD+gJ+dPSw6reFD/wyZ2
 /Unq+2h3vUa4UJLGxpq1RYnvThLtpE+V7a6x7b5Xm+8RJR9xfD3WJHg7XCjz/jH2oVqswkDUYc5
 0+xdj/uRDalrj3SGxUgZKsOdjQ9E7kb7sSgWPodiZfM0wRdY4pIhtxoDZDMC5f8C0SOwkfjZlsv
 l/KxBbZuJlstNDgeYG53+3nb0HLY2L3k7TLOHGAcueqTJYaxjDgIa26CCvi0Tg3P15MFgSt9ubN
 eopnB5Yu68hL/BuTFgllMrwUizsao5t3PqB1e2pAblT/yR8959H2+/BFffNAh6PMI8G49E1XaSE
 dsYupUI8YMS4K9YWv41GF2KLWfyLPU1wT2NzgT/TPFGARSqgkdUBq2tgp84aBXROd9cuaxDz
X-Proofpoint-ORIG-GUID: SEN4kZ4KqVoXBPCcImkZhHncjDzRwZ9v
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=683e4eb7 cx=c_pps
 a=5rZgxjGdQ1phXw1xqkF1vg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=Q-fNiiVtAAAA:8 a=WirCTdtIKr2iH7wj36YA:9 a=QEXdDO2ut3YA:10
 a=FvMT9AR2qkiEEVpopuB7:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_08,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030010

On Mon, Mar 3, 2025 at 5:16=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> Assuming you have a clock provided that can be used to turn clocks off,
> and you did not boot with 'clk_ignore_unused' set on the kernel command
> line, then you should discover pretty quickly which driver is not
> managing the clocks as it should no?

clk_ignore_unused affects the behavior of clk_disable_unused(), which
is called at late_initcall() so if either your clock provider or
consumer shows up after this point the disabling of unused clocks will
either not happen (because the clock doesn't yet exist) or it will act
on incomplete data (because the client isn't there to reference it
yet).

Regards,
Bjorn
