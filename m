Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3C53EB81D
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 09:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996599; cv=none; b=pGJwN6KvQaM67Difn1SwzLLNV3e8d6F97huCyCRgZwOrEchltxP6oS+ph2HRT/3svEcclAs/7vReB9EGcaRfySwBzxUnkxZ4PezZSgICkyN4XFO4HcwxC6Ym2qG94dLbgvFwtYmNtPQMK2wifjRfOHMuWMjw4qmMygpOtxv5rMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996599; c=relaxed/simple;
	bh=isX958zSg2weCUOrt880uhtGmT7uXK/ufEmrKrSlE7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xa1WVNCgy0a1SpJqBTRPZqkh/mab/F4vB6SvJS6qqXUDYAdfdDqoo3PuQlPDDzGL7Di+GreB7aL0CUEC42BNubILuJNvV2QQ9OR9dJviGiKj5w7KKAUuQts5MOxuNGBXKtJgPR5D4W7Rdat7rkn+M/9mfmunex84czHC54ODHoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gsycXEnY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsVI+d2r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gsycXEnY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsVI+d2r"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rqLo2001556
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 09:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWNRlfBgWHU0YDJT3pveKgimyyr6c63+7FmfgNT8RX4=; b=gsycXEnY+gGlSHSG
	44GbfRCLFUTs8Ocv60TdGtX3LrCLh+W/978alP4D99a6prBr3mL6rPPyg2Bw6i9i
	z+vvAMkG14gJngkEHj4fo3Yn8868hIZz+FNeRic4WI2Wz3oLDOjcSdhx+sbjfyMs
	nq6MdWrZbolfNuJQHUyyLG5BmHYcB301th6HVeBwUCgxxhBcmoHfBnbcgJE8lqD9
	+xg306g+ZLnRqcKsQHTyZIXyZ7Ji1c16RncXanlCBO3M3KmGcGHBPEranIZQd+3I
	PELwtSoV0mfaL6x08GWhmNMvjtj2Tqx90T2/sz5jLC1B2/xraNOT3GdstAD253LU
	sBYh3A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25rhx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 09:16:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5176d949c58so136097341cf.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 02:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996595; x=1781601395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWNRlfBgWHU0YDJT3pveKgimyyr6c63+7FmfgNT8RX4=;
        b=BsVI+d2rez2C5KBB456ExnPiAko1s5RrWCLt56YYz+kW4eYnb/sM/20NpooSvkPA01
         HT3dzmaz0FJv4F29iBJeLZrBemSSa4DQBEGCP6CyZADjp+TMwp7SVTN9+O16N4ZbR0Lt
         C2P2E1rttvDBSuMccbqpNUZ0EADGqunJKno+EEV7KDu1Dhjxx0I2kEW64DBHl/bBSZUy
         1SXtcxQWUAZGNYeqNCzQBXn7jrfbGruYLg1+OgPYcl25SfKHzJJ5eUbYqx8wbfuvjBvS
         Vo8Ds2kYFnYpi78VYdGHD7lT8iMQBIXIeAN8Eww2aTaBixSGFRktNFOGjVdA6+8xwhM9
         Jy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996595; x=1781601395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OWNRlfBgWHU0YDJT3pveKgimyyr6c63+7FmfgNT8RX4=;
        b=SjnltsDZSU1Dmyo6dwTweURf1EGGiCknDtV9jZL1k9irN40k+ZEqM3EN/SjnDYip4H
         05zce+wkUNZJ3FAqZgspbun+jwcI0Vp7Ge1U/z2rmQxl3xtX/V+t/B+cfuHRu98GPj6t
         /A3leeHzLWxFM0ewskBKlp62czJoWGlhbbmPeQ78LWeNdn690YzVAJJCgDE4KZw7g3LM
         gU+1mIt3/W6/lQf2VgE1lDNqgNybmxY//P1G9gRCx/ahRD5hif7hc7/xB4A8mDPqwgGv
         dWfDzGTha1F7gxlaJe8hdkeo0TDnZfLc60xrTxI94zfZh5jWDywAu+JNZl0LzswZcptu
         zjsQ==
X-Gm-Message-State: AOJu0Yw+pyOEy2dBhyFLtfEowewMDXQZx6VWlhn4IfziKCAjKSrPmDI1
	E7QouXdNOUEXJu2SunfrKtYgthCo9Ow/t3/aYosip5PNxBKF/dTSkgSrJXJXJh5ZWUwFhpxhr2R
	CnPJ08vJeOsAnFsGwwq/9ZdSWyyJB4/m0tH6OerelDJCIbyJ9/m8H6um3w/hx0Zg=
