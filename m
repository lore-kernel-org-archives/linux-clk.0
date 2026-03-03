Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B86933F8C6
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 12:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772540023; cv=none; b=dvp1ZIP7x40rZXaraF0Ul7l0a88ZEEvU5NWbGNQPjxsZpWAQV694G0p8bzqpe/HhYXKTGqBge6U2Zj23kBw44//3e1L2fmvdxdKRJRTZIRtyzAIl4jNfX4yW1GgrhvOGaVgRZnD6xcWBnAlPKbDfd+XxC20v2bVFjMjCfvXJXQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772540023; c=relaxed/simple;
	bh=n9ThQZCHpRyOYZogBfVZbhe1AsrapF6ZWMmRMx4dKmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjqZZWlgmr8cVxsCDWqsi45rxYqwR2BSX1Hta6awPvfSPWQEjQgERh4p7lrnla65iMFG4YhSJf4WNQ7/5HWpTv0r3VBrUk6xip3fXaEzpMYBVUxmhpU11rm8B6oaZaRTiqJdHVcXfAjGb1APpdTVGE6wHLKtxZup5w705nWu+SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJPsutLG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jrzqt3qZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJPsutLG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jrzqt3qZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mmu72732260
	for <linux-clk@vger.kernel.org>; Tue, 3 Mar 2026 12:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n9ThQZCHpRyOYZogBfVZbhe1
	AsrapF6ZWMmRMx4dKmg=; b=PJPsutLGKx6Z/C+LJW1AwgvhyWXOFTNddc1IU7eE
	dMiYq+/eRmJb8RHBM2MlbKnC9hYidZuiH7jXPVu/BvaFZnWLyDMWIbQOkej71gIu
	89UlJMTJiTR93ArIEJdO4184Ovpv5f3//pi82MmE35XhXZ2e63siqB6dwl7qZ1er
	fVD+BRbdl97gflTaiV2boobS8+er7Kt6UPSCsbKpaP70t6m9MhbjaNy/limKoaHJ
	u9qu2h6oGeXq8CgC5ei3yV8gyziMZmGRCWt/Ow3PeeiTtb7FiZCYprmFrNOSpH1y
	rHQZvjvVuzl6IDQ2Yn68xUJe4JKjXPALEO53BOcaI6iLgA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnswe17ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 12:13:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506c0da79c5so501015581cf.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 04:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772540020; x=1773144820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n9ThQZCHpRyOYZogBfVZbhe1AsrapF6ZWMmRMx4dKmg=;
        b=Jrzqt3qZNuSVvS7O76J8YqWicu8NmN09qT8LZoDYqkuJxamPSOQ7lgzeUvtESolfNc
         yWD6MGUZB8/JJSJD/cx0AKwha8eTspuPdXjY2gl3GwF+EOPFRN7rX/wM/pWJPcMcXOt+
         ytlZcTvl6D1E16EhpBMBjkGecZGWtKejGSoXcLgwIuo8V0H40ZZo4/3sfvRiraog/17B
         lOVSxhK29hiAW8toZQ0rWKYUquZZulUOSSutQH88rSbjXNQ49FMouM3Lg0LJqPkPADob
         CeCpVEgpgtrG9A5O8URgVDF4PB20LE46txzA00gq6Wg4VIIn5lgbkQO2FG+oUs4Eo569
         H3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772540020; x=1773144820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9ThQZCHpRyOYZogBfVZbhe1AsrapF6ZWMmRMx4dKmg=;
        b=hNZ/sBx2LJEtZ60x5XpGH17ydWdu9xzy306EfpWbfrdtM+wjqipfQ40Meo5VmnNi0W
         +IJNriu6HAgk6nGZsIJRTkLiG2H9OXdnjXlOhOF54WtTM0mYoZjd2EHlQQDIv+dcwWE/
         3ng5CCFp+IFzl+b+ARM9FTY0NuYKB15quno2Fw5aoDjC5ISfOivEQFahJ8lvfWLPLIKH
         kCiBYWj7qlqSOOYtU5xYz/CMdpf0MwCN9NiRihe72MmrXHrsA/PJ20bG3G/4Vtg0Di07
         518dzG1XIj2wk6aChsFEhy/0+DE9SjUft8x2VifDkifPTIqwpQ5BpRaHA8BUFHEGJUbI
         7vUA==
X-Forwarded-Encrypted: i=1; AJvYcCWYH0eT2/a8SiwyIMLFEnU//+QsIcobBBOu2A4JhwUkjN8n6mWjTokl6+qERxC2RdKqP7KrveeG8h8=@vger.kernel.org
X-Gm-Message-State: AOJu0YybrZS9ougGvu7G6UARIspoPkP5gzMDVdi/MbcPPH2wPZj+nH98
	Qqz8zGgungLuMrzGrIglKQEHYS5phhLQDCTYxi1gH6W4Xz1aeRzhY0JNr2y5uQBa8lELZA2y4QS
	hFDHoRqrIRbVT9zFPwxiJ4Hk8wnzRLmtU9LYHt58fSQWuTld9uQZwzfliIpgz1rI=
