Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F292628C
	for <linux-clk@vger.kernel.org>; Tue,  3 Jun 2025 01:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748913650; cv=none; b=VFF6YKFPsuKaijopFk5TbunGtTEhXGhygjVq1CeIkwtXubLD4iUkHmFsfEwMoBBn7mESGqc/+azCYhYsa4ZYxXxpE9XQ2dwJCF3uA4NwVUVMsCufdDgSOKmyCj8HpreaIaUKq05hkYEGmMHEvuNfbBkcYT1Ao0WGdFBOI7gRMV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748913650; c=relaxed/simple;
	bh=VE+nhMtYbDV/EMRZgRGQbRzYzLn6vPrGVdIaal0ehfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZyig7bei7rvF4MbPrrINJPsJgvfPTXwmEkhShPK5EmW2N3MPPJBFxk5LbTGcK7AbeJTjJn+DrSkVnIXX/tjTNebJbJeShqZ2HRSUv7VgogPyDb91+n/CSQRf0tgKwVOZ1dB8WOIvbxvP76Z6xEs4bJYY7no9LYqgT0QEIgkZ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZBepW4K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZBepW4K"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJj9M007549
	for <linux-clk@vger.kernel.org>; Tue, 3 Jun 2025 01:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VE+nhMtYbDV/EMRZgRGQbRzYzLn6vPrGVdIaal0ehfU=; b=EZBepW4KEcCOwDK0
	YqEAt9rqJs9WVD8leP92Thg1nts+tR55uj3RujIlrW3lOY73E1T33YV7JR6kMUxw
	oN+xzxdlq5uam6MGcTejVxiGlzrVKuR+FDDV6Bsxp4KS1iBVQ//K+vdfz6glX9GB
	FRxvupUo8/LmV/FVdth/01hhROgHSlCpt0fnEtESOK9XnhSyr4kL6kSWzv87OwR4
	r1NzlqY1MWVnrBpT5zYfaU6av0Ljct3wzfTLy5eXDTb26guvDruj6WzWl7GEMlzo
	fDsK1sWOm/WYCKKLM2lOIvDGMnO+mMhUu1hA7NlWskaK7m49xJu5xY6tse0QaTih
	0TMujA==
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t8xd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Jun 2025 01:20:46 +0000 (GMT)
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e742cabfcc0so7340213276.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Jun 2025 18:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748913646; x=1749518446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VE+nhMtYbDV/EMRZgRGQbRzYzLn6vPrGVdIaal0ehfU=;
        b=SYq0HubTRy8aUOoLZoIsJ56lNYVAIFmiCxg0iWHtCDDSpk6/f4HSH+1JIvFjOv8+9A
         OzJ0E10NUwdILuhdwAsw03kc1m3LiY8wN/PNZ/OBcv0D9p6QhLIVgb3YXv3ouLZiDFh/
         AeFZpF9+2e1BDIzkwCPyo0M57bnpRx+MoKqKlDPrcEMUDKfxuoGguLDMF/ytOX8wo0tj
         SyGiaCyBhkBwHAXUWnTD25hMGI7EgOcjJwRoYt9M/Im/E7OLkZWCbq2oYYxcVGjjAKBA
         XkToVeFNZt4xJpGwRyjOpeMd2wTELJsU4mX35ITX3qz5t0/8jpiZQepD/Fz4dewr1pXd
         sMZg==
X-Forwarded-Encrypted: i=1; AJvYcCW0j4f+0zM1gRZas+mLWkUANJmpvbWCOsT1Uis0e4qp+HvzNlSZEDYMWZ6AGesCjLHCCSvw4e3bkSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAu3lK1UK0oyCmbwwpx1tOxrq47+5C4U5D8c4xzlxz4NLwZ/eO
	GE9wEvEP4wJp4aUvOlMhpAB0camqXP5DSQ5sIdxtFWHOsgMKZ4DEM/RdUu4nm5af6WU35oIaHAs
	Db6SeKP/J8cggUeCEy2sG4pRmQcAQ+YkNQVnE5oNP3Hj9qRZ3scLFZnM94EUVXDztmDklX+RwJA
	WxS3k+7S8gh5zM0qh1CWC7MxZ6+0pMePqfQDD5lQ==
X-Gm-Gg: ASbGncvZGCkJssbIQmxpL3BPsL9tmxNswAKZGRTPPRM0QGabBU5ZAGMJk/GD7Za0dnc
	dRAqjgsOmZmp7AGSQfVSSdo7JeYKWPUyQ4OEfwz+ytuH4+YuzhlkdU2JYFuT6f67fo638EQ==
