Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699970;
	b=v1K3lgmSumXdRS0ZIFwFEGdAaocWF1wkwcPHujM65BfSe6fzMWKPmaWyc1CvyuSiMU+5
	 d4He0iz+5zfaYBQXLaotRLTzH7beZAOGmWb/Qb5Eq3Txowg//0oaFeNvHL83Re2q0XAsq
	 I4oGjT9z7aSoNP2Ea7P/ED/belQ6ru3Gjv+8ZBuHsj+Mddm3hNfUp7tAtEVwBBcdjGW38
	 u0ToPezp9RStdFfEMkcgbOGoBkLuuG5Yu3eVuy4QyvVv4d6eiTS9A71UQgaJdeaqx3hJS
	 rASqqWcle1vBfNT8x9mT6UaED7Hf1YkOxR1rZaMe7rlrMkdJw1ReLYL2cvE7HB4xuWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
	b=Ro4NumpZ2Wr4eIKceAOU7qVBTzRmFdtCncrwr+kxOQTL5bymeOq6PGGsB+yBehqaNC4g
	 0g8mzsT6cWjr7tWfh7vTuck34BcqnuL8m/ISSTH9ZbwIqS+vcLHlIOwQtNWUi0LsGTGAe
	 zqM6kqOFKnJEs+9G/WpRIrFYfdG84+C589hJk6T/TX8LXV7D9s8imv1XRSVTJV1+R4LVs
	 Y6knw+GaHtVjEgArpO8Cyvb/iCiHUXKed0yarJZL+MwKoXSseG+jdVnvgYX9kOKh1ErOv
	 oFXkrpcwuNSLx1eknWNWknZssZOIMMMFDFaP+E3ajcB8C5tm7mlFDt8DzG2PQJ6nFIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nU+PpEIz;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A66606A31E
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 20:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28A66606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nU+PpEIz
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4649b35bso169013f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 13:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792699967; x=1793304767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
        b=nU+PpEIzZ8H5nbRuZhv/xDYqovUJf34S5LYnHZc45VibBRJJt0lzPa402KDRwRFLKs
         B06xC07RqRkOdfOAfvGVBq2sxER8WJ1/M1IPqSpN129Al63Y9PhitOQGbp3/XNSWGl42
         CBvD9ZdS20XEjXFTYUK17IgAU0itW4kkmuloroRzysDLcAS/lVSMty3E51g/Ljz4Qr3O
         81ehtvBlRXdZo/RphgN/jjyeNumUQbbEOQBzIrmJb4c9VuD9o64WcyrinPCBmDpewh9t
         wU5ppO3brxNlCV+ehqOHz8xLfpDFjoO3fuLhTBoC0vNk+i5rVbqfP5bZ38rzxDadfXDu
         BNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699967; x=1793304767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
        b=xsL4CLvrS9Q0w85ArOcItkthhGKwxYFzlieTA0zhS0XlS2PcGrQ9mjs/t7X0JNhpuQ
         efZApHFW+eVqPw3u/+/wrLbgMdp4VVQljl58TotjzeoGhYwwrvGWSi9GEgirhd8fLyMH
         4Hyq1yxmxbBTCm+HMGybutGOpp6ozQcNY9AWW4YeFG8gGlaIp5ytoUcQffpcrqPwqnzq
         6jWaSWuX98ilYxEU/ZP7ha21O7+ap0VpfL5mCh3G1n4XEGrmF3Er9x9X/Zot+Vq2BC6F
         4teU5La7kp9HtnYhSzrHz/lrV8piBPSvUC5MRnI6nQWRcuUvUhyC8qfbqK+3G+jn0sCS
         CgRg==
X-Forwarded-Encrypted: i=1; AKwUvBwllDmoLJm1v79vFulniNZRPJwaJsUV61D/TYCFTUU9xAEu54C/eJIfef3xl9TeeHiDT2zWIpU6L9U=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0En86/idQ7b0OsGxv5xGN3fiD0PhDRlujeyVh8QEqNgmmmRv2
	Y+3j+0mbLoNNVvQ4DPUu8ZylGLR8YCY/tvCiLhK/nHdv/Ix+r+uVuylmRpw6vNnS1sqkg8+Thpf
	zVjMS
X-Gm-Gg: AYBFou3MVDlcVvD0iT6uDCZ2fQfn/7+e3uXbNG5/KPmAJdbPotCmB/HCfG31JU4Y7ZI
	WeCKrSb1CG7RRdEBdsrJh714Oteql3E0tUj3uUDsYuBlHMsSLVAlzCKL758YUOqHCLKEv7v6W40
	U2c5TrkdGb312oycV69etUHEkv7xv4q6Qkvm1fwOfsdnzRB/kdOFoWoxouW7c6XPHvbZwe80Vox
	vgyjF8FV1KMPcj62jHd79XRH9XZSal5hm8h6JmHxXrXDv/bQwXmoSqG0sp0LA9jjCNXdp9F8Fds
	jRiHhTQZqAK7iWDecVXhYYEa2qm8AHtO+7gHyKgU3QcPwN+NhQ2D6kfGMlpreOTgoSzUX+89Zoj
	prHFVTmfmNCIM2KIMLgMgVSf7NgyKTSA936y64w8+WLOlWvq9ApcV0eQ1xXOqqddVC6HMTO1oas
	T1T0BENOuPFMGM04prkxE6qi0q6CU79tj6TdJ5ZxTyWpe1Yqv7sGHt5B4DBtbw03BdjotkwlWSg
	DopS1I5AOWKXStsJ4GwqtBwg4VOS+sUxrObS7e0GkihXkTgKZju7SPGv/QEVijkRJzh1/rMalVr
	w+tqAkrJgRM/kliafbYq9ar+Tn11gVLWDIJ9K8WlyL3QO7d7MsEkNS8le3LSzhs=
X-Received: by 2002:a05:6000:230e:b0:48b:f08:8159 with SMTP id ffacd0b85a97d-48e2649fb43mr12340934f8f.40.1792699967520;
        Thu, 22 Oct 2026 13:12:47 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380575d9sm224286f8f.44.2026.10.22.13.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:46 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 22:10:32 +0200
Subject: [PATCH 1/3] clk: meson: gxbb: fix ENCP clock selection
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-upstream-clk-encp-sel-shift-v1-1-f1b1e10a3d84@baylibre.com>
References: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
In-Reply-To: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The ENCP clock uses ENCT's settings by mistake. Change the selector
from bits [23:20] to [27:24].

See the S905X datasheet revision 0.2, page 70.

Fixes: a8080f247bcd ("clk: meson-gxbb: Add video clocks")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 7a7b104182ff..b483164955b9 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -2370,7 +2370,7 @@ static struct clk_regmap gxbb_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = gxbb_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0

