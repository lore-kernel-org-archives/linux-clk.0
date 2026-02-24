Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B7036B07C
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771927082; cv=none; b=Kh3ds0r8DUpuR3wv0vKXz/8E/HNAJkDd7+B9Du6SDTi/MGP2Me+g6q/L47UjyP+D0DS27lLJJhcxTyp3Eee+88yToOxU2FB+BAlTfeNuP88nM0BImLltCgPgwsdwqchFA/xmlCwUuOz6eAFQ/MAJQ3KnDve8e4klKxntqgRdToM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771927082; c=relaxed/simple;
	bh=Iv0RU8ESXCGS1lmPLquw+3+cIGz1w0QV9/R+DRzRtQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqHIPRWVWkL5JOjQAhmsnEOFY2kAfhtHlFvZ8rIj4gJwbHAvsEGGdNkXylo7Bx8cByNf8nxcvk+ZDJKmRCAGDnpoEoCogTV8jU1SdlaY60V0KYaSBCkCZGnbv3rDm9BrYFtSmxxz6Pn4Hcx0ozE6phzbHo9SzVCUXIlRdLdLJnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ss/EfuRL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GsUT1Wa3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ss/EfuRL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GsUT1Wa3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O9sk692237457
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 09:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=atWeCfnf8b/NdVkyr56hTky4
	XjjMPB6Vdu11M3dtNFs=; b=Ss/EfuRLxJD4Jo4rOx+5N177MtA+FEq5jQgZ1rkL
	W9tFvuyPEQRI7ZOjT3HZqiqByKq1zXOIIS8GytrhpNV7SeOvoy446wsSUrGYL3D0
	GbbegVReVhjIQtLHy+BFD5lEwWCE0FGz7mTpjPbtuZUeiPgGpEcwISVajjkinrj1
	hYnYsp+0WTPbx1mCUpdb+5tPgILMtOeZ2xb7Xu1bUbWLU3Ke2z2Tfu0aHDCNb7V2
	yHHD0+ZseoyurIgCbiXo8xIbI7HLj+r7N3Zzn8ZMoq9TxlxlrX4zt+hGA/0w7B+/
	JeAREjw5j+3gw6K+4WEIPdEolGgkeQK00X1rFclBBz9LUg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtx0an0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 09:58:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c882774f0dso4482703685a.2
        for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 01:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771927080; x=1772531880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=atWeCfnf8b/NdVkyr56hTky4XjjMPB6Vdu11M3dtNFs=;
        b=GsUT1Wa3cIab1i6G7GC/blMQ4uYjJ8Dy9sMKYDsb2mjmz3sbIUhKqzHtv0WyKAWwqq
         FoNBKTqUQT7HsCztBmqR1tlwJ9jYocWtWRJDrQlVwvhNLTlJLNwoEU0Nc0bd1sXYSr5k
         xSDYmrnN1YmqS3CNKprzzzGsalNKKN3TJdbGpS9WFaE4yqQ05LuS+nD9iL0usehOZgZK
         rbXqm9j3PlGl5Ks7khwGMwjXLyAcBKK8voQxCObfcKlKuiLMj9uRsgMN1hBR3Pf77OhZ
         tqeBfdlmuu06zZo9nIEOvKCB19uhKgB1rgtQJ7L3Vq1kxtLB/8aYAy3Tve/xcrIVMBJa
         FLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771927080; x=1772531880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atWeCfnf8b/NdVkyr56hTky4XjjMPB6Vdu11M3dtNFs=;
        b=b5VEYGyIB31oExyECMtNu6duzQphkKwthu5VJX9KNcqcUPKgTVIJqnGOCWHmj3sDou
         /yqAEV9rojYH03lBAt6i3bBO/jWr6NZiN9kKy/X3vRZT9haZpIOOm0igxTGEm2jzBUA3
         DnLATK3YQ2RdyV65G1irXrKc/MH6mlOGBUc1qQVz24vhW2aUToEUi80Eg7WIsaZ/vPg/
         NAWkptQ3UBd6bd14R26XJ4LE8ABih8vqgIccOXvNhhNwpi/KQf3uOCqHlXj8HGhUFSgL
         Yc1FrlhVfcZu5xbacPO872Hz/rRIyoqkfaoKNVH2AxMqfX6UjgRVzl6qeRwFoC1OuRsO
         lsHg==
X-Forwarded-Encrypted: i=1; AJvYcCWSNOf5Lu+0ZsZPmwh4KYWJz3sNltJTKdUxQa85S2JO/0P5HKNRVj9eehvSVsAR4MfXNNCa5Lo+6hA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTVSjSQ1Z1NV3JfScHJhibL+/GUiU10mb74CG3KtT6v+a7jB2+
	CvAPQRWMSBzV6lBQJyQ1t2iyBflBzsoe92sbivI3LdAHhLcwhVpzZ1uheAyczS4tJsuovWJF9Ek
	HfIRtEWwFQNNk61m0ot1Uv6qV41Ss5RbTh/ecNH4lVcBZ0wTW4Jvzc8110EW2jXI=
