Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689782;
	b=m1LPa3CBYGjMAOQNSB/ayXDELeT0LWaNhyxidwPdQAt6Um1AzICwoxqm7Tsib2xIuqKj
	 ngJtUBqN6mrHmw9yhOzRSTn8MjbObgzatGvVf1omEWgmkVsGJ0ZIbv8c1oqQnsCCqZarx
	 s4Z7ACEABQvc23gfvkiH8GohmnBGBUmBWH7re/IaPldTfjZAFc4DkBF8W8GbsRdQyvVW6
	 wc2jEmioyO8uqtwwXn+XoiZnseaRMfdeprhA7yJbS8su1qVHTjz33wZ8ihUB38xrRe7tU
	 4JxLD7q8K2SFAfokD3cIRUyrDG1/xtNpgvePbD8rV06ak4dr+BPX0U0/RzVGN7eVueQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689782;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=w/BA3y2OoXjXB3mySNw0ub75AxUogb3EEtu7UNqKMkI=;
	b=vc9h64/uTAzRIwjOn9oR3Sd3doH0EGkPYRs1aFEZY9w/ReeDvMwwJ34OunmVQy+HXOuU
	 Hi6cxFc52fHGY0fbUKCZh/u+efZeoGO6lRReQKgMODUfZyKM3klYMoVgxYq4phb1hcZWR
	 TuW7WSQ4ycshKbAV4jD8WVFE52AFf0qk8tU5FvkQoOhi2FbrbglQsXfcdLlWmURKqBVd9
	 nPJ211VOJdFrI1++tOI71TDJjvmrOq9NMJB5dNhDRkEMDxPs4h/lmhWQz/GJiB+lh7WYA
	 6lMSJcPjYmb8U3yflR3kChXVadUPlEmpkgm8cXOtOOVGTEFP02XaBSY50q3aEOPOgwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AnJR1bnH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R0RtMfQ8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ED2606A322
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 17:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22ED2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AnJR1bnH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R0RtMfQ8
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MG5P76618725
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 17:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w/BA3y2OoXjXB3mySNw0ub75AxUogb3EEtu7UNqKMkI=; b=AnJR1bnHub8n2Dsk
	PlaY5Er+I38a5c0bYq/NZXNjg7beJBG4/NmYYsTdv94f0/U56bmbzORFuNIni27f
	mZUqsH4R409pIXypzUTj0cix8G/DL8Jf14H8onZHRyakrjOoHAYpFR1338rkEoB9
	IK/DLvMRa5C2LGfpH6agh4GaOZtYKl2kgYkTRAe0wjwkxBI5QQ6baEehFn8yU5yu
	MWTDKXHaAQE/Lh+sPpnO8TR3v/AjgN/8cq5g9/TwqtcLb/QU533yvyIQvOEQ9IIH
	voohru8LE5vILX/FPLNiFCHOFaiBwmzUnE9H3gRl8Wdh/JEBQY015K6tMhuAaKWr
	Xj6DFg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0gb23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 17:23:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88c768886a6so72939b3a.2
        for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 10:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792689780; x=1793294580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/BA3y2OoXjXB3mySNw0ub75AxUogb3EEtu7UNqKMkI=;
        b=R0RtMfQ8VBuWu7jkxh9zApib3dMqZUz5M391YWF2iqybucubxJjHj3YWUNXO/EDlA9
         IGfEBYBC8t+Pqx6Esi7Ha6WgRBXYW1l5A/j3odKli+K2meldleYUPGNmoTRXJ7576kMY
         yh9QFcLG8zwaNS4o55x+lA+5A39tX8Mo7rFn368puOD6QuwOGqy/ApXFYn0jJHAXTlqA
         ENohKQ+UQmBxvFFBZu9Nc9aOZFDJ9H5XenA9c7KMBA53kKlIFLiWK7gBHWIV7rxemeG0
         fulYtoSWPaZwWb7WhfL4L0Z2TVOZhll8ThvvLdmch8ubKkv46KnfaTH9q/g/hDgrC+AE
         E9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689780; x=1793294580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/BA3y2OoXjXB3mySNw0ub75AxUogb3EEtu7UNqKMkI=;
        b=FnWYfCn2m3IfjXkgFqheZLKxUzPyfHq/bImfacd6hqDHk5MQqsFKGH7HDE/JoHwxny
         k7ubIdznI+6qBIkjdQf7sLR/c/KQlOTyYYjSkGxXhoVyHlKKxkpsarE6r8w2P4obmIxa
         N+1oWyV5z/pEFTk5rVZQx8FK27x7EBqqwiNLF1uEueL6AViskgP1x4Uyd50y19quzNKV
         sxEK0DR1Hld49embCmZQfx2BZtzlF6B/JPkJkraN6XSp6AbFbLP41aUt+13YuG+OMREM
         Ub+l+bCnqwODqyrFbIGrb6uDCC6/asGq66sdXs/PL6rVP0tMSvqz05WCNWJSdw3swwXz
         bfJg==
X-Gm-Message-State: AFq9FYKvxbnZ2J15DHn/33aPJn8IkkSeuIaVpZOla6NjtsYzVipNKPlZ
	z4FtNP5+U3sKhkPsKrYey5B6KgzZDEPQOZpXwWNF3XNmRlZo40ZRKEy7vFACD/qfSnhpT3B9m0V
	1VkAdbikFTDsLvSymEviTxhvLNMmGbuKhQl3kw0tSbik5e6iG2N3L82tqstuSAZA=
