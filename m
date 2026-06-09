Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494FE5B21A
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 06:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780986766; cv=none; b=KkKRLbZAojpJG9VMoKj8AHuoLmweP/OmAVFoIvXKsr0Rtf1FZLjm2QxgEs9kZMOnCDN84YVZA5QorzhzfqhxoHd8rAwzcQYMaq8+vXFz7Urb91o6iKkye+E+E7h1yWoFJwLyJAqP0gq6RQ79frqWkXcNqhDdGEYJXBA4sKhcS6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780986766; c=relaxed/simple;
	bh=+GMMjn3hsj62z5+uUfsSCvzCjK33Mm9GHRETRXWgMEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGdKXJzy9gPMAOeQF0DG5obD0x24RHbA33QCx392UQq0yGeqRV1ahD7HdZ2sxNFJeF9ey49uanrFAGLrDSWUmAN9I2tzSjtPx+ViToZ03ckPWvZ7KOw6gqmtb6SNYye1mggZkoKrH5Yt7UKGflQ+aZ+NCl/7BEIarfnDd0g+4VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncPU3+e0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZ2XSYip; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncPU3+e0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZ2XSYip"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593xaEn1478553
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 06:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Fw8rVWdcZwRCeJaEN+LtFUGm
	AVSjdUhQcaecKC5y4SA=; b=ncPU3+e0tUCPM/NMH4qm9+CedFI9ZgnPy1kORLSO
	9OkXVASCDeAoERun2GTlrVeMTp4xZNAjsxFRc6H2wNHzkkNgiT+RS/ShMNBKmozr
	uGA1IIUZtXEek3wadmkEwupr8BJMc7Hrb8W09Ri37QKizorX0K+QTWQq8LkM7Hd4
	ceXVpMtC1YXNbDLwAUyjuEnzBhy1mou4IXxx3BV+PFfflhEaDUTfBCAXlOSYTvQJ
	vSUsZnecQSFj05N0guIj/mCXJ8zH7sIQjjZeeVC7P2uIKpatCi4tSDSTv/Zo6Rhe
	00DZiMz3ZJNJE7UvegEf/ebio/ZPH0/fRVHO6UscRGkJ+Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0n2sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 06:32:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51760f997fdso159274891cf.2
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 23:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780986764; x=1781591564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw8rVWdcZwRCeJaEN+LtFUGmAVSjdUhQcaecKC5y4SA=;
        b=JZ2XSYip/U3VqmlSx+kudYpytA4Py8Rdv3YY4iLZHMwykFdSoTiNskspYPOoMSmh4T
         zRKYvXUZLkHVN8w9YMBVCWzx/AtqqsfYtGBIksneIDhr54KjPwNmP3X5c6xnZH/sBRKe
         atNcsFUQ/4EqpxQQne5J3CFXnShNco1aB+z6rubBMrGNC+Qp4ydHKyNPiiccotesL1Fj
         f5HLf1nysDsISd1kYN+pvTQopEHLOyBxv1ZMn0sxISxQ8VL0uBzhpjEfALQR0cZ3F3CS
         28w6RUG+cLmwzXxome3UmoXikEzby+lH+tZlyvxgtDpOLS+pe0AyUCiFWmXBZPo9Nfme
         0VEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780986764; x=1781591564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fw8rVWdcZwRCeJaEN+LtFUGmAVSjdUhQcaecKC5y4SA=;
        b=mIYG4Ix6nRscsIf7ByHG0zFEe0BftxZdp9ESlcfYgWtGjGwacPGWV9R9tL7NZbK2vk
         mm1aL8H91fcRncNL/J4dXbp36+6VIoucr0W9g0GcxUrIqUtPiaVUadPiGN5ftY8L7V7a
         l/Db6YfYAgJZJFbszO6V8gtJJptbxRndmQJYI4XFoxSBcWYSv97dQ9FhCTN0pfOqTnj1
         kHCzdnHyZWLgKob9v8CsvkwYdi/GoyFRDiXLDI/KpDOpWCE3/uEU4/BDFgX7aTtVK+bg
         lGdqCBt+s6wX5M9ImsjjNBsUBeU6/lqbcGnGoDhgmLk7Icg6M1w/XxIvNtRmwahxMREV
         tvcg==
