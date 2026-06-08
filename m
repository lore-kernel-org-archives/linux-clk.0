Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F107E318EDF
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 05:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895862; cv=none; b=GgcEuSj09fK1QbjWy13O3zrs27Eik2t5pjsxV9jmHBaK83eyJlaF3rPrssyq+V1ri9jcTENl9odrnE5WYx7AT3+NiXEDNQmvu+5HuLWstNqvaQe3vCTV90yv5VG/lFTUT0A8WMLJIawineZtPbUMV4/hOEGwv3fdKDIcgqIzluY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895862; c=relaxed/simple;
	bh=ECCQW3xO5T10iM5U19E+0qZYiXxmAtMlR1/dkEEP5jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXW08Dp0HAkmykAlJIv1u1uvBtXo6eKswZ+mhga5LOnpfS7w6JvawvG2FVHH44neIJ5jHAOxi8kJN1NE7v58ObbSJWqz+4gdj9Td5Y8VhWbT9TqDDliFCkhHHLLt2To4YfZx2DNwUY7QJmf7+uId+/qsSJwaza2jvUVuPfe2W4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnEC44Mm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJrJ5BAf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnEC44Mm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJrJ5BAf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GCw42027012
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 05:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jHDv+l1yJPatDEFQEt3C8+YE
	NnInljrnoEQC+ZtHEAo=; b=JnEC44MmkE34jRXFAcP5fjofJOckK7SAsjHw/smZ
	v2iIudu/0FYOM4IVzFVJqii0MWFrktGFow2+e5NRhBk88YbumNtQJjJkxyKjWSjL
	QguzgEr5DaKfq/rMbJSFdX77PjWNOzpC1uikgygzKbUKpxjJJOFFwW0FAWznlTMv
	LDYGSQBuFrKZKE6/hAJwztE71NzRxkQGKuVcLaBQFi6GKmb1Z3Cr+8y5Mp/Ve0JK
	iUbk3IwwE8CYK4VB+au/YsHTcnv0fB7/zvgmyGG9uVNH8HImqwpYV2rZNoCNeuiL
	czrowGotVNsRLF3ULKVv57X/7JoxNOefsrYd1s9dUsV9wg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4x7mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 05:17:39 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59bdafdbcbaso2940822e0c.0
        for <linux-clk@vger.kernel.org>; Sun, 07 Jun 2026 22:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780895859; x=1781500659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jHDv+l1yJPatDEFQEt3C8+YENnInljrnoEQC+ZtHEAo=;
        b=LJrJ5BAfBzHc3FoBFtQAr8UApGRtYH5FMPkZllea1H+SgtcifAD0vikY5IXjcijNuq
         GXa7fjLnrk6nw3PBVODt7MWqvhtKMHsk4nSbemwgloY6YlCzEj+2Eh6ZxUzx7yTNK0SI
         Wlu7YWJLox6tkc3fzicULaGl60VD6HH8a8D6xN5NZu16iNeoOFxmh4CJEz9UWK5eF7bT
         bgdx/TIsAlCSU9UDwrSnmygJENoFSgcwMyeZgov/RyUHYPdOHERjcwfmkWgf4fJtoV9x
         jhvjhg22wXQGwXWT2nRnAjutGgZOqMXTpooek9CBCPkI0K2a/q82PMuGQFEwCA1h9kAw
         sO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780895859; x=1781500659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHDv+l1yJPatDEFQEt3C8+YENnInljrnoEQC+ZtHEAo=;
        b=JEJwGrEHDkYyMJ0u/krPZE9YR+Go0nnCgZSyoLEVFeVo7CU/W72aXTRDY8P6sYa5MG
         QuE99ZCJ4hAhwqEI4D+bt91N+onIDD3OKY810TfesZ6L7sFt9RQj+P8JtmN03uo0/AOP
         RDONDFIFJjAUVDYD2u/FOGdUd2I9B/unvv6FwuVlB1lcYKVhnbYplETtBPhvZUdMQSDb
         Ew3d5DlibZ1kB6RAxTp/DvnCGlo6kk9upMWxQ8tF7ZBJ4iLfXJStlFM/yy1FMfIwlgob
         T2N0slCFWQULHj0EnBSva+en8kPqvb//Uyi9kJNUc/QWExDqF7ltmflvtcub2tbSGTTS
         K+5A==
X-Forwarded-Encrypted: i=1; AFNElJ9bkOpFIjytRpY/EFTsIeAXIOyCVfMiRGyLQt4nqEv9b54e7j8soSWK/W5vWFAVUHtImcc28fzzsaI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi7gbQPv2LWH9DIivcs2W4VcGbUg7bAv04pE7ObkVMpmUdKvmi
	radhMp0OObBjfkH5/dywHLvvphog4IXKomxoE3wezAMSpDYe/U1IYMOP0uJw9TUdTlwXmXDISrt
	nmTE71euSqpfHJd9xNd7TtLSZWIgoDUIXfJi3QGUnEBlLgjQOlxtOCI2KZ8g8KNc=
