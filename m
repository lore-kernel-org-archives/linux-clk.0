Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7AA2EA171
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 10:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771237973; cv=none; b=i02wGRYRYNwlQ6lbDIHYdaoZDbYPc6XNhGpP6IUdk6G8zL6c/OyCdgfMsB/NuEf4dS3eNZDb0LBtti3edMKgIHGZ1fmBV3qBwpjZE3lrwagXy5n9mmc6KRAQHsTguvfyuYyJQhZGnSCTgF2uCblGshtqKZe8IzeI6zIJNX2AnO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771237973; c=relaxed/simple;
	bh=slHLX6ermrbEdMU7Mb1n04AGY3NbFRMTGUVipYQQrFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4HgXOJrV9eSHZX6VB4IR2eR8Jy/1IOlVutFqWKMqqwrRnI5cbGop7GRLTEdmdfLv7Sb8QLApuqzfl2XdzwkUOgSzVvp5ISrDvTzsU11001+tBKTbk1ibiTzmyrSsIrAn0ISFSMY10sGL5/05n81SUKCONzUWENjm+8W25dJO8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fVYKLm9e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIaPfYZl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVYKLm9e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIaPfYZl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8geGb2803486
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 10:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ldz6g6SovUoukXhKXBWKpNMY3TWItCGCHJsYS0M0OHo=; b=fVYKLm9e9AFd3YZF
	VC+Meh0tnjSUM3KUbTciYtCtohTsVrxtGzqlmr1I7d4Nz6xbzMyBoWAJlJ5YPe24
	mDGj0jS8tRXdQMDcZ8v3KYp22wTvAC8LQaZLQcYJiCTqsoKFpTMycD+wGGKtcAGS
	ENLTMXo+bWa2tSayF7TNHOX9OFf2iei15VTHTf+sk0404M7kS4mmfJP5K7eZ+diA
	3VlzgDeO9hjoJQ4Qke195hm0KPv98Mmrtm4Wqtqy8F65sRSreLmSQ+gXiuos00jh
	8MSFf3nUER9e/VK0K6x3QaQVOTIz4f+OrMedlzf6CdNVsbFqlZdMHcLk3WmHb5By
	bAlmHw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxug97p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 10:32:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb390a0c4eso2672264685a.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 02:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771237969; x=1771842769; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ldz6g6SovUoukXhKXBWKpNMY3TWItCGCHJsYS0M0OHo=;
        b=DIaPfYZlNMgrfrhQVuw27fqalct9lBkBOyJJ3XghuaRbTjz4OdOh/hGTfBhqaX4JGs
         gXowvQ3sNtU+TADUmQ3orIW6NX/pdteqNQlU2m7mP7DbrC6F0KT9bmF6yn8G0iRqHuZg
         eJXc8Lqfsi7uPDWZs6q1SeYesnmICWVY9Xivqf5ntwDevk6MfhbpnG6E/NWDc7L9zXnM
         NFuI0nBOPjlJ4EK10JmYNwsXNOs9bmKbIOsP/AUDzOqTYQmYVkddbUo2jNJwMeER4njS
         j+3h75FROm0vOnPHWNkhc3rry9VimG0Cov3IP0ULESevx/ogSMatRQmhm3W3BPMrESFS
         IEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771237969; x=1771842769;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ldz6g6SovUoukXhKXBWKpNMY3TWItCGCHJsYS0M0OHo=;
        b=UUBBr2+gsft41eg8dU0CwCiepB0sJA/W//flC8C2GGFEOjeQK82vrwuD3AC/t6UEka
         r9lOFCKiDS1C2evpQvGNO/cnU1aSrXcx/SdcoSKgNzGI8IcPYk0wrgNc7vp4cQWTKorR
         43Spcsm1mI3MDDOWrM9V3msHcPg5uH5oep5TfWL2tul7lDObZJN5kFqvWFll1ke+mqS2
         rrOlOZhBlrD4zeknHPcYSnDkUipwOP1imPjStrM3eWGCyVHYbCXXNBqJqbPsWiHHsNyZ
         JN31Do55k8Th2pN2sgNR+EsBLcFAy/AS/hSqCCGBCMB9jicg59BqYSwqdRMUeve5zh4T
         7CBg==
X-Forwarded-Encrypted: i=1; AJvYcCUSb4RsmErxhC81+gREBBal1JEtw3dTEpQu3Vfg85sho/p+/yzHJ36CjfUNocyP8rPzxMleXA+7XUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaP3Leq2sDFw4xtWYd1mdPBEOg/OHnXYBM3uv2vWh0vSxN9+wQ
	ysrsPzCLaH6v8iiMGdX1NTY/Cc0MISUfQut5PkVgT7YaFzs0LHb/jWJzwA8KDYpNzrnwkIbIekj
	Z5wU1GMyIc4MLKOoKU86OmViJArYMPTfgGriVbeQgcrAD9CfCLZETqTwwpLrrlD/U/WEe5Ss=
