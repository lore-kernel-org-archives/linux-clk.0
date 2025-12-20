Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0541F3A1E98
	for <linux-clk@vger.kernel.org>; Sat, 20 Dec 2025 01:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766193435; cv=none; b=SoEVY4tPC8WS8jpSLgyeYTAYLZ05F52YKsN8bBre07jqg0fPt8ESzA6AbZMiG9uHv5wU7iSbpRTZsLVNelMgMlz4L+RQBO1nR9uRSArdSgohKSdXsI9WekMErayyvvwoZABJ3PjDPPvaegLwEvsnHNWPuIC0iwXIZCeAxtgbIYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766193435; c=relaxed/simple;
	bh=9/g3xrQYqQvMPlJ3kljgRwjOKDCzoA+fL+6rYoa+mko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfnkzJbZouD40C1mrB6fV1IcA3pOiw1yWfPMMsNM8rAy8SFWN7WIvopPkNZ2oxJWYvAm4GItvo5SxkNWMiYHWwFxO3VhtCgEiOOY1fh+WDXwkm1B5dvCvoJcdNRyaGbDooe1SUFm3qIDvUfFy5+b90h7RVCpos7yoqdJ9FLCfk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZOEAPg9u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eLedfgJD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOEAPg9u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eLedfgJD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJNNBFL2702425
	for <linux-clk@vger.kernel.org>; Sat, 20 Dec 2025 01:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQVWVrHY06xpDTJeqnmla272fk+k3T3T7nR1IYSIQ+A=; b=ZOEAPg9uvWoAc6zD
	vwVU5YPIyLm1EYCApJLdXWtkZ5X8fx4t7nlgibTJk+ec+ZQLfC7dW6lPXewbYHWC
	MnzJFXvEN7C7bwMiGlQNieI7+r19eVqy6WiFXGTXSDIuNY9ZOT4AuNYfLyf0V6lj
	lQZkB4IvruG3W7jX8vCmXL1xzWz3JD2TTwW/716yO5GvIxqy9aw8nwfP80Vu0ru/
	quRdnKuBe5j5vrkJhLuptrgx3axvVlBN4NpZERqvaJ4ikToHOLgIQnLZoEXE2qHi
	1n03gGpUAzSc6RN6aFcEgSrMH3WTTIJ4dB5lHiuoj7WKbGys9AXyWgKyHa7WMS2s
	X0y4vA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5frq88r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 20 Dec 2025 01:17:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed69f9ce96so70532731cf.3
        for <linux-clk@vger.kernel.org>; Fri, 19 Dec 2025 17:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766193431; x=1766798231; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IQVWVrHY06xpDTJeqnmla272fk+k3T3T7nR1IYSIQ+A=;
        b=eLedfgJDrCtf85m4QP5EL8P7Q88DrvggWROpLIaAGQt/HUo/v/53FN2+0NKjgK07jG
         zE/FdUdAMfD+IMJWpyCL8JdEWmau0yjOjenYcx7vUnx0omPJUn5Vryy53Ey5eTI4RbGG
         K4R844j0nEv+MMNg9bxkpXZ5dsHgNHA3wzD258IuUNBtjd/c0oNIR5J9+QoAs6BhwJ8s
         E3id+l0bpmcW3ldvJipOXKZ8cID4sDDtG0CTIubgDdUfPCKbnPBIbv7ZHWAAlZjXYkFJ
         ksoo9JAMuIKXPOFNm4RGShZKq1cGZnSKWXjOYDvKqNpFDGrqWlJ6jYsmy/Dpw2gyfjcm
         mGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766193431; x=1766798231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IQVWVrHY06xpDTJeqnmla272fk+k3T3T7nR1IYSIQ+A=;
        b=AA1qTQgmUr7FP9qdn8pXKiEcW7bcbJfaCZRPIN8i9pA2Dse9x/ZWrYHlDB6TMR2FDB
         kUPwjN3dDHidw0ztODPWy/pHpXZQOFv7erddOs6hjIX3YpJwYMA69zrKoZHMsxS6EOku
         6atehLEaV6eZJq/HpTMj/qCyo+AECvOsY3VNf4FQZdbdyQoQGDUVY+q+OlW9n8f/R4DX
         gWvaq7DtyW76wCpzfXvW2wflni6f6yruklZAWzyCKEpnW3028EkDZJxpNTjeZLNYxB/b
         6frVklVhlx7a2tl6zl0P40clNBjwO9h0EtPSE0tpaorFnUsiOYsbtdW3Dp16oLF0A8OT
         LGDw==
X-Forwarded-Encrypted: i=1; AJvYcCWBjMvkDr9Ce0uTCNo3sT1nnmdRekoFCnyuj5XoFfTZBtjKFF/x7PN92OYawuxr8cF3zK4Gk92NZQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+A5m8TkTQl35oFq/ZrknwPtZw9zsvYYncSgCBnK8zdIWVMu/l
	ZwldgCtBMtihmOTB+T4y4xrFXvgD478H9ZZW9tGYnDML4DsBall21HUN6KT4HFXxQKDNcBlmD/K
	v+8ttC1js4Oc4Y8ejdB51VaqvNGIjyctSSVvCac+4XEtrh4dt4ww0nuLQR+XadUs=