X-Gm-Gg: AYBFou0cS+Jf64ziTXq2uELm/FIc1EYYLqpWZJCU/Td0R4am9baFei1dl6nKkrrWvzw
	q7dJbyhhchmArYjIPpoKyNts0nk7hk5XaeAmWvmLZ4Y7rpJoeo6Ft+dFByUK+WF57IWlvxOqmvB
	n5eruEjnuQ+y1zlQlfExd3Ok+NnJpCFoLVyRLaHsYN5+DQWobd4yor435sdFJy7Z0bRXkfTkahD
	VcEn/rQjz9sHu+Inlpy8fj0nhizzgbCzCSenocpqC3Fl8OXHSRmWNQpEhP0goNrUnRSlmLviSYv
	wkpWFNwsk6UyTvy9lmx5VhESHBIoDGbYMPuG91Nu9nOcerI3sQZFmckoDHwxwpoEGx9tsc3b3rC
	1dBOFVkcVGSpRcGfKrISpYdzwBBh1hw==
X-Received: by 2002:a05:6a20:3d12:b0:3e2:117a:62ff with SMTP id adf61e73a8af0-3e287e96620mr5159381637.61.1792689779603;
        Thu, 22 Oct 2026 10:22:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d12:b0:3e2:117a:62ff with SMTP id adf61e73a8af0-3e287e96620mr5159351637.61.1792689779003;
        Thu, 22 Oct 2026 10:22:59 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.194.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895fb005sm2450502b3a.49.2026.10.22.10.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:22:58 -0700 (PDT)
Message-ID: <22a87c51-4f8c-49c0-a13a-c11767f10e85@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 22:52:53 +0530
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
Subject: Re: [RFC PATCH] clk: qcom: dispcc-sm8750: reset the MDSS blocks at
 probe when the bootloader left them running
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20261022140811.469417-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261022140811.469417-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0qO1M-EHm32k2cK-uLgbb_UK8xWMTTBP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2OSBTYWx0ZWRfXxQv6IvYnB7pX
 Zwxyyso8Nd6eXaoCcOQvl210fhrNUFfEZ0tZUMPz5Fmeu7ooAqPHXVfsp8SKfustEW9J8wN+vj8
 y1pmq6FNBbBYoEJhfMUjldePxvo2jeVGmbO0ldCG7r40+Jb2vNSYYn7IY4unUtoJpD0zt6fNZaV
 yk9OSQq0n6nc5Fg8SYGG9b3jAA+8q8y3FHSEMQl9JQPFUUWGjg87woiloON9gdCwhHXxnlM9pqP
 2GqY0Hs9hnOmn5TRidCrreoMuj4JwVIPcihYu0gj4GbPEsAytx4JWFKn/sH4ZtJ+HOVC/Ca0hkS
 jgA113uEagbWhpeeczJiCJfU4lVw05i18bwdBLvGVVgP9feN72+yffEZ8PUAo6YmQil4PCEc5O/
 aRj93k4U0GU7EBD2ZMkw/Qf0rnLPHnnDA7xe+CNSaPPTpoCzCiTB+FBdSWZlZHfNNevSrGhd0kE
 MkbgULkTkM9Vcz4IitQ==
X-Proofpoint-GUID: 0qO1M-EHm32k2cK-uLgbb_UK8xWMTTBP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2OSBTYWx0ZWRfX6IlWpCbj7je7
 /Ss7hf61/PqEK1GO0/9/rq57QuFqZqMgVzqzkrAqxm9Z5lHzlIF3c8fOLYgNvkJd3qMnaO1KBXk
 JoPxrcDbPx6HRJU8JWHHsRHdg/7T8FU=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6ada4674 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b4qShTKTPH0tEwh9VF2HSg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=rTHtfaqMoHADTYiKZ3YA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220069



On 10/22/2026 7:38 PM, Qianhui Xu wrote:
>  
> +	/*
> +	 * Some bootloaders hand over with the display block still fully
> +	 * active: dispcc PLLs locked and MDSS core / core_int2 / RSCC out of
> +	 * reset. Probing on top of that live state makes the command-mode
> +	 * panel fail to initialise (command DMA timeout, panel init -EIO).
> +	 *
> +	 * Assert the three block resets and release them before the PLLs are
> +	 * configured, so the block starts from a known-zero state.
> +	 *
> +	 * Limited to Lenovo Elden for now: it is the only board where this
> +	 * handover behaviour was observed and the fix verified.
> +	 */
> +	if (of_machine_is_compatible("lenovo,elden")) {
> +		static const u16 elden_bcrs[] = {
> +			DISP_CC_MDSS_CORE_BCR,
> +			DISP_CC_MDSS_CORE_INT2_BCR,
> +			DISP_CC_MDSS_RSCC_BCR,
> +		};
> +		unsigned int reg;
> +		int i;
> +
> +		for (i = 0; i < ARRAY_SIZE(elden_bcrs); i++) {
> +			reg = disp_cc_sm8750_resets[elden_bcrs[i]].reg;
> +			regmap_write(regmap, reg, 0x1);
> +		}
> +		/* Hold for one full ~30 Hz frame before releasing. */
> +		msleep(50);
> +		for (i = ARRAY_SIZE(elden_bcrs) - 1; i >= 0; i--) {
> +			reg = disp_cc_sm8750_resets[elden_bcrs[i]].reg;
> +			regmap_write(regmap, reg, 0x0);
> +		}
> +	}
> +
These resets if required should be taken care or triggered from the
Display SW driver. It is not on to the clock driver to drive these
resets. If these are done the complete dispcc would be reset and when
the PLLs gets reconfigured there should be a flicker observed on the
display.

-- 
Thanks,
Taniya Das

