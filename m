Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A485231F999
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543503; cv=none; b=qPIl0K591SowE7Z5rjKy1L1wSupnEwNAU3O/nzEn90VkJydGNO8UTVzrxSFf/VpRsgTjqrUH5C5sLkIPj3Q23Tlx2y1Vo9rY9bjaNy9T+Ap3iCLYvP44GO4cXT8qmiugaNiGgZAjAc0F/1YO7hp4MQBeOnoC25GjtxzMcSzxi5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543503; c=relaxed/simple;
	bh=ozN+qojTTgLnsoEN6uH9ZEIQmW3hWK859Xy3p8UVIPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbD3k6lKRboMrd/ACP7i1yJtGUeEb/V7d8Rkb9aFBEcbp7oZh3GzwOnmPglxAIvqfzrsPKnD56x8WDB3zPzQ1uUHV7WID6MUy7r5WWJC0i3bEs0D24r8ZH4bsMDf+k7nf7oLDO5iqZSitk+Sq7o1h08KNxq8FVNukMxsbrnr+PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kalYhP+L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExwPoVE7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kalYhP+L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExwPoVE7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mdkO2307396
	for <linux-clk@vger.kernel.org>; Tue, 3 Mar 2026 13:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=snhnMYJDQkat9qXJwHdTGT4j
	0E3K9+24fQ/tGb/FHwE=; b=kalYhP+Ltoz84W/vWpoW3Ii5QCbGAfW/QxzwlkqT
	0llIux2NAdG/Lf8YjRtWyP/7DsUZFv6+ZMDvvxiJ0wWmFChR/GLxvaoAF4QGzyfw
	wQ6oHsOsCh12Tpt97Y4wG85YP4Kqgci4U0wLYuYK6hjj6OXSWDLHuJPTOFZlbody
	YUzJ/gifjsdCS9xx0Kmh1fSVttTEpFYg0nfI+BGjuuCZczSHt/UBePVHf9zEfr2y
	pCqIAH43GGnudV9Qt4k4gwLtYbZZVZZnxRpP+O5ZUItZK2NAp4ctxtooDyGisZj+
	bG2C2oPJNe3bnh9Sq/g7kCRnM69I1vrwVnEfAOTUtV7d9g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtu8pn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 13:11:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71156fe09so3710871085a.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 05:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772543501; x=1773148301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=snhnMYJDQkat9qXJwHdTGT4j0E3K9+24fQ/tGb/FHwE=;
        b=ExwPoVE7oXf33LJOvA5EpC1pdq//bMnvPd3/cAdKzLIyM3006/M0jIlSpd0Vox8Ql6
         70syCR4O2PVwuR6raWk1RphR7JsF2q1CRbkkbrEHW+NomkX9sCO8PVhfEXMUuQXhPAz9
         sotSejxE0MNvlHAZ03oLwCRRDepQg50mxbXfwl9EXJP4iVa1oeKchU4S4DZej/QYUVdP
         25o8kF4kIbTyfFFa0elixRL3fBKRcYjREkd8bG6r6Sx+f18yylu/dutPgmU1ou6zBWhf
         YD4bhhoM/wj1FXjcwOHcynrfVa06ik2czcU5tN84g3IbdbAhB1gOOHYGMsgcnmV14HqZ
         GNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543501; x=1773148301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snhnMYJDQkat9qXJwHdTGT4j0E3K9+24fQ/tGb/FHwE=;
        b=sfC1TON+TRQLgAcvaPIy1zT9Cz+RfsctY6mWEllv/IAtIOopaY9VPq6ymOkkAnQ+OM
         szjWxACaJTXNze3VpXzh1ra55OkBvsoOZXexw3jqDe29vFnzYSniPv8fNGmJUIcbmLiR
         QD15AX7XOJBHQgz1Z2uvzOcX9htrycE18Ph2VEbu15pqjo7oXL7IhzVJ2mmEbOQ4Yph2
         scpKdcEDtJ39h1Ac+7440DpUsv+7ZzEu8AopkgEPKqGh6tbwm5bZWdZ6S79RyEMX7VlX
         gKxazigYb80nLx9ihB3aOD/ECn/G5SzoAvdH9qINlkc2V2eJ8SFYI47I4joBGgMgt0jg
         P1zg==
