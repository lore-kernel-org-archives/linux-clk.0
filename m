Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F8D1E104F
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 09:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058963; cv=none; b=H+U7hqsw2Y8WMCJhRx04IWL4q6LQ1G2UuK9hROT7M6nGHQxQVzf2xcrylScOcP7+O++ytcGZ4stt2vRcN+7yy++aMvpk3UBIR1NxOz32VxZfqCOFj/HNrQzaIksf905Jk1CuQGSj093lvah/8FgkzCrFcT6GFpCwYbCheN0hN9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058963; c=relaxed/simple;
	bh=jWCpeLpkpA4YVoOMmIryFg1kg6ULL3RS7k8t4Z+C5X0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C9+IGg0b7HcQ6BZ2wkZuzDB36HZUmPgFvIaQ6hNkr5oHDuBXm0+LCkoDNfBsCbmpZyluJaYg0SgFoK2/sJ2ydN1li/zmjDPRTfDEnt/DoA2D7psJ9mO4N7A6ltWDHAVpX5GbTsAbRp1Y7nK6Um7C0cxK3dauAe2ILFjHqNBKU8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XjsxMEUD; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XjsxMEUD"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a977d6cc7so123965366b.3
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 01:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731058960; x=1731663760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=edr4i5ZXuzi2MqMxkWzTe9XDLfbB9N2JCAr3MU/xkAQ=;
        b=XjsxMEUDqEb1kHr9AkagNQx5u2lwagjt/7ONveGX2cqk+r+rycFE2LMvLotScBZMJd
         i+nGW5KDjEZfUSi/QK2DMDE3RaPhjhD86um97CHc7AgB4mKCxFjMMon/jyUN6QCEdMIU
         VTg4eGayln8OWM/+fXKlP8e9WcnCvpJvX/weLzn5PiaFOUP7JO7VO+rOt7QRhPE5i/xs
         i+J6TdMx3YJ3PH4CHd4OFnYiXUYefhUO6KhQ4rxIQRcRoJ5wYhca+8f8+bzYemqcshIl
         2/f1efcp2Zlloxx6TcQuOzNswbWdmkB3IpqbzfCgAv0fR+7PYUFAa6guIPA0P4bcUsSc
         /J2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731058960; x=1731663760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edr4i5ZXuzi2MqMxkWzTe9XDLfbB9N2JCAr3MU/xkAQ=;
        b=kORduby7NWo95xIgjirdEihd31d7P9tZNfBlhADRfW2LQfoWDAU0HuKDZy9ku2QYiy
         46LnOUq+5gcMlG/zPt5rCSt8ZA5DhvgWtX83tQ0Zp/OGdu9ph80OBRm8pIcjiC2D4osA
         7zwSYl5KTGJYGWwl3dqaTTP2Kr/mb2FagY0i8p11z7GqM9GvFaqrSPNI3bKMVws7hpfd
         NJqlx/4obaGTjQH9a3SlOhacr0L0d6FFTc5orvyfSzDjN1UCAlFI7NrWimyDYukwR6Dc
         K1WR4JChVplPF0/7JUHrT+6eAI3GPm/1cRW8A1Dl9hhedh2etg4VM6uHWACh6SB8AcHy
         8+4A==
X-Forwarded-Encrypted: i=1; AJvYcCUATqDpJCz8VemO/8RL/qXDtKEefzBsq8gLMUhgW7co6a2SV1GQmyyIEG46QYfgX6eOuNpEGkLIcUc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx6m/zcVCRpgp3BvsOGFPp1rDk2McljfjY11gRsYmnPidR0nZZ
	prP6DYIkNWsu6xSlOpdJXL1fk3ze/kbOPf46Ink7kR6TCHMX+8yzPn6WV5oU4uI=
X-Google-Smtp-Source: AGHT+IGmVFg6dGCdJ94MvP+GtpTJm4h6Vp+aWc3AX4E8KZIkMCx5imWZRQaFghSdUOFYkB1RH36WSQ==
X-Received: by 2002:a05:6402:3510:b0:5c9:34b4:69a8 with SMTP id 4fb4d7f45d1cf-5cf0a2fb6f9mr2077935a12.6.1731058959540;
        Fri, 08 Nov 2024 01:42:39 -0800 (PST)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c4ed68sm1765328a12.63.2024.11.08.01.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 01:42:39 -0800 (PST)
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
Cc: Andrea della Porta <andrea.porta@suse.com>,
	stable@vger.kernel.org
Subject: [PATCH] PCI: of_property: Assign PCI instead of CPU bus address to dynamic PCI nodes
Date: Fri,  8 Nov 2024 10:42:56 +0100
Message-ID: <20241108094256.28933-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When populating "ranges" property for a PCI bridge or endpoint,
of_pci_prop_ranges() incorrectly use the CPU bus address of the resource.
In such PCI nodes, the window should instead be in PCI address space. Call
pci_bus_address() on the resource in order to obtain the PCI bus
address.

Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
Cc: stable@vger.kernel.org
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Herve Codina <herve.codina@bootlin.com>
---
This patch, originally preparatory for a bigger patchset (see [1]), has
been splitted in a standalone one for better management and because it
contains a bugfix which is probably of interest to stable branch.

 drivers/pci/of_property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 5a0b98e69795..886c236e5de6 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -126,7 +126,7 @@ static int of_pci_prop_ranges(struct pci_dev *pdev, struct of_changeset *ocs,
 		if (of_pci_get_addr_flags(&res[j], &flags))
 			continue;
 
-		val64 = res[j].start;
+		val64 = pci_bus_address(pdev, &res[j] - pdev->resource);
 		of_pci_set_address(pdev, rp[i].parent_addr, val64, 0, flags,
 				   false);
 		if (pci_is_bridge(pdev)) {
-- 
2.35.3