X-Gm-Gg: AY/fxX7JGz75EftysQJ+Au2wJqDNNj9xfk5EGDVtncKlfzJoNUWO7bHf/i1KpobB0zO
	rBQDr6UvLPjIVX0EtWkhQWI58r4Fk4NDJK0N5+rmsIBuarGfgGHNJ0hQOC9loksK4kR40yEFrsF
	hu1xG3tm3htD2GS6kM0ht9Q53NzXhhOJ3Hz+Q7ZXwnQkzu4owYz0gAnhcTCYlpLBDTd0j97Z4hL
	oI/I9wRxqyqVd/D7nBoL/t+Ak0ViSnh9nVUantR3RcNvdPWWBQSdzHobix61ZRmOZcnFMeSysOf
	ZJwTpzaI2G/JaWfdO1XRq3DcdG4r+DkIeJfIMQx0jIeK2ttJztMj2ivTlnMjl3xOB0UgADcgDdi
	nVNHJwAReq6XNg9/OGEHEg9EYky6SCo9dKM1HO1bWx7hoad1257DtdNV9JAwtvMRxUCqrqOnL1l
	OPsESorlXOm/9o4BfMEomGLaY=
X-Received: by 2002:a05:622a:1aaa:b0:4ee:1227:479a with SMTP id d75a77b69052e-4f4abdd1c34mr68412451cf.84.1766193431289;
        Fri, 19 Dec 2025 17:17:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNyb2GSLwsAw/pta9mYsYp5q9qFNHtpu2mBuIG6LjDM9jgAmqavK8BCblWkeR+YYk0Gz8yig==
X-Received: by 2002:a05:622a:1aaa:b0:4ee:1227:479a with SMTP id d75a77b69052e-4f4abdd1c34mr68412201cf.84.1766193430807;
        Fri, 19 Dec 2025 17:17:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861ffffsm1102998e87.81.2025.12.19.17.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 17:17:08 -0800 (PST)
Date: Sat, 20 Dec 2025 03:17:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] Revert "clk: qcom: cpu-8996: simplify the
 cpu_clk_notifier_cb"
Message-ID: <jhdl6aqh7cbb4t6uqhafxcgn4efxn3tzqo7haivle6olkpmvxf@yafk363lady4>
References: <20251202-wip-obbardc-qcom-msm8096-clk-cpu-fix-downclock-v1-1-90208427e6b1@linaro.org>
 <8d769fb3-cd2a-492c-8aa3-064ebbc5eee4@oss.qualcomm.com>
 <CACr-zFD_Nd=r1Giu2A0h9GHgh-GYPbT1PrwBq7n7JN2AWkXMrw@mail.gmail.com>
 <CACr-zFA=4_wye-uf3NP6bOGTnV7_Cz3-S3eM_TYrg=HDShbkKg@mail.gmail.com>
 <f902ebd4-4b4a-47c3-afd7-2018facdaad6@oss.qualcomm.com>
 <e2eg3zk2sc7pzzlybf6wlauw7fsks3oe6jy3wvbxkgicbo3s2g@tks2pgigtbza>
 <5e255831-3e84-4f3f-8b4f-c66d05e6be09@oss.qualcomm.com>
 <CAO9ioeVBk0CLGcdUdbixVGwGfheOaVwX=i39JovHa740mO4kRg@mail.gmail.com>
 <CACr-zFA0vkn_a=a1LNn_rqrSsKPUsuf+jt8_a3MsHg8Ao30qOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACr-zFA0vkn_a=a1LNn_rqrSsKPUsuf+jt8_a3MsHg8Ao30qOg@mail.gmail.com>
X-Proofpoint-GUID: Yp32kwCLnnXBGuEpfetKEo7HWwu2FlYL
X-Proofpoint-ORIG-GUID: Yp32kwCLnnXBGuEpfetKEo7HWwu2FlYL
X-Authority-Analysis: v=2.4 cv=Mu9fKmae c=1 sm=1 tr=0 ts=6945f917 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=cfdu8vdO5y-rE6AAjPwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDAwOCBTYWx0ZWRfX9qcke8Ra0jH+
 u6vjgIbD1hsnsvleXIr5fSHBaF7goGN9O9bSQuGFK82cNUydLLwvXZfD9WJko+wY5scxRst3cY8
 TPEuGfx3eJCuFhMK78vsqg718UPi9MvrTMghHADPuGsec8+wuz1fHrro4vnlSCTTfizISkGoDSg
 6J6usinxDTukKnz6IA76PXtejwmqoIWVajJaIo47mLbEIHt+6zDg6bwbvoID7F6BA9ZiVMpUp4R
 rcv+w5wZKmL4AKmQOTgDxoSEi5XGnlfflhLKRa3cYKrGfUDJGNQBfysdwDz5i+4Fe1rnLSE87Ha
 DfYGxvxPS4Ib3qJx0330R5VvQBBGA+4If84lvmPUJ4tIS1FGjiOst41Kme69S/EqUCCwYfV9tr1
 4qfdINms0DOw5u3r2H7QI6csndVc6UdNb/1f2ou9N/tqTMOlBO1jCPvfwHqIHW2/95mfQMu1Q31
 CAWZz1j4nee1Kz54jpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_08,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512200008

