Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9663AD52D
	for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 07:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787729635; cv=none; b=H0wNsFV1Svbt+JVQjr5/pCEm1gwEh3H439NcfoGx+iJJpOQiwrtaJCwW39FoBsFKO8trvCnMhhvYqLj3HFzmMK5YxJPfEJQo3mZtu6IJTD6LOKI42x5wfl9x9ecuyVaKxLdfYXDWcGAhbiBrdKOr6Gm98ZFMXIHGhLuVd6PSRQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787729635; c=relaxed/simple;
	bh=8kPZvBO340xns4CP9VY5wrGpBmxirmg0KvjLfFXDGiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brdi0UuQ1jJHyfYpmfdGnP4vTuBfxkk+AthnoPsmUFVysWByrd5ZOCerKm/95ahd/tpGN2gZpzv+8eqdq11CrJdn7VQngXbpHv4k7GWn81crQ1FBsCQBxWVHsk+4tvu7/dnwoQVEXAhW2L43xn8kJURyNUR6QT/VzEt0cbmnjKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfhvB+n9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsFlwnMK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfhvB+n9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OsFlwnMK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q7UK6f3272892
	for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 07:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m7+teW33YtH3vS4NveYRxOW9
	xtK2h1OQ/WdzF2P2HbE=; b=mfhvB+n9cwA0XB/eGOR2w+nY3Wb29hVGgIs3nhl+
	a/0L6e3YriC5Ijwhqz6bLIaqs/KnvW0A6gx7NI4HkkidvF/wQnl7B3E0ady1IfEU
	8RvBMCrsRuu4znqvQICK8I95Uo57S18QxdOYVEPKjXMp7EB+SufXwwOl0u19QNpa
	Vt5IiFJ+m7Jq8LqsR8ePGvZ3YFnXQYh2cWYtqKv6ojqhwRym/K+xpG9702Kefce8
	v0D0/nJMQ0tzUcvbxQlv8MjRQEhmwVhASoM9P/qQKfZPm/Fcx4GzVA58dOhcX7gT
	r5BVpRWFY18PxcvJwczQYoIfbBpcywRBt/2dqN7M2O3HDg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthr0mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 07:33:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0ed4fe79aso12951216d6.0
        for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 00:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787729632; x=1788334432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m7+teW33YtH3vS4NveYRxOW9xtK2h1OQ/WdzF2P2HbE=;
        b=OsFlwnMKg0gmkOI6Ii97bFsrDeZRusGmc94vmAjET7YJX3OwIVv11pfsQziF1q+Jl+
         GtwIdx5ZWDQIKJQfxUB6B611qKrq/hPchv918jXDygJhQMLai+YHdMUdfidY8AKWRJQt
         8ltRK+FEOpKEtDW+6BwBaJ1XQtOz5a6jCFWIZ4WoSb+15k8bitEOUizHQ/lFcNGANmaJ
         pmiCn3+8UKsjLL4Dcm7IYwQ92qjPfmoMdZmkOMKVwPYzLDSZwpSgvFtZlVseK61cGbmH
         7wQJaW4MLS0polMwaqSv2feI34yDjrWLH8ste3gjr/RD+4lr6WGsTaisbbVUCd0ntIlT
         fvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787729632; x=1788334432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7+teW33YtH3vS4NveYRxOW9xtK2h1OQ/WdzF2P2HbE=;
        b=K6xRECyQ+66WjeOAgEggwI5noVqccPJYbCNy+qnxvQSctKIrpAZ5xHE40xtY7fpFYq
         ZMY6osz3ndmJ2lKO8vw+Mwdf/sXa4Os6xTAADYDqQpYkrtlY9Dh0zAT2TUe+tcov0+pm
         vzJ1ARQ2ICLn5iS871HJyYnidxZhHvZiZukXTLlMk114bE9kcCE5VHzrVb5tmiWWBb1l
         fMRqaP8J9wc28foUILO65yGhznunOTVWw08wjfl2HxdCgtqVhB51O8cJb2sR52fePmub
         a+m6TEfwnpHH02cZZ3fveofXh6m0TILwCFx8kNNL03KQgEDw0pdfCd51yEYNxnr3jfYR
         TUbg==
X-Forwarded-Encrypted: i=1; AHgh+RpoLqIGAQQIkhJd7oX0n/uaNACsOewib8pnXyqbHQdiOzJxQeFH5gQVzlDacOIJGEC9kt1Swwkp9QY=@vger.kernel.org
X-Gm-Message-State: AFuF++kq5ot0oAv/6A8T0OhDmLCTDRydLG+PzwFgjBv6PgVPocf2H5LJ
	H0c1AqQRgk8Yi1JBlnRkVhhq5dZZZ5qwmJ+T869fs/nFX0qY42uDU28fVf56jyA0nLy7rBhSscP
	cGOKJ8dwaDun4rIb8lXkXrSMQmYpxfSp33n7Am4rkH0g0jNHE+NMPf1LLA/c2occ=
