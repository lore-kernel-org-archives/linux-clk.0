Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41583AA19B
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 03:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308064; cv=none; b=AN6UhEH6r/p/u8SnFDZay2pO8qG7SIDUUF28AF+/puLn5DItQ5RP/DzyWPd1wtd7rNdOyR381N0ARfxygp+e0CXojfHukAdtTj4t5im3wlrYpx56nQ5nj9fLmbPSnJMtRf0lWCmPjFaZ4lnVE8Az+ETN2wYMDjXxan9rqaKLOtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308064; c=relaxed/simple;
	bh=Plon+k1ptMC43wXIzK+E3enat2n/BRnkToi0cHLDPaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqIxOZ3/kQI9f550t3Z1laFxer8HSLRs4sqq2yiI/djtblZP5EQIMajyjh8jSV9sKvpglSSN2ney06t9+A7gqoVW4zeHZQQhtapH+vgzVwKBSSmrwNBpuXORV89wyIIC59AZrwKoyEoCbWhIam5g2tAGvPohBVJLzJ7iHaDqD2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gHmuGCLY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMHFEmfJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gHmuGCLY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMHFEmfJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665LxFpV2868083
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 03:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vLaX8Moxxos/n9tNRNhn6IzL
	amMyiQ5H7q2UWMNWees=; b=gHmuGCLYWsdIgzQ2elBnA8MOUviMYzZ2SXykis0H
	GTCQae6YOYVzAS981IYPu9siHAeldp2JeNVSrmJ0e7kiyxVFZEmCL1vtVhnHK5dV
	nPQIyr1bm1CBIzHIGLhx92dm1X5l0hFVE+DU3LixqVevpY8vPz/8TzCdbHLIh/P3
	X553my89J3P7du2RocH2hKaiS740XDylIdxi4UUC2krE7tqf6ACPtMaCg5jgMqeN
	DKlgVBt38R5vIrz7u/4ecj0iBhhG5gYW5g0mfgBMk0FwgR30gYUHw6CSxCcHVjkX
	Kquu0/95F5hprjaST92exq9eZ0NaxZKXRt26dgCuXmozMw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4sv8c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 03:21:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc77a6943eso47119455ad.0
        for <linux-clk@vger.kernel.org>; Sun, 05 Jul 2026 20:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783308061; x=1783912861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vLaX8Moxxos/n9tNRNhn6IzLamMyiQ5H7q2UWMNWees=;
        b=WMHFEmfJUasiUn5aOJBjRy8q+h5VAQblba14cq6b5EcfK+zEIdSg1/8gyrEUrqkosr
         SRxnRqep8+FjBht0MCHpD2KceNMVYKQYMNJU4ARBcdfdnigCGlDVKcHo7QBfoYanxDL7
         1ztRlRDguO5DH6tjBf6FmdgQCzXiB7fyZqqxpCq8e9sZtQ4U5IKA4w8jQFg1K4nQzz2o
         8/l0UsXs3v57YZtXI1j3A/NK9Fjs7eeT2OyIEAT3UbLTTSC6Dt2Y8TeR790bEdTJjDhu
         nciw4jn1Z5PsL+d2sukHTqSzBfY/Virr0ZIlduUoF4vp7wPJFUrnBTF/bo2+yDuOW3Vw
         2ZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783308061; x=1783912861;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLaX8Moxxos/n9tNRNhn6IzLamMyiQ5H7q2UWMNWees=;
        b=DCodY5jEM5eQpJGyZzfyuNT7hULKWf1SlkNLIwLs5w3Kzki7L0qtvdj+tIbhyzpd9k
         DXCtXESyCcsArUvIObD58cEOfdk5fkmpsBUQwZ64SpJDNOxR2zvqRPXwTIoWctVcNtwk
         YlCRzhmXRek40DmiASEsKHADO3gdGxbEOxHW+XgoMK9PyHOrzqdSYnAaOGqnbmbcqjVN
         sp764oxeZqg8e5RMAjbvcUs+I6Q4L35is1vwv/SOt8PASRLBzsUTcFHcs5Cb6Gb+5xax
         R55K/GiryUFUvz1toBRNd7RsTeVZvuoU1aFFwaLRAA7LSubkZIWPwU932jF3fnbOEhfi
         qs/g==
X-Forwarded-Encrypted: i=1; AHgh+Ro+EUOYDevTQdBABgrSZUtyAGfWRYtrDAEZ5IAzJBp0bo4BsByt51CaZKUxYu6Tdi1mg/KfYU9dPpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxorPkvea1hPBsTqmvhPfBzEYfUhJYTdtqfNpkM4uubFKsfBlD4
	CHnRE7NBc8DzL3QoAerxUKgv+AO4zyecapR1d40eb3zWV3f1cMjWcTOgz9nItiLpSM/dENmmDkq
	6BswsXgDf+PKlWaQL45idfaX9bpzeuWoYyLldU8IwrLsgaoIViXDOUDwuwpwH2jA=
