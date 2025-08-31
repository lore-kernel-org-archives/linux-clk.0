Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011BE190685;
	Sun, 31 Aug 2025 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756637815; cv=none; b=rXpXB9FWc8Q6y0CFu+efLw24RNFTgoB16qm7mxaW6fa3wWNeChyCVko7zKEJH3jBR6xHtOY0O7u2wJN1hA9D3Be4ijGhXRxYWAJfTdae+gzXW72pSh4QZhJRDR+AhkePiOpXyPTwZvRWn/uJG5q0kRsj2eeBMKabZhSp71lecws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756637815; c=relaxed/simple;
	bh=vBu5ydUyX3vxedtWF4klBlAnoiQSLj3LSRfLmLmipNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qmM8fzMjIHCXlmEupbUbFW1qYMOw8DHwxAFFT8UwAKobolgvptSWerkCNRAK/GSELy7ENKt/oZE2IdjpXprZ3vmA3qzQkpW0wwGQpiC867wuZXf8CEuGBxkEcCIXvZUaXS9frJ3qp4AFVma37jqCf1Q/tw7euyTgluhRlRRvY0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYiNr27N; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYiNr27N"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e1fc69f86so3391373b3a.0;
        Sun, 31 Aug 2025 03:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756637813; x=1757242613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCPbtPoRp/5E8iJgNfCMdf5lIBGqkv86uavAoCnp1cs=;
        b=dYiNr27Nw0ca6S9IArX0My+AVRoE0ulfIl8luXhn9Jl9i/y68u3p5b8mFJbgq83Hro
         IAt6mXCrXvb1CD5yxTk7fKJsixPd51NerXXfB2O03lLNfDT9J1Ggk3aWlwJE6KfcTSA5
         kMN+oyiTG0hMrS33w4ZVe9DH044kG6V2ppvWUIngy8IVl3nJkIt00PuMnLUc6aSgscoV
         CNQrrEgiSEJIROUBsRL9ElmDzDGN3FiKDHQdu1xN9P4QXi+6Nr02asJ45IfmcF2sWFku
         hwCWf0PdWGZJ/ZiCGTDvQMUR9hWO0EiNtr8vIomtfrRF5EcvfyE9BGgexwRUGIww/BOS
         PUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637813; x=1757242613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCPbtPoRp/5E8iJgNfCMdf5lIBGqkv86uavAoCnp1cs=;
        b=QHgl/gSsyPcdneeP+H1+J7YDEGVP96uWKQPpQSk90K31BBL5kd2ebQ1U/HrsM6l/Ik
         1xNeukdXllIHQnByU3MyD3aE9Jb4BE7rPgvGSLmaXUxxfcofmRWpnVXrzW1ck2aPLLCj
         cPeJ0Y75S/hnAa6aOHbvmE3PQpExAhHc6sxFpRh4WRGpG0OVh6jN9BU805KLslm8qbEm
         15wJYzJH7PlmiF2W0+iezzcdUqaH5fJ4pAdFwiISICGQTAZsjyz6yGrMjy3t5d4Pb8Un
         cqaiKqkgel33K9QMOJjZeUoO1PgWqLWtxqUL0KeC1dwzsqUWKbRVc/nRT5NcRjziqgyu
         O2tw==
X-Forwarded-Encrypted: i=1; AJvYcCVhnJh8qyXpCmqSAO3M9OFUNNYeUMDCO9K7QnswwT+lTixEdpnWfjd7uucFgl/sK6O7bqDuoYR1EcQt@vger.kernel.org, AJvYcCXDwRpO8e/2LSb1anveGR4fwExrjSkE9xO2JSPs/NOYO6no6wy4i8BY/9CKyr8TNW2HFVBmL+1/wXdd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0XqZ5aeeuXKFTyHq5KykXXkyX13fhdjAoRpTsqGcOk9BGA2Pj
	+520w0yMcWvSBnJNdxYJ4rzVtI92Q4Pj4MHUgv3ExKeTTWwrbQAjKQMi
X-Gm-Gg: ASbGnctPcTC3fCfrWDIzmPRoQrUhgmyj+RDAji1J7iGybJdOlVaESo3wmDXiDP6IQnJ
	HCKjyWJI+argp2Ik0N0BGUOKYeISRuQ12zcbQvE8fIJzL92yh9Lat1k3BHQ2zN8hF4G4S81ZsZR
	ILVvhAbzd+IEwF5OEArqfYHH+DOQ2hkG2ElztEQxoMCsHdJ/fCL0EC8h1YvtUc+E3qime6XMKkd
	1NXTDowj4z+d34SXMX0ngL5ed49zu4zjCKzrVrl3pyUfKqWKQT7rTu91V9R8jL5+mHo+oOakXro
	lgP1Y561DineR7tmc84/0guIb/YuU/lq4JFGPn7/xpiqAdTzoltHclF/VCsv4xOAiZzcKUkOR6R
	BjeNtudtxd472uV6EYq9y3PyGz0axkf8YjQ36YPsDdwLG+vHSXKx46s7ySRUB
X-Google-Smtp-Source: AGHT+IH4cx29ND4zxQRtl31kTvjj/dkWFXLu/WmUGScIWTE3nkmtp1OWtfffzdIAXBE0e0puWLezKg==
X-Received: by 2002:a05:6a20:7f95:b0:243:27d2:61cd with SMTP id adf61e73a8af0-243d6f7ef34mr5369334637.27.1756637813211;
        Sun, 31 Aug 2025 03:56:53 -0700 (PDT)
Received: from localhost.localdomain ([240e:478:1c78:352d:7cf7:15e8:f0c:9846])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3669d76sm6638260a12.49.2025.08.31.03.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:56:52 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 4/7] clk: rockchip: use clock ids for SCLK_MIPIDSI_24M on rk3368
Date: Sun, 31 Aug 2025 18:48:52 +0800
Message-ID: <20250831104855.45883-5-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250831104855.45883-1-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export the clocks via the newly added clock-ids.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 drivers/clk/rockchip/clk-rk3368.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
index 04391e4e2..95e6996ad 100644
--- a/drivers/clk/rockchip/clk-rk3368.c
+++ b/drivers/clk/rockchip/clk-rk3368.c
@@ -526,7 +526,7 @@ static struct rockchip_clk_branch rk3368_clk_branches[] __initdata = {
 	GATE(ACLK_PERI, "aclk_peri", "aclk_peri_src", CLK_IGNORE_UNUSED,
 			RK3368_CLKGATE_CON(3), 1, GFLAGS),
 
-	GATE(0, "sclk_mipidsi_24m", "xin24m", 0, RK3368_CLKGATE_CON(4), 14, GFLAGS),
+	GATE(SCLK_MIPIDSI_24M, "sclk_mipidsi_24m", "xin24m", 0, RK3368_CLKGATE_CON(4), 14, GFLAGS),
 
 	/*
 	 * Clock-Architecture Diagram 4
-- 
2.47.2

