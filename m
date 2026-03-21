Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B28F2BD11
	for <linux-clk@vger.kernel.org>; Sat, 21 Mar 2026 21:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774129602; cv=none; b=TQmHaDPiuVjt3h2Ve2FDTFXVLa1EtdLXwcM/C278APqUMu1rASsmMlA+fDpt1sPVgpMV+702HN9V4g7Mh5no/HTeExjA6tZfJo7sBHlfNxLbZpO1r0eSBqopOz312XMQEbIO0qpsedNaYCn2EnBd8AuvLpPkQMggtd5eD0kpD/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774129602; c=relaxed/simple;
	bh=LEFMguF+qG5N8F642XdSIeqCsB3bL6blBnSbKzP0fUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhrsaDJZQDlp7qvXih1Uhd2g6/fDlSRNenGPOLhPh7hjpiPS0WuPQYvg3+VEu/u1TX3T29DE3Pxq+sY0pbCMFwoUW0ybYnm24xg+gQHU9pqDaAnXowPac48D9PLwsDPX59z7QmD6SnBuxC/8L5Xd7xQtvLVsbRlWWAFUQYjdoUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJA9isfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQaj4XZe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJA9isfh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QQaj4XZe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LKMRUq2448791
	for <linux-clk@vger.kernel.org>; Sat, 21 Mar 2026 21:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O2W/D1As9V+GAyDQuSk8no56
	Cq6Ur63o9kQfhxnl+R8=; b=BJA9isfhEDfagRUBrY/c4MMRsoUQGYzpHL7sUjw8
	wjOLAOSGdr6Ue140rmQKDgh6P0qqV19vosewDRVbzRxPjZpTgG5WgD26vMyIAimJ
	FuEdvB3GXLx7fXuOwUCd2PjjznHd4yJammoCRcU4fwERDGHgDNYLdfKkTg6rgIbC
	l0oZ3KySIlk1HlhjtLrLcMgLnkccQjFTgEj/JNZS8Ibp8yAroNt7Urt4qJM1Ccg6
	O6aPsP8E4QgXgX3G+M+aejGxwlcZS6Pisi7fctbCuO6c+RJJbTxIfXC3FvTJOSUe
	QlP9W8Whukvc63S1BfQc8xoRQe38xDJgozFmnY4RvWlO9g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mgh98ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 21 Mar 2026 21:46:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso29185671cf.0
        for <linux-clk@vger.kernel.org>; Sat, 21 Mar 2026 14:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774129598; x=1774734398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O2W/D1As9V+GAyDQuSk8no56Cq6Ur63o9kQfhxnl+R8=;
        b=QQaj4XZexmTIJb7ZAidtPuqt5sARhcAN/LakUgD3o//29Yjwu6XGK5RIFlC12diQBE
         PCXBejgsuDMDPrd6KMihfVfztQHvl7+gb/0NA7LbK4cFZQkPi9ADjMUDfTZbNfYfBxzT
         DangZTSmAKkZqCM4JHdRvE2fJvyKFOaH1uQ/b11F0Yl2wdJO4XwxLp2ccbFLpDbxvtLh
         hDqFlcmO6PnRDwIojZnA96vIWpcRV19/aF2ffnL8RJMaoxQWkLRMk767oQ5L/uWnoc9E
         36llLqT8wBUrbK82aolebL3IGBMPYAM4+t/r5MljV/mriwyE3IY+rZJ6bZ4v1ySG1sxh
         EwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774129598; x=1774734398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2W/D1As9V+GAyDQuSk8no56Cq6Ur63o9kQfhxnl+R8=;
        b=T20HMTdKe57jS2SxzRPPT0MvaaxkxzrRv/ijJ7SLiCXJTeYpEcdkWbX8hUo9xxnt/5
         bI59J5VtVl/ViQkNxtxHjvIElstmhMH3PhWzbGixImu4qJT9W0r5rAQ02nj2iqTmoep3
         6yU74x90P0T4aoyyQK80IZpEB59OAJYCpPNbR6+uZPNDwlEJfddAG7+W03HIEDPdH9TY
         eO9hl92FcfOepbq0oSvh5p2B6qE+IEMLBs1mcSC92x8oNY4hEvNJghlaafSVEmXsBOay
         67F4CivqCv9cf9NvQKgmsjcspLok418OgE0kFxYX6dR0SdxKSdHf8Hwi6UqD1WPgbmW3
         eRyA==
