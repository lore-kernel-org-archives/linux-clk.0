Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F83158D80
	for <linux-clk@vger.kernel.org>; Tue,  5 Nov 2024 08:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730794786; cv=none; b=jniQWqBSVlTq36G0CWyuzdS0uMZS0rGpwOK4aPaLgPbhWIrnWBib79LJQ8P4TM1kTdSfPU0xjnsGnV/z/jO0YOFTqVC8P3XFgfke4DGveSGxX4dSJdn2tNCbjV7UlSXoV97BBUFCzo6Mhyex8fXeFkcW6LwOfY/VnMjngfWdQ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730794786; c=relaxed/simple;
	bh=42k57Jmwy8Rrp0lquNChihHUMM6UzLWENVJHZzXJ0wo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t+BAN10p4Q4iE3VJ4bHiRimDnkrKrbF2GqWeGtnixjnRmZzbWJbxJUu5VEyZrMgvMHhK3/yGuyxEZ3oeBQ9TGWr8uVz6hc8hBoUYS/eKs1TZRRulr0vGDNAhxNg+P7ggdRt+R94M/NZLhxmepQ58PD3EDoEPD6DUnop/DCPaRZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bJiE3pUZ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bJiE3pUZ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d447de11dso4011443f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 05 Nov 2024 00:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730794783; x=1731399583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FWz34cpw3AtbT34DFzUKD4mbAXRVXYbfGxdDWBBujXk=;
        b=bJiE3pUZIu6p4C39oM/eu4SXC8n3OgddaJ2Qa8a9k3zvClBneC54fEn3El4YRLiRin
         Em1VPfIk9BDV7w1fGDHpKwhmaLhiZO3hk7SalBPlueeybtARYr2mmxtKg4FPbwk+4ROW
         eFbLagtUXgGmg3bNz5C72/xnytdwwPjxSyOvKL06Nvv41bG6y6ZoFq18ZHqPDqddHAJj
         5q0zXCOfpw2TdfalwFbX4yaOKj2oqDO+yvHxI17b5m+MD+B5ycKwB/2PSoLP3OroYuO5
         7d3Yjr6fuGk2S3ELr/nE5X3OmLY8lAFwPv4Pq6UUMraKlILMKF0Maadw0M7sNCC4XM5q
         ZJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730794783; x=1731399583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWz34cpw3AtbT34DFzUKD4mbAXRVXYbfGxdDWBBujXk=;
        b=AOmSmzLRm4vJpY4DUB03J6uxAiK6PXCAuM11qawuB/CzIVak7T6AmLDLKY0uK83zD6
         WTDGELGJx8eSyYjApD0DI5OXdDjGRYo0ctOuaI/IkXtjWCvDDK1QrVgRVLked54e8Av+
         458ipdCta0X/XV+L3PbMqxE9Pz1NmChLVMH5rh2BAK97tK8xxe5V4rv0IdJB69vebBV0
         qfq1QHoG6WIPaiAZEBJR9gjXputN+Umq6FfAQQNPhoLtrXYjRpvvbBdVUbMA6ljsvjps
         Xw2IT57dObp+T4LW8wNMYjbf/0hwNhgQB4XBBrwN1+ynACB4wDhA49bJknEHIjlm6X2G
         wmDw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ/GoEaF4WfQna5YMl4WZL8F/aw9G8NliGdvqrmrexHyFqUr4yNnN8g6GHUlqbDcOs5ksp4qHJHPA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5k6DEwKzaIVv84n7WbkRsqX+sCuZMoV9uzH3Ljx8JS17qQfIC
	r5lZpYfUzIoiRFC/QbyqJ6xkxEKgeAilRHXrrp3hrPMG22dMQOC3AxwC2j4W514=
X-Google-Smtp-Source: AGHT+IGGKUPMduiVpRajgZql3ojjwc3zJRS0x+1DI26VNJJOK0MRclf/cbfq+QH+eST4cBh4cysR8w==
X-Received: by 2002:a5d:6c65:0:b0:37c:cbd4:ec9 with SMTP id ffacd0b85a97d-381be7add43mr13329739f8f.5.1730794783275;
        Tue, 05 Nov 2024 00:19:43 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116af7esm15343496f8f.103.2024.11.05.00.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 00:19:42 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: sboyd@kernel.org,
	linux-clk@vger.kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	daniel.machon@microchip.com,
	conor.dooley@microchip.com
Subject: [GIT PULL] Microchip clock updates for v6.13
Date: Tue,  5 Nov 2024 10:19:41 +0200
Message-Id: <20241105081941.3981524-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.13

for you to fetch changes up to 47d072b10507f813fb58d90fe6c37dd8686e8ed6:

  clk: lan966x: add support for lan969x SoC clock driver (2024-10-13 19:21:11 +0300)

----------------------------------------------------------------
Microchip clock updates for v6.13

It contains:
- support for the Microchip LAN969X SoC

----------------------------------------------------------------
Daniel Machon (4):
      dt-bindings: clock: add support for lan969x
      clk: lan966x: make clk_names const char * const
      clk: lan966x: prepare driver for lan969x support
      clk: lan966x: add support for lan969x SoC clock driver

 .../bindings/clock/microchip,lan966x-gck.yaml      | 13 +++-
 drivers/clk/clk-lan966x.c                          | 78 +++++++++++++++++-----
 2 files changed, 74 insertions(+), 17 deletions(-)
