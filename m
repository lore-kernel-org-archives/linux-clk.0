Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C033229DB64
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766576541; cv=none; b=NKZzyPCxCjS9zaJeEL8Fxbmswp4P4XlzJ3O0dxOcOoQs4IwcpJmzBgBaqHB8dZ5sieghxKGCoDipsjnu9uxNX8EW5L8vbQt5VYN/z6Xrsq17QCFmyS4VbK4S6BzpCw8rTZ9EtjYSPaiIiPngV9GTo/dash9AV5DyDMY1AKhCNxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766576541; c=relaxed/simple;
	bh=7+3rMzvWcGTKos/3OJqmU9tz7kC9zKpFIYE0gqYo5Aw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lmBltEV2OTouDnUXxtweWPrMBq6QtGYjH5+6DrS8/y6tIspoyGZeOzGjDidxcAyL2a3XVFIVyRqDe9o10dZg1TP6w2FS0cIXhIJKxcrkt9/n3iPUlOjgjgL8tcTx4vYBGOVtLk2zvUs6hq9uacfR6zDAxnEWTSUhJ1rCzoHFkRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnxwkYs8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8RdVpiF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnxwkYs8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8RdVpiF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO2OmZk461418
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=U+gVmRUB2u2nv3Wc1zC5rKWwnuvVcDu6lhj
	OYLZCxUQ=; b=AnxwkYs8IAf1GZ3C3mD+SyC4el6zF2qhamgjZAEjfL/LSklYd1a
	MsHDYPmOQbWfBIEPNpdVYFYyg6Gh+y5XvVRWD5V2Jgs5NC4AiG6D4wT3XRY2n6d+
	EvGLxbTE3iCeh1KIsXL2z06GlsK9/+Y+DqzFmpp3CUXq1AM7kVl7TckjCOgpUfC9
	1AlOpj3Suyx5AnB2Z7e7kyU37c2/R+Mo/fhdFT684IJj+1ewWkQhVoFM1+SrujsF
	O29xXaLFpwXDIuPFBazIm9oCKg59ZWWW8WIMv6F1nQoj5PDrKQUtWY8E78SI/bRB
	dTGBpthUZZPMDe+Ra2+crNuvtHLYvAeCU1w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fu2we-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:42:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee09211413so146565081cf.2
        for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 03:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766576538; x=1767181338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U+gVmRUB2u2nv3Wc1zC5rKWwnuvVcDu6lhjOYLZCxUQ=;
        b=e8RdVpiFF5vAleSrNtEZIsMd7G0/D3SkfHC4qPIeeETsbS2+SAR9VSXBtORAK2TjSo
         nMeNVMug9bhqZKgRiG3qJ7ij9jL5WoctBSSJ0yA3yPW+7ctOP3UllQZkUasp6joOWn89
         DbKVjX/+WOHcoo4SyFftomyO26M6Ekql9QlJPef7GxqZ4x8dz5IG62OmjhQOOOR7hLpz
         7r4r96NXa4MOZk4E4zaYTgCND31S5XtEuWDrux4NTffmJQMd+U3REmX7NL6mK0sQ3xZA
         ObSmbjKrFBcRywALovja8rrFrgRYWWt2xX0eiPHvo57h8rZreIcG7uzDom4dC262JrE2
         as9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766576538; x=1767181338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+gVmRUB2u2nv3Wc1zC5rKWwnuvVcDu6lhjOYLZCxUQ=;
        b=WbcOmgjCc9MfhzDXuwYTZ2UoIOvJGTm4T6rxXwSCbhCOXZDlF7XCRD9tUHrl0YneKR
         FZsoOBK1LyPck+NXcXwl5ygrycxP5ysT2MVNP/obVywJbly1QwaQTJd+g0IpwW+uJQxw
         sIEViDzrqHIQV1ZsNvBYk+3HQV28KoT+cILI4loC67hjv2H+mAF0IYHpaq1+3Ixm60iQ
         nwZpSS6S8RRlis+wQP30VlhGQdpz72NqkbvYAlotrTDfA7bPtVvv4RHGOIrySOlNk7E6
         +5lT7sOrTTlqnlNA6u2MCQ3DrVWAkld69P+vtstXBKRliFJui4r+/pqgVDb6bILvECps
         czEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAgwfXvRo9C0xFKFHwGubM7Qn0/0QUsmtqoxtayIIgoDdF83MCmVuE1K0nLuq/hxGk6c+zlv0IOcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YybKVdRyYS4ERCO5OSWpRa0k6k2wOkJbcZk08v1JvflYDpmn75g
	ESLR+aP5C2iQBCkTzrRIKn+lXdJanKIRFJvn8xoVXuelEdf4BHCmNTdXQWUh4f3tYBf5z8WJW+E
	C2Tj4HlC6ZrlI0SomU5tUlFLi+9B4THmZqDIC+15shOADCh6cJ5BJwwasHCreBbk=
