Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EADA346FB8
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525509; cv=none; b=c5YP9355Dafm4PICPlpNIsOhEZu72mpz9bIT3EPaTaLmLXh+Fc0JBsbKohxRpqPIwBez5IpADWx/z7EB6snl9FNdfYKN0MZgGi4pybokS1QQLJ+jNRUhy3hl3Jc2BJQjFJoqbaNrodnyiYpptc7Uww+mm5uerg2B9IiSUw9z1JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525509; c=relaxed/simple;
	bh=U+38FF6aEMgZeOpbDPv4WqDn8gpMxTsQuXNhCUp6Utc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDJAweeEyWqHOebe2UjmtGgitVZF3SPormtaG53Y6ergH23moaee2ZwaRxTEtUI4fvqejPPcJDwO0yioGqs9AdLUZ7JKH5VBtug7/MIaUstSoelZ2WF8qJ4UviMCUNyf1uiOO0YsoonM/Qdp3WwENEOKI8au3AHkkGy7jFTvAho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CCuADkyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLkqnPKs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CCuADkyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MLkqnPKs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R87IPB2379234
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 14:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3f3IK4MOfniqkAkGkyLgogaC
	73+XOhuDYsdZ5+Cky8Y=; b=CCuADkywl5ikDoVanG3M8TUuNGVNchLUXloIYwfX
	8G7bksXhVJINjzlccOaFPD6CfVWs6cyCMI8g5jQKvuz121Uz8m9kO3+t4zaXegiU
	/deium0poeRt8W0VejetG+rqXN1iXIdfx5GfqCVN1hlL26Fce7mKN9A7bPlCDqeD
	1+J4cvzP67Up07z8gzxuWYRIyfK74FttEwr6A5LxbMT3ZzD9vwbVN6lDOG9PE4M8
	pUA9k56BLLi9e6cO5uUpgFthUAWBbnACY0DZRanCyTDe+6z2O3yCe0ixaoQssYzE
	z9vG52EFSqz0LEidz1fl9d398avCkvjYILjil70PzoEOew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjr9912-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 14:51:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5014c9ee70bso158192711cf.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 06:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769525506; x=1770130306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3f3IK4MOfniqkAkGkyLgogaC73+XOhuDYsdZ5+Cky8Y=;
        b=MLkqnPKsVfrg8m8S2GJpLurYggGGPY6LYtGVRypuOymOgjvpjWzwSM9T7gZ1xGz8mT
         k39afxtm/fW/xke9EFNBh7T++cve8EW9a0spHn9RU9h/bssV+Tx8zk9e5b5Ms/LTKs39
         ss/S8kGAHDFdg3VFVHLfnwmR1Ju7S/52xrVGUluUn4zlMTDd1THw1UM1mQ5L8SWHwH7w
         CKawdQYzb/egUY9aXG9GB+za3uJvYGQ3nP0F+fybHwliwBeFk2k6Rv7wl4JQ/dHaBKgb
         bXL0lkFJGdKfPycsgdYdrFdXzBgqFrqTiIw5T6/R+wx8JKvFTW2NvJNbFrtpNSDHj8Ix
         uWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769525506; x=1770130306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3f3IK4MOfniqkAkGkyLgogaC73+XOhuDYsdZ5+Cky8Y=;
        b=RhAipF/Lrhom3G1VjEgY+p2WF6sYvIXrnGE3+WgRE8l5VwdEvzJit1nvLV0GApPBs1
         l2xSC0FNTY7oDtVUqQjlUsdea3Sp4VvrTDh27BKJyWfq1VIJE0Rt4oIPLlRp0ni/PNx3
         Wf9Al7Jci/3goL279R/pGVcrqQrjWU/BLlxYDZdo5EZI9m9Zs8YnOkDjINa9/ycHJDuk
         ENvMMJoaPou9Tp3EySR0WN5QbyZ99GBbSnYzmfr+4JmRJbUVhEofG5NpDjNj9lCgt0sB
         NlGeWd2dbOs/sxmvLFUsfrE0s9MEL6QfYlZzzgwOBw25zTheD0Jg310L06apJT08i5TB
         bNGg==
X-Forwarded-Encrypted: i=1; AJvYcCV1Bhe/sW8jJpzJ1VBUBbLxckFxb200eRQf7OQ6q0czV+VgDP1/p1rTwDzruGnoZFGPFmfY7N4pyJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbQBsS9NCQQHnnxK3VRU3tHZ70yyuWMItKbh8VddDJQGhAT116
	xf6RC8M25e5IO616pL8hT1zWn+vwrRsbZDPHQuINtz230bxRzKh2b/Dxp2IuG9o9UUME2ybyi9i
	R2aQZdfHIvckaLnzUfwY1IHU4Sa7P9R2/irHHiXSZ7M+RAJl9iVt/0eOF+DByhYA=