X-Gm-Gg: AZuq6aKJKubQrRfKth8U/DsTjQ2GV0dA0VwiVtoij9vVlt8ZxzSecwCf0sScYuDk24W
	/H2RG3kxuVcEEosnMl7eCgg2KFm8XRSpkIZCLRfjD3SVUs+L/Hyak8RGZY09bzS+oBlqfy9FQY3
	PiWb79A1rsiegu35+Z6nhJjHw18y8E685eEsDyUeUFokR3y6wNaCOM07I/12NwyIl/eKKT1+ZVs
	DXDSRF9YZWT8+zIDjeKrzw/0aS/PrrlmW2i+lPiqpFliQu+rLu2gmlcrSvTPTN3jxzWWdNJUJxH
	A1GrfYRHQgYa4gyOI2yM6SsJXJPK1IXOLqhIOhpdhyVfndqL6Gu74ApaA1/TuOkMhpJORiHsbYI
	Xqy0x95yN+bUKH2k5Yf9+faplKmURYgJDi+/G
X-Received: by 2002:a05:620a:4587:b0:8c6:d64b:be43 with SMTP id af79cd13be357-8cb8c9d1dc0mr1513681885a.6.1771927079597;
        Tue, 24 Feb 2026 01:57:59 -0800 (PST)
X-Received: by 2002:a05:620a:4587:b0:8c6:d64b:be43 with SMTP id af79cd13be357-8cb8c9d1dc0mr1513679185a.6.1771927078924;
        Tue, 24 Feb 2026 01:57:58 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00768sm24787904f8f.10.2026.02.24.01.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:57:58 -0800 (PST)
Date: Tue, 24 Feb 2026 11:57:56 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, daniel.baluta@oss.nxp.com,
        mturquette@baylibre.com, sboyd@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Message-ID: <66i6cgh5zmz32ikwjvrz3gtezjotltqmfzdai7ybwjhanx3bif@i5g62ziautwq>
References: <20260212235842.85934-1-dakr@kernel.org>
 <DGMMD195G9VX.245Z0JMIYO9HV@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGMMD195G9VX.245Z0JMIYO9HV@kernel.org>
X-Proofpoint-ORIG-GUID: kJLDjWP28A6PnnD-6EQ5idm8NHTWsiCc
X-Authority-Analysis: v=2.4 cv=euvSD4pX c=1 sm=1 tr=0 ts=699d7629 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=8f9FM25-AAAA:8 a=5g7N3gLuN7TUrZyG1CYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-GUID: kJLDjWP28A6PnnD-6EQ5idm8NHTWsiCc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4MiBTYWx0ZWRfX0Zli+zK0pq+C
 kEhfbYAIvuHoqWrzVXUGmGmulq0xpwufMwMUuQXPfidwcqAdveOV9sAArK9oi9kPBVYBavzF/bj
 XgDlh9LAKho/WoRYTsTW7PtgpqW06f1QmHxPQ510GjfvPV9jC7O0NsARDSzkKF9pOfbwKGXRwoF
 RWGg7G3DUHGEQPBaVrqtCCvCdiO7oME6eKpiKreAEPJ/rxR9NzIlawwa48OJ+Ty+7o+9ECmfHwB
 Dme/576hHQEtBEMcNBLynYVbDNJInigAnBAEIyZItkG9jl15npiNEH0NJPIS8vT1E1e/aNdnMKT
 MQp3sdjkL4wX3Mb9JI5PKuq1OvqsL3n1bBmaIsbZz7HeFp496KAdxrDIey+C3RfUkIbM/2XHUHx
 wkT1H7Su2Qw4eDd1vQS5G+Whm41Ntfstaw1jIG21VbXw0TIT9YZZUtkq0Gzwfz9IZlwLD0pTjbN
 tqwzJGUnQ5tYyC+VPFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240082

On 26-02-23 21:21:29, Danilo Krummrich wrote:
> On Fri Feb 13, 2026 at 12:58 AM CET, Danilo Krummrich wrote:
> > imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
> > called from IMX driver's probe() callbacks.
> >
> > However, it neither makes sense to register drivers from probe()
> > callbacks of other drivers, nor does the driver core allow registering
> > drivers with a device lock already being held.
> >
> > The latter was revealed by commit dc23806a7c47 ("driver core: enforce
> > device_lock for driver_match_device()") leading to a deadlock condition
> > described in [1].
> >
> > Besides that, nothing seems to unregister the imx_clk_scu_driver once
> > the corresponding driver module is unloaded, which leaves the
> > driver-core with a dangling pointer.
> >
> > Also, if there are multiple matching devices for the imx8qxp_clk_driver,
> > imx8qxp_clk_probe() calls imx_clk_scu_init() multiple times.  However,
> > any subsequent call after the first one will fail, since the driver-core
> > does not allow to register the same struct platform_driver multiple
> > times.
> >
> > Hence, register the imx_clk_scu_driver from module_init() and unregister
> > it in module_exit().
> >
> > Note that we first register the imx8qxp_clk_driver and then call
> > imx_clk_scu_module_init() to avoid having to call
> > imx_clk_scu_module_exit() in the unwind path of imx8qxp_clk_init().
> >
> > Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
> > Fixes: 220175cd3979 ("clk: imx: scu: fix build break when compiled as modules")
> > Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Closes: https://lore.kernel.org/lkml/13955113.uLZWGnKmhe@steina-w/
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8x/MBa8x
> > Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/ [1]
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Abel Vesa <abelvesa@kernel.org>

> 
> Just a quick reminder now that -rc1 is out; I think it would be good if this
> could go to Linus for -rc2.
> 
> (Just in case it helps, please let me know if you want me to take it through the
> driver-core tree for this purpose.)

Sure. Go ahead.

Thanks!
