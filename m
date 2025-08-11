Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B02120F07C
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 14:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754921452; cv=none; b=n0itjCpk/3laLoNNZBHOsbdRZX0r8CEZAyK7ntg6cvRG1vpYfjfhimOVqhPbdBpR4Lj7hhgfG8R9IzzJsb4/52TZQK0gpxTjld2CVVqlL/JVbWGuUFNwocsfEi2QvjWD11wimwMYGfitokzCQnFPcQRawAjvWuC26j+kN0fNWpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754921452; c=relaxed/simple;
	bh=H6l53B4wZkFz+nYR8PTiIJtmbUzH50h27nGG3cRI8Sc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=WdE9W4UQSZHNiytZkUrd2+i9o4shDISXww/tuvz2N8jg/3mQ+aGJI3qqizRQR/KGGr73AmTzgitGE1Vu98BeVpR7wPMa2dG5tbeQGG1vEOCGpJqqpFq6Hd2u4WcuFSBP9172Zy+9CCrknIfKMYW/0ChMb83OPd9qTFb3F23OFKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fl+fs+EQ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fl+fs+EQ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-af91a6b7a06so743287766b.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 07:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754921449; x=1755526249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ohexk0G5qQQ/U7tEXowxhsg85cDA9yyayQBpZFpm+6I=;
        b=fl+fs+EQ0/qEbV8FxYfSO+imznSFeyHbU1wPY8Tcom67VpGWEKjvGWd+W5DAf7tTor
         lbRPSFfi6ErSoGmerRdABTyBRCzHTCcZ8BwD09epmyCaWWO6zT19Sd8Qy0oAioINqQj6
         eJ8F+RVTy/wnHEm6zrxMpwq4R+EF0H1YMFR9ERklfDjT37wRU+lcJN5Vrdl/FSaqyJQw
         kKp7XnAl/vWez5gbojjcxg1mFlc8DbS9+rCeBe+HJaSOaIolk9bTUySfxYOca9QPJNtG
         sEGjj2RanbdN4fzB+K96MwQ5C7wF5qEIMyZ+lIWSm/Q3SYwSDfR52Qtu2FhL836xegsv
         I0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754921449; x=1755526249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ohexk0G5qQQ/U7tEXowxhsg85cDA9yyayQBpZFpm+6I=;
        b=DQNoyvvJH3xzvz7FFb0gIY74tWj7utYmcx4+800I7u8l/0T0FE++6cjAVaetQzj9b8
         3VjNAmViWI//GJ++21ZO2cP4FTx2UFrVB70pJs7Yj8qDa7rH7mQZZx4CEscOTYrAK7Xa
         +YlRA2FsWSSshla3xC1c0oNx8v5nxVnB9OUo97+6dzaY9q5AxDvefG3YPcZ/1zk4Z1QT
         RJl4kuPWLNwMxvEkIr20emfjjfp+dI07HdLN2g1tj4Lb2GwHtpG40Fww20KLGFlY4GOq
         4RnOw+mpG6fTYCFxBb9z2RUztwCu6ivCdUJwiCJydzuPYH265fPs4Lv9krHGMykBzSSl
         a0Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWilPAerjMO8GaY4DQQdTwMS3PpWJ1tB5KRPdP5Tzs941y+8yjNF55rRSQV3hDpET+ODBPP5HY9idc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYuEmKSeejY8U5jOr+Hg5KHmwNkP/oj1IHroNAE7tY0UuKSF0H
	dy+3eFrgpETqWyGbVM5LyAxQ8/CIiLZNVKdWCv6fGeVVaLUyzTUHvJeg2GKaB2H/RVE=
X-Gm-Gg: ASbGncuwhCkErvZb09F0SGnt6uv4ajD5SuJY5wSF8iw+IsalCSy7ZvIj7EhtYqYyv4a
	X1pioRIQ/NPuGhEBdfg45hiK4Q+kSZbh+FgtxL4Dt7ip2nfA+xxmMPoKsAADHUulFrEz4kF+1+2
	yVMLU9kyzrdy3SVHffIAbT8oaPBnkd/Ea21HT2fIukypcMNd65t9t/WMThK6HZMg8mTypO4amR2
	oxteBlx3A4TW45KYEmqfGFsiDmYFiWVlwOLrZ4Ssuu0z44lp7duQI03I8alXw8T3kjBglCNu7Nr
	Bd5NmqcK5RQ0Xa+8+L/NPFb39bONAaQGaBu5flNKLV8GdLbkgIfsSasl3n1f6VdR/a2zJoyGFyI
	n11maxwN9y5ODAG3R2o6d7iYdpTGiXrLXto9YMYpHjpysNzcnacurs7f3QuD0tyaKgA==
X-Google-Smtp-Source: AGHT+IHdBKFk8Hdz0O5Qrkqv+q1AVcT+ToZrNVbbDng2NMf7Xf+fMHPhcyvkBGiKagZpBw13o0Tyeg==
X-Received: by 2002:a17:907:c1c:b0:af9:71c2:9c3 with SMTP id a640c23a62f3a-af9c647bce8mr1317574966b.35.1754921448512;
        Mon, 11 Aug 2025 07:10:48 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a23bedcsm2030552266b.120.2025.08.11.07.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 07:10:48 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>,
	iivanov@suse.de,
	svarbanov@suse.de
Subject: [PATCH 0/2] Establish the roles of board DTSes for Raspberry Pi5
Date: Mon, 11 Aug 2025 16:12:33 +0200
Message-ID: <cover.1754914766.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this patchset is composed of the following:

- patch 1: just a cleanup to get rid of duplicated declarations in the
  board DTS for BCM2712.

- patch 2: explicitly states what BCM2712 board DTS will host the
  customized nodes that refer to RP1 internal peripherals. This is
  important so that followup patches add the nodes to the correct
  DTS file. For more information about why it has to be done, please
  take a look to the patch comment.

Andrea della Porta (2):
  arm64: dts: broadcom: delete redundant pcie enablement nodes
  arm64: dts: broadcom: amend the comment about the role of BCM2712
    board DTS

 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts      | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

-- 
2.35.3

