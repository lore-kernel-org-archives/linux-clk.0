Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8DD3ACA6D
	for <linux-clk@vger.kernel.org>; Thu,  5 Feb 2026 12:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770295702; cv=none; b=I7qER8OOYjVx+oF8JqVVol+id2mQqNLEO28/2IHJd/YhW7owIfvjQdaTco9ZXdgxO7eRyfpzkuSiAWrjGd8ZWmyVVJ/cpye/3uh9nh4ZUpftPviA6pkO6wGCv+mn9ofZOydpHTMc9aORralIOOfC10ApK7vg+ytYq9REmM6GAAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770295702; c=relaxed/simple;
	bh=R1CdOkY6GMZvyUbC/Hg0FEFK7M+mNUBaoS2H9i4Eorc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wu5j0CzbHwqbJ+2Mnst7WFftEac8/7wpOmLOibRdukTOD7+uo8YXjC6kJgcAXxokHql1Xukf9jtAfjzF/JvhhDQEB21+u0K1b2oiAD/PsF50naaEQix89xQaldSNCMeSZjeJOf62DpH1MdeaogNGaNhmCswsY+Y2Y+UPZ9hLfWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0NtUHcw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q2S+QOsi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0NtUHcw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q2S+QOsi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615B3wCd176892
	for <linux-clk@vger.kernel.org>; Thu, 5 Feb 2026 12:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=73cwzKzNoPuSUijQsd3G2VOl
	70mKQlo0JAzXFXp/6hY=; b=m0NtUHcwHYXrptDzKP0JU7nVwuV/2ioAd2fNh15w
	KIJyAl0M2DzM4ZkP95fU9bns9Nce6jHUPzwxzfHGdF1rihAJ0D4EbQZYV2vg9I/j
	5KrTGN+/xlxKPwTIMJ4Pt9AhJ3AJQW4YlKP73YuFF/q3HZycxC63TnExncrRiCuj
	LIaC4L9xt4coI4TS4zT8huI2pfb2Gjpi5PKm/wLa73h3slfBjE1PfN64qYL1Weki
	zJkhbfl56Qlo98+o2btqIJK/QCv89ioOhrS3rL/Ta1pYtPAz/BHhVtRv9cagO9K7
	HPst3GhF4fM0IS79HzEMqtNoZ/Cll7f3BF9F8+9rug2cfw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4t0p09fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Feb 2026 12:48:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a2d8b7ea5so16668546d6.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Feb 2026 04:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770295700; x=1770900500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=73cwzKzNoPuSUijQsd3G2VOl70mKQlo0JAzXFXp/6hY=;
        b=Q2S+QOsimGIYCx7ifd1I515l/ftKrZe/YvIUHDXrYSsemMx6Mqg7PBU4WbVs/GYFTY
         cO2++nPqMCYWRzBnKnMzsR1kpsb87L7LOuH+NXczyqYkfTfK2UwqsEh2M4C3SkMQU6QH
         gcQizKHWWrWp6quSpmm6+343qlNoN/A6AkYnf8kkzUGZc0IDauR9C24XQkxT8Rq5WFFz
         qy9EtbD/xxjpMlrTiUj1/TJS+n83gFkfmbMSRmlKoggF6HQ9oxYabBMaz4VwfHbrVJ3P
         km9Es8m0jx5cMgjvlxcwPPas9Hj+31OttyxZ4SMRBUaHyynD1OpT738OHOGNzU3X09ub
         8XbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770295700; x=1770900500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73cwzKzNoPuSUijQsd3G2VOl70mKQlo0JAzXFXp/6hY=;
        b=BBAyAs8hPDT8VA7YrYXEfRuxIofykb5u5kXZUOcV45KioMOfXq9I3jnHMg0etLBVR8
         PgBZr1M/arCrjc8Wr7bs8glOQorGbRMuRrpCNYx/12T7UPG29wIQ22+eo2zYMF20WdT8
         Bz0rPpnx0aXz0McEvMQcEeJ0jCMV4WqJEbT9If0D04O35As60qZ3yLIXI0/W4HZf9hM8
         xyftDcYXTCw0TJ2qGX5oPNXle83kIUKI2xv6/J/VgnBKEZvAwYryhdrrdDBr5PLZxpD3
         mh3TiOpTYk6s53Nenlure9dCgiK5gFoOTSUZf4AfyVgctO7G7YMSSwLBAZ2yfmpMaEKc
         eD0A==
X-Forwarded-Encrypted: i=1; AJvYcCXoZP7kQYYcg/NaAUc8UMwJgk1+capq2fvO0k1+B1G/FHXrDpW8f0b2XZVXPEqGJlphm0PRRc9oBVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdxdAeiF1aJBASiUr6EFm8lAzfChmZAN+MeRwCjsRA9ZFAmxce
	g74SbHGerxWkeB9yK5p1T6pp366rwXZ1A4TLoCOWXb28Nuo1HucrXy3/vZF1f5yruZBPzX83ij7
	0St1UYCSh39JQpgYeXIm5Ht37HcMeNL7vznDv9dAYtyXFR7K3bxNPlYX8/XWccAY=
