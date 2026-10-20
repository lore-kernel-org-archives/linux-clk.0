Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500119;
	b=HT0h1WxyXi5Sz8t2KQpFZP/9h1EM4bxcHTyQ7YRKVCl6dRljRpruuKmqkIPS1djR88WL
	 x2UCM3S9gwFRE+fpyhwa6KWPovf4gP+ZXi+biEfmVxgE9mwuAXgFMiCu4o2yWdGo1UIkh
	 5UKyFgKPVrwf/3n2v5hP1wROsn5UvabUOq0bwe2lHS8UXQSmYeQWVFTb97XVGLq3xXS08
	 zf1y4345vT2LNLp9e8X9Hno/WPBQXexhkmSD3u6t976UxxdVBz5r6pS7xK+a98/wpFVMO
	 SV6r65YniThPj9Irvy1oiy6UkveusJTRAonRpA+ogrE5+PWNT7Sa8iHpCdK7aTuWOlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YVgAwVbGT77dwzosKyXh3279DX5DYFH/EToqrcKE5QE=;
	b=qPfpw7DjP5sa1HWeb+B64p1aZNhLME4As9Z6fJsJDAyzCe/OUUG9/1sBuzvh31y8Eafz
	 ZsDpiiXuvOLXOTgoJmCFN5csLwBH7h3d7hgBY1yVCOthzJ7sw5QjHWdt+Rv5gQW1K4DeU
	 AlJwSwEZ6LsNlEopstkL/OwQg8LkFTc2e7P+We+GTmxU7Inh2pJHiWTw3sLiZeZ+WPSq6
	 H19Wdg3CtDV6IXpNMSKVu7C0y4nW2RuUrhjmU4UE3vwF6GthDntm+BvdCJkajs6m5offf
	 +moNzPMvqlQG4+DZ3BYddvdmMOsSHuxqkaW8hr+56LD1sVzN12lULuADqG6yUDg1FkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dmMPfEsx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXpNaWBy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92377606A31A
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 12:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92377606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dmMPfEsx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXpNaWBy
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAwtO31929037
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 12:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YVgAwVbGT77dwzosKyXh3279DX5DYFH/EToqrcKE5QE=; b=dmMPfEsxr3Yvy9mp
	lfVOSRCaeoTcvPMCdqQbJNOz6g6NgYX97nh+G/FKaK7cQHYTrxMdU23wImycdA76
	3BiGTVYNxcZUVS/E4fUiYC8qVD45jf005NqkRn+jbb6dS71+6QPWvqSMouyaVmXo
	hxQ1xRELTI2TDYmuhwUPUPKIzsj+b/DilaNEduoAMfiwC8/i+10Y4oZAtkJRBS6K
	D4k3zRPU9I0q9aifNPTi7DPaZgM9jQmxHCKgeMtdCXsg/dgURLSNDgUQ5/GdU5Xh
	iEhv/mVEloKfvTjhKWbTuwkwIqjxiO22fkhX06D17EVXVv9dm/ezi3lSvbq7sXAo
	nDJeJQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ntdaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 12:41:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ae8e7e546so679117285a.1
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500117; x=1793104917; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVgAwVbGT77dwzosKyXh3279DX5DYFH/EToqrcKE5QE=;
        b=NXpNaWByqK4GCgMHrFUI5saJSihBBt3qUPZjXUi01qGQXJLE2zS5RoqFu3zzQcMnuE
         7PxQJVPsShln9ZW4eOGzdQXSXB29/Ugi7TkAll9TALmOLDRjGFfibLycnEBG37AecT1L
         u5zSuShpcpQsGIX34FEy3lH6MGfHiaZq5BZjHn2a9O3uyF/Ntw2cs3TsryMHr4KZbC92
         zByVjrvuxGrE4A711QIBhs7IaIqsUFlXHfqMm4RU8ZP1N5tWAYdYD+G4UKxRWxkA+L/9
         SdztBuz/OYS5JSgqxz3JWSxvJKEjdbAZZr6iiKdcl68hYwHcA3qayzunprHb4V5UzwgM
         o9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500117; x=1793104917;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YVgAwVbGT77dwzosKyXh3279DX5DYFH/EToqrcKE5QE=;
        b=sgDFzFUhd4qMSZbLIIh0mjkDZ6FsNjeV6OJxcSWHU3XEP0e0MgP+ZcgImLwm9ifI88
         4bSn+LPci+kDpyfmLe05f5KwgtB2O9opWFjEP/VgqXFx0zVPBFuxA5bmCi443S1zNJLd
         YnGzkXgsSAvZtOxABTijLkcjs39NtAhQNhlozFedUXGwDPWvF2HJySUUaJBQfmMQjJBH
         MjJAurGTs61GGIyQz8UmMy4PnX2ObuufWWdiVKu58+KFqGkADZMeTWrpHLG+C1bJDQW2
         YpQNmGGS5uwHSA26fZsTR7xFoy9ed/HEZ0GLl6yvop4Zxdla/FtwX48t54FTF6Z4cu7k
         PJWw==
