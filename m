Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA51222C9EC
	for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 16:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737044658; cv=none; b=BuF6M2zSrWV3ECrlauL8Md/+t8+HeM7WGyzDlZVPUaWJXPYQa0U+icpi68AqNdHHJVpxh28Nlc9uRmkGshjAIGRtgAaYZDUsxeA+AXlYSEa1kyyHMhaZXfZ918FGS/cApyu4BH6iWU9fbLwy9K3CLvJWxBTMealsX0ZX/GvjucQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737044658; c=relaxed/simple;
	bh=cu0Tef8mUoeUKgl1e3UIgb/hk6mt13knvsDs9HBuDd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rJ5CjgjnKNdGzYfb5GDuVknXIoXXwJphP3j18W8kvyPTdw6jCUh6Fx6sVZw45x4g79hANweioD1ID4Z3G1M9dqxHZmU5JdLHx2BjuvJrG2+KGNfw5YtalI59fYj+YKh923VvmBFZJD77k/lGY8FiQwXZBH2T3/SHEuKyPCYjbjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=oDyNMtWl; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="oDyNMtWl"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43634b570c1so7670615e9.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 08:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737044655; x=1737649455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZrp7lu3ubP7SKqqGTTc2bgd5NE4OnqPzvBDDl400Q4=;
        b=oDyNMtWlJbHP0O5bdUDzgCd3snBtc/nP2bjbQ77nkjwoZUgCjntyYcmztzscegS9e8
         CL5PhS8hd0plYuKIgcVZtDQA83oNHnFqkMIR5LG4rzFzufxf8XpUTrkYqxzbpKH7u1eQ
         BPEe+VQWfk6sFUsYWNUQEzxVKQUqgp6TKSy/Qd/thVz1DTGlMP1J39vJ+bcjhnTZwpBd
         G/C77mLDf3SNoQpB/B7+5Iy4k3Y6Nyz46LKc3rRwiOOB4ZMec/DnujVGd1jqMZHAFMCr
         Bm/fgS608fNHb9zLtB2dR9JW9wIeMDHTMGYWc4KDYXOQlf/GniLFQhrpntykBONdu02X
         jnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737044655; x=1737649455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZrp7lu3ubP7SKqqGTTc2bgd5NE4OnqPzvBDDl400Q4=;
        b=PTs76stlCdT9+jlZuS9107l+fhaI2gPwGml4/me92EhTxqNesodwChi1HKYmMVa5Aw
         8vwBzNSHjOzq+FV/ZWKBvz8xVeRhWhDOF1yNkbMf/I751V11vzaGBJNXi8PGn31lIvaH
         mAUZ6c4YViYbY/NT9Kd0jCkJxxHSWN+b2F5Lp7iLlF9/sScI0DSmsqTI7Dm3ePvTPNBW
         xNXNs9RUI1KRZZQoIPDV6w0BxsA/aMX6ozlOTkeGOkEhRA7sHnrwa7Db309/qkskSrll
         m1Ksm+QEYdNnVHRX1CFnPYXBRLdwNJ9o3y53HvcTK1wRTAav0YH8xADrUmXObXZYG8OT
         d/Bg==
X-Gm-Message-State: AOJu0Ywi1tdCpQVMoNtvE2VqIuUE5ZrQSXcY8D4LmJqWJ+OaFGC4cCl3
	s1nO81uT4GoGCRrb5yILjqZAe6AdumpPWmHXCpMSRwdGIXZzgRO0BvzFkUHFCIi5/9YwNAjkHlH
	x
X-Gm-Gg: ASbGncueb5hJSEupv/73JQgJiRhBmvJF08bbxnb+EoMoeYi/RQ1vVWoOTEDUoPqjKOi
	S5iEbkWzda2c2pNDka2tpwzp26XDELFKYyDzIDOxRUrxEDdveow2bfYUCiFApsQKB5diM2EBMWZ
	9A8HL7qpPS98+FruZnE9EerfGCeHp2uw49b+LTi+RV9SW1FV/dgMmKKkFvKVzazcujA79LLyV1U
	UuiaI+zPsZC54u35XYn1Hfv2+cutSScc+eabdGvA6RNJR6X
X-Google-Smtp-Source: AGHT+IFiO4THDwrkWPkgQut59S8Z05jEzJwPXhwEqlw3rbldrlTNRXl4E+qRkkCpAywZLqr8fVkHTg==
X-Received: by 2002:a05:600c:3584:b0:434:9dfe:20e6 with SMTP id 5b1f17b1804b1-436e26f47efmr243629215e9.23.1737044655043;
        Thu, 16 Jan 2025 08:24:15 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43890469ba8sm3715955e9.37.2025.01.16.08.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:24:14 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Jan 2025 16:24:09 +0000
Subject: [PATCH 2/5] clk: bcm: rpi: Allow cpufreq driver to also adjust gpu
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-bcm2712-clk-updates-v1-2-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
In-Reply-To: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>
X-Mailer: b4 0.14.1

From: Dom Cobley <popcornmix@gmail.com>

For performance/power it is beneficial to adjust gpu clocks with arm clock.
This is how the downstream cpufreq driver works

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 6d5ee1cddded..d374538e7108 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -156,7 +156,6 @@ static int raspberrypi_clock_property(struct rpi_firmware *firmware,
 	struct raspberrypi_firmware_prop msg = {
 		.id = cpu_to_le32(data->id),
 		.val = cpu_to_le32(*val),
-		.disable_turbo = cpu_to_le32(1),
 	};
 	int ret;
 

-- 
2.34.1

