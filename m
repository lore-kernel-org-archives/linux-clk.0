Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516329;
	b=Iy3tuixH9DgI7TWHS7gXpRFokYge/pexxYXVeZliLZ9cBzAV600M/HtbbAUSxy+J4eNN
	 APXRkTcRKMcJbF6fVHSV6+xxIk3Je7yODqmWJKwzFKJzVCtotXCjmz6bp5W1in3+/fqqf
	 Za+XMOirpyLWbqGflnlZri1x5QALYXGLdM3uNSKDMDkdl7gwgmn6QsOmRcF47xgqgGqIG
	 qPR2QufvRIYu2rZZsgHJfX0cv+aaQ8Tr9zRGPjKtsEOX4+xdiEFE2sPC9h+UMdMiSfwHW
	 Fe/N0rGN0FyT8OZBxtq8IGGywpf0i5OEQXQVsXPdWNetS7riKHiGhODvPCmnpPkhyrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=L91r7jLCdgBrVDkCLs5wB8S82AZQlItQYcCNZU9WUC0=;
	b=WUCyeczYKAcLcgwqwtKHBUg6YLuN2iKc40MMyjznrGtXTjq66EgU3Cm2F1o8qFotYuxB
	 eyz3Hkpb+hYQnGvZ/NR9QzT6O6y97zE7dtH9tFhfwJEn1/V1Y/cv3dHdOCxiFVSMcOtDh
	 isVocaQ+cAAYYrz4aeE3et74iawHBD/gjElacLYlKexaBwaAjPuChBXqJq/rfzrL7Rorw
	 GbXczTQZT3UvvniJ4bgd0K/8a/mI9ZytSIzJLIcFgIS65c8uJVfS1//q7VgjKKTxmtsgl
	 AHlNUkcm4wkJ3h5Ax7z0ayd0v7gSwndgwKt5ewbtj+bfkJN/JAaymWyiat9gOVrL5iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxYtZjny;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBFC606A31E
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 10:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EBFC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxYtZjny
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab4354db11so42292241fa.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 02:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795516327; x=1796121127; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L91r7jLCdgBrVDkCLs5wB8S82AZQlItQYcCNZU9WUC0=;
        b=jxYtZjnytvxvCfLSD14Mjy8gdnPqOnkGAD8oV/RDjwN3Jq1OKzV470i6aqaho1R4rh
         4Z5JCBcHy7QYAFrknXmkiKXtnooQS32SNGm3d+o3kZ4CxPckt1AntXrrsZQA8v3zafII
         dILBm8eyY4rqPoE5DEZJ/d0foS6n5PTS5uZxJMgx561EYe2xox8+Ib+COdeoMEwORsvK
         MnJJgtI+PTigIutZQkV3pJFaRYKImIsbYr+FfeaASJaIfcYsX45nG8700Yq6VBixF8Ck
         njHV6e+E5HJLJNBUTM/UUnfa6gEKDmKlNE+rnTeoP64AIsVFQec+R1Zqg/WCrAOrTqeA
         87wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516327; x=1796121127;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L91r7jLCdgBrVDkCLs5wB8S82AZQlItQYcCNZU9WUC0=;
        b=MK3sNV1/gA8uSBjZsm5qU1SFLVfvsFxBgdyP1rA9e2zsAEGUJx1ucERP7t9EfEkYMo
         QZxSs8pJ1bsuPqrpU8P4iMyAw+fv/NoC/BcUlK8g/gfx0q6kgXU6QrMxRZ8nH+9tEcfh
         h2ED2UFBGuoCpwJV/XgEhW+ZBeu8qamhqBl74WYlKszrLW9xT3ucvWszw/hUVliunbYJ
         vfvIYy/460dmz+n4hv1yaenuOTSiBUDvyfreXc8yOP7LhaY2uU4oCBjWlr69VdMOigfF
         hLu3lakQJXdHIzjb4IaUCOcqJBK6zz3wXdbqcfEF6OfLsM3ojP9JWGVaUNNN+xwGuTL5
         ijUQ==
