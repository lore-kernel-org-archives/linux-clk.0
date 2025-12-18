Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDC23321C0
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 13:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766064842; cv=none; b=JgptBBjWJZA1K+wRrWimrGfl8/xlNYzZCQOCv/ojKM1TkRvlxY0kjsMADP5yzwklW9xuP6sRCoKn6Y7bRLXSa9TrBWaU78ShExFRTBSeitw4oD9aNnDv3qSzcyPvT40dQRxHk5siqGrbMxBrHcuzjuoj895RsUOBixGi4ZKVZrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766064842; c=relaxed/simple;
	bh=lnyg40KUhEFPYZNdBZjXMbfSCXX9xwcbbpFyc1U/xNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k8Vz5wnMJobtobEEVbokRllpRAIrwtnbgZlXBq2ZP/3MpRmuaU8L7ApMXFVFqC9VjTFHD7rgoJCBaUlqIEnNA5PknUbwBEwjIvDC/HaYK7UW5Vx3vcFEMZgPylfqO0kpC4TCn2oMWYfb4tn0nyQd3ARvtrqt/kfaq6LxXJuCMnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6CnhYA/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ksrfDVpY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6CnhYA/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ksrfDVpY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI93lTG4148006
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 13:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jLk8SXiYprpUvnDvLbLafiQmZVsZ135ZwhPEfPUYFJU=; b=K6CnhYA/IWTwE5Up
	ZeJrbRhskLrlUPiFehZrVGdFfQFp+6z6vXcKXCRlLM7DP9qvDRWOwlt6KNeWe6LQ
	Dv6Lz6KTcP1sIOAhhH9CCthZ8cMGsqV2kWAvXKmC6zR8hr3tR3zNbcfYAHqfYWt3
	M1/LYxIsq2foNx/gUUn9SNZC7kCzFxYUNyMzriecJ7mvZo9fsLBL0+loWWdz5wbf
	g4q8tYTccLDI1QGqxiVMJLyJ6NQtwUqwtHCzzL+yrljcm2/R+kRXiwkOQG5XCbal
	CJvQnX7gPyi45LzIXhmTsfDIg1d8RZw1UyQbW4eShh03unS5RHDTVmrU8IxC85yW
	JSAUlA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40u7baq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 13:33:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so1561994a91.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 05:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766064837; x=1766669637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLk8SXiYprpUvnDvLbLafiQmZVsZ135ZwhPEfPUYFJU=;
        b=ksrfDVpY2rsj3wMB24QCB2GwLI+SjTZyPbOZdHX2r4pfi/XtAqBPQcoYxCNxh20REG
         O1/kg+EbOos0ntg/ASObNqflMg5LKXJA+n+mFgSe5ypdpXHs6Jk5WSfJLtN9xhCp8izn
         8OyoZc7ZZ9qt9jEiS6ylNTOZ9ZcCG0dOPvDYiQLxbiO8qiwndqOpxRF93jkQKcYC2i1k
         Aic1/7jYOFY9W0ZJHBqFlVMgil9l9JqdJ6DAvyDUN8MCkC3IppdXDfipvdkPgMPpEOSO
         vX39Wb0ePGqEjHYhw7qJ0sATYtz7Zv5UE9NaxqyPAzLm0pqhNabyWM2c9Qzc/MlzGEgV
         796Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766064837; x=1766669637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jLk8SXiYprpUvnDvLbLafiQmZVsZ135ZwhPEfPUYFJU=;
        b=sY4ryHQeP0ERJgHzWcCCGyQvvrpP02CkD6gzNyjv51ifl82fqR6AXtoAw9J/vVJkfF
         296/Ufkb4EhdiOPlD2T+oJ3915grzSCCEButf6m4tc0r/0NF7+FnThRahNQoyibcgTwl
         g6Td8MqkaVT9eDzAI4++WrjaEeaUg/C2IAMKu/G2hajLpjJhuBrPGeJP/Rx3WUR7bwDQ
         ILdhXUaGbMfVlFvN7BuffnQ0vlUexIoZm+fiZhPPyOewxvjqQJ170fqA7ZVYIJj9nrvP
         jwnm3iL/nGnawocv8b+gE74CocKf3D6tkj19k3/FgluBk3D3ICfG1ZBIhUzB9viAA0VU
         6+Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVIvknUEFgoqgoMawaRi1UmfrkBVtboIUeML+cMGOum0XaGKfYjGAwehNqeQjEmYWW0BoNBil13LT0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj/jbZ1U+KFG9igx8aUDd72QtCLNmDl0P17mpuWU/Zu2xq1Yb3
	A4R9Tpjo50VbPEwLUFKuXAoqQwSEpD2AexRGMvG74kZm73tl64EwVHvDdufwZbPXXv3EG1aIJSu
	CrxxzUWyyLJbxghNDePK2Q2dTwbajHGvFk/mUUPTH/nFi7xXgOIbv9LxVBPuSN/tadO20Ss82Nr
	1I7+vPbA5g4NZ0qGpSSLr4Bo+WxLTBPFR/rHCPAg==
