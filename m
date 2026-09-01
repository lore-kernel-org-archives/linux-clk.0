Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2473B1014
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 14:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272513; cv=none; b=BgeChjHWg1FZo+NjpbpZU6KPpCu+LRoPC7qQcyb2GyCRVftzk4Arr/RMbpHDCnlsFly+hDeK5dSFwVVOuG8/1Mx0/B5NYFINE1ErRH7jTGGRRlLuA5bqdDx0CKFr1ooP/y6rsd8LsRH57vvUa+VV3spRT7w47wH42Q6GtofwULk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272513; c=relaxed/simple;
	bh=lK07nJooOXrUnR/T+SY3MJcWCkqipmciLNKYSSDo4M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meUlY4dX6yD4sgvgHOqKWDIcnbifJsMohmB5au5Gy+w2yLp2wbIjKUawbp3otnuFX3WjaMcQ5mDMLu571VCT+UVDFpS48W5cK7LKVJnS0i5fPcK+obyN3Wg233ICDSDllbJpwUnc/iyWYhi29yjLLOjjObA/EgogbOpxWHyA82s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dqp522Lt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIFsJNPo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dqp522Lt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIFsJNPo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8xUe2217344
	for <linux-clk@vger.kernel.org>; Tue, 1 Sep 2026 14:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P+rS2sPfhETZrCJHKuB2Ca39
	aAmRCaMxY/CpKlOj7wY=; b=Dqp522Ltz0XxABpnoLQXB5ww21Fyb9eOc8goR3W3
	c3BT6sRpS5XwAahdlXPBpG6vM0v3Y2MOG3FJhwjySTzxLN40WBDYhxfajflLitLe
	6hqeNuP77aVS13YXYUjK5REKmu1RxLEp0+F2ZZ2s0nuir6rXLdzFReSTbGEu+hhr
	PD3877qDP+UVn9qvOiprpiynE/Z4HlIkOR/DnuAwETm26OW+eRory1+pMJ7Bkv5O
	BMg+rtAQ60d46mg8c4w0ELeo2ATyKIz8qvBUEzv5+vv0N0UKroQsDYZPwfuxEk+T
	NfsybzdUp85hpcCbNDIRcpyfbCfZ8s5gvgCQLdZD+rpHIQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndxay23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 14:21:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78055b483d8so196310137.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 07:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788272510; x=1788877310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P+rS2sPfhETZrCJHKuB2Ca39aAmRCaMxY/CpKlOj7wY=;
        b=bIFsJNPoa7vADEk+goDfao0QJmNJlHmL6DNGWwfHCJivK6uYHu2TJb5ozc5PXTh5lC
         T7V6PuADl+6JfsGviTS1AA/8mzwRNUf30jP2pCi7Nsm0Ag/KCk7SoxBHMstvpFLzp5UH
         AEqzE6GHmLo7TrAI6Sx6jCe1AUhhfdEsXmtvQx9qZjTeYJD+G8NUNME24094NMUpqXN/
         BEnYVFAQ77ONEk+Uj/5JRLC/pVaZhEeaVwQR0Cv+SU0IS3lT/Cyb0XKYJSzIbskkPqar
         Dvqaxcn+esPMa7OW1ak4ay9Ts/EglxikHpzcN8c14lcY4uFuG6q0MYbDpZDX8fbfi8xC
         zQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272510; x=1788877310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+rS2sPfhETZrCJHKuB2Ca39aAmRCaMxY/CpKlOj7wY=;
        b=Wk2LNb8ciLuipgGxFhcS3zJV3EQQXakvyCMt8IjuTUzlhaP+CDG9dJBQdGyTNcNWtR
         dhHA5dMX0YRAnQhoi+0yiZzYBfMhc7wcIpYtkoOJAshcyGdkUyQUnyfoODhPNaErpldR
         +M+z9SCrflDx0Hv1Svq4ujwy7J/c0oROEcs6joEv/9RHEd0mGaSFrgwlLg1HsRO1xG2i
         FfEVvx4hqrJ7e0krL5u45rBPJQylAl+OtxWCUtN4LECg2gmV2BIzCgG0Tjd0VsWJQdXU
         W/4p/Yl2/iWEdCZSlBIFEZ+HudPROqLbBBW+2/Dd8pUZLx6jjJK8bBWIfbG0nj4LnrZN
         0/qg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/WslUJftqEMAEN4avNY/y9A+XdJL7Pw2ORgTSHaoBNOOZEmAtr3KntuQ4TNyWcZEAex9U8Fu2l8w=@vger.kernel.org
X-Gm-Message-State: AFuF++lgmYXhx8qtsDpJ0OJdwnN47SFbUtkM5lE4RuspD5945wy11KzM
	Ty1KokNUA++Gj1h/g6D0kYp170YqLjeZOIMaNWGgC4E7zmCzYv5Fq1WwEHGFVq1GuSyOtZpFmLC
	TkmQIW0ZW7TFHEntruBvj+7kE4NxD9LH072L26jGA0mcqmEL854it7CL52JBEZc4=