X-Forwarded-Encrypted: i=1; AKwUvBwqwrhLAV9LGIPFBwYpmaeUzvLw2wKj2d372joEC0i6cnKDMCeF3uZgTa1AFOtSddl0ny1vCdDtKnY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcsmUlJTVjq/LUPNgS/8LyQSowy+shWhoAouyGQt9IGtXRaNw2
	JdHF0/B69sgjcN8G2VbwMSx9AYMKKBXVB12bb9GFl1O0KJ9L4ieTcZ2SWnIUhLfs7ZRj6jJprDv
	kbQ37tRy05RRul9hDHc9qChuC9OGrJr2PPpAXHuDQ1AJhSW/Iemtuk8CcAlT7c0U=
X-Gm-Gg: AYBFou3XYTehjjWppU1OJgsqOcPmYvqTUXXUIMGKQNIm7T3XNk0QQB8k+9h7lLeMlul
	4NeGgh69dnNxu5bZxB/16FFzr8f7JzPBwDVdF5iRTiAqgtuQT2SOyOenJ2ys2NAT2878zYbMoIh
	wYtfjKpiXMBj5NLtnBFDcuPOdybn0fJQtGbLISe0Cmp0BakT6byGAW6XwMmr+MGRLqWj5jhFYGA
	ORjzBCzMY3CRV17cOMkgRkg22dpvVLGQc6UHB/PPQ/3IecEXYmvSJSq0W9xiHPyhh3zw633wz17
	vVFEwh6W4RmJVM6b3TCU8hVX1qE0t/kKbMwewAszahrwPPJzPcH/p98Kvh3BKgY1j/mkGXpj3f7
	YnDwJRkuBg/oKwMKF
X-Received: by 2002:a05:620a:1b82:b0:93c:b10:7243 with SMTP id af79cd13be357-93f29b80a1dmr1660120885a.5.1792500116927;
        Tue, 20 Oct 2026 05:41:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1b82:b0:93c:b10:7243 with SMTP id af79cd13be357-93f29b80a1dmr1660113385a.5.1792500116235;
        Tue, 20 Oct 2026 05:41:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cd482bsm69803725e9.12.2026.10.20.05.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:41:55 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:41:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Use retention for PCIe power
 domains
Message-ID: <hmslxyt7kj3w2lyniw5sup2dcjfvsndckwhrrrk2v5ofpry6zz@nrjflylnt77j>
References: <20261011-eliza-pcie-gdsc-retention-v1-1-9349dba7e0b6@oss.qualcomm.com>
 <273f7f8c-e24d-4322-a418-4fd5ed84b0bd@oss.qualcomm.com>
 <e255ml7kf2pyjnw4k3ssi3jp4hkovw7x62cln6n3xbf7tz5q7y@ijqwv75233a6>
 <CAFEp6-3YP29y5JYp+6Cw3T7bGEJHjfGD9mYsiQXGaTSegsMWXQ@mail.gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-3YP29y5JYp+6Cw3T7bGEJHjfGD9mYsiQXGaTSegsMWXQ@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX0nSISVYvD/67
 JwY2peId8zZDPU7Tk/wh+CupO7Inc0BZLhRBKNg2enjl6RRHuVX8+GrVd27ory4PnimTcykLGvI
 EK6/wphIIEnfoRmBZxmqzpn1T0RQnGI=
