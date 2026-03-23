Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8393A3E6C
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270475; cv=none; b=TG1zeT2LqdO8UnVGzmTkLr0ToHF4W8o1BCbtRo8WQdeFk7aFvo+qD78bUBYGaoGDfvrnqu+4SiCiwOkIJS448DmK/Tt686fg9dYJdaFBR8nydL74K2uS/8XHBmUCdRreWo9hHee5dGA0vOyL6OFM93v8iMeCtsVg4mlmjMjTgJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270475; c=relaxed/simple;
	bh=42Bi2Tiolyl0DNGLiZgnp2ZLiezpRkGGA1VfOAw5hgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rL+nrm7EVsSr/ilfI6AQzuN97VPKxjcDzdzeMKn0sZKGQmuOFOGHe+v4jqGxPC56MqjuR2KzK3mZm4qYPVAAQhLQvgot/56L0aIuFhBvFNjbiC9+ik1bUnUGlrCHiTM1ToAFVBcMuyZCXrKOAgGWGm42oMuX3LsWMf1XYdmt0E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nvjGpNCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUxqTapg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nvjGpNCy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUxqTapg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7u2Q03468342
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 12:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PDi7dYPMM8oIqhQZ36mNWkJLjpIhXHLBK1wB8peKIA4=; b=nvjGpNCy1ai55xOV
	BB0ocrah0SNK4BDdwrY1l/0TPzFfXWgp3jbP6eiqSwoHR7lwGxbb8lbj9OdnkXN5
	OX8bDJguiNYdAtH9DSnIGeU3XDhRub/5vluf1qnoml/vbqwluIC2dQanlEoQmE4+
	VZCowHnaF7JxcYr28NkH/NbHjIvMpnc6M45FWvRCe/z1f5e35GZta84a0YbDKvVY
	1OwQ0v7T/pn+dnSnt9wixRekbKlCCcVmo4DSikvJignq0amRzD0FoTlYwKshnESM
	/yu0lVGPU1UiilG4xiOX7f9ng02XWelzYMcdDXOUsA1Vr7cR7NsSGJNrc04gt4dV
	DBsabQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgh16h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 12:54:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093245c2d4so18808321cf.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 05:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270473; x=1774875273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PDi7dYPMM8oIqhQZ36mNWkJLjpIhXHLBK1wB8peKIA4=;
        b=eUxqTapgl5GZkx4E/29L2eIl2W2bgSV9c0ue6HNg1EbNddy9ZWrPSO8xSEQUHPsNtn
         GqH/JBg/A0BVLmcGXG3hHtgVzixrrSGJ6yBFLSmokeAAHZjgm2d37QtLBLIrYjyTmIQz
         HS83G+qia+jnb+yXtaaIZBxiQk16gkheJXJeJNSA1nKJzPdQXgxOOigmVkmXVHafCg62
         gKVf1wUnb3THmOU055iYoksJQSTlG9JNXVqn+4p8k62kqzUcBQfCOx5kO/f1NZB0T0WC
         5/wfCYulod5XMoAsr6e6p2OAQUghDf+3ouC623RvMJofAQeXikdyyFEp69gN7wu6x1ce
         SYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270473; x=1774875273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDi7dYPMM8oIqhQZ36mNWkJLjpIhXHLBK1wB8peKIA4=;
        b=Tjk0oaij6GgNOuUenG1sqMQDksV5NJTHpyT3Hl/2pCaYwobaEJyYvFqXW4OibdrBZ/
         MJstFAGQsXmCNhCY0ugFvPuvDWqQiMi4+wlvgOJeA/RDmuy+ZbpCRliR+PJcmbVxm1J6
         4V2cy7BdhVZrR3r3BUNM2yHMjsMFumevXPTIxkFMeENRJhJih1oSg7rFXMeX21yrsAju
         P+t1NoXL4D3vpgUe8rI3jBh/9+WO8Yt3Y72T2gp5l2P9Oru3eNXEJGOW7VGVEAb497me
         Ty7jfnkAYJYD6cbI2TPJ0iu7bSjf+nae7PCJDfivy3XZdYyNDufwRxsCWYpMEW/8A9oH
         luYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTZFuMAlZZteFMRHwLc9iFy1Sx6yrOjpL/A62hPdeQyDrdbR8F4k0ntLbu3b1a+lAWzBelrsa6g3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCCFaBoQNClwtTW9gGV1oyNUyak8v/0Lk++7v2jCoExbAXYt4f
	Gb3+liSL9IG+y6Y4xb6L3vqzH8yCgznhlXs/9WPYfyUEH2YCA1n9j4ZZ9Z3KPwFPUNX5KeQvOHm
	poLayEObAqL6vTxuP0kVv3hxljviwwVxSf+xWlmJq6Gtc2gWMlQRI7Zvkvc448l8=
