Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78826314B66
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 04:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786940587; cv=none; b=uwdnBcsbkig3q7zYyYuGL563pZkj6Z+68LNuLhjPiu1ZFzxbFjgycwSgyRxyGc7pr8tMFazQjX9NOERl+zV+jU+DZlKsuxD7dkirTKP1KMXoNq3af24UjahkSUOgUMnqiTIb4MaddCgZWgg2CxvRMg31mNIb6JPQLnryYlZAVcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786940587; c=relaxed/simple;
	bh=4Eq3X4KO/Ipz33FGDKM+RWO723WANUHv1aaioiwwoIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjVixxVzVpjYCL2kRbg2fnERrp0QsanKtlTHbzuOvxxDoFTQQBZ7LCl29Y0y/A1nndSVl479xARuFCA7YmbteNuhl6BmDDOVaHA0A2DukHrjoGTYBjoZvHAvNfVGwYViBUbIRz8+sh1PM2JgPxhwklsO3/kFRt+Ko7WtNEZKsLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcLnJ4g8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2KuPr4p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcLnJ4g8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y2KuPr4p"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLCNvj4058250
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 04:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ASxHMr57CeRiHl4qluMm7euY
	Vc0vlVaWA8aqdtapJrI=; b=pcLnJ4g8fstRm2x/GdnWW2tP/k0mpFemKLTOrfy6
	LbgeUUHe+TtslOzAhJ3vRQ7mQDaLiPUh+E0KXc6TbFfzwXuRAdEdgeYioCBXT6JU
	HwNxCR0jJLS/TWO/UMZQpqbVOvtm6EzbiYKrnd1qU2+Kbb335iT0IGUjpgPqKCMj
	2IhocavzF/AgaO8LWAWIGiEkBSDSo9RedbiOODH4G2EGmK23G1lEZtc46J3+e2kp
	WShxWuQ82fQncfMMRUImdpnJMbuemr9fBfu/b5e1jN3rzYurgmNpAbeXi1nNjQ+k
	X3zY+1EnYXoXvXOcEo7joCPOu5t7tIgf1CVQbpBwU13Low==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7vyye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 04:23:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so304091885a.1
        for <linux-clk@vger.kernel.org>; Sun, 16 Aug 2026 21:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786940585; x=1787545385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ASxHMr57CeRiHl4qluMm7euYVc0vlVaWA8aqdtapJrI=;
        b=Y2KuPr4pvhWgq9H54CTGFMgyn8++/7SlMFOQSr9xr/6AkHEEAcCdIchzEZyqUNpzez
         s+E+KuNIkuuyOlsPSxK4ban7qbQSpT1G1bPr+s/4p2E6beK00sEWT7glbMyRIl7kFOGJ
         /ILda0fjhaQQ1Yjh/kLdK74gn5zYhjpYaqh8u+q2VSN5d6uYZaHlOkUKq+6Hc574Uhmv
         iX5/MKxClppDanAR6NO8vujKq7eYuEoT8EtucqsE9jvqvJgjGyJAJio2ypuSu0k+Lzjd
         rHjGGi6kWjOLKHUFLh6ML43F6BiGPN8dFdwmIpQTNoZ/A7EcrI90gwBFoHMo2GxJfn/i
         tYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786940585; x=1787545385;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASxHMr57CeRiHl4qluMm7euYVc0vlVaWA8aqdtapJrI=;
        b=CQ32OFd2ufT8Izk5b/DrvoNDSr5mz6f1WD7BRJ02XjNeEyjhvaqKX0Ykcu8zeW9Nx3
         gVrrlL/B4eoQxmtQYTUOEgNlUIsy5Ve+oHakAn+gjLRzTblmsGAWKrtQ7nc4SYpVCsl0
         +RIRxfz+k3WG1ynpFTMDobWioyDBz5jKE8gABleFEPrVj/7Jjz0jyMJuzHgZk/dlZYRj
         mtBOy79nDr0m9RzteMRwBhwdJP5krb6/jBefWHZKlSs5WuJisD4foVOU2NcsE/wxbqTf
         yZvK/x+5YV1qwPth05ZAa8GI0Rpytt4HnUgBPl0zD3KmZFNz8kZ4mwbkQe7W/v3AHXQr
         W4rQ==
