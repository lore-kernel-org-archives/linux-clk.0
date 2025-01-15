Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79AD4F8A0;
	Wed, 15 Jan 2025 01:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736904404; cv=none; b=EX74QdACVrwvNPxQgJG4EHEY5aeqyuWKy0sKWDn1d47svyEl0tfPaPuuQsYsoVfAYw0Xchz0o9zQrm7YXI173RMVgmBClUbUHsplgimZOrw5eDnCfktILh+kaQnaEoQivpdH8JOvoyQ4Te2TKa8lcqImFZ4yVqZOHhqhuYpjDNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736904404; c=relaxed/simple;
	bh=Kt3285kcFQ7xUZscpN/vr7QN13NC5mXLe1j/veh3/ug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KwUu6j6USuTyamGrCrrkiGA8xDZA4j7va8nFZLpWuL65gqc/aT7TKMS+PJUus2e/QhfDhjV9WKCmPrSNZbO/HijpMiH8w9GyuxtF580s/Ia0jnpY90htK02lWICBCiI8fXtWme2G8WotOcgzJah8wLTKQJxaqXo3vex5BCf3rpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVNMR9pc; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVNMR9pc"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4678cce3d60so59701531cf.2;
        Tue, 14 Jan 2025 17:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736904401; x=1737509201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TW/78u/K4Tk/9Y6Jt2yXAKfWS6TVs/Gwl1yC2tUVx0I=;
        b=VVNMR9pcp2UoGARzLXfK6fdaUVCOWa8XkYHEIN0UkoO4iHx+9Q2o9Yv06yXzFi1c4q
         e2yYGzcpIifsm4bSjHNYRnkTE/AWcMeiHcYx3kBW/FHpQsirxnCGVlh5p2L063XB3klg
         UP81nF8n0sd3WTf9sP2X83eVDQvTFMKweH97rnD8e9gO9k0H4Bu2QQgSMVHwAnOYuND3
         AiUUtipu4E4KmwsnMwxTGeAEaPLSIYEZRUc7inK3ThaWRv8EahgXgbfr93jCP49ec/ZS
         Vkuj8doMdqYCBiNZhDux0IUGAct0By4CEVXbDc351LQ3VAeR4nmAF81n+UBSU2gIa8rQ
         kJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736904401; x=1737509201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TW/78u/K4Tk/9Y6Jt2yXAKfWS6TVs/Gwl1yC2tUVx0I=;
        b=j+fvHIRyZkKHVBLFxZtacGN/icbmjnDwS7BknJw3MieMQ4waojUHvzdrcZIgmwWDCx
         zxA38npuB36Fdrpm5A24fayUYriabgqQwYP6K+GjaKqfaYmAt3mTK0yf6MWjIjCxbMeC
         XPjV8om7dPLDIHVZCSQNwPb1v33DBUAEM1sa7qqY9T4nyw1BXyc2gPUrbb8EYys3wNIc
         ynpsC+gv9wcbqaguoQUw9NY4efli3PQtpql+cUsKRV7e8mLTubrCdpnZnAtbF2ICdO9M
         9vxsX9fpNEd5R01woXqcEd19Jh2Dea3ZHtyDAOArlEuX40wCahZAKF8DeNtrSodMwa2f
         aA5w==
X-Forwarded-Encrypted: i=1; AJvYcCVAsWSvVtgiq0b7F5fOcjb//9BnGn6UxJHklXPywnIU+S4i6xAq2gZuP2SB1bH4i07hdfmU9I0ayUdwIyHg@vger.kernel.org, AJvYcCXOb04FPGBowvGiUbYzYpz7qCpYJsmCG6ZQOQn/OWH/ykqibZIEByxNv6thKKfna3S7dLwlcyOZVXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIsGhqGddn7HcdnipT4ZyBUDUU0vHVEYwqlIEPNHcyRdLZmhXO
	xNVxhQwirhOAn5+i0dkjZLKwiX50THWoiSWtgFwaSs6QbNm95Z9a
X-Gm-Gg: ASbGnctMRF6TL6UaKDVBkc6oC65V4BjmZeie2TDKZapy2KNF+SsWoqEu9W1UzRw1G3b
	J36DMP/LxK4h9S5QC1CaWgLWQCwP2vvE9ZE9YJjValYcRA5Gdzb3Vfqrfjrn0zdz2aKFt9FgzPU
	h0kUs7yw4E1JFV1rYDfmqASNxi9J5JYa69jlUcYffL23fJZym9QcEOtpx14iCc2QIDmSlPvPska
	OO8vDFTOiLq6SEJWEEp+T508NyuJxDBMDYojkN37epfWIblbNLSJAPbburv19hJOE6w
X-Google-Smtp-Source: AGHT+IGzpUTf+PdyMGFAlYG5FILFZ7yZKz+uleYeo3HfOkexgjV2nVfuoZLKrOOmDZVssLq3Z0Vfhw==
X-Received: by 2002:ac8:5746:0:b0:467:50d0:8869 with SMTP id d75a77b69052e-46c71004b3amr471379241cf.18.1736904400689;
        Tue, 14 Jan 2025 17:26:40 -0800 (PST)
Received: from master-x64.sparksnet ([204.111.227.95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c8733130dsm59933881cf.25.2025.01.14.17.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 17:26:40 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: zyw@rock-chips.com,
	kever.yang@rock-chips.com,
	frank.wang@rock-chips.com,
	william.wu@rock-chips.com,
	wulf@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	Peter Geis <pgwipeout@gmail.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 1/6] clk: rockchip: fix wrong clk_ref_usb3otg parent for rk3328
Date: Wed, 15 Jan 2025 01:26:22 +0000
Message-Id: <20250115012628.1035928-2-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250115012628.1035928-1-pgwipeout@gmail.com>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the clk_ref_usb3otg parent to fix clock control for the usb3
controller on rk3328. Verified against the rk3328 trm, the rk3228h trm,
and the rk3328 usb3 phy clock map.

Fixes: fe3511ad8a1c ("clk: rockchip: add clock controller for rk3328")
Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---

 drivers/clk/rockchip/clk-rk3328.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index 3bb87b27b662..cf60fcf2fa5c 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -201,7 +201,7 @@ PNAME(mux_aclk_peri_pre_p)	= { "cpll_peri",
 				    "gpll_peri",
 				    "hdmiphy_peri" };
 PNAME(mux_ref_usb3otg_src_p)	= { "xin24m",
-				    "clk_usb3otg_ref" };
+				    "clk_ref_usb3otg_src" };
 PNAME(mux_xin24m_32k_p)		= { "xin24m",
 				    "clk_rtc32k" };
 PNAME(mux_mac2io_src_p)		= { "clk_mac2io_src",
-- 
2.39.5