X-Gm-Gg: ATEYQzykMXJEuTVjN+INKoZKtcZdy1PwH6Sw8ao4XI3MO/zjGtrzPHtMsDP8NivNFst
	F9qvl+z30QmzA/wGJKxRuFbpg73onUcORhnsQEgIM5aRkzUX0j/Qpe+J2Geis2zHw8GRIXT+czW
	A7NVmvWKVpL3vwXAtQqNJjlvcWrgALt5pqSiDkN2t36uK8KS6m+sxLTqHmtqSZdo0phuP5DASRI
	W0XJH2qaqQOOQFUKdBmXC8SzLaUSlRq4cwg33tvuTnuHH+CWnqc3oPoDgMN24/ppDCWfb52lBQ7
	IvumsFrythlzfuGSNfGIWU1d5sFV1FQepdWnv8bgqEtIsqYAACmvtHOk0BDIAxwGItkrtDPm2VX
	1j2H9IjxwyjtRigME9z9bORM62Trrit90Z7iURzcKLo1eMFQKWDQTYzAExUauEYCMtgPpqYP3TH
	STr3I=
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr136605801cf.9.1774270472888;
        Mon, 23 Mar 2026 05:54:32 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr136605451cf.9.1774270472186;
        Mon, 23 Mar 2026 05:54:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de0b2sm492167866b.34.2026.03.23.05.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:54:31 -0700 (PDT)
Message-ID: <dda88cb7-090b-4baf-91f7-e6724b506134@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:54:29 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260321095029.2259489-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260321095029.2259489-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cg1ck0We4Zqzbz5Go9ZrJwBZUuLrkSZa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX63B961OSNkWZ
 JTcnZutm8RlKbuvZvLh/of2Fwc8tpyUPdPzyHICQWMMEM0jAgcNyNp2XIMCEcUUy7x34tVUm6V+
 Qw3sVX01OgSAMekpMkKAZHRc9dlWeAg46wREhLHaN/caJcRam44i5cYOC/lRvp5l4jnSPSdzZMl
 xUbxh5Q7m2A3vbBBOBpNa3F0hogI2RG5bmYCQ1GypoiFjnl6qCuY7lae4wNSlJ6pWVr7sEmLX0r
 hILp9xCcHXdzDWAtc6bmsWSfqRk/6/8FOvjvV7rz2lkVmfjlJDeOkfEsE9ZNVsgfD19XfWSWsp4
 i6VHwwfWTT/Ilttyox8LYKBDFjIlxLC372GG/vWhS39m8+7oJuZA2nnvlTuzNmUZTWDc7rDa9IL
 Bk1Eb0Q7Wj/TFHpy04HNNJHXr8PtqUP+ge6JbfWI0ZZAKlT6F0+jFmYGroESwnxibKT672MdgkI
 MJe9RyrGL8dmYPsnGgg==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c13809 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=sfQP4rS8fwbn5X_sSroA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: cg1ck0We4Zqzbz5Go9ZrJwBZUuLrkSZa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230100

On 3/21/26 10:50 AM, Pengyu Luo wrote:
> Recently, when testing 10-bit dsi C-PHY panel, clks are different
> from the usual. (dsi0_phy_pll_out_dsiclk's parent is dsi0_pll_bit_clk
> now (dsiclk_sel = 0)) And we failed to set dsiclk's children.
> 
> dsi_link_clk_set_rate_6g: Set clk rates: pclk=172992000, byteclk=108120000
> 
> byteclk was set first to 108120000, so the vco rate was set to
> 108120000 * 7 * 1 * 1 = 756840000. When we was trying to set
> 172992000 on mdss_pixel_clk_src later.
> 
> Since there was no matched ratio, we failed to set it. And dsiclk
> divider ratio was set to 15:1 (wrong cached register value 0xf and
> didn't update), we finally got 50455997, apparently wrong.
> 
>   dsi0vco_clk                1       1        0        756839941
>      dsi0_pll_out_div_clk    1       1        0        756839941
>         dsi0_pll_post_out_div_clk 0       0        0        216239983
>         dsi0_pll_bit_clk     2       2        0        756839941
>            dsi0_phy_pll_out_dsiclk 2       2        0        50455997
>               disp_cc_mdss_pclk1_clk_src 1       1        0        50455997
>            dsi0_pll_by_2_bit_clk 0       0        0        378419970
>            dsi0_phy_pll_out_byteclk 2       2        0        108119991
>               disp_cc_mdss_byte1_clk_src 2       2        0        108119991
> 
> Downstream clk_summary shows the mdss_pixel_clk_src support the
> ratio(35:16)
> 
>  dsi0_phy_pll_out_dsiclk             2       2        0        378420000
>      disp_cc_mdss_pclk1_clk_src       1       1        0        172992000
>  dsi0_phy_pll_out_byteclk            2       2        0        108120000
>      disp_cc_mdss_byte1_clk_src       2       2        0        108120000
> 
> After checking downstream source, 15:4 also seems to be supported,
> add them two.

I don't see that, not even in the newest releases.. Is there even a reason
we have to list these divider pairs in the first place?

Konrad