X-Forwarded-Encrypted: i=1; AFNElJ9FqsWBRfqTw+K7bxy+W9MwZI2Dvgzte0oefdNd2iusSBX/DhMOKq53vIumEnof2xy2GpntKLbOc1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM8ldmwV9KeKG6uX369is+otX+8LqK1yWxTzQtvhEbN6WYDzmH
	9G0ggLjcvdB1UV9hSRpxwc6ExlnDLVMB8iu3twLZwW2fCD8RNOY6QRHQw8Wxxmlk1yQjdQmRlJw
	mvfCrIYCzFciEzkXC3DB18IHKebgy5cUq1NWkqPAFlz++TeoOrsvN3v0+yaS+fHo=
X-Gm-Gg: Acq92OE+WwDOIopHfAu/Ay/K52gwtevp9pCGUDJiUn0sLokqFq1P28kDzOPEGae94Ym
	SAP+5vw5KRbJ3JFKGjUPFb1oBdkaHQOrE1c53sIS9wFtL5HBcaBvQOyoAmpwQerh+KH3SwPOyON
	FfAS965S3ZJz4DgXhxUB//zRleWss6FROvI+fjt6jRz+TK0gadUjRi21oKD7i7C1pmW2VN5xXvX
	GGylQjyvZ//zlIOFuEPvGNQ/gs0McwcK5JSuW0eQuEelUF1EHC9AX6uPQORexCHBLqTQsAj8m0w
	LeBXYklXLBiPU2Gw/tCxzKhQVDEoeokk79Z2dOX7GR92D9U8EC/GsYcfbZ8oeJFG10nzrevL1pA
	LzeeScSpn43Rz1CYxBdIdvn/eRHxDh9y135+gbgHeAvk=
X-Received: by 2002:a05:622a:142:b0:50e:a1ab:67ea with SMTP id d75a77b69052e-51795c8e010mr271247711cf.40.1780986763667;
        Mon, 08 Jun 2026 23:32:43 -0700 (PDT)
X-Received: by 2002:a05:622a:142:b0:50e:a1ab:67ea with SMTP id d75a77b69052e-51795c8e010mr271247451cf.40.1780986763119;
        Mon, 08 Jun 2026 23:32:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2cbb4cbsm251161395e9.0.2026.06.08.23.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:32:41 -0700 (PDT)
Date: Tue, 9 Jun 2026 09:32:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/15] clk: imx: scu: use clk_determine_rate_noop()
Message-ID: <3bx5w3q3d6jts4bvf27sclmnvytfdft2pocnspnk2ptwipzvec@edjcz5llvfli>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
 <20260505-clk-determine-rate-noop-v3-4-f3f829fbacdf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-clk-determine-rate-noop-v3-4-f3f829fbacdf@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1OSBTYWx0ZWRfX7taCss3LaULh
 579p3qwHL0GfQeS3OEX+H6/GUxOITaeWGiB2jgBEr7zDSYm8E5z0XdWDnNPtXmwp9r8uicpw805
 oT7/CarEx+I3MKbtKkeZhE7TmC59vltOXZuHynH6lsrQiTMKGuoZ8zILgfRwRuWC8/Z+C5IXUY0
 hsARqx+lMF/TwKjAw7so+VDyk5dJ5hEyPfY2XygqGJA4fUEpFXFwAYqLZYK3s7NbT4FGiPnVPaI
 CdTc6SpV6hr5/9v8MA/V6XdIXV88llHCfHWjk7BXBERDC+GLk6z/3j0BAWz13JD2ijOPPVYMJ7Q
 RDcVcffVp/8GKMhakCIEvPkSVuXq/o2tz79WLcPEkrpJvsS0ejjTGb05tRD0smVnEO86ZlbhV0F
 cs3C4ONb6qSeII2d+kK7owLGauRgy3hJ2WhpoeRx1V4HAO/fdphIAqibZ90/gBlb+z4s+MMPKFT
 EHdnCwfv42xtrdvyzYQ==
X-Proofpoint-ORIG-GUID: 2n2bQMBMOl3hUMsPX26gPez9EMnUMgA8
X-Proofpoint-GUID: 2n2bQMBMOl3hUMsPX26gPez9EMnUMgA8
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a27b38c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=yiv6Am5jRSTGblAyIcUA:9 a=CjuIK1q_8ugA:10
 a=tYq66TkwoL4A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1011
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090059

On 26-05-05 20:49:00, Brian Masney wrote:
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
