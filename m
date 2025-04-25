Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A309248862
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 12:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583195; cv=none; b=D1uMSr6E0cE3FeEzXKr0sToelc2F6AiuDcz8wui6pI1dkS7bs4d6pkQCqHfT+ZxnSu+HfuaiqRMqrNi1yIqcverKC45veKXorIAEPGFfxAmwLTls9KuGIVj/H6+lXZkCMlINeI/GykrxTZ8TBoeGwRXVkrJ5mMEU3k1Gap4Ycxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583195; c=relaxed/simple;
	bh=5Sgz96HXWiPE521VgZZk6wufk7wy1Sa4KmD8mFjEnEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZCiRI+as673QRLGru0NZXB1/MfGttEQL5xI9VNgRBkOB0I6Wlbk44vrYOB1vikfL1eNlF2j7ltbc8aO/w5tDzxOA72rEGMkCg6vrVVTXOFjSLnIdTJ+ekacSZOQCYNWwAxLP/2kER6BC5qIy70rrq+4mMnSOz+dTzKolCS8bXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pBDWhVdw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pBDWhVdw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1efc4577so1232024f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 05:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745583190; x=1746187990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkenvBJAYSjNxPpsRyZb25skaBdyNzOYdvt1oK1G68U=;
        b=pBDWhVdwVLVcgqYCU09ddrTmOFlTcPKxUthqleICAMn2Oc98gay3r1kWT0tqMRxOBb
         e1v9txkoGLVnWzuZqTvHF9CUSiSafi4TJJ87aBn0j8sLwxx3eeHyRDAEyqLgpJ6B9Uw5
         e7y1O5Uw0/g903cXREhAxEsN+RVaOpOeUTA1qKM+Nc429ZpEvDr45140EastVxZycIDS
         cDIhFyuLXyouo9Dp/R93zpdHnN3vvx6zHKbGLvE+noOCLahuYTl7hl7Qs45NPJK7KlNZ
         EW4+4NofVThpiVASh0X32G+t/hk/nsEsixvRNJcoGA4x5cOIZ5H+RMBZNNi39u8Cp+jy
         ENPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583190; x=1746187990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkenvBJAYSjNxPpsRyZb25skaBdyNzOYdvt1oK1G68U=;
        b=nPj8CkuGQwt50/JKTrHiDlzov5vrlAeJlL3FD4XCRAblHBTLgPC4eUuTJ2eYAS8hCX
         6sRwnuOkqma1g6oB1hZw8DIKhTHZ+CIj5y0rHgok3LnDjpxVj89Des71zbd14PRJaMNK
         72qeWssqZLWE1JS3dWB1OWQ2xIbzJ6R5fT1/Sp7mwVVkvViRX6OO1evwxneEIpDuDndC
         bBZO9fdzshmFvPz5Ai8Te9VArM44jf+z2FtoUmnGxwSbAqwH1yqId6TNVStIvELHcNch
         INUQq1cZZ00bd9Wn80BpigBIzVxMYD3FCvAiARez2JtNbHapQOGEgdtxnjwOOqhLtXy9
         c+eg==
X-Forwarded-Encrypted: i=1; AJvYcCVjGKnfUZJ7iszLH9VFjScZizTfEAFYSe8bm3H6BqYF/KScylx4tg2FZExBW+oLhmvL6ZKtX57ZF6I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq19NOTzaxKkv3WGCRqzl+DnSvM7H9lMBk5/NPQvEjYQqzRAu2
	9RzbjsW5A7joLYPo5zq6VOXY1pAuYKicI5BpRgQC7VEPtnDVeToShRG5TcEjASI=
X-Gm-Gg: ASbGncuMczQny4hglbRsd5r2Yg4s15CsikV8LX6/+zEDV81E12HZe90R77itKVZavP3
	HlEDazzb/gLcJSbtEijVaJ0OZ+si6NgsoIrpZvuV1Bbvyo8TOoPZ10+I9IlPwmdi8mRZNJ2MJ5L
	EGGr8cDEZpmR3jYtjou8cJLKl8aF+w2f6AT504zQVulEW0ryN1rukiUHLWhUX6C4XaTwnu59LZF
	v9tHWrgcbs7fPgSuKDlAKOj1qn1lcNcMu6qFZnA17HUyX0UZ2yLiZgDAIDtSKSvYgrEv8p4tcVC
	OFaVEvDD78zTpgpADq2wRvLfI2IVIccyQMir3R16mBaI0E1w8BKNQZDE2KMrVXet1Bt5CxnR7FM
	iFl2EXktBBtauvJPYwyJfDe3jBGklnjhBpN/04OaRSE7k1nf25XvvUzc8MSmJDatigXk=
X-Google-Smtp-Source: AGHT+IE1MUEZ+wY7kq2dy7WUq8KFQHakKlZlBrL11IN8KwUQF/X9OnZvlk7i/MahfxdsbRyMwkcNsg==
X-Received: by 2002:a05:6000:1848:b0:39f:e37:1733 with SMTP id ffacd0b85a97d-3a074e10474mr1586199f8f.2.1745583189752;
        Fri, 25 Apr 2025 05:13:09 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46501sm2147310f8f.73.2025.04.25.05.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:13:09 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 14:12:56 +0200
Subject: [PATCH 2/4] clk: qcom: dispcc-sm6350: Add *_wait_val values for
 GDSCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-sm6350-gdsc-val-v1-2-1f252d9c5e4e@fairphone.com>
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Compared to the msm-4.19 driver the mainline GDSC driver always sets the
bits for en_rest, en_few & clk_dis, and if those values are not set
per-GDSC in the respective driver then the default value from the GDSC
driver is used. The downstream driver only conditionally sets
clk_dis_wait_val if qcom,clk-dis-wait-val is given in devicetree.

Correct this situation by explicitly setting those values. For all GDSCs
the reset value of those bits are used.

Fixes: 837519775f1d ("clk: qcom: Add display clock controller driver for SM6350")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/dispcc-sm6350.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
index e703ecf00e440473156f707498f23cde53fb7e22..b0bd163a449ccd2b27751e32eb17a982facf07d8 100644
--- a/drivers/clk/qcom/dispcc-sm6350.c
+++ b/drivers/clk/qcom/dispcc-sm6350.c
@@ -681,6 +681,9 @@ static struct clk_branch disp_cc_xo_clk = {
 
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x1004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "mdss_gdsc",
 	},

-- 
2.49.0

