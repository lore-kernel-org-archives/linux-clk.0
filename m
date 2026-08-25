Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D496B408612
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672281; cv=none; b=BzdbIH84gibazHYdlTOnmnGvjN6xY6QyZVZytJvsf6Kj1JeuwNMA0cQcL+tBCgIdZLkENZLWOUh5j3+4I1abv3t11cgq/E1K2lhBNqNEAYLJFsFTt/SnUwxbVOwjLn10keO1ClVlt/qIh63tYLXO87AchmxtfHJiGixCNkvSc1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672281; c=relaxed/simple;
	bh=tTSV3+j96eWcnntmCZqdwhCn470mgOb4Ngl5o+ipm4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bz+GXSbnh8c0e2mFuLEAt6JJF1hoxQ5R14JUXVz9zJFntfStPO024DKGeSojbJSWqXwalaHqpYRjD82lRzTdi9T2mZnBCBAbzFawYRxTU4mSo+TABp8CBbWGbVPAWy3zdgZ9ink6OlvDfZhChlydJUTnsBz3x6np52NKF1nFi/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrSiNCnC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=buxjLQwr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NrSiNCnC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="buxjLQwr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PETw6u3247720
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 15:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AvkDRJZrCML6+GocQvDS4cvH
	5oLlZjtVzpdID5Tg2qs=; b=NrSiNCnCi7eJfmVs7srS1fnU6xZj48/MDmFrDZS+
	dEAdzRbqA4QDD86VFROWQ7GWNYbluLgke8C7EEVQIE6UV9e23u8YYNwYbG37dVif
	qAX52ktkDiWDpeU3CbyIAhXd4HG2TNeW7+zWGhZ/4CCzuM72OoN8cPYGSs0NdnDT
	1YgqryKdjfit2MZkULnhdfoL3Z4U3EkMULH7f7oa+/jEaq+7GoOnQlGvHzSpjfqs
	CKBhasv/rALmes8ugbABw/TfHk8nhf294Ke3UeOCj7C5lVjx/NBiOowOXZU9dhzr
	kIJ5Ixb9SDWrcbsS9DxDVaJIjC9bYCyHzklf6cjBt3QBnw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9bnj8qfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 15:37:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c26012cd0so51430031cf.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787672278; x=1788277078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AvkDRJZrCML6+GocQvDS4cvH5oLlZjtVzpdID5Tg2qs=;
        b=buxjLQwrLbgz18UwcFaxRFmKtgEJKvUASjzhWHqGdgMVnCDGzKbPwglEMPGaRPXzuu
         4PEq2oDUbhVBeIuv+2pXMVLy+OQYGFdLrjhSYKxsU+i6kb+rLgYLWUfeneseUh8PGcLl
         qa+J5dWS6RT2XONaYvxhqHSiDOy6p8XZ+4EC0ibloXDwGSq/nFwjnFYqyNWusXtn2AAe
         MdWvpmSVxglivHfoui7iYaJS9XJfyyM7Umar4n31SamOuJVfxxn7sjC/h58zgQP+KuP+
         baf3KEdaKmLu1SqRtCSK+8wwv33RTCO8bVO7nMZqC4Ry3CI8q7U0M4UobtS0fdt/T1W9
         59/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787672278; x=1788277078;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AvkDRJZrCML6+GocQvDS4cvH5oLlZjtVzpdID5Tg2qs=;
        b=KqqdPIGCsHozuDQYb80UEbSsBHSDIK13EQCqAGEj/2gDWy+W8tu3eLDMZew9nLXJao
         4/mqmAhKXxTkUx+exh+hXux8rGz41XHe8undm2wnKATdAz4Tx1g8WzxxeygqTsrywBz/
         PvWGie6MmUBcpF2wPAUtjykxpKKBsu5SnuARlzDTqmbF07hVqXEYRisJ1Z/M/q3m04rY
         66GIaZOFlq+HAx9hUwKxD9fpUyoBskYK7HGnpZL+2P4F+krj8In+/L+T7k+Z6CHQeQIg
         nVRfyipr7GOh0mvBd1xgywsvgAukPQCCDJv/XQXciMdCMXMUBYCLEnZqwIAVt9uljRX3
         xS1g==
X-Forwarded-Encrypted: i=1; AHgh+Ro8sqp8hWHDI7TyvHHB2LyGDmyGjrZvOIKlV/JBqS6qSuZRxit/K8fAQagt/CYKLRyhZFX06jXtFHA=@vger.kernel.org
X-Gm-Message-State: AFuF++nPci1dtMlr8sBTT3M/FYpqw0yTJ2QmByTQXl6sefW8mh+kXgfD
	vE6aobqsozYeiB5OdMdQxOMlGfFOnaOXQULsCpQYrrOrZRxb1kL44YarV3EkHPGkIgV6fk3k4Q+
	m1qgBTXDWqqqEyoRDRoTVaG1OODb62poecV5LIffW4x+ijmjkvQ36AZFNPIp472A=