X-Gm-Gg: Acq92OFt63wQvE/X/8G/F9GNByUSik3qDUOvajnMBYytcapNfHEJ0VTdZPKHiBfmcT2
	lE5LrwQ8gkwDzDjTgH2MuKjh1prA48Tn6jEwLcVvdgGh7DE1UJLl9Y2M+sGDG2XsmutMZfgbM2q
	Bwum6J4ogHFbcC93xr6YfpNZCOosfNvVX4WEnaGYKP65P4EPLhAmb8gLjqPJ74yF0EVdVDUq2kb
	eERFRF2yl+FHsO5CA3fZfVpyY246qKoAX/ol6+JcF0Y/wPOe++nx7Blt21skk3ZdE2aUBw1LIKn
	XnNPPQCwZHduvlz9oxHKuMHRg7MV7bC4UtfnIBIG1EUk0/0a92eJ6NZ1rzA0MMq1XrShZKrMlfD
	mVQRDNdVIOZHxWwLaiFqdosxzzYzltZ0ZNVEj3qJwneno9Cp91gifMqseGiughd3TbdtS2uHmbK
	33lToYI2AWEpjVYIHKGt/mK2xvTAu4LZ1gVjYr3ChNWsLAOQ==
X-Received: by 2002:a05:6102:370f:b0:611:61d3:819c with SMTP id ada2fe7eead31-6fef194a11fmr5732458137.10.1780895859224;
        Sun, 07 Jun 2026 22:17:39 -0700 (PDT)
X-Received: by 2002:a05:6102:370f:b0:611:61d3:819c with SMTP id ada2fe7eead31-6fef194a11fmr5732436137.10.1780895858823;
        Sun, 07 Jun 2026 22:17:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9082b7sm3529811e87.36.2026.06.07.22.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:17:37 -0700 (PDT)
Date: Mon, 8 Jun 2026 08:17:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v4 4/4] clk: qcom: Add Global clock controller support on
 Qualcomm Shikra SoC
Message-ID: <h5wyyse47cceezyjxxzjbq4rjvghfgei32rog75mhe2cifwv2k@ouhgbhcshmvg>
References: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
 <20260605-shikra-gcc-rpmcc-clks-v4-4-a0a7bfb44455@oss.qualcomm.com>
 <gvqubjzscwvq4nmerwptrnojrui26ymigzs3mo5yqordyfsnx5@zxtjhsntbrcw>
 <0a7f8ee4-2bd4-4ae6-ba6c-72b37d6ef92d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a7f8ee4-2bd4-4ae6-ba6c-72b37d6ef92d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1T9QB5-ZiqK2zUfANCnD20m71hHWuNg3
X-Proofpoint-GUID: 1T9QB5-ZiqK2zUfANCnD20m71hHWuNg3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0NSBTYWx0ZWRfXyziwZXIcJnFA
 AjrAPfLpFxh8+yWSVb2mjK2eppw3RmKZksLsCv58XOAqWptwR+XXn1B+6EBrirwjw7W4MDk1I6l
 QqlWrJfQSJBwjGjZmalxfuTETtbrId7dtGu69fh706862SRsUnFOi4fJ4IvmrCAyMy5N5EzIWbe
 6erpcsSmMR/YFOxYo+wrztt3JV3r3gRtMXWxQGt98eSWQKkqtsN1K1OhDZki9Ov7r9a8/6iopTq
 58st+ihhIW7Ymc0qsIcvotP1Y2jXk8lJntwl41nK74msjC+Zg73mgLiMs1MsznfJl70oK81yPYK
 hm3pNRKzboAgdmbJ580NiLRRfdtYuNFkEgqhMSyKc9WnVqItf43LSlndHvHIPmOZESTFYkLA1IR
 26J/4N6nx0fwbAWsG94xWOyWbDGXtFSZ+if8gd2Oq0tUfatHw+O3ArN9J5OXrnoxldlBsM8y9eO
 E9K1FnwN9ytJrv+I5Vw==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a265073 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=cM4Jl2COizv8PBbNEBcA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080045

On Mon, Jun 08, 2026 at 10:16:39AM +0530, Imran Shaik wrote:
> 
> 
> On 06-06-2026 05:12 pm, Dmitry Baryshkov wrote:
> > On Fri, Jun 05, 2026 at 04:49:14PM +0530, Imran Shaik wrote:
> > > Add support for Global clock controller (GCC) on Qualcomm Shikra SoC.
> > > 
> > > Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > I know that I've r-b'd the patch. But then I also compared GCC on Shikra
> > and Agatti. Is there a chance we can merge those?
> > 
> 
> The Shikra GCC has new addition of EMAC, PCIe, TSC, USB20, QUP subsystem
> clocks. Along with this, several Agatti clock/reset register offsets, as
> well as votable clock register offsets and enable BITs are updated on
> Shikra, and a few GPLL changes are also present.
> 
> I agree that few clocks duplication will be there, but it will be a clean
> and better approach to keep the separate driver and bindings for Shikra due
> to these new clock additions/changes.

Ok.

> 
> Thanks,
> Imran
> 
> > > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > > ---
> > >   drivers/clk/qcom/Kconfig      |   10 +
> > >   drivers/clk/qcom/Makefile     |    1 +
> > >   drivers/clk/qcom/gcc-shikra.c | 4431 +++++++++++++++++++++++++++++++++++++++++
> > >   3 files changed, 4442 insertions(+)
> > > 
> > 
> 

-- 
With best wishes
Dmitry
