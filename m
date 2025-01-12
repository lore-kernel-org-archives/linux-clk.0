Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195771BBBFE;
	Sun, 12 Jan 2025 13:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736689235; cv=none; b=ZyMdZjZW+TPF3zUNKQ97Hk3csTyrvtM0FA1cf9+coghEajEuI1SIMrnDiNtJ+LOqQWMQB7hZR3m/1dNxGN5muLKCml5qfIDxCb6rRwdnjjh58l3n+1YiSwEXszkFAmmLY33ifZhaVI5dFnH3tbU+pb28Hze09vs2S8Gm3xPyBxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736689235; c=relaxed/simple;
	bh=c03WokknUq9N5q+PemBa9FQe4GiJG6bh3QDTACDUWP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEN1WtuYSXvgM72HSMxOL6dnKgBeDwoEMd2lniiE7uE6CrPzU4SYH4LLwQv/MEy2lWCs6FMiCRYUXfpB3ZT8bG/GQIpIXan2NFK15UYEODMEDBZ6GKPBBINFiD7k9oOeodRtNvia2VwVtJaq9zPybCntSqlt7Mr6++ugVX9SNXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9M4Dlzm; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9M4Dlzm"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa6a92f863cso672587266b.1;
        Sun, 12 Jan 2025 05:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736689232; x=1737294032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MsIaz2pAYFsvkh3Vy2uCEBJ6/wXDXMbjZ51UGtrJ78=;
        b=d9M4DlzmJiF63jMz1RbcL7LWyhlmf4TA4wxzT/e1OquGN5rRoDAygY4K0pvy9nXW46
         gwyBShRwLUH0oR7Sr+OQGyYlBXBftdCybYrZj7MxVlHJqDIQ6MARqsjlSRkDLbvw+RIv
         k6svZ2YzOe9tr12/xbK3CdJ6UhH/z1VPTc3dKZF6D4c4jzosXDXBBDBG45QAxvNzmRYE
         l0zdldUJFfMrghQyIVG99RkcL9Q2/6ryKs36LAbcfsB+SotPaNbKiJivtue9rRiqPL+s
         j+C12vwXyN+uLoOrJXWf7DRdBm7iDTVU0j/cbZ+tQJAp6FFeMxQZrmpDts6VaLaoX009
         13sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689232; x=1737294032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MsIaz2pAYFsvkh3Vy2uCEBJ6/wXDXMbjZ51UGtrJ78=;
        b=e51qZrB29vK8R4vS0lLHoQDlxwRPBR5D9QqQ2WtH+ks56pbHr3lvFA4muvqCivPnP/
         PGKqtwkRnW5eZJfWQ0SoZ1RW0qnrCpenk5fp1PXl7YC9lZ6o6PVbW4qydljmsLKVtWLy
         TOhVW2kjvBM5mlJDfzJ5isRhuR/DYM4oWprh0mHPqAYAZfVtOBYep8we/HXv1H0S5k7F
         Ae2SMEZ2US6JZN7a2WFLVG9J5VSVvlyMk0oWNMoRhFFbCdmbeVXmAIzw5CyY0symB7K9
         /aH6tFgZokTNQluNwjhIIgVNczzRTZW4DrOAvLhATqeCA6oe3ncfmH5VOTgmtOzAxEQU
         Xm2w==
X-Forwarded-Encrypted: i=1; AJvYcCVhq7hIh78OiubfzjVGt+uhGOYCIF7AHQWsKz//TVbbbwwLFYJAAskcLWfodsdzD917kodenOE/QwTm@vger.kernel.org, AJvYcCWVMwkmkrPz/Gfuf8JuCFVkksa33XnVRmJ5x4Z8Fr1W6jsBaXDAHOZ0SEOofDm7ZVVHXbJiU9EYBzA/@vger.kernel.org, AJvYcCWtmIQZd6m9atej5gRyleI2v5uUQ/efQpjuse+7mze7troMFe1olzOQ1uLoI736XsjEmqSwL0Wl5i0iUATu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy1HMYBz+l49X1UaabC36oYonW9XVvDdb+caJFAWwN004Vwo0S
	p5hXsy1efRNpnEiqi68/18awSyCkrnh2Myaml8Cg0m7ovRKGd891
X-Gm-Gg: ASbGncsQ3XIS/28/Fgfg0JS+VFTtbo2iD9VAImejFDMm2UeS85IiD7G7i/KJD1fJxyw
	FTYAg1zTeCQFkrdoeZrk+rC+15dCBi4ivKTcco4yfthJFml6O2PiaIYo4LfPrEBwaIJiJwlV/W6
	BjBTiuQyORHeDpnRUn+3dDNx9GZ5HTnJp63t0os0WhmIf5fBUmlXhdUxQe+thlDoRaTn/6MWshr
	VLuwUHLVQDVBdSmwKZej2Y42NpZHey/sg7oT0Mzie/jZ7VoKKXouDjVtjX5FmmTxNxnSBE=
X-Google-Smtp-Source: AGHT+IGhRDdWMzNmO6jwI7oj/9fOIu8HnI8mDuXnPVaFjjbIlG3LyzW46cc9QsoyEZsHxvPDBVFgJw==
X-Received: by 2002:a17:907:d88:b0:aa6:5910:49af with SMTP id a640c23a62f3a-ab2ab70a152mr1607944466b.24.1736689232140;
        Sun, 12 Jan 2025 05:40:32 -0800 (PST)
Received: from localhost.localdomain ([109.52.222.172])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab2c90d9a46sm379421266b.54.2025.01.12.05.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:40:31 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v5 4/4] clk: en7523: Add clock for eMMC for EN7581
Date: Sun, 12 Jan 2025 14:39:40 +0100
Message-ID: <20250112133953.10404-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250112133953.10404-1-ansuelsmth@gmail.com>
References: <20250112133953.10404-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clock for eMMC for EN7581. This is used to give info of the current
eMMC source clock and to switch it from 200MHz or 150MHz.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v4:
- Move to patch 4
Changes v2:
- Rename emmc_base to emmc7581_base to make it more clear

 drivers/clk/clk-en7523.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 3a4b7ed40af4..6a763bc9ac1a 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -91,6 +91,7 @@ static const u32 emi7581_base[] = { 540000000, 480000000, 400000000, 300000000 }
 static const u32 bus7581_base[] = { 600000000, 540000000 };
 static const u32 npu7581_base[] = { 800000000, 750000000, 720000000, 600000000 };
 static const u32 crypto_base[] = { 540000000, 480000000 };
+static const u32 emmc7581_base[] = { 200000000, 150000000 };
 
 static const struct en_clk_desc en7523_base_clks[] = {
 	{
@@ -281,6 +282,15 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.base_shift = 0,
 		.base_values = crypto_base,
 		.n_base_values = ARRAY_SIZE(crypto_base),
+	}, {
+		.id = EN7581_CLK_EMMC,
+		.name = "emmc",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 12,
+		.base_values = emmc7581_base,
+		.n_base_values = ARRAY_SIZE(emmc7581_base),
 	}
 };
 
-- 
2.45.2

