Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324003612E0
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 05:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783922077; cv=none; b=Se7/2eeOo4sldFcQIpIXhpiSaQaf4XJ0DC17ekZg472k/jbusYxNaXwooiGsknfVaLPPe7zwc3x8c1UMuSsChrIJ2JZe+MulF4ecEL/70whvK9RY5ZVwuyx7b+JxeyMnm3l+UWb4QiIHJCGGc4KB9zBsa4EhbDBbl5dBMilapeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783922077; c=relaxed/simple;
	bh=DMfDlT9bsxrHyKP8oYQv8QAbSpLFgAnmglqR+FPPdqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oF0hSE8qiWDgmK6TrLuTmTkqPi0idV18Ce6ICO9Dt09KPKdN0DRHkEjT6PY23GRi9mpWDyHyWdi40Nb9UqWij882AbA9sf7kiMtbGe/pI7c3SlOfX1wvkl9E1Pux5bu0JXo/a5e/2l0TyuTrdYHb+nk4peMHQQwnph3i3vU6goo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWCEZ4Vf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FO8TmxdF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eWCEZ4Vf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FO8TmxdF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3AIYG136786
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 05:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LWufmJLmZffuA40T+VuvgB28
	WuhjcxcWicXobvilNRw=; b=eWCEZ4Vf3MGZRo6gKK5uuoi7ontXh0VoCZ1YwpFd
	UkS7S4qwVbHbYMoik14MeOUrBBgoShxqAHHIppdYvYFSpVrxCrJ+l3DlmiP/cOZw
	JGpBRWfPUTqp4/hb1IV6gJ991VmaapF6xbM/x3AWUA2/CmNvS9WE0G/sTD9yuCgC
	g1mQ0Xqe1UhXCE07gk2f4DxRrEkaeBfKBR0iAs2tMDd7F6RrhSTD6mPdcWD1pcqj
	LNwPyauRNRFrov2Fkb/vlJcuiriGtgAiUUG5rqcrCvfYb5sfUxk0FAWVIhgrNoN3
	Wzh12vuUlAZ40c++Xs9ITk7714/CIL6UpN1uaxAj1zjm0Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe914hj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 05:54:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso6458711a12.3
        for <linux-clk@vger.kernel.org>; Sun, 12 Jul 2026 22:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783922074; x=1784526874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LWufmJLmZffuA40T+VuvgB28WuhjcxcWicXobvilNRw=;
        b=FO8TmxdFx20jcGmMBed5l449yFYLqlRnsJAahUBlYCMUJaRDCxunUt3VIDkNIKxKfC
         DbUrOCspBnfI8dKH9wAX1eVLLeevn+Tp3wNmZg1QE5o+rWlP4brLINhg9+B6MymLhOtw
         jspwWxZn6mQiYFK3INH27W1wy3FM1IC89+6aKcxgAhuzN35XfleWzJJZQmV0Nqc/LQH5
         NAvSVptT4pRKviN+x8C6NUVFH2iRWmz6UJ8BsQQRKJRZd3An/gomdkisQMB8FJi06osb
         aHGywqfE1x5XAI6/uiFqWOK2ZRKX2aVRZnyJ81bKqmUytAw7VXbLGe6+V93Ryf1TtNsP
         6cMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783922074; x=1784526874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWufmJLmZffuA40T+VuvgB28WuhjcxcWicXobvilNRw=;
        b=b02b6vLDnsvkFeqJzzTLcCCC0x4G5E0c8+0FZAIDUUq4JYWeTqxLxNph/std6G4y+/
         J7nJr19/M6GtEBMxD59rT4ZgX3SL/XsvVyiMVmxt3zCXv+pHwpsbEM36Ih/jYIqBpwuG
         RK2dgQ2ww6L5uGY8d5k/sw8UR/9W9v/vZqwVORbBTuoqTI+pHaZkSV1OCoteuCAqistC
         BNNA7erGVFFRvdFj3VMz/DDHV4vr8+fbS1Zzkf/XsW6b7BqeJv9F5ZKuURlM9BNm04hM
         T5KitOoPjPGF1goAvYkBHCQQTAwnOiZxNGbYmy/htWEYfj+UhSmSlrwZQcJQv6nw4E5q
         LSzg==
X-Forwarded-Encrypted: i=1; AHgh+RreBO4iKlSV/OV9iVhHN5bmSVCEfVQb9UFOkBk0Hf31PGisNoe0aYg3ifdan8xrm7Cg/DbLEk0/moQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGG8uL6xzb34pJO95DT6RjQAY2cwQmdTIu75glcnUR2Xj10Uu7
	ER1SE/cXv2511URzJB1/8zY9dwxi63B7sWqhDR5S1e5e8cnvY4mh9aREqcN53bdPstTc/twvE5w
	M0Y8KELI3FukggmXUPDd47Je7ywSI9fWgNBe3J59Os8LjCUskZb8XDmRS96sKq+4=
