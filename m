Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CC331D75C
	for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 15:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766415772; cv=none; b=lZhwIfpsyya2NjP+QWQiYNysz/68kVOPjlPF+0GP29aIOktlZOvbRS+q3D178uwroj1Z+qxm+KYbaMkCWTUJDcOtRY1IRe1QqK9vRhMbE3dVVG4TfSKb5z9h/ZwyqXYE7QzejtgRfJOd3I/wLEntX8X0ytgMuMtv7xeKT8B8SEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766415772; c=relaxed/simple;
	bh=CxGuO5ZJollzG9PI4yYPZSP9J4J8YSfENnyivvhULDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lF2x8ap68VM8tEcCKdmhv0qO25hdeBi7bUhnRwW2XAUmBrl6YPA0hDfkxH/BNq9kiMJ5i0QcnVwE3ikZDsfL7+ytwd5gE41zqXQbM+3r+vm0hD+lJyphbo+BZ49iGDVf4K/kGp+7g4zXAybNaC9PUWYWYGiKmErHLV5f1b48YWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T2X1amvS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dRjo5/IQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2X1amvS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dRjo5/IQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMED5e21896911
	for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 15:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MbRnW+taGLz61/GYCYEks4oaouDwWT4YbUU
	lXc+6T8c=; b=T2X1amvSu+XjVkhSyzmjwUlV7TBBmPvyMgahrGAIofFfT+kHSIM
	7S+aW5isUSblaXl44mYTvjv002YjITInVdLEvpTfU4irvY7dKkkwWmp2MMAgXXkA
	L+1w42j/nVAilwBBiZgF1C4XWuohsV9YA0bU8UmNMTrZtCQjY560AyqGyTtclRAb
	CA/sfmcGVPnLG6iNsoGwQKkBMcXFztGSIKWRCLUvD+4bVXYCG35I7hFiaGoR7cSc
	QeHgw7sHAi3O6ikPbrwpKjt/dxC+KiQPJEYiUkl7OgB0GbvHDUe1J0Ukh9kB8rPx
	jYWZ3wKH5UQJin5sM7ybqpVUybl+ic4OPtg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b74tagj7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 15:02:49 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-65747f4376bso6926540eaf.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 07:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766415768; x=1767020568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MbRnW+taGLz61/GYCYEks4oaouDwWT4YbUUlXc+6T8c=;
        b=dRjo5/IQ+U7T/kTwVfkJXHV3lSqc2ICbTRWxLTRe9szd0BDKmQMmyXC67DGL/jLPG0
         ALhxiiwmlTiD8LuyjyBxYFfSpoKtK2A5OMjgAepuuI/DES0wnoBWAbN9H+llIr3B9dEh
         zEA570fdPSAI/cQCpOFGJnaeftgdTUsoa32P4qndkG2RxNgnewejr6S3zHioxYi9yDOh
         rtKaqa4lKWAdGDk8PuV7i4g0/0m1fhQ4QTVPmAlCjDBB6nm5eu5dQLf64lsY6vRJoAkx
         vZXbSuThsLlOet0aA37vqAsN6zHDiKA4melNr3nPNbmzOD29sdN/CnVV0AigLsEbbYHv
         w8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766415768; x=1767020568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbRnW+taGLz61/GYCYEks4oaouDwWT4YbUUlXc+6T8c=;
        b=sygneSChTfREZfPva8f+jx6HZ1iOU8smuBNEiKZuZVLaKqfiDqm13b6GL6gTVolgpq
         kYG0xFcKX8COH4BJQplGE/sQ2N8VB0A0imAyIS7bNoOxgCwQlfqi6odsGoaHyxpP4dcH
         EnDPHn35xX5vSTMEJt+6W58BW2x6kBlFRTjhraGxpaQc81WeAf8xVtb9KwPYgXAT1vJ0
         wt0yPbxmPUW6gefJXSRewx2x+NHtto8C8Tj2amtbgjk6f7SwlRqne5TaNZrOvOXcNpJj
         YTlCVsXHhM7E9wgiXncG6A2piHQGGwYEQxQS+TPmsq4UAssAl9ZGEExry3lErJ5llwhp
         iaJw==
