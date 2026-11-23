Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477338;
	b=x4kZX5X/sPyBwhWwWAfiGumJLXrjSgiTPEI5TGuUsNxiYEPblNmTliwYKba9qWoKkNao
	 oJnOQOL8eiqtvkNFu3NJC/16ay2GXEwFHQC7WwnR61FZ6AADWVys6YsvUbtlkQSPkEgv/
	 yPNIjPOxj0cBKBWtiY1iHC2cXSsak+dzLPPp34UNKt0dQ0uWOsCYJAK5auBD885nAPtEu
	 y51JRlFioApetxoNMubBtfrUdmXXdmKNSGVGn9cIfKv+xA4jjvwcA3KNwTIBTU6E1HbuX
	 of2qT/Rw0Vxb7eZZwkdRFASIm6Tojp2G5kSpV0E0lLCgW+U6l+GCF5OnsbkXH5tNRSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=fg0tXu1hVUFaqS6DwaYTDlIn6G4vOSL2k3mMwGKArfk=;
	b=hJgk98rcQaGPan28zRZa7+E0ylFiZsAfcioNh9Iwx5l/DgQ9BYdTWuzz9dhM8X8RM3KX
	 UImrKWlB0p7fSh5LHvYqFWJvyut4+tSktgsnxfg+SyHxYq/uzWUKpqrswxhQn9VES+3Uc
	 ULeU3ghlPJsW3tSfVwvLCDgePSMbAwoqNAF/PNCN/vUMKt8Txi3X2m+GvEenGtNCjUbpi
	 WK4u36xBvoyNMU07oWOpzF6i9sGTAKNnmBqR+9vRSDfA81B+sj9gdXHQWxuQkW2+mB1Cb
	 9Afg3Iu6Ymsoe9dsgYD14jqQPrTzf22COuAAx0tDRIOQXKDyAmRXJKlZC6HZ/pnBhfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWaTvH2W;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BBB606A321
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 23:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60BBB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWaTvH2W
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a42b34e930so3422957f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477337; x=1796082137; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fg0tXu1hVUFaqS6DwaYTDlIn6G4vOSL2k3mMwGKArfk=;
        b=hWaTvH2WvQK0Fe/ua18eZbHRadVOMI13PUO18agmTJqMB4Ee7Wry4jK5Bm0cWIHc1+
         oI7RE6JROJdaFFnAersslZHUs/VFmd5LfCLn++EVlhL3IUppbl5KsJcdiQg75nYhIOPY
         yVkcfh1q3meXYK1aNpF34VSxYZg0sIRUuixn1w0IAZdFeXMmJnxKE2B7f4Z1F/lS2kQ4
         csEh3Smr2v0KfcKkT1Rw8azuBMTPsQlVyl4uUyE8UVDk1VdHTHJo4EDKrqGQIn/kaGaO
         /k16dos1+lGtFeW4lKRAGQOvXLya9m50eftp8nWA/G1M+eDknMTwY5mr/v04q+iD0M6s
         RxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477337; x=1796082137;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fg0tXu1hVUFaqS6DwaYTDlIn6G4vOSL2k3mMwGKArfk=;
        b=2ufeNdI+Ny1UPEWT9WxDAEniSxxOETsHWMlSz+a/RQVCkWMTghx6U1552jLVrKvWnj
         pFUPSwV00iunlCsrqIEFXo7Ouw/ivuwMNxaeXGwXlVo93pL162OotdnfdAQXoUx+C3DD
         Rsnini5IqIhLkp1xjcFmDQImLtTlEBzeSaZ6MFRYkdv1TAdrHUitSCAZorjT7IiHvDzw
         I0sJ9zjAqF0ZJupTmOS9gJot+28vYaYmzBJ9IReKaiBf4N8t0qOBLLt2qtX+WS+AYr72
         oTGNMD9ysC0sajRTy8ZYTjO9FJGSKKJZDkJvUORhXcdIfBIP86/jt6YpR42IsiHsZnrq
         n9Iw==
X-Forwarded-Encrypted: i=1; AL+hErFv0gw+ttooNuc3prls7eGMg2ZPRcEm8tvk6jVzLeGz1qn9ySnCHwLrKiqAazeL9BCeg/1rZvky4j0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7F0QO+kUfYJBmXd2zW5GY9WvZfV6m2l4PyrKmYljXKbY/+kEu
	yblH32hp9Su00ankIcj1OXctjc/ATSewHKnSZeik8f01EzALJL1HqW+F