X-Gm-Gg: AY/fxX7KXLR4Za4md7rQoOVrQ9EnSEcCgL8VposaG7TEcjwzvrwEUFRwFFp0qGa2o+f
	QTBWyeg3kV7xn1T0aIGKNRyUi/erzpvw7EZnVkuBbNKwPA4o9CdTDCslfAaCY5DY0NeeRWa/YLR
	6zS8+SlLjjjecwJaCZhA7xnIylQmyL4zjQccf0BY1Xi31B4lBOUCrjQIlNk6aCfU+8Mos=
X-Received: by 2002:a17:90b:2d83:b0:334:cb89:bde6 with SMTP id 98e67ed59e1d1-34abe3e0a40mr17088246a91.4.1766064837017;
        Thu, 18 Dec 2025 05:33:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgsf2vQNv0CNOtxC5mwAlsF7Af8JajfyasK6Rb1q2H+nBf6Kt9oxtXSF2qLF6Kmm13hAHAbQoUfTwZZvVEmmE=
X-Received: by 2002:a17:90b:2d83:b0:334:cb89:bde6 with SMTP id
 98e67ed59e1d1-34abe3e0a40mr17088218a91.4.1766064836449; Thu, 18 Dec 2025
 05:33:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-wip-obbardc-qcom-msm8096-clk-cpu-fix-downclock-v1-1-90208427e6b1@linaro.org>
 <8d769fb3-cd2a-492c-8aa3-064ebbc5eee4@oss.qualcomm.com> <CACr-zFD_Nd=r1Giu2A0h9GHgh-GYPbT1PrwBq7n7JN2AWkXMrw@mail.gmail.com>
 <CACr-zFA=4_wye-uf3NP6bOGTnV7_Cz3-S3eM_TYrg=HDShbkKg@mail.gmail.com>
 <f902ebd4-4b4a-47c3-afd7-2018facdaad6@oss.qualcomm.com> <e2eg3zk2sc7pzzlybf6wlauw7fsks3oe6jy3wvbxkgicbo3s2g@tks2pgigtbza>
 <5e255831-3e84-4f3f-8b4f-c66d05e6be09@oss.qualcomm.com>