X-Gm-Message-State: AOJu0YxCuvwTBfM3Y++eoqpqnuXE06NnlHfHEVO3Svbh1mElmMOFYcWn
	b/JVXF7l2qGQGLinm8kpDmNKK+zStsKEVAqWFrRlq/v+lZczTIQ5Op8oIMV8rb2qlGzOiXMDK3Q
	7nNA8EUdd1BxEPMszXeez0F8wk7zB5tX7PqByK/Hf8y76NDOnO56XQSxmBP7Nc4Y=
X-Gm-Gg: AY/fxX7aDQZotJDkL4T5m2KaNKcquDo4YNQuQuA3VY01oGFat8KPeLBPNmzSvhfpuQg
	PrNf3hrEQy8VTQlVujlTBV8Ls3xFDaqF5t7dQdRUVr88NjOCLRmVJTsKKtLkT5IlnwC+xOqwmd4
	UWFgwsimnIsgwQjoBgieA9wLv2lrdfweXI3kX8RDVrHlOt6efaxAH6kpcd1/BKwV3xOlWhEeCYD
	uPlBWDfJN20Vu49Scb/IE+GUSZi20fR+6tkxcJZXll4tf7eyEx282QtN1xZySxWigkp14viWMbd
	1yOOvfydEmGomy4TL5fKqkONGSslEG4M8XfevsFXKr3ER0Ok1lZ1Rs9wr0J0rgQjYz8oajykpgw
	i485stVn1FdnsksBWOOGw+JMAvfUdmJfOr5zCFg==
X-Received: by 2002:a05:6820:6081:b0:659:9a49:8e92 with SMTP id 006d021491bc7-65d0ea65d9fmr3174892eaf.22.1766415768436;
        Mon, 22 Dec 2025 07:02:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7muTZlKDO/hZmrLDRprGb4Ds+B4A/MOrQVAeKXIBtOKKPHjm3aDXKYtsOVpcZygPExsVlzw==
X-Received: by 2002:a05:6820:6081:b0:659:9a49:8e92 with SMTP id 006d021491bc7-65d0ea65d9fmr3174849eaf.22.1766415767791;
        Mon, 22 Dec 2025 07:02:47 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:cf80:9c52:813b:afa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324e9ba877sm22160900f8f.0.2025.12.22.07.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:02:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] clk: mediatek: don't select clk-mt8192 for all ARM64 builds
Date: Mon, 22 Dec 2025 16:02:35 +0100
Message-ID: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DPiCIiNb c=1 sm=1 tr=0 ts=69495d99 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=aCVAxBrhNG69dy2j9FMA:9 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: Xw08AxaQ7JXUJpuqbPoGrT8EmfINExYD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEzNyBTYWx0ZWRfX71pYDCY19k9A
 voFztsuu8CizIqdLS5lZxwofZ71gP9oi4jiDFrjueoTnWDHNlWRobLLfLgDzGF+he9TVyF/KVSo
 AjHlRmfPcgadKy4z72dsTGs0XAF7gfH6UZWWgiw3rBHcaAOJ0BlNu8O9e4L9V8K9fB9/IP2sgin
 M/J0Zi26Fpf3U0FDCF4lRq0v4qakcZZdmnEc98lLZosgj9+pbtOYj/+H1MVHvMZ+863r+HcMfWf
 REQSRj31lO0qHSly0Euy4KhMc9lnb6nD4uDcI3N421p2nS4TKWnn9Awg9RQ+HOxTx38VSxUzjLR
 FPtz/2PtIoskBJWtYG6HvmvqpKQPGwL+bOKYpm+yC1EvtPwI73iheZDXMfCjJtPUeAKxHruROrH
 ISJd4SHpzaCsCBkwN2QkCys99b2pmuuV92yOQyj4X0shjxT+bFNBGemoWcgglbSKEzs5ZJzOktu
 NYj2fg/BwZRW3Juy+Jg==
X-Proofpoint-ORIG-GUID: Xw08AxaQ7JXUJpuqbPoGrT8EmfINExYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220137

This option defaults to y for ARCH64 meaning it's built even if we don't
want anything related to mediatek. Make the default condition stricter
and only build it if ARCH_MEDIATEK is selected.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/clk/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 0e8dd82aa84e..2c09fd729bab 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -820,7 +820,7 @@ config COMMON_CLK_MT8192
 	depends on ARM64 || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	select COMMON_CLK_MEDIATEK_FHCTL
-	default ARM64
+	default ARM64 && ARCH_MEDIATEK
 	help
 	  This driver supports MediaTek MT8192 basic clocks.
 
-- 
2.47.3