X-Gm-Gg: ATEYQzyd4QPOy6iVb8JFnm88xshHcZDdjjpEoLIsar+gH3ew5WIcUINdCxEtllwU2TY
	18J8S5HMVdOGsensRDu+3XAlsiLjxWRRCobGvLhzr/MTKGwF/T+6HXdcvStrcRCHilQqCJfcoLB
	OYZjRcreT/A11GnzqmJk/wipDthbGCQFjbAHPOuN5q0HgDkUYMOrepWtSPDc/Bb9rssTNvz1CMA
	+xKH9tnWCc6T2tCU8SNTSIk+67tnBqMBS6Cn4a0hM7Bul7JwvjjjbEkZ1fp2sn/UQ4l6M85J+Lm
	SBO1GCHljGepOOcE94iEiyibAphVNspmLAnpAwPfvmnrqwIHa29BNlnF7OH3MipQPx2Rg5PcUuX
	8HZxLazklDiGHsOTW9m4PxE7FyJC15l/a0H6h
X-Received: by 2002:ac8:57d4:0:b0:506:a289:fd3c with SMTP id d75a77b69052e-5075273e97amr209392661cf.17.1772540020520;
        Tue, 03 Mar 2026 04:13:40 -0800 (PST)
X-Received: by 2002:ac8:57d4:0:b0:506:a289:fd3c with SMTP id d75a77b69052e-5075273e97amr209392191cf.17.1772540019993;
        Tue, 03 Mar 2026 04:13:39 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744ad8f8bsm131749141cf.27.2026.03.03.04.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 04:13:38 -0800 (PST)
Date: Tue, 3 Mar 2026 14:13:34 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Felix Gu <ustc.gu@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Akshay Bhat <akshay.bhat@timesys.com>,
        Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] clk: imx: imx6q: Fix device node reference leak
 in of_assigned_ldb_sels()
Message-ID: <nfrgeg6uzbkzri5cedihxfw65dnsglytkhbajutuutddvyabuh@mtnjxxde3gzm>
References: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
 <20260203-clk-imx6q-v3-2-6cd2696bb371@gmail.com>
 <aYIxjWYq3OwwmrTO@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYIxjWYq3OwwmrTO@lizhi-Precision-Tower-5810>
X-Proofpoint-ORIG-GUID: Ihb3XKFZt2FnpVpVeoNhfnNE_Oy97OtK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA5NSBTYWx0ZWRfXw0cIrA3ubXIY
 FQjx1s6pT8wWDd17fjXdHnGiv8Xcr6gWbNf7GCGjidXABbUGywjw+AIyvsFTaOGFvxIgsViKUMr
 IN6+drAUTvkH951uNt0JW8OAQXdD5rsClMI4XjrjARmxk5KzK/aQZ5xbpwc2XynppyseyqhXRII
 uGQkw1B1rSWyqY/pUfcQvY/Ws0we//+L18WYZuF0zpX0n1m1W//Xy653rEJJDAc/n/8VYH9MPQP
 NrtMJjq4/sji6TVlFaBPum191FmGtUmPfrM8pdCfHtE9HB3zw/RzO6UW3uMfXPi7jST6xNwvIwM
 EqPRyokp5m2KqV1ahr/Inu7VsYztSfMG0YEEisJgWI1hdknzqyByc8mHPgPW9vNUgQWyji77WVA
 9/+4V8jq8qN33DXgxux9DAxPoqpCoGj0vir3w0hYdFRskmkJwSv1efNm2lBIUshBvOXtGZoeiqy
 UvLzgFOd2VAR62sjFEw==
X-Authority-Analysis: v=2.4 cv=TtHrRTXh c=1 sm=1 tr=0 ts=69a6d075 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=8AirrxEcAAAA:8 a=Vg6-HkV-eu1WfDdlyz8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: Ihb3XKFZt2FnpVpVeoNhfnNE_Oy97OtK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030095

On 26-02-03 12:34:05, Frank Li wrote:
> On Tue, Feb 03, 2026 at 10:07:58PM +0800, Felix Gu wrote:
> > The function of_assigned_ldb_sels() calls of_parse_phandle_with_args()
> > but never calls of_node_put() to release the reference, causing a memory
> > leak.
> >
> > Fix this by adding proper cleanup calls on all exit paths.
> >
> > Fixes: 5d283b083800 ("clk: imx6: Fix procedure to switch the parent of LDB_DI_CLK")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > ---
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Frank, please trim your replies.

Thanks.