X-Received: by 2002:a05:6902:1003:b0:e7d:7e4a:24dd with SMTP id 3f1490d57ef6-e7f821a2fc5mr22012105276.45.1748913646332;
        Mon, 02 Jun 2025 18:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPmAlxmvcMTiK/XDr0rnfNiCP56keNN/57x6ceV4nEFPyGnFA1vocZoTQcJKiotEyeUzmiKqgvZWovkOBQytI=
X-Received: by 2002:a05:6902:1003:b0:e7d:7e4a:24dd with SMTP id
 3f1490d57ef6-e7f821a2fc5mr22012088276.45.1748913645973; Mon, 02 Jun 2025
 18:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201-topic-ignore_unused_warn-v1-1-f29db78cea3a@oss.qualcomm.com>
 <93b5004dacfe1151ca3abbb0fa31eaa6.sboyd@kernel.org> <87241686-90b5-44fe-b4e9-1a59451e3575@broadcom.com>
 <CAA8EJppgU7_BoVCDfTuKVveBnnhtHUN6jEzkUaAou7=aypD-Dw@mail.gmail.com>
In-Reply-To: <CAA8EJppgU7_BoVCDfTuKVveBnnhtHUN6jEzkUaAou7=aypD-Dw@mail.gmail.com>
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 2 Jun 2025 20:20:35 -0500
X-Gm-Features: AX0GCFuHluwTsP7oLiyvKLnMzG_WoD3tJgykr805F96nO8UQuJnf--QyhpYzhjU
Message-ID: <CADLxj5QnVKkRotvKXNFaORqiQJ1oNPm=SpDzWgnOpWgOcXse5Q@mail.gmail.com>
Subject: Re: [PATCH] clk: Warn (and therefore taint the kernel) on clk_ignore_unused
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAxMCBTYWx0ZWRfX/hnumZtKxY30
 K38Dyh6zwkVLqvCiYOLi3W969cqfSsQVcLcNOsMdn3yJErnW/FRkqgOYgrkWUAQU8PiEBBNOgQA
 /V/Ga4SyUN95N/Q8QdRKsgi/zi+fed5eEGHalzEcKEI+UKZPVQAmL+B8/SKuwsWy+BDoDqgBbyw
 2JpgHyLmKlc81h724llWl82nsBbWtQlh3+ZoNtVHzUG+MR7q2CN8NeN8pIW7+P2eup4kW/j3ypc
 gsusXTMzTXy5+LwqP81LoTBdBXwgGB+Zqjv3ippOPpX6r1C0NJwoexH+MfvBlswgRMJ5PQNJPLH
 xMM4+BtkZLd4beK4s5oA6Ij/oBi5uXApXb2QTaTly4muhOF8novGLwGYN4rAFS1U3ZbpIKso4hQ
 UKFgP9Dd7oaZZfRmbNMUdeWwEm+tF4OnXx2VzOtWhrR6i53eyx6XS1xsCWjzWv9/TYNz8wbz
X-Proofpoint-ORIG-GUID: RDfN5jTQ8QYbnpc4_-8fe2RDXpfX2uFq
X-Authority-Analysis: v=2.4 cv=OuxPyz/t c=1 sm=1 tr=0 ts=683e4dee cx=c_pps
 a=5rZgxjGdQ1phXw1xqkF1vg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=KKAkSRfTAAAA:8 a=Q-fNiiVtAAAA:8 a=EUspDBNiAAAA:8 a=ecN6cws7RnC_jEw2w0AA:9
 a=QEXdDO2ut3YA:10 a=FvMT9AR2qkiEEVpopuB7:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RDfN5jTQ8QYbnpc4_-8fe2RDXpfX2uFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_08,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030010

On Mon, Mar 3, 2025 at 5:17=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 4 Mar 2025 at 00:16, Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
> >
> > On 3/3/25 14:48, Stephen Boyd wrote:
> > > Quoting Konrad Dybcio (2025-02-01 08:52:30)
> > >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
[..]
> > >
> > > What is a user supposed to do about this warning stack? We already pr=
int
> > > a warning. I don't see us dumping the stack when a driver is unfinish=
ed
> > > and doesn't implement runtime PM to save power.
> > >
> >
> > Agreed, I don't think this is tremendously helpful given that it does
> > not even tell you what part is incomplete, it's just a broad warning fo=
r
> > the entire system.
> >
> > Assuming you have a clock provided that can be used to turn clocks off,
> > and you did not boot with 'clk_ignore_unused' set on the kernel command
> > line, then you should discover pretty quickly which driver is not
> > managing the clocks as it should no?
>
> Unfortunately it's sometimes not that easy. And some developers
> pretend that 'clk_ignore_unused' is a viable way to run the system.
>

A bit late to the discussion, but I think you got that "pretend" part backw=
ards.
Some folks pretend that you can run the Linux kernel on a platform
with clock provider or consumer drivers built as modules without
clk_ignore_unused and have a reliable outcome.

Regards,
Bjorn