X-Gm-Gg: AfdE7clC/VuiXB3XpFuesGLTonPtgt/W6aO9lzr72Gd5vOkBlJ9X0vEOro49Ucwxmzo
	hKfW923jp9iR7y/WyoH0bMs/7fm0hyKWyydtsa3C/TjAKONYlTvmQz4kOyrI9PnYB2Joi+KR2kp
	af9FWWqLrLpTi5pRyhqdfMBeDXkPwG9DnHx5K6I9skN8npuCOS0xRi/pQVbVgnwl3htZIkWHdFR
	VCffgU3ZRW7DDXsvRLghJiswRSA+pKHkDek4p4LhX9UarzzlFgxKObVdo9S8E4j6ootvITeDegL
	MTUGqw7CGGrsEWRVVzEHNpMW5KwuNuXucG/McDpyTXpIIVmEfreAaf+5FbK0vpH+JUgS7IArgS9
	7FZHGUQOk3MY7w51v7R+EChuCabUmIVncUMMuxJhkN3CYn0Xuq0gWVngL4g==
X-Received: by 2002:a17:903:b8f:b0:2c9:97a9:2097 with SMTP id d9443c01a7336-2cbb9efe254mr90496055ad.43.1783308061402;
        Sun, 05 Jul 2026 20:21:01 -0700 (PDT)
X-Received: by 2002:a17:903:b8f:b0:2c9:97a9:2097 with SMTP id d9443c01a7336-2cbb9efe254mr90495655ad.43.1783308060898;
        Sun, 05 Jul 2026 20:21:00 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm63915229c88.1.2026.07.05.20.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 20:21:00 -0700 (PDT)
Date: Sun, 5 Jul 2026 20:20:58 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v7 1/7] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding
Message-ID: <aksfGiIWxW1RUTfx@hu-qianyu-lv.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-1-776f2811b7af@oss.qualcomm.com>
 <20260703-godlike-artificial-coyote-3e9ba9@quoll>
 <akeoHGv905FTOiy9@hu-qianyu-lv.qualcomm.com>
 <6d23a482-4d5c-4444-a533-d89a4602a4dc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d23a482-4d5c-4444-a533-d89a4602a4dc@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDAzMCBTYWx0ZWRfXxc/eaxoCodpq
 Jx0WV3qq/TUsQjpOysbQes+NyT224IFAqf0nGvOAneLwT62J0UQRV1o99jW6JsL1PtQ1kzfOxZX
 nltKs97ZjAj+3xxSP9ffScdGgQLeuGo=
X-Proofpoint-ORIG-GUID: 6RluGtq-9p23XhPJtAiCGybljKpLmns3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDAzMCBTYWx0ZWRfX6ln2yEnSL5CG
 22zGmONeN2zs+gfVogHLcLN7kNqiB4w1k8efjC/kA5tgFW/U2oppEIuWfaVg2T52mzuI4krGeU3
 4TEHuRqm1CRbv0/vplqB9i2WkXJzHIXd+n2YjxC8LDtJkagCb1eAApK0UK8b+QdLI6P0H9wOw72
 ygBwYjtsJpfBvY9CxcbyZTB1n2rfljRB0PaimsD9x+sdTVSvIt6BLqijoMXnQGkFNv7G0IAgeg0
 hzKH9jFX7KUMPcdmueEHv29R2tPlIRhhdJdMGKUaeinpvoBahR9LNnSFrm9Azq23hlpAVMf/EGG
 zcqSVgusACt3j7098oYVS9aI9I4VEO+YX5K3PE0/go1brkoadPCeEYgMlMz5U9xVw8GQNdEhUWk
 J5fIFsJ5gI9BlfdKaLA4FJJJWRZrOjN8XyTBO8zRw3ZxUSFIBa+cCBqRhRuFb8RTZSVAbkfF9c8
 g9QmkehxPOrYB8aIqVw==
X-Proofpoint-GUID: 6RluGtq-9p23XhPJtAiCGybljKpLmns3
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b1f1e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=0RteJoaA5KIU4r5rSwwA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060030

On Fri, Jul 03, 2026 at 04:50:27PM +0200, Krzysztof Kozlowski wrote:
> On 03/07/2026 14:16, Qiang Yu wrote:
> > On Fri, Jul 03, 2026 at 07:58:00AM +0200, Krzysztof Kozlowski wrote:
> >> On Thu, Jul 02, 2026 at 12:36:11AM -0700, Qiang Yu wrote:
> >>> The QREF block supplies reference clocks to PCIe PHYs and requires
> >>> dedicated LDO supplies to operate. The digital control interface for QREF
> >>> (clkref_en registers) resides in TCSR on glymur. Since QREF has no
> >>> dedicated DT node of its own, these supply properties are placed in the
> >>> TCSR node which acts as the control interface for QREF.
> >>>
> >>> Add a dedicated binding file for qcom,glymur-tcsr and document the supply
> >>> properties. As this binding will grow to cover more SoCs, mark the
> >>> required supplies per compatible using an allOf/if/then conditional.
> >>>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>
> >> So you dropped the tag because? Where is the explanation?
> >>
> > Sorry for the confusion. The patch was substantially reworked in v7
> > based on your v6 review comments on patch 2: the compatible was changed
> > from const to an enum, and the allOf/if/then block was moved into this
> > patch upfront. Since the diff changed significantly from what you
> > reviewed, I dropped the tag rather than carry it forward silently.
> 
> Dropping tag is fine, but what do the submitting patches say when you
> drop someone's tag?
>
Understood. As per Dcumentation/process/submitting-patches.rst, The
removal should have been explained after the '---' separator of the patch.

- Qiang Yu