X-Gm-Gg: AZFdTZd1BjPVHQdv2BWQVjpjG5aNPojzRk0BORyAsuuvYST1jDPJf55EHmYn1cuAvJS
	Qbr0uxrrZC6EwvJEelJOieJeHlJFK0sfz98fVuMiD/X6Ifm3cEN2+lxxdRGD8Gw+6bopGUgYlC0
	tODLLa+CLPtyxwO2t54O2JHAc/Hqx0AazDdmeTpV5uCp70CC45nxniVw+RMQphYr9/zWrRqpcq9
	kBoOPhgDJ/r2HbPuDp86jBwZh6v3vQqqKm/J1Z4BFtLVtrDbp3VQest7G5Zu+d3HERMdAaI6oMa
	jRwZe7O5qnIQ2ciBroTRlAaxMQUxa/zRhnYsd7GoMa219dZPNWWTpFWX4sa7HKtGNU8jhlolWoQ
	iizZYR3+J7c9BJdb4xCzpaWbd/yv5W407GXw13VgwLzvQVjS2NrFaDd+bSVLus8q8OxTepr2M6c
	xdw1w/3+/0rHnTWCRMJBiJR6WUYmk8xA+dAGG9wYM7/uZG4Xh0+S25DsTDO64NxNy8XRXcx8DNJ
	44GY3Ouqx/HvEyziixB8cah14f3EPlezGjfDk0scOimK/A0CxNaOUdVpLstocgeehhgE33AqODU
	kZrnfeU3b5/TYdNC9GbDAwUrHB3W+csb/UTw1iuILA46SLx7B2uieKc=
X-Received: by 2002:a5d:5d81:0:b0:4a6:f154:b402 with SMTP id ffacd0b85a97d-4abb1baaae4mr25856543f8f.10.1795477336474;
        Mon, 23 Nov 2026 15:42:16 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm23777215f8f.40.2026.11.23.15.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:42:15 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 	Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 	Jingoo Han <jingoohan1@gmail.com>,
 	Lorenzo Pieralisi <lpieralisi@kernel.org>,
 	Krzysztof Wilczynski <kwilczynski@kernel.org>,
 	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 	Brian Masney <bmasney+clk@redhat.com>,
 	Jerome Brunet <jbrunet+clk@baylibre.com>,
 	Neil Armstrong <neil.armstrong@linaro.org>,
 	Krzysztof Kozlowski <krzk+dt@kernel.org>,
 	Conor Dooley <conor+dt@kernel.org>, 	Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pci@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, 	linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] PCI: cs7542: Add CS7542 PCIe host support
Date: Mon, 23 Nov 2026 23:42:08 +0000
Message-ID: <179547732839.3.15916995856832702891@gmail.com>
In-Reply-To: <20261123222404.GA1110511@bhelgaas>
References: <20261123-b4-cs7542-pcie-v1-7-4cde5201d404@gmail.com>
 <20261123222404.GA1110511@bhelgaas>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Bjorn,

I have worked through the two threads you linked and prepared changes,
without posting another revision. CS7542 has three independent DWC hosts,
each currently with one Root Port. The DT now has explicit Root Port
children and PERST is acquired into per-port state from that child.
Almond+ shares GPIO92 between its two Wi-Fi endpoints, so only root0
owns that GPIO; root1 must not request or pulse it independently.

The sequence now asserts endpoint/core reset before clock/PHY setup and
releases PERST in start_link, after DWC Root Port setup, with
PCIE_RESET_CONFIG_WAIT_MS before training. I also addressed the vendor
menu order, include order, constants, formatting and cleanup labels.

For the MSI address, the expression using a CPU resource was misleading.
The retained vendor value is a PCI bus match token for the DWC iMSI-RX
receiver, which consumes the matching MWr before AXI translation, as
described in pcie-designware-host.c. It need not identify CPU RAM/MMIO.
The draft names that bus token explicitly and checks that it does not
overlap a PCI MEM bus window using the resource offset. This is not a
claim that I tested non-identity hardware translation.

synchronize_irq is for the custom APP chained handler shared by INTx and
MSI: after masking/readback, an already running handler can still be
dispatching into the domains about to be freed. The locked unmask gate
also prevents a late INTx callback undoing the quiesce mask.

You are right about the physical race. The v2 lock serializes the actual
config/DBI MMIO with the IRQ latch and software quiesce; it cannot prevent
a physical link transition before the IRQ runs. I have no independent
evidence that Root Port DBI itself needs a downstream link or reset after
link loss. The confirmed hardware quirk is accesses beyond the 512-byte
RC config limit. I removed the stronger hardware claim and describe the
remaining link-loss latch as a conservative no-retrain software policy,
not a proven silicon requirement or a complete physical-race solution.

The revised sequence/layout passed Almond+ RAM testing: all six PCI
devices, Root Port MSI enable, actual xHCI MSI/INTx interrupts, host
unload/reload and actual PCI-device OF/NVMEM mapping. This does not cover
physical cable/link-loss fault injection. I will collect further review
and leave a few days before the next revision, as requested.

Thanks,
Fil