On Fri, Dec 19, 2025 at 08:50:58PM +0000, Christopher Obbard wrote:
> Hi Dmitry, Konrad,
> 
> On Thu, 18 Dec 2025 at 13:33, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Thu, 18 Dec 2025 at 15:09, Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> > >
> > > On 12/17/25 5:39 PM, Dmitry Baryshkov wrote:
> > > > On Wed, Dec 17, 2025 at 01:22:59PM +0100, Konrad Dybcio wrote:
> > > >> On 12/14/25 8:26 PM, Christopher Obbard wrote:
> > > >>> Hi Konrad,
> > > >>>
> > > >>> On Mon, 8 Dec 2025 at 22:36, Christopher Obbard
> > > >>> <christopher.obbard@linaro.org> wrote:
> > > >>>> Apologies for the late response, I was in the process of setting some
> > > >>>> more msm8096 boards up again in my new workspace to test this
> > > >>>> properly.
> > > >>>>
> > > >>>>
> > > >>>>> It may be that your board really has a MSM/APQ8x96*SG* which is another
> > > >>>>> name for the PRO SKU, which happens to have a 2 times wider divider, try
> > > >>>>>
> > > >>>>> `cat /sys/bus/soc/devices/soc0/soc_id`
> > > >>>>
> > > >>>> I read the soc_id from both of the msm8096 boards I have:
> > > >>>>
> > > >>>> Open-Q™ 820 µSOM Development Kit (APQ8096)
> > > >>>> ```
> > > >>>> $ cat /sys/bus/soc/devices/soc0/soc_id
> > > >>>> 291
> > > >>>> ```
> > > >>>> (FWIW this board is not in mainline yet; but boots with a DT similar
> > > >>>> enough to the db820c. I have a patch in my upstream backlog enabling
> > > >>>> that board; watch this space)
> > > >>>>
> > > >>>> DragonBoard™ 820c (APQ8096)
> > > >>>> ```
> > > >>>> $ cat /sys/bus/soc/devices/soc0/soc_id
> > > >>>> 291
> > > >>>> ```
> > > >>>
> > > >>> Sorry to nag, but are you able to look into this soc_id and see if
> > > >>> it's the PRO SKU ?
> > > >>
> > > >> No, it's the "normal" one
> > > >>
> > > >> Maybe Dmitry would know a little more what's going on
> > > >
> > > > Unfortunately, no.
> > > >
> > > > Maybe, the best option would be to really land the revert.
> > > >
> > > >
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >
> > > Is there a chance that this removal:
> > >
> > > -       case POST_RATE_CHANGE:
> > > -               if (cnd->new_rate < DIV_2_THRESHOLD)
> > > -                       ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
> > > -                                                          SMUX_INDEX);
> > > -               else
> > > -                       ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
> > > -                                                          ACD_INDEX);
> > >
> > > could have been the cause?
> > >
> > > On one hand, we're removing this explicit "set ACD as parent" path, but
> > > OTOH determine_rate should have taken care of this..
> >
> > My idea was that we switch to SMUX temporarily, then CLK framework
> > fixes that for us while performing the actual reparenting.
> >
> > Christopher, as a quick check, could possibly revert just this chunk?
> 
> Do you mean something like this diff? I thought I'd ask and confirm
> first, to be really sure.
> This leaves the handlers present for the other two events
> (PRE_RATE_CHANGE and ABORT_RATE_CHANGE).
> I didn't bother checking the calls to clk_cpu_8996_pmux_set_parent for
> errors as it's just a quick hack.
> If you think this diff is good for a test, I will check it in the next few days.

Yes, something like this.

> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index 21d13c0841ed0..5d7f42a86a923 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -565,6 +565,14 @@ static int cpu_clk_notifier_cb(struct
> notifier_block *nb, unsigned long event,
>                         clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
> SMUX_INDEX);
> 
>                 break;
> +       case POST_RATE_CHANGE:
> +               if (cnd->new_rate < DIV_2_THRESHOLD)
> +                        clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
> +                                                          SMUX_INDEX);
> +               else
> +                       clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
> +                                                          ACD_INDEX);
> +               break;
>         case ABORT_RATE_CHANGE:
>                 /* Revert manual change */
>                 if (cnd->new_rate < DIV_2_THRESHOLD &&
> 
> 
> Cheers!
> 
> Christopher Obbard

-- 
With best wishes
Dmitry