X-Forwarded-Encrypted: i=1; AHgh+RoX36f1mzHFjJSdJmmWekdAwwgwKqHaAr1o3UHF/wI/iezU8UW+l9CcQJJNjPtZ4mJ9LcxB6fV62GU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDlFJAlYgmqSZqzae9g3Rqrvw535hmPBF19kwnvo1HpA54B9R8
	SA7A27AG6eBBk7KYcNsEpGNrIxShaE38uXgNMTESkqk7mOVQjZqhHpKKG+dqX3zagAveoxNqMb8
	E5adu5SNk9s0G/+0yJzc5EMH9b7mCLNQiYSfKBPYPSR4uE9bewks6hrixiUZgEy0=
X-Gm-Gg: AR+sD11NnAXZgdb+BNuNER6u6IbiurBuSLI3+PXhRO+NdeMJ/vMss5lk0bmvtBG+CYF
	5Sjn7dLImlkN0SL7HmLReOtlPBLu5PPKKJn43UZZl2ZEwOPXQ8m+mepzPraDPl7h6E02GZ4j+4x
	6ZYxOno+9koZ/2aIt27oQgbWCl/jblp8V7E3JQ0smsMF0HVjQGOEsq0ryKPaSYECtdlyL4V3xme
	Z6u4+KizRVESyp5yroRz+VKr2GdEYNtGNPDglo9PMjK19MtSbm+p+r9972gxOHMsrVjZs2Pi7bd
	NzOfJ7nMmJLUtXShd2lso8Hdx4rR+3WTqSstNzrAqMlcp753AQABwwkZO4TBFnDldTtJnG92rnR
	VtTlDqpbb8FKjPt68aGNOmLfQFuxbLt+bjVH3X0CYjGVo8w6dd+ZTS4Y4vrzYwcafKR6sGLJ+6D
	ETSvFHxUtXBchH
X-Received: by 2002:a05:620a:468e:b0:934:a0b2:9bde with SMTP id af79cd13be357-936c07ed845mr2962553185a.23.1786940584784;
        Sun, 16 Aug 2026 21:23:04 -0700 (PDT)
X-Received: by 2002:a05:620a:468e:b0:934:a0b2:9bde with SMTP id af79cd13be357-936c07ed845mr2962551585a.23.1786940584424;
        Sun, 16 Aug 2026 21:23:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cffeac4sm41308e87.39.2026.08.16.21.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:23:03 -0700 (PDT)
Date: Mon, 17 Aug 2026 07:23:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_tdas@quicinc.com, bmasney@redhat.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: rpmh: Add SM7250 rpmh clocks
Message-ID: <gjphxs6ixffy6hp3nbwcwbfvszob7hgfths3um2rnn7joiu4fi@4bhaf24xfw4t>
References: <20260816131646.10551-1-sreeshankar0910@gmail.com>
 <20260816131646.10551-2-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816131646.10551-2-sreeshankar0910@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMCBTYWx0ZWRfX6K2jbWosvBzk
 e0GX8VRQwnRdsVW5RfdU6YEybdtWT16wvgApn/R3YWq235hitwqqnPiTJPZ7Hv96BKXqTAYu/5O
 oTpqvE6S1lMhpCPzGvPF5V95ZQ4G1wh2tHcrLzSIRVwxZCJmrMA9XqMAT970PYE3Zt44a+zVSIW
 KPyhZV/yKsTZPG4ukmcvlYLgmrkMnZVf/EZA7WqCFxnxNOw9VOzGJjWBzjLyP5UoYJ83n4P2h+8
 7V3ytjsmqO/lKOuVMrNrqo+zDQn6ZyDBC8HcMFwUxn5JBuetr/arpcN+Zaw8YqLrvYi2nEW4+bw
 4i3BOBzs28/HqbNpkH/cxgQ2KabFQpWljeeTMcrbecmydkpJd9tgz89LMzJbwlLEGwXBtfkWwlW
 KItS4W6sxqZlQSlK5gugR8maRZIlJfkc+Q1R1lNzhHiLbOQer2lKTnWlDWnr1IdX3t/FFVf9DIi
 gZbxz5Czh0eXidD1edg==
X-Proofpoint-GUID: EuSMBR0y3bliHU2nZ54Ru6pEwEc6vKRk
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a828ca9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=ZfTvDAhhgTXKM-HDKzAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: EuSMBR0y3bliHU2nZ54Ru6pEwEc6vKRk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMCBTYWx0ZWRfX+iX4v/GEx7u1
 +TUc9d87RG5VXa+vhmGVS48hWLO4x1amV8piOA+tn8PABHQGsawGW0dsu23VcSAa/so9kPdtgPg
 1bSOCrKtmWgyRH9GCksixfWO2VbvPAI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170030

On Sun, Aug 16, 2026 at 01:16:44PM +0000, Sreeshankar K wrote:
> Add the RPMH clocks present in SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