X-Gm-Gg: AR+sD13LV794+rvg1VzMI4/56j0YwVG2I1WzMeFfb8xDTkKkOw5ECOnesyHQkBmT6dD
	yAtTOJsYesJLFEff5SHL2iKOAq3GFGkFAdZe42xMnbxd5WtnctrGBdXNsAnEO3zXML4sd6J8WQK
	Us/jIlYv1yyJL9o83xpDSTTfvSjCtMNGrjc1rWnuMM/yjYpA+8isQRbDLe8J2iXNUrSxrENw2mb
	He7WrQT7azBDKAF5MZXGcYQ4Cx1q3LFrRODWSeFVzENmaImU7fOK1dx0dJNVOuYUDwDEuZAe/Mb
	EdY6cyJR1f+I2BIv7qUvD2YtEgYpdQbqe5aBBcKsgZcb4Qr/XpjehC5zXm+lw/QU+ouvx8vq/39
	QjQl/gkti+TnS
X-Received: by 2002:a05:622a:394:b0:51c:1006:a024 with SMTP id d75a77b69052e-52e4247fccbmr39046641cf.43.1787729632254;
        Wed, 26 Aug 2026 00:33:52 -0700 (PDT)
X-Received: by 2002:a05:622a:394:b0:51c:1006:a024 with SMTP id d75a77b69052e-52e4247fccbmr39043431cf.43.1787729626932;
        Wed, 26 Aug 2026 00:33:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d647dsm327339166b.13.2026.08.26.00.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:33:45 -0700 (PDT)
Date: Wed, 26 Aug 2026 10:33:42 +0300
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
Message-ID: <vzd25hldomvwelwiijjnmhbec7zicyvzqdpcc37nyjrmmdkfvq@vxylsjp4yazi>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
 <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
 <xmhintkzkhqbneo2edosyqaxznb2e7sak6oshydtvq5q4qctvb@7axbwfxghvky>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xmhintkzkhqbneo2edosyqaxznb2e7sak6oshydtvq5q4qctvb@7axbwfxghvky>
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8e96e0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vkuWnLlI3icQtIAv_MEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: hFUxNlQzyqVGl3a39nGoxCdXr40q5Ldk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2MCBTYWx0ZWRfX5Bc9iXetZuC0
 5d+sA5c8ZpooJbTj9BhhHbFIEj28oAWtXOkkJt0iJh47IQkr23pIybUDC/1MQArjCQvJXOQUaeN
 Ajf+3XYuvL1xzt3DwXRt9J4WvgqtNBIv6rgp5U66Xc+CsxTodi/EnY0Z9Ek6C7KUNfxBEmkWopN
 0F7HtAarDDVZ037npCg1oYeTYFQ+AFYK2d4tjRwMZhYJGV9WE+iUl+Y8cCM9V6I2vIpR3nFepSI
 DIkNJH5tspL/YI7PbflYZM9NR1vzX621NvlcjS6WY45NsgCnI/4iQxtBqG8PgL42seXS45V0jX9
 HvJ/Ze9JYSZJ7AVxNIsYgMJMkCkkgK2D7xM+7a/8h44lkhN1/oWa2W8iAbnlXlEvnROGqCVD9mp
 0r1cIJ98QVQl6KK+r/18QH1AQtjYZ5kFv27v0GSkzc7XPRAuEwrlx7pYwfDnb8SHwPUPJEBwyW6
 YXJ3X5TAU1WoK9zvnrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2MCBTYWx0ZWRfX0tP7ZGR2UTxo
 1UPOszqQRwwTJmN2muSO82rzP3f5eaiJBJGVhzeqZeviyjaRaDQYmPpRqsGzjHMEVrck7EJFR/A
 9G8p+d3JOU2ApEwfcXW1q5AuvNPumdw=
X-Proofpoint-GUID: hFUxNlQzyqVGl3a39nGoxCdXr40q5Ldk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260060

On 26-08-25 18:37:53, Abel Vesa wrote:
> On 26-08-17 12:10:06, Konrad Dybcio wrote:
> > On 8/14/26 8:30 AM, Pankaj Patil wrote:
> > > On 7/15/2026 6:59 PM, Abel Vesa wrote:
> > >> The suggestion of having the CX power domain tied up to the GCC
> > >> controller started here:
> > >>
> > >> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
> > >>
> > >> and then, for Glymur, it has been brought up here as well:
> > >>
> > >> https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
> > >>
> > >> These plus a discussion off-list led to this patchset being done.
> > >>
> > > 
> > > This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
> > > Reproducible on latest tag next-20260813 as well
> > 
> > Yes and the ""fix"" is to disable the GPU nodes because the custom
> > runtime pm dance done in the gxclkctl driver keeps a vote online
> > 
> 
> Actually, what happens is that a sync_state dependency is never met.
> 
> GMU doesn't sync state because there is no driver to bind to. No driver,
> no sync_state.
> 
> Then GPUCC doesn't sync_state because of GMU.
> 
> Then GCC doesn't sync_state because of GPUCC.
> 
> Forcing sync_state with timeout, allows the GCC to drop the vote on CX.
> 
> This is not only a problem for Glymur. I have the same issue on Hamoa
> (XPS 13). I'm almost sure this is going to be a problem for all
> platforms.
> 
> I'm looking into possible ways to get the GMU to sync_state.

This does exactly that:

https://lore.kernel.org/all/20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com/#t
