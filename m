Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522B41FECA1
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 00:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756427929; cv=none; b=uP8vACwUtQCY8fiZylaF+sYdo29fk1U0lp7hFM0M1h6A86dQCamTh74381shIGfmev+RAi+ci8/3WQePEDODF0q3CSef1MaikYUFt/PgPNptK+aRxq9Arg4EXWTD4amnyTUiE6NQn2BkvTdfo4Dt08IdUDtLfQGUXT8kzXx+ApQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756427929; c=relaxed/simple;
	bh=lRErUXfhlVyOjMePggfg3EacyZAvSvm+w3vZGvHjG+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i1sonFrZlKIzJAOLKXfKIIt3KaLt4DwSTWfYL1arjwMZkcTV3bFsHXfjFwwxzrZ2U7QLt2VWxyMSOBCIGwTlMhWxdWGX04nZMssWcZKz7kfHVF+k9HJA4fPeqBh3Ax5IAmbZWenXnMPsY0olKmnWR35Hycv6rCNf+lCCwEjuWl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MeGgwKpQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MeGgwKpQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQVjNKRtGeYd79k9EsHTPhO8iq2mtofexnH8gr3Lua8=;
	b=MeGgwKpQP21PZsdWaN6D4jpcm6dfE5nqwlb54zjGvXv4A9udiMP8hgnZVjYdy/fyHV9ScV
	ixetOv8JQ5HC7jVyFen9wO2Zrwq22Hb49sGRm/MT+uFc8MtehsmMKCkRk0pd7Ld58AnHrM
	fquESkcqppgE1kmjvZqxrbZ06SmG3mY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-OtitcIFsMAO-mqgH4Zt_dw-1; Thu, 28 Aug 2025 20:38:45 -0400
X-MC-Unique: OtitcIFsMAO-mqgH4Zt_dw-1
X-Mimecast-MFC-AGG-ID: OtitcIFsMAO-mqgH4Zt_dw_1756427925
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70de47323ddso44672346d6.3
        for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 17:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427925; x=1757032725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQVjNKRtGeYd79k9EsHTPhO8iq2mtofexnH8gr3Lua8=;
        b=ICgt2YyN8yJ/zTQAGd2EuIiBFGghHyK1XPDKvbrZxTHTZG5FQx17pw+7YKl1PW0V9h
         H+dlC+LrIrcBuYDNii289jNif2xPy1XVkz0gzbGrnOuj0VINcCeb0AcyPdvCIfso2rZ8
         coZIW5S/Lud0F86LYEBtUsbLDPqjkpekWkPAs3nCCzihCplZnA3VT/vpbb14yItqYl4W
         HwF2DkYqi4BGO2kCkJjOaq0AMjPrvedDsZOCMupMEaT4UpKt1zWLvu4oYpjYnJv//OZX
         DY48/QU7xuMS9o13DLaYnc8wdq1w2v4aU57eq23eXMniFhlvcrqkXqiBUKrUYIaAK/k4
         KVgA==
X-Gm-Message-State: AOJu0Yw/Thvn30d0o0QGyrLWSVMBZX+EdK7+lN5yrRRNRU1tDvu+lPlh
	9aTJdz32ncdP2cQPFSJnfqohnE3/enI/Fo7Ik5DJb1u2X67k3OxLC9ffpfDqaoBLpSB257mxi2d
	iEr1/K3mmbnZduDOEzzehSHfmBSWRoBkzvYL0HfLgSmYJjy2RR42jssJWzZqJGQ==
X-Gm-Gg: ASbGncujSnGhLuvN0lqcdRdM02t1dCKrQ08vuVvbVByf4jt29st0HaqhC+3U0EREs79
	b8CLBmucHNNVW5vo5h8713UoKMeIjgb9XpwqlWqgQ+1ExkVMvaFmM0DkUkWAW0ckN4DhA4/8/4G
	ybwdi2e3dKxlDIBkspZoBe9/src4I8v2yhVBv4X/sa5qY2eIwgqIS1zINRxx9L8bdJnDEIfUhx9
	L2IphqJDdpdweRbnLVyovmyZUw2M2NMPwClWpQcgH3PSL1b3AHuOn/kGXgJwk1mup1zMNwe6GVE
	EvGp8VfpyePlxFT7S5vGXvQhmMJeDdYD/MG6tYzDWWi7+PhzNVPENLVNzt44eZylZj2tGBFGPjd
	HG4S9bOorduAke7N8/DhejbKVzTYswXOgzA==
X-Received: by 2002:a05:6214:cae:b0:70e:782e:b23b with SMTP id 6a1803df08f44-70e782f22bamr10926626d6.3.1756427924883;
        Thu, 28 Aug 2025 17:38:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR8adeLmPp6i8NPj//2LYlvbZ2JGvJAUD70v2I2NLKTSUE6nmwskQ+vGH0x5SgjqCGSE+qBQ==
X-Received: by 2002:a05:6214:cae:b0:70e:782e:b23b with SMTP id 6a1803df08f44-70e782f22bamr10926366d6.3.1756427924487;
        Thu, 28 Aug 2025 17:38:44 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:43 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 Aug 2025 20:38:22 -0400
Subject: [PATCH 3/8] clk: rockchip: half-divider: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-clk-round-rate-v2-v1-3-b97ec8ba6cc4@redhat.com>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=1835;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=lRErUXfhlVyOjMePggfg3EacyZAvSvm+w3vZGvHjG+s=;
 b=77L/EGAGdRYd5Zfk7wMZPiUoUyEJ+wFGI5TKO4e9gl+bXy3dLwkQMeaRO1HRElJrc9TAOKFe/
 f1vZeXk72u/BkLnWKmAly+0tQG9J1VwJ/BPTEXNwrw7PqrQdgLjH3+M
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/rockchip/clk-half-divider.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/rockchip/clk-half-divider.c b/drivers/clk/rockchip/clk-half-divider.c
index 64f7faad2148f27099d1ace36da45207e2315a1c..fbc018e8afa44c87a5a7b53475fc98b318ce1ec8 100644
--- a/drivers/clk/rockchip/clk-half-divider.c
+++ b/drivers/clk/rockchip/clk-half-divider.c
@@ -92,17 +92,19 @@ static int clk_half_divider_bestdiv(struct clk_hw *hw, unsigned long rate,
 	return bestdiv;
 }
 
-static long clk_half_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *prate)
+static int clk_half_divider_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct clk_divider *divider = to_clk_divider(hw);
 	int div;
 
-	div = clk_half_divider_bestdiv(hw, rate, prate,
+	div = clk_half_divider_bestdiv(hw, req->rate, &req->best_parent_rate,
 				       divider->width,
 				       divider->flags);
 
-	return DIV_ROUND_UP_ULL(((u64)*prate * 2), div * 2 + 3);
+	req->rate = DIV_ROUND_UP_ULL(((u64)req->best_parent_rate * 2), div * 2 + 3);
+
+	return 0;
 }
 
 static int clk_half_divider_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -141,7 +143,7 @@ static int clk_half_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_half_divider_ops = {
 	.recalc_rate = clk_half_divider_recalc_rate,
-	.round_rate = clk_half_divider_round_rate,
+	.determine_rate = clk_half_divider_determine_rate,
 	.set_rate = clk_half_divider_set_rate,
 };
 

-- 
2.50.1

