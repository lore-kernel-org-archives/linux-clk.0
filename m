Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4BA26A1CF
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 08:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769588313; cv=none; b=fNAkKhSMlNBC58VAHY0gk7/U4kEQU8MSV5ry/gIpQQ8gG2pizRzEfCSVRQdQ2D6u1VkgvoBfbJuASRzg4bGp9XGBNd9EcK2K8Xo0aBFwdfO4KHa4z2tV57yhhsv6IDzTLp+CgCOMxOtnJK0Syu206O72jx2SY20yVR1+kG8XFNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769588313; c=relaxed/simple;
	bh=mRnmIPwPuFBGoSOwRjYoyF9qWgPBIkgCj3F7bc10gfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwgYMAbnNkt/znfT1KcRf2kVBC7Zpwwuq9Y9TIN1ntAqWxQ8zMXBUhYWuXRrhp0NGk+6Gj79rQ7swLZRpz1gX3pzsi0cgLDTqKisu9XF48c351eTWlh8blybGOK+oaiBjCPY98XpzX6+Rh8B3BEepIkOArkAxuta9avCy9hdFzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h72SgdpX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nzy2sdHu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h72SgdpX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nzy2sdHu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S6fFQN2952591
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 08:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hv1CC3WnvZ62/mzoqWKFEsNi
	DJiNf6hLtHjTijYGbYs=; b=h72SgdpXbBsJcG5yABaqobnbFQW1SD35XKSbHiXI
	RHi3w7Uei4rdW0z8dJ3JsRB/TUcL8uBNpr/x8BIN0RWQJa6sk+evJAVO++i9bmN+
	zHl5Tab4t0wNIl9Lr/HZ/ckkWf9DK6Rm8tygprr2Hop/+yOB7zzMhWz4EEb6cNH3
	6I3kZhcDpv69X0E/EkFvGUGm/YwT6aLtQhlJtesTN45S/H6bEtcmep3c3l7SQu1V
	tDOYpKir9gGjKEqrEga7d+54tgZNzyk4tYgpyjPU+44I9nN8g9KPr06pwsjPBDRs
	ul28p353RKZnOD6EH0IxZkZx3Gi8cI2uJXUpgUDP4KB1pQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjsu86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 08:18:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70d16d5a9so320123885a.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 00:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769588310; x=1770193110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hv1CC3WnvZ62/mzoqWKFEsNiDJiNf6hLtHjTijYGbYs=;
        b=Nzy2sdHuUVU9oF1ckXPvXTs0mmsI9Wbb5lkUGgt6GdB8MDoDpXrotaGnIwBAGNZQ0Z
         misXrU7o4RB3ACwm53LRZu8rqzAo5gzCrh33+3zAJtgRQ+YFCMoYhzP/liIigzq8iI5E
         7RMFbvJwSvF/XU/biI2xUJpSr6oyR1skT1w+i6iU9FwRSB5FAFYuOd3DcnemZqBUxdpr
         A4ncD0sznGop32FMYF3jeExJw65m0oozs6L+kSbxUGxNFJwluwryy0vYc4OP5GVdSGhs
         5mRGIRTsaNjtjDe804ZLDUuXZ9Bu+IRylOXFn/AAtR0gwfIE9gKaFxeCJOfCLLfvbUU4
         4iEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769588310; x=1770193110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hv1CC3WnvZ62/mzoqWKFEsNiDJiNf6hLtHjTijYGbYs=;
        b=u47A201LjvU1cgtgyCOZ9gfS9U59UQxWlH2Dm6PJk3PDtxgNInWQVSpTQmQ0hDof3i
         FD3UnOgk3AZ19wvmFjsV/0eJheWq+N1/tAImSgwkLHeUiswRAlxm/dN9Khh3/Rv56aC6
         KlF6IBzg8QGbAGtYljbfYYVDtrBPLU+clOJi2u/TMUHWC/aTP/sJ84vF7PsRHl3N6I+5
         ug47IcNhcdvWoH4XQwWY+Lj7LrwdxoLWB01+nskqKtG0SyIxm4Mr+MPpNIXesuhKLpsC
         nnPgcIlKk2kq8ASJikWsuMI223ZT1SMAyUp/+NV2G5FbU8w5+o9Si6BDOhgc/yNJi/3m
         2fOA==
X-Forwarded-Encrypted: i=1; AJvYcCV0FOC4DZbXk3gpHGyZI8tdcx4gBySUe+e2i6V4In9ClMbfDN8hHNEFCl0yHQui+N1k8sGnC+DSYCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyitlmvUgqdUturWQD77FUoVJBkEnkIdMz3FeTj3lcb4lEEqES+
	LgcDpkDG6l1Cc9qqK8G7tbiL8oeCRdtD7yKtKbLvwaRUyDomb1dgbgvZR60UVDFX31dnNsdYFFD
	zuIDF3jCfie1oSpT5iz42aA9Ur5Lw20M4cm4SqAirOvj3J4aIg3Ts5JXiQfXjX8o=