X-Forwarded-Encrypted: i=1; AL+hErFjhJahSEgpt6ifE4/nI1sKoxa+5eNUjg8kYjPRpsvHaPX34oRs2vTMnSMAWV5rstMj+9S57rfMVWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/TCah8X4Nu2rZOz+snbCYHdgb9kvTSzTG0ORIHM7pbs4mfGVv
	tlBqoye9MkdGygU3NQyEz+sG0qr3psaxtOrsv9lXSWUOblZPfSQIT1bZ
X-Gm-Gg: AZFdTZcSAwTo+I/FGC005U4BSoQ40o39ToJO6fHglEjgoR4E2s6cgAk7oZLCb1PvOfn
	fxmQZrd2hPUM+GMhY2+l3BBdVdJFtuU0x3fGMLlt6fM8pZk5Z2xLA6KiVpDCLyVG9YZdWQGk/2j
	pxm93W5TR24hUKkrCUkbmbDhdhafTQThqGKtc7SWEtohriay22Ph/1YBx0kgINeEP4xl+fBbC0v
	dmLxPuh614Z1a4dABi9YZvP3foIO60s7Fk5hkg/l/cODRQJJqzZEFeMTPC7xjIAHMaT7TeV/YJ6
	S/S7lyaYgk2NptGVyeamyZPR/SLPtlbj3212qovjS0idjizExpgnw8VSTECaJs1c3oN2b4iR1rn
	RW4WY2iQp5QO1f1O5NrnnJNpRhdBx9+hxIeN4l0+hjJuzSejEDmEA/+rjNKpp+hpjNuDE9QrOq7
	nxuFRcTnGlJjNlzB2gu9RqBmVJWZ5ieKceu0cx3FufSSQYtTtbTHGrGsgsMDq8eife4msaqC/KL
	LuSvsNnCcvNTVbI7dDFeg2q98LxIuoKle11Hng/a9lqRL9eMXvEaSwFhrr5pTPXqWr0JbSX+DVb
	PKInZ4SS3zD5vU+mmzaB65twU4ubH7AYKxJYgZVib8yAl0Itvw9TQTk=
X-Received: by 2002:a05:6512:3d0f:b0:5c0:4cb:2415 with SMTP id 2adb3069b0e04-5c1bc7c9a8bmr4202658e87.28.1795516327013;
        Tue, 24 Nov 2026 02:32:07 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332c9sm3680542e87.7.2026.11.24.02.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:32:06 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] PCI: cs7542: Add CS7542 PCIe host support
In-Reply-To: <f5d30781ae9502cd76ee2b6757f96a0e5ffa8b71.camel@pengutronix.de>
References: <20261123-b4-cs7542-pcie-v2-0-f589a9cd0bef@gmail.com>
 <20261123-b4-cs7542-pcie-v2-7-f589a9cd0bef@gmail.com>
 <f5d30781ae9502cd76ee2b6757f96a0e5ffa8b71.camel@pengutronix.de>
Date: Tue, 24 Nov 2026 13:31:25 +0300
Message-ID: <179551628581.3.13614361091709904582@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Philipp,

I'll drop the PCIe host's select of RESET_CONTROLLER. The host only
uses the consumer API.

I looked at reset_control_pulse(). The CS7542 host asserts its
exclusive reset before enabling the clock and powering up the PHY.
The PHY has separate reset bits and leaves the host reset asserted.
I'll keep it asserted for 10 ms after phy_power_on(), deassert it,
then wait another 10 ms before accessing the host registers.

The helper would cover the assertion and hold time for a standalone
pulse. Here the line is already asserted across PHY setup and the
controller also needs the delay after deassertion, so I'll use the
explicit sequence in the host.

Thanks,
Fil

