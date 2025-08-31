Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A86190685;
	Sun, 31 Aug 2025 10:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756637801; cv=none; b=qoIIDHMZ5oDQNyYcxGVNvwNVH6UJrpviPHXwAn++Z2vrDkHZMs+m8RfSwrHAWoIhrtS7hkx6FRLGhHOWCi9XnVzmlkHg2d6TFb9fIf9G28FtUPFeATjP925VC9J0BDRYeCMZh5e5Pde4E5oew/aQVWoK9dTsytxLlkr9qHyMUNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756637801; c=relaxed/simple;
	bh=zz4f/ROlr6BiUCiGoR+CkV90Tjld2m5PjHC9rJ4qlfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R95EWP9OyMElVCinVmQwnw5gmNpAsOTAyAmSWniWLh+ckxG6+57jHBgB2Wc+CRybVjjd3zZ7rQfqgjI/PCrxoYQFlF/bUEU+ikIazWSGawNO1nY8ScGewtH3360W1pvpRghsL//JlcNXyEYSQQN3Hy5/ofaPjJDwIgEPNDW9maQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkYmvlUX; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkYmvlUX"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-248ff5cabe0so15927045ad.0;
        Sun, 31 Aug 2025 03:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756637799; x=1757242599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqcV21+igz41P6HIZwf6dMMWAMpgmjOc14zoq/ll8jg=;
        b=BkYmvlUXaHiOkqf2DA5GkyI3SOzGU2MKJVM8LmABmLgTAk5yKtm3cpMn+EVUi9S3HX
         A3inbQZHiZXGLJe9JRXQfxQugJY2um9kuppjOt2t6GrHHzovw1SsVkR7ZLxtYCLDDKt0
         4rYmeG7bA5D3FyNNLPkODaw+qekNhGWqZUecKLxBeUE5H1DN6DWz017I7swDmhUy0HrA
         Qfay2WSNZ/gqairatF7Uzx7/RYMomttmT8yHjr3hEQyKrBuMImQPBVwBdzzzzxz8sl52
         8lVBh1zdb+iH7s+pseYcmsAkQwQbcQArbC4tEAMLXs5//0MCjQI4sFqKx5IccdMImFCG
         hnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637799; x=1757242599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqcV21+igz41P6HIZwf6dMMWAMpgmjOc14zoq/ll8jg=;
        b=Wzdx66n6ymPGiQ4b2WqOIkXVOWMiwC5qWcQ2OI1LAOwxVho/TzptS9sO1FP5GS3NFF
         Q1z7CxAoDsuOmJw3e9ZR7BUpc2zsLAVGXZKjQdq++h0UEOorGUkZ/G1Fei+H+oYgLYCJ
         h5jCzUWbYAi4H2MNAsaDJ8OFPnCEnYSAzHILpCQuXAGiKWKJoz7tmWkwMj4GHr2AEDlm
         1eJlw6jCqTOQvOmlU2Yk2Y2aZg+AILs1Av7pyZ2eSO1QZ5V+SMEWbCleHLkAn1mwBi06
         GDpIup+iQWx1r/BRtMGgICXcWKG61BMCZA8vjPvAtzakkhDyE12TNNN8KDGkT/T2/BE7
         Khwg==
X-Forwarded-Encrypted: i=1; AJvYcCVsL+2vLW2LK0D5+Mgvx6Smciij8w/bydjFnIhgS6/ddwTUUaZXYfiPENZHxV21jJyczIySlCEkO4ci@vger.kernel.org, AJvYcCW8vHedBGOYgFSXv96PAHABoIc/yBCVG7J1RjXbMRxOTTpE0rXsjjkMtcRSWQNYu0IIixP4iW3p6wFi@vger.kernel.org
X-Gm-Message-State: AOJu0YzMPEtMIFbNb8pCAmKpCZadcJcUvvIQqOAnShVUMVuWf2lnLtux
	m/JCfwIhZwPAHonJTV62DXlYHGg33Bmxzn+Ye8P4IZOwyQbIOEK/XaJ5
X-Gm-Gg: ASbGncspgABDEkpvJgVl/CR7ttyoGLy/LXX/ybOBxrKxbOcWyBmXbpkT648a30vE93e
	VXyHbO63ZucMa2OoskZ31oRRG3t8x47jmJ49MSSTjNwL+H93SuDjeJ92qv+fNqlt+SUKptWLECd
	oxcNt278u6EJMlQ7qdNfkNcDj45fUN0OUfPAn/1i4k3T12UABQKEWsd3/z3312xrBEwVnFE7J97
	G8ZE+YCiAsQf6rDl0AAf9t8wEsOoncK5BbaVY026q9KsovjVPP7FlAewLNfhqvRgGnGXFeNF744
	0cJ0No/AbCdzQB8QuNHHSXNAaTUmnmHDC67y/WgShBSVyxeRekmM0cD6aROTFzHelvfxBj3kV5y
	WrKt7W1PlxdcNaG+ct3wh0kO88W8j9XTyLffRIsyIBUxGc3OPWg==
X-Google-Smtp-Source: AGHT+IFFKuNZ2nRKgu4uZBy6VGYddufFjhDSnyU9JLi9zhCQ9lrm9bJvNJ8KW/8SG2HY6adk13F62w==
X-Received: by 2002:a17:902:f78f:b0:249:1156:31f9 with SMTP id d9443c01a7336-249448e52c0mr57217875ad.21.1756637798805;
        Sun, 31 Aug 2025 03:56:38 -0700 (PDT)
Received: from localhost.localdomain ([240e:478:1c78:352d:7cf7:15e8:f0c:9846])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3669d76sm6638260a12.49.2025.08.31.03.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:56:38 -0700 (PDT)
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
Subject: [PATCH v1 2/7] drm/rockchip: vop: add lut_size for RK3368 vop_data
Date: Sun, 31 Aug 2025 18:48:50 +0800
Message-ID: <20250831104855.45883-3-cn.liweihao@gmail.com>
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

VOP driver need a correct lut_size to work normally.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index d1f788763..219f8c2fa 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -880,6 +880,7 @@ static const struct vop_data rk3368_vop = {
 	.win = rk3368_vop_win_data,
 	.win_size = ARRAY_SIZE(rk3368_vop_win_data),
 	.max_output = { 4096, 2160 },
+	.lut_size = 1024,
 };
 
 static const struct vop_intr rk3366_vop_intr = {
-- 
2.47.2

