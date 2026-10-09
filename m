Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDF0493D26
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 08:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533512; cv=none; b=g/an1/vDv5iN5iYZ/FnLROF+QaW1aE+o+/dg90AQdn0JnY50Ae60CfAVZvv3KRSHzr16LO1scz/S7t64GL2tNlxDIv8uqgUqkgUsAwxlGq6Zuzh509Bm9+oemNC7Ms5nDNnuaCOlTN06IlRm5tDtVJDQgWwHmG5olmUfqF0CX7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533512; c=relaxed/simple;
	bh=gRbbps69VA7y6AulrLwCFY/nwePzdK2qYrbO3Y+LK9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P36JZ6uu6cUq8RWsqzLPE3iRiSdjiy71lHEzh7XkjP8tQM+ah2iOiUALHCDoB4Tw0n9royZxxA+8o4kPZ0TCh4NFHaQIToY+kRUA/QXx5RuldP1QIK7z5WbdhlzRexSnrpJBiC8Yzjpc5y6qNJ9GGW//93AC8A8UNgwqy0l4Nxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzcMbtO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWTyU4ps; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzcMbtO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWTyU4ps"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993Hhtt452240
	for <linux-clk@vger.kernel.org>; Fri, 9 Oct 2026 08:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	laHJsYnI/7xvkYGI4cOJBcsCLbJtIbGPxkDhu0frTK4=; b=fzcMbtO/4jaXDsL7
	gyiTrLMv+dryBtFCkSLJXLL6xRC3loCmHoBxikesbtcI2n59pEfjAbFFqVlys9cK
	wgzZbkBfOCDuOdR728Q0enWZ9JbdarRUaf/Y5t8zWkQ/1Ad+A2Kw6W73cf/sGLo+
	TH2ZrS7MF7HIwVJAirB8J48huJvqMPKmpX2IIIxaD6Iqfoxi4p1nQSfvtbm+Kb+X
	IEGXn9VvZ6c8KC4cvcFOER6dWWmzUmAHOX7uIaIsBDeu2F2vtH5KcogCsxd0iW4N
	8eJ/PG2jfE6q4ywIf0IenZsF0/s5ls/d09K0zripZ/U5DgTAYz12jurE/vDxZCiq
	aUgBvw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9kkrur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 08:11:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ae8e7e546so1238602085a.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 01:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791533505; x=1792138305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=laHJsYnI/7xvkYGI4cOJBcsCLbJtIbGPxkDhu0frTK4=;
        b=LWTyU4ps7R1nnh3W2ZLte7OPxr0Cn9kCJoGYhRJAsbJcr2Z+QbXNIdCATJVpPl9hCx
         cN5SCfK/JReW/5Ruw46AYztuTqKZisaSVDyomfgN02mQAm9pZDwqlJt4BjMMdJTpy9Cx
         Pmv8YtSrWyjoWUq190x4dUxmyaymhAtOFbChD1ZG2hxtV8pTq6VKK7YX7V7Ds8DOwv7G
         02H6AMnAqQyg5BeDf7iv3fQ0o3sdZXqAr8U/8iAJ5mdCdnRgwnDU5h2i59tX9/4Z4/ij
         NKrfN7nd6mEMTiAUlbzVB2a/gCEpvN06w+lMGaYy0+YBmOllfCHQMMY6mkvOggezpeek
         Nang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533505; x=1792138305;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=laHJsYnI/7xvkYGI4cOJBcsCLbJtIbGPxkDhu0frTK4=;
        b=Yu1JTrENjvNKQ3WuzfzXRKqMb7f7U5NWc/F0n8pT0Y+wX393opqDvaBFV4RNycUjra
         oMQRk9ht+V3H8ThYk6SmVO773BHvDCzgWDrh9Cq+ywqXDlJ4rwBxZo/mMyZ7SS8SlZcn
         Db9/gKiB3aK4VfMcA2HeHS9pxQj1xdFXc5s3/b12kOsuGjJLcLRxsXAaILlh/bn+LYpL
         4kMSq6M9uFUKTY7qmVb7aWqnCF/7ueLiAUCsN/YTdzzy3QvLWt9BFv68rwqkBqQjHyNe
         awD9gBr7sU4rU+/Gomvlfipla4x4sKoIva7tZX4RsrxiNg7K29uXaTrYccsSc391YJzU
         WWaw==
X-Forwarded-Encrypted: i=1; AKwUvBwdndPgxDk2JcYyVM7+PXvRpQwOpVOTvJupEGbmoC3A/AXlIRc9KIXCnHPxzTtw/styc4q1tTO5674=@vger.kernel.org
X-Gm-Message-State: AFuF++n7RjcCvu/0eAyiTuel9Impx/+uB1VmkRtKTdsfY42DVZUkSiJ6
	35hsDCfRFSVrXwmRlGOM4ULdtJCOucShBPiFEvwAhJL/yBRWxDq3+6KtAfyOnDIB/M3p2nUrzv/
	jHs5ei/00YznsjQTodKwZpfIOJ+W+rzPspGj9DA1M7KMPDHIN6dqSy87TJLJLTZG2EtPI9Yo=