X-Forwarded-Encrypted: i=1; AJvYcCW3DAO7mHlAtHvs7OaJET7I7hQHLP1Bwx3sJ4g+6QdyVJcizYskeun07hhl7d9UWoxVq1guOGClhrU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr4vHW+745/kB4Bu8CySVdbPQbTd3u2i7d/IClFR+Ry4oJXVkF
	uRxiAFr24dMDS9bkrc9LvvXoJPBtpmUlsmz6Ci3CKzBjZ7lN5gzgDqeL/e7gCkOMj8lD0uKLCbp
	9+613whSNfN7axdyAs0DiyGzktxtENh3Mc4+BF4E00bnOlk4atLJ08wUsJrFN5ZQ=
X-Gm-Gg: ATEYQzz9P1p0ddK4DErEF7spqVZ0GvOzMohInqTcXST+Cmm8Q9DNeSsjbkooNfxY/gG
	n9l6otgn2ZygAFZiuvQGQYXcHIXTHFzayq5VLvzY7Cw5qgk7G4Rgjm6W484d8q6prg/1Fxx15AL
	MNcHgxo4QxwkkJMvuLKZVLVngr7i7N4rIjofvnU9jvZcJX5K4NUr9OueNvpuBVg88fi1kF8TLdy
	5UyGFTKGMrEPGNJaPC478B3gPKmqkXwQX3i3C77tYMHcq8PlxYAZTOTY9W2bk1rpHgp6UZZcquw
	KLlXKKI0AH2jfseGieCFnSonOu1ORhIqZ02SX/nRBKOM9sBpsgqFJZ+Z3IENnSxNafITcEQMzZA
	kEKy9HsVKosKiJjXFbomkD9oz5fTWZHRJuuG9
X-Received: by 2002:a05:620a:1706:b0:8ca:2cf9:819d with SMTP id af79cd13be357-8cbc8d9a85amr2048340985a.26.1772543500781;
        Tue, 03 Mar 2026 05:11:40 -0800 (PST)
X-Received: by 2002:a05:620a:1706:b0:8ca:2cf9:819d with SMTP id af79cd13be357-8cbc8d9a85amr2048333885a.26.1772543500109;
        Tue, 03 Mar 2026 05:11:40 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485126563ebsm16384845e9.1.2026.03.03.05.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:11:38 -0800 (PST)
Date: Tue, 3 Mar 2026 15:11:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/3] ARM: dts: imx6: cleanup imx6/7 CCM related
 CHECK_DTBS warnings
Message-ID: <56f6t2u5peqndhfwxubvhcksusrgkxpqd5woz3i46gpl3q7vc2@5ykg5q6acn5a>
References: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
 <aaYKUC7pWjS1Xnpd@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaYKUC7pWjS1Xnpd@lizhi-Precision-Tower-5810>
X-Proofpoint-GUID: y4OLuu7Be17RyZCrZsyxECRAQIKKvoaw
X-Proofpoint-ORIG-GUID: y4OLuu7Be17RyZCrZsyxECRAQIKKvoaw
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a6de0d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=8AirrxEcAAAA:8 a=poxx6UPob8T2UUUd9QAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwNCBTYWx0ZWRfX79RtHD0vcRdm
 e1wpaEW5H332rPK7BgxRzEuV+yZi5dJd8h3wLHQ7h6BxIP5jQqpR19k2iqSAvp+QYXAUXkes2k3
 67pXGlRWvjKpaz6oQy2TzA3Bnim6aBHZPuh+MB6umCgLiA/otDqyCbOQI0otPmckw7NFLY85lVu
 JZkJvF+Vdr2dfa/ipQJ48ir6R1n3e+qCCjjRW0Foc82yp43XAaAuKOW37kSXEHWNZvJK9dY2sns
 N4HDHaUMhxVG3HPoEo940UM2tzaAfjyHQgtpcsmLhTb/yHJaVPVozufThnOgQp+J6T4s6AyUEkG
 60ATRKbCqVfbURaYqXcvArbY48Zot9Me73uYX1+0tOCUt9xEYqewOhlUyPc7cSM/FTJfl3gTxcr
 7/n7e1Sdas7htP48LVvXphCGeptQoyliiHvl5dxje89WtQjok1WdH2m300ryoPh/ZTBxPSeAe3t
 167llCE+fKxki5Ov+1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030104

On 26-03-02 17:08:16, Frank Li wrote:
> On Wed, Jan 21, 2026 at 01:04:14PM -0500, Frank Li wrote:
> > cleanup imx6/7 CCM related CHECK_DTBS warnings
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> 
> Abel Vesa:
> 
> 	Can you help pick binding part?  So I can start pick dts part.

Done.

Thanks.
