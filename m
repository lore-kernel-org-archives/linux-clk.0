Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33421E25E3
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731062339; cv=none; b=iWtlkZoY9jgml8qJWBvXhMDFXI5jyOs4mLnGTWCJJMwdS/Xlh8BMWEzfQzmtOgawzw1boGuEA7flCPOCynAm8UFFY0ojxTRQCS20aMa8zAkNeL3J3hH5ZPSCmKYPQZOYG4MCBnkQmmwxIXVz2MmwoJonk3tVaDjzh3dYXeGBaHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731062339; c=relaxed/simple;
	bh=mcaJwPbIfL1eOaJCBeghMP/S25nTA8NCJStg51856fg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DrXEUo/OFgsORk5PbwE/MTvNv3HlpHlwnS0T7UfYVkanjG8KZsfsPYNJ9HdAF1LAQuDjWQrlGqSqM+mp58mh50udBskTcOXUXbA74ZfKv2bTaImh7se4cPJsmY+KcEzQmT/GiUjxNxDgyh35YAsM52SJ4VKjl8+fgQiQFZ2gtJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OGuntJKV; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OGuntJKV"
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so29607081fa.0
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731062336; x=1731667136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SaISgbIGwpAO1EVVDtgSTHmyzi3HxAQHzUJmlDOmvT8=;
        b=OGuntJKVk38iqi8zoKos9l2LLHr7leql72l3DBj/4YfFli3Lir/RLq0wQMlFWdFd0N
         OTMUd8r56RvZG3ZzgLlWs5x3bVdjR8h9OTaCxTQneYA63JQiPsfzPhQNduL9SQtXRbNA
         iqjdvoiULVb97tRDN5Po6P4hF6x8z14GE1DdSqPplXprXYgWAsrkpHvQBCN+l4ptLRgr
         kiduGQv4MpbPhaD47wTul/OZBOE3hbDu3G32Ug3IDzMs1EVX3ew0OyJkjliwfdsos0OM
         bP6BSOLDpuQBEzvEa7Ohwerf/MEWLjdodx6JiIqiq9ADOgcWvE1FQC29WEwlLjC+/NHO
         E7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731062336; x=1731667136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SaISgbIGwpAO1EVVDtgSTHmyzi3HxAQHzUJmlDOmvT8=;
        b=fZQdx8e9JGB7RsIFcUsFJr7yVLrUTRcuGqFSc4DA8+saONALycO9zsi/jGn4yFhMee
         nxY8NcHDVeUCEcLGZZPAel7fEh5CxBxsRiOc4+g44pTMPzrLL9h9F0dpMTCI6NE7OMbK
         Ps4OBM3wcGQ1NbWhEp+UvTL9o2ejJOScp7obpje8dO8EMp3YzTKp4mjyI4WLbn38llre
         71lT7LEuua/C4VoVZPKtdavBvtCMz8181rCpjH2gghoyF+HZIIPFuZtryh+k0ZrGvNjK
         g5o1VBki1iCJ3xD4Sh3+S9EElXYhN6zir96I25Bu9nW5cUhdd5FwAONaUKqx+O874HIh
         79ew==
X-Forwarded-Encrypted: i=1; AJvYcCVHbLQfPPoMUTel4AStzTSVbvTwXW6oxnbYJ6aWQA6qO1FbNkBCIHTGXHf8Fg6COGdhv89Zy1CPvj4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1w2ENXFWin4lXOAJavYNu4I5sqPJz7xac4ebTocBRitF43+uU
	jAZhatLorBjAvIiji/kn3bcSIt7OpS6bfHFlwyGJvFe6egrFJ/LlvGAvHwtfebQ=
X-Google-Smtp-Source: AGHT+IH5UNmzHaes0cojtKWppdmffN914U6rvrc+ZzaB03JePe9nRLbAK00wuir/DGJiOezZXD0K2Q==
X-Received: by 2002:a2e:be89:0:b0:2fb:51a:d2a with SMTP id 38308e7fff4ca-2ff20188132mr19417491fa.12.1731062336127;
        Fri, 08 Nov 2024 02:38:56 -0800 (PST)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0abe6e3sm213730366b.84.2024.11.08.02.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:38:55 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Michael Turquette <mturquette@baylibre.com>,
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
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 0/2] Preserve the flags portion on 1:1 dma-ranges mapping
Date: Fri,  8 Nov 2024 11:39:19 +0100
Message-ID: <cover.1731060031.git.andrea.porta@suse.com>
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

Andrea della Porta (2):
  of/unittest: Add empty dma-ranges address translation tests
  of: address: Preserve the flags portion on 1:1 dma-ranges mapping

 drivers/of/address.c                        |  3 +-
 drivers/of/unittest-data/tests-address.dtsi |  2 ++
 drivers/of/unittest.c                       | 39 +++++++++++++++++++++
 3 files changed, 43 insertions(+), 1 deletion(-)

-- 
2.35.3