In-Reply-To: <5e255831-3e84-4f3f-8b4f-c66d05e6be09@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 15:33:45 +0200
X-Gm-Features: AQt7F2p3sO84AEGdlajb_bnGjwVEOm9heGbIyV8I4pKxXUyFoxAcwe9vyWQ_rCU
Message-ID: <CAO9ioeVBk0CLGcdUdbixVGwGfheOaVwX=i39JovHa740mO4kRg@mail.gmail.com>
Subject: Re: [PATCH] Revert "clk: qcom: cpu-8996: simplify the cpu_clk_notifier_cb"
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Christopher Obbard <christopher.obbard@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: eKgu7ECYMDFeFuQbrW9yl8YknDEKj1he
X-Authority-Analysis: v=2.4 cv=Z8Th3XRA c=1 sm=1 tr=0 ts=694402c5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=CAFnV92_3V8pvHR-v9AA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: eKgu7ECYMDFeFuQbrW9yl8YknDEKj1he
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExMiBTYWx0ZWRfX7WlKLVXPjYod
 c/d1RduIGfuuQRLppnHS1L79bavAbFZ1Xh4QgN4T3mkE5RLRNi1o7itP7hiTHjp3A2yjb4icQ+R
 LkdfG3oVmvzKbrzhezLYLAjEDZHTA1mHZIehhmTrBtgDLIshak7DYQ50n4lLelz6k8ma7RPBuEC
 Ck5fQgBeu6vHti/haZ77V3fPYo+8BtKRVQtr8+a68YVE0jERIKFZxZhlk07ZI/CeeR9Xi8dkiI6
 UHjx2r3K2tgRFPxuzLoyUMkgv7gpH9OxrQ0qkW/j9qyFsY2foWqaMbZJ307qCg5yOvhFfEjPsm8
 ukgepv5nsDSuKPH40xMR0SOFw9v5kLlpnZxXEVitcI3AVzhZ0pUqusG/rHxUpGjetxFsdMDyo0v
 twXRoaCCmCjMjALp0LA5WNHg5jlIjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180112

On Thu, 18 Dec 2025 at 15:09, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 12/17/25 5:39 PM, Dmitry Baryshkov wrote:
> > On Wed, Dec 17, 2025 at 01:22:59PM +0100, Konrad Dybcio wrote:
> >> On 12/14/25 8:26 PM, Christopher Obbard wrote:
> >>> Hi Konrad,
> >>>
> >>> On Mon, 8 Dec 2025 at 22:36, Christopher Obbard
> >>> <christopher.obbard@linaro.org> wrote:
> >>>> Apologies for the late response, I was in the process of setting som=
e
> >>>> more msm8096 boards up again in my new workspace to test this
> >>>> properly.
> >>>>
> >>>>
> >>>>> It may be that your board really has a MSM/APQ8x96*SG* which is ano=
ther
> >>>>> name for the PRO SKU, which happens to have a 2 times wider divider=
, try
> >>>>>
> >>>>> `cat /sys/bus/soc/devices/soc0/soc_id`
> >>>>
> >>>> I read the soc_id from both of the msm8096 boards I have:
> >>>>
> >>>> Open-Q=E2=84=A2 820 =C2=B5SOM Development Kit (APQ8096)
> >>>> ```
> >>>> $ cat /sys/bus/soc/devices/soc0/soc_id
> >>>> 291
> >>>> ```
> >>>> (FWIW this board is not in mainline yet; but boots with a DT similar
> >>>> enough to the db820c. I have a patch in my upstream backlog enabling
> >>>> that board; watch this space)
> >>>>
> >>>> DragonBoard=E2=84=A2 820c (APQ8096)
> >>>> ```
> >>>> $ cat /sys/bus/soc/devices/soc0/soc_id
> >>>> 291
> >>>> ```
> >>>
> >>> Sorry to nag, but are you able to look into this soc_id and see if
> >>> it's the PRO SKU ?
> >>
> >> No, it's the "normal" one
> >>
> >> Maybe Dmitry would know a little more what's going on
> >
> > Unfortunately, no.
> >
> > Maybe, the best option would be to really land the revert.
> >
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Is there a chance that this removal:
>
> -       case POST_RATE_CHANGE:
> -               if (cnd->new_rate < DIV_2_THRESHOLD)
> -                       ret =3D clk_cpu_8996_pmux_set_parent(&cpuclk->clk=
r.hw,
> -                                                          SMUX_INDEX);
> -               else
> -                       ret =3D clk_cpu_8996_pmux_set_parent(&cpuclk->clk=
r.hw,
> -                                                          ACD_INDEX);
>
> could have been the cause?
>
> On one hand, we're removing this explicit "set ACD as parent" path, but
> OTOH determine_rate should have taken care of this..

My idea was that we switch to SMUX temporarily, then CLK framework
fixes that for us while performing the actual reparenting.

Christopher, as a quick check, could possibly revert just this chunk?


--=20
With best wishes
Dmitry