X-Forwarded-Encrypted: i=1; AJvYcCW/JcB9b9DI4VmKYTlxIVmOKDnnJRaq7kpuakAbQI4MqFdESJx79ENQ1IbXHoKVJNK9k057C3g2IdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhQWo/zXPEioDvPpdzumUOH87XRaHww2J423OE2bKwherpGaGQ
	+qKhDJUvwQfOM6JFXmz5UzhUICe5Quj6+QWGyXIMaY5D4qMba046kLHmOopK6uUzUIi3vQvO7di
	5mKh0DCbGl2+Dlg+VrS0TFf2BHHTITDWNn2VXZHdj6gBXD3+UImeGQ83QOErmSrI=
X-Gm-Gg: ATEYQzwCZBP8WwI7E34+zvNwDatZTGHrNCglhrC2BD9USVTQm2wWyDr8M7kFMFqNy2w
	a7Bb1axwvy1moK/rS6XmOkVndBiWjqANtSve53tdaCZymNdYQFiCiOH6XSfvLc+SH52YeyCCsoJ
	ddcam1MamIHekJoonQDlaO6d0GcucssuLb49uyYJBXUWxRBnBLpB1408AHzEl0DMIq7HXI9/MvI
	bs6hrnwlB22jHrDSbqu1YK18qkjcXUlWvtmDUfVyVX2ETgDeRgNFAEAX0dvxq/yWPscpfy1JovZ
	SLd71fLaScRliFlOkyOpor9bZLjYllm4Y6LoybJL/wBr0S7SmOd+Ua+VtIBJ6/aavE0RHHKC3O3
	2DMS8Tbnl0uJy4kLEQVQLzrmsRef7q0BZqNCvrDx/rzUp+qOFPsNDWq6SBJ6SFMZVSsyeE6oe04
	3LTZ1dGf76dR4IEBKHjJ9SX1lU9vLgSUX9e98=
X-Received: by 2002:a05:622a:4acb:b0:50b:292d:94e3 with SMTP id d75a77b69052e-50b292d9b47mr142255471cf.42.1774129598606;
        Sat, 21 Mar 2026 14:46:38 -0700 (PDT)
X-Received: by 2002:a05:622a:4acb:b0:50b:292d:94e3 with SMTP id d75a77b69052e-50b292d9b47mr142255301cf.42.1774129598156;
        Sat, 21 Mar 2026 14:46:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820f6sm14278441fa.19.2026.03.21.14.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 14:46:35 -0700 (PDT)
Date: Sat, 21 Mar 2026 23:46:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
Message-ID: <sptw3chzws7hxfp5lsn56cy7onl67pewjh3psi5kvvfttotq5d@o6edngztk5jy>
References: <20260321095029.2259489-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321095029.2259489-1-mitltlatltl@gmail.com>
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69bf11bf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=tAPiZv5cLaP3UTzMh9gA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: hltk4rlbzE1S0jmbEiWrrmrK3_9Y09Ew
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDE4OCBTYWx0ZWRfX9s7GQVdxOJF6
 Jm0tMVzKNeQv23TkPHyI6CITxuRa2ES3wy4JP/2/mtvln2nlSQUpL7WHL50V9JOMpYGYjrw8jt6
 esq+ZBD5cc2KdW8fJLcEdolj+ZUBTPhEOm6jNGnrlahfZ/ORtPX15+OjojvWWaIgKxpSjmzsgGg
 t+d6KRKHBP7Di/pBUXz8frCTZKC0S6kbTSVJYDoP/ns3gW7czPRYfAwa4COJZc69xM00h8/7qwn
 vK9LzHNvy97/CE0q8jlEaeVDFYWtITFLTHiSUYwiNZFow6NHKEYcgG8kL54xV1AHkXhVqD8EWqZ
 1FGCApfjsSCqqP1foZML2uS3oLAOcwzMVwNBrnrpR48p7w2QMzpaa4ko/uz5aX5+8jhV0xSvnYa
 03Eh/1ph3lwY/6mGjhlYE5y+ZaUxqGCWh++CNeP8knK3y9d6SSVTcVr9UlwUcmD64cxyU8Cq2Gn
 wWKU43SZpdRqB0wutog==
X-Proofpoint-GUID: hltk4rlbzE1S0jmbEiWrrmrK3_9Y09Ew
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210188

On Sat, Mar 21, 2026 at 05:50:28PM +0800, Pengyu Luo wrote:
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
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/clk/qcom/clk-rcg2.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