X-Gm-Gg: AYBFou0HLHYNClpjBJ0uX0woHNOy1dYq9RGKtBJ/7xDyxKTPxnCtVm3+iafXG2fziHS
	9Q9l4a+MCNwysODGjlxu++Ct8T/9RQvkbD00kQfjLuKLbAf5GH47+/UjPCD557IwqoMxiPZBy9f
	oYRQOdnAZh3fXNh+vqae/owYRdp5GzwxQ3K7WR1Wxr51bCi07HNDJe5238xsXW7b5/3Ymq88V1+
	GJXFgEUWP7oDR3v9Fs0jGigMsDXcFIHy2N0I1fLdqYtJf+HbYB23/I1ZfcL6DT10iwa+yjemvVr
	Z+8kdKTIkpYEoWOyGIkJdDVoI70lm6suQgLrCb8s+w9ftJ0zLQBR4YqV4mVLRP2WxgWTAcW8+FQ
	q+Y3Tr/3xUXx6bfJ4BQIgPXXSFXw=
X-Received: by 2002:a05:620a:270d:b0:93e:976b:5c44 with SMTP id af79cd13be357-93ebd2960d8mr145640385a.65.1791533505199;
        Fri, 09 Oct 2026 01:11:45 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:93e:976b:5c44 with SMTP id af79cd13be357-93ebd2960d8mr145636485a.65.1791533504545;
        Fri, 09 Oct 2026 01:11:44 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm65404655e9.8.2026.10.09.01.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:11:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank.Li@nxp.com, Wentao Liang <vulab@iscas.ac.cn>
Cc: abelvesa@kernel.org, aisheng.dong@nxp.com, bmasney@redhat.com,
        festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        peng.fan@nxp.com, s.hauer@pengutronix.de, sboyd@kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] clk: imx: Fix clock reference leak in imx_get_clk_hw_by_name()
Date: Fri,  9 Oct 2026 11:11:34 +0300
Message-ID: <179153345647.1914323.1489876411002078599.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915055515.1730145-1-vulab@iscas.ac.cn>
References: <20260915055515.1730145-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NaM0UOTMsYw26gPU10al2COf0TbRcZcc
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac8a1c2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=DNK6b7R2SRMYshW6mIMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfXxcOssgTczoWJ
 q7ikdYCA1OnxHjQlXY75fASeGg/V3twa0DBKKK80tTYP2yhtQOBPAVaX7tlnWWibZvVLWpmEa+S
 o0Ldm8mWSuxdaN6nuj+iHiw3tgmdYw4=
X-Proofpoint-GUID: NaM0UOTMsYw26gPU10al2COf0TbRcZcc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX/ImgH431AIok
 5TnjOigbZYD5TiWFRF1gtYB1FVml3nJ4ffJmyzRLfx5fI8RSD9V0YIzvX6R5ZdGHOxc08xKQYxk
 FLT1JsfFMuBVqi424ufdtIlnCpGAAnfJ9UQPo/5SmBQ9Fs4IoApxSkExK3RhpZjfyy0NFHOuJ4O
 C3BMvngTlJmW3YEltwMKHvhBOIWM5IoGPrHZuwm2ZS3zE4HHhrL9kms+H1i3ioefHjhVaNWQnKW
 rlnHWaZgSD/r+E6KNz315J1aLpGyu8y8+sE4CiqIaqIqPMJnagXu9Ku477NyJC/PSC3yrDceV6S
 AMA5kgPD6HIhHivVMDOYSL/hdD76DFxauS+/ep2zGWCDizAcmz2TWJel7ekVewckQMPK36t3sm0
 kG2HBbFIliMgLqeEjuTREJpJat2vX1Mg1waS4FTDrsRqGJX7CXoNocPnIVlEEyZHtdF+rOgE/1B
 339CCVEQteHkyyvSK5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090032


On Tue, 15 Sep 2026 05:55:15 +0000, Wentao Liang wrote:
> imx_get_clk_hw_by_name() obtains a consumer clock with
> of_clk_get_by_name(), extracts the hardware pointer with __clk_get_hw()
> and returns it without ever calling clk_put(), leaking the consumer
> reference on both return paths.
> 
> Extract the hardware pointer first and drop the clock reference with
> clk_put() before returning.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: Fix clock reference leak in imx_get_clk_hw_by_name()
      commit: 8e177ca735761a1f03e1dedffd7ab00d6d0540ae

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
