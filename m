Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432105;
	b=v/THwvxw3wAeP8M/zRQoTpZUpRJ5NQqiZRb5yQqWEEl3foN4cbrgMFzg6QkDtXSn3eRR
	 qaUMhvTZ+++exBNP4SWxcVP0L9HaKbMWWzTvfrr0asQC1NCnSrf0skK4bYosacbozR6G4
	 LyV2U5URr/EcAsLk4UbNI7kzWVJKQ4I/CkqmXyVMvbrTUq3YGO+pBQS5NKAb6V3l9qLUk
	 AD3DsjxASzXKKQlMRiZjqO7VC3S9iPX/lP55U9jknIdac+FPIpjwFaLR/P+Jns2DTRuQQ
	 WqF4aStW6oG6IW8zxCb7AP3i5poTJm7lsftV2qpePGYY9BS/Mp9ci48HCrqLrAW1yDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=apdOIp+d8dMosghugd4A61IWkZa+bKaIlqx3d3jd6f4=;
	b=hFkQo20NFjgoAJD1xOEkSiqQptuTO7TIgV1kmJmn7WQ2um4GNbvMr8ALo3raG8L91c5X
	 UjU7+WYv3vKz7HWD4e31hl7oLQ2376hVsbTMVKRysF+xp40Jy1r1rGKN1Nit33WldOuul
	 l6G8aoXzhpO6sn+mKBkclqYAuB3z1pzFqVnkrAsZQF7LL8dJq6goFDyIpx+zonwBTUQTE
	 FejxMpk/QqmvDmDsc5mo+rL3nFyXj2llEF8znyxtp/np6/EuxH5IXViqqBkKVGoDAWGRY
	 7l5SMZPN9DdsSG6dVbbUYhiEetNtrzk5VoBuqXeJO0xHPvOwy2YL/7bHIRC3nc/VM2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwoqaWK4;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80372606A31E
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80372606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwoqaWK4
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso6853385eec.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 03:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432105; x=1796036905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=apdOIp+d8dMosghugd4A61IWkZa+bKaIlqx3d3jd6f4=;
        b=LwoqaWK45pNBukfs0hE3P8NcEWeez9hjX3QJpbuCkeFGZ3IRbS/bA9ob05/MNaPzF1
         /QWJCjhAdYFuw79LnEu3pC3MHACbTpz6SfAe9I6H6Zh0Rei8MSCiau0i7ZSfwrOLIwVi
         guBmrn8bKj3vJ0hAPEmQy1Olh0ayHDqLPb9z/w4jVbagtfpHnnazFx7chJnaeL3BK/wZ
         C8oF8qjWjHcBK7hid+eAD7FaUqsl3oUKhudGZgjUag2SB6mKGTeoZ3N2d1wxt8FUrIt3
         wrIKddjRTUt4e/zD17S9i9xmHSSFtp0lo3v2w92T1rJ9fXt7blLEIVGepbjOJgl8NqCv
         ZVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432105; x=1796036905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=apdOIp+d8dMosghugd4A61IWkZa+bKaIlqx3d3jd6f4=;
        b=VN8XZubqaAqllclh2ozno4tIFs8Gb/jrE9/UlhKn1vxPr/i+HwjiB+S0SkA6AhcUYH
         SA1fpbLhFCvn6RQkoOGFg4r32nUs29/W00e65vYGHW8qk+47cKWG6WTV7KpYH/WxqzOw
         OYzAnpUZDiD74riNVtYwOoE+hBH79yqQTqyvZpup88I4pz/G3vUprEhZlrapZXoI8QPh
         9JcpOwm7RIJcUqwa1uq0SBoDneYSHX+OmXMZ+qkQ+8mOVpy+/FBz7Qdl4Kt30ZGbk22k
         rwn9h9jCJiNLU7OPTs/7gXKK5ROTzfItepi+gyRn7YG+hidHTTqyL0YqFTRlDPPAp+SG
         qvOA==
X-Forwarded-Encrypted: i=1; AL+hErG7PKBTynEgl+Zw8R9ZR+fOQi6CTg3ny5kY+aCzkvi3NTPoKKL14Bze21OtFVcDbJwclLt0CE5kElQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mFxH4MmCXEan8MwCHYiNR6+RmY7sKbYiwG4EK1UuhLb9UeurE
	lLxXxgGUW4A3H0nYpLchh9LNwJpW8Ro7gb3SxFWVnuZvxDVrllaouCHA
X-Gm-Gg: AZFdTZeRtsx2+QzY4sw4jmpkcIZWshjFDztDlb3VB1w9KxuRmIwm2uIlCnU9ZYnMAdm
	gG79zwb9uhUewmjZD69Oul74dyVttGRF9j/qxMVCBwV5FC8Dlx/Wfk4ZOJb7Sxnq29x9/gKi9vS
	P/ZAKr9M0/rfPXFsgByknGvwbptZ4jMmGGUFAL7WNnKxxtSSSAdEZABtv5pm39zkw2EpgZAxg8n
	CkhtLhLLXAdGoGZ+j6JZ9/Ooo+LBLxmVaOa+y2a3VuiDFbxZOyneXxpS+E+xWIPrttPw4732+Tl
	RGWKRTzICOy0GuctzwfZo5T7cOfIWuhHnbY42/j4vo8oaINReGfzBRrcLZhfXbImpqlMgvFdxB4
	9GiUPR/KNEiLMVX7wBOu/WBFInbVPXfa4gIi7tLnGv2SKphKZBxPpsE2IKw/nV0AugZBFCCbqbj
	pdRt0oBZTPLH1aXAcyKcutKfEdijdce3lF/BYzSQp9KX6tZawyAAPKhB8A6KqkooX+iNpASO3dE
	GVd4P/arcv0C1WjAfuZTTjP97IJxBpCi49xCYczXXNENdeGgRgGAi19gky4eHjyB/I/1FdlkVBC
	nF9n+/FnzNOYlh+xdFGc7LW8Cn3RfSQW7Cisiu672p2Wag==
X-Received: by 2002:a05:7022:1103:b0:1b3:b3de:9232 with SMTP id a92af1059eb24-1b5568a15aamr10021894c88.9.1795432104625;
        Mon, 23 Nov 2026 03:08:24 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:24 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/6] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Mon, 23 Nov 2026 18:08:00 +0700
Message-ID: <20261123110805.119610-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with
a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on
MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Switch the 100 MHz parent to P_GPLL0 with a divider of 8 (800 MHz / 8 =
100 MHz), matching the 200 MHz and 266.67 MHz entries.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index c4ec9950ab68..3987cab327b4 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
 };
 
 static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
-	F(100000000, P_GPLL0_DIV2, 4, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
 	F(200000000, P_GPLL0, 4, 0, 0),
 	F(266670000, P_GPLL0, 3, 0, 0),
 	{ }
-- 
2.47.3

