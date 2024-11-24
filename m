Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41C01531C4
	for <linux-clk@vger.kernel.org>; Sun, 24 Nov 2024 10:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732442712; cv=none; b=tDvrWNZMU6KKo9vH/yhq4iCP1jk4Hd3AbGd296ol/tGHv0XvquqeXtYA5njxykEJ2NS8ULqmYfcO5filGM58hVBJRuCAriZOhrDiSnz+TazSsb/+c1tgc+0IgE+Qk2u0KIb8fuNZUeubcib50Mw+EY4nMOo3iKFtQwkvz7uX+XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732442712; c=relaxed/simple;
	bh=xYyBbJ1bV1F/AvNsXaz4DN1NT7f6hP3J7eQ9A3tlTH4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=c7WlCStf+D8LAzt/hZslX+cQ6qf9FI3X7O3DD6wOjlWqHVupDdugVuo0RM30fwbM4u3wteAno4cE7nMKvZlN8hyNaMvQyF0U/hPQZSVortW7BE9O1Egq2aWBajv5Wc0Pduk11BGLof9DWkR+Ay5j6F5VfPP8W6R6E10tl2v3PBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TLKQGZKh; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TLKQGZKh"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-a9e44654ae3so481177766b.1
        for <linux-clk@vger.kernel.org>; Sun, 24 Nov 2024 02:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732442709; x=1733047509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rc/jEUsBswYkaNb52ief0DkwziwerNcpWx/rdhbBFpU=;
        b=TLKQGZKh+ukC5GklXmw+ac1cisJMfJ/M6s7jxDRqmrl/2wE9o6QcwwPv2dvzgZPJXa
         DazyQG9LwNsz7SQqZV3eq2KfztXmaGh7rT3wU8uP6gijFuhzjlIKvWwGLeWuz75FecLS
         WLpcpZ1seh/UX1LbbyRXR+rAd4s8ltTJON0tKceFw1cfduXDH9GU/RQ9JGdx6PGvzJ2j
         UoG0Q4v9tMq0XLmlHClz1y5CWirF+nOmbL9MdkWCb7MdkgFAmln758io8bywfuYT2PCV
         wQnc3c+Ki/6NECj4RX6fFWvJFla8KVGE6wOd+WwnbqR8zA/uoD+B+1CZ3sHp73fqW0kV
         JAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732442709; x=1733047509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rc/jEUsBswYkaNb52ief0DkwziwerNcpWx/rdhbBFpU=;
        b=izKf38yvpcZ5TlFiXOp9FKU6WcOqtkGn+Xf4I8JM2kxJjNp3MlyUomHxrJYpY7TqLe
         vosbifeCO9RKOBVoiPEKaesM7aLR6Tt3jixZBy3aBw1L8DFS2Zvfmqth4XqHltPM+57I
         71fssqDtcrv41KfDBLyMeAgomITjqce4eNBRtPCdLPYABd2I4JkwKxFioPBfbA4Jv78+
         F4oY0emjBFUfr8zGeg9gLxtEBQKZqfRr3rEJciKq5K6QyhhtqkXJu8dsXOaikPoWcCey
         ZTv36jEmI7QLOb1hW9VjaXZDT96GfbOzE5IQRxWyB9HjpqlY/N9l7UF3pbFc2OMxOk9V
         Sh8g==
X-Forwarded-Encrypted: i=1; AJvYcCVwmZIdzhuUO+oal6O/Pbb20IRzqkdaIVTuKmBYY/bw1kVYy1MP7nUWAwQrQbyN4oYT9+uDoqFbLow=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAtmzjYbMo82aOrhIAwx9Vc4ZsGXiYrq5aNxBzPRvaSZuIYuRl
	RlUu3y9ceCAzxZA4bMNaCV3TNRmgJ2TvTViBD5uNNlE8ceW9VMnw96lqeB3GsuM=
X-Gm-Gg: ASbGncuMRZJjn7ZmHvD4CZKOaOI4aKh2w/Fws6ZbS+OTCirsYPfM27+GoYxw8wAMSpr
	4sDGNKLfguArYvZpXjJ5Bl0vdsjJqh5uu3LW0ZaABpu1kISWdZZqCh6KqL/dfXqGIQUlvIRJm/6
	qIaKjQFWPbaJ2Kmt6Zg42sC+5bzhcFZ15eNgRDSTg+Z9ulWUWPwSJEibfeueEGCnRNGLR/ToF3S
	O+oDjGe4JP15p9k0kd3x32UPXUMwBJT48+BurFxuNS2egJYa3kXIBcTcWyTy0C/npE5fix4osuF
	9pb7Mz2uWbKKe4L5XStI
X-Google-Smtp-Source: AGHT+IE6n1Sl2VjDnUF5IiR4wNGa1GDW8vw2+O+cu/s3Q+7FHS16Q8BL2O+lyk7mxoO9jBhc7KuPpQ==
X-Received: by 2002:a17:907:77c9:b0:a9a:67aa:31f5 with SMTP id a640c23a62f3a-aa50990b2a9mr726045266b.10.1732442709155;
        Sun, 24 Nov 2024 02:05:09 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa51759732asm295266666b.14.2024.11.24.02.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:05:08 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 0/2] Preserve the flags portion on 1:1 dma-ranges mapping
Date: Sun, 24 Nov 2024 11:05:35 +0100
Message-ID: <cover.1732441813.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Empty dma-ranges in DT nodes using 3-cell address spcifier cause the
flag portion to be dropped by of_translate_one(), failing the translation
chain. This patch aims at fixing this issue.

Part of this patchset was originally preparatory for a bigger patchset
(see [1]). It has been split in a standalone one for better management
and because it contains a bugfix which is probably of interest to stable
branch.
I've also added new tests to unittest to prove it.

Many thanks,
Andrea

References:
[1] - https://lore.kernel.org/all/3029857353c9499659369c1540ba887d7860670f.1730123575.git.andrea.porta@suse.com/


Changes in V2:

- Added blank lines between paragraphs in commit message for patch 2
- Fixed a comment to explain the code behaviour in a straighter way


Andrea della Porta (2):
  of/unittest: Add empty dma-ranges address translation tests
  of: address: Preserve the flags portion on 1:1 dma-ranges mapping

 drivers/of/address.c                        |  3 +-
 drivers/of/unittest-data/tests-address.dtsi |  2 ++
 drivers/of/unittest.c                       | 39 +++++++++++++++++++++
 3 files changed, 43 insertions(+), 1 deletion(-)

-- 
2.35.3

