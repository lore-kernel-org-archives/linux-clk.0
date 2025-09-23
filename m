Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A38F309F1F
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 20:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758658374; cv=none; b=B1w5EDY19z4enBj+q0y4cUKpJ6fMUjGIDM4vLEsOJc9yZgB3kgWrs6IKu9+oG+bIeLiX6Lf9Fq/2ZvTKP6tLD0VcDsyozlZosXBN2grLsMC8rR3NlAXjs2qXGp/yAgp+LH4v3DmxLkzsftrPeWtcSxRMg2WwOuAY7ofb2ujWu58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758658374; c=relaxed/simple;
	bh=jVddi4NuKKwdCHNaUyrNV2CwAkuZZSN+ouVB+z9jMuI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dN67xms4uclkxb6pIQsvgE5FHjFMbu/z2I7AicEpBR1TYkxMjh5ofxDIBozfO/FxRuVxMZZBojdAjUT22gylBQSFQ/8pOOzq4mbHocrWncyTujPjQ7mYphoLABuu+Qx1aKwRNNoCaGXxYXN6T+X2ovGEhRPApjJOkFvGd0Jad4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzkQmfUk; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzkQmfUk"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3f3a47b639aso2068872f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 13:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758658372; x=1759263172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ASptksIfZB8nhWx3+GWc5qI39yAJwjp71gTOqcHHO80=;
        b=WzkQmfUkRVtH3rrdaQqgfMbfNiaMJpPVRDuk2mSe0OEpn9pCaNkG2UhxI623wbdYly
         fE2I42oQZfO7tEBiNen+EI9Uyxe+M9YNIbT19ROjxvAvRghiy6Aov3EQSct8kau/4cFk
         LCEDXdQ483p4O69B2AMObQ3sCtW/4qo1N6S8abUBJlaZ1vzEZTrAtYzHx8M5Fq+OOAb6
         fjJIu0mCXwiAhzn7KQh8FO500NZWv92HCdha2BZk3kd2+mDOouGaZQyT5ghvSBEXKBJF
         dUv1QD1ZFOuQxpD2EGo//SmArHie0M4DArpKVzQafmPVWxTmwjp9bAFAayDagq6wIC5U
         8owg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758658372; x=1759263172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ASptksIfZB8nhWx3+GWc5qI39yAJwjp71gTOqcHHO80=;
        b=qDWfCPKVdOkZqnWhz15iX7cBaq2OCVRv24FRILcjRW1buGYmFrurQbTlXXsQzFM833
         jkd0bVj8ky4dOBTWpJYFvvc5CWlNQ/oMrUb2ezaYbX401nutL42Ov92pbbRmHXXk512F
         cXTvN3n4xHFK0NYTZypGBbLOyF42YV0KFkSwAg9vq0POdXNzNSTTN01nVdQCXg7ntKji
         7NtzIKmHKXyxqRmk5f1qpKFZPOI4aNs+ovIu++qGrVjxm/6XTAUOBBTlAqI0Iwima7zy
         tJZWffiLVfmL5rfudqL+ZOq43/7sH6Z07K6KTeSUKRfuRgn5xcll4XEOfnd1vDTbMkfz
         iaZw==
X-Forwarded-Encrypted: i=1; AJvYcCUh4fNDkC3fBYAgU7umFbmTDj13px/al0vCZ0/qWbPkBoWK7FDYnVvtp09bckhInpn30rRVYVZM84M=@vger.kernel.org
X-Gm-Message-State: AOJu0YybOkV31lugfe7hTA7GP5GZa4KBm7szB+F35oarESccbUIJI2iG
	vnp6xgOW9OR/2wGiJgPs1Qbhi6fq+O4zx70Ql9L1+h+CCfGT4Ke1OR8P
X-Gm-Gg: ASbGncsROFE7FWLZThptFLVNfVmFNuFDbmfOGnWCQdQSpUvIQdoHF8UfSiQ9HZUzOmn
	4lNl8CwCOrNomE7i33OmF1I0i+s+ZncjS6jcXfQVLtPCe80ZQunMe/0RdFdfhvKX2EPqM7ahaZp
	WQ4iqqb/zCQJ1p9VJoWql6QK8OA6Z+XRR36+d4AHShYhiLMV1sO1Ac6GDOTNaiAYa8zCHct0LOi
	cMn8tJNWuUEFNsTEQsD0DEdwaBdd+QbRpTPk4B6OnZbJkX4fIWn+6f+Nj9ZVb2uQvepSJZNlLq2
	TopgT0T3WRNfF7ipTKzAh6nydvo05EKA8330lby4NQ44wD8HzrRNe7OLW1gsdQfLU99d9XW4nXw
	EkS7lQ/iiNPUW7g/jJfcZJ1gpG798ODDwjHGb7iOqpjJ5feEiqeZNMwWhcgyC9nh0tmmtmXU=
X-Google-Smtp-Source: AGHT+IF016uYkkKzgv+AucFeGyavBjbQS4X5yFh1cvwLL0BVsVqxRwdjObESQ21BrceSWNy2CAZxPg==
X-Received: by 2002:a05:6000:21c8:b0:3fd:bf1d:15ac with SMTP id ffacd0b85a97d-405c6d11630mr2007870f8f.20.1758658371435;
        Tue, 23 Sep 2025 13:12:51 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ee141e9cf7sm24889690f8f.12.2025.09.23.13.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:12:51 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v2 0/4] PCI: mediatek: add support AN7583 + YAML rework
Date: Tue, 23 Sep 2025 22:12:28 +0200
Message-ID: <20250923201244.952-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This little series convert the PCIe GEN2 Documentation to YAML schema
and adds support for Airoha AN7583 GEN2 PCIe Controller.

Changes v2:
- Add cover letter
- Describe skip_pcie_rstb variable
- Fix hifsys schema (missing syscon)
- Address comments on the YAML schema for PCIe GEN2
- Keep alphabetical order for AN7583

Christian Marangi (4):
  dt-bindings: clock: mediatek: Fix wrong compatible list for hifsys
    YAML
  dt-bindings: PCI: mediatek: Convert to YAML schema
  dt-bindings: PCI: mediatek: Add support for Airoha AN7583
  PCI: mediatek: add support for Airoha AN7583 SoC

 .../clock/mediatek,mt2701-hifsys.yaml         |   8 +-
 .../bindings/pci/mediatek-pcie-mt7623.yaml    | 173 ++++++
 .../devicetree/bindings/pci/mediatek-pcie.txt | 289 ----------
 .../bindings/pci/mediatek-pcie.yaml           | 514 ++++++++++++++++++
 drivers/pci/controller/pcie-mediatek.c        |  85 ++-
 5 files changed, 755 insertions(+), 314 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.yaml

-- 
2.51.0