X-Gm-Gg: AfdE7ck5gbU7uJlC7Tb3N5PE1ovyVPRZK87fjicMWXtcOQpgz4X/FZfpcHInS8vo1f2
	Bne66ohXl3PVbzjdFHomn7DKQrQaAOR5GMtm2DxaOISO1BIE4UNM1x0vQPomkfodnXohwmUtdLf
	6cwCSRxFxKFXaNLhV+PxdqjGLhRpqkzvmLAZ7kZ9+6moguk/wIsBFqw7TibM4vb/Cug5pvJAqeN
	cgwgfVTpABxKf92Igz96XIPWCQvPLCD5Tcg3675UtrJL4O3ku5BLDI3mfwdKqbEnfuAPH9UwvTD
	vbBL4bZF6OAjse2ZRHFDfNuDhcIRB4VRB6K8TcrQiSv0qFsVgnkwrIXqS5fnLM/mZ1dAdrJlhVJ
	EaR7zToT4aiuNSsI+0GvyN9c80OQQYyE5qupjJC65mPrakM9uDa6pJmU6PXhKo/xkUU0I24c4yY
	a6k3KJ0SK6WQJDMbU4Nne+dS9iz4xmHGX5nhAZHwCW
X-Received: by 2002:a05:6a21:4a41:b0:3b3:10e1:a870 with SMTP id adf61e73a8af0-3c110a9a0a3mr8572638637.32.1783922073865;
        Sun, 12 Jul 2026 22:54:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:4a41:b0:3b3:10e1:a870 with SMTP id adf61e73a8af0-3c110a9a0a3mr8572614637.32.1783922073389;
        Sun, 12 Jul 2026 22:54:33 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483dec6sm67753127eec.11.2026.07.12.22.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 22:54:32 -0700 (PDT)
Date: Mon, 13 Jul 2026 11:24:25 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: ipq5210: Use icc-clk for enabling NoC
 related clocks
Message-ID: <alR9kQyO6fQ3MOvI@hu-varada-blr.qualcomm.com>
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
 <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
 <5zdmbj56ndi7nrvdqadinrf3sneywft3uaplnoxugp5zetsfbj@5hazmuzyfz7u>
 <agc+n28PfkrxwpuJ@hu-varada-blr.qualcomm.com>
 <whx5dpg3ji7lj62o5wvcytwfi7wphtlooqznkeeeeixkhegw5k@7bli6m4w6frn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <whx5dpg3ji7lj62o5wvcytwfi7wphtlooqznkeeeeixkhegw5k@7bli6m4w6frn>
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a547d9a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=zuQeyNwc5QvROW1TF6AA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1OSBTYWx0ZWRfX7AuYX0vb1zjb
 bAnOq+pH44ndZBLeQm3afdBNM1KVaEJOdA3qQVv2ao2EPQZAjKcuCIJwtu/wr0gj4XNZsRnKf4a
 iTJDh15O2DIN0zSOgXLxB9G+gYIj4ds=
X-Proofpoint-GUID: h8sOSB9dnWsZzUyzc-yM6bQif-HgC59K
X-Proofpoint-ORIG-GUID: h8sOSB9dnWsZzUyzc-yM6bQif-HgC59K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1OSBTYWx0ZWRfX7bndub70uzwG
 Gfi5DYVnt1wsqnmc3MfgHwFu+5RI/UxwSXtt+EJeCMTaArswpZA9e1unruB9YqlCH9S0BqFuIAO
 eekjHe3EouqB2YTD5CBxCXyTEzw/vbijgDMPDsN984L1kW7s87q472FHCjZuYNNhOoQOJavc2iK
 gEjtymskFxaYlJIFpjHxRQKvimqsMjdFbgBBrq0yiZlCnHtdVCrOrJ89L2w93yelZlnVuxCrTRj
 Y7FSe3WD210FeECpxUN4r0OkYjwwQmy7b7n7obdqgkuiHOhs7FXG/+1WaHerBhLznSPfI/nVbRn
 4WgsjSaCYE4sGSItDQs4nlj0ZPTVnpYxOg5vps3812n/dz7I0xPBMzuNRMrHm+GGrcHbgQKOI2E
 JcbO0s+/9CzZ5Ch06kEJrr+e+gauN+Qxc+FIWbwajtvc/cVj86/lXWkYDNUEtnvxin8Dv+mkURw
 mZCmGTEmPdctdUab+eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130059

On Sun, May 17, 2026 at 09:51:52PM +0300, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 09:11:19PM +0530, Varadarajan Narayanan wrote:
> > On Fri, May 15, 2026 at 04:31:42PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, May 14, 2026 at 09:35:36AM +0530, Varadarajan Narayanan wrote:
> > > > Use the icc-clk framework to enable few clocks to be able to
> > > > create paths and use the peripherals connected on those NoCs.
> > > >
> > > > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > > > ---
> > > >  drivers/clk/qcom/gcc-ipq5210.c | 16 ++++++++++++++++
> > > >  1 file changed, 16 insertions(+)
> > > >
> > > > @@ -2642,6 +2657,7 @@ static struct platform_driver gcc_ipq5210_driver = {
> > > >  	.driver = {
> > > >  		.name   = "qcom,gcc-ipq5210",
> > > >  		.of_match_table = gcc_ipq5210_match_table,
> > > > +		.sync_state = icc_sync_state,
> > >
> > > in Kconfig:
> > >
> > > select INTERCONNECT
> > >
> > > OR
> > >
> > > depends on INTERCONNECT
> >
> > In drivers/clk/qcom/Kconfig, IPQ_GCC_5210 can be selected only if
> > COMMON_CLK_QCOM is enabled. COMMON_CLK_QCOM selects both
> > INTERCONNECT and INTERCONNECT_CLK.
> >
> > Is select (or) depends INTERCONNECT still needed for IPQ_GCC_5210.
> > Please let me know.
>
> I've sent [1], let's see if it gets accepted or not.

Don't see [1] in linux-next yet. Please let me know if I should change ipq5210's
gcc to depend on INTERCONNECT.

Thanks
Varada

[1] https://patch.msgid.link/20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com