X-Gm-Gg: AZuq6aLrDE99oAgL38b/fGTdbaeQlrvEaPzjq3QvyVEYzgCopO9CPJnptG1BuMOb3U5
	HbqnijLnbuNrGQwZgN/NtMocutwDenCmGxmBwEwXYfDrzW5kMzD4kOAXsLFX3g3MO12yzb0GV+K
	/ZqCKt1y+LzkcFuQqCkc0PFI0hDbNoxg09cF84sJVmTmK3GcyfrxGQicFMs5x6lXkEPbNBz2cwo
	S5S+KuMD1h//uEt4Xnnvh7m5kq9dPBK0vp2VhWDNX33ipIDyBGfcPJLYo/35dYOaR4L3y5HN1r1
	gUxVu4Umc72naLFqMS+fq8T7ZUyyVl3kfH3fYm/if3xeM6+NOBdqnerZNAR6+IB6eIvzHvHsdGe
	ctj+noOttVdh8VRKOHUJrTIBg
X-Received: by 2002:a05:620a:46a9:b0:8c5:390b:6eb4 with SMTP id af79cd13be357-8c70b8e5f84mr208881485a.42.1769525505636;
        Tue, 27 Jan 2026 06:51:45 -0800 (PST)
X-Received: by 2002:a05:620a:46a9:b0:8c5:390b:6eb4 with SMTP id af79cd13be357-8c70b8e5f84mr208876685a.42.1769525505004;
        Tue, 27 Jan 2026 06:51:45 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d61f1f8sm133530425e9.5.2026.01.27.06.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:51:44 -0800 (PST)
Date: Tue, 27 Jan 2026 16:51:42 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add optional
 clock enet[1]_ref_pad
Message-ID: <b3bv7uevrk7c2argbhyxohhbcn6xtxvrj5fa4jwjdp5ymtinza@k57crjsa4yn2>
References: <20251106-ccm_dts-v2-0-12fa4c51fde7@nxp.com>
 <20251106-ccm_dts-v2-1-12fa4c51fde7@nxp.com>
 <aVwV8/rg2h2x4OwN@lizhi-Precision-Tower-5810>
 <uilxikzky53j7sg2barmsu6fkco2fiwgak3fh6eqc65iggmbge@7oogboikthae>
 <PAXPR04MB84593733B9B971529DB368F58893A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84593733B9B971529DB368F58893A@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-Proofpoint-GUID: o9irBD_Jzteq2It8doL3J7NMBTBgnWfR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyMSBTYWx0ZWRfXw4ToU/O6oWnm
 QspmVL9fJU4gIl/DEyu/PsK/OJ1cEF5If0/UlsTDqBd0X5m5XOd5x41jCxTW6VdZXpnvSv5r/fJ
 WR/LfU/9AUahA6KR5imCirnEa3eIgN+1njzAer6RJJPMuf4pnJxymfrv5bYnf+f2YwkhOkeQ9sL
 5s5xGgCQcTntWskDuMHdR8go8cqi2BegKgoNxwJbxDhdUVsPTmy5qpI7OMuOMflXODf+ltV01yO
 itUqS+k3Qr5kMhhbgIg9Lq0M1ScbH7sdnvBUGbelvrwg9ovao7SKEQtcfe1vievJjI3cGfOOjbK
 sRSBvI7HVhenm3kJbFGT8UnOUxmCb9/SMcNHcLPL6snkR6mlWgwe626jtSFusNCq7xuWu161y/x
 qKjVoVGDOg/oCqr46wSFfLZEitkFpaixzjM1utuVSkCD7y3Hc+Ugf1U+CKvh5sAnWaUNG3Rh+vb
 R8zyrNdZeM4qMEEbeWQ==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=6978d102 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=XYAwZIGsAAAA:8
 a=uB1rFwlgQs9gonznhjAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=ST-jHhOKWsTCqRlWije3:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: o9irBD_Jzteq2It8doL3J7NMBTBgnWfR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270121

On 26-01-26 23:31:12, Peng Fan wrote:
> Hi Abel,
> 
> > Subject: Re: [PATCH v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add
> > optional clock enet[1]_ref_pad
> > 
> > On 26-01-05 14:50:11, Frank Li wrote:
> > > On Thu, Nov 06, 2025 at 02:57:21PM -0500, Frank Li wrote:
> > > > Add optional clock source enet_ref_pad for imx6q, enet1_ref_pad
> > for
> > > > imx6ul, which input from ENET ref pad.
> > > >
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > >
> > > Who will pick this patch? Abel or rob?
> > >
> > > Frank
> > 
> > Missed this one. Sorry.
> 
> Just see that there is V3
> https://lore.kernel.org/imx/20260121-ccm_dts-v3-1-820ce9b5fa38@nxp.com/

b4 will pick the last version automatically.

Thanks.