X-Gm-Gg: AR+sD13fBxj1ipwC7QB/uQFjxHB4d9aTmkHmiTX/7e2H7HBRM4YfPdPLjya5l3C8oe8
	cg/oxbn8iePJ/tHSx2MbN0KiMDsxqmCKkeT5Ohm0KOynfQl1tazQb8Bc+FXnUNatyr2baEDPMPj
	lAToPgnji9JCKEZU7ZUiGkodn3BaF2QfEfcoMi+FpwfEUmCQfbnI/VHGFuN9LI34DhMxHB19/dA
	dmaMjjas3LtrG1HkklP1/YSApx9gKQiAmrjpCjkeMQLy5cfM3UApdYthBjFugo4310LO0Eh1Edh
	fSY+cWZj+N2JH7kGmTioScX9ppupLTqsqcniOS7/2jN5BYin4DOdsZkGhk5ISFZCq3nktWEFF1S
	47wiXrtSkG9A0RQ==
X-Received: by 2002:a05:622a:260d:b0:51c:10e8:ac7 with SMTP id d75a77b69052e-52e09cbc4e0mr315333341cf.37.1787672277877;
        Tue, 25 Aug 2026 08:37:57 -0700 (PDT)
X-Received: by 2002:a05:622a:260d:b0:51c:10e8:ac7 with SMTP id d75a77b69052e-52e09cbc4e0mr315332471cf.37.1787672277340;
        Tue, 25 Aug 2026 08:37:57 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9e96bdsm5339066b.55.2026.08.25.08.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:37:56 -0700 (PDT)
Date: Tue, 25 Aug 2026 18:37:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
Message-ID: <xmhintkzkhqbneo2edosyqaxznb2e7sak6oshydtvq5q4qctvb@7axbwfxghvky>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
 <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
X-Proofpoint-GUID: hG26I7n2-xBIx00JHloR0eooKeB0W8tP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEzMyBTYWx0ZWRfXygzl8GH/c/D5
 bqq2mGXsvx6Ry3wWHltCV+TmY0sNb9hfUCU0z5UD431X5xoGbHQcz50hMxl2CNVMsVYEWErOlcA
 phF37h0rEA0xKvpx2naD6haT5PK+oEQBS7EqTQJwAMsFy5CXIn2k4gjHMs/PPbTGGn0mAL1Y4jP
 JajV+mG/PjmSBhFZQdL1KJCgoWZg0pHJzlgu7jfKLo09xhJKTgprgHawQtlPJ97lHuzWEA8xJOL
 1DWjWDlfY+onuuG4sRgsxLzDYb+ctyD3ofBFSqUglIpiOuAO44k0LSzeO2j+a7WOqI6arArQ4CN
 Unc6vU2A8IzHa5AlZQ1l8EucyQMO3Tj+R++3YM6J7FE12A2T049RmjzftIPA45MYqQ596BebcsC
 jDDlT6ehBs7besgHYLN+lnsy4/QC4uFGw4A7M4gCpKlmHpxJ6DQUrObYoIBsUeH+KM4bSyu4iJA
 8EK6jZAEnU+2UtH/+gg==
X-Authority-Analysis: v=2.4 cv=ZuHd7d7G c=1 sm=1 tr=0 ts=6a8db6d6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vkuWnLlI3icQtIAv_MEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEzMyBTYWx0ZWRfXyYO4PyT3Pa9M
 4oItC8U8duhDN92Bpakgn6N0ruALyGCZhUP0ew7xQNGE36fuZ/M6mbJZerwXR7ViFiQp9k+Lv7y
 wUYihNMLBfWlegIkIKXUpWk65A0fSBM=
X-Proofpoint-ORIG-GUID: hG26I7n2-xBIx00JHloR0eooKeB0W8tP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250133

On 26-08-17 12:10:06, Konrad Dybcio wrote:
> On 8/14/26 8:30 AM, Pankaj Patil wrote:
> > On 7/15/2026 6:59 PM, Abel Vesa wrote:
> >> The suggestion of having the CX power domain tied up to the GCC
> >> controller started here:
> >>
> >> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
> >>
> >> and then, for Glymur, it has been brought up here as well:
> >>
> >> https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
> >>
> >> These plus a discussion off-list led to this patchset being done.
> >>
> > 
> > This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
> > Reproducible on latest tag next-20260813 as well
> 
> Yes and the ""fix"" is to disable the GPU nodes because the custom
> runtime pm dance done in the gxclkctl driver keeps a vote online
> 

Actually, what happens is that a sync_state dependency is never met.

GMU doesn't sync state because there is no driver to bind to. No driver,
no sync_state.

Then GPUCC doesn't sync_state because of GMU.

Then GCC doesn't sync_state because of GPUCC.

Forcing sync_state with timeout, allows the GCC to drop the vote on CX.

This is not only a problem for Glymur. I have the same issue on Hamoa
(XPS 13). I'm almost sure this is going to be a problem for all
platforms.

I'm looking into possible ways to get the GMU to sync_state.
