Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EBE250BF2
	for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 20:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755202200; cv=none; b=sIYFn7EydmYfKNnPh6lGl6ACIYdVzYk6eQ2gRLZHh7wUm6SxsZzcQ/MQdoqHiW0y/UvVnkVhKbq+19adR51qE1Q8bhwaVczFnPu76AmzjqLiLfveo1lKa4zr63XXozI44SLaa8Vycd4SYtZt2YqA34CyY2tm/10VeXEU3sIKqJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755202200; c=relaxed/simple;
	bh=Cvog2/UbOYY0KN7uBOJXNO5+xVx8w3a06fpF5BvF69A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fKoPGsBIsZ4EjV0Vn3xk9csaHbOiVXmvFwHinAaJmQY8/BlA4z7p/ZnRZlE3XxevPY0VZgFVDjsOAO35RnQhKHz+xtE7qjNieRoP3x51sPF9nfCjGNXNlEj/Nm4XaIfwd0RRVwQgYpf48raKH8H8/A3HLo8liQLmhZrIxP3hSKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer; spf=none smtp.mailfrom=libretech.co; dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b=OHH6e1hr; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=libretech.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b="OHH6e1hr"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-70a88ddc000so15311716d6.0
        for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 13:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1755202197; x=1755806997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7OonhXd2J8nBVykMZsnyPIpsB/2woXa2NsCt/BWEBOM=;
        b=OHH6e1hr2UiM1Wsu+7s86HvYpTMIKOPQzXfqAPJrVD5GnjmlL24oLtqlhk6Z1U3Xx+
         zERTyiwAAy/tN7rzm9LEUm6Xi0vhcUsOG0wu4ROw6gZnpLqYWVqXn5Oze7TMTDiXxHFr
         SsSaQKMSi4d/eHfY1Ms55wZryTNtnxact9qJy34hJ9UkPGs9h+AMiZJL3prYzxszRceS
         grzzVrllzG16I3xKicNw+6mjmcaMS+bBYUcAFllYAXBeN8lKA2abcu88MNmRpHBAVZF8
         6ouASmSZNv3GqoCVYNVIRDI8Wm9Fujd/yuMvXt4pPVIvtqpzGVV2GRUnPzGTcRb2sYSW
         ZGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755202197; x=1755806997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7OonhXd2J8nBVykMZsnyPIpsB/2woXa2NsCt/BWEBOM=;
        b=bXyhF1Q2Foq5ee0uWggtKnVuuLyBHAnOWtP+9iFyp7Zb86kagSiekMrHs8H/1GkD/4
         naehEDXh3mLbvNl+tf+daxJtKm3hLM2h2JVtdfSOwyk5T//lXRXg67BboHOGs9IsJAEf
         LxKxlxD8hCHAihzGEXQvF9EymnDf4EhggPYE5n03aEtr+dPXwPAeG8ucx354JfebwS4k
         FDQqaRE6KxFYuGwOwCfWmCbL2sd7fPJUZ25s1IvfWAnkEQjwGShHdpB24FrGErLKKuQn
         ZCrT10MiSu+0UJ2jvke1pigAmOA+Eyibi/0V4L1VDvQDoWYAsyX3zpENu6bOzqnzo1RW
         gxPA==
X-Forwarded-Encrypted: i=1; AJvYcCVhDP7oaLWIQabGU41IgU7CoxXFMXG37Q9RF+DBaQtfGdgSzTbuo5UHz/fZ61T5gHlyVlYWlxYHn/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxptvvtX8BiJERo0Bx28LmTiWegF+QmO+apC8Fh5+gh2f8OoAuk
	SHnWHEsc0iFdKMrtGFuDHPDEQSJERZzq1cjCNmgb07kMKUV6Y3ecEhuyM0r3Co3AOA==
X-Gm-Gg: ASbGnctmQ2ARukI2c7XDn7ST98nZPEQe1GkFVU29ve/E/MZenUaSW9xJcYElo4qloZW
	uhTLjhQf+awHLxsRYAP76qwkjnIpobm1x/EN3OSEvpyeAJ4+VkeiQQKlqSgYBrtr/6VB63mycxZ
	iBvauiI7nxlIceS9nqMlw6CBt1Koae8r21CoiEjfFSLXlLVLc2Wt8m+15HbudT7p5OE8OJt98RO
	fjk4kApMZ6Sw/ICbAQNLi3JnEz+VTW39FmLxSvU4TqRL1g5e0XvAR6XT8nr/Rrrnpj3dcU2mOzu
	rVC+ayrJiN+EcvWxZjxQFA/3XcBsQdmq2wCoCq/EWmP5H1+gHKs98F5LByt7HTEoPC7o994tkHr
	LlB8+bWCj+G1ddxQXXHdZUHjLm8w=
X-Google-Smtp-Source: AGHT+IF9yvU2GiDOI9/uRKPRYD6OuBCxZE7IqB303/rhDfSaT/Vz79QLGfLeMmb2anmChCdl3JacAQ==
X-Received: by 2002:a05:6214:1c8d:b0:707:4daf:641 with SMTP id 6a1803df08f44-70af5b2d44fmr73346196d6.39.1755202196510;
        Thu, 14 Aug 2025 13:09:56 -0700 (PDT)
Received: from localhost ([172.56.29.94])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-70adc1cd94csm17651476d6.14.2025.08.14.13.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 13:09:56 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson-g12a: fix bit range for fixed sys and hifi pll
Date: Thu, 14 Aug 2025 16:09:53 -0400
Message-ID: <20250814200953.1969944-1-da@libre.computer>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bit range 17:0 does not match the datasheet for A311D / S905D3.
Change the bit range to 19:0 for FIX and HIFI PLLs to match datasheet.

There's no frac for sys pll so add that as well.

Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/clk/meson/g12a.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 66f0e817e416..f78cca619ca5 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -157,7 +157,7 @@ static struct clk_regmap g12a_fixed_pll_dco = {
 		.frac = {
 			.reg_off = HHI_FIX_PLL_CNTL1,
 			.shift   = 0,
-			.width   = 17,
+			.width   = 19,
 		},
 		.l = {
 			.reg_off = HHI_FIX_PLL_CNTL0,
@@ -223,6 +223,11 @@ static struct clk_regmap g12a_sys_pll_dco = {
 			.shift   = 10,
 			.width   = 5,
 		},
+		.frac = {
+			.reg_off = HHI_SYS_PLL_CNTL1,
+			.shift   = 0,
+			.width   = 19,
+		},
 		.l = {
 			.reg_off = HHI_SYS_PLL_CNTL0,
 			.shift   = 31,
@@ -1901,7 +1906,7 @@ static struct clk_regmap g12a_hifi_pll_dco = {
 		.frac = {
 			.reg_off = HHI_HIFI_PLL_CNTL1,
 			.shift   = 0,
-			.width   = 17,
+			.width   = 19,
 		},
 		.l = {
 			.reg_off = HHI_HIFI_PLL_CNTL0,
-- 
2.47.2