X-Gm-Gg: AR+sD10uTYUisBlv3dyf/c4eMwc/2YxCf4KJnmw50LHEaSv6D7A3kha4Xe9v/3j2/d0
	t1KdTG8urtoxkc7h+4+skekAwdGIQGI2roPHRr2WW9YgCF7zuAyEGHp2fJ2Sl++7Glx2Bgz0LAL
	pn2fzlPKbyHPJFF0vapXHlZEIAvR1jsOVJJSPi9b8jeLlDRGGJPMNiE6FZu/K+xedaacNiFSIJt
	uIFlWJN9yqxPzU99XZTDoQ1/frmiRoonZir/oX1XhILu0zC0Tbf2NCLDO47vFKWIc4RZ9BK415D
	4Tk9TH3JY2NQdshEZpG+7ojTs2GsSA4dhwj0oZhRe+4YvYcheGIbot0o2O++TgdhOSM7AssFw6r
	BUd8I5fLqbK6h/Q==
X-Received: by 2002:a05:6102:1621:b0:77b:b14e:b670 with SMTP id ada2fe7eead31-78598f4e0c1mr10248063137.8.1788272509937;
        Tue, 01 Sep 2026 07:21:49 -0700 (PDT)
X-Received: by 2002:a05:6102:1621:b0:77b:b14e:b670 with SMTP id ada2fe7eead31-78598f4e0c1mr10247829137.8.1788272504502;
        Tue, 01 Sep 2026 07:21:44 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce089c2sm70778575e9.2.2026.09.01.07.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:21:43 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:21:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        radu@rendec.net, taniya.das@oss.qualcomm.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
Message-ID: <as35xamspfwpmbravcz6g4miz4nfotgsmg5afchgudoh6fd3kz@kbp7kotpxyet>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
 <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
 <CAA-+ukJWFm1YOoWTO5TmuF8ymNuRGtsvOm4zruwUUEGpcmKNjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA-+ukJWFm1YOoWTO5TmuF8ymNuRGtsvOm4zruwUUEGpcmKNjA@mail.gmail.com>
X-Proofpoint-GUID: FWxBNKTfeFzA-v9GK-qbHQO4K8zqnYwd
X-Proofpoint-ORIG-GUID: FWxBNKTfeFzA-v9GK-qbHQO4K8zqnYwd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyNyBTYWx0ZWRfX/Eicj09VPUyb
 RSlmTK377Eyc90Iwk/yMeQBh3wxJB0ay1HReTeum9zOtwh257jf6hMOfv5VFhnpneeA5tkyM09v
 Ki3u1DB1epZ0pFCeKLvATcb/6hXoquI=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96df7e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=S17URGUXwItxho7lnLIA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyNyBTYWx0ZWRfX6Hw7ObzmiCKU
 dAMng5aeSWYcHgPGW2KfyrIQY1JWmnwtooF7xdQiy7+UinPxZ9cslbbu1NTr15Pcuo9fCHI2Bd0
 kU5flmOX34/6rJfY2c2mg+zVgcYKb3BLoS5qs5Ovs3m6h7ADbEMk3KJjvnKUazhdJF9smgUcFRN
 1C3DNayjC6699KB31w5/fHGxUO1m3OmcLLIbbI7jgdBWUuqnf7nZQdNddjVn+/30c1HUPwAvd5f
 WMZMwggSx9lm9NRmNWdvVF+urVg2qkBdl3pki9rCjSFoClzYgbV1AuRNe8J6bNNZT7e/JLYwKgC
 OqScs5m8GLSgHufu1Cz8ap1NgkROtgykLb90WkIPk2JwWhBWRMs7g2BU+3aiJrf4wiFUK7gHQfG
 aOdFLihmLAxu/7ydOw9kJZeVRbjQkLCAIKBNq4bWRhcw9MtLa3smSRwrkXPYC7kp5nwSFt+R8b4
 qj4nyjWSkjH4Jl7Csog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010127

On 26-09-01 18:22:34, Sreeshankar K wrote:
> On Tue, 1 Sept 2026 at 17:32, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >
> > On 26-09-01 09:24:35, Sreeshankar K wrote:
> > > This patchset introduces foundational upstream support for the Qualcomm SM7250
> > > SoC (internally codenamed Lito).
> > >
> > > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> > > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> > > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> > >
> > > This patchset is organized as follows:
> > > > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> > > RPMh clocks/power domains, GCC and cpufreq hardware).
> > > > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > > > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> > > interrupt controllers, clock providers, power domains, and reserved memory.
> > >
> > > Dependencies:
> > > This patchset depends on the following patch:
> > > > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> > >   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> > >
> > > Changelog [v9]:
> > > > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > >   Make all clk_init_data instances const across the driver.
> >
> > You sent 3 versions in less than 24 hours. Please slow down.
> >
> > Give a chance to the reviewers to have a look at each version before
> > sending a new one.
> 
> 
> I apologize for my actions. v7 was the intended new patchset. Unfortunately
> there was an interruption during submission of patches, only 08/12
> patches submitted.
> That's why I submitted the v8 patchset.

Yes, and now you have sent v9. So even without the v7, you still have 2
version in just a couple of hours.