X-Gm-Gg: AY/fxX67NeXrbHcGo7DcDqYKiUAxGngFZEafzOmMBbU45Jsl6cvv/0x8sqqp7GBWTXa
	xA21w1bVVZGBY7M5orNZY/v3mURcZZMBgsCrtuQtAcNt5R5yIIrs3TUoUfMAdUSsD39ylcFnu7x
	cm8pPLfNYaNu2F1HCqQn5lpuM9Jw8DgER6wt5DyLemafuxcn5sX7+4FE9/eMLWU5IXati6T9nwh
	fWo95nAk/MSbtl62yXXFXETHA4+LjyMsF8OgxHxRnis6plFDaOFB5xyiiw2I0e5C7SM5vdaXX5J
	K+z2o/u+GgiTm27G0PkcH0ArHxRPDOHAiVg5hKmDObpibETbLfMRDMyXhMlNr49KfXsig5hufwe
	I5QeOOcIs3ArTnvX1MTrDnNxlFUw9UKWcPuSYs03WDePgghz75T9w0zJ0m5hp/TVl1dK/mQ==
X-Received: by 2002:a05:622a:6bc5:b0:4e8:b2df:fe1f with SMTP id d75a77b69052e-4f4b44aa828mr163735981cf.28.1766576537800;
        Wed, 24 Dec 2025 03:42:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYJQbZ7xIuM5JsrPsYTOyPB7yBvvFRWJ69uQCl8zSRJ/Ken0JqIo6Kls3ykdo83q8RZTzLsg==
X-Received: by 2002:a05:622a:6bc5:b0:4e8:b2df:fe1f with SMTP id d75a77b69052e-4f4b44aa828mr163735851cf.28.1766576537378;
        Wed, 24 Dec 2025 03:42:17 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9d8sm16468342a12.11.2025.12.24.03.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:42:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Michal Simek <michal.simek@amd.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] clk: zynqmp: divider: Fix zynqmp_clk_divider_determine_rate kerneldoc