X-Gm-Gg: AZuq6aLYtxVehucz4r2widfFc6QJrN0Z3ilzjCnCfNYe83R4pxl62pgZWuD0yaiJhQT
	PISPnCj5erULokq5vBcqq0QLXURN4qrR/NIN21quilqulLVa0OQqm/AS+s6BpvguCGk/X2sKxLo
	vaWSSGHUGj3zhQ0cE7Ohtso3jbFXgVxfFTLHsAi9hzs5ZZk8Rtlimyn7YJRFgrK8stv7T0KUsHs
	uFkLx5R3DszfB4EyJ5wQ7qRBkl4sTwzfWe5JHnYznVtD4TvHXO0bdrnH+/S5bek5GyAXXuoLu+v
	mZGRQ33eNldwKL0iqHlNiyxYe4N+UB1/ReS0x+rorCApv9L879uy1bn7gY4kyE641zYxBeWncHn
	k37BP0AB9me3gS7NhFLvCxBMv16kOd8Szr5pJRIymBWoqwZeAxAoqvPeZggMaV/ZCzdbZyhjJAW
	nffCN34PLbqARiv5um73Y6nrE=
X-Received: by 2002:a05:6214:1c8b:b0:890:808f:c255 with SMTP id 6a1803df08f44-8952215989amr81969306d6.14.1770295700297;
        Thu, 05 Feb 2026 04:48:20 -0800 (PST)
X-Received: by 2002:a05:6214:1c8b:b0:890:808f:c255 with SMTP id 6a1803df08f44-8952215989amr81968676d6.14.1770295699660;
        Thu, 05 Feb 2026 04:48:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38691f6e30asm9790031fa.10.2026.02.05.04.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 04:48:18 -0800 (PST)
Date: Thu, 5 Feb 2026 14:48:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: clock: qcom,sm8250-videocc: account
 for the MX domain
Message-ID: <mlpe7ph27grv4bulvwlo5lbbsjmwqqfwc3rrfwfcu7tl7qltsu@xrtzonb2t44k>
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
 <20260204-iris-venus-fix-sm8250-v3-1-70fa68e57f96@oss.qualcomm.com>
 <20260205-abiding-beautiful-locust-6ee1b5@quoll>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-abiding-beautiful-locust-6ee1b5@quoll>
X-Authority-Analysis: v=2.4 cv=ItITsb/g c=1 sm=1 tr=0 ts=69849195 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=L1mSppDWdqrFMHu5o5oA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eWrK7hLj7FfzVJAVitrJmKkfq-DUNqbj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA5NSBTYWx0ZWRfX+MEVe60R0nNX
 ybFXK4kz4ziORQMhKzB6VDW1oVYRMpVIj6hhoJt8qh2RyKCZQCvyYmEJ9NmNZRHeJmnBbf3kb61
 PAQaHGNiisixtmQjXaNyXk3tjJnlnUt3lCoZE3gH1GLqjPOPYGQi6+k/5gARUcnNKYuowhU1buP
 9G0m+WLXliJHgkMLeB3C56maoBI3Dt+StOiv1g+6GX3xsawFk6MA3a+Cr9UB5qLx+03V6jtPZhD
 D3Jlhpmz0XQAchfhcqWgBfv31m09voOSfj5FX2NXKe2LEDdzWH7J+otw1xre9YTJUc13rOENFdf
 2LcBt0ek+M9HftVXVTm6dowsbgPSWt2iBLs7ZilwyoNvz6QCwf+XpAiBGKeOyEZ34uc95B/4Kll
 hJQPAiCBsOtOpQuk6gPlycxhSZZfIJ4Zn0fcS/xqsdyFLA4sB7zKXgU1T+kSUmmQEXRCLlC5Qhk
 5ofSXTQmJ+E2BkrqWSg==
X-Proofpoint-GUID: eWrK7hLj7FfzVJAVitrJmKkfq-DUNqbj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050095

On Thu, Feb 05, 2026 at 12:31:54PM +0100, Krzysztof Kozlowski wrote:
> On Wed, Feb 04, 2026 at 02:59:49AM +0200, Dmitry Baryshkov wrote:
> > To configure the video PLLs and enable the video GDSCs on SM8250,
> > platform, the MX rail must be ON along with MMCX. Split the bindings
> > file in order to provide separate file utilizing MMCX and MX power
> > domains.
> 
> ...
> 
> > +
> > +description: |
> > +  Qualcomm video clock control module provides the clocks, resets and power
> > +  domains on Qualcomm SoCs.
> > +
> > +  See also::
> 
> Only one ':', please. It was a mistake to introduce ::

Ack.

> 
> > +  clock-names:
> > +    items:
> > +      - const: iface
> > +      - const: bi_tcxo
> > +      - const: bi_tcxo_ao
> > +
> > +  power-domains:
> > +    items:
> > +      - description:
> > +          A phandle and PM domain specifier for the MMCX power domain.
> > +      - description:
> > +          A phandle and PM domain specifier for the MX power domain.
> 
> This is an ABI break, so please say in the commit what was not working
> or why this ABI break is really justified. Currently you just give a
> hint that it is needed for PLL configuration, but honestly - why would
> we care to configure PLL if everything was working correct before?

I must admit, I c&p'ed the commit message from [1] which was ack'ed by
Rob and accepted into the kernel. What is the difference?

[1] https://lore.kernel.org/all/20250530-videocc-pll-multi-pd-voting-v5-1-02303b3a582d@quicinc.com/

-- 
With best wishes
Dmitry
