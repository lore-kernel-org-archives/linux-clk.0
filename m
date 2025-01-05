Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E96114831D;
	Sun,  5 Jan 2025 14:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736088174; cv=none; b=O4iAz3OKQqmg4pwZdjRLSo3VNQj4OrjyEPUlAituXZpnlSXl+u+vl34Ccw+BBdIVer5B1XukCmsYUmJMJGxyDk8HMPqkBQyBIEBgYZXcSYvx5utlkRYhIt9/o3osd9Xo1FI+qzO3yEtQC1De5XtYhI7SVWZ0ccXXS2i3DN4CPPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736088174; c=relaxed/simple;
	bh=DgQkbNFMUZF6etT7F+MrPQ8TpkR7eOYkicYA3rO6KXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mlBBDp5AL9SENEiIP3wua58DN5HDOY5/HnhLXFo11HOieHh5PIpXg8FmDKZ4LwJbHIIZjuWP7/Bvk2T39CBQPbqZeO+gcW5AfByfglo26Ft3M7clhPsEQJFznifEEVwuBOtQDngkHbKlA5Dl072+US1oVNC8uW7igvO56mIwGwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ToAZDbWd; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToAZDbWd"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385d7f19f20so5971623f8f.1;
        Sun, 05 Jan 2025 06:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736088170; x=1736692970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOhybleOhTHPjeZzsBPFEaO9jmQOHgc34Dw9om0Q4h8=;
        b=ToAZDbWd6jje84VnjtD4YhyzSKN7qKO3yYjvvC3jV2iL8nzVIexWnb8zEBgm4qzRV8
         +DJ+B+BBapMdLUOjWkAPn+XFt37JAhtLyn6j3vpz8afwzdW6CNzk+qmNVAaiyjMzlMvq
         D6DWSjtN+BLMukDGD3XY9KbrTwxqy66scOlDI9OUdM2BvPA10bH8WjOXaCfkSA1oT4CG
         Avd6hnNMd20vPg4nITcvYD2UH8taAlgYCilqp+4hsRVpPblxk4VbhrbzfShZLnu3ZFpQ
         ME23OrnKQ+MIHLzVJguXCjRRHU+vjhIkmPaLqk8A1O+jsguply3qmKjs1cri6Nxh2Q3C
         TpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736088170; x=1736692970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOhybleOhTHPjeZzsBPFEaO9jmQOHgc34Dw9om0Q4h8=;
        b=J4sV6cFC5E0C04IRAm9oZxJYd4jNzgISij+VEUsD/2xfptpS9SS5Lbstq7FF1lpf/i
         Qz+GO+bYhgUXr67lct53lJ4ht/+PDDDhkAopqOd/rAK9zsgKKUTgQ7w9vPj4xoh1tJO6
         IGAYF9yjse84af+JOrbQUs9MBw+MpKbfoyatYmScfXEZin5/oYT91BMXTKnmDf3u0g0x
         4ir55mO4cNQ/G4hxqJrVBLZDD12UEME4EDrRMIIFp/pGRRjRQreigB24zCZontDJ3t2f
         0h3Yi+uH1ImOWGwmb1y9HOn+/AtUV1fwj00mBfBfjgjVwJAIxyeUFvHjK4C6hKVtvu7+
         iqsA==
X-Forwarded-Encrypted: i=1; AJvYcCVE2kdRU54/DOzoadkDx7vY1frZMAlLVMlxWtqHcuiknpvL8VwRDt7w34ytJErd+dHxJaLOruQIhg5k@vger.kernel.org, AJvYcCVxblavyXzelmUZt3QTFO7SxZiGjMfOconhmHuV53Wil2JjYG2hZ68CQWnh/ZdA/zmTLeqqQOJVyfX5pX0c@vger.kernel.org, AJvYcCWAgPPe/jvZRvrb2Wl6MybICLqvmzT68O6YWOJj8boDxz/6YvVQDGISg+zfqqp3GY2VK87QJLP0bHYg@vger.kernel.org
X-Gm-Message-State: AOJu0YzfYjaW9Qbl840hZovAzqWh9wYqGXRsBJw2OF/jypAxg58CPbnF
	/zGtUD2yEaLNxp+PDC6Cmh/sQqo3tKpQ8uaUdu0S9WuVtMSg+6EU
X-Gm-Gg: ASbGncvrXpC37zsiaLoMe/vCzPKWO4Rz/84Tt9GP4MPaBt8lTJ8C2omDLY6ryJeufXQ
	9a9XmHOnJT6pRQJVr2Jx27saPZooIsOv2DGagzo4gjhcCtpvoVVYkJYYLkltFj4lzrwxa6w0IkX
	JXa6TW10H7/vp/ZIwUvbfqUSjMULaWieHEyOYq/FtijWgmVWwC9vZifYmlYiDP3WKinTJuYdZpr
	pn45i5Iuihhg0K3ARDqy6RDoNuSDKmzDRFxQuqrNgnQN/+9xJiShjLZfvVsTgY4U66Lr/EBk7f0
	rcyD9yqs9e2YiENPTN8IjoGBWdiYWqMpydtXx25wAQ==
X-Google-Smtp-Source: AGHT+IE3hZS2I+GK+KUi0d3XAsWuMwOFs9eilu3b8uldtYNCW7Pvn/usnSWG1s0nvTT7w6Z9eUSuRg==
X-Received: by 2002:a05:6000:1f89:b0:385:e013:39ec with SMTP id ffacd0b85a97d-38a221f1307mr48869956f8f.8.1736088170517;
        Sun, 05 Jan 2025 06:42:50 -0800 (PST)
Received: from localhost.localdomain (host-95-246-253-26.retail.telecomitalia.it. [95.246.253.26])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436611fc161sm537419415e9.10.2025.01.05.06.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 06:42:50 -0800 (PST)
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
Subject: [PATCH v4 2/4] dt-bindings: clock: drop NUM_CLOCKS define for EN7581
Date: Sun,  5 Jan 2025 15:41:59 +0100
Message-ID: <20250105144219.22663-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250105144219.22663-1-ansuelsmth@gmail.com>
References: <20250105144219.22663-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop NUM_CLOCKS define for EN7581 include. This is not a binding and
should not be placed here. Value is derived internally in the user
driver.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v4:
- Move to patch 2 (improves bisectability)
Changes v3:
- Add this patch

 include/dt-bindings/clock/en7523-clk.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index 717d23a5e5ae..28e56745ccff 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -12,6 +12,4 @@
 #define EN7523_CLK_CRYPTO	6
 #define EN7523_CLK_PCIE		7
 
-#define EN7523_NUM_CLOCKS	8
-
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
-- 
2.45.2