Date: Wed, 24 Dec 2025 12:42:11 +0100
Message-ID: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7+3rMzvWcGTKos/3OJqmU9tz7kC9zKpFIYE0gqYo5Aw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS9GSuPMj/bofVABLhnOOl4JRJ2uqvbka0tUdQ
 YT2afTx+smJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvRkgAKCRDBN2bmhouD
 10CiD/4mSux1oeYItqR5RWzwadskR10HMs+EK6yD0EulBWZJMQjZjA7WhfWuzrS1QCaytFULuaG
 054YN38zVMSSUKKlOqflhqZGdPnD3afJHKgY5jB1NbIVmXJp62dcShVMzv85LUHpr8IKKDD87Kc
 ryy3wOMsOVjSU1GriuZX73kJnIwjL/oupXN86cHskl192vk74UIRwDV5Z6UeTiTnvj67SYklXzh
 cz6zmFOVvm03Sor18p5ckWB7OrxnaIuUwLfWB96NSqrtb5CzCWyQUftdRJeCFQYbgELUJrNJaiP
 KdZLuA92uiFXGMkwrFJLXxv4gcxJGUWNvDPnh7WDGgFC8SItfuD+6me7QdHT72szHc1D+alZRmA
 EvGoSOONtwVw4uCSf6umN2ZY2/1mWmZ+GcVt9G6gx5/X21vwVH8yPWqxadG8GGcd8uoQ3vdNoAc
 IQHgl09pMdZRScCLg0c9PuJzhXfHzc0XW7afOOCXIlzBUQtAQi2Y7XB+1C3m8Xy5gLNMwZwFRSH
 Vs7vHcJVOMNLkjOJGiJX4Jro6FXz7dEtFJGTqinWNa2wKLTaHDCwCH+gNsCXdZItUvUCueUHk4t
 xd3ZrJc7AIknh/SYjrFSqHCfVxrT5Nm8B2a0z3dRfvrM0AiTvo8AdnvUy3esG2a4rQhoeQFO5mn b/SKEfK+Is0NIIg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LJ7fwOtwz79NFGhyHOkqZhwpIQQ_TgjI
X-Proofpoint-ORIG-GUID: LJ7fwOtwz79NFGhyHOkqZhwpIQQ_TgjI
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694bd19a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_NWB5zRfvcGgyacOYGAA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwMSBTYWx0ZWRfXwP4Migxokutq
 GWd4W33Q5rG98O2Vd8jVnEldSLRP03sAwuqp/ZBhzZ4ywQVGs+Do/UGeZJqDFs1uzzy+Rb6q34w
 NPwCRFMcMRX6bL85XUp89eE99Ftwi0PSqE5/VzAGQWH0F1JE8GfbzOPBqLIQ8fz5TQKTU0oYmtx
 iFy7aWwfJkbfLB3E4jS0gahILiKm9S5P/YWsDv9pe3G2Had8kKMNGdkzUfWavUbnPPtqS89mmjC
 ED7WUDtgjqYlOuHKI2Onfq9hbuswantC/HxHSRyN4jGqTB5EgTVQ8AfAIR04NFXxZK3C48HdCZX
 X+HBCeBh7/zTtQyx2UsMF1e7Lf3buPaIoh14zjyoROH5aswvefRmaKoTDk5wJGe2vGnqFhplL16
 PA5Lu9w9StQuUDHgqNtbUUhkZHq0IieUgV/F6LAx6xAKzrddjW80CDug6MAAPh1VTx6BO653/zb
 MSbBDUygQBU7zMs0SbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240101

After renaming round_rate->determine, kerneldoc does not match anymore,
causing W=1 warnings:

  Warning: drivers/clk/zynqmp/divider.c:122 function parameter 'req' not described in 'zynqmp_clk_divider_determine_rate'
  Warning: drivers/clk/zynqmp/divider.c:122 expecting prototype for zynqmp_clk_divider_round_rate(). Prototype was for zynqmp_clk_divider_determine_rate() instead

Fixes: 0f9cf96a01fd ("clk: zynqmp: divider: convert from round_rate() to determine_rate()")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/zynqmp/divider.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
index c824eeacd8eb..5baa967aa7c9 100644
--- a/drivers/clk/zynqmp/divider.c
+++ b/drivers/clk/zynqmp/divider.c
@@ -111,10 +111,9 @@ static unsigned long zynqmp_clk_divider_recalc_rate(struct clk_hw *hw,
 }
 
 /**
- * zynqmp_clk_divider_round_rate() - Round rate of divider clock
+ * zynqmp_clk_divider_determine_rate() - Determine rate of divider clock
  * @hw:			handle between common and hardware-specific interfaces
- * @rate:		rate of clock to be set
- * @prate:		rate of parent clock
+ * @req:		rate of clock to be set
  *
  * Return: 0 on success else error+reason
  */
-- 
2.51.0