X-Proofpoint-GUID: QMzLTajuKueQSbPClQvSsZCCqzjnDZKH
X-Proofpoint-ORIG-GUID: QMzLTajuKueQSbPClQvSsZCCqzjnDZKH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX/9mrVmt6/cNZ
 L8e1MClA1BTRGQxwTEoG10oFp9mhzjNsaDno4lcsr2s4+8qEq/34IA/Yq0tX/xFoZt3ELARsCW0
 uLg3146hk9dKCKsYfyeXTVfb3iYcwEz+pbuSgZ9YqxTpV+iUhce82n55FR7LAAxEL0DAGS3WtJB
 WBgmwUbTTIo//Ws4lVDE7vm6Wz8pnKqIYc1mGdwMpcGQWuRKycLjb0D40dnf15mDWJ7xwqwMWQp
 tTbhkGxn332p33si/szUcIHzBHgzYLqrv7CFZL5XvF2XTU+ouMIpRaW2hIVB97La4XOjpej0H1U
 DcRBtFcjPTBV65I9P+gLXFo7h0QABqR15HPVN0lOvAFHXQJWF2nOBi8gLKoC38iqEnGD+K5Wiwg
 fMBqkNkRDqjkOR1EHmffK2SjN1l9jJCIPYwx/ohytprBAMvrk+bWRIJ3HelC0Nr3kbCZJcHhjMF
 k27y40Di82sqnvbsGcw==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad76195 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Wx7Y5S4uw_J0ShrtzzkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200050

On 26-10-14 14:09:04, Loic Poulain wrote:
> On Wed, Oct 14, 2026 at 1:59 PM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >
> > On 26-10-12 14:58:43, Jagadeesh Kona wrote:
> > >
> > >
> > > On 10/12/2026 1:29 AM, Abel Vesa wrote:
> > > > When resuming from system suspend on Eliza CQS EVK, gcc_pcie_0_gdsc
> > > > gets stuck off when powering back on, preventing the system from resuming.
> > > >
> > > > Use retention for all four PCIe GDSCs, as on SM8550, to preserve their
> > > > state across suspend and allow the system to resume.
> > > >
> > > > Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> > > > Assisted-by: LLM
> > > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > ---
> > > >  drivers/clk/qcom/gcc-eliza.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > >
> > >
> > >
> > > Hi Abel,
> > >
> > > Using PWRSTS_RET_ON keeps the GDSC forever ON after first enable and the GDSC never
> > > collapses.
> > >
> > > For similar issue on Lemans (pcie_0_gdsc gets stuck off when powering back on), picking
> > > the below changes from PCIE side helped to power ON the GDSC properly without any issue.
> > >
> > > https://lore.kernel.org/all/20260728-hotplug_pci-v1-1-d1f38cfb9122@oss.qualcomm.com/
> > > https://lore.kernel.org/all/20260729071514.859778-1-manivannan.sadhasivam@oss.qualcomm.com/
> > >
> > > Can you please try if above changes are helping on Eliza also?
> >
> > Thanks for the hint. Mani's patch (v2) is already upstream, so just enabling
> > CONFIG_HOTPLUG_PCI_PCIE did the trick.
> >
> > Suspend/resume works fine now on Eliza, so this patch can be ignored then.
> 
> So should the retention configuration above be conditional on
> CONFIG_HOTPLUG_PCI_PCIE, or should we simply depend on
> CONFIG_HOTPLUG_PCI_PCIE?

None. I think QCOM_PCIE should select it.
