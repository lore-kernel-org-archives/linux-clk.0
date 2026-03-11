Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816422D6E62
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 04:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773203919; cv=none; b=SsW63HdvXTNPOfT+6GglDn/VptpmSr11XScZphdJLHSXBFyzBaHreVxj0aDtXvyMd1fIuhZ2xg7YIT0NMM07Ak4MBMN3m9ruQDP+857Oa4QIjLh4ehtcGkDnlJeOGKgkwOuqO6NiDDVvaeuPpvmpQExw46nwAgCjCAGgMy1M+hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773203919; c=relaxed/simple;
	bh=b73m/0G4bp9qlKbyGpXs2BmQnhyq68YsG8re+bxd7zk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OOvSvTt7KxS7JJOQWVaU4Gg8YDc6MhkqL8B18YIXvZHjbG8ToaMrCXcNaz46vsHaU4a3yxSjZGVufULWQP1OaWB1xUZl6dgfeNNyqM3h2S2cehHqgaRqNtof+JIONlBQKejNlYCHJd/vY0WKsjqNnWHQ7mF+0o8doD4kTnTZw0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtK1JOGN; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtK1JOGN"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-356337f058aso7997341a91.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 21:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773203918; x=1773808718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOpJyc/uxw9YcZ5bYmcC7bF77XfwHzZK7dfWyiG9If0=;
        b=mtK1JOGNkUqANef7tcws9FG9uYdBx8rECyqe+z1NGsmn/MlG8YoLc42wGLz/f2Hnkx
         maoAr9hnvvC4zKx6qJL6x8QFH5tXsbCHt4X4GsY76XrAJeTCSxrjKlcydGzA7ZCavOVZ
         o9+aBhEwa8+tQS2gqSJrtg3adUCkLkmLp1Tr5h3fk6McCvVUnjKbb7u5uzqIaldZe6am
         8eUy/nbiM8O/r/raMQgVj21LKlbJDYA/ySlohnBhIeFRFh1tpOKvn0DTBPzgcsLK457r
         HX79GxnfpwQ3jHgGPGum1Lc/nLNPrqKQOqtD7Tqf2RXZ0bo8PPcl/BonHkzwYfGhU+9A
         PJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773203918; x=1773808718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rOpJyc/uxw9YcZ5bYmcC7bF77XfwHzZK7dfWyiG9If0=;
        b=sxyLkg/44eBD/OmWSeyHjdLrePfQCAoGNYT40cb95KPI3ydduyT1hpetRZEMld/V01
         NQGIY93wQ6Uvssk+2JM/AfR+G+vrwtcfpECZwioGAVPuElkWc3bg9llxUhIU/pOLGBfY
         ZItamsVTa/s/GKfgpHUFkk36eXb8QPdxwPztVMfhyp7L/8NmD38vgZNIo8x1vQYwCXEN
         opXtOro8cZZP2K9IDdigyeBWHp9zOQHbyaCbiJOA9UHDJHV/0bYEMaV0TQfnyMbH4ZMD
         aN34tRGq4AOk0tHefwLSHZeNMT2c+VKvfafdfNn+ItTYg948PgWV5dlWi6znF9S3oWp6
         sfEw==
X-Forwarded-Encrypted: i=1; AJvYcCUpMoFIu9oIkwI9qmLvHSAY9KIud/AmozaM7hrR04g39dO8LkR8P1XXi0vi2C8X0O4xbyFP+EBYpww=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlZZ37Jbgg/GmzHCK+sr8yOjvPhupDe+ZUnKi/u9qfJyKQjEYa
	BUkh0pk+XRtWj6PEl+FvJCfpFLnw1wDsF/2Y0KB/QprKWVS6lZiF7P0/
X-Gm-Gg: ATEYQzypDZgsyNqFMftiGbIu2d7BHXQTCdc7YorYN440UqzsP9mztqXGxNgqdvp2Y86
	1P6qg7fuqp3XUhCxmfCmAlijYox9ap8v5tDMnj01iGX1HXEGKBNhs1G2WKEjuhUx+TdYpBu7Ppt
	q7RXxknGOKh56J0akQe1zCz4HNmBFPCf8e2vX9NsHeyyipwB8HSV6pP3oMZTq/uB4rAGy11Slpb
	JTZ/+3ywDEUikY+c2Thm9O92nZ58z/Y0iRppZG/L+jFKyfqUDwlT+rO0EMiTrWBsZG179hN58O1
	j8urMY35dq94oIpnlCj9kPu81niDJLTz9Z1+4rmlLXgmCR6vQaioQo6NUVQsDpF9wmr+d4Yaqbh
	Clh3CE856NniE8bH+QmpjHryHLuQm+YctJJtg9pf9Blp3ZV8nBEJR1dDMA1LSj10YiABWaRfoxg
	vhgDCNowy01xqmbHx2R0V2HkEYRly8R22Uj04yPmWV7iYMLOa5Xn/0JOKlTaVoesUzrUZX9k5C2
	PMA5g==
X-Received: by 2002:a17:90b:3c90:b0:354:c6f3:d365 with SMTP id 98e67ed59e1d1-35a012eacd0mr1283571a91.17.1773203917898;
        Tue, 10 Mar 2026 21:38:37 -0700 (PDT)
Received: from localhost.localdomain ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f06fa04esm4679484a91.6.2026.03.10.21.38.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Mar 2026 21:38:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: john.madieu.xa@bp.renesas.com
Cc: bhelgaas@google.com,
	biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	john.madieu@gmail.com,
	krzk+dt@kernel.org,
	kwilczynski@kernel.org,
	linux-clk@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	lpieralisi@kernel.org,
	magnus.damm@gmail.com,
	mani@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v8 15/15] arm64: dts: renesas: r9a09g047e57-smarc: 
Date: Wed, 11 Mar 2026 11:38:31 +0700
Message-Id: <20260311043831.2576-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20260306143423.19562-16-john.madieu.xa@bp.renesas.com>
References: <20260306143423.19562-16-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I noticed that for gpio-hog nodes, the kernel already uses the node name 
as the default label in /sys/kernel/debug/gpio if line-name is missing. 
Since the node name here is already pcie-clkreq-n, the line-name property 
seems redundant. Should we remove it to keep the DTS more concise?

Best regards, 
Phuc