X-Gm-Gg: AZuq6aLOd9XypJv0uUbxO68eXJi5a3RWuALoxNAyKFer7XXCUqB9z8wizoOd3HHtd5i
	hEMrU8NYwb7ttSUDcnqSW8EMF/34bxfgHrFrKcbXgT3p0Kthrv4GH8UWykntn/IZX0Qo47IjpNU
	6FarR54+8oFZ0IbnmnL3BWMpaFgPNbshiRJPIHW+HNF1BDkeKgPQOQSWiWZVlb5JnIcIVDBUUaI
	D7aDyML2xWGMZc8oPaylzd8qV3P6ASvWLmYl6QIiZRS9SmyX/ufoYgGwCcXt5y2neEoP4A5/eJP
	XYe2Ovq8/mgSlxqgPWpCRj5n1VVShnn0NBCphWsF5/WBGGDRDt/678IyDlOUiHq8ynScgVoxFBV
	hcj4Vxfwf18X3OOY/tsfhfK5v
X-Received: by 2002:a05:620a:4084:b0:8c3:9be4:b209 with SMTP id af79cd13be357-8c70b862e00mr586255485a.20.1769588310143;
        Wed, 28 Jan 2026 00:18:30 -0800 (PST)
X-Received: by 2002:a05:620a:4084:b0:8c3:9be4:b209 with SMTP id af79cd13be357-8c70b862e00mr586251285a.20.1769588309534;
        Wed, 28 Jan 2026 00:18:29 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10f82aesm5359223f8f.19.2026.01.28.00.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:18:28 -0800 (PST)
Date: Wed, 28 Jan 2026 10:18:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] clk: qcom: videocc-x1p42100: Add support for video
 clock controller
Message-ID: <5gzop2avxsqrbukpfm6cw3xlnx6e2myhln4msgxsg7kqu4o7nq@h4un6vnp33j2>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-3-b23de57df5ba@oss.qualcomm.com>
 <795eed3f-7796-47e1-b4de-23424ab7062b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <795eed3f-7796-47e1-b4de-23424ab7062b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA2NyBTYWx0ZWRfXyLQpEKAeXOzm
 SZG1gi0+VQxVwKyFYs87NYapPfjV6YTFjUga7dbD5kgRn5KTPxKYS346z9a6z2PyoC9EBxShKzA
 0zBSX4hbFC215I47any4hH/hppCo1Ezhf8OBZc05ZxMTe1NuYdxS+X1Vlx5aSBSah6efSHB5DB3
 3adoAuf6/4EXuU5n0giD9q21Fbqea+lNqIcr289Hao77lHvHY+IYtfbaHSGXkuN36aUxip7sP+X
 M80MIif+YTVpUokU37MIy9P8E0qtpu1JwrJtf/k9WL4BgeulTHqhsDJQjcCguvMiwZNsmPH6MV4
 J3rRFNp36vQDYT5LWSd0tUAYl2hGuu2HiPnnrEeB4NYQP5RdeSPJolq7ovbNNjTALib6iyZyZPb
 gLGEGvELf/EC8qnI7Mj46HSELMR5MgdK+MV2MzKwpERsRbWHqPq8iWWQYv8vRHGiXmvcKyOMV49
 gIT4umnHFAuI9A7AgvA==
X-Proofpoint-ORIG-GUID: auXGd5gvOpeoIG_amP3BDUbA3vCLFeo8
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=6979c656 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=S7Vqdvs5AhOIsE-KuhsA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: auXGd5gvOpeoIG_amP3BDUbA3vCLFeo8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280067

On 26-01-28 12:51:30, Taniya Das wrote:
> 
> 
> On 1/28/2026 12:56 AM, Jagadeesh Kona wrote:
> > Add support for the video clock controller for video clients to be
> > able to request for videocc clocks on X1P42100 platform.
> > 
> > Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> > ---
> >  drivers/clk/qcom/Kconfig            |  10 +
> >  drivers/clk/qcom/Makefile           |   1 +
> >  drivers/clk/qcom/videocc-x1p42100.c | 585 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 596 insertions(+)
> > 

[...]

> > +
> > +module_platform_driver(video_cc_x1p42100_driver);
> > +
> > +MODULE_DESCRIPTION("QTI VIDEOCC X1P42100 Driver");
> > +MODULE_LICENSE("GPL");
> > 
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

Please trim your replies. There is no point in scrolling all the way
to the bottom just to see a R-b tag.

Thanks,
Abel