X-Gm-Gg: Acq92OFg/BbfaIoosSCrNlRxN6jgrh1rUq+ThpB+60p5bkkNYdkk7bAhApB5SrCch4w
	zR8fU9/FJ5P4B4RSWu9I2cl6Tlf1pR+69ZFxy6mPwFiZX5D9LjSg1Pot7dL787D5ALXCRWMKarP
	kjlH+yOLzs4zPGxqjcViQpYuxALXd7FYtHjSGU4IdtT5rrsFte9d1YwEDbBYNK9u64lYyzT6RBC
	uIHlL6JKQuPBjdADw0UTgKUdVr9MaqTAynBT2EnPpun29HDmqi+hes8Bvx/lpWZ5b2bKMpZI6AO
	iion/NalpX5r8bW9mTIPXmMIFEagQT6oJe1BcSlhiXvq7jwG6Gnx5Du3qDOjZ2WF0vbCEAKtFoV
	ghRQOYGAof8znN7v5/irp0E2pRYYCPtOLaBG53+XG1Az/U/n0Q38MInw=
X-Received: by 2002:a05:622a:6096:b0:517:7217:6737 with SMTP id d75a77b69052e-51795afe9e0mr272600151cf.33.1780996595041;
        Tue, 09 Jun 2026 02:16:35 -0700 (PDT)
X-Received: by 2002:a05:622a:6096:b0:517:7217:6737 with SMTP id d75a77b69052e-51795afe9e0mr272599901cf.33.1780996594578;
        Tue, 09 Jun 2026 02:16:34 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm60912430f8f.9.2026.06.09.02.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:16:33 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] clk: imx: Add audio PLL debugfs for K-divider control
Date: Tue,  9 Jun 2026 12:16:18 +0300
Message-ID: <178099655221.2098924.12939836605538533758.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
References: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8XszZ4TbZKV5mBls1aa5Gj6YQ_xMGhgL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NSBTYWx0ZWRfXyCysrnoWZPFx
 e5HtwVqgEnBC249qbGpLLgyOLYSKIUscxK0KklN2BOqZU4DBzsuUvCDKrmUE6MLcV7L/2Y9S4Qj
 FMFLsYCxikKhiQPITAEmOKpdc6PlfTQptKUNWvBb0LgRPPEAai4oRLp20UhYDqGvl6ESZwi9NRv
 FX6EE6xKnrxmKGldYZ80Tt0wMUWi5ZXIsLzva5SNwB1EDH6yoirF4bJxPgLkaPS1eTOA1KVdU9M
 3HYFmUIJZHuCh0JpZzl3W2AQY6VWXm1M2CP9V0A0rKN7/fWJSeGosY6pY4dKWci3RmX5aoXIeJ4
 GTy1fkkxKtGp4K32eBqa1ibF/y1dpjqxobGRT1Ke399RfLYCnXpYDSn48XWVG5OvfbXSV9k4StX
 Th/eddacHAwWR6JfxrjT1cQZKQA5KwPUxVre6/l8wLK7pDBHkyF5wXOUMoIw0s6vGA0Tf9MRKEh
 i19Vbw2mzjdAJPha7ZA==
X-Proofpoint-GUID: 8XszZ4TbZKV5mBls1aa5Gj6YQ_xMGhgL
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27d9f3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1NP200KD9VQfxfjUtC4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090085


On Thu, 04 Jun 2026 21:48:01 +0800, Jacky Bai wrote:
> Add debugfs support for runtime tuning of the audio PLL K divider,
> which enables fine-grained frequency adjustments for audio PLL.
> This is used for:
>   - Audio clock calibration and testing
>   - Debugging audio synchronization issues
> 
> Two debug interfaces are exported to userspace:
>   - delta_k: It is used to adjust the K divider in PLL based on small
>     steps
>   - pll_parameter: It is used for get PLL's current M-divider,
>     P-divider, S-divider & K-divider setting in PLL register
> 
> [...]

Applied, thanks!

[1/1] clk: imx: Add audio PLL debugfs for K-divider control
      commit: b3dcc8c608fbb6352bd94932ba935f2078c9090d

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