X-Gm-Gg: AZuq6aJQF4INaNYFBLBi6iLp6CsMzqG2cMcghAsMl5+kYWxtrfmBmDETsf8YCRAR9vJ
	WQlkZsvM8dDCH4S2vf8JgphqD84P3LPMZN6YMm0Tr9fAFeQOYscyEExqZUe1GAajX/P/yiq6BJy
	RSY/hNPb98lyqPW83uN0kOEU3YnToNTxxjRLGxHJ7qsIrOwLpSWGzKYfx0N6xnznpVm6CmM51qy
	Wp6PiRIOYz6E7R7U+m2e3IsuFtCFpUqt15/kx/dQMZ8RA/R74hRC2zv5Jc6hxtaDlIRW7i0TXXI
	jMTlX83p1EuZeseWkQbq2cW3gZNkBnc3d3LC5HgDfOTZ4FCOVT7hivw/cj3e18p+zs4oIBeE5xa
	/Gv7faH1djH6L+fYR5zPSVtx8peCx0I15HLQ1
X-Received: by 2002:a05:620a:4727:b0:8c6:a034:9226 with SMTP id af79cd13be357-8cb4c018c52mr990686285a.82.1771237969497;
        Mon, 16 Feb 2026 02:32:49 -0800 (PST)
X-Received: by 2002:a05:620a:4727:b0:8c6:a034:9226 with SMTP id af79cd13be357-8cb4c018c52mr990682785a.82.1771237968932;
        Mon, 16 Feb 2026 02:32:48 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac82f7sm28469525f8f.28.2026.02.16.02.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 02:32:48 -0800 (PST)
Date: Mon, 16 Feb 2026 12:32:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: =?utf-8?Q?=C5=81ukasz?= Majewski <lukma@nabladev.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/4] clk: vf610: Add clocks to support MTIP L2 switch
Message-ID: <jk6roonftm44qwnyxezhukdoqahrj2l7zaa55w35oq3uj4en4w@obfufdazx3wb>
References: <20260129095442.1646748-1-lukma@nabladev.com>
 <aYAEM8pcuumly+hc@shlinux89>
 <20260216101538.0aeae484@wsk>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260216101538.0aeae484@wsk>
X-Proofpoint-GUID: 4gokW0GlF_26mlyyNYqXrfPSR3rFruUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA4OSBTYWx0ZWRfX6Pc4y1pcccsG
 Zo0SgsiDpFWfCXStOmh/ywfSX2T6wR4JoeITojNigmx/4zLeuENvNiZgeE7Pf68sx15DT35elzv
 ZRaLvi9bGvZ2UpxIlMHhT7lsFcyZhFzwf6BABGh+nHWWbVVQxRVyfo0xDTXeaEW3UUbCybBljO4
 q5zQJQtgRE6mGVdnzoPT1Ay2VjWd4SE15g0IY73uEAtfnvt7BjNvahrgwIqt30Em1wAswpADBgU
 pburXxcsjLNOqnYQh2ux2qjUJ3WCJIatoF3MXXtICi4T79yROSXt+/VonxdncGRXWl57mdEuiBr
 qwPPi7saEWfJsMiPvstDwio/MIAeU8/LBTyBT7G81vTDbCqyUrJPqanoMjzYoS3NY7wuPAHhHuP
 GgI2w0o0plOoOP+7VVN5wC/A6Xz3hsunVRY4CnOmpOfdON3UxdmeqKN+F+fgn5AmzcpvgFzTMHv
 nDPuMZJl1OrPzaoha8Q==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=6992f252 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=8AirrxEcAAAA:8 a=f3gpwmEmWHM1I7Tw-EcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 4gokW0GlF_26mlyyNYqXrfPSR3rFruUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160089

On 26-02-16 10:15:38, Łukasz Majewski wrote:
> Dear all,
> 
> > On Thu, Jan 29, 2026 at 10:54:38AM +0100, Lukasz Majewski wrote:
> > >This patch series:
> > >- cleans up clocks' setup on vf610 by moving VF610_CLK_END define
> > >  to driver code
> > >- introduces support for several clocks required by MTIP switch IP
> > >block
> > >
> > >Lukasz Majewski (4):
> > >  clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
> > >  dt-bindings: clock: vf610: Drop VF610_CLK_END define
> > >  dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
> > >  clk: vf610: Add support for the Ethernet switch clocks  
> > 
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> 
> Gentle ping regarding this patch set...

Will apply after rc1.
